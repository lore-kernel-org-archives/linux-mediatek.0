Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0A7ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJJw0kvbbzk8JEl6v2p5E93c0LkVbbFFkJRUADGsza8=; b=mscd2NHR8f4hyESHFT/rQ+CtZJ
	FI1RPs/5aEt5VHrfA1lx6XhExDLCsZQXQk1fhpfbEaTknZ8dMRspU2XLXS5XW1j94c79fVJWeA+zZ
	EpJG0Rl8ySwwQ+9GWm73dqUIE2wV0TA1CAr7yRPsc9aTQRq1DhPQ25gsNDfBLNUWtAirRGxFX0S3a
	uYl0ojHyMoqq5dSOi6AVKy5GcQmyqJfM+d4acUFccXYaKMJ2iBvmgBcFtcZK3jo3lV6mh6/0M9nFJ
	WIeWocFb6AbTzL+H4TG/B/q14iz/7ZkiTnX7eTPS1Ew43Vlay4X6AEpHLHM/1Mt+lM1uUCY8mGzix
	x63exFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ9d-0029co-48; Tue, 20 Sep 2022 09:02:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8H-0028oP-18; Tue, 20 Sep 2022 09:01:36 +0000
X-UUID: d1a90691ebe144e68fcb8f8e6651ea04-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sJJw0kvbbzk8JEl6v2p5E93c0LkVbbFFkJRUADGsza8=;
	b=SLzHle4XjcVQCFzBjN41UyCP8yOXxiIWKrD8avuEiPggvnwtLv/QnlK7/3kCdoWGwCODIhNljRTsSnIrej9yw6gdHnjUgFJJckOxmOQiR/4zcHV655W8YZugpxBEowxK+T2E0Wm+F5tX2VTdqbcjzX+m/opN+B2YsxbKGi05b2w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:491e3b2a-e943-48c5-a868-8901db5aeffa,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:39a5ff1,CLOUDID:65ef03f7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d1a90691ebe144e68fcb8f8e6651ea04-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 673943707; Tue, 20 Sep 2022 02:01:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:48 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jitao Shi
	<jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH 11/18] phy: mediatek: hdmi: mt8173: use common helper to access registers
Date: Tue, 20 Sep 2022 17:00:31 +0800
Message-ID: <20220920090038.15133-12-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020133_113672_0D090076 
X-CRM114-Status: GOOD (  12.07  )
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

Use MediaTek phy's common helper to access registers, then we can remove
hdmi's I/O helpers.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 140 ++++++++++-----------
 1 file changed, 65 insertions(+), 75 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index 8f93991fb09d..d04758396046 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -5,6 +5,7 @@
  */
 
 #include "phy-mtk-hdmi.h"
+#include "phy-mtk-io.h"
 
 #define HDMI_CON0		0x00
 #define RG_HDMITX_PLL_EN		BIT(31)
@@ -86,16 +87,17 @@
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *base = hdmi_phy->regs;
 
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON3, RG_HDMITX_MHLCK_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
+	mtk_phy_set_bits(base + HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	mtk_phy_clear_bits(base + HDMI_CON3, RG_HDMITX_MHLCK_EN);
+	mtk_phy_set_bits(base + HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
 	usleep_range(100, 150);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_EN);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_PLL_EN);
 	usleep_range(100, 150);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
+	mtk_phy_set_bits(base + HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
+	mtk_phy_set_bits(base + HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
 
 	return 0;
 }
@@ -103,15 +105,16 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *base = hdmi_phy->regs;
 
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
+	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
+	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
 	usleep_range(100, 150);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_EN);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_PLL_EN);
 	usleep_range(100, 150);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
+	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
 	usleep_range(100, 150);
 }
 
@@ -133,6 +136,7 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *base = hdmi_phy->regs;
 	unsigned int pre_div;
 	unsigned int div;
 	unsigned int pre_ibias;
