
# Windows Terminal Bash Configuration

For all Windows Terminal lovers, this repository contains a custom `.bashrc` script tailored for Windows Terminal users. Which runs when the terminal gets initiated It includes helpful functions, aliases, and configurations to streamline development workflows, especially for Docker, AWS, and general command-line usage.

---

## Features

### 1. AWS Account Query Function
Easily retrieve the current AWS account ID using the `aws sts get-caller-identity` command.

- **Alias**: `awsuser`

### 2. Docker Status Checker
Checks if Docker is running; if not, it attempts to start Docker Desktop. Provides real-time feedback until Docker is ready.

- **Aliases**: `sdocker`, `start_docker`, `startDocker`, `startdocker`

### 3. Project Navigation
Quickly navigate to the `D://projects` directory with `cdd`.

### 4. Common Command Shortcuts
- `run` or `run.sh`: Run your `run.sh` script.
- `reload`: Reload the `.bashrc` file.
- `ll`: List directory contents in detailed format.
- `c`, `cls`: Clear the terminal.
- `..`, `...`: Navigate up one or two directory levels.

---

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/<your-username>/windows-terminal-bash-config.git
   cd windows-terminal-bash-config
   ```

2. **Copy the `.bashrc` Script**
   ```bash
   cp .bashrc ~/
   ```

3. **Reload `.bashrc`**
   Open your terminal and reload the configuration:
   ```bash
   source ~/.bashrc
   ```

---

## `.bashrc` Script Overview

Below is the content of the `.bashrc` file for your reference:

```bash
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
```

---

## Usage Examples

### 1. Check AWS Account
```bash
awsuser
# Output: 123456789012
```

### 2. Start Docker Desktop
```bash
sdocker
# Output: Docker is not running. Starting Docker Desktop...
#         Waiting for Docker to start...
#         Docker is now running!
```

### 3. Navigation
```bash
cdd
# Navigates to D://projects
```

### 4. List Files
```bash
ll
# Lists all files in detailed format
```

### 5. Reload Configuration
```bash
reload
# Reloads the .bashrc file
```

---

## Contributing

Contributions are welcome! If you have suggestions for improving the script or adding new features:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to customize further or suggest enhancements!
