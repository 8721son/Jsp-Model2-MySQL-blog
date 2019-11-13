<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<!--================Contact Area =================-->
<section class="contact_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="row contact_form" action="/blog/member?cmd=joinProc"
					method="post" id="contactForm" novalidate="novalidate" onsubmit="return validateCheck()">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="username" name="username"
								placeholder="아이디를 입력하세요." required="required" maxlength="20">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" class="form-control" id="password" name="password"
								placeholder="비밀번호를 입력하세요." required="required" maxlength="20">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" class="form-control" id="passwordCheck" name="passwordCheck"
								placeholder="동일한 비밀번호를 입력하세요." required="required" maxlength="20">
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="email" class="form-control" id="email" name="email"
								placeholder="이메일을 입력하세요." required="required" maxlength="40">
						</div>
					</div>
					<div class="col-md-12 text-right">
						<button type="submit" value="submit" class="btn submit_btn">Join</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!--================Contact Area =================-->
<br/><br/>

<%@ include file="/include/footer.jsp"%>