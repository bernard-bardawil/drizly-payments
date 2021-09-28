## Setup
- npm install -g serverless
- Make sure you have python3 installed
- python3 -m pip install -r requirements.txt
- Install MySQL locally or if there's another instance available to connect to you can adjust the variables in serverless.yml (rds_host,name, password, db_name)
- Check payments.sql to create the schema (it has some dummy data if you'd like to truncate)

## File Structure
- [handler.py](handler.py) contains all the functionalities and the queries that are being used in each action
- [config.py](config.py) contains sample data for testing (can be removed for production)
- [serverless.yml](serverless.yml) contains serverless configuration and should be updated once this project is connected and fully functional with aws. currently environment variables are set in serverless.yml to hold all the configuration
- [db.py](db.py) contains database connection
  
## Create Payment

    serverless invoke local --function addPayment --data  {
        "Records": [
            {
                "order_id": "AQEBwJnKyrHigUMZj6rYigCgxlaS3SLy0a",
                "payment_methods":[{
                    "type":"stripe_cc",
                    "amount":"10"
                },{
                    "type":"braintree_cc",
                    "amount":"20"
                },{
    
                    "type":"gift_card",
                    "amount":"250"
                }
                ],
                "entries":[{
                    "store_order_id":"store_order_id_1",
                    "user_id":"user_id_1",
                    "amount":"10",
                    "currency":"USD",
                    "type":"merchandise",
                    "processor":"stripe",
                    "destination":"merhant"
                },
                {
                    "store_order_id":"store_order_id_2",
                    "user_id":"user_id_1",
                    "amount":"20",
                    "currency":"USD",
                    "type":"fee",
                    "processor":"braintree",
                    "destination":"merhant"
                }]
            }
        ]
    }



##  Get Payment

    serverless invoke local -f getPayment --data '{ "queryStringParameters": {"payment_id":"04eef56f-8c6b-47ea-88c8-393e63a8d444"}}'


## Running tests

    python3 -m pytest