# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
JAVA_PKG_IUSE="source test"

DESCRIPTION="A dynamic programming language that targets the Java Virtual Machine"
HOMEPAGE="https://clojure.org/"
SRC_URI="https://download.clojure.org/install/clojure-tools-${PV}.tar.gz"

LICENSE="EPL-1.0 Apache-2.0 BSD"
SLOT="1.10"
KEYWORDS="amd64 x86 ~x86-linux"
IUSE=""

RDEPEND=">=virtual/jre-1.6"
DEPEND=">=virtual/jdk-1.6"

S=${WORKDIR}/clojure-tools/

src_install() {
    dobin clojure clj

    doman clojure.1 clj.1

    into /usr/lib/
    dolib.a deps.edn example-deps.edn

    into /usr/lib/libexec
    dolib.a clojure-tools-${PV}.jar clojure-tools-${PV}.jar
}
