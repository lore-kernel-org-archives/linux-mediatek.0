Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE88C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMYnV6qajs06lT5A7e84rHOCQRhaabyASh6VcPMFpDk=; b=0lQ6Z87Cj85U2SJKs4zx2B60fn
	2m1fx83w0+qCRYcKrNx/R06WNP21xxzdqMnBorYPkH7DWz3T4ay8GcUqD1do6PhLiGUg6DBKgArfG
	Ikgv4QTrgqTugsZb2Y+3e3ABeH4YhPLbvyfp0ZtO+OVZzHEUvYUNS4+4sHTvMk6a1xaXpquBmUchz
	GpdbpEdAyHCwCLhPgf1dsxlBqvYrBwX++56613nYnR8uYP4jf509O3n3RrQmwccm4LkmUtOUWzjU4
	4GjUdc186O9T5uZZY0LFqRn+wUtbyDvLR+tS3mXOBWbzGj1ibZ/NDAR4DmTPAkSNxfz/Vkn44V7fx
	q9AUDFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZoW-002YtG-F3; Tue, 20 Sep 2022 09:45:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZlt-002XNE-Ff; Tue, 20 Sep 2022 09:42:31 +0000
X-UUID: 52bbe614437f40929c20514898321492-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QMYnV6qajs06lT5A7e84rHOCQRhaabyASh6VcPMFpDk=;
	b=fvSQZBj1BGY9JYq9yc3SgGbl1sDfsoTJpyev+DALkZ3+53GzTZTc9scRWkx/tIAGBN7D9Fe0V8SfNIHiEdbjbQmlio+P98Odeezp2JPiQNjEelldo/VCeVa6Ai9FCelY2j/Q5NNtAoKVNbA4vuBoo+qjvA0uU3H2n5V7qurh7fA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c03e0a11-2eec-4029-87a7-f565a388b48d,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:39a5ff1,CLOUDID:1bcf05f7-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 52bbe614437f40929c20514898321492-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1530396899; Tue, 20 Sep 2022 02:42:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 20 Sep 2022 17:00:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:51 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 15/18] phy: mediatek: mipi: mt8173: use common helper to access registers
Date: Tue, 20 Sep 2022 17:00:35 +0800
Message-ID: <20220920090038.15133-16-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_024229_600957_8C5F181B 
X-CRM114-Status: GOOD (  11.19  )
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
mipi-dsi's I/O helpers.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 117 ++++++++----------
 1 file changed, 55 insertions(+), 62 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 1e2ad617e8e3..673cb0f08959 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -4,6 +4,7 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
+#include "phy-mtk-io.h"
 #include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_DSI_CON		0x00
@@ -121,6 +122,7 @@
 static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_mipi_tx *mipi_tx = mtk_mipi_tx_from_clk_hw(hw);
+	void __iomem *base = mipi_tx->regs;
 	u8 txdiv, txdiv0, txdiv1;
 	u64 pcw;
 
@@ -150,40 +152,38 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 		return -EINVAL;
 	}
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_BG_CON,
-				RG_DSI_VOUT_MSK |
-				RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN,
-				FIELD_PREP(RG_DSI_V02_SEL, 4) |
-				FIELD_PREP(RG_DSI_V032_SEL, 4) |
-				FIELD_PREP(RG_DSI_V04_SEL, 4) |
-				FIELD_PREP(RG_DSI_V072_SEL, 4) |
-				FIELD_PREP(RG_DSI_V10_SEL, 4) |
-				FIELD_PREP(RG_DSI_V12_SEL, 4) |
-				RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN);
+	mtk_phy_update_bits(base + MIPITX_DSI_BG_CON,
+			    RG_DSI_VOUT_MSK | RG_DSI_BG_CKEN |
+			    RG_DSI_BG_CORE_EN,
+			    FIELD_PREP(RG_DSI_V02_SEL, 4) |
+			    FIELD_PREP(RG_DSI_V032_SEL, 4) |
+			    FIELD_PREP(RG_DSI_V04_SEL, 4) |
+			    FIELD_PREP(RG_DSI_V072_SEL, 4) |
+			    FIELD_PREP(RG_DSI_V10_SEL, 4) |
+			    FIELD_PREP(RG_DSI_V12_SEL, 4) |
+			    RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN);
 
 	usleep_range(30, 100);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_TOP_CON,
