DIR=/home/$(whoami)
LIST=$(find -iname .git)
for REPO in $LIST
do
	cd $REPO/../
	echo "pulling $(pwd) ..."
	git pull origin master --quiet
	cd $DIR
done
