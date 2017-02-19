# script to discover bad wordpress plugin by bulk/mass renaming plugin folders and then renaming back one by one
# USAGE:
# edit this script to updating variable "dir"
# run script and select option 1 to rename all wordpress plugin folders (so the site should start working if plugin caused an issue)
# run the script again selecting option 2 to rename back wordpress plugin folders one by one to see when site stop working so we know which plugin is bad

# full path to wordpress plugin folder without trailing slash
dir=/home/username/public_html/wp-content/plugins
string=6798

echo "------------------------------
This script should be safe, it is just just renaming folders in path you set ($dir).
Before using this script, it is always advisable to have backup of files which are in your hosting account
------------------------------"
echo "Full path to wordpress plugins (ie: /home/username/public_html/wp-content/plugins): $dir"
echo "Hit any key to list that path contents (plugin folders)"
read gdfgdf
ls -A1 $dir|grep -vE "\./|index.php|.htaccess|.htpasswd"
echo "
Do you see listed plugins which you want to disable/enable? If you can not see plugin list, then you set wrong path and therefore cancel this script by Ctrl+C."

echo "
If you see plugin list above, then continue selecting option (type number 1 or 2)
[1] (step 1) Rename all WP plugin directories so they gets DISABLED and wp site should start working (do this only if you CAN'T see $string above in plugin folder names
[2] (step 2) Rename all WP plugin directories back one by one so they gets ENABLED (do this only if you can see $string above in plugin folder names)"
read option

if [[ "$option" == "1" ]];then
echo "Disabling all WP plugins by renaming its folders:"
for plugindir in $(ls -A1 $dir|grep -vE "\./|index.php|.htaccess|.htpasswd");do mv -v $dir/$plugindir $dir/$plugindir$string;done
echo "Finished, listing plugins directory contents:"
ls -A1 $dir
echo "One should be able to access Wordpress homepage. I would NOT access admin area. Now if site homepage loading (no blank page..), try running this script again with option 2 (renaming back plugin folders one by one to discover bad plugin."
fi

if [[ "$option" == "2" ]];then
echo "Enabling all WP plugins one by one:"
for plugindir in $(ls -A1 $dir|grep "$string");do
plugindirorig=$(echo "$plugindir"|sed "s/$string//g")
mv -v $dir/$plugindir $dir/$plugindirorig
echo "RELOAD YOUR WORDPRESS SITE HOMEPAGE to see if it still loading. If not loading (blank page or such) then type \"n\" key and enter key. Otherwise hit any other key"
read zzz
if [[ "$zzz" == "n" ]];then
string2=_probablybad
echo "PLUGIN $plugindirorig MAY CAUSE PROBLEMS. Renaming plugin directory to $plugindirorig$string2"
mv -v $dir/$plugindirorig $dir/$plugindirorig$string2
echo "Please reload your wordpress site homepage again to verify that site started working and then hit any key to continue to next plugin"
read fsdfsdgsdgfdf
fi
done
echo "FINISHED. Now your site should be loading OK. All your plugins enabled, except following ones which you indicated as problematic:"
ls -A1 $dir|grep $string2
echo "So it is done, check your WP admin area, plugins page if everything is alright, then you can delete this script or write a review about it."
fi
