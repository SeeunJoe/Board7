<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<style>
   input:not(input[type=submit]) { width:100%; }
   input[type=submit] { width : 100px; }
   #goList  { width : 80px; }
   
   td { 
      padding:10px;
      width: 700px;
      text-align: center;
   }
   td:nth-of-type(1) {
      width : 200px;
   }
   
   td:not([colspan]):first-child {
      background: black;
      color : white;
      font-weight: bold;
   }
   input[readonly]{
      background : #EEE;
   }
   
   textarea {
      height :300px;
      width : 100%; /*부모의 요소 받아서 100%로 받는다.*/
   }
  #content {
      height :300px;
      width : 100%; /*부모의 요소 받아서 100%로 받는다.*/
   }

   #table td:nth-child(3){
      background-color:black;
      color:white;
      border:solid 1px white;
   }
  #table{
  td{ text-align : center;
      padding : 10px;
   
      &:nth-of-type(1){width: 150px; 
                       border:solid 1px white;}
      &:nth-of-type(2){width: 250px;
                       text-align:left;}
      &:nth-of-type(3){width: 150px;
                       backgroud-color:black;}
      &:nth-of-type(4){width: 250px;
                       text-align : left;}  
      }
   tr:nth-of-type(5){ height:250px;
                      vertical-align : top;}
   }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
  <main>  
    
      <%@include file="/WEB-INF/include/menus.jsp" %> 

	<h2>게시글 내용 수정</h2>
	<form action="/Board/Update" method="POST">
	<input type="hidden" name="bno" value="${vo.bno}" />
	<table id="table">
	 <tr>
	   <td>메뉴</td>
	   <td colspan="3">${vo.menu_id}</td>
	 </tr>
	 <tr>
	   <td>제목</td>
	   <td colspan="3">
	     <input type=text name="title" value="${vo.title}">
	   </td>
	 </tr>
	 <tr>
	   <td>번호</td>
	   <td>${vo.bno}</td>
	   <td>조회수</td>
	   <td>${vo.hit}</td>
	 </tr>
	 <tr>
	   <td>작성자</td>
	   <td>${vo.writer}</td>
	   <td>작성일</td>
	   <td>${vo.regdate}</td>
	 </tr>
	 <tr>
	   <td>내용</td>
	   <td colspan="3">
	     <textarea name="content">${vo.content}</textarea>
	   </td>
	 </tr>
	 <tr>
	   <td colspan="4">
         <input class="btn btn-primary btn-sm" type="submit" value="수정"  />
         <a href="/Board/List?menu_id=${menu_id}" class="btn btn-primary btn-sm" >목록</a>
	   </td>
	 </tr>
	</table>	
	</form>   
	
  </main>
  
  <script>
  	const  goListEl  = document.getElementById('goList');
  	goListEl.addEventListener('click', function(e) {
  		location.href = '/Board/List?menu_id=${menu_id}';
  	})
  
  </script>
  
</body>
</html>





