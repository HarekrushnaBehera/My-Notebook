<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Keep your Notes Here</title>
<style type="text/css">
.backimg {
	height: 90vh;
	width: 100%;
	background-image: url("images/note_img_3.avif");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.px-4 {
	padding-top: 30vh;
}

.lead {
	text-align: justify;
}
</style>
<%@ include file="components/bootstrapCss.jsp"%>
</head>
<body>
	<%@ include file="components/index_navbar.jsp"%>
	<div class="px-4 text-center backimg">
		<h1 class="display-5 fw-bold">Get your E-Diary</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4" id="home_section">Quickly design and customize responsive
				mobile-first sites with Bootstrap, the world’s most popular
				front-end open source toolkit, featuring Sass variables and mixins,
				responsive grid system, extensive prebuilt components, and powerful
				JavaScript plugins.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="register.jsp" class="btn btn-secondary btn-lg" tabindex="-1" role="button" aria-disabled="true">Register</a>
				<a href="login.jsp" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">Login</a>
			</div>
		</div>
	</div>
	<div class="container px-4 py-5" id="hanging-icons">
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
      <div class="col d-flex align-items-start">
        <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
          <svg class="bi" width="1em" height="1em"><use xlink:href="#toggles2"></use></svg>
        </div>
        <div>
          <h2>Featured title</h2>
          <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
          <a href="#" class="btn btn-primary">
            Primary button
          </a>
        </div>
      </div>
      <div class="col d-flex align-items-start">
        <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
          <svg class="bi" width="1em" height="1em"><use xlink:href="#cpu-fill"></use></svg>
        </div>
        <div>
          <h2>Featured title</h2>
          <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
          <a href="#" class="btn btn-primary">
            Primary button
          </a>
        </div>
      </div>
      <div class="col d-flex align-items-start">
        <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
          <svg class="bi" width="1em" height="1em"><use xlink:href="#tools"></use></svg>
        </div>
        <div>
          <h2>Featured title</h2>
          <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
          <a href="#" class="btn btn-primary">
            Primary button
          </a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>