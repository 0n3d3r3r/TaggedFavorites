<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="my-4">
					<div class="row">
						<div class="col d-flex justify-content-start">
							<h1 class="fst-italic" style="color: crimson">Tagged Favorites</h1>
						</div>
						<div class="col gap-2 d-flex align-items-center justify-content-end">
							<a class="btn btn-secondary shadow" href="/logout">Logout</a>
						</div>
					</div>
					<div class="row">
						<div class="col d-flex justify-content-start">
							<h3>Add a Game to <c:out value="${user.userName}"></c:out>'s Favorites</h3>
						</div>
						<div class="col gap-2 d-flex justify-content-end">
							<a class="btn btn-success shadow" href="/taggedfavorites/home">Go back to Favorites</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col col-5 gap-2 d-flex flex-column justify-content-center">
					<div class="card p-3 border-0 rounded-4 bg-success-subtle bg-gradient shadow">
						<form:form action="/taggedfavorites/games/create" method="post" modelAttribute="newMedia">
							<div class="form-floating mb-3">
								<form:input path="name" class="form-control" type="text" id="floatingInputName" placeholder="Title" />
								<form:label path="name" class="text-secondary" for="floatingInputName">Title</form:label>
								<form:errors path="name" class="text-danger" />
							</div>
							<div class="form-floating mb-3">
								<form:input path="category" class="form-control" type="text" id="floatingInputCategory" placeholder="Category" />
								<form:label path="category" class="text-secondary" for="floatingInputCategory">Category</form:label>
								<form:errors path="category" class="text-danger" />
							</div>
							<div class="form-floating mb-3">
								<form:input path="status" class="form-control" type="text" id="floatingInputStatus" placeholder="Status" />
								<form:label path="status" class="text-secondary" for="floatingInputStatus">Status</form:label>
								<form:errors path="status" class="text-danger" />
							</div>
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<p>This is where the Tag lists will be later...</p>
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<div class="d-flex justify-content-end gap-2">
								<a class="btn btn-secondary shadow" href="<c:out value="/taggedfavorites/games/create"/>">Reset</a>
								<input type="submit" class="btn btn-success shadow" value="Add game" />
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>
