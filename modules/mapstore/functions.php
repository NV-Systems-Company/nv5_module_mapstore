<?php
/**
 * @Project NUKEVIET 4.x
 * @Author NV Systems (hoangnt@nguyenvan.vn)
 * @Copyright (C) 2018 NV Systems. All rights reserved
 * @License: Not free read more http://nukeviet.vn/vi/store/modules/nvtools/
 * @Createdate Sat, 30 Jun 2018 12:44:38 GMT
 */

if ( ! defined( 'NV_SYSTEM' ) ) die( 'Stop!!!' );

define( 'NV_IS_MOD_STORE', true );
define('STORE', $db_config['dbsystem']. '.' .$db_config['prefix']. '_' . $module_data);
define('STORE_ADD', $db_config['dbsystem']. '.' .$db_config['prefix']. '_location');

// LẤY DANH SÁCH CATALOGY

global $global_array_cat;
$global_array_cat = array();

$sql = 'SELECT * FROM '. STORE . '_catalogy WHERE status > 0';
$list = $nv_Cache->db($sql, 'id', $module_name);
if (!empty($list)) {
    foreach ($list as $l) {
        $global_array_cat[$l['id']] = $l;
        $global_array_cat[$l['id']]['link'] = nv_url_rewrite(NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $l['alias'],true);
		
		$global_array_cat[$l['id']]['image'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_upload . '/' . $global_array_cat[$l['id']]['image'] ;
       
    }
}


$count_op = sizeof($array_op);
if($count_op == 1)
{
	// LẤY id danh mục ra
	
	$catid_tam = $db->query("SELECT id FROM ". STORE . "_catalogy WHERE status > 0 AND alias ='" .$array_op[0] ."'")->fetchColumn();
	
	if($catid_tam > 0)
	{
		$catid = $catid_tam;
		$op = 'catalogy';
	}
}
$id_tinhthanh = 0;
if($count_op >= 2)
{
	if(!empty($array_op[1]))
	{
		
		$id_tam = $db->query("SELECT id FROM ". STORE . "_rows WHERE status > 0 AND alias ='" .$array_op[1] ."'")->fetchColumn();
	
		if($id_tam > 0)
		{
			$id = $id_tam;
			$op = 'detail';
		}
		else
		{
			$id_tinhthanh = $db->query("SELECT provinceid FROM " . STORE_ADD."_province WHERE alias ='" .$array_op[1] ."'")->fetchColumn();
			if($count_op >= 3){
				$id_district = $db->query("SELECT districtid FROM " . STORE_ADD."_district WHERE alias ='" .$array_op[2] ."'")->fetchColumn();
			}else{
				$id_district = 0;
			}
			if($count_op >= 4){
				$id_ward = $db->query("SELECT wardid FROM " . STORE_ADD."_ward WHERE alias ='" .$array_op[3] ."'")->fetchColumn();
			}else{
				$id_ward = 0;
			}
			if($id_tinhthanh > 0)
				$op = 'map';
		}
	}
}

