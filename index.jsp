<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login By BarretLee</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="./css/main.css">
  </head>
  
  <body>
    <div class="acenter">
	<h1>��¼ҳ</h1>
	<fieldset class="login">
		<legend>��¼</legend>
		<form method="POST" action="./pages/MyJsp.jsp" enctype="multipart/form-data">
			<p><label for="user">�û�����</label> <input type="text" name="user" id="user" /></p>
			<p><label for="pwd">��&nbsp;&nbsp;�룺</label> <input type="password" name="pwd" id="pwd" /><a href="#" class="forget-pwd">�������룿</a></p>
			<p><input type="checkbox" checked="checked" name="rem" id="rem" /><label class="rem-pwd" for="rem">��ס����</label></p>
			<p><input type="reset" value="����" /><input type="submit" value="�ύ" /></p>
		</form>
	</fieldset>
</div>

<div class="loading-bar hide"><div></div></div>
<div class="info-bar hide"><div>Error</div><sup>��</sup></div>

<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/tools.js"></script>
<script type="text/javascript" src="./js/client_validate.js"></script>
<script type="text/javascript">
function submitForm() {
	var xhr;
	var url = "./pages/MyJsp.jsp";
	var delta = .25;

	if(window.addEventListener) xhr = new XMLHttpRequest;
	else xhr = new ActiveXObject("Msxml2.XMLHTTP");
	
	xhr.open("POST", url, true);
 	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = function(){
		var res , errno , msg , noop = function(){};

		if(xhr.readyState == 4 && xhr.status == 200) {
			res =parseInt(trim(xhr.responseText));
			switch(res) {
				case 0:
					msg="��ϲ���½�ɹ���";
					noop = function(){
						window.location.href = "./succ.jsp";
					};
					break;
				case 1:
					msg="�û�������";
					noop = function(){
						$("#pwd").val(""),
						$("#user").focus().select();
					};
					break;
 				case 2:
 					msg="�������";
 					noop = function(){
 						$("#pwd").val("").focus();
 					};
 					break;
 				default:
 					msg="�û��������������";
 					noop = function(){
						$("#pwd").val(""),
						$("#user").focus().select();
					};
			}
		}
// 		else{
// 			alert("���룺"+xhr.status+"message:"+xhr.statusText);
// 		}
		Tool.load(delta * xhr.readyState, function(){
			Tool.info.show(msg, noop);
		});
	};
		xhr.send($.param({"user":$("#user").val(),"pwd":$("#pwd").val(),"t": new Date*1}));
}

$(function(){
	$("input[type=submit]").on("click", function(evt){
		evt.preventDefault();
		if($("#user").val() == "") {
			Tool.info.show("�û�������Ϊ�գ�", function(){
				$("#pwd").val(""),
				$("#user").focus().select();
			});
			return;
		}
		submitForm();
	})
});
</script>
  </body>
</html>
