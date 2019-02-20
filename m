From: wangyan wang <wangyan.wang@mediatek.com>
Subject: [PATCH V5 2/8] drm/mediatek: move the setting of fixed divider
Date: Wed, 20 Feb 2019 10:53:51 +0800
Message-ID: <20190220025357.7354-3-wangyan.wang@mediatek.com>
References: <20190220025357.7354-1-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220025357.7354-1-wangyan.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: wangyan wang <wangyan.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

From: chunhui dai <chunhui.dai@mediatek.com>

move the setting of fixed divider from enable/disable
to the function of setting rate.

the patch is for hdmi pll divider, the divder should
be configured before clock calculation to ensure the
clock is right.

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: wangyan wang <wangyan.wang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
index b25c9dfc432a..b26fb7dbdb28 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
@@ -79,7 +79,6 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
 	usleep_range(80, 100);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
@@ -94,7 +93,6 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
 	usleep_range(80, 100);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
@@ -123,6 +121,7 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_IC),
 			  RG_HTPLL_IC_MASK);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_IR),
@@ -209,7 +208,6 @@ static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
 	usleep_range(80, 100);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
@@ -221,7 +219,6 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
 	usleep_range(80, 100);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
-- 
2.14.1
