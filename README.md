# script-bulk-rename-wordpress-plugins-discover-bad-plugin
Bash script for Linux shell users that helps to find bad Wordpress plugin when site shows blank page.

Usually when Wordpress site start showing blank page, i think it might be because:

A) your Wordpress upgrade failed and you need to watch your error_log file in wordpress root folder to see which files are missing. Download original wordpress archive (matching your current wordpress version - see wp-includes/version.php), extract original Wordpress archive files over your installation (backing up your files before doing that). 

B) some of your wordpress plugins are not compatible and you need to find & disable that plugin/s

To verify plugins are the cause of the issue, try to rename wp-content/plugins folder to wp-content/plugins2 and load homepage (i would not advice loading admin area). If site started loading, then some plugin is probably bad. So you can rename plugins folder back from plugins2 to plugins and then you can either start renaming your plugin folders (ones inside wp-content/plugins/) one by one and checking when your site start loading OR if you have too many plugins and have SSH access to your hosting account, you may try this Linux bash script

Just change "dir=" variable inside the script, backup your files and run the script.
