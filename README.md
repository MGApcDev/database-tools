### Install
```
cd ~
git clone https://github.com/MGApcDev/database-tools.git
cd database-tools
# Check .env
./setup.sh

# Load new alias
bash
```

### Usage
All commands assume there is a .env file in the current directory
```
# Dump database to .sql.gz
dumpdb 

# Load database
loaddb dump.sql.gz

# Revert database to state before loaddb
revertdb

# Load database without making backup
loadquick dump.sql.gz
```
