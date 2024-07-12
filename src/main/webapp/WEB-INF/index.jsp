<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="/css/style.css">
		<script type="text/javascript" src="/js/app.js"></script>
		<title>Tagged Favorites</title>
	</head>
	<body>
		<div class="container">
            <div class="row">
                <h1 class="fw-bold my-3 text-primary">Tagged Favorites</h1>
                <p class="fst-italic">A website where users can list their favorite things so they can search for other things that have the same tags that they might enjoy, as well as find other people who share the same interests. <span class="fw-bold">Welcome!</span></p>
            </div>
            <div class="row"> 
                <div class="col">
                    <div class="card my-3 border-0 rounded-4 bg-dark-subtle bg-gradient shadow">
                        <div class="card-body">
                            <div class="card-title py-2">
                                <h2 class="text-center text-secondary">Registration</h2>
                            </div>
                            <form:form action="/register" method="post" modelAttribute="newRegister">
                                <div class="form-floating mb-3">
                                    <form:input path="userName" class="form-control" type="text" id="floatingInputUserName" placeholder="Username"/>
									<form:label path="userName" class="text-secondary" for="floatingInputUserName">Username</form:label>
									<form:errors path="userName" class="text-danger" />
                                </div>
                                <div class="form-floating mb-3">
									<form:input path="email" class="form-control" type="text" id="floatingInputEmail" placeholder="Email" />
									<form:label path="email" class="text-secondary" for="floatingInputEmail">Email</form:label>
									<form:errors path="email" class="text-danger" />
                                </div>
                                <div class="card border-0  mb-3 p-3 border bg-secondary-subtle bg-gradient rounded-3 ">
                                    <div class="form-floating mb-3">
										<form:input path="password" class="form-control" type="password" id="floatingInputPassword" placeholder="Password" />
										<form:label path="password" class="text-secondary" for="floatingInputPassword">Password</form:label>
										<form:errors path="password" class="text-danger" />
                                    </div>
                                    <div class="form-floating">
										<form:input path="confirm" class="form-control" type="password" id="floatingInputConfirm" placeholder="Confirmation Password" />
										<form:label path="confirm" class="text-secondary" for="floatingInputConfirm">Confirmation Password</form:label>
										<form:errors path="confirm" class="text-danger" />
                                    </div>
                                </div>
                                <br />
								<div class="d-flex justify-content-end gap-2">
									<a class="btn btn-secondary shadow" href="<c:out value="/"/>">Reset</a>
									<input type="submit" class="btn btn-primary shadow" value="Register" />
								</div>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card my-3 border-0 rounded-4 bg-dark-subtle bg-gradient shadow">
                        <div class="card-body">
                            <div class="card-title py-2">
                                <h2 class="text-center text-secondary">Log-in</h2>
                            </div>
                            <form:form action="/login" method="post" modelAttribute="newLogin">
                                <div class="form-floating mb-3">
									<form:input path="email" class="form-control" type="text" id="floatingInputEmail" placeholder="Email" />
									<form:label path="email" class="text-secondary" for="floatingInputEmail">Email</form:label>
									<form:errors path="email" class="text-danger" />
                                </div>
								<div class="form-floating">
									<form:input path="password" class="form-control" type="password" id="floatingInputPassword" placeholder="Password" />
									<form:label path="password" class="text-secondary" for="floatingInputPassword">Password</form:label>
									<form:errors path="password" class="text-danger" />
								</div>
								<br />
								<div class="d-flex justify-content-end gap-2">
									<a class="btn btn-secondary shadow" href="<c:out value="/"/>">Reset</a>
									<input type="submit" class="btn btn-primary shadow" value="Log in" />
								</div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>
