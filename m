From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH RFC net-next 0/5] net: dsa: MT7530: Convert to PHYLINK and add support for port 5
Date: Mon, 24 Jun 2019 16:52:46 +0200
Message-ID: <20190624145251.4849-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com
Cc: frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

Here by I am sending my current patches for review.
I want to know if I am on the right track.

1. 0001-net-dsa-mt7530-Convert-to-PHYLINK-API.patch
   This patch converts mt7530 to PHYLINK API.
2. 0002-dt-bindings-net-dsa-mt7530-Add-support-for-port-5.patch
3. 0003-net-dsa-mt7530-Add-support-for-port-5.patch
   These 2 patches adding support for port 5 of the switch.

Optional:
4. 0004-dt-bindings-net-dsa-mt7530-Add-mediatek-ephy-handle-.patch
5. 0005-net-dsa-mt7530-Add-mediatek-ephy-handle-to-isolate-e.patch
   These 2 patches adding property "mediatek,ephy-handle".
   When set, it puts the external phy in isolation mode.
   This allows the switch PHY of port 0/4 to interface with 2nd GMAC of
   the SOC. The external phy, 2nd GMAC and switch port 5 shares the same
   MII bus.

FWIW: Also working on converting the mediatek ethernet driver to PHYLINK.
This need a bit more work duo to the SGMII work and support hardware which 
I don't have.
https://github.com/vDorst/linux-1/commit/54004b807cba0dcec1653c1c290c2e5aae5127c2

René van Dorst (5):
  net: dsa: mt7530: Convert to PHYLINK API
  dt-bindings: net: dsa: mt7530: Add support for port 5
  net: dsa: mt7530: Add support for port 5
  dt-bindings: net: dsa: mt7530: Add mediatek,ephy-handle to isolate
    ext. phy
  net: dsa: mt7530: Add mediatek,ephy-handle to isolate external phy

 .../devicetree/bindings/net/dsa/mt7530.txt    | 329 ++++++++++++++++
 drivers/net/dsa/mt7530.c                      | 366 +++++++++++++++---
 drivers/net/dsa/mt7530.h                      |  39 ++
 3 files changed, 688 insertions(+), 46 deletions(-)

-- 
2.20.1
