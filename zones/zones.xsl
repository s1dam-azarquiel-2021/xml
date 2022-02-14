<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output
		method="html" encoding="utf-8"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<html lang="en">
			<head>
				<a name="top"></a>
				<meta charset="UTF-8" />
				<meta
					name="viewport"
					content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
				<link
					rel="stylesheet"
					href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
					integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
					crossorigin="anonymous" />
				<title>Mountain zones</title>
			</head>
			<body>
				<div class="container-fluid p-0">
					<ul class="navbar navbar-expand-md navbar-light">
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
									<div class="dropdown-menu" aria-labelledby="dropdownId">
										<xsl:for-each select="zones/zone">
											<a class="dropdown-item" href="#zone{position()}">
												<xsl:value-of select="name" />
											</a>
										</xsl:for-each>
									</div>
								</li>
							</ul>
						</div>
					</ul>
					<div class="row m-0">
						<div class="col-md-9 mx-auto pb-5">
							<div class="accordion transition-2" id="accordionZones">
								<xsl:for-each select="zones/zone">
									<div class="card">
										<div class="card-header" id="heading{position()}">
											<button
												class="btn btn-link"
												type="button"
												data-toggle="collapse"
												data-target="#collapse{position()}"
												aria-expanded="true"
												aria-controls="collapse{position()}">
												a
											</button>
										</div>
										<div
											id="collapse{position()}"
											class="collapse"
											aria-labelledby="heading{position()}"
											data-parent="#accordionZones">
											<div class="card-body">
												b
											</div>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</div>
				<!-- Cosas a importar -->
				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
								integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
								crossorigin="anonymous"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
								integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
								crossorigin="anonymous"></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
								integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
								crossorigin="anonymous"></script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
