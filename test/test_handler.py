from mock_db import MockDB
from mock import patch
import handler


class TestHandler(MockDB):

    def test_getPaymentById(self):
        with self.mock_db_config:
            event = { "queryStringParameters": {"payment_id":"id_not_found"}}
            #event = { "queryStringParameters": {"payment_id":"04eef56f-8c6b-47ea-88c8-393e63a8d444"}}
            assert handler.getPaymentById(event,"") == '[]',"No results"