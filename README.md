# script-bulk-rename-wordpress-plugins-discover-bad-plugin
Bash script for Linux shell users that helps to find bad Wordpress plugin when site shows blank page.

Usually when Wordpress site start showing blank page, i think it might be because:
A) your Wordpress upgrade failed and you need to extract original Wordpress files over your installation (backing up your files before doing that). Watch your error_log file in wordpress root folder to see which files are missing.

B) some of your wordpress plugins is not compatible and you need to find & disable that plugin

To veriffy plugins are the cause of the issue, try to rename wp-content/plugins folder to wp-content/plugins2 and load homepage (i would not advice loading admin area). If site started oading, some plugin is bad. Rename plugins folder back from plugins2 to plugins and now you can start renaming your plugin folders one by one and checking when your site start loading.

If you have too many plugins and have SSH access to your hosting account, you may try this Linux bash script

Just change "dir=" variable inside the script, backup your files and run the script.
