
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="static/css/bootstrap.css"/>
</head>
<body>
<div class="container">
  <form class="form-inline">
    <input type="text" id="word"/>
    <button type="button" id="wordbtn"class="btn ">查询</button>
  </form>
  <div id="result"></div>
  <form class="form-inline">
      <input type="text" id="url"/>
      <button type="button" id="btn"class="btn ">读取rss</button>
  </form>
<div id="content"></div>

    
</div>

<script src="static/js/jquery-1.12.2.min.js"></script>
<script>
  $(function(){
    $("#btn").click(function(){
      alert(111)
      var $content = $("#content");
      $content.html("");
      var url = $("#url").val();
      $.ajax({
        url:"/readrss.do",
        data:{"url":url},
        success:function(data){
          $(data).find("item").each(function(){
            var title = $(this).find("title").text();
            var link = $(this).find("link").text();
            console.log(title)
            var html = "<h3><a href='"+link+"'>"+title+"</a></h3>"
            $content.append(html)
          });
        },
        beforeSend:function(){
          $("#btn").text("读取中")
        },
        error:function(){
          alert("请求异常")
        },
        complete:function(){
          $("#btn").text("button")
        }
      })


   /*  $.get("/readrss.do",{"url":url},function(data){
          $(data).find("item").each(function(){
            var title = $(this).find("title").text();
            var link = $(this).find("link").text();
            var html = "<h3><a href='"+link+"'>"+title+"</a></h3>"
            $content.append(html)
          });
      })*/
    });
    $("#wordbtn").click(function(){

       var word = $("#word").val();
       var result = $("#result");
       result.html("");
       $.get("/cidian.do",{"word":word}).done(function(data){
         var json = data.basic.explains;
         for (var i = 0; i < json.length; i++) {
           result.append("<h4>" + json[i] + "</h4>");
         }
       }).fail(function(){
         alert("查询异常")
       })
    });

  });
</script>
</body>
</html>
