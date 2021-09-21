import sys
import logging
import pymysql
import os


#rds settings

rds_host  = os.environ['rds_host']
name = os.environ['name']
password = os.environ['password']
db_name = os.environ['db_name']
logger = logging.getLogger(os.environ['log_level'])
logger.setLevel(logging.INFO)

try:
    conn = pymysql.connect(host=rds_host, user=name, passwd=password, db=db_name, connect_timeout=5)
except pymysql.MySQLError as e:
    logger.error("ERROR: Unexpected error: Could not connect to MySQL instance.")
    logger.error(e)
    sys.exit()

logger.info("SUCCESS: Connection to RDS MySQL instance succeeded")



