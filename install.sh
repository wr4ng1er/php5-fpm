


SYS_BIT=`uname -a | awk '{print $13}'`

BIT64="x86_64"

if [ "$SYS_BIT" == "$BIT64" ]
then
	ln -s /usr/lib64/libltdl.so /usr/lib/libltdl.so 
	cp -frp /usr/lib64/libXpm.so* /usr/lib/
	echo $SYS_BIT
fi

php5_build=`pwd`
export LD_LIBRARY_PATH=/usr/local/libgd/lib

#git clone https://github.com/wr4ng1er/php-5.6.8.git
tar xvf php-5.6.8.tar.bz2

cd php-5.6.8
./configure --prefix=/opt/php5 \
--with-config-file-path=/opt/php5/etc \
--with-mysql=/opt/mysql \
--with-mysqli=/opt/mysql/bin/mysql_config \
--with-mysql-sock=/tmp/mysql.sock \
--with-pdo-mysql=/opt/mysql \--with-gd \
--with-png-dir=/usr/local/libpng \
--with-jpeg-dir=/usr/local/jpeg \
--with-freetype-dir=/usr/local/freetype \
--with-xpm-dir=/usr/ \
--with-vpx-dir=/usr/local/libvpx/ \
--with-zlib-dir=/usr/local/zlib \
--with-t1lib=/usr/local/t1lib \
--with-iconv --enable-libxml --enable-xml --enable-bcmath --enable-shmop \
--enable-sysvsem --enable-inline-optimization --enable-opcache \
--enable-mbregex --enable-fpm --enable-mbstring --enable-ftp \
--enable-gd-native-ttf --with-openssl --enable-pcntl \
--enable-sockets --with-xmlrpc --enable-zip --enable-soap --without-pear \
--with-gettext --enable-session --with-mcrypt --with-curl --enable-exif \
--enable-ctype --enable-maintainer-zts --enable-debug --enable-pthreads


make && make install

cp php.ini-production /opt/php5/etc/php.ini
mv /etc/php.ini /etc/php.ini.bak
ln -s  /opt/php5/etc/php.ini /etc/php.ini
cp /opt/php5/etc/php-fpm.conf.default  /opt/php5/etc/php-fpm.conf
ln -s /opt/php5/etc/php-fpm.conf /etc/php-fpm.conf
cp sapi/fpm/init.d.php-fpm /etc/init.d/php5-fpm


cd $php5_build


cat etc/php-fpm.conf > /opt/php5/etc/php-fpm.conf
cat etc/php.ini > /opt/php5/etc/php.ini 
cat init.d/php5-fpm > /etc/init.d/php5-fpm

chmod +x  /etc/init.d/php5-fpm
chkconfig php5-fpm on

user=www  
group=www 
mkdir -p /www

id $user >& /dev/null
if [ $? -ne 0 ]
then
   	groupadd www && useradd -g www www -s /sbin/nologin -d /www
  	chown -R www:www /www
fi

 

echo 'export PATH=$PATH:/opt/php5/bin' >> /etc/profile 
echo 'export PATH=$PATH:/opt/php5/sbin' >> /etc/profile 
source /etc/profile

echo 'export PATH=$PATH:/opt/php5/bin' >> /etc/bashrc 
echo 'export PATH=$PATH:/opt/php5/sbin' >> /etc/bashrc 
source /etc/bashrc

service php5-fpm restart
sudo /etc/init.d/php5-fpm restart
netstat -tupln | grep 9000




