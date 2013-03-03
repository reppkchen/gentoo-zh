# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Tencent QQ for Linux by longine"
HOMEPAGE="http://www.longene.org/"
SRC_URI="http://www.longene.org/download/WineQQ2012-${PV}-Longene.deb"

LICENSE="Tencent"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="amd64? (
			emul-linux-x86-gtklibs
        )
		>=app-emulation/wine-1.5.23[wine32,-win64,fontconfig,mp3,truetype,X,nls,xml]
		!amd64? ( x11-libs/gtk+:2 )
		"

RDEPEND="${DEPEND}"

RESTRICT="mirror strip"

QA_PRESTRIPPED="opt/linuxqq/qq"

src_install() {
	tar xzvf data.tar.gz -C ${D}/
	chmod 755 ${D}/opt
	chmod 755 ${D}/usr
	cp ${FILESDIR}/qq2012.sh ${D}/opt/bin/qq2012.sh
	rm -rf ${D}/opt/longene/qq2012/wine
}
