# Define your GitHub personal access token
$githubToken = "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"

# Define the repository name
$repoName = "git2-repo"

# Define the GitHub username or organization where you want to create the repository
$githubUsernameOrOrg = "Shinchan-24"

$repodir = "C:\BMO\git-repo"

# Create the new repository on GitHub using the GitHub API with the personal access token
$uri = "https://api.github.com/user/repos"
$headers = @{
    "Authorization" = "token $githubToken"
}
$body = @{
    name = $repoName
}
$response = Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -ContentType "application/json" -Body ($body | ConvertTo-Json)

# Extract the Git repository URL from the response
$repoUrl = $response.html_url

# Print the repository URL
Write-Host "Repository created: $repoUrl"

# Initialize a Git repository locally
git init

copy-item -Path "C:\BMO\skeleton" -Destination "C:\BMO\git-repo" -Recurse -Force

# Add and commit some files
git add .
git commit -m "Initial commit"

# git remote remove origin

# Set the remote origin to the GitHub repository
git remote add origin $repoUrl

# Push the committed changes to GitHub
git push -u origin master
