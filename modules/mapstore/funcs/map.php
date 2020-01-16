<?php

/**
 * @Project NUKEVIET 4.x
 * @Author NV Systems (hoangnt@nguyenvan.vn)
 * @Copyright (C) 2018 NV Systems. All rights reserved
 * @License: Not free read more http://nukeviet.vn/vi/store/modules/nvtools/
 * @Createdate Sat, 30 Jun 2018 12:44:38 GMT
 */
if ( ! defined( 'NV_IS_MOD_STORE' ) ) die( 'Stop!!!' );


$page_title = $module_info['custom_title'];
$key_words = $module_info['keywords'];

$array_data = array();

// LẤY DANH SÁCH NHÓM CỬA HÀNG RA


foreach($global_array_cat as $catalog)
{
	if($catalog['id'] > 0)
	{
		// LẤY DANH SÁCH CỬA HÀNG
		if($id_province>0 && $id_district>0 && $id_ward>0){
			$list_row = $db->query('SELECT * FROM '. STORE . '_rows WHERE status = 1 AND catalog ='.$catalog['id'] . ' AND provinceid ='.$id_province . ' AND districtid ='.$id_district . ' AND wardid ='.$id_ward)->fetchAll();
		}elseif($id_province>0 && $id_district>0){
			$list_row = $db->query('SELECT * FROM '. STORE . '_rows WHERE status = 1 AND catalog ='.$catalog['id'] . ' AND provinceid ='.$id_province . ' AND districtid ='.$id_district)->fetchAll();
		}elseif($id_province>0){
			$list_row = $db->query('SELECT * FROM '. STORE . '_rows WHERE status = 1 AND catalog ='.$catalog['id'] . ' AND provinceid ='.$id_province)->fetchAll();
		}else{
			$list_row = $db->query('SELECT * FROM '. STORE . '_rows WHERE status = 1 AND catalog ='.$catalog['id'])->fetchAll();
		}
		foreach($list_row as $item)
		{
			$item['link'] = $catalog['link'] . '/' . $item['alias'] . $global_config['rewrite_exturl'];
			$item['image'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $item['image'] ;
			$item['image_icon'] = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
            $catalog['data'][] = $item;
		}
	}
	
	$array_data[] = $catalog;
}

$contents = nv_theme_store_map( $array_data );

include NV_ROOTDIR . '/includes/header.php';
echo nv_site_theme( $contents );
include NV_ROOTDIR . '/includes/footer.php';
