sqs = {
    "Records": [
        {
            "order_id": "AQEBwJnKyrHigUMZj6rYigCgxlaS3SLy0a",
            "payment_methods":[{
                "type":"stripe_cc",
                "amount":"10",
                "token":"token-1",
                "vault":"vault-1"
            },{
                "type":"braintree_cc",
                "amount":"20",
                "token":"token-2",
                "vault":"vault-2"
            },{

                "type":"gift_card",
                "amount":"250",
                "token":"token-3",
                "vault":"vault-3"
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

