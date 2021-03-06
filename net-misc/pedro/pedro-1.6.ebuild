# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Pedro is a subscription/notification communications system"
HOMEPAGE="http://www.itee.uq.edu.au/~pjr/HomePages/PedroHome.html"
SRC_URI="http://www.itee.uq.edu.au/~pjr/HomePages/PedroFiles/${P}.tgz
	doc? ( mirror://gentoo/${PN}-manual-${PV}.tar.gz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="doc examples"

RDEPEND="dev-libs/glib:2"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${P}

PATCHES=( "${FILESDIR}/${P}-portage.patch" )

src_install() {
	default

	if use doc ; then
		dodoc "${WORKDIR}"/${PN}.pdf
	fi

	if use examples ; then
		docinto /usr/share/doc/${PF}/examples
		dodoc src/examples/*.{c,tcl}

		docinto /usr/share/doc/${PF}/examples/java_api
		dodoc src/java_api/*.java

		docinto /usr/share/doc/${PF}/examples/python_api
		dodoc src/python_api/*.py
	fi
}
