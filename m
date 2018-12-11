From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 6/7] [DSA] tell GDMA when we are turning on the special tag
Date: Tue, 11 Dec 2018 20:33:13 +0100
Message-ID: <20181211193314.10695-6-frank-w@public-files.de>
References: <20181211193314.10695-1-frank-w@public-files.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211193314.10695-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

based on
https://github.com/openwrt/openwrt/blob/master/target/linux/mediatek/patches-4.14/0044-net-next-dsa-mediatek-tell-GDMA-when-we-are-turning-.patch

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/dsa/mt7530.c | 6 ++++++
 drivers/net/dsa/mt7530.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 441320d4d779..83669f53cb36 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -681,6 +681,12 @@ mt7530_cpu_port_enable(struct mt7530_priv *priv,
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
 
+	/* Enable Mediatek header mode on the GMAC that the cpu port
+	 * connects to
+	 */
+	regmap_write_bits(priv->ethernet, MTK_GDMA_FWD_CFG(port),
+			  GDMA_SPEC_TAG, GDMA_SPEC_TAG);
+
 	/* Setup the MAC by default for the cpu port */
 	mt7530_write(priv, MT7530_PMCR_P(port), PMCR_CPUP_LINK);
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index d9b407a22a58..310f2536175b 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -23,6 +23,10 @@
 
 #define TRGMII_BASE(x)			(0x10000 + (x))
 
+/* Registers for GDMA configuration access */
+#define MTK_GDMA_FWD_CFG(x)		(0x500 + (x * 0x1000))
+#define GDMA_SPEC_TAG			BIT(24)
+
 /* Registers to ethsys access */
 #define ETHSYS_CLKCFG0			0x2c
 #define  ETHSYS_TRGMII_CLK_SEL362_5	BIT(11)
-- 
2.17.1
