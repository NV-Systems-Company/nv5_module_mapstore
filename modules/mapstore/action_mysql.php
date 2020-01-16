<?php
/**
 * @Project NUKEVIET 4.x
 * @Author NV Systems (hoangnt@nguyenvan.vn)
 * @Copyright (C) 2018 NV Systems. All rights reserved
 * @License: Not free read more http://nukeviet.vn/vi/store/modules/nvtools/
 * @Createdate Sat, 30 Jun 2018 12:44:38 GMT
 */

if (! defined('NV_IS_FILE_MODULES')) {
    die('Stop!!!');
}

$sql_drop_module = array();

$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_rows;";
$sql_drop_module[] = "DROP TABLE IF EXISTS " . $db_config['prefix'] . "_" . $module_data . "_catalogy;";

$sql_create_module = $sql_drop_module;

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_rows (
 id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
 title varchar(250) NOT NULL,
 alias varchar(250) NOT NULL,
 sdt varchar(250) DEFAULT '',
 catalog mediumint(9) NOT NULL DEFAULT '0',
 image varchar(255) DEFAULT '',
 website varchar(255) DEFAULT '',
 bodytext mediumtext NOT NULL,
 keywords text,
 title_seo varchar(250) NOT NULL,
 bodytext_seo text,
 tinhthanh smallint(4) NOT NULL DEFAULT '0',
 quanhuyen smallint(4) NOT NULL DEFAULT '0',
 xaphuong smallint(4) NOT NULL DEFAULT '0',
 duong smallint(4) NOT NULL DEFAULT '0',
 dia_chi varchar(250) DEFAULT '',
 dia_chi_day_du varchar(250) DEFAULT '',
 googmaps mediumblob NOT NULL,
 add_time int(11) NOT NULL DEFAULT '0',
 weight tinyint(1) unsigned NOT NULL DEFAULT '0',
 status tinyint(1) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (id),
 UNIQUE KEY alias (alias)
) ENGINE=MyISAM";

$sql_create_module[] = "CREATE TABLE " . $db_config['prefix'] . "_" . $module_data . "_catalogy (
 id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
 title varchar(250) NOT NULL,
 alias varchar(250) NOT NULL,
 image varchar(255) DEFAULT '',
 bodytext mediumtext NOT NULL,
 keywords text,
 title_seo varchar(250) NOT NULL,
 bodytext_seo text,
 weight tinyint(1) unsigned NOT NULL DEFAULT '0',
 status tinyint(1) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (id),
 UNIQUE KEY alias (alias)
)ENGINE=MyISAM";


