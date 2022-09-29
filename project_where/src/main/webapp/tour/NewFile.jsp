<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<title>Page Title</title>
<style>
* {
  margin: 0;
  padding: 0;
}

/*Keyframes*/
@keyframes rain_effect {
0% {background-position: 0px 0px, 0px 0px, 0px 0px;}
50% {background-position: 400px 800px, 300px 300px, 200px 200px; background-color: #FF69B4}
100% {background-position: 0px 0px, 0px 0px, 0px 0px; background-color: #F8C8DC}
}

@-moz-keyframes rain_effect {
0% {background-position: 0px 0px, 0px 0px, 0px 0px;}
50% {background-position: 400px 800px, 300px 300px, 200px 200px; background-color: #FF69B4}
100% {background-position: 0px 0px, 0px 0px, 0px 0px; background-color: #F8C8DC}
}

@-webkit-keyframes rain_effect {
0% {background-position: 0px 0px, 0px 0px, 0px 0px;}
50% {background-position: 400px 800px, 300px 300px, 200px 200px; background-color: #FF69B4}
100% {background-position: 0px 0px, 0px 0px, 0px 0px; background-color: #F8C8DC}
}

@-ms-keyframes rain_effect {
0% {background-position: 0px 0px, 0px 0px, 0px 0px;}
50% {background-position: 400px 800px, 300px 300px, 200px 200px; background-color: #FF69B4}
100% {background-position: 0px 0px, 0px 0px, 0px 0px; background-color: #F8C8DC}
}


body {
	background-color: #F8C8DC; 
	background-image: url('../img/a.png'), url('../img/aa.png');
	animation: rain_effect 40s linear infinite;
	-webkit-animation: rain_effect 40s linear infinite;
	-moz-animation: rain_effect 40s linear infinite;
	-ms-animation: rain_effect 40s linear infinite;
}

.my_text {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100vh;
    justify-content: center;
    color: #fff;
}

</style>
</head>
<body>

<div class="my_text">
</div>

</body>
</html>
