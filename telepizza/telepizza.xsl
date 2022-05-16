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
        <title>Telepizza</title>
      </head>
      <body>
        <div class="navbar navbar-expand-md navbar-dark bg-danger">
          <div class="container">
            <a class="navbar-brand" href="#">
              <img class="img-fluid d-inline-block" alt="Telepizza" src="./img/telepizzalogo.png" />
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
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#work">
                    <img alt="work" src="./img/work.svg" />
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#user">
                    <img alt="user" src="./img/user.svg" />
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#cart">
                    <img alt="cart" src="./img/cart.svg" />
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="container mt-5">
          <h1 class="fw-bold">Entrantes</h1>
          <xsl:for-each select="entrantes/categoria">
            <h3 class="text-secondary">
              <xsl:value-of select="@nombre"></xsl:value-of>
            </h3>
            <div class="row">
              <xsl:for-each select="entrante">
                <div class="col-12 col-md-6 col-lg-4 mb-4">
                  <div class="card">
                    <img class="card-img-top" alt="Imagen del entrante" src="https://images.telepizza.com/vol/es/images/content/productos/new/{imagen}.png" />
                    <div class="card-body">
                      <h5 class="card-title fw-bold">
                        <xsl:value-of select="@nombre"></xsl:value-of>
                      </h5>
                      <div class="d-flex justify-content-end gap-2">
                        <p class="card-text flex-fill">Ver mas</p>
                        <xsl:if test="oferta">
                          <p class="text-danger">(Oferta)</p>
                        </xsl:if>
                        <p>
                          <xsl:value-of select="precio"></xsl:value-of>
                        </p>
                      </div>
                      <div class="d-flex justify-content-end">
                        <button class="btn btn-danger">
                          Añadir
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </xsl:for-each>
            </div>
          </xsl:for-each>
        </div>
        <div class="bg-danger text-white text-center mt-5 p-2">
          <h1 class="mb-0">
            Telepizza - Azarquiel
          </h1>
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
