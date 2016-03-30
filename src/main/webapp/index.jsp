
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
  <input type="text" id="username"/><span style="display: none">账号已经被注册</span>
  <button id="btn">提交</button>
  <script>
    (function(){
      function creatXmlhttp(){
        var xmlhttp = null;
        if(Window.ActiveXObject){
          xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
        }else{
          xmlhttp = new XMLHttpRequest();
        }
        return xmlhttp;
      }

      document.querySelector("#btn").onclick = function(){
        document.querySelector("span").style.display = "none"
        var username = document.querySelector("#username").value;
        xmlhttp = creatXmlhttp();
        xmlhttp.open("get","/hello.do?name=" + username+"&t="+new Date().getTime(),true);
        //xmlhttp.open("post","/hello.do",true);
        //字符编码

        var a = 0;





        xmlhttp.onreadystatechange = function(){
          if(xmlhttp.readyState == 4){
            if(xmlhttp.status == 200){
              var text = xmlhttp.responseText;
              if(text == "yes"){
                document.querySelector("span").style.display = "inline"
              }
            }else{
              alert("服务器出错了")
            }
          }
        }
        xmlhttp.send();
        //xmlhttp.send("name=" + username)

      }







    })();
  </script>
</body>
</html>
