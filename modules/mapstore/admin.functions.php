<?php

/**
 * @Project NUKEVIET 4.x
 * @Author NV Systems (hoangnt@nguyenvan.vn)
 * @Copyright (C) 2018 NV Systems. All rights reserved
 * @License: Not free read more http://nukeviet.vn/vi/store/modules/nvtools/
 * @Createdate Sat, 30 Jun 2018 12:44:38 GMT
 */

if ( ! defined( 'NV_ADMIN' ) or ! defined( 'NV_MAINFILE' ) or ! defined( 'NV_IS_MODADMIN' ) ) die( 'Stop!!!' );
define('STORE', $db_config['dbsystem']. '.' .$db_config['prefix']. '_' . $module_data);
define('STORE_ADD', $db_config['dbsystem']. '.' .$db_config['prefix']. '_location');
define( 'NV_IS_FILE_ADMIN', true );


$allow_func = array( 'main', 'catalogy', 'add');

function getOutputJson( $json )
{
	global $global_config, $db, $lang_global, $lang_module, $language_array, $nv_parse_ini_timezone, $countries, $module_info, $site_mods;

	@Header( 'Content-Type: application/json' );
	@Header( 'Content-Type: text/html; charset=' . $global_config['site_charset'] );
	@Header( 'Content-Language: ' . $lang_global['Content_Language'] );
	@Header( 'Last-Modified: ' . gmdate( 'D, d M Y H:i:s', strtotime( '-1 day' ) ) . " GMT" );
	@Header( 'Expires: ' . gmdate( 'D, d M Y H:i:s', NV_CURRENTTIME - 60 ) . " GMT" );
	
	echo json_encode( $json );
	unset( $GLOBALS['db'], $GLOBALS['lang_module'], $GLOBALS['language_array'], $GLOBALS['nv_parse_ini_timezone'],$GLOBALS['countries'], $GLOBALS['module_info'], $GLOBALS['site_mods'], $GLOBALS['lang_global'], $GLOBALS['global_config'], $GLOBALS['client_info'] );
	
	exit();
}
