import mysql.connector
from mysql.connector import errorcode
import os

config = {}
def configure_db(host,user,password,database):
    config = {
        'host': host,
        'user': user,
        'password': password,
        'database': database
    }


def db_read(query, params=None):
    try:
        if config=={}:
            configure_db(os.environ['rds_host'],os.environ['name'],os.environ['password'],os.environ['db_name'])
            cnx = mysql.connector.connect(host=os.environ['rds_host'],user=os.environ['name'],password=os.environ['password'],database=os.environ['db_name'])
        else:
            cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor(dictionary=True)
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)

        entries = cursor.fetchall()
        cursor.close()
        cnx.close()

        content = []

        for entry in entries:
            content.append(entry)

        return content

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("User authorization error")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database doesn't exist")
        else:
            print(err)
    else:
        cnx.close()
    finally:
        if cnx.is_connected():
            cursor.close()
            cnx.close()
            print("Connection closed")
       
def db_write(query, params=None):
    try:
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor(dictionary=True)
        try:
            cursor.execute(query, params)
            cnx.commit()
            cursor.close()
            cnx.close()
            return True

        except mysql.connector.Error:
            cursor.close()
            cnx.close()
            return False

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("User authorization error")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database doesn't exist")
        else:
            print(err)
        return False
    else:
        cnx.close()
        return False
    finally:
        if cnx.is_connected():
            cursor.close()
            cnx.close()
            print("Connection closed")