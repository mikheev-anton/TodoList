<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang=ru>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <c:if test="${empty target.title}">
        <title>Новая задачи</title>
    </c:if>
    <c:if test="${!empty target.title}">
        <title>Редактирование задачи: ${target.id}</title>
    </c:if>
    <style>
        @import url(http://fonts.googleapis.com/css?family=Open+Sans:400,300,700&subset=latin,cyrillic);
        body{
            background-color:#f0f0f0;
            font-family: 'Open Sans', sans-serif;
            padding-top:100px;
        }
        p{
            color:rgba(0,0,0,.7);
            width:100%;
            margin: 100px auto;
            font-weight:300;
            text-align:center;
        }

        a{
            text-decoration:none;
            color:#0079f2;
        }
        .container{
            max-width: 32em;
            margin: 0 auto;
            padding: 1.2em;
        }

        /* Базовые стили формы */
        form{
            margin:0 auto;
            max-width:95%;
            box-sizing:border-box;
            padding:40px;
            border-radius:10px;
            background:RGBA(255,255,255,1);
            -webkit-box-shadow:  0px 0px 15px 0px rgba(0, 0, 0, .45);
            box-shadow:  0px 0px 15px 0px rgba(0, 0, 0, .45);
        }
        /* Стили полей ввода */
        .textbox{
            height:50px;
            width:100%;
            border-radius:10px;
            border:rgba(0,0,0,.3) 2px solid;
            box-sizing:border-box;
            font-family: 'Open Sans', sans-serif;
            font-size:18px;
            padding:10px;
            margin-bottom:30px;
        }
        .message:focus,
        .textbox:focus{
            outline:none;
            border:rgba(24,149,215,1) 2px solid;
            color:rgba(24,149,215,1);
        }
        /* Стили текстового поля */
        .message{
            background: rgba(255, 255, 255, 0.4);
            width:100%;
            height: 120px;
            border:rgba(0,0,0,.3) 2px solid;
            box-sizing:border-box;
            -moz-border-radius: 3px;
            font-size:18px;
            font-family: 'Open Sans', sans-serif;
            -webkit-border-radius: 3px;
            border-radius: 10px;
            display:block;
            padding:10px;
            margin-bottom:30px;
            overflow:hidden;
        }
        /* Базовые стили кнопки */
        .button{
            height:50px;
            width:100%;
            border-radius:10px;
            border:rgba(0,0,0,.3) 0px solid;
            box-sizing:border-box;
            padding:10px;
            color:#FFF;
            background-color: #337ab7;
            border-color: #2e6da4;
            font-family: 'Open Sans', sans-serif;
            font-weight:400;
            font-size: 16pt;
            transition:background .4s;
            cursor:pointer;
        }
        /* Изменение фона кнопки при наведении */
        .button:hover{
            background:#2e6da4;
        }
    </style>
</head>
<body>
<div class="container">
        <form:form action="/add" modelAttribute="target" method="post">
            <form:input path="date" class ="textbox" type="date" placeholder="Выполнить до:" required="required"/>
            <form:textarea path="title" rows="4" cols="50" accept-charset="utf-8" name="subject" type="text" placeholder="Введите задачу:" class="message" required="required"/>
            <c:if test="${empty target.title}">
                <input name="submit" class="button" charset="utf-8" type="submit" value="Добавить" />
            </c:if>
            <c:if test="${!empty target.title}">
                <input name="submit" class="button"  type="submit" value="Редактировать" />
            </c:if>
        </form:form>
</div>
</body>
</html>
