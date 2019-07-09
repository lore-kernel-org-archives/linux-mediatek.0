From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 1/2 net-next] net: stmmac: dwmac4: mac address array boudary violation issue
Date: Tue, 9 Jul 2019 10:36:22 +0800
Message-ID: <20190709023623.8358-2-biao.huang@mediatek.com>
References: <20190709023623.8358-1-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709023623.8358-1-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

The mac address array size is GMAC_MAX_PERFECT_ADDRESSES,
so the 'reg' should be less than it, or will affect other registers.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 8d9f6cda4012..776077ec1a23 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -454,7 +454,7 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
 			reg++;
 		}
 
-		while (reg <= GMAC_MAX_PERFECT_ADDRESSES) {
+		while (reg < GMAC_MAX_PERFECT_ADDRESSES) {
 			writel(0, ioaddr + GMAC_ADDR_HIGH(reg));
 			writel(0, ioaddr + GMAC_ADDR_LOW(reg));
 			reg++;
-- 
2.18.0
