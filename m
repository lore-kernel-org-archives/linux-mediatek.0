From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 2/4] net: stmmac: fix csr_clk can't be zero issue
Date: Mon, 29 Apr 2019 14:15:54 +0800
Message-ID: <1556518556-32464-3-git-send-email-biao.huang@mediatek.com>
References: <1556518556-32464-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556518556-32464-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <joabreu@synopsys.com>, davem@davemloft.net
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

The specific clk_csr value can be zero, and
stmmac_clk is necessary for MDC clock which can be set dynamically.
So, change the condition from plat->clk_csr to plat->stmmac_clk to
fix clk_csr can't be zero issue.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 818ad88..9e89b94 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4376,7 +4376,7 @@ int stmmac_dvr_probe(struct device *device,
 	 * set the MDC clock dynamically according to the csr actual
 	 * clock input.
 	 */
-	if (!priv->plat->clk_csr)
+	if (priv->plat->stmmac_clk)
 		stmmac_clk_csr_set(priv);
 	else
 		priv->clk_csr = priv->plat->clk_csr;
-- 
1.7.9.5
