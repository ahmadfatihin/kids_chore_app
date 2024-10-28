import os
import requests
import sys

# Configure OpenAI API key
openai_api_key = os.getenv("OPENAI_API_KEY")
github_token = os.getenv("PAT_TOKEN")  # Using the secret set in your GitHub Actions workflow

def get_files_changed(repo_name, pr_number):
    """
    Fetch the list of files changed in a pull request using GitHub's REST API.
    """
    url = f"https://api.github.com/repos/{repo_name}/pulls/{pr_number}/files"
    headers = {
        "Authorization": f"Bearer {github_token}",
        "Accept": "application/vnd.github.v3+json"
    }

    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        # Filter only Dart files
        changed_files = [file['filename'] for file in response.json() if file['filename'].endswith('.dart')]
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

        # Simulate ChatGPT API call (replace with actual ChatGPT call using OpenAI's API)
        response = openai.Completion.create(
            engine="text-davinci-003",
            prompt=prompt,
            max_tokens=150,
            temperature=0.7
        )

        # Extract review message from the response
        review_message = response.choices[0].text.strip()
        return review_message

    except Exception as e:
        return f"Error reading or reviewing file {file_path}: {str(e)}"

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 review_with_chatgpt.py <repo_name> <pr_number>")
        sys.exit(1)

    repo_name = sys.argv[1]
    pr_number = sys.argv[2]
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

    # Output review message for GitHub Action
    print(f"::set-output name=review_message::{review_message}")

if __name__ == "__main__":
    main()
