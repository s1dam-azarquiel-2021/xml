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
				<link rel="stylesheet" href="./foster.css" />
				<title>Foster</title>
			</head>
			<body class="bg-1">
				<div class="container-fluid p-0">
					<ul class="navbar m-0 navbar-expand-xl navbar-light bg-blue-dark">
						<a class="navbar-brand" href="#">
							<img alt="LOGO" src="./img/logo.png" />
						</a>
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
								<xsl:for-each select="carta/categoria">
									<li class="nav-item active">
										<a class="nav-link text-light" href="#categoria-{position()}">
											<xsl:value-of select="@nombre" />
										</a>
									</li>
								</xsl:for-each>
							</ul>
							<form class="form-inline">
								<a href="#">
									<btn class="btn text-light bg-red-btn" type="button">PIDE ONLINE</btn>
								</a>
							</form>
						</div>
					</ul>
					<div class="row m-0">
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="./img/img1.jpg" class="d-block w-100" alt="..." />
								</div>
								<div class="carousel-item">
									<img src="./img/img2.jpg" class="d-block w-100" alt="..." />
								</div>
								<div class="carousel-item">
									<img src="./img/img3.jpg" class="d-block w-100" alt="..." />
								</div>
								<div class="carousel-item">
									<img src="./img/img4.jpg" class="d-block w-100" alt="..." />
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
						<div class="col-xl-10 col-md-11 col-12 mx-auto pb-5">
							<xsl:for-each select="carta/categoria">
								<h1 class="text-center" id="categoria-{position()}">
									<xsl:value-of select="@nombre" />
								</h1>
								<div class="row justify-content-center">
									<xsl:for-each select="plato">
										<div class="col-12 col-sm-6 col-md-4 col-lg-3 d-flex flex-fill">
											<div class="card flex-fill mb-4">
												<img
													class="card-img-top"
													alt="Imagen de {nombre}"
													src="{imagen}" />
												<div class="card-body d-flex flex-column">
													<h3 class="card-title text-center fg-3">
														<xsl:value-of select="nombre" />
													</h3>
												</div>
											</div>
										</div>
									</xsl:for-each>
								</div>
							</xsl:for-each>
						</div>
						<div class="w-100 bg-red-footer">
							<h1 class="text-light text-center py-2">LA CARTA DE FOSTER'S HOLLYWOOD</h1>
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
