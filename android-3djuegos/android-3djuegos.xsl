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
				<link href="./styles/reduced.css" rel="stylesheet" />
				<title>Android 3dJuegos</title>
			</head>
			<body>
				<div class="container">
					<div class="px-5 pt-4 border rounded">
						<xsl:for-each select="android-news/new">
							<div class="row border rounded mb-4 overflow-hidden">
								<div class="col-12 col-md-4 mx-0 px-0">
									<div class="card border-0 mx-0 px-0 h-100">
										<img class="image-fluid w-100 h-100" alt="portada" src="{image}" />
									</div>
								</div>
								<div class="col-12 col-md-8 p-2">
									<div class="card border-0 ml-4">
										<p class="text-success">
											<xsl:value-of select="@type" />
										</p>
										<h5 class="font-weight-bold">
											<xsl:value-of select="title" />
										</h5>
										<p class="text-secondary">
											<xsl:value-of select="description" />
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
