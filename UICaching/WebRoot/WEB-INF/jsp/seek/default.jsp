<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Search Caches</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/admin.css" />
  </head>
  
  <body>
<div id="main_container">

			<div id="header">

				<div id="logo">
					<a href="index.action"><img src="images/logo.gif" width="147"
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
				<div class="column1">

					<div class="left_box">
						<div class="top_left_box">
						</div>
						<div class="center_left_box">
						<s:if test="#session.uname==null || #session.uid==''">
							<div class="box_title">
								<span>Log</span> in:
							</div>


							<div class="form">
							<s:form action="userLogin" method="post" theme="simple">
								
								
								<div class="form_row">
									<label class="center">
										Nickname or Email<br/>
									</label>
									<s:textfield key="gmNicknameOrEmail" name="nicknameOrEmail" maxlength="50"></s:textfield>
								</div>
								
								<div class="form_row">
									<label class="center">
										Password<br/>
									</label>
									<s:password key="gmPassword" name="password" maxlength="50"></s:password>
								</div>
								
								<div class="form_row">
									<label class="center">
										Keep Me Logged In.<br/>
									</label>
									<s:checkbox key="gmRememberPassword" name="savePWD"></s:checkbox>
								</div>
								<s:hidden name="ref" value="%{ref}"></s:hidden>
								<div style="float: right; padding: 10px 25px 0 0;">
									<a href="register.action"><img alt="Register" src="images/join.gif"/></a>
									<s:submit type="image" src="images/login.gif"></s:submit>
								</div>
							</s:form>
							</div>
						</s:if>
						<s:else>
						<div class="box_title">
								Welcome Back <span>${session.uname}</span>!
								<br/>
								<a href="logout.action">Logout</a>
							</div>
							</s:else>
							


						</div>
						<div class="bottom_left_box">
						</div>
					</div>



					<div class="left_box">
						<div class="top_left_box">
						</div>
						<div class="center_left_box">
							<div class="box_title">
								<span>Join</span> our newsletter:
							</div>


							<div class="form">
								<div class="form_row">
									<label class="left">
										Email:
									</label>
									<input type="text" class="form_input" />
								</div>
								<div style="float: right; padding: 10px 25px 0 0;">
									<input type="image" src="images/join.gif" />
								</div>

							</div>


						</div>
						<div class="bottom_left_box">
						</div>
					</div>


					<div class="left_box">
						<div class="top_left_box">
						</div>
						<div class="center_left_box">
							<div class="box_title">
								<span>Contact</span> information:
							</div>


							<div class="form">
								<div class="form_row">
									<img src="images/contact_envelope.gif" width="50" height="47"
										border="0" class="img_right" alt="" title="" />
									<div class="contact_information">
										Email: rockswing@gmail.com
										<br />
										Telephone: 07562348798
										<br />
										Mobile: 13750030876
										<br />
										Fax: 07562348798
										<br />
										<br />

										<span>www.uicaching.com</span>
									</div>
								</div>
							</div>


						</div>
						<div class="bottom_left_box">
						</div>
					</div>









				</div>
				<!-- end of column one -->
        
        
 		<div class="column4">
        
        <div class="title">Search</div> 
        	
     
        </div><!-- end of column four -->       
        
   
   		<div class="column4seek" style="background-color:#f3f5f6; margin-left:5px;">
        
        	<s:form action="search" method="post" theme="simple">
							<s:property value="exception.message" />

							<div class="adminform_row_contact">
							<div class="title" style="width:400px;">
								<s:text name="gmLocateTheNearest" />
							</div>
							</div>


							<!-- Start of search by address -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmByAddress" />:
								</label>
								<s:textfield name="address" cssClass="form_input_contact"
									cssStyle="width:150px;"></s:textfield>
								<div style="float: right; padding: 0 25px 0 0;">
									<s:submit key="gmSearch" method="searchByAddress"></s:submit>
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
								</label>
								<s:textfield name="addressRadius" value="100"
									cssClass="form_input_contact" cssStyle="width:50px;"></s:textfield>
								<div style="float: left; padding: 0 0 0 10px;">
									Kilometre(s) Radius
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									&nbsp;
								</label>
							</div>
							<!-- end of it -->

							<!-- Start of search by postcode -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmByPostalCode" />:
								</label>
								<s:textfield name="postalCode" cssClass="form_input_contact"
									cssStyle="width:150px;"></s:textfield>
								<div style="float: right; padding: 0 25px 0 0;">
									<s:submit key="gmSearch" method="searchByPostalCode"></s:submit>
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
								</label>
								<s:textfield name="postalCodeRadius" value="100"
									cssClass="form_input_contact" cssStyle="width:50px;"></s:textfield>
								<div style="float: left; padding: 0 0 0 10px;">
									Kilometre(s) Radius
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									&nbsp;
								</label>
							</div>
							<!-- end of it -->

							<!-- Start of search by country -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmByCountry" />:
								</label>
								<s:textfield name="country" cssClass="form_input_contact"
									cssStyle="width:150px;"></s:textfield>
								<div style="float: right; padding: 0 25px 0 0;">
									<s:submit key="gmSearch" method="searchByCountry"></s:submit>
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									&nbsp;
								</label>
							</div>
							<!-- end of it -->


							<div class="adminform_row_contact">
								<div class="title" style="width:400px;">
									<s:text name="gmLatLonSearch" />
								</div>
							</div>

							<!--  start of wgs format -->
							<div class="adminform_row_contact">
							<div class="title" style="width:400px;background-color:#7898A4;">
									<s:text name="gmWGS" />
								</div>
							</div>

							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmLatitude" />:
								</label>
								<s:select name="latNS" list="#{'N':'N','S':'S'}" listKey="key"
									listValue="value" cssClass="form_select" cssStyle="width:35px;" />
								<s:textfield name="latHDDD" cssClass="form_input_contact"
									cssStyle="width:40px;"></s:textfield>
								<s:textfield name="latMMMM" cssClass="form_input_contact"
									cssStyle="width:55px;"></s:textfield>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
								</label>
								<div style="float: left; padding: 0 0 0 10px;">
									(N/S HDDD MM.MM)
								</div>
							</div>

							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmLongitude" />:
								</label>
								<s:select name="lonWE" list="#{'W':'W','E':'E'}" listKey="key"
									listValue="value" cssClass="form_select" cssStyle="width:35px;" />
								<s:textfield name="lonHDDD" cssClass="form_input_contact"
									cssStyle="width:40px;"></s:textfield>
								<s:textfield name="lonMMMM" cssClass="form_input_contact"
									cssStyle="width:55px;"></s:textfield>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
								</label>
								<div style="float: left; padding: 0 0 0 10px;">
									(W/E HDDD MM.MM)
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmRadius" />:
								</label>
								<s:textfield name="WGS84Radius" value="100"
									cssClass="form_input_contact" cssStyle="width:50px;"></s:textfield>
								<div style="float: left; padding: 0 0 0 10px;">
									Kilometre(s) Radius
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
								</label>
								<div style="float: left; padding: 0 0 0 10px;">
									<s:submit key="gmSearch" method="searchByWGSDM"></s:submit>
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">&nbsp;</label>
							</div>
							<!--  end of wgs84 format -->
							<!--  start of dec format -->
							<div class="adminform_row_contact">
								<div class="title" style="width:400px;background-color:#7898A4;">
									<s:text name="gmDECFormat" />
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmLatitude" />:
								</label>
								<s:textfield name="latitude" cssClass="form_input_contact"
									cssStyle="width:150px;"></s:textfield>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
								</label>
								<div style="float: left; padding: 0 0 0 10px;">
									(22.3494171)
								</div>
							</div>

							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmLongitude" />:
								</label>
								<s:textfield name="longitude" cssClass="form_input_contact"
									cssStyle="width:150px;"></s:textfield>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
								</label>
								<div style="float: left; padding: 0 0 0 10px;">
									(113.5340472)
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmRadius" />:
								</label>
								<s:textfield name="radius" value="100"
									cssClass="form_input_contact" cssStyle="width:50px;"></s:textfield>
								<div style="float: left; padding: 0 0 0 10px;">
									Kilometre(s) Radius
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">
								</label>
								<div style="float: left; padding: 0 0 0 10px;">
									<s:submit key="gmSearch" method="searchByCoord"></s:submit>
								</div>
							</div>
							<div class="adminform_row_contact">
								<label class="adminleft">&nbsp;</label>
							</div>
							<!-- end of dec format part -->

							<div class="adminform_row_contact">
								<div class="title" style="width:400px;">
									<s:text name="gmOtherFormat" />
								</div>
							</div>

							<!-- Start of search by cache name -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmByCacheName" />:
								</label>
								<s:textfield name="cacheName" cssClass="form_input_contact"
									cssStyle="width:150px;"></s:textfield>
								<div style="float: right; padding: 0 25px 0 0;">
									<s:submit key="gmSearch" method="searchByCacheName"></s:submit>
								</div>
							</div>
							<!-- end of it -->

							<!-- Start of search by UCCode -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmByUCCode" />:
								</label>
								<s:textfield name="UCCode" value="UC"
									cssClass="form_input_contact" cssStyle="width:150px;"></s:textfield>
								<div style="float: right; padding: 0 25px 0 0;">
									<s:submit key="gmSearch" method="searchByUCCode"></s:submit>
								</div>
							</div>
							<!-- end of it -->

							<!-- Start of search by Founder -->
							<!-- 
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmByfounder" />:
								</label>
								<s:textfield name="foundBy" cssClass="form_input_contact"
									cssStyle="width:150px;"></s:textfield>
								<div style="float: right; padding: 0 25px 0 0;">
									<s:submit key="gmSearch" method="searchByFounder"></s:submit>
								</div>
							</div>
							 -->
							<!-- end of it -->

							<!-- Start of search by Reporter -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmByHidder" />:
								</label>
								<s:textfield name="hiddenBy" cssClass="form_input_contact"
									cssStyle="width:150px;"></s:textfield>
								<div style="float: right; padding: 0 25px 0 0;">
									<s:submit key="gmSearch" method="searchByReporter"></s:submit>
								</div>
							</div>
							<!-- end of it -->

						</s:form>
            
                  	
            
        </div><!-- end of column two -->
   




   		




	


   

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
