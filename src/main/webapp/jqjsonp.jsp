
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
  <form class="form-inline">
    <input type="text" id="word"/>
    <button type="button" id="wordbtn"class="btn ">查询</button>
  </form>
  <div id="result"></div>
</div>
<script src="/static/js/jquery-1.12.2.min.js"></script>
<script>
   $("#wordbtn").click(function(){
      var word = $("#word").val();
      var result = $("#result");
      result.html("");
      //alert(111)
      var url = "http://fanyi.youdao.com/openapi.do?keyfrom=kaishengit&key=1587754017&type=data&doctype=jsonp&callback=?&version=1.1&q="+word;
      $.getJSON(url,function(data){
        var json = data.basic.explains;
        for (var i = 0; i < json.length; i++) {
          result.append("<h4>" + json[i] + "</h4>");
        }
      });
  })

</script>
</body>
</html>
