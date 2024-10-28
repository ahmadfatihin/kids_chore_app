import os
import requests
import sys
import cohere

# Configure Cohere API key
cohere_api_key = os.getenv("COHERE_API_KEY")
github_token = os.getenv("PAT_TOKEN")
repo_name = os.getenv("GITHUB_REPOSITORY")

# Initialize Cohere client
co = cohere.Client(cohere_api_key)

def get_files_changed(repo_name, pr_number):
    """
    Fetch the list of files changed in a pull request using GitHub's REST API.
    """
    url = f"https://api.github.com/repos/{repo_name}/pulls/{pr_number}/files"
    headers = {
        "Authorization": f"Bearer {github_token}",
        "Accept": "application/vnd.github.v3+json"
    }

    print(f"Fetching changed files from PR #{pr_number} in repository '{repo_name}'")
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        changed_files = [file['filename'] for file in response.json() if file['filename'].endswith('.dart')]
        print(f"Changed files: {changed_files}")
        return changed_files
    else:
        print(f"Error fetching changed files: {response.status_code} - {response.text}")
        return []

def review_file(file_path):
    """
    Generate a review for a Dart file, focusing on Flutter-specific aspects using Cohere.
    """
    try:
        with open(file_path, 'r') as file:
            code_content = file.read()

        # Create a refined prompt for Cohere to review the Flutter code concisely
        prompt = (
            f"Please review the following Flutter code and provide a concise and clear summary in a single paragraph. "
            f"Focus on readability, common mistakes, and potential improvements. If everything looks good, mention that as well. "
            f"Keep your response short and in a conversational tone:\n\n{code_content}"
        )

        # Call the Cohere API
        response = co.generate(
            model='command-xlarge',  # You can adjust the model as per your plan or available free model
            prompt=prompt,
            max_tokens=150
        )

        # Extract review message from the response
        review_message = response.generations[0].text.strip()

        # Final message formatting to ensure it is clean and simple
        formatted_review_message = f"### Review for `{file_path}`\n\n{review_message}"

        print(f"Generated review message for {file_path}:\n{formatted_review_message}")
        return formatted_review_message

    except Exception as e:
        print(f"Error reading or reviewing file {file_path}: {str(e)}")
        return f"Error reading or reviewing file {file_path}: {str(e)}"


def main():
    if len(sys.argv) != 3:
        print("Usage: python3 review_with_cohere.py <repo_name> <pr_number>")
        sys.exit(1)

    repo_name = sys.argv[1]
    pr_number = sys.argv[2]

    # Print the PR commit link for better context
    pr_commit_link = f"https://github.com/{repo_name}/pull/{pr_number}/commits"
    print(f"Repository: {repo_name}")
    print(f"Pull Request Number: {pr_number}")
    print(f"PR Commit Link: {pr_commit_link}")

    # Fetch changed files
    changed_files = get_files_changed(repo_name, pr_number)

    if not changed_files:
        print("No Dart files changed in this PR.")
        return

    review_comments = []

    # Review each changed file
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
