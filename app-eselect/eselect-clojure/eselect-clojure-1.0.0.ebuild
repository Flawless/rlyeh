# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == "9999" ]] ; then
    inherit autotools git-r3
    EGIT_REPO_URI="https://gitlab.last-try.org/flawless/eselect-clojure.git"
else
    SRC_URI="https://gitlab.last-try.org/flawless/eselect-clojure/-/archive/${PV}/eselect-clojure-${PV}.tar.gz"
    KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
fi

DESCRIPTION="Eselect module for management of multiple Clojure versions"
HOMEPAGE="https://github.com/flawless/clojure.eselect"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=app-admin/eselect-1.2.3"

src_install() {
    insinto /usr/share/eselect/modules
    newins "${WORKDIR}"/"${P}"/clojure.eselect clojure.eselect
}
