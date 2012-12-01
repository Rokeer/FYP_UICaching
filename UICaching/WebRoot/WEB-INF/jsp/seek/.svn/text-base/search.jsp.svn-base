<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Search Result</title>
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
        
        <div class="title" style="float:left;">
        	<div style="float:left;">Selling Homes</div>
        	
        </div> 
        
        
        
        
        	<table style="clear:both; width:695px; margin-top:10px;" cellpadding="0" cellspacing="0" border="0">
            
            <tr>
                <th><img src="images/compass/N.gif"/></th>
                <th><img src="images/icon_fav.png"/></th>
                <th>Description</th>
                <th>(D / T)</th>
                <th>Placed</th>
                <th>Last Found</th>
            </tr>
            
            
            <s:iterator value="result" status="st">
    		<tr class="color1" onmouseout="style.backgroundColor='#F3F5F6'" onmouseover="style.backgroundColor='#ffffff'">
				<td><s:property value="tmpDistance"/> KM</td>
                <td align="center"><s:property value="digCount"/></td>
                <td><img src="images/cachetypes/<s:property value="cacheType"/>.gif"/>
                <a href="viewCacheDetail.action?UCCode=<s:property value="ucId"/>" >
                <s:property value="cacheName"/>
                </a>
                </td>
                <td><s:property value="difficulty"/> / <s:property value="terrain"/></td>
                <td><s:property value="datePlaced"/></td>
                <td><s:property value="lastFound"/></td>
            </tr>
    		</s:iterator>
            
            
            </table>
        	


            <div class="pagination">
            </div> 
        
        </div><!-- end of column four -->	


   

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
