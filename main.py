from flask import Flask 
from public import public
from admin import admin
from customer import customer
from staff import staff

import smtplib
from email.mime.text import MIMEText
from flask_mail import Mail
from flask import *


app=Flask(__name__)
app.secret_key="key"

app.register_blueprint(public)
app.register_blueprint(admin,url_prefix='/admin')
app.register_blueprint(customer,url_prefix='/customer')
app.register_blueprint(staff,url_prefix='/staff')

mail=Mail(app)
app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USERNAME'] = 'annababykp@gmail.com'
app.config['MAIL_PASSWORD'] = 'Anna@1998'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True


app.run(debug=True,port=5005)