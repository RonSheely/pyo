echo ====== Build and install liblo. ======
wget https://sourceforge.net/projects/liblo/files/liblo/0.31/liblo-0.31.tar.gz
tar -xzf liblo-0.31.tar.gz
cd liblo-0.31
./configure 1>/dev/null
make 1>/dev/null
make install 1>/dev/null
ldconfig
cd ..

echo ====== Build and install libsndfile. ======
wget https://github.com/libsndfile/libsndfile/releases/download/1.0.31/libsndfile-1.0.31.tar.bz2
tar -xzf libsndfile-1.0.31.tar.bz2
cd libsndfile-1.0.31
./autogen.sh
./configure
make 1>/dev/null
make install 1>/dev/null
ldconfig
cd ..

echo ====== Build and install alsa-lib. ======
wget https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.8.tar.bz2
tar -xjf alsa-lib-1.2.8.tar.bz2
cd alsa-lib-1.2.8
./configure --with-configdir=/usr/share/alsa
make 1>/dev/null
make install 1>/dev/null
ldconfig
cd ..

echo ====== Build and install jack2. ======
wget -O jack2-1.9.21.tar.gz https://github.com/jackaudio/jack2/archive/refs/tags/v1.9.21.tar.gz
tar -xzf jack2-1.9.21.tar.gz
cd jack2-1.9.21
python waf configure LDFLAGS="-lstdc++" 1>/dev/null
python waf build 1>/dev/null
python waf install 1>/dev/null
ldconfig
cd ..