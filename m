From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 4/8] net: dsa: add support for GMAC2 wired to ext
Date: Fri, 14 Dec 2018 17:48:43 +0100
Message-ID: <20181214164847.4851-5-frank-w@public-files.de>
References: <20181214164847.4851-1-frank-w@public-files.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181214164847.4851-1-frank-w@public-files.de>
Sender: netdev-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

cpu-ports of mt7530 need some special flags to be set

based on
https://github.com/openwrt/openwrt/blob/master/target/linux/mediatek/patches-4.14/0032-net-dsa-mediatek-add-support-for-GMAC2-wired-to-ext-.patch

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/dsa/mt7530.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a5de9bffe5be..a6a15a063e3e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1277,6 +1277,11 @@ mt7530_setup(struct dsa_switch *ds)
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
+	if (!dsa_is_cpu_port(ds, 5)) {
+		val |= MHWTRAP_P5_DIS;
+		val |= MHWTRAP_P5_MAC_SEL;
+		val |= MHWTRAP_P5_RGMII_MODE;
+	}
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
 	/* Enable and reset MIB counters */
-- 
2.17.1
