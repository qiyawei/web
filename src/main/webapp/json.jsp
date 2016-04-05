
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
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
        xmlhttp = creatXmlhttp();
        alert(111)
     // xmlhttp.open("get","/hello.do?name=" + username+"&t="+new Date().getTime(),true);
      xmlhttp.open("post","/hello.do",true);
      xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");


      xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4){
          if(xmlhttp.status == 200){
            var text = xmlhttp.responseText;
            var json = JSON.parse(text);
            for(var i =0;i < json.length;i++){
                var obj = json[i];
                console.log(obj.productName)
            }


          }else{
            alert("服务器出错了")
          }
        }
      }
      xmlhttp.send();
    }
  })();
</script>
</body>
</html>
