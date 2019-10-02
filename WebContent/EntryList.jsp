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
        		     	<h1>"The List"</h1>
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
								<p>Click on "edit" to to edit the entry. Click on "delete" to delete the entry.</p>
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
            <c:forEach var="entry" items="${listEntry}">
                <tr>
                  	<td>
                    	<table border="1">
                    		<tr>
	                    		<td>
			                    	<a href="edit?id=<c:out value='${entry.id}' />">Edit</a>
			                    </td>
			                    <td>
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
    </div>	
</body>
</html>
