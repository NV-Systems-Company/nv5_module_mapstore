<!-- BEGIN: main -->
<!-- BEGIN: error -->
<div class="alert alert-warning">{ERROR}</div>
<!-- END: error -->
<div class="panel panel-default">
<div class="panel-body">
<form class="form-horizontal" action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}=add" method="post">
	<input type="hidden" name="id" value="{ROW.id}" />
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.title}</strong> <span class="red">(*)</span></label>
		<div class="col-sm-19 col-md-20">
			<input class="form-control" type="text" name="title" value="{ROW.title}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.alias}</strong> <span class="red">(*)</span></label>
		<div class="col-sm-19 col-md-18">
			<input class="form-control" type="text" name="alias" value="{ROW.alias}" id="id_alias" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" />
		</div>
		<div class="col-sm-4 col-md-2">
			<i class="fa fa-refresh fa-lg icon-pointer" onclick="nv_get_alias('id_alias');">&nbsp;</i>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.catalog}</strong> <span class="red">(*)</span></label>
		<div class="col-sm-19 col-md-20">
		<select name="catalog" class="form-control">
			<option value="0">-- Chọn nhóm cửa hàng --</option>
			<!-- BEGIN: catalog -->
			<option {selected} value="{catalog.id}">{catalog.title}</option>
			<!-- END: catalog -->
		</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.sdt}</strong></label>
		<div class="col-sm-19 col-md-18">
			<input class="form-control" type="text" name="sdt" value="{ROW.sdt}" />
		</div>
		<div class="col-sm-4 col-md-2">
			<i class="fa fa-refresh fa-lg icon-pointer" onclick="nv_get_alias('id_alias');">&nbsp;</i>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.image}</strong></label>
		<div class="col-sm-19 col-md-20">
			<input class="form-control" type="text" name="home_img" value="{ROW.image}" id="id_home_img" style="width:50%" />&nbsp;<button type="button" class="btn btn-info" id="img_home_img"><i class="fa fa-folder-open-o">&nbsp;</i> Browse server </button>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.website}</strong></label>
		<div class="col-sm-19 col-md-20">
			<input class="form-control"   name="website" value="{ROW.website}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.bodytext}</strong></label>
		<div class="col-sm-19 col-md-20">
{ROW.bodytext}		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.keywords}</strong></label>
		<div class="col-sm-19 col-md-20">
			<textarea class="form-control" style="height:100px;" cols="75" rows="5" name="keywords">{ROW.keywords}</textarea>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.title_seo}</strong></label>
		<div class="col-sm-19 col-md-20">
			<input class="form-control" type="text" name="title_seo" value="{ROW.title_seo}"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.bodytext_seo}</strong></label>
		<div class="col-sm-19 col-md-20">
			<textarea class="form-control" style="height:100px;" cols="75" rows="5" name="bodytext_seo">{ROW.bodytext_seo}</textarea>
		</div>
	</div>
	
	<script type="text/javascript" data-show="after" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<link href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css" type="text/css" rel="stylesheet" />


<div class="bando_map">
	<div class="vitri_bando">Vị trí</div>
	<div class="row">
		<div class="col-xs-24 col-sm-12 col-md-12">
			<div class="form-group">
				<label class="col-sm-8 col-md-8 control-label"><strong>Tỉnh/ thành phố</strong> <span class="red">(*)</span></label>
				<div class="col-sm-16 col-md-16">
					<span id="getcity">
						 
							<select name="provinceid" id="city" class="select">
								<option value ="0">{LANG.post_select_area}</option>
								<!-- BEGIN: city -->					
								<option value="{CITY.key}" {CITY.selected}>{CITY.name}</option>
								<!-- END: city -->
							</select>
							
						</span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-8 col-md-8 control-label"><strong>Quận/ huyện</strong> <span class="red">(*)</span></label>
				<div class="col-sm-16 col-md-16">
					<span id="getdistrict">	 
							<select  name="district_id" id="district" class="select">
								<option value="0">{LANG.post_select_area}</option>
								<!-- BEGIN: district -->					
								<option value="{DISTRICT.key}" {DISTRICT.selected}>{DISTRICT.type} {DISTRICT.name}</option>
								<!-- END: district -->
							</select>
							<span id="loading_district" style="display:none"><img src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/images/load_bar.gif"></span>							
						</span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-8 col-md-8 control-label"><strong>Xã/Phường</strong> <span class="red">(*)</span></label>
				<div class="col-sm-16 col-md-16">
					<span id="getward"> 
								<select name="ward_id" id="ward" class="select">
								<option value="0">{LANG.post_select_area}</option>
								<!-- BEGIN: ward -->					
								<option value="{WARD.key}" {WARD.selected}>{WARD.type} {WARD.name}</option>
								<!-- END: ward -->
								</select>
								<span id="loading_ward"  style="display:none"><img src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/images/load_bar.gif"></span>
							</span>
				</div>
			</div>
			
		</div>
		
		<div class="col-xs-24 col-sm-12 col-md-12">
			
			<div style="display:none" name="project_id" id="project" class="select">
							
						</div>
			
			<div class="form-group">
				<label class="col-sm-8 col-md-8 control-label"><strong>Địa chỉ</strong> <span class="red">(*)</span></label>
				<div class="col-sm-16 col-md-16">
						<input class="form-control" name="address" type="text" id="address" value="{ROW.address}" maxlength="50" class="input_text">
				</div>
			</div>
			
		</div>
	</div>