-				RG_DSI_LNT_IMP_CAL_CODE | RG_DSI_LNT_HS_BIAS_EN,
-				FIELD_PREP(RG_DSI_LNT_IMP_CAL_CODE, 8) |
-				RG_DSI_LNT_HS_BIAS_EN);
+	mtk_phy_update_bits(base + MIPITX_DSI_TOP_CON,
+			    RG_DSI_LNT_IMP_CAL_CODE | RG_DSI_LNT_HS_BIAS_EN,
+			    FIELD_PREP(RG_DSI_LNT_IMP_CAL_CODE, 8) |
+			    RG_DSI_LNT_HS_BIAS_EN);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_CON,
-			     RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
+	mtk_phy_set_bits(base + MIPITX_DSI_CON,
+			 RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_PWR,
-				RG_DSI_MPPLL_SDM_PWR_ON |
-				RG_DSI_MPPLL_SDM_ISO_EN,
-				RG_DSI_MPPLL_SDM_PWR_ON);
+	mtk_phy_update_bits(base + MIPITX_DSI_PLL_PWR,
+			    RG_DSI_MPPLL_SDM_PWR_ON | RG_DSI_MPPLL_SDM_ISO_EN,
+			    RG_DSI_MPPLL_SDM_PWR_ON);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
-			       RG_DSI_MPPLL_PLL_EN);
+	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
-				RG_DSI_MPPLL_TXDIV0 | RG_DSI_MPPLL_TXDIV1 |
-				RG_DSI_MPPLL_PREDIV,
-				FIELD_PREP(RG_DSI_MPPLL_TXDIV0, txdiv0) |
-				FIELD_PREP(RG_DSI_MPPLL_TXDIV1, txdiv1));
+	mtk_phy_update_bits(base + MIPITX_DSI_PLL_CON0,
+			    RG_DSI_MPPLL_TXDIV0 | RG_DSI_MPPLL_TXDIV1 |
+			    RG_DSI_MPPLL_PREDIV,
+			    FIELD_PREP(RG_DSI_MPPLL_TXDIV0, txdiv0) |
+			    FIELD_PREP(RG_DSI_MPPLL_TXDIV1, txdiv1));
 
 	/*
 	 * PLL PCW config
@@ -193,23 +193,20 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 	 * Post DIV =4, so need data_Rate*4
 	 * Ref_clk is 26MHz
 	 */
-	pcw = div_u64(((u64)mipi_tx->data_rate * 2 * txdiv) << 24,
-		      26000000);
-	writel(pcw, mipi_tx->regs + MIPITX_DSI_PLL_CON2);
+	pcw = div_u64(((u64)mipi_tx->data_rate * 2 * txdiv) << 24, 26000000);
+	writel(pcw, base + MIPITX_DSI_PLL_CON2);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_PLL_CON1,
-			     RG_DSI_MPPLL_SDM_FRA_EN);
+	mtk_phy_set_bits(base + MIPITX_DSI_PLL_CON1, RG_DSI_MPPLL_SDM_FRA_EN);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN);
+	mtk_phy_set_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN);
 
 	usleep_range(20, 100);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON1,
-			       RG_DSI_MPPLL_SDM_SSC_EN);
+	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON1, RG_DSI_MPPLL_SDM_SSC_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_TOP,
-				RG_DSI_MPPLL_PRESERVE,
-				mipi_tx->driver_data->mppll_preserve);
+	mtk_phy_update_field(base + MIPITX_DSI_PLL_TOP,
+			     RG_DSI_MPPLL_PRESERVE,
+			     mipi_tx->driver_data->mppll_preserve);
 
 	return 0;
 }
