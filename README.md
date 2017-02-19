# script-bulk-rename-wordpress-plugins-discover-bad-plugin
Bash script for Linux shell users that helps to find bad Wordpress plugin when site shows blank page.

Usually when Wordpress site start showing blank page, i think it might be because:

A) your Wordpress upgrade failed and you need to watch your error_log file in wordpress root folder to see which files are missing. Download original wordpress archive (matching your current wordpress version - see wp-includes/version.php), extract original Wordpress archive files over your installation (backing up your files before doing that). 

B) some of your wordpress plugins are not compatible and you need to find & disable that plugin/s

To verify plugins are the cause of the issue, try to rename wp-content/plugins folder to wp-content/plugins2 and load homepage (i would not advice loading admin area). If site started loading, then some plugin is probably bad. So you can rename plugins folder back from plugins2 to plugins and then you can either start renaming your plugin folders (ones inside wp-content/plugins/) one by one (plugin-name -> plugin-name-disabled) and checking when your site start loading OR if you have too many plugins for manual renaming + have SSH access to your hosting account, you may try this Linux bash script

Just change "dir=" variable inside the script, backup your files and run the script.

-----
Another option to permanently disable WP plugins (i am unsure if such action may not discard some plugin settings / widget based settings) is via MySQL query: https://perishablepress.com/quickly-disable-or-enable-all-wordpress-plugins-via-the-database/ (UPDATE wp_options SET option_value = '' WHERE option_name = 'active_plugins';) after plugins disabled, one may enable one after another from admin area, but one may face issue that after enabling bad plugin, site (even admin area) will stop working, so will still force you to use File manager/ftp to remove bad plugin.
