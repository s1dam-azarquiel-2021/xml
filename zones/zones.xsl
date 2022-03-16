<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output
		method="html" encoding="utf-8"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<xsl:variable name="dev-w">width=device-width</xsl:variable>
		<xsl:variable name="usr-s">user-scalable=no</xsl:variable>
		<xsl:variable name="ini-s">initial-scale=1.0</xsl:variable>
		<xsl:variable name="max-s">maximum-scale=1.0</xsl:variable>
		<xsl:variable name="min-s">minimum-scale=1.0</xsl:variable>
		<xsl:variable name="b-cdn"> https://stackpath.bootstrapcdn.com/bootstrap</xsl:variable>
		<xsl:variable name="b-ver">4.3.1</xsl:variable>
		<xsl:variable name="b-css-sha">sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T</xsl:variable>
		<xsl:variable name="jq-cdn">https://code.jquery.com</xsl:variable>
		<xsl:variable name="jq-ver">3.3.1</xsl:variable>
		<xsl:variable name="jq-sha">sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo</xsl:variable>
		<xsl:variable name="pp-cdn">https://cdnjs.cloudflare.com/ajax/libs/popper.js</xsl:variable>
		<xsl:variable name="pp-ver">1.14.7</xsl:variable>
		<xsl:variable name="pp-sha">sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1</xsl:variable>
		<xsl:variable name="b-js-sha">sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM</xsl:variable>
		<html lang="en">
			<head>
				<a name="top"></a>
				<meta charset="UTF-8" />
				<meta
					name="viewport"
					content="{$dev-w}, {$usr-s}, {$ini-s}, {$max-s}, {$min-s}" />
				<link
					rel="stylesheet"
					href="{$b-cdn}/{$b-ver}/css/bootstrap.min.css"
					integrity="{$b-css-sha}"
					crossorigin="anonymous" />
				<link rel="stylesheet" href="./zones.css" />
				<script
					src="https://kit.fontawesome.com/67c49606c5.js"
					crossorigin="anonymous">
				</script>
				<title>Mountain zones</title>
			</head>
			<body class="bg-1">
				<div class="container-fluid p-0">
					<ul class="navbar navbar-expand-md navbar-light bg-transparent">
						<button
							class="navbar-toggler"
							type="button"
							data-toggle="collapse"
							data-target="#navbarTogglerDemo02"
							aria-expanded="false"
							aria-controls="navbarTogglerDemo02"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
							<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
								<li class="nav-item active">
									<a class="nav-link" href="#">Home</a>
								</li>
								<li class="nav-item dropdown">
									<a
										class="nav-link dropdown-toggle"
										href="#" id="dropdownId"
										data-toggle="dropdown"
										aria-haspopup="true"
										aria-expanded="false">
										Selecciona zona
									</a>
									<div class="dropdown-menu bg-1-2" aria-labelledby="dropdownId">
										<xsl:for-each select="zones/zone">
											<xsl:sort select="name" />
											<a class="dropdown-item hover-bg-g1-2" href="#zone{position()}">
												<xsl:value-of select="name" />
											</a>
										</xsl:for-each>
									</div>
								</li>
							</ul>
						</div>
					</ul>
					<div class="row m-0">
						<div class="col-xl-10 col-md-11 col-12 mx-auto pb-5">
							<div class="accordion transition-2 d-flex flex-column gap-2" id="accordionZones">
								<xsl:for-each select="zones/zone">
									<xsl:sort select="name" />
									<div class="card rounded-2 border-0" id="zone{position()}">
										<div class="card-header row bg-2 py-3">
											<div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto text-center">
												<h1 class="fg-2">
													<xsl:value-of select="name" />
												</h1>
												<img
													class="d-block img-fluid mx-auto rounded-2"
													alt="Imagen de {name}"
													src="{image}" />
												<p class="mt-3">
													<xsl:value-of select="desc" />
												</p>
												<button
													class="btn btn-link fg-1 hover-bg-g3 rounded-1 text-decoration-none"
													type="button"
													data-toggle="collapse"
													data-target="#collapse{position()}"
													aria-expanded="true"
													aria-controls="collapse{position()}">
													Montañas ▾
												</button>
											</div>
										</div>
										<div
											id="collapse{position()}"
											class="collapse bg-3"
											aria-labelledby="heading{position()}"
											data-parent="#accordionZones">
											<div class="bg-2-gradient-bg-3 h-2"></div>
											<div class="card-body mb--4">
												<div class="row">
													<xsl:for-each select="mountains/mountain">
														<xsl:sort select="name" />
														<div class="col-md-6 col-12 flex-fill d-flex">
															<div class="card border-0 rounded-2 bg-4 flex-fill mb-4 overflow-hidden">
																<img
																	class="card-img-top rounded-0"
																	alt="Imagen de {name}"
																	src="{image}" />
																<div class="card-body d-flex flex-column">
																	<h2 class="card-title text-center fg-3">
																		<xsl:value-of select="name" />
																	</h2>
																	<p class="card-text">
																		<xsl:value-of select="desc" />
																	</p>
																	<div class="rounded-2 bg-5 row text-center mx-1 mt-auto fg-4">
																		<div
																			class="col-lg-3 col-md-6 col-sm-3 col-6 rounded-2 hover-bg-b5 py-3 border-1"
																			title="Duracion media en dias">
																			<i class="fa-solid fa-calendar-day d-block"></i>
																			<xsl:value-of select="days" />
																		</div>
																		<div
																			class="col-lg-3 col-md-6 col-sm-3 col-6 rounded-2 hover-bg-b5 py-3 border-1"
																			title="Distancia">
																			<i class="fa-solid fa-ruler-horizontal d-block"></i>
																			<xsl:value-of select="length" />
																		</div>
																		<div
																			class="col-lg-3 col-md-6 col-sm-3 col-6 rounded-2 hover-bg-b5 py-3 border-1"
																			title="Desnivel hacia arriba">
																			<i class="fa-solid fa-arrow-trend-up d-block"></i>
																			<xsl:value-of select="unevenness[@direction='up']" />
																		</div>
																		<div
																			class="col-lg-3 col-md-6 col-sm-3 col-6 rounded-2 hover-bg-b5 py-3 border-1"
																			title="Desnivel hacia abajo">
																			<i class="fa-solid fa-arrow-trend-down d-block"></i>
																			<xsl:value-of select="unevenness[@direction='down']" />
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</xsl:for-each>
												</div>
											</div>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</div>
				<!-- Cosas a importar -->
				<script
					src="{$jq-cdn}/jquery-{$jq-ver}.slim.min.js"
					integrity="{$jq-sha}"
					crossorigin="anonymous"></script>
				<script
					src="{$pp-cdn}/{$pp-ver}/umd/popper.min.js"
					integrity="{$pp-sha}"
					crossorigin="anonymous"></script>
				<script
					src="{$b-cdn}/{$b-ver}/js/bootstrap.min.js"
					integrity="{$b-js-sha}"
					crossorigin="anonymous"></script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
