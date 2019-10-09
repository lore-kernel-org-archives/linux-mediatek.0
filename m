From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH] net: stmmac: dwmac-mediatek: fix wrong delay value issue when resume back
Date: Wed, 9 Oct 2019 15:31:29 +0800
Message-ID: <20191009073129.5439-1-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

mac_delay value will be divided by 550/170 in mt2712_delay_stage2ps(),
which is invoked at the beginning of mt2712_set_delay(), and the value
should be restored at the end of mt2712_set_delay().
Or, mac_delay will be divided again when invoking mt2712_set_delay()
when resume back.
So, add mt2712_delay_ps2stage() to mt2712_set_delay() to recovery the
original mac_delay value.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 79f2ee37afed..cea7a0c7ce68 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -130,6 +130,31 @@ static void mt2712_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
 	}
 }
 
+static void mt2712_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
+{
+	struct mac_delay_struct *mac_delay = &plat->mac_delay;
+
+	switch (plat->phy_mode) {
+	case PHY_INTERFACE_MODE_MII:
+	case PHY_INTERFACE_MODE_RMII:
+		/* 550ps per stage for MII/RMII */
+		mac_delay->tx_delay *= 550;
+		mac_delay->rx_delay *= 550;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		/* 170ps per stage for RGMII */
+		mac_delay->tx_delay *= 170;
+		mac_delay->rx_delay *= 170;
+		break;
+	default:
+		dev_err(plat->dev, "phy interface not supported\n");
+		break;
+	}
+}
+
 static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
@@ -199,6 +224,8 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	regmap_write(plat->peri_regmap, PERI_ETH_DLY, delay_val);
 	regmap_write(plat->peri_regmap, PERI_ETH_DLY_FINE, fine_val);
 
+	mt2712_delay_stage2ps(plat);
+
 	return 0;
 }
 
-- 
2.18.0
