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
        <link href="./pokedex.css" rel="stylesheet" />
        <title>Pokemon</title>
      </head>
      <body class="bg-img-fondo">
        <div class="container text-center text-white shadow-light p-0">
          <div class="bg-img-header">
            <div class="p-5 bg-gray-overlay">
              <h1 class="text-transparent-white bg-gray-overlay">POKEDEX</h1>
              <h4>
                <xsl:value-of select="pokedex/definition"/>
              </h4>
            </div>
          </div>
          <div class="bg-gray-overlay pt-3 px-5 pb-5">
            <h2 class="text-transparent-white">TYPES</h2>
            <div class="row justify-content-center">
              <xsl:for-each select="pokedex/types/type">
                <xsl:sort select="." />
                <div class="col-6 col-md-4 col-lg-3 col-xl-2 mb-4">
                  <div class="card pt-2 pb-1 bg-transparent border-light border-2 rounded-1">
                    <img
                      alt="{.}"
                      src="./img/{.}_type.png"
                      width="40px"
                      class="mx-auto" />
                    <span>
                      <xsl:value-of select="." />
                    </span>
                  </div>
                </div>
              </xsl:for-each>
            </div>
            <h2 class="text-transparent-white">POKEMONS</h2>
            <div class="row justify-content-center">
              <xsl:for-each select="pokedex/pokemon">
                <xsl:sort data-type="number" select="dex" />
                <div class="col-12 col-lg-6 col-xl-4 mb-5 flex-fill">
                  <div class="card p-2 bg-transparent border-light border-2 rounded-1 text-left d-flex flex-row h-100">
                    <div class="flex-grow-0 d-flex flex-column justify-content-center">
                      <img
                        alt="{.}"
                        src="https://assets.pokemon.com/assets/cms2/img/pokedex/detail/{dex}.png"
                        class="mx-auto img-fluid" />
                    </div>
                    <div class="flex-grow-1 d-flex flex-column justify-content-center">
                      <h5>
                        <xsl:value-of select="species" />
                      </h5>
                      <xsl:for-each select="baseStats/*">
                        <p class="m-0 p-0">
                          <xsl:value-of select="name(.)" />:
                          <xsl:choose>
                            <xsl:when test=". &gt; 99">
                              <span class="text-danger">
                                <xsl:value-of select="." />
                              </span>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="." />
                            </xsl:otherwise>
                          </xsl:choose>
                        </p>
                      </xsl:for-each>
                      <p class="m-0 p-0 mt-2">
                        <xsl:for-each select="types/type">
                          <img
                            alt="{.}"
                            src="./img/{translate(., $uppercase, $lowercase)}_type.png"
                            class="mr-2" />
                        </xsl:for-each>
                      </p>
                    </div>
                  </div>
                </div>
              </xsl:for-each>
            </div>
          </div>
          <div class="bg-light-gray-overlay text-body py-4 d-flex">
            <img class="img-fluid opacity-0" alt="POKEBOLA" src="./img/Pokeball.png" />
            <h2 class="flex-grow-1 m-0 p-0 h-min-content align-self-center">
              EL MUNDO POKEMON EN AZARQUIEL - S1DAM
            </h2>
            <img class="img-fluid" alt="POKEBOLA" src="./img/Pokeball.png" />
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
