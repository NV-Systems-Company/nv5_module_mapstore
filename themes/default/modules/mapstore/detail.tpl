<!-- BEGIN: main -->
<div class="content_detail_cuahang">
	<div class="row">
		<div class="tt_image_detail col-xs-24 col-sm-10 col-md-10">
			<img src="{row.image}" title="{row.title}" alt="{row.title}"/>
		</div>
		<div class="tt_cuahang_detail col-xs-24 col-sm-14 col-md-14">
			<div class="title_cuahang">{row.title}</div>
			<div class="thuonghieu_cuahang">Nhóm cửa hàng: <a href="{CATA.link}" title="{CATA.title}" alt="{CATA.title}">{CATA.title}</a></div>
			<div class="sdt_cuahang">{LANG.sdt}: <a href="tel:{row.sdt}">{row.sdt}</a></div>
			<div class="diachi_cuahang">{row.dia_chi}</div>
		</div>
	</div>
	<div class="thongtin_chitiet_cuahang_map">
			<ul class="nav nav-tabs1">
			  <li class="active"><a data-toggle="tab" href="#des" aria-expanded="false">{LANG.bodytext}</a></li>
			  <li class=""><a data-toggle="tab" href="#map_tab" aria-expanded="false">{LANG.map}</a></li>
			  <li class=""><a data-toggle="tab" href="#lienquan_detail" aria-expanded="false">{LANG.lienquan_detail}</a></li>
			</ul>
			<div class="tab-content">
			  <div id="des" class="tab-pane fade active in">
					{row.bodytext}
			  </div>
			  <div id="map_tab" class="tab-pane fade">
			  
			   <div id="map_bando"></div>
				<script>

				  function initMap() {
					var myLatLng = { lat: {GOOGLEMAPLAT1}, lng: {GOOGLEMAPLNG1} };

					var map = new google.maps.Map(document.getElementById('map_bando'), {
					  zoom: 15,
					  center: myLatLng
					});

					var marker = new google.maps.Marker({
					  position: myLatLng,
					  map: map,
					  title: '{row.title}'
					});
				  }
				</script>
					
     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7_ZyiNQBuJxZKsoOWWNGshZx8kewMt7o&callback=initMap">
    </script>


			  </div>
			  <div id="lienquan_detail" class="tab-pane fade">
					<div class="content_cuahang">
					<div class="loai_cuahang">
						<div class="title_loai_cuahang"><h2>{LANG.lienquan_detail}</h2></div>
						<div class="row">
							<div class="danhsach_cuahang">
								<!-- BEGIN: loop_liequan -->
									<div class="col-xs-24 col-sm-2 col-md-8">
										<div class="item_cuahang">
											<div class="image_cuahang"><a href="{lienquan.link}" title="{lienquan.title}" alt="{lienquan.title}"><img src="{lienquan.image}" alt="{lienquan.title}" title="{lienquan.title}"/></a></div>
											<div class="title_cuahang"><a href="{lienquan.link}" title="{lienquan.title}" alt="{lienquan.title}">{lienquan.title}</a></div>
											<div class="title_cuahang">{LANG.sdt}: <a href="tel:{lienquan.sdt}">{lienquan.sdt}</a></div>
											<div class="diachi_cuahang">{lienquan.dia_chi}</div>
										</div>
									</div>
								<!-- END: loop_liequan -->
							</div>
						</div>
					</div>
					</div>
			  </div>
			</div>
	</div>
</div>
<!-- END: main -->