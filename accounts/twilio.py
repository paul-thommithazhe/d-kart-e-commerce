from twilio.rest import Client
from decouple import config
import os

def otp_send(phone_number):
    account_sid = os.environ['TWILIO_ACCOUNT_SID'] = config('TWILIO_ACCOUNT_SID')
    auth_token = os.environ['TWILIO_AUTH_TOKEN'] = config('TWILIO_AUTH_TOKEN')
    client = Client(account_sid, auth_token)

    verification = client.verify \
        .services(config('service')) \
        .verifications \
        .create(to="+91"+phone_number, channel='sms')
        
    print(verification.status)


def otp_verify(otp, phone):
    account_sid = os.environ['TWILIO_ACCOUNT_SID'] =config('TWILIO_ACCOUNT_SID') 
    auth_token = os.environ['TWILIO_AUTH_TOKEN'] = config('TWILIO_AUTH_TOKEN')
    client = Client(account_sid, auth_token)

    verification_check = client.verify \
        .services(config('service')) \
        .verification_checks \
        .create(to="+91"+phone, code=otp)

    print(verification_check.status)
    return verification_check.status