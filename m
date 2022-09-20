Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1982AC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Az9ts80KByyaEqSOlAB8KOJSqOOP+tts7OWLSJfH1qA=; b=rgVSGP7fCNXItNmJwHyE+qglyA
	NDRYeZdiHe0deY+Ij4AUy8N8xLRoCXaiKHlQpr62eFHEHhBJJ6p/JX6lW44sbKw4tO+mRkT0Af4r/
	g5UH62I/N1Ed89iTCqy2kxaxS/bjhqYxs6nc+877ruq2gwBbhUnZFsOMKVePzUB26iCtLDdDxvHEe
	L5ZXgsjkqFrOcPtjqmcSAx7plEL3qYoSjuJF8NKxyI8Bt0OBktixCbh+ZPqZSrldvKXhU05hNcsKo
	zJ8RoxxYua9mNqzQhQPWMZSudW7R9Giexw6BXd1a7MSYtd3MgmXzUu/lVFjJrncOjbgYmVz3rR0yy
	uffDF3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZJI-002G3V-4j; Tue, 20 Sep 2022 09:12:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZHp-002Ev0-7C; Tue, 20 Sep 2022 09:11:27 +0000
X-UUID: 148c73ad5a194387ada517c61e033f19-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Az9ts80KByyaEqSOlAB8KOJSqOOP+tts7OWLSJfH1qA=;
	b=KsRY4P60a5Y3/m6kpQH3S0pfWhlqprK77WzdrVVwJxynSPNL7z8Vspipt8kBYlfoDeKcQvgisSx2mm/d6ad0sF/HnUVXhN6VV02B/ctBgEbKt0+iNq5uouQFT+6raO9tKUPqgjCIhTldpKn+MgI0yG9k9vUEIS+92+Ea8Y5XLjQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:8aff0b00-9d91-404d-bc58-028f264b635d,IP:0,U
	RL:0,TC:0,Content:47,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:47
