<%@ page import = "java.sql.*"%> 
<%@ page import = "java.io.*" %>

<html>
<head>
<link rel="stylesheet" href="logo.css">
<style>

.hl {
padding-left : 200px;
margin-left : 6%;
margin-top : 15px;	
}

.hl h3{
font-size : 20px;
margin-left : 50px;
}

.l{
margin-left : 50px;
}

table,th,td{
border : 1px solid black;
border-collapse :  collapse;
font-size : 20px;
padding : 10px;
}
</style>
</head>
<body bgcolor="lightblue">
	<header class="logo">
		<nav>
			<div class="logoimage">
				<img src="blood.png">
			</div>
			<div class="logoname">
				<h1>Blood Bank</h1>
				<h3>Management System</h3>
			</div>
			<div class="hl">
				<h3><a href="homepage.html">Home Page</a>
				<a class="l" href="donorlogin.html">Logout</a></h3>
			</div>
		</nav>
	</header>	

<center>

<%
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try {
  Class.forName("com.mysql.jdbc.Driver");
}
catch(Exception e){
  out.print("Error1-!!!!!!" + e);
}
try {
  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","");
}
catch(SQLException ex) {
  System.out.println("Error2-!!!!!!" + ex);
}

			stmt = conn.createStatement();

	String user = request.getParameter("username");
	String pass = request.getParameter("password");

	rs=stmt.executeQuery("select username from donors");

	int flag=1;
	while(rs.next())
	{
		String retrived_user = rs.getString("username");
		if(user.equals(retrived_user))
		{	
			flag=0; 
			break; 
		}
	}
if(flag==0)
{

	rs = stmt.executeQuery("select password from donors where username = '"+user+"';");

	rs.next();	
	if(pass.equals(rs.getString("password")))
	{
		rs=stmt.executeQuery("select firstname from donors where username = '"+user+"';");
		rs.next();
		String name	 = rs.getString("firstname");
		out.print("<h1>Welcome "+name+",</h1>");
	
	ResultSet rs1 = stmt.executeQuery("select * from donorbloodhistory where username = '"+user+"';"); 	

		rs = stmt.executeQuery("select * from donorbloodhistory where username = '"+user+"';");
		out.print("<br><h3>Your Donate History</h3><h1><table><tr><th>Blood Quantity</th><th>Donate Date</th></tr></h1>");

		while(rs.next())
		{
			int quantity = rs.getInt("bloodquantity");
			String dt = rs.getString("donatedate");	
			out.print("<tr align='center'><td>"+quantity+" unit</td><td>"+dt+"</td></tr>");
		}
		out.print("<table>");
		out.print("<form action='donateblood.jsp' method='POST'>");



		out.print("<br><input type='hidden' value='"+user+"' name='user_name'>");




		out.print("<br><input type='submit' value='Donate-Blood'></form><br><br>");
		
		
	}
	else
	{
		out.print("<center>");
		out.print("<h2>Invalid Username or Password...!!!</h2>");
		out.print("<h3><a href='donorlogin.html'>Click Here</a> to go back on Donor Login Page</h3>");
	}
}
else
{
	out.print("<center>");
	out.print("<h2>Username doesn't exist...!!!</h2>");
	out.print("<h3><a href='donorlogin.html'>Click Here</a> to go back on Donor Login Page</h3>");
}
%>
</center>
</body>
</html>
