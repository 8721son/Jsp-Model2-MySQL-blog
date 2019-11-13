<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/include/nav.jsp"%>

<!--================Blog Area =================-->
<section class="blog_area single-post-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="main_blog_details">
					<a href="#"><h4>${board.title}</h4></a>
					<div class="user_details">
						<div class="float-left">
							<c:if test="${board.userId eq sessionScope.user.id}">
								<a href="/blog/board?cmd=updateForm&id=${board.id}">update</a>
								<a href="/blog/board?cmd=delete&id=${board.id}">delete</a>
							</c:if>
						</div>
						<div class="float-right">
							<div class="media">
								<div class="media-body">
									<h5>${board.user.username}</h5>
									<p>${board.createDate}</p>
								</div>
								<div class="d-flex">
									<img src="${board.user.userProfile }" alt="" width=70px height=70px style="border-radius: 50%">
								</div>
							</div>
						</div>
					</div>
					<!-- 본문 시작 -->
					<p>${board.content}</p>
					<!-- 본문 끝 -->
					<hr />
				</div>
				<!-- 댓글 시작 -->
				<!--  before -->
				<div class="comments-area" id="comments-area">
					<!-- prepend -->
					<c:forEach var="comment" items="${comments}">
						<!-- 댓글 아이템 시작 -->
						<div class="comment-list" id="comment-id-${comment.id}">
							<!-- ID 동적으로 만들기 -->
							<div class="reply-btn" style="position: relative; left: 420px; top: 30px;">


								<c:choose>
									<c:when test="${sessionScope.user.id eq comment.userId}">
										<button onClick="commentDelete(${comment.id})" class="btn-reply text-uppercase" style="display: inline-block; float: left; margin-right: 10px; height: 35px;">
											<i class="fa fa-trash" style="font-size: 21px; margin-top: 5px;"></i>
										</button>
										<button onClick="replyForm(${comment.id})" class="btn-reply text-uppercase" style="height: 35px;">
											<i class="fa fa-edit" style="font-size: 18px; margin-top: 5px;"></i>
										</button>
									</c:when>

									<c:otherwise>
										<button onClick="replyForm(${comment.id})" class="btn-reply text-uppercase" style="height: 35px;">
											<i class="fa fa-edit" style="font-size: 18px; margin-top: 5px;"></i>
										</button>
									</c:otherwise>
								</c:choose>



							</div>
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="${comment.user.userProfile }" alt="" width=70px height=70px style="border-radius: 50%">
									</div>
									<div class="desc">
										<h5>
											<a href="#">${comment.user.username}</a>
										</h5>
										<p class="date">${comment.createDate}</p>
										<p class="comment">${comment.content}</p>
									</div>
								</div>
							</div>
						</div>
						<div id='reply-area-${comment.id}'></div>
						<!-- 댓글 아이템 끝 -->
					</c:forEach>
					<!--  append -->
				</div>
				<!-- 댓글 끝 -->

				<!-- 댓글 쓰기 시작 -->
				<div class="comment-form" style="margin-top: 0px;">
					<h4 style="margin-bottom: 20px">Leave a Reply</h4>
					<form id="comment-submit">
						<input type="hidden" name="userId" value="${sessionScope.user.id}" /> <input type="hidden" name="boardId" value="${board.id}" />
						<div class="form-group">
							<textarea id="content" style="height: 60px" class="form-control mb-10" rows="2" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
								required=""></textarea>
						</div>
						<button type="button" onClick="commentWrite()" class="primary-btn submit_btn">Post Comment</button>
					</form>
				</div>
				<!-- 댓글 쓰기 끝 -->

			</div>

			<div class="col-lg-2"></div>
		</div>
	</div>
</section>
<!--================Blog Area =================-->

<%@ include file="/include/footer.jsp"%>

