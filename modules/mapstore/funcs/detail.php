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
$key_words = $global_config['site_description'];

$array_data = array();

if($id > 0)
{
	$array_data = $db->query("SELECT * FROM ". STORE . "_rows WHERE status > 0 AND id =" .$id)->fetch();
	
	$page_title = empty($array_data['title_seo']) ? $array_data['title'] : $array_data['title_seo'];
	$description = empty($array_data['bodytext_seo']) ? nv_clean60(strip_tags($array_data['bodytext']), 160) : $array_data['bodytext_seo'];
	$key_words = empty($array_data['keywords']) ? $global_config['site_description'] : $array_data['keywords']; 
		
		
	$array_data['image'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $array_data['image'] ;
	
	// DANH SÁCH CỬA HÀNG CÙNG QUẬN 
	// LẤY DANH SÁCH CỬA HÀNG
		$array_lienquan = array();
		$list_row = $db->query('SELECT * FROM '. STORE . '_rows WHERE status > 0 AND id !='. $id .' AND provinceid ='.$array_data['provinceid'] .' AND districtid ='.$array_data['districtid'])->fetchAll();
		
		foreach($list_row as $item)
		{
			$item['link'] =  nv_url_rewrite(NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $item['alias'],true);
			$item['image'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $item['image'] ;
            $array_lienquan[] = $item;
		}
}

$contents = nv_theme_store_detail( $array_data, $array_lienquan);

include NV_ROOTDIR . '/includes/header.php';
echo nv_site_theme( $contents );
include NV_ROOTDIR . '/includes/footer.php';
