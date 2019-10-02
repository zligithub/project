<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>addandedit</title>
</head>
<body LINK="#1fbf1f">
	<div align="center">
		<form>
        	<table border="1" >
        		<tr>
        			<th colspan="2">
        		     	<h1>"The Entry Form"</h1>
        		    </th>
        		</tr>

	        	<tr>
	        	    <!-- when clicking on 'help', the message from 'myTextArea' appears -->
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
								Write a title. Write your text. Save by clicking on the "Save"-Button.
							</textarea>
						
        		    </th>
        		</tr>
        	</table>
        	<!-- dependent on if an already existing entry gets edited or a new one gets added, the text will be different (nice extra) -->
		<c:if test="${entry != null}">
			<form action="update" method="post">
        </c:if>
        <c:if test="${entry == null}">
			<form action="insert" method="post">
        </c:if>
        <!-- 2x form tag is ok, because only one of them counts. the editor doesn't seem to get it... -->
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
        			<!-- setting the id attribute of the entry object -->
        			<input type="hidden" name="id" value="<c:out value='${entry.id}' />" />
        		</c:if>            
            <tr>
                <th>Title: </th>
                <td>
                	<!-- input gets sent determining the title attribute of the entry object -->
                	<input type="text" name="title" size="45"
                			value="<c:out value='${entry.title}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Text: </th>
                <td>
                	<!-- input gets sent determining the text attribute of the entry object -->
                	<input type="text" name="text" size="45" 
                			value="<c:out value='${entry.text}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<!-- type submit -->
            		<input style="min-width: 200px; color: green" type="submit" value="Save" />
            	</td>
            </tr>
        </table>
        </form>
    </div>	
    <footer>
  		<p>by J.Bühler, October 2019</p>
	</footer> 
</body>
</html>
