# timezone to JST
apt update &&\
	apt install -y tzdata && \
	ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
