#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
SHED_PKG_LOCAL_DOCDIR="/usr/share/doc/${SHED_PKG_NAME}-${SHED_PKG_VERSION}"
# Patch an issue with Perl v5.22 and later
sed -i 's:\\\${:\\\$\\{:' intltool-update.in &&
# Configure
./configure --prefix=/usr \
            --docdir="$SHED_PKG_LOCAL_DOCDIR" &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
# Install Documentation
if [ -n "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    install -v -Dm644 doc/I18N-HOWTO "${SHED_FAKE_ROOT}${SHED_PKG_LOCAL_DOCDIR}/I18N-HOWTO" || exit 1
else
    rm -rf "${SHED_FAKE_ROOT}/usr/share/doc"
fi
