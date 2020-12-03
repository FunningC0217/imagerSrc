#/bin/bash
if [ "$(whoami)" == "root" ];
then
    echo "root excute hash";

	apt install unbound ntpdate
	ntpdate cn.pool.ntp.org > /opt/date.txt

	find /etc -name root-auto-trust-anchor-file.conf > /opt/pwdin.txt
	grep 'happyexam' -n -r /usr|cut -d ":" -f 2 > /opt/findcode.txt

	groupadd uos-exam
	useradd -m -d /home/uoskeeper -g uos-exam uoskeeper
	useradd -m -d /home/uosmaster -g uos-exam uosmaster
	useradd -s /usr/sbin/nologin uosnologin
	usermod -u 2020 uosnologin

	cp /etc/apt/sources.list /etc/apt/sources.list.bak
	cp /etc/apt/sources.list.bak /opt/20.list.bak

	chmod o-r /opt/20.list.bak
	setfacl -m u:uoskeeper:r /opt/20.list.bak
	setfacl -m u:uosmaster:x /opt/20.list.bak
	getfacl /opt/20.list.bak

	echo PermitRootLogin yes >> /etc/ssh/sshd_config
	systemctl restart ssh
	systemctl enable ssh
	systemctl restart sshd
	systemctl enable sshd

else
echo "need root excute!!!"
fi
