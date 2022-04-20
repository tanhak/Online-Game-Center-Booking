from flask import *
from database import *
import uuid
import random


import smtplib
from email.mime.text import MIMEText
from flask_mail import Mail


public=Blueprint('public',__name__)

@public.route('/')
def home():
	data={}
	q="SELECT * FROM `venue` where vstatus='active'"
	res=select(q)
	data['venue']=res
	return render_template('home.html',data=data)

@public.route('/login',methods=['get','post'])
def login():
	
	# if 'signup' in request.form:
	# 	return redirect(url_for('public.customer_register'))

	if 'submit' in request.form:
		uname=request.form['uname']
		pwd=request.form['pwd']
		q="SELECT * FROM `login` WHERE `username`='%s' AND `password`='%s'"%(uname,pwd)
		res=select(q)
		if res:
			session['uname']=res[0]['username']
			session['password']=res[0]['password']
			if res[0]['user_type']=='admin':
				flash("login successfully....!")
				return redirect(url_for('admin.admin_home'))
			elif res[0]['user_type']=='customer':
				q="select * from customer where username='%s'"%(session['uname'])
				res=select(q)
				print(res)
				if res:
					session['cid']=res[0]['customer_id']
					session['un']=res[0]['username']
					flash("login successfully....!")
					return redirect(url_for('customer.customer_home'))
			elif res[0]['user_type']=='staff':
				q="select * from staff where username='%s'"%(session['uname'])
				res=select(q)
				print(res)
				if res:
					session['sid']=res[0]['staff_id']
					flash("login successfully....!")
					return redirect(url_for('staff.staff_home'))
		else:
			flash("INVALID USERNAME OR PASSWORD")


	if 'forgotpassword' in request.form:	
		return redirect(url_for('public.forgotpassword'))
	return render_template('login.html')




@public.route('/forgotpassword',methods=['get','post'])
def forgotpassword():
	data={}
	if 'next' in request.form:
		ph=request.form['ph']
		uname=request.form['uname']
		q="select email,username from login inner join customer using(username) where username='%s' and phone='%s' union select email,username from login inner join staff using(username) where username='%s' and phone='%s' "%(uname,ph,uname,ph)
		print(q)
		res=select(q)
		print(res)
		if res:
			print(res)
			session['uname']=res[0]['username']
			# email=res[0]['email']
			email=res[0]['username']
			print(email)
			rd=random.randrange(1000,9999,4)
			msg=str(rd)
			data['rd']=rd
			print(rd)
			try:
				gmail = smtplib.SMTP('smtp.gmail.com', 587)
				gmail.ehlo()
				gmail.starttls()
				gmail.login('annababykp@gmail.com','Anna@1998')
			except Exception as e:
				print("Couldn't setup email!!"+str(e))

			msg = MIMEText(msg)

			msg['Subject'] = 'OTP FOR PASSWORD RECOVRY'

			msg['To'] = email

			msg['From'] = 'annababykp@gmail.com'

			try:

				gmail.send_message(msg)
				print(msg)
				flash("EMAIL SENED SUCCESFULLY")
				session['rd']=rd
				return redirect(url_for('public.enterotp'))


			except Exception as e:
				print("COULDN'T SEND EMAIL", str(e))
				return redirect(url_for('public.forgotpassword'))
		else:
			flash("INVALID DETAILS")
			return redirect(url_for('public.forgotpassword'))
	return render_template("forgotpassword.html",data=data)



@public.route('/enterotp',methods=['get','post'])
def enterotp():
	rd=session['rd']
	uname=session['uname']
	data={}
	if "otp" in request.form:
		otp=request.form['otp']
		if int(otp)==int(rd):
			data['chp']=uname
		else:
			flash("invalid otp")
			return redirect(url_for('public.forgotpassword'))


	if 'update' in request.form:
		uname=request.form['uname']
		p=request.form['pwd']
		cp=request.form['pwds']
		if p==cp:
			print("+++++++++++")
			q="update login set password='%s' where username='%s'"%(p,uname)
			update(q)
			flash("UPDATED SUCCESSFULLY")
			return redirect(url_for('public.login'))
		else:
			flash("PASSWORD MISMATCH")
			data['chp']=uname
	return render_template("enterotp.html",data=data)




@public.route('/customer_register',methods=['get','post'])
def customer_register():
	if 'submit' in request.form:
		fname=request.form['fn']
		lname=request.form['ln']
		place=request.form['pl']
		phone=request.form['ph']
		email=request.form['em']
		pwd=request.form['pwd']
		q="select * from login where username='%s' and password='%s'" %(email,pwd)
		res=select(q)
		if res:
			flash("USERNAME AND PASSWORD IS ALREADY EXIST")
		else:
			q="INSERT INTO `login` VALUES('%s','%s','customer')"%(email,pwd)
			insert(q)
			q1="INSERT INTO `customer` VALUES(null,'%s','%s','%s','%s','%s','%s')"%(email,fname,lname,place,phone,email)
			insert(q1)
			flash('registered')
		return redirect(url_for('public.customer_register'))
	return render_template("customer_register.html")