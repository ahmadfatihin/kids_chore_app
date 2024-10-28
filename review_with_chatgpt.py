import os
import requests
import sys
import openai

# Configure OpenAI API key
openai.api_key = os.getenv("OPENAI_API_KEY")
github_token = os.getenv("PAT_TOKEN")
repo_name = os.getenv("GITHUB_REPOSITORY")

def get_files_changed(repo_name, pr_number):
    """
    Fetch the list of files changed in a pull request using GitHub's REST API.
    """
    url = f"https://api.github.com/repos/{repo_name}/pulls/{pr_number}/files"
    headers = {
        "Authorization": f"Bearer {github_token}",
        "Accept": "application/vnd.github.v3+json"
    }

    print(f"Fetching changed files for PR #{pr_number} in repository '{repo_name}'")
    print(f"GitHub API URL: {url}")

    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        changed_files = [file['filename'] for file in response.json() if file['filename'].endswith('.dart')]
        print(f"Changed files: {changed_files}")  # Log changed files for debugging
        return changed_files
    else:
        print(f"Error fetching changed files: {response.status_code} - {response.text}")
        return []

def review_file(file_path):
    """
    Generate a review for a Dart file, focusing on Flutter-specific aspects.
    """
    try:
        with open(file_path, 'r') as file:
            code_content = file.read()

        # Create a prompt for ChatGPT to review the Flutter code
        prompt = (f"Review this Flutter code for readability, architecture, and potential improvements. "
                  f"Check for common Flutter pitfalls, performance considerations, and clean code practices. "
                  f"Provide suggestions for improvement if necessary:\n\n{code_content}")

        # Call the OpenAI API with the new format
        try:
            response = openai.ChatCompletion.create(
                model="gpt-3.5-turbo",
                messages=[
                    {"role": "system", "content": "You are a code reviewer specialized in Flutter development."},
                    {"role": "user", "content": prompt}
                ]
            )

            # Extract review message from the response
            review_message = response['choices'][0]['message']['content'].strip()
            print(f"Generated review message for {file_path}: {review_message}")  # Debugging info
            return review_message

        except openai.error.OpenAIError as e:
            # Check for specific quota errors or other issues
            return f"Error reviewing file {file_path}: {str(e)}"

    except Exception as e:
        return f"Error reading or reviewing file {file_path}: {str(e)}"

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 review_with_chatgpt.py <repo_name> <pr_number>")
        sys.exit(1)

    repo_name = sys.argv[1]
    pr_number = sys.argv[2]

    # Print repository and PR details for debugging
    pr_url = f"https://github.com/{repo_name}/pull/{pr_number}"
    print(f"Repository: {repo_name}")
    print(f"PR Number: {pr_number}")
    print(f"PR URL: {pr_url}")

    changed_files = get_files_changed(repo_name, pr_number)

    if not changed_files:
        print("No Dart files changed in this PR.")
        return

    review_comments = []

    for file in changed_files:
        review_comment = review_file(file)
        review_comments.append(f"### Review for `{file}`\n{review_comment}\n\n")

    # Prepare review message output for GitHub Action
    review_message = "\n".join(review_comments)

    # Print review message for debugging purposes
    print("Generated review message:", review_message)

    # Sanitize the output to avoid special characters that may break the GITHUB_ENV file processing
    safe_review_message = review_message.replace('\n', ' ').replace('\r', '')

    # Output review message for GitHub Action using environment files
    with open(os.environ['GITHUB_ENV'], 'a') as env_file:
        env_file.write(f"review_message={safe_review_message}\n")

if __name__ == "__main__":
    main()
