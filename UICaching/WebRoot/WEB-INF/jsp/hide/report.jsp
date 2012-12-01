<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Report UICache</title>

		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/admin.css" />
		
	</head>
	
	<script language="javascript" type="text/javascript" src="js/WdatePicker.js"></script>
	<script language="javascript" type="text/javascript">
		function dec2map() {
		
		var lat=document.getElementById('declat').value;
		var lon=document.getElementById('declon').value;
		var loc="http://maps.googleapis.com/maps/api/staticmap?center="+lat+","+lon+"&zoom=14&size=400x300&maptype=roadmap&markers=color:red|"+lat+","+lon+"&sensor=false";
		return loc;
		
		}
		
		function changemap() {
		var lat=document.getElementById('declat').value;
		var lon=document.getElementById('declon').value;
		var loc="showOnMap.action?latitude="+lat+"&longitude="+lon;
		window.frames["mapframe"].location.href = loc;
		}
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
        
        <div class="title" style="float:left;">
        	<div style="float:left;"><s:text name="gmReportACache" /></div>
        	<div style="float:right; font-size:10px;color:#d8325d;padding-top:2px;">display:
             <a href="list2.html"><img src="images/list_style3.gif" border="0" /></a> 
            <a href="list1.html"><img src="images/list_style1_a.gif" border="0" /></a>
            <a href="list.html"><img src="images/list_style2.gif" border="0" /></a>
            </div>
        </div> 
        	
             <div class="offer_box_wide_style1">
             
            	<s:form action="reportNewUiCache" method="post" theme="simple">

							<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheType" />:
								</label>
								<s:select name="uiCache.cacheType" list="#{0:getText('gmUICacheTraditional'),1:getText('gmUICacheMulti'),2:getText('gmUICacheLetterboxHybrid'),3:getText('gmUICacheEvent'),4:getText('gmUICacheUnknown'),5:getText('gmUICacheInTrashOutEvent'),6:getText('gmUICacheEarth'),7:getText('gmWherigo')}" listKey="key" listValue="value" cssClass="form_select"/>
							</div>
							<!-- end -->
							
			<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheSize" />:
								</label>
								<s:select name="uiCache.size" list="#{0:getText('gmUICacheNotListed'),1:getText('gmUICacheMicro'),2:getText('gmUICacheSmall'),3:getText('gmUICacheRegular'),4:getText('gmUICacheLarge'),5:getText('gmUICacheOther')}" listKey="key" listValue="value" cssClass="form_select"/>
							</div>
							<!-- end -->
							
			<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheName" />:
								</label>
								<s:textfield name="uiCache.cacheName" maxlength="50" cssClass="form_input_contact"></s:textfield>
								</div>
							<!-- end -->
							
							<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICachePlacedBy" />:
								</label>
								<s:textfield name="uiCache.placedBy" value="%{#session.uname}" maxlength="50" cssClass="form_input_contact"></s:textfield>
								</div>
							<!-- end -->
							
							<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheDatePlaced" />:
								</label>
								<s:textfield name="uiCache.datePlaced" cssClass="form_input_contact" onfocus="WdatePicker({startDate:'%M-%d-%y',dateFmt:'MM-dd-yyyy',alwaysUseStartDate:true,isShowClear:false,readOnly:true})"></s:textfield>
								</div>
							<!-- end -->
							
							<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheRelatedWebPage" />:
								</label>
								<s:textfield name="uiCache.relatedWebPage" maxlength="100" cssClass="form_input_contact" ></s:textfield>
								</div>
							<!-- end -->
							
						
							<div class="adminform_row_contact">
							                <fieldset>
                    <legend>
                        Coordinates
                    </legend>                    
                    <div>
                        <div class="span-8">        
                                                
                            <table class="LatLongTable" title="" >
		<tr>
			<td colspan="4" align="left"></td>

		</tr><tr>
			<td colspan="4" align="left">
			<!--  
			<s:select name="coordType" list="#{0:getText('gmDECFormat'),1:getText('gmWGSDMS'),2:getText('gmWGSMD'),3:getText('gmWGSDD')}" listKey="key" listValue="value" cssClass="form_select"/>
			-->
			Decimal coordinate:
			</td>

		</tr><tr>
			<td colspan="4" align="left">
			<div class="adminform_row_contact">
					<label class="adminleft">
						<s:text name="gmLatitude" />:
					</label>
					<s:textfield id="declat" value="0.0" name="uiCache.latitude" onchange="changemap();" cssClass="form_input_contact"></s:textfield>
			</div>
			
			</td>

		</tr><tr>
			<td colspan="4" align="left">
			<div class="adminform_row_contact">
					<label class="adminleft">
						<s:text name="gmLongitude" />:
					</label>
					<s:textfield id="declon" value="0.0" name="uiCache.longitude" onchange="changemap();" cssClass="form_input_contact"></s:textfield>
			</div>
			</td>
		</tr><tr>
			<td colspan="4" align="left"></td>
		</tr>
	</table><input name="ctl00$ContentBody$LatLong:_currentLatLongFormat" type="hidden" value="1" />
                            
                            
                        </div>
                        <div class="FloatRight" style="border:solid 1px #696969; height:300px; width:450px;">
                            <iframe name="mapframe" frameborder="0" width="100%" height="100%" src="showOnMap.action?latitude=0&longitude=0"> </iframe>
                            
                        </div>
                        <div class="clear">
                            
                        </div>
                    </div>                     
                </fieldset>
                </div>
			





			<s:hidden name="uiCache.isVisible" value="true"/>
							<!-- 
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheIsVisible" />:
								</label>
								<s:checkbox name="uiCache.isVisible" cssStyle="float:left;margin-left:10px;"></s:checkbox>
								</div>
							 -->
							
							<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheCountry" />:
								</label>
								<s:select name="uiCache.country" list="#{1:getText('gmChina'),2:getText('gmNonChina')}"  listKey="key" listValue="value" cssClass="form_select"></s:select>
								</div>
							<!-- end -->
							
							<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheDifficulty" />:
								</label>
								<s:radio name="uiCache.difficulty" list="#{1:'1',1.5:'1.5',2:'2',2.5:'2.5',3:'3',3.5:'3.5',4:'4',4.5:'4.5',5:'5'}"  listKey="key" listValue="value" ></s:radio>
								</div>
							<!-- end -->
							
							<!-- start -->
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheTerrain" />:
								</label>
								<s:radio name="uiCache.terrain" list="#{1:'1',1.5:'1.5',2:'2',2.5:'2.5',3:'3',3.5:'3.5',4:'4',4.5:'4.5',5:'5'}"  listKey="key" listValue="value" ></s:radio>
								</div>
							<!-- end -->
							
							
							
							<div class="adminform_row_contact">
							<label style="float:left;">Details</label>
							
							</div>
							<s:hidden name="uiCache.htmlForDescription" value="true"/>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheShortDescription" />:
								</label>
								<s:textarea name="uiCache.shortDescription" cssStyle="width:300px;height:300px;"></s:textarea>
							</div>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheLongDescription" />:
								</label>
								<s:textarea name="uiCache.longDescription" cssStyle="width:300px;height:300px;"></s:textarea>
							</div>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheHints" />:
								</label>
								<s:textarea name="uiCache.hints" cssStyle="width:300px;height:300px;"></s:textarea>
							</div>
							
							<div class="adminform_row_contact">
								<label class="adminleft">
									<s:text name="gmUICacheNoteToReviewer" />:
								</label>
								<s:textarea name="uiCache.noteToReviewer" cssStyle="width:300px;height:300px;"></s:textarea>
							</div>
							
							<s:hidden key="gmUserId" name="user.userId" value="%{#session.uid}" ></s:hidden>
			<s:hidden key="gmUICacheStatusCode" name="uiCache.statusCode" value="1"></s:hidden>
			
			<div class="adminform_row_contact">
			<div style="float: center; padding: 10px 25px 0 0;">
								<s:submit key="gmReport"></s:submit>
							</div>
							</div>
							
			
		</s:form>
						
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
