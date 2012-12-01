<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Show On Map</title>

		<script type="text/javascript"
        src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">

          
      function initialize() {
        var myOptions = {
          zoom: 14,
          center: new google.maps.LatLng(<s:property value="latitude"/>, <s:property value="longitude"/>),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById('map_canvas'),
            myOptions);

        var marker = new google.maps.Marker({
          position: map.getCenter(),
          map: map,
        });
      }

      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
	</head>

	<body>
		<div style="width:100%; height:100%" id="map_canvas"></div>
	</body>
</html>
