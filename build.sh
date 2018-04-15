#!/bin/bash
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make -j $SHED_NUM_JOBS
make DESTDIR=${SHED_FAKE_ROOT} install
install -v -Dm644 doc/I18N-HOWTO ${SHED_FAKE_ROOT}/usr/share/doc/intltool-0.51.0/I18N-HOWTO
