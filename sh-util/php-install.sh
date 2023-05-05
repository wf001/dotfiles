apt update &&
	apt install php8.1-zip php8.1-curl php8.1-dom php-cli php-mbstring compose php8.1-sqlite3 -y &&
	wget https://get.symfony.com/cli/installer -O - | bash &&
	mv /root/.symfony5/bin/symfony /usr/local/bin/symfony
