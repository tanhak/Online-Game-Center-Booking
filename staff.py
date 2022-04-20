from public import *
from datetime import date, datetime

staff = Blueprint('staff', __name__)


@staff.route('/staff_home')
def staff_home():
    return render_template('staff_home.html')


@staff.route('/staff_manage_venue', methods=['get', 'post'])
def staff_manage_venue():
    data = {}

    if 'action' in request.args:
        action = request.args['action']
        ids = request.args['ids']
    else:
        action = None

    if action == 'inactive':
        q = "update venue set vstatus='inactive' where venue_id='%s'" % (ids)
        update(q)
        flash("activated")
        return redirect(url_for('staff.staff_manage_venue'))
    if action == 'active':
        q = "update venue set vstatus='active' where venue_id='%s'" % (ids)
        update(q)
        flash("Inactivated")
        return redirect(url_for('staff.staff_manage_venue'))

    if action == 'update':
        q = "SELECT * FROM `venue` WHERE `venue_id`='%s'" % (ids)
        res = select(q)
        data['res'] = res

    if 'update' in request.form:
        venue = request.form['venue']
        place = request.form['pl']
        a = request.form['a']

        details = request.form['det']
        q = "UPDATE `venue` SET `venue`='%s',place='%s',amount='%s',details='%s' WHERE `venue_id`='%s'" % (
            venue, place, a, details, ids)
        update(q)
        flash('updated')
        return redirect(url_for('staff.staff_manage_venue'))

    if 'submit' in request.form:
        venue = request.form['venue']
        place = request.form['pl']

        a = request.form['a']
        details = request.form['det']
        q = "INSERT INTO `venue` VALUES(null,'%s','%s','%s','%s','active')" % (
            venue, place, a, details)
        insert(q)
        flash('venue added')
        return redirect(url_for('staff.staff_manage_venue'))

    q = "SELECT * FROM `venue`"
    res = select(q)
    data['venue'] = res
    return render_template('staff_manage_venue.html', data=data)


@staff.route('/staff_manage_time_slot', methods=['get', 'post'])
def staff_manage_time_slot():
    data = {}
    id = request.args['id']
    data['id'] = id

    if 'action' in request.args:
        action = request.args['action']
        ids = request.args['ids']
    else:
        action = None

    if action == 'inactive':
        q = "update timeslot set mstatus='inactive' where timeslot_id='%s'" % (
            ids)
        update(q)
        flash("activated")
        return redirect(url_for('staff.staff_manage_time_slot', id=id))
    if action == 'active':
        q = "update timeslot set mstatus='active' where timeslot_id='%s'" % (
            ids)
        update(q)
        flash("Inactivated")
        return redirect(url_for('staff.staff_manage_time_slot', id=id))

    if action == 'update':
        q = "SELECT * FROM `timeslot` WHERE `timeslot_id`='%s'" % (ids)
        res = select(q)
        data['res'] = res

    if 'update' in request.form:
        time = request.form['slot']
        date = request.form['date']
        q = "UPDATE `timeslot` SET `time`='%s',`date`='%s' WHERE `timeslot_id`='%s'" % (
            time, date, ids)
        update(q)
        flash('updated')
        return redirect(url_for('staff.staff_manage_time_slot', id=id))

    if 'submit' in request.form:
        time = request.form['slot']
        date = request.form['date']
        q = "INSERT INTO `timeslot` VALUES(null,'%s','%s','%s','active')" % (
            id, date, time)
        insert(q)
        flash('timeslot added')
        return redirect(url_for('staff.staff_manage_time_slot', id=id))

    q = "SELECT * FROM `timeslot`"
    res = select(q)
    data['time'] = res
    return render_template("staff_manage_time_slot.html", data=data)


