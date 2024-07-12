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
							<h3><c:out value="${user.userName}"></c:out>'s list of favorite Games</h3>
						</div>
						<div class="col gap-2 d-flex justify-content-end">
							<a class="btn btn-success shadow" href="/taggedfavorites/games/create">Add a game</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col gap-2 d-flex flex-column justify-content-center">
					<table class="table table-striped text-center">
						<thead class="table-dark">
							<tr>
								<th scope="col">Title</th>
								<th scope="col">Category</th>
								<th scope="col">Status</th>
								<th scope="col">Matching Tags</th>
								<th scope="col">Actions</th>
							</tr>
						</thead>
						<tbody class="table-group-divider align-middle">
							<c:forEach var="game" items="${user.favorites}">
								<tr>
									<td><a href="<c:out value="/games/${game.id}"/>">${game.name}</a></td>
									<td><c:out value="${game.category}"></c:out></td>
									<td><c:out value="${game.status}"></c:out></td>
									<td>
										<ul class="list-group">
											<c:forEach var="tag" items="${game.tags}">
												<li class="list-group-item mx-auto" style="font-size: 12px;">${tag.name}</li>
											</c:forEach>
										</ul>
									</td>
									<td>
										<div class="d-flex flex-column gap-2">
											<a class="btn btn-primary shadow mx-auto" href="/taggedfavorites/<c:out value="${game.id}"></c:out>/matches">See Matches!</a>
											<a class="btn btn-warning shadow mx-auto" href="/taggedfavorites/<c:out value="${game.id}"></c:out>/edit">Edit</a>
											<a class="btn btn-danger shadow mx-auto" href="/taggedfavorites/<c:out value="${game.id}"></c:out>/delete">Remove</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>		
	</body>
</html>
