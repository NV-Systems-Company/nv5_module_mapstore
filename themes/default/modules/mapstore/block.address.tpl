<!-- BEGIN: main -->
<link href="{NV_BASE_SITEURL}assets/js/select2/select2.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" data-show="after" src="{NV_BASE_SITEURL}assets/js/select2/select2.min.js"></script>
<div class="website_map_cuahang row">

<div class="content_maps col-xs-24 col-sm-16 col-md-16">
	<style>#map_canvas { width:100%; height: 700px; }</style>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyA7_ZyiNQBuJxZKsoOWWNGshZx8kewMt7o"></script>
		
		<div id="map_canvas"></div>

		<script>
		var map;
		var markersArray = [];
		var image_cuahang = 'img/';
		var bounds = new google.maps.LatLngBounds();
		var loc;

		function init(){
			var mapOptions = { mapTypeId: google.maps.MapTypeId.ROADMAP };
			map =  new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
			
			<!-- BEGIN: loop -->
			loc = new google.maps.LatLng({lat},{lng});
			bounds.extend(loc);
			addMarker(loc, '{row.title}', "active", '{row.link}', '{row.image}', '{anh_chinhanh}', '{row.sdt}', '{row.dia_chi_day_du}', '{row.website}');
			<!-- END: loop -->

			map.fitBounds(bounds);
			map.panToBounds(bounds);    
		}

		function addMarker(location, title, active, link, image, anh_loai, mobile, address, website) {   

			var markerIcon = {
				  url: anh_loai,
				  scaledSize: new google.maps.Size(40, 40),
				  origin: new google.maps.Point(0, 0),
				  anchor: new google.maps.Point(32,65),
				  labelOrigin: new google.maps.Point(40,33)
				};
				
			var marker = new google.maps.Marker({
				position: location,
				icon: markerIcon,
				map: map,
				title: title,
				status: active
			});
			
			var html ='<div class="content_map_main"><div class="tiede_map_main"><a href="'+ link +'">'+ title +'</a></div><div class="image_des_map"><a href="'+ link +'"><img style="width:100px;" src="'+ image +'"/></a></div><div class="tiede_map_main"><a href="'+ link +'">'+ title +'</a></div><div class="mobile">'+ mobile +'</div><div class="address">'+ address +'</div><div class="website">'+ website +'</div></div>';
				var infowindow = new google.maps.InfoWindow({
				  content:html
				  }); 
							
				marker.addListener('click', function() {
					 infowindow.open(map, marker); 
				});
				
				
		}

		$(function(){ init(); });
		</script>
</div>

<div class="col-xs-24 col-sm-8 col-md-8">
	<div class="title_tk_ch">Tìm kiếm cửa hàng</div>
	<div class="content_tk_cuahang">
		<div class="form-group">
				<div class="col-sm-24 col-md-24">
					<span id="getcity">
						 
							<select class="form-control tinhthanh" name="city_id" id="city">
								<option value ="0">-- Toàn quốc --</option>
								<!-- BEGIN: city -->					
								<option {CITY.selected} value="{CITY.alias}">{CITY.name}</option>
								<!-- END: city -->
							</select>
							
							
						</span>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-24 col-md-24">
					<span id="getdistrict">	 
							<select class="form-control quanhuyen" name="district_id" id="district">
								<option value="0">-- Quận/ huyện --</option>
								<!-- BEGIN: district -->					
								<option value="{DISTRICT.alias}" {DISTRICT.selected}>{DISTRICT.name}</option>
								<!-- END: district -->
							</select>
							<span id="loading_district" style="display:none"><img src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/images/load_bar.gif"></span>							
						</span>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-24 col-md-24">
					<span id="getward"> 
								<select class="form-control xaphuong" name="ward_id" id="ward">
								<option value="0">-- Xã/Phường --</option>
								<!-- BEGIN: ward -->					
								<option value="{WARD.alias}" {WARD.selected}>{WARD.name}</option>
								<!-- END: ward -->
								</select>
								<span id="loading_ward"  style="display:none"><img src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/images/load_bar.gif"></span>
							</span>
				</div>
			</div>
	</div>
	<div class="danhsach_cuahang_list">
		<ul>
			<!-- BEGIN: loop_left -->
			<li><a href="{row.link}" title="{row.title}"><i class="fa fa-circle" aria-hidden="true"></i> {row.title}</a></li>
			<!-- END: loop_left -->
		</ul>
	</div>
</div>

</div>

<script type="text/javascript">
	$(document).ready(function() {
	  $("select").select2();
	});
	$('.tinhthanh').change(function(){
		var alias = $(this).val();
	
		if(alias != '')
		{	
			window.location.href = '{NV_BASE_SITEURL}{module_name}/map/'+alias+'{EXT_URL}';
		}
	});
	
	$('.quanhuyen').change(function(){
	
		var tinhthanh = $('.tinhthanh option:selected').val();
		var alias = $(this).val();
	
		if(alias != '' && tinhthanh != '')
		{
			window.location.href = '{NV_BASE_SITEURL}{module_name}/map/'+tinhthanh+'/'+alias+'{EXT_URL}';
		}
	});
	
	$('.xaphuong').change(function(){
	
		var tinhthanh = $('.tinhthanh option:selected').val();
		var quanhuyen = $('.quanhuyen option:selected').val();
		var alias = $(this).val();
	
		if(alias != '' && tinhthanh != '' && quanhuyen != '')
		{
			window.location.href = '{NV_BASE_SITEURL}{module_name}/map/'+ tinhthanh +'/'+ quanhuyen + '/' + alias+'{EXT_URL}';
		}
	});
	
	
	
	

</script>
<!-- END: main -->