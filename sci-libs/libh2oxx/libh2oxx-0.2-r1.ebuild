# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="C++ bindings for libh2o"
HOMEPAGE="https://github.com/mgorny/libh2oxx/"
SRC_URI="https://github.com/mgorny/libh2oxx/releases/download/${P}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug static-libs"

RDEPEND=">=sci-libs/libh2o-0.2:0="
DEPEND="${RDEPEND}"

src_configure() {
	local myconf=(
		$(use_enable debug)
		$(use_enable static-libs static)
	)

	econf "${myconf[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
