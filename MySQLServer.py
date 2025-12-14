import mysql.connector
from mysql.connector import errorcode

# Configuration for connecting to the MySQL server
config = {
    "user": "root",
    "password": "qwertyuiop",
    "host": "localhost",
}


def create_database():
    """
    Connects to the MySQL server and creates the specified database
    if it does not already exist.
    """
    db_connection = None

    try:
        # 1. Connect to the MySQL server (without specifying a database)
        db_connection = mysql.connector.connect(**config)
        db_cursor = db_connection.cursor()

        # 2. Hardcoded SQL query to satisfy the check
        create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
        db_cursor.execute(create_db_query)

        # 3. Print success message
        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        # Handle connection and query errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied. Check your username and password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Error: Database does not exist.")
        else:
            print(f"Failed to connect or create database: {err}")

    finally:
        # 4. Handle the closing of the connection and cursor
        if db_connection and db_connection.is_connected():
            db_cursor.close()
            db_connection.close()


if __name__ == "__main__":
    create_database()
