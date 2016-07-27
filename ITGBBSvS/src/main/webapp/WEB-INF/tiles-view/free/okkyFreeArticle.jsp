<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 오키자유게시판 상세보기   http://okky.kr/article/334602
	기능구현
	1. 댓글 작성(작성하고 바로 현 페이지 하단에 보임(ajax), )
	2. -->

<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko" class="no-js">
<!--<![endif]-->


<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>${article.title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--[if lt IE 9]>
            <script src="http://okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript" ></script>
        <![endif]-->
        
<meta name="layout" content="main">

</head>
<body>
	<div class="layout-container container" style="margin:0;">
		<div class="main ">

			<div id="article" class="content" role="main">
				<div class="nav" role="navigation">
					<a href="writeForm.do"
						class="create btn btn-success btn-wide pull-right"><i
						class="fa fa-pencil"></i> 새 글 쓰기</a>

				</div>

				<div class="panel panel-default clearfix">
					<div class="panel-heading clearfix">
						<div class='avatar avatar-medium clearfix pull-left'>
							<a
								href='${pageContext.request.contextPath}/memberInfo.do?id=${article.writer}'
								class='avatar-photo'><img class="img-circle" src='/img/noimage.jpg' /></a>
							<div class="avatar-info">
								<a class="nickname"
									href="${pageContext.request.contextPath}/memberInfo.do?id=${article.writer}">${article.writer}</a>
								<div class="activity">
									<span class="fa fa-flash"></span> 10
								</div>
								<div class="date-created timeago" title="${article.adate}">${article.adate}</div>
							</div>
						</div>
						<div class="content-identity pull-right">
							<div class="content-identity-count">
								<span class="glyphicon glyphicon-comment"></span> 0
							</div>
							<div class="content-identity-count">
								<span class="glyphicon glyphicon-eye-open"></span>${article.readcount}</div>
						</div>
					</div>
					<div class="content-container clearfix">
						<div class="panel-body content-body pull-left">
							<div class="content-tags">
								<span class="list-group-item-text article-id">${article.anum}</span>
								<a href="/articles/life"
									class="list-group-item-text item-tag label label-info"> <!--
									
									--> <i class="fa fa-comments"></i>${article.tag1}</a>
								<!--  
									-->
								<a href="#"
									class="list-group-item-text item-tag label label-gray">${article.tag2}</a>
								<!--  
									-->
								<a href="#"
									class="list-group-item-text item-tag label label-gray">${article.tag3}</a>
							</div>
							<h2 class="panel-title">${article.title}</h2>
							<hr />
							<article class="content-text">${article.acontent}</article>

						</div>

						<div class="content-function pull-right text-center">
							<div class="content-function-group">
								<a href="likethis.do" class="note-vote-btn" role="button"
									data-type="vote" data-eval="false" data-id="1082476"><i
									id="note-vote-1082476	" class="fa fa-thumbs-up note-vote"
									data-toggle="tooltip" data-placement="left" title="좋아요"></i></a>
								<div id="content-vote-count-1082476" class="content-count">0</div>
							</div>
						</div>
						<div class="btn-group">
							<button type="button"
								class="btn btn-default btn-lg dropdown-toggle col-xs-12"
								data-toggle="dropdown" data-placement="left" title="게시물 설정">
								<span class="glyphicon glyphicon-cog"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="updateForm.do?anum=${article.anum}">수정</a></li>
								<li><a href="deletePro.do?anum=${article.anum}">삭제</a></li>
							</ul>
						</div>
					</div>
				</div>



				<c:if test="${replyNum > 0}">
					<div class="panel panel-default clearfix">
						<!-- List group -->
						<ul class="list-group">

							<li id="note-title" class="list-group-item note-title">
								<h3 class="panel-title">
									답변 <span id="note-count">${repliesList.size()}</span>
								</h3>
							</li>


							<c:forEach var="reply" items="${repliesList}">
								<li class="list-group-item note-item clearfix" id="note-1084039">
									<form action="/content/update/1084039" method="post"
										data-id="1084039" class="note-update-form">
										<input type="hidden" name="_method" value="PUT" id="_method" />
										<div class="content-body panel-body pull-left">




											<div class="note-select-indicator note-deselected">
												<i class="fa fa-comment"></i>
											</div>




											<div class='avatar avatar-medium clearfix '>
												<a
													href='${pageContext.request.contextPath}/memberInfo.do?id=${reply.writer}'
													class='avatar-photo'><img
													src='//graph.facebook.com/1056089894473018/picture?width=40&height=40' /></a>
												<div class="avatar-info">
													<a class="nickname"
														href="${pageContext.request.contextPath}/memberInfo.do?id=${reply.writer}">${reply.writer}</a>
													<div class="activity">
														<span class="fa fa-flash"></span> 1k
													</div>
													<div class="date-created timeago" title="${reply.adate}">${reply.adate}</div>
												</div>
											</div>
											<fieldset class="form">
												<article id="note-text-1084039"
													class="list-group-item-text note-text">

												<p>${reply.acontent}</p>

												</article>
											</fieldset>
										</div>

										<div class="content-function pull-right text-center">
											<div class="content-function-group">
												<div class="note-evaluate-wrapper">
													<a href="javascript://" class="note-vote-btn" role="button"
														data-type="assent" data-eval="true" data-id="1084039"><i
														id="note-evaluate-assent-1084039"
														class="fa fa-angle-up note-evaluate-assent-assent"
														data-placement="left" data-toggle="tooltip" title="추천"></i></a>
													<div id="content-vote-count-1084039"
														class="content-eval-count">0</div>
													<a href="javascript://" class="note-vote-btn" role="button"
														data-type="dissent" data-eval="true" data-id="1084039"><i
														id="note-evaluate-dissent-1084039"
														class="fa fa-angle-down note-evaluate-dissent-dissent"
														data-placement="left" data-toggle="tooltip" title="반대"></i></a>
												</div>
											</div>
										</div>


									</form>

									<form action="delete" method="post"
										id="note-delete-form-1084039">
										<input type="hidden" name="_method" value="DELETE"
											id="_method" />
									</form>
								</li>
							</c:forEach>
				</c:if>



				<li class="list-group-item note-form clearfix">
					<!-- 댓글 쓰기 -->
					<form action="replyPro.do" method="post" class="note-create-form">

						<input type="hidden" name="lastNoteId" value="1084061 "
							id="lastNoteId" />

						<div class="content-body panel-body pull-left">
							<div style="margin-left: 5px;">

								<div class="note-select-indicator note-deselected">
									<i class="fa fa-edit"></i>
								</div>


								<div class='avatar avatar-medium clearfix '>
									<a href='/user/info/45019' class='avatar-photo'><img
										src='//www.gravatar.com/avatar/d6ee80eb5a45fd4131a4b75d48df792b?d=identicon&s=40' /></a>
									<div class="avatar-info">
										<a class="nickname" href="/user/info/45019">로그인아이디</a>
										<div class="activity block">
											<span class="fa fa-flash"></span> 10
										</div>
									</div>
								</div>

							</div>
							<fieldset class="form">
								<input type="hidden" name="note.textType" value="HTML"
									id="note.textType" /> <input type="hidden" name="pnum"
									value="${article.anum}" id="pnum" />
								<textarea name="acontent" id="acontent" placeholder="댓글 쓰기"
									class="form-control"></textarea>
							</fieldset>
						</div>
						<div class="content-function-cog note-submit-buttons clearfix">
							<p>
								<a href="javascript://" id="note-create-cancel-btn"
									class="btn btn-default btn-wide" style="display: none;">취소</a>
							</p>
							<input type="submit" name="create" id="btn-create-btn"
								class="btn btn-success btn-wide" value=" 등록" />
						</div>
					</form>


				</li>
				</ul>
			</div>
		</div>
	</div>


</body>
</html>
