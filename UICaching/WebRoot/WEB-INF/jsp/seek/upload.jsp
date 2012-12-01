<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Upload Picture</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/admin.css" />
	</head>
	<script src="js/common.js">
</script>
	<body>
		<div id="main_container">

			<div id="header">

				<div id="logo">
					<a href="index.html"><img src="images/logo.gif" width="147"
							height="78" alt="" title="" border="0" />
					</a>
				</div>

				<div class="banner_adds"></div>


				<div class="menu">

					<ul>
						<li>
							<a href="index.action"><s:text name="gmHome" /></a>
						</li>
						<li>
							<a href="search.action"><s:text name="gmHideAndSeek" /> <!--[if IE 7]><!-->
							</a>
							<!--<![endif]-->
							<!--[if lte IE 6]><table><tr><td><![endif]-->
							<ul>
								<li>
									<a href="search.action" title="<s:text name="gmSeekACache" />"><s:text name="gmSeek" /></a>
								</li>
								<li>
									<a href="reportNewUiCache.action" title="<s:text name="gmReportACache" />"><s:text name="gmHide" /></a>
								</li>
							</ul>
							<!--[if lte IE 6]></td></tr></table></a><![endif]-->
						</li>
						<li>
							<a href="#"><s:text name="gmYourProfile" /><!--[if IE 7]><!-->
							</a>
							<!--<![endif]-->
							<!--[if lte IE 6]><table><tr><td><![endif]-->
							<ul>
								<li>
									<a href="#" title="<s:text name="gmQuickView"/>"><s:text name="gmQuickView"/></a>
								</li>
								<li>
									<a href="#" title="<s:text name="gmFavorite"/>"><s:text name="gmFavorite"/></a>
								</li>
								<li>
									<a href="#" title="<s:text name="gmUICaches"/>"><s:text name="gmUICaches"/></a>
								</li>
								<li>
									<a href="#" title="<s:text name="gmAccountDetails"/>"><s:text name="gmAccountDetails"/></a>
								</li>
							</ul>
							<!--[if lte IE 6]></td></tr></table></a><![endif]-->
						</li>
						
						

					</ul>

				</div>






			</div>



			<div id="main_content">


				<div id="admin_header">
					<div class="admin_addoffer_title">
						<s:text name="gmUploadPicture" />
					</div>



				</div>
				<div id="admin_header_border"></div>



				<div class="add_tab">
					<div class="form_contact">
						
						
						
								<s:if
			test="uiCache.user.userId == #session.uid || log.user.userId == #session.uid">
			<s:property value="exception.message" />
			<s:set name="logid" value="log.id" />
			<s:if test="%{#logid == '' or #logid == null}">
				<s:form action="uploadCachePictures" method="post" theme="simple"
					enctype="multipart/form-data">
					<s:hidden name="user.userId" value="%{#session.uid}"></s:hidden>
					
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmSelectPicture" />:
								</label>
								<s:file  name="picture" cssClass="form_input_contact"/>
							</div>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmCaption" />:
								</label>
								<s:textfield name="uiCachePicture.caption" maxlength="50" cssClass="form_input_contact"></s:textfield>
							</div>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmDescription" />:
								</label>
								<s:textarea name="uiCachePicture.description"></s:textarea>
							</div>

					<s:hidden name="uiCache.uiCacheId" value="%{uiCache.uiCacheId}"></s:hidden>
					<s:hidden name="uiCachePicture.statusCode" value="1"></s:hidden>

							<div style="float: right; padding: 10px 25px 0 0;">
								<s:submit type="image" src="images/upload.gif"></s:submit>
							</div>
				</s:form>
			</s:if>
			<s:else>
				<s:form action="uploadLogPictures" method="post" theme="simple"
					enctype="multipart/form-data">
					<s:hidden name="user.userId" value="%{#session.uid}"></s:hidden>
					<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmSelectPicture" />:
								</label>
								<s:file  name="picture" cssClass="form_input_contact"/>
							</div>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmCaption" />:
								</label>
								<s:textfield name="logPicture.caption" maxlength="50" cssClass="form_input_contact"></s:textfield>
							</div>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmDescription" />:
								</label>
								<s:textarea name="logPicture.description"></s:textarea>
							</div>


					<s:hidden name="log.logId" value="%{log.logId}"></s:hidden>
					<s:hidden name="logPicture.statusCode" value="1"></s:hidden>

							<div style="float: right; padding: 10px 25px 0 0;">
								<s:submit type="image" src="images/upload.gif"></s:submit>
							</div>
				</s:form>
			</s:else>
		</s:if>
		<s:else>
You cannot upload pictures for this log or cache.
<s:property value="#session.uid" />
<s:property value="%{uiCache.user.userId}" />
</s:else>
						
						
						
						
						
						
						
						
					</div>


				</div>

			</div>
			<!-- end of main_content -->

			<div id="footer">

	<div id="copyright">
    <div style="float:left; padding:3px;"><a href="#"><img src="images/footer_logo.gif" width="42" height="35" alt="" title="" border="0" /></a></div>
    <div style="float:left; padding:14px 10px 10px 10px;"> UICaching - Yet another geocaching web application.</div>
    </div>
    
    
    <ul class="footer_menu">
    	<li><a href="index.action" class="nav_footer">  Home </a></li>
        <li><a href="" class="nav_footer">  Contact </a></li>
    </ul>

</div>


		</div>
		<!-- end of main_container -->

	</body>
</html>
