<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
 
</head>
<body>

    <div id="review_write">
        <h4>리뷰 작성</h4>
            <div id="write_area">
                <form enctype="multipart/form-data" method="post">
                       <textarea name="title" id="idTitle" rows="1" cols="55" placeholder="제목" maxlength="100" required></textarea>
                    </div>
                    <div id="in_traveldate">
                        <textarea name="date" id="idDate" rows="1" cols="55" placeholder="여행기간" maxlength="100" required></textarea>
                    </div>
                    <div id="in_relationship">
                        <textarea name="realationship" id="idRelationship" rows="1" cols="55" placeholder="여행 동행자와의 관계" maxlength="100" required></textarea>
                    </div>
                    <div class="wi_line"></div>
                    <div id="in_content">
                        <textarea name="content" id="idContent" placeholder="내용" required></textarea>
           
 
 
                    <div class="bt_se">
                        <button type="submit">리뷰 등록하기</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </body>
</html>