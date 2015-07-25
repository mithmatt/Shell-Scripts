mkdir -p ~/downloads

# Get Oracle JDK 1.7
wget --no-cookies --no-check-certificate -O ~/downloads/jdk1_7_79.tar.gz -nv --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"

tar -xf ~/downloads/jdk1_7_79.tar.gz -C /opt/
rm -rf ~/downloads

echo "export JAVA_HOME=/opt/jdk1.7.0_79" >> /etc/profile
echo "export PATH=$PATH\:$JAVA_HOME/bin" >> /etc/profile
source /etc/profile