</div>

<div class="vitribando">
	<div class="title_bando">Bản đồ</div>
	<div class="map_bando">
						<input id="searchBox" class="controls" type="text" placeholder="Tìm kiếm địa điểm" />
						<div id="mapcontent"></div>
						<input name="googmaps[lat]" value="{GOOGLEMAPLAT}" id="lat-input" type="text">
						<input name="googmaps[lng]" value="{GOOGLEMAPLNG}" id="lng-input" type="text">
						<input name="googmaps[zoom]" value="{GOOGLEMAPZOOM}" id="zoom-input" type="text">
						<script>
						
						  
						var markers = [];
						var map;
						function initMap() 
						{
							var bangalore = { lat: {GOOGLEMAPLAT1}, lng: {GOOGLEMAPLNG1} };
							var map = new google.maps.Map(document.getElementById('mapcontent'),
							{
								zoom: 15,
								minZoom: 8,
								maxZoom: 18,
								center: bangalore,
								mapTypeId: google.maps.MapTypeId.ROADMAP
							});
							
							var geocoder = new google.maps.Geocoder();
							
							var input = document.getElementById('searchBox');
							var searchBox = new google.maps.places.SearchBox(input);
							map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
							map.addListener('bounds_changed', function()
							{
								searchBox.setBounds(map.getBounds());
							});
							map.addListener('bounds_changed', function()
							{
								searchBox.setBounds(map.getBounds());
								$('#zoom-input').val(map.getZoom());
							});
							searchBox.addListener('places_changed', function()
							{
								var places = searchBox.getPlaces();
								if (places.length == 0)
								{
									return;
								}
								var bounds = new google.maps.LatLngBounds();
								places.forEach(function(place)
								{
									var icon = {
										url: place.icon,
										size: new google.maps.Size(71, 71),
										origin: new google.maps.Point(0, 0),
										anchor: new google.maps.Point(17, 34),
										scaledSize: new google.maps.Size(25, 25)
									};
									if (place.geometry.viewport)
									{
										bounds.union(place.geometry.viewport);
									}
									else
									{
										bounds.extend(place.geometry.location);
									}
								});
								map.fitBounds(bounds);
								
								
							});
							 
							
							google.maps.event.addListener(map, 'click', function(event) {
								addMarker(event.latLng, map);
							});
							
							<!-- BEGIN: addMarker -->					 
							addMarker(bangalore, map);
							<!-- END: addMarker -->
							
							

							document.getElementById('diachi').addEventListener('click', function() {
								if( $('#project').val() == 0)
								{
									geocodeAddress(geocoder, map, 'address');
								}else
								{
									geocodeAddress(geocoder, map, 'location');
								}
								
							});
						}
						var currentId = 0;
						var uniqueId = function() {
							return ++currentId;
						}
						function removeMarkers() {
							if( markers.length != 0 )
							{
								for (var i = 0; i < markers.length; i++) 
								{
									if( markers[i] )
									{
										markers[i].setMap(null);
									}			
								}
								markers.length=0;
							}
						}
						
						function addMarker(location, map) {
							
							var markerId = uniqueId(); 
							 
							var marker = new google.maps.Marker({
								map: map,
								position: location,
								id: markerId,
								title: $('#diachi').val(),
								draggable:true
							});
							if( $('#diachi').val().length > 0 )
							{
								var contentString = '<style>a{text-decoration: none;color: blue}</style><div id="content">' +
								  '<div id="siteNotice">' +
								  '</div>' +
								  '<strong id="firstHeading" class="firstHeading">'+ $('#diachi').val() +'</strong>' +
								  '</div>';
								  
								var infowindowbdstrananh = new google.maps.InfoWindow({
									content: contentString
								});

								if (infowindowbdstrananh != null) infowindowbdstrananh.open(map, marker);
								
							}
							
							
							removeMarkers();

							markers[markerId] = marker; // cache marker in markers object
							markers.push(marker);
							bindMarkerEvents(markerId, marker); // bind right click event to marker
							$('#lat-input').val(location['lat']);
							$('#lng-input').val(location['lng']);
							$('#zoom-input').val(map.getZoom());
							google.maps.event.addListener(
								marker,
								'drag',
								function() {
									$('#lat-input').val( marker.position.lat() ) ;
									$('#lng-input').val( marker.position.lng() ) ;
									$('#zoom-input').val(map.getZoom()); 
								}
							);
							
						}

						function bindMarkerEvents (markerId, marker) {
							google.maps.event.addListener(marker, "rightclick", function (point) {
								var marker = markers[markerId]; // find marker
								removeMarker(marker, markerId); // remove it
							});
						};


						function removeMarker (marker, markerId) {
							marker.setMap(null); // set markers setMap to null to remove it from map
							delete markers[markerId]; // delete marker instance from markers object
						};  
						

						function geocodeAddress(geocoder, resultsMap, by) {
							if( by == 'address')
							{
								var address = document.getElementById('diachi').value;
								var input = {'address': address};
							}
							else
							{
 
								var lat = $( "#project option:selected" ).attr('lat');
								var lng = $( "#project option:selected" ).attr('lng');
								var latlng = {lat: parseFloat(lat), lng: parseFloat(lng)};
								var input = {'location': latlng};
							} 
 
							geocoder.geocode(input, function(results, status) {
								if (status === google.maps.GeocoderStatus.OK) 
								{
									resultsMap.setCenter(results[0].geometry.location);
								  
									addMarker(results[0].geometry.location, resultsMap);
								   
								} 
								else 
								{
									alert('Geocode was not successful for the following reason: ' + status);
								}
							});
						}
						
						
						</script>
						<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7_ZyiNQBuJxZKsoOWWNGshZx8kewMt7o&libraries=places&callback=initMap"
						async defer></script>
 
					  

