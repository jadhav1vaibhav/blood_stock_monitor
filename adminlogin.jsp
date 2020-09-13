<html>
<head>
<link href="logo.css" rel="stylesheet">
<style>
.hl{
margin-left : 30%;
margin-top : 1%;
font-size : 20px;
}

h4{
font-size : 30px;
margin-top : 10%;
}
</style>
</head>
<body bgcolor="skyblue">

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
			</div>
		</nav>
	</header>	

<%
	String user = request.getParameter("username");
	String pass = request.getParameter("password");

	
	ResultSet rs = stmt.executeQuery("select * from adminlogin");
	if(rs.next())
	{
		String ruser = rs.getString("username");
		String rpass = rs.getString("password");

		if()
		{
		
		}
		else
		{}
	}
	
	else
	{
		out.print("<center><h4>Invalid Username or Password...!!!</h4><center>");
		out.print("<a href='adminlogin.html'>Click Here</a> to back on Login Page.");
	}
	
%>

</body>
</html>
