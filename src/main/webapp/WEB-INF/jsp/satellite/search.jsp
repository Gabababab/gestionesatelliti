<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="it" class="h-100" >
	 <head>
	 
	 	<!-- Common imports in pages -->
	 	<jsp:include page="../header.jsp" />
	   
	   <title>Ricerca</title>
	 </head>
	   <body class="d-flex flex-column h-100">
	   
	   		<!-- Fixed navbar -->
	   		<jsp:include page="../navbar.jsp"></jsp:include>
	    
			
			<!-- Begin page content -->
			<main class="flex-shrink-0">
			  <div class="container">
			  
			  		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }" role="alert">
					  ${errorMessage}
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
					</div>
			  
			  <div class='card'>
				    <div class='card-header'>
				        <h5>Ricerca elementi</h5> 
				    </div>
				    <div class='card-body'>
		
							<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>
		
		
							<form method="post" action="${pageContext.request.contextPath}/satellite/list" class="row g-3" >
							
							
								<div class="col-md-6">
									<label for="nome" class="form-label">Denominazione <span class="text-danger">*</span></label>
									<input type="text" name="denominazione" id="denominazione" class="form-control" placeholder="Inserire il nome"  >
								</div>
								
								<div class="col-md-6">
									<label for="cognome" class="form-label">Codice <span class="text-danger">*</span></label>
									<input type="text" name="codice" id="codice" class="form-control" placeholder="Inserire il codice"  >
								</div>
							
								<div class="col-md-6">
									<label for="matricola" class="form-label">Nickname <span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="matricola" id="matricola" placeholder="Inserire la matricola"  >
								</div>
								
								<div class="col-md-3">
									<label for="dataDiNascita" class="form-label">Data di Lancio <span class="text-danger">*</span></label>
                        			<input class="form-control" id="dataLancio" type="date" placeholder="dd/MM/yy"
                            			title="formato : gg/mm/aaaa"  name="dataLancio"   >
								</div>
																<div class="col-md-3">
									<label for="dataDiNascita" class="form-label">Data di Rientro <span class="text-danger">*</span></label>
                        			<input class="form-control" id="dataRientro" type="date" placeholder="dd/MM/yy"
                            			title="formato : gg/mm/aaaa"  name="dataRientro"   >
								</div>
								
								<div class="col-md-3">
									<label for="stato" class="form-label">Stato <span class="text-danger">*</span></label>
								    <select class="form-select" id="stato" name="stato" >
								    	<option value="" selected> - Selezionare - </option>
								      	<option value="MOVIMENTO" >IN MOVIMENTO</option>
								      	<option value="FISSO" >FISSO</option>
								      	<option value="DISATTIVATO" >DISATTIVATO</option>
								    </select>
								</div>
								
								
							<div class="col-12">
								<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
								<a class="btn btn-outline-primary ml-2" href="${pageContext.request.contextPath}/satellite/insert">Add New</a>
								<input class="btn btn-outline-warning" type="reset" value="Ripulisci">
							</div>
							
							<div class="col-12">
								<a>Ricerca i satelliti lanciati da piu di due anni non disattivati</a>
								<a class="btn btn-outline-primary ml-2" href="${pageContext.request.contextPath}/satellite/listByNonDisattivatiDaDueAnni">Ricerca</a>
							</div>
							<div class="col-12">
								<a>Ricerca i satelliti disattivati non rientrati</a>
								<a class="btn btn-outline-primary ml-2" href="${pageContext.request.contextPath}/satellite/listByDisattivatiNonRientrati">Ricerca</a>
							</div>
							<div class="col-12">
								<a>Ricerca i satelliti fissi in orbita da dieci anni</a>
								<a class="btn btn-outline-primary ml-2" href="${pageContext.request.contextPath}/satellite/listByFissiInOrbitaDaDieciAnni">Ricerca</a>
							</div>
		
						</form>
  
				    
				    
					<!-- end card-body -->			   
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