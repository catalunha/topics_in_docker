send:
	echo 'add...'
	git add .
	echo 'commit...'
	git commit -m 'rev'
	echo 'push...'
	git push origin main

rec:
	git pull origin main
