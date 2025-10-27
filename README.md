# 🚀 Laravel To-Do Application BY FASIH, SAQIB, ATTIQUE

A fully containerized *Laravel* application for managing To-Do lists, featuring user registration, login, and full *CRUD* (Create, Read, Update, Delete) functionality for tasks. The entire development environment is managed by *Laravel Sail* and *Docker*.

-----

## ✨ Features

  * *User Authentication:* Secure user registration and login/logout system.
  * *To-Do CRUD:* Users can create, view, update, and delete their personal to-do tasks.
  * *MySQL Database:* Persistent data storage using a dedicated MySQL container.
  * *Containerized Environment:* Simple, consistent, and isolated development environment using *Laravel Sail*.

-----

## 🛠 Prerequisites

Before you begin, ensure you have the following software installed on your system:

  * *Docker Desktop* (or Docker Engine and Docker Compose)

-----

## ⚙ Installation & Setup

Follow these specific steps to get a copy of the project up and running on your local machine using Laravel Sail.

### 1\. Clone the Repository

bash
git clone https://github.com/prashantpgit/TodoApp.git
cd TodoApp


### 2\. Install Dependencies

You will use a temporary Composer Docker container to install the project's PHP dependencies and Laravel Sail.

bash
# Install existing application dependencies (from composer.lock)
docker run --rm -v $(pwd):/app -w /app laravelsail/php82-composer composer install

# Add Laravel Sail as a development dependency
docker run --rm -v $(pwd):/app -w /app laravelsail/php82-composer composer require laravel/sail --dev


### 3\. Configure the Environment

Create your environment file and customize the database settings.

bash
# Copy the example environment file
cp .env.example .env


Now, **open the .env file** and ensure the following database variables are set correctly to match your application's configuration and avoid port conflicts:


DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=TodoApp
DB_USERNAME=sail
DB_PASSWORD=password
FORWARD_DB_PORT=3307 # IMPORTANT: Set to avoid port 3306 conflicts on the host


### 4\. Create Sail Configuration

Install the Sail configuration, which generates the necessary docker-compose.yml file.

bash
# Creates the docker-compose.yml file
docker run --rm -v $(pwd):/app -w /app laravelsail/php82-composer php artisan sail:install


### 5\. Start and Initialize the Application

Start the containers and run the necessary setup commands. Note that you may need to wait 15-20 seconds for the MySQL container to fully boot before running the migrations.

bash
# Start Sail Containers in detached mode
./vendor/bin/sail up -d

# Wait for 15-20 seconds for the MySQL container to fully boot...

# 1. Clear config cache to read the .env changes
./vendor/bin/sail artisan config:clear

# 2. Generate the application key
./vendor/bin/sail artisan key:generate

# 3. Run the database migrations
./vendor/bin/sail artisan migrate


### 6\. Access the Application

Your application is now running.

  * *Application URL:* http://localhost
  * *MailHog (Email Testing):* http://localhost:8025

-----

## 🐳 Usage: Laravel Sail Commands

Laravel Sail provides a convenient command-line interface to interact with your Docker containers.

| Command | Description |
| :--- | :--- |
| sail up | Starts all Docker containers (in foreground). |
| sail up -d | Starts all Docker containers in *detached mode* (background). |
| sail down | Stops and removes the containers. |
| sail artisan [command] | Executes a Laravel Artisan command (e.g., sail artisan make:controller). |
| sail composer [command] | Executes a Composer command (e.g., sail composer require package). |

*Tip: Create a Shell Alias*
To avoid typing ./vendor/bin/sail repeatedly, you can create a shell alias:

bash
# For macOS / Linux (Bash/Zsh)
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'


After setting the alias, you can use the shortcut command: sail up -d, sail artisan migrate, etc.

-----

## 💡 Technologies Used

  * *PHP:* Laravel
  * *Database:* MySQL
  * *Containerization:* Docker, Laravel Sail

-----