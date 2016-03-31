
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
</head>
<body>

<form class="form-inline">
    <input type="text"/>
    <button type="button" id="btn"class="btn ">读取rss</button>
</form>
<div id="content"></div>
<script>
    (function(){
        function creatXmlhttp(){
            var xmlhttp = null;
            if(Window.ActiveXObject){
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }else{
                xmlhttp = new XMLHttpRequest();
            }
            return xmlhttp;
        }
        document.querySelector("button").onclick = function(){
            var url = document.querySelector("input").value;;
            var xmlhttp = creatXmlhttp();
            xmlhttp.open("get","/readrss.do?url="+url,true);
            xmlhttp.onreadystatechange = function(){
                if(xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        var xmldoc = xmlhttp.responseXML;
                        var items = xmldoc.getElementsByTagName("item");

                        for (var i = 0; i < items.length; i++) {
                            var title = items[i].getElementsByTagName("title")[0].childNodes[0].nodeValue;
                            var link = items[i].getElementsByTagName("link")[0].childNodes[0].nodeValue;
                            console.log(link)
                            var h3 = document.createElement("h3");
                            var a = document.createElement("a");


                            var titleText = document.createTextNode(title);

                            a.setAttribute("href", link);
                            a.appendChild(titleText);
                            h3.appendChild(a);
                            document.querySelector("#content").appendChild(h3);
                        }

                    } else {
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