@staff.route('/staff_view_bookings')
def staff_view_bookings():
    data = {}
    q = "SELECT *,`timeslot`.`date` AS tdate,`booking`.`date` AS bdate FROM `booking` INNER JOIN `timeslot` USING(timeslot_id) INNER JOIN customer USING(customer_id)"
    res = select(q)
    data['book'] = res

    if 'action' in request.args:
        action = request.args['action']
        id = request.args['id']
    else:
        action = None

    if action == 'accept':
        q = "update booking set status='Accepted' where booking_id='%s'" % (id)
        update(q)
        flash('accepted')
        return redirect(url_for('staff.staff_view_bookings'))

    if action == 'reject':
        q = "update booking set status='Rejected' where booking_id='%s'" % (id)
        update(q)
        flash('rejected')
        return redirect(url_for('staff.staff_view_bookings'))
    return render_template("staff_view_bookings.html", data=data)


@staff.route('/staff_view_payments')
def staff_view_payments():
    data = {}
    id = request.args['id']
    q = "SELECT * FROM `payment` WHERE booking_id='%s'" % (id)
    res = select(q)
    data['pay'] = res
    return render_template("staff_view_payments.html", data=data)


@staff.route('/staff_make_customer_report')
def staff_make_customer_report():
    data = {}
    q = "SELECT * FROM `customer` "
    res = select(q)
    data['customer'] = res
    return render_template("staff_make_customer_report.html", data=data)


@staff.route('/admin_print_customers')
def admin_print_customers():
    data = {}
    today = date.today()
    print(today)
    data['today'] = today
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    print(current_time)
    data['current_time'] = current_time

    q = "SELECT * FROM `customer` "
    res = select(q)
    data['customer'] = res
    return render_template("admin_print_customers.html", data=data)


@staff.route('/staff_make_booking_report', methods=['get', 'post'])
def staff_make_booking_report():
    data = {}

    if 'ser' in request.form:
        se = '%'+request.form['se']+'%'
        q = "SELECT *,`timeslot`.`date` AS tdate,`booking`.`date` AS bdate FROM `booking` INNER JOIN `timeslot` USING(timeslot_id) INNER JOIN customer USING(customer_id) INNER JOIN venue USING(venue_id) WHERE `booking`.`date` LIKE '%s'" % (
            se)

    else:
        q = "SELECT *,`timeslot`.`date` AS tdate,`booking`.`date` AS bdate FROM `booking` INNER JOIN `timeslot` USING(timeslot_id) INNER JOIN customer USING(customer_id) INNER JOIN venue USING(venue_id)"

    res = select(q)
    print(res)
    data['book'] = res
    return render_template("staff_make_booking_report.html", data=data)


@staff.route('/admin_print_bookings', methods=['get', 'post'])
def admin_print_bookings():
    data = {}
    today = date.today()
    print(today)
    data['today'] = today
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    print(current_time)
    data['current_time'] = current_time

    q = "SELECT *,`timeslot`.`date` AS tdate,`booking`.`date` AS bdate FROM `booking` INNER JOIN `timeslot` USING(timeslot_id) INNER JOIN customer USING(customer_id) INNER JOIN venue USING(venue_id)"
    res = select(q)
    print(res)
    data['book'] = res
    return render_template("admin_print_bookings.html", data=data)


@staff.route('/staff_change_password', methods=['get', 'post'])
def staff_change_password():
    pwdsss = session['password']
    print(pwdsss)
    uname = session['uname']
    if 'submit' in request.form:
        current = request.form['cpwd']
        new = request.form['npwd']
        password = request.form['pwd']
        print(current, new, password)
        if pwdsss == current:
            if new == password:
                q = "update login set password='%s' where username='%s'" % (
                    new, uname)
                update(q)
                flash("updated")
                session['password'] = new
            else:
                flash("PASSWORD DOES NOT MATCH")
        else:
            flash("INCORRECT CURRENT PASSWORD")
        return redirect(url_for('staff.staff_change_password'))
    return render_template('staff_change_password.html')
