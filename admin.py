from public import *
from datetime import date,datetime 

admin=Blueprint('admin',__name__)

@admin.route('/admin_home')
def admin_home():
	return render_template('admin_home.html')


@admin.route('/admin_change_password',methods=['get','post'])
def admin_change_password():
    pwdsss=session['password']
    print(pwdsss)
    uname=session['uname']
    if 'submit' in request.form:
        current=request.form['cpwd']
        new=request.form['npwd']
        password=request.form['pwd']
        print(current,new,password)
        if pwdsss==current:
            if new==password:
                q="update login set password='%s' where username='%s'"%(new,uname)
                update(q)
                flash("updated")    
                session['password']=new
            else:
                flash("PASSWORD DOES NOT MATCH")    
        else:
            flash("INCORRECT CURRENT PASSWORD")
        return redirect(url_for('admin.admin_change_password'))     
    return render_template('admin_change_password.html')


@admin.route('/admin_manage_venue',methods=['get','post'])
def admin_manage_venue():
	data={}

	if 'action' in request.args:
		action=request.args['action']
		ids=request.args['ids']
	else:
		action=None

	if action=='inactive':
		q="update venue set vstatus='inactive' where venue_id='%s'"%(ids)
		update(q)
		flash("activated")
		return redirect(url_for('admin.admin_manage_venue'))
	if action=='active':
		q="update venue set vstatus='active' where venue_id='%s'"%(ids)
		update(q)
		flash("Inactivated")
		return redirect(url_for('admin.admin_manage_venue'))

	if action=='update':
		q="SELECT * FROM `venue` WHERE `venue_id`='%s'"%(ids)
		res=select(q)
		data['res']=res

	if 'update' in request.form:
		venue=request.form['venue']
		place=request.form['pl']
		a=request.form['a']
		
		details=request.form['det']
		q="UPDATE `venue` SET `venue`='%s',place='%s',amount='%s',details='%s' WHERE `venue_id`='%s'"%(venue,place,a,details,ids)
		update(q)
		flash('updated')
		return redirect(url_for('admin.admin_manage_venue'))

	if 'submit' in request.form:
		venue=request.form['venue']
		place=request.form['pl']
	
		a=request.form['a']
		details=request.form['det']
		q="select * from venue where venue='%s' and place='%s' and details='%s'"%(venue,place,details)
		res=select(q)
		if res:
			flash("venue is already added")
		else:
			q="INSERT INTO `venue` VALUES(null,'%s','%s','%s','%s','active')"%(venue,place,a,details)
			insert(q)
			flash('venue added')
			return redirect(url_for('admin.admin_manage_venue'))

	q="SELECT * FROM `venue`"
	res=select(q)
	data['venue']=res
	return render_template('admin_manage_venue.html',data=data)


@admin.route('/admin_manage_time_slot',methods=['get','post'])
def admin_manage_time_slot():
	data={}
	from datetime import date
	today =date.today()
	id=request.args['id']
	data['id']=id
	s=["12.00AM-1.00AM","1.00AM-2.00AM","3.00AM-4.00AM","4.00AM-5.00AM","5.00AM-6.00AM","6.00AM-7.00AM","7.00AM-8.00AM","8.00AM-9.00AM","9.00AM-10.00AM","10.00AM-11.00AM","11.00AM-12.00PM","12.00PM-1.00PM","1.00PM-2.00PM","3.00PM-4.00PM","4.00PM-5.00PM","5.00PM-6.00PM","6.00PM-7.00PM","7.00PM-8.00PM","8.00PM-9.00PM","9.00PM-10.00PM","11.00PM-12.00PM"]
	
	data['today']=today
	print("Today's date:", today)

	
	if 'action' in request.args:
		action=request.args['action']
		ids=request.args['ids']
	else:
		action=None

	if action=='inactive':
		q="update timeslot set mstatus='inactive' where timeslot_id='%s'"%(ids)
		update(q)
		flash("activated")
		return redirect(url_for('admin.admin_manage_time_slot',id=id))
	if action=='active':
		q="update timeslot set mstatus='active' where timeslot_id='%s'"%(ids)
		update(q)
		flash("Inactivated")
		return redirect(url_for('admin.admin_manage_time_slot',id=id))

	if action=='update':
		q="SELECT * FROM `timeslot` WHERE `timeslot_id`='%s'"%(ids)
		res=select(q)
		data['res']=res

	if 'update' in request.form:
		time=request.form['slot']
		date=request.form['date']
		q="UPDATE `timeslot` SET `time`='%s',`date`='%s' WHERE `timeslot_id`='%s'"%(time,date,ids)
		update(q)
		flash('updated')
		return redirect(url_for('admin.admin_manage_time_slot',id=id))

	if 'submit' in request.form:
		# time=request.form['slot']
		date=request.form['date']
		q="select * from `timeslot` where date like '%s' and venue_id='%s'" %(date,id)
		res=select(q)
		print(res)
		if not res:
			for i in s:
				q="INSERT INTO `timeslot` VALUES(null,'%s','%s','%s','active')"%(id,date,i)
				insert(q)

				
		else:
			flash("ALready Added")
			return redirect(url_for('admin.admin_manage_time_slot',id=id))
		flash('timeslot added')
		return redirect(url_for('admin.admin_manage_time_slot',id=id))
	if 'submits' in request.form:
		date=request.form['datess']
		q="SELECT * FROM `timeslot` where date like '%s'" %(date)
	else:
		q="SELECT * FROM `timeslot`"
	res=select(q)
	data['time']=res
	return render_template("admin_manage_time_slot.html",data=data)


