apt update
apt install openjdk-8-jre-headless
apt install net-tools

cd /opt
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -zxvf latest-unix.tar.gz

adduser nexus
chown -R nexus:nexus nexus-3*
chown -R nexus:nexus sonatype-work


vi nexus-3*/bin/nexus.rc
run_as_user="nexus"

su - nexus
/opt/nexus-3*/bin/nexus start

