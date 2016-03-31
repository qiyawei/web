
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
</head>
<body>
    <button class="btn btn-success">读取xml</button>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>名称</th>
                <th>数量</th>
                <th>价格</th>
            </tr>
        </thead>
        <tbody id="container">

        </tbody>
    </table>
<script>
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
        document.querySelector("#container").innerHTML="";
        var xmlhttp = creatXmlhttp();
        xmlhttp.open("get","/read.xml",true);
        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState == 4){
                if(xmlhttp.status == 200){
                    var xmldoc = xmlhttp.responseXML;
                    var products = xmldoc.getElementsByTagName("product");

                    for(var i = 0;i<products.length;i++){

                        var product = products[i];
                        var id = product.getAttribute("id");
                        var name = product.getElementsByTagName("productName")[0].childNodes[0].nodeValue;
                        var price = product.getElementsByTagName("price")[0].childNodes[0].nodeValue;
                        var num = product.getElementsByTagName("num")[0].childNodes[0].nodeValue;
                        add(id,name,price,num);

                    }

                }else{
                    alert("服务器出错了")
                }
            }
        }

        xmlhttp.send();

        function add(id,name,price,num){
            var content = document.querySelector("#container");
            var tr = document.createElement("tr");
            var prodId = document.createElement("td");
            var prodName = document.createElement("td");
            var prodPrice = document.createElement("td");
            var prodNum = document.createElement("td");

            var idNode = document.createTextNode(id);
            var nameNode = document.createTextNode(name);
            var priceNode = document.createTextNode(price);
            var numNode = document.createTextNode(num);

            prodId.appendChild(idNode);
            prodName.appendChild(nameNode);
            prodNum.appendChild(numNode);
            prodPrice.appendChild(priceNode);

            tr.appendChild(prodId);
            tr.appendChild(prodName);
            tr.appendChild(prodNum);
            tr.appendChild(prodPrice);


            content.appendChild(tr);










        }
    }



</script>

















</body>
</html>
