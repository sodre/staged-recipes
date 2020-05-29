env | sort

make -e GPU=${gpu}

mkdir -p $PREFIX/bin
install darknet -t $PREFIX/bin

mkdir -p $PREFIX/include
install -m 0644 include/darknet.h -t $PREFIX/include

mkdir -p $PREFIX/lib
install -m 0644 libdarknet.a -t $PREFIX/lib
install libdarknet.so -t $PREFIX/lib
