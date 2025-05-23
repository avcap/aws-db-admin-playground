# 1. Initialize Git if you haven’t already
git init

# 2. Stage all files
git add .

# 3. Commit with a clear message
git commit -m "Initial commit: Terraform configs for RDS + backups"

# 4. Hook up the GitHub remote (replace <your-user> with your GitHub username)
git remote add origin https://github.com/avcap/aws-db-admin-playground.git

# 5. Push your code up
git push -u origin master

