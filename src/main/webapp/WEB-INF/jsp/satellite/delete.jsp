<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Rimuovi Elemento</title>

</head>
<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div class='card'>
				<div class='card-header'>
					<h5>Conferma rimozione</h5>
				</div>


				 <div class='card-body'>
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Id:</dt>
							  <dd class="col-sm-9">${delete_satellite_attr.id}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Denominazione:</dt>
							  <dd class="col-sm-9">${delete_satellite_attr.denominazione}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Codice:</dt>
							  <dd class="col-sm-9">${delete_satellite_attr.codice}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Data di Lancio:</dt>
							  <dd class="col-sm-9"><fmt:formatDate type="date" value = "${delete_satellite_attr.dataLancio}" /></dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Data di Rientro:</dt>
							  
							  <c:choose>
								  <c:when test="${show_satellite_attr.dataRientro}!=null">
								  	<dd class="col-sm-9"><fmt:formatDate type="date" value = "${show_satellite_attr.dataRientro}" /></dd>
								  </c:when>
								  <c:otherwise>
								  	<dd class="col-sm-9">Non ancora rientrato</dd>
								  </c:otherwise>
							  </c:choose>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Stato :</dt>
							  <dd class="col-sm-9">${delete_satellite_attr.stato}</dd>
					    	</dl>
					    	
					    	
					    </div>
				<!-- end card body -->

				<div class='card-footer'>
				
					<form
						action="${pageContext.request.contextPath}/satellite/delete/${delete_satellite_attr.id}"
						method="post">
						
						<input type="hidden" name="idSatellite"
							value="${delete_satellite_attr.id}">
						<button type="submit" name="submit" id="submit"
							class="btn btn-danger">Conferma</button>
					</form>
					
					</a> <a href="${pageContext.request.contextPath}/impiegato"
						class='btn btn-outline-secondary' style='width: 80px'> <i
						class='fa fa-chevron-left'></i> Back
					</a>
				</div>
				<!-- end card -->
			</div>


			<!-- end container -->
		</div>

	</main>

	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>