

mkdir phplib -p
cd phplib
phplib=`pwd`

yum install libXau-devel -y
yum install ibX* -y
yum install libxslt-devel -y
yum install net-snmp-devel -y
yum install readline-devel -y
yum install aspell-devel -y
yum install unixODBC-devel -y
yum install libicu-devel -y
yum install libc-client-devel -y
yum install freetype-devel -y
yum install libXpm-devel -y
yum install libpng-devel -y
yum install libvpx-devel -y
yum install enchant-devel -y
yum install libcurl-devel  -y
yum install lib* -y --skip-broken

yum -y install gcc gcc-c++ autoconf libjpeg libjpeg-devel \
libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel \
zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel \
ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel \
krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap \
openldap-devel nss_ldap openldap-clients openldap-servers \
gd gd2 gd-devel gd2-devel perl-CPAN pcre-devel


########################################################################
cd $phplib
git clone https://git.oschina.net/wr4ng1er/freetype-2.5.3.git
cd freetype-2.5.3  
./configure --prefix=/usr/local/freetype --enable-shared  
make && make install

########################################################################
cd $phplib
git clone https://git.oschina.net/wr4ng1er/jpeg-9a.git
cd jpeg-9a
./configure --prefix=/usr/local/jpeg --enable-shared  
make && make install

########################################################################
cd $phplib
git clone https://git.oschina.net/wr4ng1er/libgd-2.1.0.git
cd libgd-2.1.0 

sh bootstrap.sh  
./configure --prefix=/usr/local/libgd \
--enable-shared --with-jpeg \
--with-png  --with-freetype  --with-xpm \
--with-tiff --with-vpx 

make && make install

########################################################################
cd $phplib
git clone https://git.oschina.net/wr4ng1er/libmcrypt-2.5.8.git
cd libmcrypt-2.5.8
sh buildconf 
./configure && make && make install


########################################################################
cd $phplib
git clone https://git.oschina.net/wr4ng1er/libpng-1.6.16.git
cd libpng-1.6.16 

./configure --prefix=/usr/local/libpng --enable-shared 
make && make install

########################################################################
#error

cd $phplib
git clone https://git.oschina.net/wr4ng1er/libvpx-v1.3.0.git
cd libvpx-v1.3.0 
./configure --prefix=/usr/local/libvpx --enable-shared --enable-vp9 
make && make install

########################################################################
cd $phplib
git clone https://git.oschina.net/wr4ng1er/t1lib-5.1.2.git
cd t1lib-5.1.2 
./configure --prefix=/usr/local/t1lib --enable-shared  

make without_doc &&  make install

########################################################################
cd $phplib
git  clone https://git.oschina.net/wr4ng1er/tiff-4.0.3.git
cd tiff-4.0.3  
./configure --prefix=/usr/local/tiff --enable-shared  

make && make install

########################################################################
cd $phplib
git clone  https://git.oschina.net/wr4ng1er/yasm-1.2.0.git
cd yasm-1.2.0 
./configure && make && make install