@admin.route('/admin_view_complaint_reply',methods=['get','post'])
def admin_view_complaint_reply():
	data={}
	q="SELECT *,CONCAT(`first_name`,' ',`last_name`) AS `name` FROM `complaint` INNER JOIN `customer` USING(`customer_id`)"
	res=select(q)
	data['complaints']=res

	j=0
	for i in range(1,len(res)+1):
		print('submit'+str(i))
		if 'submit'+str(i) in request.form:
			reply=request.form['reply'+str(i)]
			print(reply)
			print(j)
			print(res[j]['complaint_id'])
			q="update complaint set reply='%s' where complaint_id='%s'" %(reply,res[j]['complaint_id'])
			print(q)
			update(q)
			flash("success")
			return redirect(url_for('admin.admin_view_complaint_reply')) 	
		j=j+1
	return render_template("admin_view_complaint_reply.html",data=data)


@admin.route('/admin_view_bookings')
def admin_view_bookings():
	data={}
	q="SELECT *,`timeslot`.`date` AS tdate,`booking`.`date` AS bdate FROM `booking` INNER JOIN `timeslot` USING(timeslot_id) INNER JOIN customer USING(customer_id) inner join venue using(venue_id)"
	res=select(q)
	data['book']=res

	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='accept':
		q="update booking set status='Accepted' where booking_id='%s'"%(id)
		update(q)
		flash('accepted')
		return redirect(url_for('admin.admin_view_bookings'))

	if action=='reject':
		q="update booking set status='Rejected' where booking_id='%s'"%(id)
		update(q)
		flash('rejected')
		return redirect(url_for('admin.admin_view_bookings'))
	return render_template("admin_view_bookings.html",data=data)

@admin.route('/admin_view_payments')	
def admin_view_payments():
	data={}
	id=request.args['id']
	q="SELECT * FROM `payment` WHERE booking_id='%s'"%(id)
	res=select(q)
	data['pay']=res
	return render_template("admin_view_payments.html",data=data)



