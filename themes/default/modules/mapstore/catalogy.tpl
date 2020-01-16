<!-- BEGIN: main -->

<div class="content_cuahang">

	<div class="loai_cuahang">
		<div class="title_loai_cuahang"><h2><a href="{cata.link}" title="{cata.title}" alt="{cata.title}">{cata.title}</a></h2></div>
		<div class="row">
			<div class="danhsach_cuahang">
				<!-- BEGIN: loop -->
					<div class="col-xs-24 col-sm-2 col-md-8">
						<div class="item_cuahang">
							<div class="image_cuahang"><a href="{row.link}" title="{row.title}" alt="{row.title}"><img src="{row.image}" alt="{row.title}" title="{row.title}"/></a></div>
							<div class="title_cuahang"><a href="{row.link}" title="{row.title}" alt="{row.title}">{row.title}</a></div>
							<div class="title_cuahang">{LANG.sdt}: <a href="tel:{row.sdt}">{row.sdt}</a></div>
							<div class="diachi_cuahang">{row.dia_chi_day_du}</div>
						</div>
					</div>
				<!-- END: loop -->
			</div>
		</div>
	</div>
	
</div>
<!-- END: main -->