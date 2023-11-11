from marshmallow import Schema, fields
from marshmallow import ValidationError

def get_user_age():
    return int(input("Enter your age: "))

class Parameters(Schema):
    report_name = fields.Str(required=True)
    email = fields.Email(required=True)
    start_period = fields.Int(required=True)
    end_period = fields.Int(required=True)

parameters = Parameters()

