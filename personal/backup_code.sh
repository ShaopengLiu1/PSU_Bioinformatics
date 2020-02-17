#!/bin/bash

### check the design location before using
### remember to add "chmod u+x"
### check "crontab -e" for those cmds


###### Backup project codes
project_dir=/storage/home/sml6467/work/projects
backup_dir=/storage/home/sml6467/backup/project_code
remove_days=10

cd $backup_dir
# store code of previous date
current_date=`date +%F`
mkdir update_before_${current_date}
ls | grep -v update | xargs mv -t update_before_${current_date}
# rm backups more than some days
find $project_dir -maxdepth 1 -mindepth 1 -mtime +${remove_days} | xargs rm -rf

cd $project_dir
for file in `ls`
do
  echo $file
  cp -r ${file}/src $backup_dir/${file}
  unset file
done

echo "whole pipe done"
date



###### Refresh dates in /scratch
num_date=`date +%d`
if [ $num_date = 6 -o $num_date = 16 -o $num_date = 26 ]; then
  cd /storage/home/sml6467/scratch
  find . | xargs touch -a  
fi


