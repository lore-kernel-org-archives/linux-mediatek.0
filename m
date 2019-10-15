From: Biao Huang <biao.huang@mediatek.com>
Subject: [v2, PATCH] net: stmmac: disable/enable ptp_ref_clk in suspend/resume flow
Date: Tue, 15 Oct 2019 11:24:44 +0800
Message-ID: <20191015032444.15145-2-biao.huang@mediatek.com>
References: <20191015032444.15145-1-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191015032444.15145-1-biao.huang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch
Cc: jakub.kicinski@netronome.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

disable ptp_ref_clk in suspend flow, and enable it in resume flow.

Fixes: f573c0b9c4e0 ("stmmac: move stmmac_clk, pclk, clk_ptp_ref and stmmac_rst to platform structure")
Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d3232738fb25..d7c12b86b94f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4737,8 +4737,10 @@ int stmmac_suspend(struct device *dev)
 		stmmac_mac_set(priv, priv->ioaddr, false);
 		pinctrl_pm_select_sleep_state(priv->device);
 		/* Disable clock in case of PWM is off */
-		clk_disable(priv->plat->pclk);
-		clk_disable(priv->plat->stmmac_clk);
+		if (priv->plat->clk_ptp_ref)
+			clk_disable_unprepare(priv->plat->clk_ptp_ref);
+		clk_disable_unprepare(priv->plat->pclk);
+		clk_disable_unprepare(priv->plat->stmmac_clk);
 	}
 	mutex_unlock(&priv->lock);
 
@@ -4801,8 +4803,10 @@ int stmmac_resume(struct device *dev)
 	} else {
 		pinctrl_pm_select_default_state(priv->device);
 		/* enable the clk previously disabled */
-		clk_enable(priv->plat->stmmac_clk);
-		clk_enable(priv->plat->pclk);
+		clk_prepare_enable(priv->plat->stmmac_clk);
+		clk_prepare_enable(priv->plat->pclk);
+		if (priv->plat->clk_ptp_ref)
+			clk_prepare_enable(priv->plat->clk_ptp_ref);
 		/* reset the phy so that it's ready */
 		if (priv->mii)
 			stmmac_mdio_reset(priv->mii);
-- 
2.18.0
