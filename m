From: Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/4] drm/mediatek: enhance the HDMI driving current
Date: Wed, 20 Jul 2016 12:03:03 +0800
Message-ID: <1468987385-37353-3-git-send-email-bibby.hsieh@mediatek.com>
References: <1468987385-37353-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1468987385-37353-1-git-send-email-bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Junzhi Zhao <junzhi.zhao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Junzhi Zhao <junzhi.zhao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

In order to improve 4K resolution performance,
we have to enhance the HDMI driving currend
when clock rate is greater than 165MHz.

Signed-off-by: Junzhi Zhao <junzhi.zhao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c |   89 +++++++++++++++++-------
 1 file changed, 63 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
index 8a24754..a871c14 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
@@ -298,32 +298,69 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 			  (0x1 << PLL_BR_SHIFT),
 			  RG_HDMITX_PLL_BP | RG_HDMITX_PLL_BC |
 			  RG_HDMITX_PLL_BR);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON3, RG_HDMITX_PRD_IMP_EN);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4,
-			  (0x3 << PRD_IBIAS_CLK_SHIFT) |
-			  (0x3 << PRD_IBIAS_D2_SHIFT) |
-			  (0x3 << PRD_IBIAS_D1_SHIFT) |
-			  (0x3 << PRD_IBIAS_D0_SHIFT),
-			  RG_HDMITX_PRD_IBIAS_CLK |
-			  RG_HDMITX_PRD_IBIAS_D2 |
-			  RG_HDMITX_PRD_IBIAS_D1 |
-			  RG_HDMITX_PRD_IBIAS_D0);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON3,
-			  (0x0 << DRV_IMP_EN_SHIFT), RG_HDMITX_DRV_IMP_EN);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6,
-			  (hdmi_phy->drv_imp_clk << DRV_IMP_CLK_SHIFT) |
-			  (hdmi_phy->drv_imp_d2 << DRV_IMP_D2_SHIFT) |
-			  (hdmi_phy->drv_imp_d1 << DRV_IMP_D1_SHIFT) |
-			  (hdmi_phy->drv_imp_d0 << DRV_IMP_D0_SHIFT),
-			  RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
-			  RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON5,
-			  (hdmi_phy->ibias << DRV_IBIAS_CLK_SHIFT) |
-			  (hdmi_phy->ibias << DRV_IBIAS_D2_SHIFT) |
-			  (hdmi_phy->ibias << DRV_IBIAS_D1_SHIFT) |
-			  (hdmi_phy->ibias << DRV_IBIAS_D0_SHIFT),
-			  RG_HDMITX_DRV_IBIAS_CLK | RG_HDMITX_DRV_IBIAS_D2 |
-			  RG_HDMITX_DRV_IBIAS_D1 | RG_HDMITX_DRV_IBIAS_D0);
+	if (rate < 165000000) {
+		mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON3,
+					RG_HDMITX_PRD_IMP_EN);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4,
+				  (0x3 << PRD_IBIAS_CLK_SHIFT) |
+				  (0x3 << PRD_IBIAS_D2_SHIFT) |
+				  (0x3 << PRD_IBIAS_D1_SHIFT) |
+				  (0x3 << PRD_IBIAS_D0_SHIFT),
+				  RG_HDMITX_PRD_IBIAS_CLK |
+				  RG_HDMITX_PRD_IBIAS_D2 |
+				  RG_HDMITX_PRD_IBIAS_D1 |
+				  RG_HDMITX_PRD_IBIAS_D0);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON3,
+				  (0x0 << DRV_IMP_EN_SHIFT),
+				  RG_HDMITX_DRV_IMP_EN);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6,
+				  (hdmi_phy->drv_imp_clk << DRV_IMP_CLK_SHIFT) |
+				  (hdmi_phy->drv_imp_d2 << DRV_IMP_D2_SHIFT) |
+				  (hdmi_phy->drv_imp_d1 << DRV_IMP_D1_SHIFT) |
+				  (hdmi_phy->drv_imp_d0 << DRV_IMP_D0_SHIFT),
+				  RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
+				  RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON5,
+				  (hdmi_phy->ibias << DRV_IBIAS_CLK_SHIFT) |
+				  (hdmi_phy->ibias << DRV_IBIAS_D2_SHIFT) |
+				  (hdmi_phy->ibias << DRV_IBIAS_D1_SHIFT) |
+				  (hdmi_phy->ibias << DRV_IBIAS_D0_SHIFT),
+				  RG_HDMITX_DRV_IBIAS_CLK |
+				  RG_HDMITX_DRV_IBIAS_D2 |
+				  RG_HDMITX_DRV_IBIAS_D1 |
+				  RG_HDMITX_DRV_IBIAS_D0);
+	} else {
+		mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON3,
+				      RG_HDMITX_PRD_IMP_EN);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4,
+				  (0x6 << PRD_IBIAS_CLK_SHIFT) |
+				  (0x6 << PRD_IBIAS_D2_SHIFT) |
+				  (0x6 << PRD_IBIAS_D1_SHIFT) |
+				  (0x6 << PRD_IBIAS_D0_SHIFT),
+				  RG_HDMITX_PRD_IBIAS_CLK |
+				  RG_HDMITX_PRD_IBIAS_D2 |
+				  RG_HDMITX_PRD_IBIAS_D1 |
+				  RG_HDMITX_PRD_IBIAS_D0);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON3,
+				  (0xf << DRV_IMP_EN_SHIFT),
+				  RG_HDMITX_DRV_IMP_EN);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6,
+				  (hdmi_phy->drv_imp_clk << DRV_IMP_CLK_SHIFT) |
+				  (hdmi_phy->drv_imp_d2 << DRV_IMP_D2_SHIFT) |
+				  (hdmi_phy->drv_imp_d1 << DRV_IMP_D1_SHIFT) |
+				  (hdmi_phy->drv_imp_d0 << DRV_IMP_D0_SHIFT),
+				  RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
+				  RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON5,
+				  (hdmi_phy->ibias_up << DRV_IBIAS_CLK_SHIFT) |
+				  (hdmi_phy->ibias_up << DRV_IBIAS_D2_SHIFT) |
+				  (hdmi_phy->ibias_up << DRV_IBIAS_D1_SHIFT) |
+				  (hdmi_phy->ibias_up << DRV_IBIAS_D0_SHIFT),
+				  RG_HDMITX_DRV_IBIAS_CLK |
+				  RG_HDMITX_DRV_IBIAS_D2 |
+				  RG_HDMITX_DRV_IBIAS_D1 |
+				  RG_HDMITX_DRV_IBIAS_D0);
+	}
 	return 0;
 }
 
-- 
1.7.9.5
