# install php7.1 ver
apt update &&
	apt install software-properties-common -y &&
	add-apt-repository ppa:ondrej/php &&
	apt install php7.1 php7.1-zip php7.1-curl php7.1-dom php7.1-sqlite3 -y &&