<script type="text/javascript">

	$(document).ready(function() {
	  $("select").select2();
	});
	
	$( 'body' ).on('change', '#city', function(e) {
	var provinceid = $(this).val();
	$.ajax({
		type: 'post',
		url: script_name + '?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=add&nocache=' + new Date().getTime(),
		data: {action: 'district', provinceid_ajax: provinceid, token: '{TOKEN}' },
		dataType: 'json',	
		beforeSend: function( ) {	
			$('#loading_district').show(); 
			$('#district').prop('disabled', true); 
		},	
		complete: function() {
			$('#loading_district').hide(); 
			$('#district').prop('disabled', false); 	 
			$('#ward').html('<option value="0">{LANG.post_select_area}</option>'); 	
			$('#street').html('<option value="0">{LANG.post_select_area}</option>'); 	
			$('#project').html('<option value="0">{LANG.post_select_project}</option>'); 	
		
		},
		success: function(json) {		console.log( json['data']);
			if( json['data'] )
			{
				$('#diachi').val( $( "#city option:selected" ).text() ).trigger('click');
				var tmp ='';
					tmp+='<option value="0">{LANG.post_select_area}</option>';
				$.each(json['data'], function(key, item){
					tmp+='<option value="'+ item['districtid'] +'">'+ item['type'] +' '+ item['title'] +'</option>';
				});
				$('#district').html( tmp );
			}			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});  	  
	e.preventDefault();
});

$( 'body' ).on('change', '#district', function(e) {
	var district_id = $(this).val();
	$.ajax({
		type: 'post',
		url: script_name + '?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=add&nocache=' + new Date().getTime(),
		data: {action: 'ward_project_street', district_id_ajax: district_id, token: '{TOKEN}' },
		dataType: 'json',	
		beforeSend: function( ) {	
			$('#loading_ward').show(); 
			$('#ward').prop('disabled', true); 
			$('#ward').html('<option value="0">{LANG.post_select_area}</option>'); 
		},	
		complete: function() {
			$('#loading_ward').hide(); 
			$('#ward').prop('disabled', false); 	 
				
		},
		success: function(json) {	
			if( json['ward'] )
			{
 
				var city = $( "#city option:selected" ).text() + ', ';
				var district = $( "#district option:selected" ).text() + ', ';
				var address  = address = district + city;
 
				$('#address').val( address ).trigger('click');
				
				var geocoder = new google.maps.Geocoder();
				geocoder.geocode({"address": address, "region": "vi"}, function(results, status){
					if(status == google.maps.GeocoderStatus.OK){
						console.log( results );
					}
				})

				//var geocoder= new google.maps.Geocoder();
				//var fullAdressData = '';
				//geocoder.geocode( { 'address': address}, function(results, status){
					
					
					//if (status==google.maps.GeocoderStatus.OK){

					//	fullAdressData = results[0].formatted_address;

					//} else{ alert("Invalid Address"); }
				//});
 
				var tmp ='';
					tmp+='<option value="0">{LANG.post_select_area}</option>';
				$.each(json['ward'], function(key, item){
					tmp+='<option value="'+ item['wardid'] +'">' + item['type'] +' '+ item['title'] +'</option>';
				});
				$('#ward').html( tmp );
				
			
				
				var tmp ='';
					tmp+='<option value="0">{LANG.post_select_area}</option>';
				$.each(json['street'], function(key, item){
					tmp+='<option value="'+ item['street_id'] +'" rel="'+item['type']+' ">'+ item['title'] +'</option>';
				});
				$('#street').html( tmp );
			}			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});  	  
	e.preventDefault();
});

$( 'body' ).on('change', '#ward', function(e) {
	if( $( "#project").val() == 0 )
	{
		var cityname = $( "#city option:selected" ).text();
		var districtname = $( "#district option:selected" ).text();
		var wardname = $( "#ward option:selected" ).text();
		$('#address').val(  wardname +', ' + districtname + ', ' + cityname ).trigger('click');
	}
	
	e.preventDefault();
});
$( 'body' ).on('change', '#street', function(e) {
	if( $( "#project").val() == 0 )
	{
		var cityname = $( "#city option:selected" ).text();
		var districtname = $( "#district option:selected" ).text();
		var ward = $( "#ward option:selected" ).text();
		var streetname = $( "#street option:selected" ).text();
		var type = $( "#street option:selected" ).attr('rel');
		$('#address').val(  type + streetname +',  ' + ward + ', ' + districtname + ', ' + cityname ).trigger('click');
	}
	
	e.preventDefault();
});
$( 'body' ).on('change', '#project', function(e) {
	var city_name = $( "#city option:selected" ).text();
	var district_name = $( "#district option:selected" ).text();
	
	if( $('#project').val() > 0 )
	{
		var project_name = $( "#project option:selected" ).text();
		$('#address').val( 'Dự án ' + project_name +', ' + district_name + ', ' + city_name ).trigger('click');
	
	}else
	{
		$('#address').val(  district_name + ', ' + city_name ).trigger('click');
		
	}
	e.preventDefault();
});

</script>

</div>

</div>

	<div class="form-group">
		<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.dia_chi}</strong></label>
		<div class="col-sm-19 col-md-20">
			<input class="form-control" type="text" name="address_full" value="{ROW.address_full}" />
		</div>
	</div>
	<div class="form-group" style="text-align: center"><input class="btn btn-primary" name="submit" type="submit" value="{LANG.save}" /></div>
</form>
</div></div>

<script type="text/javascript">
//<![CDATA[
	function nv_get_alias(id) {
		var title = strip_tags( $("[name='title']").val() );
		if (title != '') {
			$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'get_alias_title=' + encodeURIComponent(title), function(res) {
				$("#"+id).val( strip_tags( res ) );
			});
		}
		return false;
	}
	function nv_change_weight(id) {
		var nv_timer = nv_settimeout_disable('id_weight_' + id, 5000);
		var new_vid = $('#id_weight_' + id).val();
		$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'ajax_action=1&id=' + id + '&new_vid=' + new_vid, function(res) {
			var r_split = res.split('_');
			if (r_split[0] != 'OK') {
				alert(nv_is_change_act_confirm[2]);
			}
			window.location.href = script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main';
			return;
		});
		return;
	}


	function nv_change_status(id) {
		var new_status = $('#change_status_' + id).is(':checked') ? true : false;
		if (confirm(nv_is_change_act_confirm[0])) {
			var nv_timer = nv_settimeout_disable('change_status_' + id, 5000);
			$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'change_status=1&id='+id, function(res) {
				var r_split = res.split('_');
				if (r_split[0] != 'OK') {
					alert(nv_is_change_act_confirm[2]);
				}
			});
		}
		else{
			$('#change_status_' + id).prop('checked', new_status ? false : true );
		}
		return;
	}


//]]>
</script>

<script type="text/javascript">

	$("#img_home_img").click(function() {
		var area = "id_home_img";
		var path = "{NV_UPLOADS_DIR}/{MODULE_NAME}";
		var currentpath = "{NV_UPLOADS_DIR}/{MODULE_NAME}";
		var type = "image";
		nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&path=" + path + "&type=" + type + "&currentpath=" + currentpath, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
		return false;
	});	
</script>

<!-- BEGIN: auto_get_alias -->
<script type="text/javascript">
//<![CDATA[
	$("[name='title']").change(function() {
		nv_get_alias('id_alias');
	});
//]]>
</script>
<!-- END: auto_get_alias -->
<!-- END: main -->