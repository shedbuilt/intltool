#!/bin/bash
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make -j $SHED_NUMJOBS
make DESTDIR=${SHED_FAKEROOT} install
install -v -Dm644 doc/I18N-HOWTO ${SHED_FAKEROOT}/usr/share/doc/intltool-0.51.0/I18N-HOWTO
