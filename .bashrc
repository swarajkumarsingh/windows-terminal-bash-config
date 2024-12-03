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

# Stop Docker aliases
alias stopdocker='wsl --shutdown'
alias stopDocker='wsl --shutdown'
alias stop_docker='wsl --shutdown'

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

# Startup hacker drawing
hacker_ascii_art() {
  echo -e "\e[32m
  _    _       _       _     _
 | |  | |     | |     | |   (_)
 | |__| | __ _| |_ ___| |__  _ _ __   __ _
 |  __  |/ _\` | __/ _ \\ '_ \\| | '_ \\ / _\` |
 | |  | | (_| | ||  __/ | | | | | | | (_| |
 |_|  |_|\\__,_|\\__\\___|_| |_|_|_| |_|\\__, |
                                        __/ |
                                       |___/
  Welcome to your terminal, startup hacker!
  \e[0m"
}

# Bye command with ASCII art
# Bye command with ASCII art
bye_ascii_art() {
  echo -e "\e[36m
  ██████╗ ██╗   ██╗███████╗
  ██╔══██╗██║   ██║██╔════╝
  ██████╔╝██║   ██║███████╗
  ██╔═══╝ ██║   ██║╚════██║
  ██║     ╚██████╔╝███████║
  ╚═╝      ╚═════╝ ╚══════╝
  Goodbye, hacker!
  \e[0m"
  sleep 2  # Wait for 2 seconds
  exit
}


# Call hacker ASCII art on terminal startup
hacker_ascii_art  # Corrected function name

# Alias for bye command
alias bye='bye_ascii_art'
