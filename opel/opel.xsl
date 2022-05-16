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
        <title>Examen</title>
      </head>
      <body>
        <div class="container shadow p-0">
          <div class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="">
              <img alt="logo" src="./img/logo.png" />
            </a>
            <h1 class="text-center flex-grow-1 text-light">
              <xsl:value-of select="opel/@origen" />
            </h1>
          </div>
          <xsl:for-each select="opel/modelo">
            <div class="row bb-2 b-gray mx-2">
              <div class="col-12 col-md-6">
                <img alt="foto" src="{imagen}" class="img-fluid w-100" />
              </div>
              <div class="col-12 col-md-6 p-3">
                <h3 class="bg-dark text-light">
                  <xsl:value-of select="@nombre" />
                </h3>
                <p>
                  Acabados:
                </p>
                <xsl:choose>
                  <xsl:when test="not(acabados/*)">
                    <p class="text-danger">
                      Modelo unico; sin acabados ...
                    </p>
                  </xsl:when>
                  <xsl:otherwise>
                    <div class="accordion" id="aa-{@id}">
                      <xsl:for-each select="acabados/acabado">
                        <div class="card">
                          <div class="card-header" id="aa-{../../@id}-{@id}-h">
                            <h2 class="mb-0">
                              <button
                                class="btn btn-link text-secondary collapsed"
                                type="button"
                                data-toggle="collapse"
                                data-target="#aa-{../../@id}-{@id}-c"
                                aria-expanded="true"
                                aria-controls="aa-{../../@id}-{@id}-c">
                                <xsl:value-of select="@nombre" />
                              </button>
                            </h2>
                          </div>
                          <div
                            id="aa-{../../@id}-{@id}-c"
                            class="collapse"
                            aria-labelledby="aa-{../../@id}-{@id}-h">
                            <div class="card-body">
                              <ul>
                                <xsl:for-each select="item">
                                  <li>
                                    <xsl:value-of select="." />
                                  </li>
                                </xsl:for-each>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </xsl:for-each>
                    </div>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
          </xsl:for-each>
          <div class="bg-dark">
            <h1 class="text-center text-light mb-0">
              XSLT - Azarquiel
            </h1>
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
