EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/nullobsi/clight-gui.git"

DESCRIPTION="Clight GUI written in Qt."
HOMEPAGE="https://github.com/nullobsi/clight-gui"

SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-util/cmake"
RDEPEND="dev-qt/qtcharts
	app-misc/clight-gui"
DEPEND="${RDEPEND}"

LICENSE="GPL-3"

DOCS=( README.md )

src_prepare() {
    cmake -S src
    _CMAKE_SRC_PREPARE_HAS_RUN=1
    eapply_user
}
