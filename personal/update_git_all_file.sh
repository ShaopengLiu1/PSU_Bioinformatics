# quick short cut to update all files pwd on a git repo

date

label=$1
[ -z $label ] && echo "no label specified, current time tag will be used" && label=$(date +"%m-%d-%y_%T")

#git add -u
#git ls-files -d | xargs git add
#git add .

git add -A
git commit -m $label
git push

echo "pipe done"
