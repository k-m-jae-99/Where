<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Where</title>
    <!--jQuery, bootstrap, 개인css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	
    <!--summernote css/js-->
    <link href="../css/summernote-lite.css?" rel="stylesheet">
    <script src="../js/summernote-lite.js"></script>
    <script src="../js/summernote-ko-KR.js"></script>
    
</head>
<body>
<textarea id="summernote" name="content"></textarea>
<script>
    // 메인화면 페이지 로드 함수
    $(document).ready(function () {
        $('#summernote').summernote({
            placeholder: '내용을 작성하세요',
            width: '100%',
            height: '400',
            maxHeight: '400',
            lang : 'ko-KR'
        });
    });
</script>

</body>
</html>