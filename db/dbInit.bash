#!/bin/bash

source ".db.conf"

queroot()
{
    # First Argument is the sql statement
    PASSFILE=".root.pass"
    if ! [ -f "$PASSFILE" ]; then
        echo "Database root password file doesn't exists";
    fi

    SQL="$1"
    mysql -uroot -p$(cat "$PASSFILE") -e"$SQL"
}

# To delete a user
DROPUSER="DROP USER IF EXISTS ${DBUSER}@${DBHOSTNAME};"

# To delete a DATABASE
DROPDB="DROP DATABASE IF EXISTS ${DBNAME};"

# Show all databases
SHOWDB="SHOW DATABASES;"

# Show all users
SHOWUSERS="SELECT User FROM mysql.user;"

# Create a user
CREATEUSER="CREATE USER IF NOT EXISTS ${DBUSER}@${DBHOSTNAME} IDENTIFIED BY '${DBPASS}';"

# Create the Database
CREATEDB="CREATE DATABASE IF NOT EXISTS ${DBNAME}"

# Grant Privileges to User for Database
GRANTUSER="GRANT ALL PRIVILEGES ON ${DBNAME}.* TO '${DBUSER}'@'${DBHOSTNAME}' IDENTIFIED BY '${DBPASS}';"

# Revoke all privileges
REVOKEUSER="REVOKE ALL PRIVILEGES, GRANT OPTION FROM ${DBUSER}@${DBHOSTNAME};"

# Use Database
USEDB="USE ${DBNAME};"

# Create the Contact table
CREATETABLE="\
USE ${DBNAME};\
create table Contact
(
	id int auto_increment, \
	firstName varchar(50) default "none" not null, \
	middleName varchar(50) default "none", \
	lastName varchar(50) default "none" not null, \
	sex char default "N", \
	phone varchar(10) default "none", \
	email varchar(255) default "none", \
	address varchar(255) default "none", \
	city varchar(50) default "none", \
	zipCode int(4) default 0000, \
	dateAdded DATE not null, \
	constraint Contacts_pk \
		primary key (id) \
);

create unique index Contact_Unique \
	on Contact (firstName, lastName, phone);"

# CREATE TABLE Contact( \
#                     id INT NOT NULL AUTO_INCREMENT, \
#                     firstName VARCHAR(50) NOT NULL, \
#                     middleName VARCHAR(50), \
#                     lastName VARCHAR(50) NOT NULL, \
#                     sex CHAR(1), \
#                     phone VARCHAR(10), \
#                     email VARCHAR(255), \
#                     address VARCHAR(255), \
#                     city VARCHAR(50), \
#                     zipCode INT(4), \
#                     dateAdded DATE NOT NULL, \
#                     PRIMARY KEY ( id ) \
#                     );"

# Show Tables
SHOWTABLES="SHOW TABLES;"

# Show Columns
SHOWCOLUMNS="SHOW COLUMNS FROM TABLENAME;"

if ! queroot "$CREATEUSER"; then
    echo "Create User Failed..."
    exit 1
fi
echo "Create User Success..."

if ! queroot "$CREATEDB"; then
    echo "Create Database Failed..."
    exit 1
fi
echo "Create Database Success..."

if ! queroot "$GRANTUSER"; then
    echo "Grant Privileges to User Failed..."
    exit 2
fi
echo "Grant Privileges to User Success..."

if ! queroot "$CREATETABLE"; then
    echo "Create Table Failed..."
    exit 3
fi
echo "Create Table Success..."

exit 0
