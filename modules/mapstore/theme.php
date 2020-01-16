<?php
/**
 * @Project NUKEVIET 4.x
 * @Author NV Systems (hoangnt@nguyenvan.vn)
 * @Copyright (C) 2018 NV Systems. All rights reserved
 * @License: Not free read more http://nukeviet.vn/vi/store/modules/nvtools/
 * @Createdate Sat, 30 Jun 2018 12:44:38 GMT
 */

if ( ! defined( 'NV_IS_MOD_STORE' ) ) die( 'Stop!!!' );

/**
 * nv_theme_store_main()
 * 
 * @param mixed $array_data
 * @return
 */
function nv_theme_store_main ( $array_data )
{
    global $global_config, $module_name, $module_file, $lang_module, $module_config, $module_info, $op;

    $xtpl = new XTemplate( $op . '.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file );
    $xtpl->assign( 'LANG', $lang_module );

    foreach($array_data as $cata)
	{
		$xtpl->assign( 'cata', $cata );
		if(!empty($cata['data']))
		{
			foreach($cata['data'] as $row)
			{
				$xtpl->assign( 'row', $row );
				$xtpl->parse( 'main.cata.loop' );
			}
		}
		
		$xtpl->parse( 'main.cata' );
	}

    $xtpl->parse( 'main' );
    return $xtpl->text( 'main' );
}


function nv_theme_store_map ( $array_data )
{
    global $global_config, $module_name, $module_file, $lang_module, $module_config, $module_info, $op, $nv_Cache, $id_province, $id_district, $id_ward, $db, $db_config;

    $xtpl = new XTemplate( $op . '.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file );
    $xtpl->assign( 'LANG', $lang_module );
    $xtpl->assign( 'module_name', $module_name );
    $xtpl->assign( 'EXT_URL', $global_config['rewrite_exturl'] );

    foreach($array_data as $cata)
	{
		$xtpl->assign( 'cata', $cata );
		if(!empty($cata['data']))
		{
			foreach($cata['data'] as $row)
			{
				$row['googmaps'] = @unserialize( $row['googmaps'] );
				//print_r($row['googmaps']);die;
				if( $row['googmaps'] )
				{
					$xtpl->assign( 'lat', isset( $row['googmaps']['lat'] ) ? $row['googmaps']['lat'] : '' );
					$xtpl->assign( 'lng', isset( $row['googmaps']['lng'] ) ? $row['googmaps']['lng'] : '' );
					$xtpl->assign( 'zoom', isset( $row['googmaps']['zoom'] ) ? $row['googmaps']['zoom'] : '' );

				}else{
					$xtpl->assign( 'lat', 21.01324600018122 );
					$xtpl->assign( 'lng', 105.83596636250002 );
					$xtpl->assign( 'GOOGLEMAPZOOM1', 15 );

					
				}
				// HÌNH ẢNH LOẠI
				$xtpl->assign( 'anh_chinhanh', $cata['image'] );
				$xtpl->assign( 'row', $row );
				$xtpl->parse( 'main.loop' );
				$xtpl->parse( 'main.loop_left' );
			}
		}
		
		$xtpl->parse( 'main.cata' );
	}

$sql = 'SELECT * FROM ' . $db_config['prefix'] . '_location_province';
$global_raovat_city = $nv_Cache->db( $sql, 'provinceid', 'location' );
foreach( $global_raovat_city as $key => $item )
{
	$xtpl->assign( 'CITY', array(
		'key' => $key,
		'alias' =>  $item['alias'],
		'name' => $item['title'],
		'selected' => ( $id_province == $key ) ? 'selected="selected"' : '' ) );
	$xtpl->parse( 'main.city' );
}


if( $id_province )
{
	$sql = 'SELECT districtid, title, alias FROM ' . $db_config['prefix'] . '_location_district WHERE status = 1 AND provinceid= ' . intval( $id_province ) . ' ORDER BY weight ASC';
	$result = $db->query( $sql );

	while( $data = $result->fetch() )
	{
		
		$xtpl->assign( 'DISTRICT', array(
			'key' => $data['districtid'],
			'alias' =>  $data['alias'],
			'name' => $data['title'],
			'selected' => ( $data['districtid'] == $id_district) ? 'selected="selected"' : '' ) );
		$xtpl->parse( 'main.district' );
	}
	

}

if( $id_district )
{
	$sql = 'SELECT wardid, title, alias FROM ' . $db_config['prefix'] . '_location_ward WHERE status = 1 AND districtid= ' . intval( $id_district );
	$result = $db->query( $sql );

	while( $data = $result->fetch() )
	{
		$xtpl->assign( 'WARD', array(
			'key' => $data['wardid'],
			'alias' =>  $data['alias'],
			'name' => $data['title'],
			'selected' => ( $data['wardid'] == $id_ward ) ? 'selected="selected"' : '' ) );
		$xtpl->parse( 'main.ward' );
	}
	
	
	
}




    $xtpl->parse( 'main' );
    return $xtpl->text( 'main' );
}


/**
 * nv_theme_store_detail()
 * 
 * @param mixed $array_data
 * @return
 */
function nv_theme_store_detail ( $array_data, $array_lienquan )
{
    global $global_config, $module_name, $module_file, $lang_module, $module_config, $module_info, $op, $global_array_cat;

    $xtpl = new XTemplate( $op . '.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file );
    $xtpl->assign( 'LANG', $lang_module );
	
    $xtpl->assign( 'CATA', $global_array_cat[$array_data['catalog']] );
    $xtpl->assign( 'row', $array_data );
	$row['googmaps'] = @unserialize( $array_data['googmaps'] );
	//print_r($row['googmaps']['lat']);die;
	if( $row['googmaps'] )
	{
		$xtpl->parse( 'main.addMarker' );
		
		
		$xtpl->assign( 'GOOGLEMAPLAT1', isset( $row['googmaps']['lat'] ) ? $row['googmaps']['lat'] : '' );
		$xtpl->assign( 'GOOGLEMAPLNG1', isset( $row['googmaps']['lng'] ) ? $row['googmaps']['lng'] : '' );
		$xtpl->assign( 'GOOGLEMAPZOOM1', isset( $row['googmaps']['zoom'] ) ? $row['googmaps']['zoom'] : '' );

	}else{
		$xtpl->assign( 'GOOGLEMAPLAT1', 21.01324600018122 );
		$xtpl->assign( 'GOOGLEMAPLNG1', 105.83596636250002 );
		$xtpl->assign( 'GOOGLEMAPZOOM1', 15 );

		
	}

//print_r($array_data);die;
		if(!empty($array_lienquan))
		{
			foreach($array_lienquan as $row)
			{
				$xtpl->assign( 'lienquan', $row );
				$xtpl->parse( 'main.loop_liequan' );
			}
		}
    

    $xtpl->parse( 'main' );
    return $xtpl->text( 'main' );
}

/**
 * nv_theme_store_search()
 * 
 * @param mixed $array_data
 * @return
 */
function nv_theme_store_search ( $array_data )
{
    global $global_config, $module_name, $module_file, $lang_module, $module_config, $module_info, $op;

    $xtpl = new XTemplate( $op . '.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file );
    $xtpl->assign( 'LANG', $lang_module );

    

    $xtpl->parse( 'main' );
    return $xtpl->text( 'main' );
}

/**
 * nv_theme_store_catalogy()
 * 
 * @param mixed $array_data
 * @return
 */
function nv_theme_store_catalogy ( $array_data )
{
    global $global_config, $module_name, $module_file, $lang_module, $module_config, $module_info, $op, $catid, $global_array_cat;

    $xtpl = new XTemplate( $op . '.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/' . $module_file );
    $xtpl->assign( 'LANG', $lang_module );
	
    $xtpl->assign( 'cata', $global_array_cat[$catid] );

	foreach($array_data as $row)
	{
		$xtpl->assign( 'row', $row );
		$xtpl->parse( 'main.loop' );
	}
    

    $xtpl->parse( 'main' );
    return $xtpl->text( 'main' );
}