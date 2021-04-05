Simple database management tools for MySQL, based on `.env` files.

### Requirements
- This project assumes you have MySQL installed with a root user with no password.
- This can be verified by running `mysql -uroot`. If you get access to MySQL it is setup correctly.
- MySQL should be running on localhost (127.0.0.1)

### Install

```bash
git clone https://github.com/MGApcDev/database-tools.git
cd database-tools

# We need to add the bin directory to the PATH.
./setup-bash.sh # default is .bashrc
# or
./setup-zsh.sh
# or manually run it with (note: PATH change will be lost on reboot)
export PATH="${PWD}/bin:$PATH"

# Restart your shell
bash
# or
zsh
```

### Usage

Once setup is completed you can run below commands from any location.

All commands check if there is a `.env` file in the current directory before running.

```bash
# Create database and user.
createdb.sh

# Dump database to *.sql.gz
dumpdb.sh

# Dump with specific name {name}--*.sql.gz
dumpdb.sh {name}

# Load database
loaddb.sh dump.sql.gz
```

### .env file

To run above commands, specific variables is expected in the `.env` file.
```bash
DB_DATABASE=...
DB_USERNAME=...
DB_PASSWORD=...
```
