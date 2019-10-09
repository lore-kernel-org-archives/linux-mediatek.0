From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH] net: stmmac: disable/enable ptp_ref_clk in suspend/resume flow
Date: Wed, 9 Oct 2019 16:56:49 +0800
Message-ID: <20191009085649.6736-1-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

disable ptp_ref_clk in suspend flow, and enable it in resume flow.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c7c9e5f162e6..b592aeecc3dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4469,6 +4469,8 @@ int stmmac_suspend(struct device *dev)
 		stmmac_mac_set(priv, priv->ioaddr, false);
 		pinctrl_pm_select_sleep_state(priv->device);
 		/* Disable clock in case of PWM is off */
+		if (priv->plat->clk_ptp_ref)
+			clk_disable_unprepare(priv->plat->clk_ptp_ref);
 		clk_disable(priv->plat->pclk);
 		clk_disable(priv->plat->stmmac_clk);
 	}
@@ -4535,6 +4537,8 @@ int stmmac_resume(struct device *dev)
 		/* enable the clk previously disabled */
 		clk_enable(priv->plat->stmmac_clk);
 		clk_enable(priv->plat->pclk);
+		if (priv->plat->clk_ptp_ref)
+			clk_prepare_enable(priv->plat->clk_ptp_ref);
 		/* reset the phy so that it's ready */
 		if (priv->mii)
 			stmmac_mdio_reset(priv->mii);
-- 
2.18.0
