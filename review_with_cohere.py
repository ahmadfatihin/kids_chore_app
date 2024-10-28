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

        # Save the review message to a text file
        with open("code_review.txt", "w") as review_file:
            review_file.write(f"Review for `{file_path}`\n\n{review_message}")

        print(f"Review saved to 'code_review.txt' for file: {file_path}")
        return review_message

    except Exception as e:
        print(f"Error reading or reviewing file {file_path}: {str(e)}")
        return f"Error reading or reviewing file {file_path}: {str(e)}"

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 review_with_chatgpt.py <repo_name> <pr_number>")
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

    for file in changed_files:
        review_file(file)

    print("Review files saved to 'code_review.txt'.")

if __name__ == "__main__":
    main()

