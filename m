From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next v4 0/3] net: ethernet: mediatek: convert to PHYLINK
Date: Sun, 25 Aug 2019 19:43:38 +0200
Message-ID: <20190825174341.20750-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Frank Wunderlich <frank-w@public-files.de>, Stefan Roese <sr@denx.de>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

These patches converts mediatek driver to PHYLINK API.

v3->v4:
* Phylink improvements and clean-ups after review
v2->v3:
* Phylink improvements and clean-ups after review
v1->v2:
* Rebase for mt76x8 changes
* Phylink improvements and clean-ups after review
* SGMII port doesn't support 2.5Gbit in SGMII mode only in BASE-X mode.
  Refactor the code.


René van Dorst (3):
  net: ethernet: mediatek: Add basic PHYLINK support
  net: ethernet: mediatek: Re-add support SGMII
  dt-bindings: net: ethernet: Update mt7622 docs and dts to reflect the
    new phylink API

 .../arm/mediatek/mediatek,sgmiisys.txt        |   2 -
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  28 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   1 -
 drivers/net/ethernet/mediatek/Kconfig         |   2 +-
 drivers/net/ethernet/mediatek/mtk_eth_path.c  |  75 +--
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 521 ++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  68 ++-
 drivers/net/ethernet/mediatek/mtk_sgmii.c     |  65 ++-
 8 files changed, 470 insertions(+), 292 deletions(-)

-- 
2.20.1
