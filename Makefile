all:
	make -C 01-helloworld

clean:
	make -C 01-helloworld clean

install: depends refresh

depends:
	sudo apt-get update
	sudo apt-get install git-core vim build-essential -y
	sudo dpkg -i Downloads/sublime*.deb

refresh:
	git pull github master

commit: clean
	git commit -am "$(MSG)" || git commit -am "Commit at `date +'%Y-%m-%d %H:%M'`"
	git push github master

