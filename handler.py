import sys
import logging
import json
import uuid
from datetime import date
from db import conn

def addPayment(event, context):
    """
    This function adds new payments
    """
    paymentRecord = event['Records'][0]
    order_id =   paymentRecord["order_id"]
    paymentMethods = paymentRecord["payment_methods"]   
    entries = paymentRecord["entries"]   
    for entry in entries:
        payment_id = str(uuid.uuid4())
        store_order_id = "null"
        if"store_order_id" in entry:
            store_order_id = entry["store_order_id"] 
        with conn.cursor() as cur:
            cur.execute('insert into Payments (payment_id,created_date,updated_date,authorized_date'
            +',order_id,store_order_id,store_id,user_id,processor,status) values("'
            +payment_id+'","'+str(date.today())+'",null,null,"'+order_id+'","'+store_order_id+'",null,"'
            +entry['user_id']+'","'+entry['processor']+'","authorized")')
            event_id = str(uuid.uuid4())
            cur.execute('insert into events (event_id,payment_id,created_date,type,'
            +'details) values("'
            +event_id+'","'+payment_id+'","'+str(date.today())+'","authorized","no details")')
            entry_id = str(uuid.uuid4())
            cur.execute('insert into entries (entry_id,payment_id,created_date,amount,currency,type,purpose,destination'
            +') values("'
            +event_id+'","'+payment_id+'","'+str(date.today())+'","'+entry["amount"]+'","'+entry["currency"]+'","debit","'
            +entry["type"]+'","'+entry["destination"]+'")')
        conn.commit()
        
    
    return "done"

def getPaymentById(event, context):
    """
    This function retrieves payment by id
    """
    with conn.cursor() as cur:
        cur.execute('SELECT test.payments.payment_id,order_id,store_order_id,user_id,test.payments.created_date,updated_date,'
        +'authorized_date,processor,status,type,amount,currency FROM test.payments '
        +'inner join test.entries on test.entries.payment_id=test.payments.payment_id ' 
        + 'where test.payments.payment_id ="' +event["queryStringParameters"]["payment_id"]+'"')
        records = cur.fetchall()
        response = {}
        if cur.rowcount > 0:
            result = records[0]
            response["payment_id"] = result[0]
            response["order_id"] = result[1]
            response["store_order_id"] = result[2]
            response["user_id"] = result[3]
            response["created_date"] = str(result[4])
            response["updated_date"] = result[5]
            response["authorized_date"] = result[6]
            response["processor"] = result[7]
            response["status"] = result[8]
            response["type"] = result[9]
            response["amount"] = result[10]
            response["currency"] = result[11]
    conn.close()
        
    
    return response