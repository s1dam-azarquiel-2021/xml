<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output
		method="html" encoding="utf-8"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:key name="partidos-por-fecha" match="partido" use="@fecha"/>
	<xsl:template match="/">
		<xsl:variable name="lowercase">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="uppercase">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
		<xsl:variable name="dev-w">width=device-width</xsl:variable>
		<xsl:variable name="usr-s">user-scalable=no</xsl:variable>
		<xsl:variable name="ini-s">initial-scale=1.0</xsl:variable>
		<xsl:variable name="max-s">maximum-scale=1.0</xsl:variable>
		<xsl:variable name="min-s">minimum-scale=1.0</xsl:variable>
		<xsl:variable name="b-cdn"> https://cdn.jsdelivr.net/npm</xsl:variable>
		<xsl:variable name="b-ver">5.1.3</xsl:variable>
		<xsl:variable name="b-css-sha">sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3</xsl:variable>
		<xsl:variable name="b-js-sha">sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p</xsl:variable>
		<html lang="en">
			<head>
				<a name="top"></a>
				<meta charset="UTF-8" />
				<meta
					name="viewport"
					content="{$dev-w}, {$usr-s}, {$ini-s}, {$max-s}, {$min-s}" />
				<link
					rel="stylesheet"
					href="{$b-cdn}/bootstrap@{$b-ver}/dist/css/bootstrap.min.css"
					integrity="{$b-css-sha}"
					crossorigin="anonymous" />
				<link href="./renfe.css" rel="stylesheet" />
				<title>Renfe</title>
			</head>
			<body>
				<div class="navbar navbar-expand-md navbar-dark bg-success">
					<div class="container-fluid">
						<a class="navbar-brand" href="#">
							<img class="img-fluid d-inline-block" width="100px" alt="Renfe" src="./img/renfe.png" />
							<xsl:value-of select="renfe/@localidad"></xsl:value-of>
						</a>
						<button
							class="navbar-toggler"
							type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent"
							aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item">
									<a class="nav-link active" aria-current="page" href="#entradas-salidas">Entradas y salidas</a>
								</li>
								<li class="nav-item">
									<a class="nav-link active" aria-current="page" href="#estaciones">Estaciones</a>
								</li>
								<li class="nav-item">
									<a class="nav-link active" aria-current="page" href="#trenes">Trenes</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="container mt-5">
					<div class="accordion" id="entradas-salidas">
						<div class="d-flex justify-content-center gap-2">
							<h2 class="accordion-header" id="heading-entradas">
								<button
									class="accordion-button rounded-pill py-2 px-3"
									type="button"
									data-bs-toggle="collapse"
									data-bs-target="#entradas"
									aria-expanded="true"
									aria-controls="entradas">
									Entradas
								</button>
							</h2>
							<h2 class="accordion-header" id="heading-salidas">
								<button
									class="accordion-button collapsed rounded-pill py-2 px-3"
									type="button"
									data-bs-toggle="collapse"
									data-bs-target="#salidas"
									aria-expanded="false"
									aria-controls="salidas">
									Salidas
								</button>
							</h2>
						</div>
						<div class="mt-2">
							<div class="accordion-item border-0">
								<div
									id="entradas"
									class="accordion-collapse collapse show"
									aria-labelledby="heading-entradas"
									data-bs-parent="#entradas-salidas">
									<table class="table table-success table-striped accordion-body">
										<thead>
											<tr>
												<th scope="col">Hora</th>
												<th scope="col">Origen</th>
												<th scope="col">Tren</th>
												<th scope="col">Via</th>
											</tr>
										</thead>
										<tbody>
											<xsl:for-each select="renfe/entradas/entrada">
												<xsl:sort select="hora" order="ascending"></xsl:sort>
												<tr>
													<td scope="row">
														<xsl:value-of select="hora"></xsl:value-of>
													</td>
													<td>
														<xsl:value-of select="/renfe/estaciones/estacion[@idEstacion = current()/@origen]/@nombre"></xsl:value-of>
													</td>
													<td>
														<xsl:variable name="tren" select="/renfe/trenes/tren[@idTren = current()/@tren]" />
														<div class="d-flex gap-2">
															<p class="border border-2 border-primary rounded-pill px-2 m-0">
																<xsl:value-of select="substring(@tren,2)"></xsl:value-of>
															</p>
															<xsl:for-each select="$tren/*">
																<p class="border border-2 border-success rounded-pill px-2 m-0">
																	<xsl:value-of select="name(.)"></xsl:value-of>
																</p>
															</xsl:for-each>
														</div>
													</td>
													<td>
														<xsl:value-of select="via"></xsl:value-of>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</div>
							</div>
							<div class="accordion-item border-0">
								<div
									id="salidas"
									class="accordion-collapse collapse"
									aria-labelledby="heading-salidas"
									data-bs-parent="#entradas-salidas">
									<table class="table table-success table-striped accordion-body">
										<thead>
											<tr>
												<th scope="col">Hora</th>
												<th scope="col">Destino</th>
												<th scope="col">Tren</th>
												<th scope="col">Via</th>
											</tr>
										</thead>
										<tbody>
											<xsl:for-each select="renfe/salidas/salida">
												<xsl:sort select="hora" order="ascending"></xsl:sort>
												<tr>
													<td scope="row">
														<xsl:value-of select="hora"></xsl:value-of>
													</td>
													<td>
														<xsl:value-of select="/renfe/estaciones/estacion[@idEstacion = current()/@destino]/@nombre"></xsl:value-of>
													</td>
													<td>
														<xsl:variable name="tren" select="/renfe/trenes/tren[@idTren = current()/@tren]" />
														<div class="d-flex flex-wrap gap-2">
															<p class="border border-2 border-primary rounded-pill px-2 m-0">
																<xsl:value-of select="substring(@tren,2)"></xsl:value-of>
															</p>
															<xsl:for-each select="$tren/*">
																<p class="border border-2 border-success rounded-pill px-2 m-0">
																	<xsl:value-of select="name(.)"></xsl:value-of>
																</p>
															</xsl:for-each>
														</div>
													</td>
													<td>
														<xsl:value-of select="via"></xsl:value-of>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div id="estaciones" class="mt-5">
						<h1>Estaciones</h1>
						<div class="row row-cols-lg-4 row-cols-md-3 row-cols-sm-2 row-cols-1">
							<xsl:for-each select="renfe/estaciones/estacion">
								<div class="col mb-2">
									<div class="card h-100 text-white bg-success">
										<img alt="Imagen estacion" src="{imagen}" class="card-img-top" />
										<div class="card-body d-flex flex-column-reverse">
											<div class="card-title">
												<xsl:value-of select="@nombre"></xsl:value-of>
											</div>
										</div>
									</div>
								</div>
							</xsl:for-each>
						</div>
					</div>
					<div id="trenes" class="mt-5">
						<h1>Trenes</h1>
						<div class="row row-cols-lg-4 row-cols-md-3 row-cols-sm-2 row-cols-1">
							<xsl:for-each select="renfe/trenes/tren">
								<div class="col mb-2">
									<div class="card h-100 text-white bg-success">
										<div class="card-body">
											<div class="card-title d-flex gap-2 m-0">
												<p class="border border-2 border-primary rounded-pill px-2 m-0">
													<xsl:value-of select="substring(@idTren,2)"></xsl:value-of>
												</p>
												<xsl:for-each select="./*">
													<p class="border border-2 border-success-light rounded-pill px-2 m-0">
														<xsl:value-of select="name(.)"></xsl:value-of>
													</p>
												</xsl:for-each>
											</div>
										</div>
									</div>
								</div>
							</xsl:for-each>
						</div>
					</div>
				</div>
				<!-- Cosas a importar -->
				<script
					src="{$b-cdn}/bootstrap@{$b-ver}/dist/js/bootstrap.bundle.min.js"
					integrity="{$b-js-sha}"
					crossorigin="anonymous"></script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
