<?php
/**
 * @Project NUKEVIET 4.x
 * @Author NV Systems (hoangnt@nguyenvan.vn)
 * @Copyright (C) 2018 NV Systems. All rights reserved
 * @License: Not free read more http://nukeviet.vn/vi/store/modules/nvtools/
 * @Createdate Sat, 30 Jun 2018 12:44:38 GMT
 */

if ( ! defined( 'NV_IS_MOD_STORE' ) ) die( 'Stop!!!' );

$key_words = $global_config['site_description'];


	
$array_data = array();

if($catid > 0)
	{
		$page_title = empty($global_array_cat[$catid]['title_seo']) ? $global_array_cat[$catid]['title'] : $global_array_cat[$catid]['title_seo'];
		$description = empty($global_array_cat[$catid]['bodytext_seo']) ? nv_clean60(strip_tags($global_array_cat[$catid]['bodytext']), 160) : $global_array_cat[$catid]['bodytext_seo'];
		$key_words = empty($global_array_cat[$catid]['keywords']) ? $global_config['site_description'] : $global_array_cat[$catid]['keywords']; 
	
		// LẤY DANH SÁCH CỬA HÀNG
		$list_row = $db->query('SELECT * FROM '. STORE . '_rows WHERE status > 0 AND catalog ='.$catid)->fetchAll();

		foreach($list_row as $item)
		{
			//print_r($global_array_cat);die;
			$item['link'] =  nv_url_rewrite(NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $item['alias'],true);
			$item['image'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $item['image'] ;
            $array_data[] = $item;
			
			
		}
	}


$contents = nv_theme_store_catalogy( $array_data );

include NV_ROOTDIR . '/includes/header.php';
echo nv_site_theme( $contents );
include NV_ROOTDIR . '/includes/footer.php';
