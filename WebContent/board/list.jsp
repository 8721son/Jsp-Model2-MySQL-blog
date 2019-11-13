<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/nav.jsp"%>

<!--================Blog Area =================-->
<section class="blog_area">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog_left_sidebar">

					<c:forEach var="board" items="${boards}">
						<!-- 블로그 글 시작 -->
						<article class="blog_style1">
							<div class="blog_img">
								<img style="width: 100%" class="img-fluid" src="${board.previewImg}" alt="">
							</div>
							<div class="blog_text">
								<div class="blog_text_inner">
									<div class="cat">
										<a class="cat_btn" href="#">${board.user.username}</a> <a href="#"><i class="fa fa-calendar" aria-hidden="true"></i> ${board.createDate }</a> <a href="#"><i class="fa fa-comments-o"
											aria-hidden="true"></i> ${board.readCount}</a>
									</div>
									<a href="#"><h4>${board.title }</h4></a>
									<div
										style="display: -webkit-box; -webkit-box-orient: vertical; text-align: left; overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; height: 2.4em; -webkit-line-clamp: 2; margin-bottom: 20px; word-break: break-all">${board.content }</div>
									<a class="blog_btn" href="/blog/board?cmd=detail&id=${board.id}">Read More</a>
								</div>
							</div>
						</article>
						<!-- 블로그 글 끝 -->
					</c:forEach>

					<!--페이징 하기 -->
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">

							<c:if test="${!(param.page<=1)}">
								<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page-1}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
							</c:if>

							<c:choose>
								<c:when test="${param.page>=3&& !(param.page>=paging)}">
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page-2}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${param.page-2}</span>
									</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page-1}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${param.page-1}</span>
									</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${param.page}</span>
									</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+1}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${param.page+1}</span>
									</a></li>
									<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+2}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${param.page+2}</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${param.page<3}">
											<c:set var="limit" value="1" />
											<c:forEach var="page" begin="1" end="${paging}" step="1">
												<c:if test="${limit==1}">
													<li class="page-item"><a href="/blog/board?cmd=list&page=${page}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${page}</span>
													</a></li>
													<c:if test="${page==5}">
														<c:set var="limit" value="0"></c:set>
													</c:if>
												</c:if>
											</c:forEach>

										</c:when>
										<c:otherwise>
											<li class="page-item"><a href="/blog/board?cmd=list&page=${paging-2}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${paging-2}</span>
											</a></li>
											<li class="page-item"><a href="/blog/board?cmd=list&page=${paging-1}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${paging-1}</span>
											</a></li>
											<li class="page-item"><a href="/blog/board?cmd=list&page=${paging}&search=${param.search}" class="page-link" aria-label="Previous"> <span aria-hidden="true"> ${paging}</span>
											</a></li>
										</c:otherwise>
									</c:choose>

								</c:otherwise>
							</c:choose>


							<c:if test="${!(param.page>=paging)}">
								<li class="page-item"><a href="/blog/board?cmd=list&page=${param.page+1}&search=${param.search}" class="page-link" aria-label="Next"> <span aria-hidden="true"> <span class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</c:if>
						</ul>
					</nav>


				</div>
			</div>
			<!-- 검색하기 -->
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<div class="input-group">
							<form action="/blog/board?cmd=list&page=1" method="GET">

								<input type="text" name="search" class="form-control" placeholder="Search Posts"> <span class="input-group-btn">
								<input type="hidden" name="page" value="1">
									<button class="btn btn-default" type="submit">
										<i class="lnr lnr-magnifier"></i>
									</button>
								</span>
							</form>
						</div>
						<!-- /input-group -->
						<div class="br"></div>
					</aside>
					<aside class="single_sidebar_widget popular_post_widget">
						<h3 class="widget_title">Popular Posts</h3>

						<c:forEach var="board" items="${hotBoards}">
							<div class="media post_item">
								<img src="${board.previewImg}" width='100px' height='80px' alt="post">
								<div class="media-body">
									<a href="/blog/board?cmd=detail&id=${board.id}"><h3>${board.title}</h3></a>
									<p>${board.createDate}</p>
								</div>
							</div>
						</c:forEach>

						<div class="br"></div>
					</aside>

				</div>
			</div>
		</div>
	</div>
</section>
<!--================Blog Area =================-->
<%@ include file="/include/footer.jsp"%>

</body>
</html>