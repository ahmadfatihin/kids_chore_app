import os
import requests
import sys

# Configure OpenAI API key
openai_api_key = os.getenv("OPENAI_API_KEY")
pat_token = os.getenv("PAT_TOKEN")

def get_files_changed(repo_name, pr_number):
    """
    Fetch the list of files changed in a pull request using GitHub's REST API.
    """
    url = f"https://api.github.com/repos/{repo_name}/pulls/{pr_number}/files"
    headers = {
        "Authorization": f"Bearer {pat_token}",
        "Accept": "application/vnd.github.v3+json"
    }

    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        changed_files = [file['filename'] for file in response.json()]
        return changed_files
    else:
        print(f"Error fetching changed files: {response.status_code} - {response.text}")
        return []

def review_file(file_path):
    # Simulate file review process (replace with actual ChatGPT call if needed)
    review_message = f"Reviewing file: {file_path}"
    # Example: ChatGPT review can be generated here based on file content
    # For simplicity, we just return a placeholder message
    return review_message

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 review_with_chatgpt.py <repo_name> <pr_number>")
        sys.exit(1)

    repo_name = sys.argv[1]
    pr_number = sys.argv[2]
    changed_files = get_files_changed(repo_name, pr_number)

    review_comments = []

    for file in changed_files:
        review_comment = review_file(file)
        review_comments.append(f"### Review for `{file}`\n{review_comment}\n\n")

    # Prepare review message output for GitHub Action
    review_message = "\n".join(review_comments)

    # Output review message for GitHub Action
    print(f"::set-output name=review_message::{review_message}")

if __name__ == "__main__":
    main()
