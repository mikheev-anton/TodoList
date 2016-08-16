<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fonm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>TodoList</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<spring:url value="/resources/core/css/hello.css" var="coreCss" />
	<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
	<spring:url value="/resources/core/css/style.css" var="style" />
	<link href="${bootstrapCss}" rel="stylesheet" />
	<link rel="stylesheet" href="${style}">
	<link href="${coreCss}" rel="stylesheet" />
</head>
<div class="jumbotron">
  <div class="container">
	<p>
		<c:if test="${empty getAll}">
	  		<h3>
			  У вас нет дел? Пора добавлять!
		  	</h3>
		</c:if>
		<c:if test="${!empty getAll}">
			<h3>
				Дела не ждут!
			</h3>
		</c:if>
    </p>
	  <p>
		  <a class="btn btn-primary btn-lg" href="/save" role="button">Добавить задачу</a>
	  <p/>
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
			  <p>${target.title}</p>
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
						  img {  width: 5.5%;  }
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
	<p>Mikheev 2016</p>
  </footer>
</div>
 
<spring:url value="/resources/core/css/hello.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />
 
</body>
</html>