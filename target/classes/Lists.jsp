<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Entry site...</title>
</head>
<body LINK="#1fbf1f">
	<div align="center">

        	<table border="1" >
        		<tr>
        			<th colspan="2">
        		     	<h1>"The Entry List"</h1>
        		    </th>
        		</tr>
	        	<tr>
	        		<td>
		        	<a href="new">add new entry</a>
					</td>
					<td>
		        	<a href="list">list all entries</a>
		        	</td>
	        	</tr>
	        	<tr>
        			<th colspan="2">
        		     	

							<script type="text/javascript">
							$(document).ready(function(){
							    $('#showTextArea').click(function(){
							        $('#myTextArea').show();
							    });
							});
							</script>
							<input style="min-width: 200px; color: green" type="button" width="max" value="Help" id="showTextArea">
	
							<textarea id="myTextArea" style="display: none;">
								Click on "edit" to to edit the entry. Click on "delete" to delete the entry.
							</textarea>
						
        		    </th>
        		</tr>
        	</table>

        <table border="0" cellpadding="5">
            <tr>
                <th>Change</th>
                <th>ID</th>
                <th>Title</th>
                <th>Text</th>
            </tr>
            <!-- entries from listEntry get listed -->
            <c:forEach var="entry" items="${listEntry}">
                <tr>
                  	<td>
                    	<table border="1">
                    		<tr>
	                    		<td>
	                    			<!-- tells the controller which id was selected to edit -->
			                    	<a href="edit?id=<c:out value='${entry.id}' />">Edit</a>
			                    </td>
			                    <td>
			                    	<!-- tells the controller which id was selected to edit -->
			                    	<a href="delete?id=<c:out value='${entry.id}' />">Delete</a>
			                    </td>
		                    </tr>
                    	</table>                    	
                    </td> 
                    
                    <td><c:out value="${entry.id}" /></td>
                    <td><c:out value="${entry.title}" /></td>
                    <td><c:out value="${entry.text}" /></td>

                </tr>
            </c:forEach>
        </table>
        <br>
        <br>
        <br>
        <table border="1" >
        		<tr>
        			<th colspan="2">
        		     	<h1>Users</h1>
        		    </th>
        		</tr>
	        	<tr>
	        		<td>
		        	<a href="new">add new user</a>
					</td>
					<td>
		        	<a href="list">list all users</a>
		        	</td>
	        	</tr>
	        	<tr>
	        	<!-- when clicking on 'help', the message from 'myTextArea' appears -->
        			<td colspan="2">
							<script type="text/javascript">
								$(document).ready(function(){
								    $('#showTextArea').click(function(){
								        $('#myTextArea').show();
								    });
								});
							</script>
							<input style="min-width: 200px; color: green" type="button" width="max" value="Help" id="showTextArea">
	
							<textarea id="myTextArea" style="display: none;">
								Click on "edit" to to edit the user. Click on "delete" to delete the user.
							</textarea>
						
        		    </td>
        		</tr>
        	</table>

        <table border="0" cellpadding="5">
            <tr>
                <th>Change</th>
                <th>ID</th>
                <th>Name</th>
                <th>Password</th>
            </tr>
            <!-- users from listUser get listed -->
            <c:forEach var="user" items="${listUser}">
                <tr>
                  	<td>
                    	<table border="1">
                    		<tr>
	                    		<td>
	                    			<!-- tells controller which id was selected to edit -->
			                    	<a href="edit2?id=<c:out value='${user.id}' />">Edit</a>
			                    </td>
			                    <td>
			                    	<!-- tells controller which id was selected to delete -->
			                    	<a href="delete2?id=<c:out value='${user.id}' />">Delete</a>
			                    </td>
		                    </tr>
                    	</table>                    	
                    </td> 
                    
                    <td><c:out value="${user.id}" /></td>
                    <td><c:out value="${user.name}" /></td>
                    <td><c:out value="${user.password}" /></td>

                </tr>
            </c:forEach>
        </table>
    </div>
    
    <footer>
  		<p>by J.Bühler, October 2019</p>
	</footer> 	
</body>
</html>
