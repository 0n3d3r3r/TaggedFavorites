<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<!-- <link rel="stylesheet" type="text/css" href="/css/style.css">
		<script type="text/javascript" src="/js/app.js"></script> -->
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
							<h3><c:out value="Game Matches for game: ${favorite.name}"></c:out></h3>
						</div>
						<div class="col gap-2 d-flex justify-content-end">
							<a class="btn btn-secondary shadow" href="/taggedfavorites/home">Go back to Favorites</a>
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
								<th scope="col">Matching Tags</th>
								<th scope="col">Match</th>
							</tr>
						</thead>
						<tbody class="table-group-divider align-middle">							
							<c:forEach var="game" items="${matches}">
        						<tr>
									<td><a href="<c:out value="/games/${game.id}"/>">${game.name}</a></td>
									<td>
		        						<ul class="list-group">
			        						<c:set var="total" value="0" />
			        						<c:set var="coincidences" value="${0}" />
			        						<c:forEach var="item1" items="${favorite.tags}">
			     								<c:set var="total" value="${total + 1}" />
			            						<c:forEach var="item2" items="${game.tags}">
			                						<c:if test="${item1.name == item2.name}">
			                    						<c:set var="coincidences" value="${coincidences + 1}" />
			                    						<c:set var="lastTag" value="${item1.name}" />
			                    						<li class="list-group-item mx-auto" style="font-size: 12px;">${item1.name}</li>
			                						</c:if>
			            						</c:forEach>			                					
			        						</c:forEach>
			        					</ul>
		        					</td>
		        					<td>
		        						<c:set var="matchPercentage" value="${coincidences * 100 / total}" />
		    							<p><fmt:formatNumber value="${matchPercentage}" type="number" maxFractionDigits="2" />%</p>
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
