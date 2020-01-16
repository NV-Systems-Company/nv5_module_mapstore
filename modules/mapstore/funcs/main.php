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
		$list_row = $db->query('SELECT * FROM '. STORE . '_rows WHERE status > 0 AND catalog ='.$catalog['id'])->fetchAll();

		foreach($list_row as $item)
		{
			$item['link'] = nv_url_rewrite(NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE  . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $global_array_cat[$catalog['id']]['alias'] . '/' . $item['alias'],true);
			$item['image'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $item['image'] ;
            $catalog['data'][] = $item;
		}
	}
	
	$array_data[] = $catalog;
}

$contents = nv_theme_store_main( $array_data );

include NV_ROOTDIR . '/includes/header.php';
echo nv_site_theme( $contents );
include NV_ROOTDIR . '/includes/footer.php';
