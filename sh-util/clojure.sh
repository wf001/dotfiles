apt update &&
	apt install leiningen rlwrap

curl -sLO https://raw.githubusercontent.com/greglook/cljstyle/main/script/install-cljstyle &&
	chmod +x install-cljstyle &&
	./install-cljstyle &&
	rm -f install-cljstyle

curl -sLO https://raw.githubusercontent.com/clj-kondo/clj-kondo/master/script/install-clj-kondo 
	chmod +x install-clj-kondo &&
	./install-clj-kondo &&
	rm -f install-clj-kondo

curl -O https://download.clojure.org/install/posix-install-1.11.1.1224.sh && \
	chmod +x posix-install-1.11.1.1224.sh && \
	./posix-install-1.11.1.1224.sh &&\
	rm -f posix-install-1.11.1.1224.sh



echo "finished\n"
