<%@page contentType="text/html;charset=euc-kr"%>
<%@taglib prefix="c" 
          uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>ȸ������ Ȯ��</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600">
<br>
<table align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
	<table border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="MemberInsert2.do">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b> 
              <c:out value="${mdt.name}"/>
              ȸ������ �ۼ��Ͻ� �����Դϴ�. Ȯ���� �ּ���</b></font> </td>
          </tr>
          <tr> 
            <td>���̵�</td>
            <td>
	<input type="text" name="id" 
	value="<c:out value="${mdt.id}"/>"></td>
          </tr>
          
          <input type="hidden" name="id" 
	value="<c:out value="${ldt.id}"/>"></td>
          </tr>
          
          <tr> 
            <td>�н�����</td>
            <td><input type="password" name="password" 
	value="<c:out value="${ldt.password}"/>"></td>
          </tr>
          <tr> 
            <td>�̸�</td>
            <td><input type="text" name="name" 
			value="<c:out value="${mdt.name}"/>"></td>
          </tr>
          <td>�г���</td>
            <td><input type="text" name="nick" 
			value="<c:out value="${mdt.nick}"/>"></td>
          </tr>
          <tr> 
            <td>�̸���</td>
           <td><input type="text" name="email"  size="30" 
		   value="<c:out value="${mdt.email}"/>"></td>
          </tr>
          <tr> 
            <td colspan="2" align="center"><input type="submit" value="Ȯ�οϷ�"> 
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            <input type="button" value="�ٽþ���" onClick="history.back()"> 
            </td>
          </tr>
        </form>
      </table>
 </td>
  </tr>
</table>
</body>
</html>