@@ -217,31 +214,27 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_mipi_tx *mipi_tx = mtk_mipi_tx_from_clk_hw(hw);
+	void __iomem *base = mipi_tx->regs;
 
 	dev_dbg(mipi_tx->dev, "unprepare\n");
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
-			       RG_DSI_MPPLL_PLL_EN);
+	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_TOP,
-				RG_DSI_MPPLL_PRESERVE, 0);
+	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_TOP, RG_DSI_MPPLL_PRESERVE);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_PWR,
-				RG_DSI_MPPLL_SDM_ISO_EN |
-				RG_DSI_MPPLL_SDM_PWR_ON,
-				RG_DSI_MPPLL_SDM_ISO_EN);
+	mtk_phy_update_bits(base + MIPITX_DSI_PLL_PWR,
+			    RG_DSI_MPPLL_SDM_ISO_EN | RG_DSI_MPPLL_SDM_PWR_ON,
+			    RG_DSI_MPPLL_SDM_ISO_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_TOP_CON,
-			       RG_DSI_LNT_HS_BIAS_EN);
+	mtk_phy_clear_bits(base + MIPITX_DSI_TOP_CON, RG_DSI_LNT_HS_BIAS_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_CON,
-			       RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
+	mtk_phy_clear_bits(base + MIPITX_DSI_CON,
+			   RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_BG_CON,
-			       RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN);
+	mtk_phy_clear_bits(base + MIPITX_DSI_BG_CON,
+			   RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
-			       RG_DSI_MPPLL_DIV_MSK);
+	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_DIV_MSK);
 }
 
 static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -265,10 +258,10 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 
 	for (reg = MIPITX_DSI_CLOCK_LANE;
 	     reg <= MIPITX_DSI_DATA_LANE3; reg += 4)
-		mtk_mipi_tx_set_bits(mipi_tx, reg, RG_DSI_LNTx_LDOOUT_EN);
+		mtk_phy_set_bits(mipi_tx->regs + reg, RG_DSI_LNTx_LDOOUT_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_TOP_CON,
-			       RG_DSI_PAD_TIE_LOW_EN);
+	mtk_phy_clear_bits(mipi_tx->regs + MIPITX_DSI_TOP_CON,
+			   RG_DSI_PAD_TIE_LOW_EN);
 }
 
 static void mtk_mipi_tx_power_off_signal(struct phy *phy)
@@ -276,23 +269,23 @@ static void mtk_mipi_tx_power_off_signal(struct phy *phy)
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
 	u32 reg;
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_TOP_CON,
-			     RG_DSI_PAD_TIE_LOW_EN);
+	mtk_phy_set_bits(mipi_tx->regs + MIPITX_DSI_TOP_CON,
+			 RG_DSI_PAD_TIE_LOW_EN);
 
 	for (reg = MIPITX_DSI_CLOCK_LANE;
 	     reg <= MIPITX_DSI_DATA_LANE3; reg += 4)
-		mtk_mipi_tx_clear_bits(mipi_tx, reg, RG_DSI_LNTx_LDOOUT_EN);
+		mtk_phy_clear_bits(mipi_tx->regs + reg, RG_DSI_LNTx_LDOOUT_EN);
 }
 
 const struct mtk_mipitx_data mt2701_mipitx_data = {
-	.mppll_preserve = (3 << 8),
+	.mppll_preserve = 3,
 	.mipi_tx_clk_ops = &mtk_mipi_tx_pll_ops,
 	.mipi_tx_enable_signal = mtk_mipi_tx_power_on_signal,
 	.mipi_tx_disable_signal = mtk_mipi_tx_power_off_signal,
 };
 
 const struct mtk_mipitx_data mt8173_mipitx_data = {
-	.mppll_preserve = (0 << 8),
+	.mppll_preserve = 0,
 	.mipi_tx_clk_ops = &mtk_mipi_tx_pll_ops,
 	.mipi_tx_enable_signal = mtk_mipi_tx_power_on_signal,
 	.mipi_tx_disable_signal = mtk_mipi_tx_power_off_signal,
-- 
2.18.0


