import mysql.connector
from mysql.connector import errorcode

# Configuration for connecting to the MySQL server
# !!! IMPORTANT: Replace 'your_username' and 'your_password' with your actual MySQL credentials.
config = {
    "user": "your_username",
    "password": "your_password",
    "host": "localhost",  # Use your server host, often 'localhost' or '127.0.0.1'
}

DATABASE_NAME = "alx_book_store"


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

        # 2. Execute the query to create the database if it doesn't exist
        # Using IF NOT EXISTS prevents failure if the database already exists.
        create_db_query = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
        db_cursor.execute(create_db_query)

        # 3. Print success message
        print(f"Database '{DATABASE_NAME}' created successfully!")

    except mysql.connector.Error as err:
        # Handle connection and query errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied. Check your username and password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            # This is highly unlikely since we aren't using a DB initially
            print("Error: Database does not exist.")
        else:
            print(f"Failed to connect or create database: {err}")

    finally:
        # 4. Handle the closing of the connection and cursor
        if db_connection and db_connection.is_connected():
            db_cursor.close()
            db_connection.close()
            # print("MySQL connection closed.") # Optional confirmation


if __name__ == "__main__":
    create_database()
