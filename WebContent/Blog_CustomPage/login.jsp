<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<!--================Contact Area =================-->
<section class="contact_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="name" name="name" placeholder="아이디를 입력하세요">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="name" name="name" placeholder="비밀번호를 입력하세요">
						</div>
					</div>
					
					<div class="col-md-12 text-right ">
						<label>
						<input type="checkbox" />
						Remember me</label>
					</div>
					
					<div class="col-md-12 text-right">
						<button type="submit" value="submit" class="btn submit_btn">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!--================Contact Area =================-->
<br/><br/>

<%@ include file="/include/footer.jsp"%>