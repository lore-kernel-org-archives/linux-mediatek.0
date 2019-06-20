From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH v2 net-next 0/2] net: mediatek: Add MT7621 TRGMII mode support
Date: Thu, 20 Jun 2019 14:21:53 +0200
Message-ID: <20190620122155.32078-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com
Cc: netdev@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

Like many other mediatek SOCs, the MT7621 SOC and the internal MT7530
switch both supports TRGMII mode. MT7621 TRGMII speed is fix 1200MBit.

v1->v2: 
 - Fix breakage on non MT7621 SOC
 - Support 25MHz and 40MHz XTAL as MT7530 clocksource

René van Dorst (2):
  net: ethernet: mediatek: Add MT7621 TRGMII mode support
  net: dsa: mt7530: Add MT7621 TRGMII mode support

 drivers/net/dsa/mt7530.c                    | 46 ++++++++++++++++-----
 drivers/net/dsa/mt7530.h                    |  4 ++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 38 +++++++++++++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 +++++
 4 files changed, 85 insertions(+), 14 deletions(-)

-- 
2.20.1
