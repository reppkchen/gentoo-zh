# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit gnome2-utils

MY_P="${PN}_${PV}"

DESCRIPTION="Dark and Light panel icons to make your desktop beautiful"
HOMEPAGE="http://www.ubuntu.com/"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="
	>=x11-misc/icon-naming-utils-0.8.90
	media-gfx/imagemagick
	>=gnome-base/librsvg-2.26.0
	>=x11-themes/hicolor-icon-theme-0.10
	x11-themes/humanity-icon-theme"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

RESTRICT="binchecks mirror strip"

src_install() {
	dodir /usr/share/icons
	cp -r LoginIcons ${PN}* "${D}"/usr/share/icons
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }