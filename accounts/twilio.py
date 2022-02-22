from traceback import print_tb
from twilio.rest import Client
from decouple import config
import os
from D_kart.settings import TWILIO_ACCOUNT_SID,TWILIO_AUTH_TOKEN,service

def otp_send(phone_number):
    account_sid = os.environ['TWILIO_ACCOUNT_SID'] = 'AC1b6d00ae3d7940130e68c68e13ae45e5'
    auth_token = os.environ['TWILIO_AUTH_TOKEN'] = '82cf4e087d342a9b9aa686d3c6327922'
    print('??????????????????????????????????????')
    client = Client(account_sid, auth_token)
    print(phone_number)

    verification = client.verify\
        .services(service)\
        .verifications \
        .create(to="+91"+phone_number, channel='sms')
    print(verification.status)


def otp_verify(otp, phone):
    account_sid = os.environ['TWILIO_ACCOUNT_SID'] =str(TWILIO_ACCOUNT_SID)
    auth_token = os.environ['TWILIO_AUTH_TOKEN'] = str(TWILIO_AUTH_TOKEN)
    client = Client(account_sid, auth_token)

    verification_check = client.verify \
        .services(service) \
        .verification_checks \
        .create(to="+91"+phone, code=otp)

    print(verification_check.status)
    return verification_check.status