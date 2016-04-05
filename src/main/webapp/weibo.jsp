
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
  <h4><a href="javascript:;" id="msgHelp"></a></h4>
  <div class="messages">

  </div>
  <script  type="text/x-template" id="msgTemplate">
    {{#each data}}
      <h4>{{mwssage}}</h4>
    {{else}}
      <h4>当前没有更新</h4>
    {{/each}}
  </script>
</div>
<script src="static/js/jquery-1.12.2.min.js"></script>
<script src="static/js/handlebars-v4.0.5.js"></script>
<script>
  var maxId = 0;
  var jsondata = null;
  setInterval(function(){
    loadServer(function(json){
      if(json.data.length){
        $("#msgHelp").text("有"+json.data.length+"条新微博");
        jsondata = json;
      }

    })
  });
  $("#msgHelp").click(function(){
    if(jsondata){
      maxId = jsondata.data[0].id;
      var source = $("#msgTemplate").html();
      var template = Handlebars.compile(source)
      var html = template(jsondata)
      $(".messages").prepend(html);
      $("#msgHelp").text("");
    }
  });






  function loadServer(fn){
    $.get("/weibo.do",{"maxId":maxid}).done(function(json){
       fn(json);
    }).fail(function(){
      alert("服务器出错了")
    })
  }


  loadServer(function(json){

    if(json.data.length){
      var source = $("#msgTemplate").html();
      var template = Handlebars.compile(source)
      var html = template(json)
      $(".messages").append(html);
      maxId = json.data[0].id;
    }

  });




</script>





</body>
</html>
