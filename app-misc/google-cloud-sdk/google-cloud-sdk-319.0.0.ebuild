# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Wrapper for the Google cloud SDK."
SLOT="0"
SRC_URI="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${PV}-linux-x86_64.tar.gz"

LICENSE="https://cloud.google.com/terms/"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/google-cloud-sdk"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
}

src_install() {
	dodir ${ROOT}/usr/share/google-cloud-sdk
	cp -R "${S}/" "${D}/usr/share/" || die "Install failed!"
	dosym ${D}/usr/share/google-cloud-sdk/bin/gcloud /usr/bin/gcloud
}

pkg_postrm() {
	if [ -h /usr/bin/gcloud ]; then
	     	rm /usr/bin/gcloud
	fi
}
