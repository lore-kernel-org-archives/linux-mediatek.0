From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 4/4] net: stmmac: dwmac-mediatek: modify csr_clk value to fix mdio read/write fail
Date: Mon, 29 Apr 2019 14:15:56 +0800
Message-ID: <1556518556-32464-5-git-send-email-biao.huang@mediatek.com>
References: <1556518556-32464-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556518556-32464-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <joabreu@synopsys.com>, davem@davemloft.net
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

The frequency of  csr clock is 66.5MHz, so the csr_clk value should
be 0. Modify the csr_clk value to fix mdio read/write fail issue.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index bf25629..6b12d0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -346,8 +346,8 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(plat_dat);
 
 	plat_dat->interface = priv_plat->phy_mode;
-	/* clk_csr_i = 250-300MHz & MDC = clk_csr_i/124 */
-	plat_dat->clk_csr = 5;
+	/* clk_csr_i = 60-100MHz & MDC = clk_csr_i/42 */
+	plat_dat->clk_csr = 0;
 	plat_dat->has_gmac4 = 1;
 	plat_dat->has_gmac = 0;
 	plat_dat->pmt = 0;
-- 
1.7.9.5