@admin.route('/admin_add_staff',methods=['get','post'])
def admin_add_staff():
    data={}
    q="SELECT  * FROM `staff`"
    data['staff']=select(q)


    if 'action' in request.args:
        action=request.args['action']
        sid=request.args['sid']
    else:
        action=None

    if action=='update':
        q="select * from staff where username='%s'"%(sid)
        data['updatess']=select(q)

    if action=='inactive':
        q="update staff set fstatus='inactive' where username='%s'"%(sid)
        update(q)
        q="update login set user_type='staffs' where username='%s'"%(sid)
        update(q)
        flash("Inactivated")
        return redirect(url_for('admin.admin_add_staff'))
    if action=='active':
        q="update staff set fstatus='active' where username='%s'"%(sid)
        update(q)
        q="update login set user_type='staff' where username='%s'"%(sid)
        update(q)
        flash("Activated")
        return redirect(url_for('admin.admin_add_staff'))

    if 'submits' in request.form:
        fname=request.form['fname']
        lname=request.form['lname']
        hname=request.form['hname']
        place=request.form['place']
        phone=request.form['phone']
        email=request.form['email']


        # q="update `login` set `username'=%s' where "%(email,pwd)
        # insert(q)
        q="update `staff` set `username`='%s',`first_name`='%s',`last_name`='%s',`house_name`='%s',`place`='%s',`phone`='%s',`email`='%s' where username='%s'"%(email,fname,lname,hname,place,phone,email,sid)
        update(q)
        flash('successfully updated')
        return redirect(url_for('admin.admin_add_staff'))

    if 'submit' in request.form:
        fname=request.form['fname']
        lname=request.form['lname']
        hname=request.form['hname']
        place=request.form['place']
        phone=request.form['phone']
        email=request.form['email']     
        pwd=request.form['pwd']
        q="select * from login where username='%s' and password='%s'"%(email,pwd)
        res=select(q)
        if res:
            flash("USERNAME OR PASSWORD IS ALREADY EXIST")
        else:
            q="INSERT INTO `login` VALUES('%s','%s','staff')"%(email,pwd)
            insert(q)
            q="INSERT INTO `staff` VALUES(null,'%s','%s','%s','%s','%s','%s','%s','active')"%(email,fname,lname,hname,place,phone,email)

            insert(q)

            pwd=str(pwd)
            email=email
            pwd="YOUR USERNAME: "+email+" PASSWORD: "+pwd

        try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('annababykp@gmail.com','Anna@1998')
        except Exception as e:
            print("Couldn't setup email!!"+str(e))

        pwd = MIMEText(pwd)

        pwd['Subject'] = 'YOUR PASSWORD'

        pwd['To'] = email

        pwd['From'] = 'annababykp@gmail.com'

        try:

            gmail.send_message(pwd)
            print(pwd)
            flash("EMAIL SENED SUCCESFULLY")



        except Exception as e:
            print("COULDN'T SEND EMAIL", str(e))
        else:
            flash("INVALID DETAILS")


        return redirect(url_for('admin.admin_add_staff'))
    return render_template('admin_add_staff.html',data=data)



@admin.route('/admin_make_customer_report')	
def admin_make_customer_report():
	data={}
	q="SELECT * FROM `customer` "
	res=select(q)
	data['customer']=res
	return render_template("admin_make_customer_report.html",data=data)




@admin.route('/admin_print_customers')	
def admin_print_customers():
	data={}
	today=date.today()
	print(today)
	data['today']=today
	now=datetime.now()
	current_time=now.strftime("%H:%M:%S")
	print(current_time)
	data['current_time']=current_time

	q="SELECT * FROM `customer` "
	res=select(q)
	data['customer']=res
	return render_template("admin_print_customers.html",data=data)




@admin.route('/admin_make_booking_report',methods=['get','post'])	
def admin_make_booking_report():
    data={}

    if 'submit' in request.form:
        fd=request.form['fd']
        td=request.form['td']
        q="SELECT *,`timeslot`.`date` AS tdate,`booking`.`date` AS bdate FROM `booking` INNER JOIN `timeslot` USING(timeslot_id) INNER JOIN customer USING(customer_id) INNER JOIN venue USING(venue_id) WHERE `booking`.`date` between '%s' and '%s' "%(fd,td)


    else:
        q="SELECT *,`timeslot`.`date` AS tdate,`booking`.`date` AS bdate FROM `booking` INNER JOIN `timeslot` USING(timeslot_id) INNER JOIN customer USING(customer_id) INNER JOIN venue USING(venue_id)"

    res=select(q)
    print(res)
    data['bkk']=res
    return render_template("admin_make_booking_report.html",data=data)




@admin.route('/admin_print_bookings',methods=['get','post'])	
def admin_print_bookings():
	data={}
	today=date.today()
	print(today)
	data['today']=today
	now=datetime.now()
	current_time=now.strftime("%H:%M:%S")
	print(current_time)
	data['current_time']=current_time


	q="SELECT *,`timeslot`.`date` AS tdate,`booking`.`date` AS bdate FROM `booking` INNER JOIN `timeslot` USING(timeslot_id) INNER JOIN customer USING(customer_id) INNER JOIN venue USING(venue_id)"		
	res=select(q)
	print(res)
	data['book']=res
	return render_template("admin_print_bookings.html",data=data)