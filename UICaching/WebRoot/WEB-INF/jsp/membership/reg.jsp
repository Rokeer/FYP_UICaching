<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Register</title>
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
						<li>
							<a href="#"><s:text name="gmHelp"/><!--[if IE 7]><!-->
							</a>
						</li>
						

					</ul>

				</div>






			</div>



			<div id="main_content">


				<div id="admin_header">
					<div class="admin_addoffer_title">
						<s:text name="gmRegister" />
					</div>



				</div>
				<div id="admin_header_border"></div>



				<div class="add_tab">
					<div class="form_contact">
						
						<s:form action="register" method="post" theme="simple">
						<s:property value="exception.message" />
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmEmail" />:
								</label>
								<s:textfield key="gmEmail" name="user.email" maxlength="50" cssClass="form_input_contact"></s:textfield>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmNickname" />:
								</label>
								<s:textfield key="gmNickname" name="user.nickname" maxlength="50" cssClass="form_input_contact"></s:textfield>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmPassword" />:
								</label>
								<s:password key="gmPassword" name="user.password" maxlength="16" cssClass="form_input_contact"></s:password>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmVerPWD" />:
								</label>
								<s:password key="gmVerPWD" name="user.verpwd" maxlength="16" cssClass="form_input_contact"></s:password>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmFirstName" />:
								</label>
								<s:textfield key="gmFirstName" name="user.firstName" maxlength="50" cssClass="form_input_contact"></s:textfield>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmSecondName" />:
								</label>
								<s:textfield key="gmSecondName" name="user.secondName" maxlength="50" cssClass="form_input_contact"></s:textfield>
							</div>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmAdvancedOptions" />:
								</label>
								<s:checkbox key="gmAdvancedOptions" id="advshow" name="advshow" value="0" onclick="hide($('advselect'), 'auto');" tabindex="7" cssStyle="float:left;margin-left:10px;"></s:checkbox>
								<div style="display: none;" id="advselect">
								
								
								<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmGender" />:
								</label>
								<s:select key="gmGender" name="user.gender" list="#{0:getText('gmUnknown'),1:getText('gmMale'),2:getText('gmFemale')}" listKey="key" listValue="value" cssClass="form_select"/>
								</div>
								
								<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmMajor" />:
								</label>
								<s:select key="gmMajor" name="user.major" list="#{0:getText('CST'),1:getText('AP'),2:getText('AE')}" listKey="key" listValue="value" cssClass="form_select"/>
								</div>
								
								<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmSecondEmail" />:
								</label>
								<s:textfield key="gmSecondEmail" name="user.secondEmail" maxlength="50" cssClass="form_input_contact"></s:textfield>
								</div>
								
								<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmBiographical" />:
								</label>
								<s:textarea key="gmBiographical" name="user.biographical" ></s:textarea>
								</div>
								
								</div>
							</div>
							<s:hidden key="gmPermission" name="user.permission" value="0"></s:hidden>
			<s:hidden key="gmAvatar" name="user.avatar" value="images/avatar.jpg"></s:hidden>

							<div style="float: right; padding: 10px 25px 0 0;">
								<s:submit type="image" src="images/join.gif"></s:submit>
							</div>
						</s:form>
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
