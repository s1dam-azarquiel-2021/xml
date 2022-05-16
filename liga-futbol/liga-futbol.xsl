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
        <link href="./liga-futbol.css" rel="stylesheet" />
        <title>Futbol</title>
      </head>
      <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-danger">
          <h1 class="text-white">La Liga</h1>
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item dropdown ml-lg-5">
                <a class="nav-link dropdown-toggle text-white"
                   href="#"
                   id="navbarDropdown"
                   role="button"
                   data-toggle="dropdown"
                   aria-haspopup="true"
                   aria-expanded="false">
                  Jornadas
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <xsl:for-each select="liga-futbol/jornadas/jornada">
                    <a class="dropdown-item" href="#jornada-{@numero}">
                      <xsl:value-of select="@numero"></xsl:value-of>
                    </a>
                  </xsl:for-each>
                </div>
              </li>
              <li class="nav-item dropdown ml-lg-5">
                <a class="nav-link dropdown-toggle text-white"
                   href="#"
                   id="navbarDropdown"
                   role="button"
                   data-toggle="dropdown"
                   aria-haspopup="true"
                   aria-expanded="false">
                  Equipos
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <xsl:for-each select="liga-futbol/equipos/equipo">
                    <a class="dropdown-item" href="#equipo-{@nombre}">
                      <xsl:value-of select="@nombre"></xsl:value-of>
                    </a>
                  </xsl:for-each>
                </div>
              </li>
            </ul>
          </div>
        </nav>
        <div class="container mt-2">
          <div id="jornadas">
            <xsl:for-each select="liga-futbol/jornadas/jornada">
              <div id="jornada-{@numero}" class="card pb-5 p-md-5 p-2 border-round-5 my-5">
                <h1 class="text-center">
                  Jornada
                  <xsl:value-of select="@numero" />
                </h1>
                <div>
                  <xsl:for-each select="partidos/partido[count(. | key('partidos-por-fecha', @fecha)[1]) = 1]">
                    <xsl:sort select="@fecha" order="ascending" />
                    <h4 class="text-center mt-5 mb-2 pb-0">
                      <xsl:value-of select="@fecha"></xsl:value-of>
                    </h4>
                    <div class="d-flex flex-column gap-2">
                      <xsl:for-each select="key('partidos-por-fecha', @fecha)">
                        <div class="row mx-auto border rounded-pill w-100 p-2">
                          <div class="col-4 text-left">
                            <img
                              class="img-fluid"
                              src="https://e00-marca.uecdn.es/assets/sports/logos/football/png/72x72/{/liga-futbol/equipos/equipo[
                                   @nombre=current()/local/@nombre
                                   ]/@id-escudo}.png"
                              title="{local/@nombre}"
                              />
                          </div>
                          <div class="col-4 d-flex">
                            <p class="text-center font-big p-0 m-auto">
                              <xsl:value-of select="local/goles"></xsl:value-of>
                              :
                              <xsl:value-of select="visitante/goles"></xsl:value-of>
                            </p>
                          </div>
                          <div class="col-4 text-right">
                            <img
                              class="img-fluid"
                              src="https://e00-marca.uecdn.es/assets/sports/logos/football/png/72x72/{/liga-futbol/equipos/equipo[
                                   @nombre = current()/visitante/@nombre
                                   ]/@id-escudo}.png"
                              title="{visitante/@nombre}"
                              />
                          </div>
                        </div>
                      </xsl:for-each>
                    </div>
                  </xsl:for-each>
                </div>
              </div>
            </xsl:for-each>
          </div>
          <div id="equipos" class="my-5 card p-5 border-round-5">
            <h1 class="text-center">
              Equipos
            </h1>
            <xsl:for-each select="liga-futbol/equipos/equipo">
              <xsl:variable
                name="partidos"
                select="/liga-futbol/jornadas/jornada/partidos/partido/*[
                        @nombre = current()/@nombre
                        ]"></xsl:variable>
              <xsl:variable
                name="ganados"
                select="$partidos[
                        goles &gt; (../*[@nombre != current()/@nombre]/goles)
                        ]">
              </xsl:variable>
              <xsl:variable
                name="perdidos"
                select="$partidos[
                        goles &lt; (../*[@nombre != current()/@nombre]/goles)
                        ]">
              </xsl:variable>
              <xsl:variable
                name="empates"
                select="$partidos[
                        goles = (../*[@nombre != current()/@nombre]/goles)
                        ]">
              </xsl:variable>
              <xsl:variable name="n-ganados" select="count($ganados)"></xsl:variable>
              <xsl:variable name="n-perdidos" select="count($perdidos)"></xsl:variable>
              <xsl:variable name="n-empates" select="count($empates)"></xsl:variable>
              <xsl:variable name="puntos" select="$n-ganados * 3 + $n-empates"></xsl:variable>
              <div id="equipo-{@nombre}" class="card mt-5 p-5 border-round-5">
                <h3 class="text-center">
                  <xsl:value-of select="@nombre"></xsl:value-of>
                </h3>
                <div class="row mt-5 text-center">
                  <div class="col-md-3 mb-md-0 mb-5">
                    <img
                      class="img-fluid"
                      src="https://e00-marca.uecdn.es/assets/sports/logos/football/png/72x72/{@id-escudo}.png"
                      title="{@nombre}"
                      />
                  </div>
                  <div class="col-md-3">
                    <p>
                      Jugados:
                      <xsl:value-of select="count($partidos)"></xsl:value-of>
                    </p>
                    <p>
                      Puntos:
                      <xsl:value-of select="$puntos"></xsl:value-of>
                    </p>
                  </div>
                  <div class="col-md-3">
                    <p>
                      Ganados:
                      <xsl:value-of select="$n-ganados"></xsl:value-of>
                    </p>
                    <p>
                      Perdidos:
                      <xsl:value-of select="$n-perdidos"></xsl:value-of>
                    </p>
                    <p>
                      Empates:
                      <xsl:value-of select="$n-empates"></xsl:value-of>
                    </p>
                  </div>
                  <div class="col-md-3">
                    <p>
                      Goles a favor:
                      <xsl:value-of select="sum($partidos/goles)"></xsl:value-of>
                    </p>
                    <p>
                      Goles en contra:
                      <xsl:value-of select="sum($partidos/../*[
                                            @nombre != current()/@nombre
                                            ]/goles)"></xsl:value-of>
                    </p>
                  </div>
                </div>
              </div>
            </xsl:for-each>
          </div>
        </div>
        <footer class="text-center bg-danger text-white">
          <h1 class="m-0 p-3">
            Liga Futbol - Alberto
          </h1>
        </footer>
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
