<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>addandedit</title>
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
								<p>Write a title. Write your text. Save by clicking on the "Save"-Button.</p>
							</textarea>
						
        		    </th>
        		</tr>
        	</table>
        	
		<c:if test="${entry != null}">
			<form action="update" method="post">
        </c:if>
        <c:if test="${entry == null}">
			<form action="insert" method="post">
        </c:if>
        <table border="0" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${entry != null}">
            			Edit entry
            		</c:if>
            		<c:if test="${entry == null}">
            			Add entry
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${entry != null}">
        			<input type="hidden" name="id" value="<c:out value='${entry.id}' />" />
        		</c:if>            
            <tr>
                <th>Title: </th>
                <td>
                	<input type="text" name="title" size="45"
                			value="<c:out value='${entry.title}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Text: </th>
                <td>
                	<input type="text" name="text" size="45" 
                			value="<c:out value='${entry.text}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input style="min-width: 200px; color: green" type="submit" value="Save" />
            	</td>
            </tr>
        </table>
        </form>
    </div>	
</body>
</html>