@@ -153,71 +157,57 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		div = 1;
 	}
 
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  FIELD_PREP(RG_HDMITX_PLL_PREDIV, pre_div),
-			  RG_HDMITX_PLL_PREDIV);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  FIELD_PREP(RG_HDMITX_PLL_IC, 0x1) |
-			  FIELD_PREP(RG_HDMITX_PLL_IR, 0x1),
-			  RG_HDMITX_PLL_IC | RG_HDMITX_PLL_IR);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1,
-			  FIELD_PREP(RG_HDMITX_PLL_TXDIV, div),
-			  RG_HDMITX_PLL_TXDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  FIELD_PREP(RG_HDMITX_PLL_FBKSEL, 0x1) |
-			  FIELD_PREP(RG_HDMITX_PLL_FBKDIV, 19),
-			  RG_HDMITX_PLL_FBKSEL | RG_HDMITX_PLL_FBKDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1,
-			  FIELD_PREP(RG_HDMITX_PLL_DIVEN, 0x2),
-			  RG_HDMITX_PLL_DIVEN);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  FIELD_PREP(RG_HDMITX_PLL_BP, 0xc) |
-			  FIELD_PREP(RG_HDMITX_PLL_BC, 0x2) |
-			  FIELD_PREP(RG_HDMITX_PLL_BR, 0x1),
-			  RG_HDMITX_PLL_BP | RG_HDMITX_PLL_BC |
-			  RG_HDMITX_PLL_BR);
+	mtk_phy_update_field(base + HDMI_CON0, RG_HDMITX_PLL_PREDIV, pre_div);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	mtk_phy_update_bits(base + HDMI_CON0,
+			    RG_HDMITX_PLL_IC | RG_HDMITX_PLL_IR,
+			    FIELD_PREP(RG_HDMITX_PLL_IC, 0x1) |
+			    FIELD_PREP(RG_HDMITX_PLL_IR, 0x1));
+	mtk_phy_update_field(base + HDMI_CON1, RG_HDMITX_PLL_TXDIV, div);
+	mtk_phy_update_bits(base + HDMI_CON0,
+			    RG_HDMITX_PLL_FBKSEL | RG_HDMITX_PLL_FBKDIV,
+			    FIELD_PREP(RG_HDMITX_PLL_FBKSEL, 0x1) |
+			    FIELD_PREP(RG_HDMITX_PLL_FBKDIV, 19));
+	mtk_phy_update_field(base + HDMI_CON1, RG_HDMITX_PLL_DIVEN, 0x2);
+	mtk_phy_update_bits(base + HDMI_CON0,
+			    RG_HDMITX_PLL_BP | RG_HDMITX_PLL_BC |
+			    RG_HDMITX_PLL_BR,
+			    FIELD_PREP(RG_HDMITX_PLL_BP, 0xc) |
+			    FIELD_PREP(RG_HDMITX_PLL_BC, 0x2) |
+			    FIELD_PREP(RG_HDMITX_PLL_BR, 0x1));
 	if (rate < 165000000) {
-		mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON3,
-					RG_HDMITX_PRD_IMP_EN);
+		mtk_phy_clear_bits(base + HDMI_CON3, RG_HDMITX_PRD_IMP_EN);
 		pre_ibias = 0x3;
 		imp_en = 0x0;
 		hdmi_ibias = hdmi_phy->ibias;
 	} else {
-		mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON3,
-				      RG_HDMITX_PRD_IMP_EN);
+		mtk_phy_set_bits(base + HDMI_CON3, RG_HDMITX_PRD_IMP_EN);
 		pre_ibias = 0x6;
 		imp_en = 0xf;
 		hdmi_ibias = hdmi_phy->ibias_up;
 	}
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4,
-			  FIELD_PREP(RG_HDMITX_PRD_IBIAS_CLK, pre_ibias) |
-			  FIELD_PREP(RG_HDMITX_PRD_IBIAS_D2, pre_ibias) |
-			  FIELD_PREP(RG_HDMITX_PRD_IBIAS_D1, pre_ibias) |
-			  FIELD_PREP(RG_HDMITX_PRD_IBIAS_D0, pre_ibias),
-			  RG_HDMITX_PRD_IBIAS_CLK |
-			  RG_HDMITX_PRD_IBIAS_D2 |
-			  RG_HDMITX_PRD_IBIAS_D1 |
-			  RG_HDMITX_PRD_IBIAS_D0);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON3,
-			  FIELD_PREP(RG_HDMITX_DRV_IMP_EN, imp_en),
-			  RG_HDMITX_DRV_IMP_EN);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6,
-			  FIELD_PREP(RG_HDMITX_DRV_IMP_CLK, hdmi_phy->drv_imp_clk) |
-			  FIELD_PREP(RG_HDMITX_DRV_IMP_D2, hdmi_phy->drv_imp_d2) |
-			  FIELD_PREP(RG_HDMITX_DRV_IMP_D1, hdmi_phy->drv_imp_d1) |
-			  FIELD_PREP(RG_HDMITX_DRV_IMP_D0, hdmi_phy->drv_imp_d0),
-			  RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
-			  RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON5,
-			  FIELD_PREP(RG_HDMITX_DRV_IBIAS_CLK, hdmi_ibias) |
-			  FIELD_PREP(RG_HDMITX_DRV_IBIAS_D2, hdmi_ibias) |
-			  FIELD_PREP(RG_HDMITX_DRV_IBIAS_D1, hdmi_ibias) |
-			  FIELD_PREP(RG_HDMITX_DRV_IBIAS_D0, hdmi_ibias),
-			  RG_HDMITX_DRV_IBIAS_CLK |
-			  RG_HDMITX_DRV_IBIAS_D2 |
-			  RG_HDMITX_DRV_IBIAS_D1 |
-			  RG_HDMITX_DRV_IBIAS_D0);
+	mtk_phy_update_bits(base + HDMI_CON4,
+			    RG_HDMITX_PRD_IBIAS_CLK | RG_HDMITX_PRD_IBIAS_D2 |
+			    RG_HDMITX_PRD_IBIAS_D1 | RG_HDMITX_PRD_IBIAS_D0,
+			    FIELD_PREP(RG_HDMITX_PRD_IBIAS_CLK, pre_ibias) |
+			    FIELD_PREP(RG_HDMITX_PRD_IBIAS_D2, pre_ibias) |
+			    FIELD_PREP(RG_HDMITX_PRD_IBIAS_D1, pre_ibias) |
+			    FIELD_PREP(RG_HDMITX_PRD_IBIAS_D0, pre_ibias));
+	mtk_phy_update_field(base + HDMI_CON3, RG_HDMITX_DRV_IMP_EN, imp_en);
+	mtk_phy_update_bits(base + HDMI_CON6,
+			    RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
+			    RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0,
+			    FIELD_PREP(RG_HDMITX_DRV_IMP_CLK, hdmi_phy->drv_imp_clk) |
+			    FIELD_PREP(RG_HDMITX_DRV_IMP_D2, hdmi_phy->drv_imp_d2) |
+			    FIELD_PREP(RG_HDMITX_DRV_IMP_D1, hdmi_phy->drv_imp_d1) |
+			    FIELD_PREP(RG_HDMITX_DRV_IMP_D0, hdmi_phy->drv_imp_d0));
+	mtk_phy_update_bits(base + HDMI_CON5,
+			    RG_HDMITX_DRV_IBIAS_CLK | RG_HDMITX_DRV_IBIAS_D2 |
+			    RG_HDMITX_DRV_IBIAS_D1 | RG_HDMITX_DRV_IBIAS_D0,
+			    FIELD_PREP(RG_HDMITX_DRV_IBIAS_CLK, hdmi_ibias) |
+			    FIELD_PREP(RG_HDMITX_DRV_IBIAS_D2, hdmi_ibias) |
+			    FIELD_PREP(RG_HDMITX_DRV_IBIAS_D1, hdmi_ibias) |
+			    FIELD_PREP(RG_HDMITX_DRV_IBIAS_D0, hdmi_ibias));
 	return 0;
 }
 
@@ -239,17 +229,17 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 
 static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON3,
-			      RG_HDMITX_SER_EN | RG_HDMITX_PRD_EN |
-			      RG_HDMITX_DRV_EN);
+	mtk_phy_set_bits(hdmi_phy->regs + HDMI_CON3,
+			 RG_HDMITX_SER_EN | RG_HDMITX_PRD_EN |
+			 RG_HDMITX_DRV_EN);
 	usleep_range(100, 150);
 }
 
 static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON3,
-				RG_HDMITX_DRV_EN | RG_HDMITX_PRD_EN |
-				RG_HDMITX_SER_EN);
+	mtk_phy_clear_bits(hdmi_phy->regs + HDMI_CON3,
+			   RG_HDMITX_DRV_EN | RG_HDMITX_PRD_EN |
+			   RG_HDMITX_SER_EN);
 }
 
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf = {
-- 
2.18.0


