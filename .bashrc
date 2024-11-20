# Get current AWS account
aws_current_account() {
  aws sts get-caller-identity --query 'Account' --output text
}

# Function to check if Docker is running
check_and_start_docker() {
  if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running. Starting Docker Desktop..."
    # Start Docker Desktop (default location for 64-bit systems)
    "/c/Program Files/Docker/Docker/Docker Desktop.exe" &
    # Wait until Docker is ready
    while ! docker info > /dev/null 2>&1; do
      echo "Waiting for Docker to start..."
      sleep 5
    done
    echo "Docker is now running!"
  else
    echo "Docker is already running."
  fi
}

# Docker aliases
alias sdocker='check_and_start_docker'
alias start_docker='check_and_start_docker'
alias startDocker='check_and_start_docker'
alias startdocker='check_and_start_docker'

# Navigation aliases
alias cdd='cd D://projects'

# Script runner aliases
alias run='./run.sh'
alias run.sh='./run.sh'

# Reload .bashrc
alias reload='source ~/.bashrc'

# Utility aliases
alias ll='ls -lah'
alias c='clear'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'

# AWS alias
alias awsuser='aws_current_account'
