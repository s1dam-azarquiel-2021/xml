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
        <link
          rel="stylesheet"
          href="{$b-cdn}/{$b-ver}/css/bootstrap.min.css"
          integrity="{$b-css-sha}"
          crossorigin="anonymous" />
        <link href="./escrutinio.css" rel="stylesheet" />
        <title>Escrutinio</title>
      </head>
      <body class="img-fondo">
        <div class="container">
          <div class="img-fondo-naranjita">
            <img class="img-fluid w-100" alt="cabesera" src="./img/header.png" />
            <div class="p-2 d-flex">
              <xsl:for-each select="escrutinio/resultados/partido">
                <img class="img-fluid w-100" alt="{@carru}" src="./img/carru-{@carru}.jpg" />
              </xsl:for-each>
            </div>
            <h2 class="text-white text-center">
              <xsl:value-of select="escrutinio/@elecciones" />
            </h2>
          </div>
          <div class="mt-5">
            <div class="bg-amarillito img-fondo-e12">
              <h1 class="text-white text-center">
                No de Escanios:
                <xsl:value-of select="escrutinio/escanios" />
              </h1>
              <h1 class="text-white text-center mb-0">
                Porciento Escrutado:
                <xsl:value-of select="escrutinio/porciento_escrutado" />%
              </h1>
            </div>
            <div class="bg-marroncio p-4"></div>
            <div class="bg-wevo-clarito p-2">
              <div class="mx-auto w-fit-content fg-marroncio">
                <xsl:for-each select="escrutinio/votos/*">
                  <h5>
                    <img class="mr-2" alt="icono-folio" src="./img/folio.png" />
                    <xsl:value-of select="name(.)" />:
                    <xsl:value-of select="cantidad" /> -
                    <xsl:value-of select="porcentaje" />%
                  </h5>
                </xsl:for-each>
              </div>
            </div>
            <div class="bg-amarillito p-5 text-center">
              <table class="w-100">
                <thead class="text-white bg-marroncio b-b-white">
                  <th></th>
                  <th>PARTIDO</th>
                  <th>VOTOS</th>
                  <th>ESCANIOS</th>
                  <th>PORCENTAJE</th>
                </thead>
                <tbody class="fg-marroncio">
                  <xsl:for-each select="escrutinio/resultados/partido">
                    <tr class="b-b-marroncio">
                      <td>
                        <img alt="logo" src="./img/{@nombre}.png" width="40px" />
                      </td>
                      <td>
                        <h5><xsl:value-of select="@nombre" /></h5>
                      </td>
                      <td>
                        <h5><xsl:value-of select="electos" /></h5>
                      </td>
                      <td>
                        <h5><xsl:value-of select="votos_numero" /></h5>
                      </td>
                      <td>
                        <h5><xsl:value-of select="votos_porciento" />%</h5>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
            <div class="bg-marroncio">
              <h1 class="text-center text-white p-2">Copyright - S1DAM</h1>
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
