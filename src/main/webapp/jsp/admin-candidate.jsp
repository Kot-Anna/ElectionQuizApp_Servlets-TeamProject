<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="data.Candidate"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ include file="../jsp/session.jsp" %>

<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/jsp/style.css" />
<title>Admin Candidate</title>
</head>
<body>
	<%@ include file="/jsp/dynamic-nav.jsp" %>

	<div class="admin-pages container flex-container">
		<div class="card">
			<div class="admin-header">
				<h1 class="title">Candidates</h1>
				<div class="underline"></div>
				<div class="admin btn-wrapper">
					<a href="/jsp/admin-dashboard.jsp" class="btn btn-thin">Back</a> <a
						href="/jsp/add-candidate.jsp" class="btn btn-thin">Add
						Candidate</a>
				</div>
			</div>
			<div class="admin-content">

				<c:forEach var="candidate" items="${requestScope.candidatelist}">
					<div class="can-card">
						<a href="/ShowProfile?id=${candidate.id}">
							<div class="img-wrap">
								<img src="${candidate.profile_pic}" alt="candidate" />
							</div>
						</a>
						<div class="can-content">
							<div class="can-name-info can-name-info-flex">
								<a href="/ShowProfile?id=${candidate.id}">
									<h3>${candidate.fname} ${candidate.lname}</h3>
								</a>

								<h4>
									<span class="age">Age :</span> ${candidate.age}
								</h4>
								<h4>
									<i class="fas fa-map-marker"></i> ${candidate.city}
								</h4>
								<div class="edit-buttons">
									<a href="/readToUpdateCan?id=${candidate.id}" class="edit-btn">
										<i class="fas fa-pen"></i>
									</a> <a href="/deleteCan?id=${candidate.id}" class="delete-btn">
										<i class="fas fa-trash-alt"></i>
									</a>
								</div>
							</div>

							<div class="party admin-can-party">${candidate.political_party}</div>

							<div class="short-about"><c:set var = "string2" value = "${fn:substring(candidate.about, 0, 201)}" />
								${string2}...</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</body>
</html>
