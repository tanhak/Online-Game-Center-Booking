import mysql.connector
user="root"
password=""
database="online_game_center_booking_system"
port="3306"

def select(q):
	con=mysql.connector.connect(user=user,password=password,host="localhost",database=database,port=port)
	cur=con.cursor(dictionary=True)
	cur.execute(q)
	result=cur.fetchall()
	cur.close()
	con.close()
	return result

def insert(q):
	con=mysql.connector.connect(user=user,password=password,host="localhost",database=database,port=port)
	cur=con.cursor(dictionary=True)
	cur.execute(q)
	con.commit()
	result=cur.lastrowid
	cur.close()
	con.close()
	return result

def update(q):
	con=mysql.connector.connect(user=user,password=password,host="localhost",database=database,port=port)
	cur=con.cursor(dictionary=True)
	cur.execute(q)
	con.commit()
	res=cur.rowcount
	cur.close()
	con.close()
	return res

def delete(q):
	con=mysql.connector.connect(user=user,password=password,host="localhost",database=database,port=port)
	cur=con.cursor(dictionary=True)
	cur.execute(q)
	con.commit()
	result=cur.rowcount
	cur.close()
	con.close()
	return result