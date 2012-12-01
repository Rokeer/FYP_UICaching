<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Cache Details</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/admin.css" />
  </head>
  <script language="javascript" type="text/javascript">
		function changestar() {
		
		var cur=document.getElementById('favstar').src;
		if (cur=="http://localhost:8080/UICaching/images/stars/star_silver.png")
		return "http://localhost:8080/UICaching/images/stars/star.png";
		else
		return "http://localhost:8080/UICaching/images/stars/star_silver.png";
		}
		
		
		function display(y){
			$(y).style.display=($(y).style.display=="none")?"":"none";
			}
		function $(s){return document.getElementById(s);}
	</script>

	
  
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
        
        <div class="title"><s:property value="uiCache.cacheName"/></div> 
        	
     
        </div><!-- end of column four -->       
        
   
   		<div class="column2" style="background-color:#f3f5f6; margin-left:5px;">
        
        	<div class="big_pic">
			
        	<iframe frameborder="0" style="width:300px;height:300px;" src="showOnMap.action?latitude=<s:property value="uiCache.latitude"/>&longitude=<s:property value="uiCache.longitude"/>"> </iframe>

        	</div>
            
            <div class="main_text_box">
            <h1>Description</h1>
            <p>
            <s:property value="uiCache.longDescription"/>
            </p>        
        	</div>
            
                  	
            
        </div><!-- end of column two -->
   




   		<div class="column3">
            
            <div class="title2">Details:</div> 
            <div class="details_list">
            <ul>
            	<li><span>Difficulty:</span>  <img src="images/stars/stars<s:property value="uiCache.difficulty"/>.gif"/></li>
                <li><span>Terrain:</span>  <img src="images/stars/stars<s:property value="uiCache.terrain"/>.gif"/></li>
                <li><span>Size:</span>  <img src="images/size/<s:property value="uiCache.size"/>.gif"/></li>
                <li><span>Latitude:</span>  <s:property value="uiCache.latitude"/></li>
                <li><span>Longitude:</span>  <s:property value="uiCache.longitude"/></li>
                <li><span>Country:</span>  <s:property value="uiCache.country"/></li>
                <li><span>Cacher:</span>  <s:property value="uiCache.user.nickname"/></li>
                <li><span>Hidden:</span>  <s:property value="uiCache.datePlaced"/></li>
                <li><span>Related Web Page:</span>  <s:property value="uiCache.relatedWebPage"/></li>
                <li><span>Dig Counter:</span>  <s:property value="uiCache.digCount"/></li>
            	<li><span>Hints:</span> <a href="#" onclick="display('hints');"> Click to view.</a> <p id="hints" style="display:none;"><s:property value="uiCache.hints" /></p></li>
            </ul>
            </div>
            
           
            <div style="float:left;">
            <div class="button"><a href="#">Dig It!</a></div>
            </div>
            
            <div style="float:left; padding-left:150px;"><a href="#" onclick="javascript:favstar.src=changestar();"><img id="favstar" src="images/stars/star_silver.png" width="28" height="28" border="0" alt="Add to favorite" title="Add to favorite" /></a>
            </div>
            
             
        </div><!-- end of column three -->


		<div class="column4" style="float: right">
        
        <div class="title" style="float:left;">
        	<div style="float:left;">Logs</div>
        </div> 
        	
        	<s:iterator value="uiCache.logs" status="st">
        	
        	<div class="offer_box_wide_style1">
        		<div style="float:left;width:140px">
                
           	   <p><a href="#"><img src="<s:property value="user.avatar"/>" align="middle" width="130" height="98" class="img_left" alt="" title="" border="0"/></a></p>
           	   <div align="center"><s:property value="user.nickname"/></div>
                </div>
        	
            	
            	<div class="offer_info">
                <span><s:property value="type"/> on <s:property value="dateLogged"/></span>
                <p class="offer">
                <s:property value="comments"/>
                </p>
                </div>
            </div>
        	
    		</s:iterator>
        	
        	
             

        
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