<!--================Comment Script =================-->
<script>


   //댓글 폼
   function commentWriteForm(id,username,content,createDate,userProfile){
       var comment_list = `<div class="comment-list" id="comment-id-`+id+`">`;
       comment_list += `<div class="reply-btn" style="position: relative; left: 420px; top: 30px;">`;
       comment_list += `<button onClick="commentDelete(`+id+`)" class="btn-reply text-uppercase" style="display: inline-block; float: left; margin-right: 10px; height: 35px;">`;
       comment_list += `<i class="fa fa-trash" style="font-size: 21px; margin-top: 5px;"></i>`;
       comment_list += `</button>`;
       comment_list += `<button onClick="replyForm(`+id+`)" class="btn-reply text-uppercase" style="height: 35px;">`;
       comment_list += `<i class="fa fa-edit" style="font-size: 18px; margin-top: 5px;"></i>`;
       comment_list += `</button>`;
       comment_list += `</div>`;
       comment_list += `<div class="single-comment justify-content-between d-flex">`;
       comment_list += `<div class="user justify-content-between d-flex">`;
       comment_list += `<div class="thumb">`;
       comment_list += `<img src="`+userProfile+`" width=70px height=70px style="border-radius :50%">`;
       comment_list += `</div>`;
       comment_list += `<div class="desc">`;
       comment_list += `<h5>`;
       comment_list += `<a href="#">`+username+`</a>`;
       comment_list += `</h5>`;
       comment_list += `<p class="date">`+createDate+`</p>`;
       comment_list += `<p class="comment">`+content+`</p>`;
       comment_list += `</div>`;
       comment_list += `</div>`;
       comment_list += `</div>`;
       comment_list += `</div>`;
       comment_list += `<div id='reply-area-`+id+`'></div>`;
	
       return comment_list;
   }
   
   //댓글 쓰기
   function commentWrite(){
      var comment_submit_string = $("#comment-submit").serialize();
      
      $.ajax({
         method : "POST",
         url : "/blog/api/comment?cmd=write",
         data : comment_submit_string,
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType : "json",
         success: function(comment){
         
            //화면에 적용
            var comment_et = commentWriteForm(comment.id,comment.user.username,comment.content,comment.createDate,comment.user.userProfile);
               $("#comments-area").append(comment_et);
               $("#content").val("");
         },
         error: function(xhr){
            console.log(xhr.status);
         }
      });
   }
   
   //댓글 삭제
   function commentDelete(comment_id){
      $.ajax({
         method : "POST",
         url : "/blog/api/comment?cmd=delete",
         data : comment_id+"",
         contentType : "text/plain; charset=utf-8",
         success : function(result){
            if(result === "ok"){
	            alert('삭제 완료');
               //해당 엘레멘트(DOM)을 찾아서 remove() 해주면 됨.
               $("#reply-area-"+comment_id).remove();
               $("#comment-id-"+comment_id).remove();
            }else{
            	alert('대댓글이 있어 삭제 불가');
            }   
         },
         error : function(xhr){
            console.log(xhr.status);
         }
      });
   }
   

   
   //reply 보기 - ajax
 function replyListShow(comment_id){
      var div = document.querySelector("#reply-area-"+comment_id);
      $.ajax({
         method : "POST",
         url: "/blog/api/reply?cmd=list",
         data: comment_id+"",
         contentType: "text/plain; charset=utf-8",
         dataType: "json",
         success:function(replys){
            for(reply of replys){
               //잘 받았으면 화면에 표시하면 됨.
               $("#reply-id-"+reply.id).remove();
               var reply_et = replyItemForm(reply.id,reply.user.username,reply.content,reply.createDate,reply.user.userProfile);
                  $("#reply-area-"+reply.commentId).append(reply_et);
                  
            }
         },
         error:function(xhr){
            console.log(xhr);
         }   
      });
   }
 function replyListHide(comment_id){
     var div = document.querySelector("#reply-area-"+comment_id);
     $.ajax({
        method : "POST",
        url: "/blog/api/reply?cmd=list",
        data: comment_id+"",
        contentType: "text/plain; charset=utf-8",
        dataType: "json",
        success:function(replys){
           for(reply of replys){
              //잘 받았으면 화면에 표시하면 됨.
              $("#reply-id-"+reply.id).remove();
   
           }
        },
        error:function(xhr){
           console.log(xhr);
        }   
     });
  }

   //reply(대댓글) 삭제
   function replyDelete(reply_id){
      $.ajax({
         method : "POST",
         url : "/blog/api/reply?cmd=delete",
         data : reply_id+"",
         contentType : "text/plain; charset=utf-8",
         success : function(result){
            if(result === "ok"){
               //해당 엘레멘트(DOM)을 찾아서 remove() 해주면 됨.
               $("#reply-id-"+reply_id).remove();
            }
            
         },
         error : function(xhr){
            console.log(xhr)
         }
      });
   }
   
   //대댓글 폼
   function replyItemForm(id, username, content, createDate, userProfile){
         var replyItem = "<div class='comment-list left-padding' id='reply-id-"+id+"'>";
         replyItem+= "<div class='single-comment justify-content-between d-flex'>";
         replyItem+= "<div class='user justify-content-between d-flex'>";
         replyItem+= "<div class='thumb'><img src='"+userProfile+"' alt='' width=70px height=70px style='border-radius:50%'></div>";
         replyItem+= "<div class='desc'><h5><a href='#'>"+username+"</a></h5>";
         replyItem+= "<p class='date'>"+createDate+"</p>";
         replyItem+= "<p class='comment'>"+content+"</p>";
         replyItem+= "</div></div><div class='reply-btn'><button onClick='replyDelete("+id+")' class='btn-reply text-uppercase'>삭제</button>";
         replyItem+= "</div></div></div>";
         
         return replyItem;
      }
   
   //reply Form 만들기 - 화면에 로딩!! 통신 불필요
	function replyForm(comment_id){
		var div = document.querySelector(".comment-form"+comment_id);
		if(div==null){
			replyListShow(comment_id);
			var comment_form_inner = "<h4 style='margin-bottom:20px'>Leave a Reply</h4><form id='reply-submit'><input type='hidden' name='userId' value='${sessionScope.user.id}'/><input type='hidden' name='commentId' value='"+comment_id+"'/><div class='form-group'><textarea style='height:60px' id='reply-content' class='form-control mb-10' rows='2' name='content' placeholder='Messege' required=''></textarea></div><button type='button' onClick='replyWrite()' class='primary-btn submit_btn'>Post Comment</button></form>";
			//<div class="comment-form" style="margin-top:0px;">
			var comment_form = document.createElement("div");
			comment_form.className = "comment-form"+comment_id;
			comment_form.style = "margin-top:0px";
			comment_form.innerHTML = comment_form_inner;
			console.log(comment_form);
			var comment_list = document.querySelector("#comment-id-"+comment_id);
			$("#comment-id-"+comment_id).append(comment_form);//after와 append,before와 prepend
		}else{
			replyListHide(comment_id);
			$(".comment-form"+comment_id).remove();
		}
	}
   
   //reply(대댓글) 쓰기
   function replyWrite(){
      var reply_submit_string = $("#reply-submit").serialize();
      $.ajax({
         method : "POST",
         url : "/blog/api/reply?cmd=write",
         data : reply_submit_string,
         contentType : "application/x-www-form-urlencoded; charset=utf-8",
         dataType : "json",
         success: function(reply){
            //화면에 적용
            console.log(reply.id);
            var reply_et = replyItemForm(reply.id,reply.user.username,reply.content,reply.createDate,reply.user.userProfile);
               $("#reply-area-"+reply.commentId).append(reply_et);
               $("#reply-content").val("");
               //replyListShow(reply.commentId);
         },
         error: function(xhr){
            console.log(xhr.status);
         }
      });
      
   }
   
</script>
</body>
</html>