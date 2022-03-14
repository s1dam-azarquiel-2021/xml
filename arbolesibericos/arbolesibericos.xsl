<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output
		method="html" encoding="utf-8"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<xsl:variable name="lowercase">abcdefghijklmnopqrstuvwxyz</xsl:variable>
		<xsl:variable name="uppercase">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
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
				<script
					src="https://kit.fontawesome.com/67c49606c5.js"
					crossorigin="anonymous">
				</script>
				<link href="./styles/reduced.css" rel="stylesheet" />
				<title>Arboles Ibericos</title>
			</head>
			<body>
				<div class="container-fluid p-0">
					<header class="bg-header">
						<div class="bg-transparent-dark">
							<ul class="navbar navbar-expand-md navbar-dark">
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
								<div class="collapse navbar-collapse px-md-5 pt-md-5" id="navbarTogglerDemo02">
									<ul class="navbar-nav mx-md-5 d-flex w-100 text-center">
										<li class="nav-item active mr-md-auto">
											<a class="nav-link text-white font-weight-bolder" href="#">ARBOLES IBERICOS</a>
										</li>
										<li class="nav-item">
											<button class="btn text-white rounded-circle bg-info" href="#">
												<i class="fa-solid fa-magnifying-glass"></i>
											</button>
										</li>
										<li class="nav-item">
											<a class="nav-link text-white font-weight-bolder" href="#">INTRODUCCION</a>
										</li>
										<li class="nav-item">
											<a class="nav-link text-white font-weight-bolder" href="#">VEGETACION</a>
										</li>
										<li class="nav-item">
											<a class="nav-link text-white font-weight-bolder" href="#">CLAVE</a>
										</li>
										<li class="nav-item">
											<a class="nav-link text-white font-weight-bolder" href="#">GENEROS</a>
										</li>
										<li class="nav-item">
											<a class="nav-link text-white font-weight-bolder" href="#">GLOSARIO</a>
										</li>
									</ul>
								</div>
							</ul>
							<div class="p-10">
								<h1 class="text-center text-white font-weight-bolder">
									Generos
								</h1>
							</div>
						</div>
					</header>
					<div class="w-50 mx-auto my-5">
						<h2 class="text-secondary text-center">
							Listado de géneros de la Península Ibérica (España, Portugal y Andorra) e Islas Baleares.
						</h2>
						<div class="mx-auto w-fit-content mt-5">
							<div class="btn-group btn-group-toggle" role="group" aria-label="list" data-toggle="buttons">
								<label class="btn btn-info px-3 py-2">
									<input type="radio" name="options" id="option1" autocomplete="off" />
									LISTA DE GENEROS
								</label>
								<label class="btn btn-info active px-3 py-2">
									<input type="radio" name="options" id="option2" autocomplete="off" checked="true" />
									LISTA DE ESPECIES
								</label>
							</div>
						</div>
					</div>
					<div class="row mx-5">
						<xsl:for-each select="species/specie">
							<div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2 pb-5">
								<div class="card border-0 border-shadow hover-boing">
									<img class="card-img-top" alt="Imagen de {name}" src="{image}" />
									<div class="card-body">
										<h4 class="card-title">
											<xsl:value-of select="name" />
										</h4>
										<p class="card-text text-secondary">
											<xsl:value-of select="descpription" />
										</p>
									</div>
								</div>
							</div>
						</xsl:for-each>
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
