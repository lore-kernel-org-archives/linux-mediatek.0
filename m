From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next v2 0/3] net: ethernet: mediatek: convert to PHYLINK
Date: Wed, 21 Aug 2019 16:43:33 +0200
Message-ID: <20190821144336.9259-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, Stefan Roese <sr@denx.de>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

These patches converts mediatek driver to PHYLINK API.

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
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 502 ++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  68 ++-
 drivers/net/ethernet/mediatek/mtk_sgmii.c     |  65 ++-
 8 files changed, 447 insertions(+), 296 deletions(-)

--.
2.20.1
