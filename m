From: Joe Perches <joe@perches.com>
Subject: [PATCH 07/12] net: ethernet: mediatek: Fix misuses of GENMASK macro
Date: Tue,  9 Jul 2019 22:04:20 -0700
Message-ID: <1961dd832a1363b6dfdbac6cb0b1c71fa838d258.1562734889.git.joe@perches.com>
References: <cover.1562734889.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1562734889.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Felix Fietkau <nbd@openwrt.org>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Arguments are supposed to be ordered high then low.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 876ce6798709..221012ecb845 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -712,7 +712,7 @@ struct mtk_soc_data {
 #define MTK_MAX_DEVS			2
 
 #define MTK_SGMII_PHYSPEED_AN          BIT(31)
-#define MTK_SGMII_PHYSPEED_MASK        GENMASK(0, 2)
+#define MTK_SGMII_PHYSPEED_MASK        GENMASK(2, 0)
 #define MTK_SGMII_PHYSPEED_1000        BIT(0)
 #define MTK_SGMII_PHYSPEED_2500        BIT(1)
 #define MTK_HAS_FLAGS(flags, _x)       (((flags) & (_x)) == (_x))
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 136f90ce5a65..ff509d42d818 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -82,7 +82,7 @@ int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id)
 		return -EINVAL;
 
 	regmap_read(ss->regmap[id], ss->ana_rgc3, &val);
-	val &= ~GENMASK(2, 3);
+	val &= ~GENMASK(3, 2);
 	mode = ss->flags[id] & MTK_SGMII_PHYSPEED_MASK;
 	val |= (mode == MTK_SGMII_PHYSPEED_1000) ? 0 : BIT(2);
 	regmap_write(ss->regmap[id], ss->ana_rgc3, val);
-- 
2.15.0
