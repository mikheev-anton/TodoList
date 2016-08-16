<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fonm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TodoList</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
	<link href="${bootstrapCss}" rel="stylesheet" />
</head>
<div class="jumbotron">
  <div class="container">
	  <p>
		  <a class="btn btn-primary btn-lg" href="/save" role="button">Добавить задачу</a>
	  <p/>
	  <style>
		  *, *:before, *:after {
			  box-sizing: border-box;
			  padding: 0%;
			  margin: 0%;
			  font-family: 'Lato', sans-serif;
		  }

		  nav {
			  border-radius: 10px;
			  position:absolute;
			  top: 16%;
			  right: 2%;
			  width: 35%;
		  }
	  </style>
	  <nav role="navigation">
		  <ul>
			  <a  class="btn btn-success" href="/" role="button">Все дела</a>
			  <a  class="btn btn-success" href="/sort/1" role="button">Выполненные</a>
			  <a  class="btn btn-success" href="/sort/0" role="button">Невыполненные</a>
		  </ul>
	  </nav>
	</div>
</div>
 
<div class="container">
 
  <div class="row">
	  <c:if test="${!empty getAll}">
		  <c:forEach items="${getAll}" var="target">
		  <div class="col-md-4">
			  <h4>${target.date}</h4>
			  <p style= "word-wrap:break-word;">${target.title}</p>
			  <p>
				  <a class="btn btn-primary btn-xs" href="<c:url value='/edit/${target.id}'/>" role="button">
					  Редактировать
				  </a>
				  <a class="btn btn-danger btn-xs" href="<c:url value='/remove/${target.id}'/>" role="button">Удалить</a>
				  <c:if test="${target.status eq 0}">
					  <a class="btn btn-default btn-xs" href="<c:url value='/done/${target.id}'/>" role="button">
						  Выполнить
					  </a>
				  </c:if>
				  <c:if test="${target.status eq 1}">
					  <style>
						  img {  width: 5.7%;  }
					  </style>
					  <img src="/resources/core/ok.png">
				  </c:if>
			  </p>
		  </div>
		  </c:forEach>
	  </c:if>
	</div>
</div>
 
 
  <hr>
  <footer>
	<p class="text">Mikheev 2016</p>
  </footer>
</div>
</body>
</html>