X-CID-META: VersionHash:39a5ff1,CLOUDID:8761445e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 148c73ad5a194387ada517c61e033f19-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2040686198; Tue, 20 Sep 2022 02:11:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 20 Sep 2022 17:00:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 07/18] phy: mediatek: hdmi: mt2701: use FIELD_PREP to prepare bits field
Date: Tue, 20 Sep 2022 17:00:27 +0800
Message-ID: <20220920090038.15133-8-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_021125_372862_9459810D 
X-CRM114-Status: GOOD (  10.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use FIELD_PREP() macro to prepare bits field value, then no need define
macros of bits offset.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 60 ++++++++--------------
 1 file changed, 21 insertions(+), 39 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index ce36f37c698d..af6e8ed348cb 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -7,30 +7,21 @@
 #include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0	0x00
-#define RG_HDMITX_DRV_IBIAS		0
 #define RG_HDMITX_DRV_IBIAS_MASK	GENMASK(5, 0)
-#define RG_HDMITX_EN_SER		12
 #define RG_HDMITX_EN_SER_MASK		GENMASK(15, 12)
-#define RG_HDMITX_EN_SLDO		16
 #define RG_HDMITX_EN_SLDO_MASK		GENMASK(19, 16)
-#define RG_HDMITX_EN_PRED		20
 #define RG_HDMITX_EN_PRED_MASK		GENMASK(23, 20)
-#define RG_HDMITX_EN_IMP		24
 #define RG_HDMITX_EN_IMP_MASK		GENMASK(27, 24)
-#define RG_HDMITX_EN_DRV		28
 #define RG_HDMITX_EN_DRV_MASK		GENMASK(31, 28)
 
 #define HDMI_CON1	0x04
-#define RG_HDMITX_PRED_IBIAS		18
 #define RG_HDMITX_PRED_IBIAS_MASK	GENMASK(21, 18)
 #define RG_HDMITX_PRED_IMP		BIT(22)
-#define RG_HDMITX_DRV_IMP		26
 #define RG_HDMITX_DRV_IMP_MASK		GENMASK(31, 26)
 
 #define HDMI_CON2	0x08
 #define RG_HDMITX_EN_TX_CKLDO		BIT(0)
 #define RG_HDMITX_EN_TX_POSDIV		BIT(1)
-#define RG_HDMITX_TX_POSDIV		3
 #define RG_HDMITX_TX_POSDIV_MASK	GENMASK(4, 3)
 #define RG_HDMITX_EN_MBIAS		BIT(6)
 #define RG_HDMITX_MBIAS_LPF_EN		BIT(7)
@@ -39,30 +30,20 @@
 #define RG_HDMITX_RESERVE_MASK		GENMASK(31, 0)
 
 #define HDMI_CON6	0x18
-#define RG_HTPLL_BR			0
 #define RG_HTPLL_BR_MASK		GENMASK(1, 0)
-#define RG_HTPLL_BC			2
 #define RG_HTPLL_BC_MASK		GENMASK(3, 2)
-#define RG_HTPLL_BP			4
 #define RG_HTPLL_BP_MASK		GENMASK(7, 4)
-#define RG_HTPLL_IR			8
 #define RG_HTPLL_IR_MASK		GENMASK(11, 8)
-#define RG_HTPLL_IC			12
 #define RG_HTPLL_IC_MASK		GENMASK(15, 12)
-#define RG_HTPLL_POSDIV			16
 #define RG_HTPLL_POSDIV_MASK		GENMASK(17, 16)
-#define RG_HTPLL_PREDIV			18
 #define RG_HTPLL_PREDIV_MASK		GENMASK(19, 18)
-#define RG_HTPLL_FBKSEL			20
 #define RG_HTPLL_FBKSEL_MASK		GENMASK(21, 20)
 #define RG_HTPLL_RLH_EN			BIT(22)
-#define RG_HTPLL_FBKDIV			24
 #define RG_HTPLL_FBKDIV_MASK		GENMASK(30, 24)
 #define RG_HTPLL_EN			BIT(31)
 
 #define HDMI_CON7	0x1c
 #define RG_HTPLL_AUTOK_EN		BIT(23)
-#define RG_HTPLL_DIVEN			28
 #define RG_HTPLL_DIVEN_MASK		GENMASK(30, 28)
 
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
@@ -128,33 +109,33 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_IC),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_IC_MASK, 0x1),
 			  RG_HTPLL_IC_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_IR),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_IR_MASK, 0x1),
 			  RG_HTPLL_IR_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON2, (pos_div << RG_HDMITX_TX_POSDIV),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON2, FIELD_PREP(RG_HDMITX_TX_POSDIV_MASK, pos_div),
 			  RG_HDMITX_TX_POSDIV_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (1 << RG_HTPLL_FBKSEL),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_FBKSEL_MASK, 1),
 			  RG_HTPLL_FBKSEL_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (19 << RG_HTPLL_FBKDIV),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_FBKDIV_MASK, 19),
 			  RG_HTPLL_FBKDIV_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON7, (0x2 << RG_HTPLL_DIVEN),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON7, FIELD_PREP(RG_HTPLL_DIVEN_MASK, 0x2),
 			  RG_HTPLL_DIVEN_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0xc << RG_HTPLL_BP),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_BP_MASK, 0xc),
 			  RG_HTPLL_BP_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x2 << RG_HTPLL_BC),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_BC_MASK, 0x2),
 			  RG_HTPLL_BC_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_BR),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_BR_MASK, 0x1),
 			  RG_HTPLL_BR_MASK);
 
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PRED_IMP);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1, (0x3 << RG_HDMITX_PRED_IBIAS),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1, FIELD_PREP(RG_HDMITX_PRED_IBIAS_MASK, 0x3),
 			  RG_HDMITX_PRED_IBIAS_MASK);
 	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1, (0x28 << RG_HDMITX_DRV_IMP),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1, FIELD_PREP(RG_HDMITX_DRV_IMP_MASK, 0x28),
 			  RG_HDMITX_DRV_IMP_MASK);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4, 0x28, RG_HDMITX_RESERVE_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0, (0xa << RG_HDMITX_DRV_IBIAS),
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0, FIELD_PREP(RG_HDMITX_DRV_IBIAS_MASK, 0xa),
 			  RG_HDMITX_DRV_IBIAS_MASK);
 	return 0;
 }
@@ -164,9 +145,10 @@ static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 	unsigned long out_rate, val;
+	u32 tmp;
 
-	val = (readl(hdmi_phy->regs + HDMI_CON6)
-	       & RG_HTPLL_PREDIV_MASK) >> RG_HTPLL_PREDIV;
+	tmp = readl(hdmi_phy->regs + HDMI_CON6);
+	val = FIELD_GET(RG_HTPLL_PREDIV_MASK, tmp);
 	switch (val) {
 	case 0x00:
 		out_rate = parent_rate;
@@ -179,14 +161,14 @@ static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
 		break;
 	}
 
-	val = (readl(hdmi_phy->regs + HDMI_CON6)
-	       & RG_HTPLL_FBKDIV_MASK) >> RG_HTPLL_FBKDIV;
+	val = FIELD_GET(RG_HTPLL_FBKDIV_MASK, tmp);
 	out_rate *= (val + 1) * 2;
-	val = (readl(hdmi_phy->regs + HDMI_CON2)
-	       & RG_HDMITX_TX_POSDIV_MASK);
-	out_rate >>= (val >> RG_HDMITX_TX_POSDIV);
 
-	if (readl(hdmi_phy->regs + HDMI_CON2) & RG_HDMITX_EN_TX_POSDIV)
+	tmp = readl(hdmi_phy->regs + HDMI_CON2);
+	val = FIELD_GET(RG_HDMITX_TX_POSDIV_MASK, tmp);
+	out_rate >>= val;
+
+	if (tmp & RG_HDMITX_EN_TX_POSDIV)
 		out_rate /= 5;
 
 	return out_rate;
-- 
2.18.0


