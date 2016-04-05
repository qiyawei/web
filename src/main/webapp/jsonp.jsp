
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<script>
  function abc(data){
    alert("jsonp" + data.name)
  }

</script>
<script src="/jsonp.js?callback=abc"></script>
</body>
</html>
