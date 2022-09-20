Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4125C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi+lbqGHZ+GvTdVQwc41FrrgocUWNRHHKByu1hX6SDM=; b=hyOa/iT88NIkhhHjLcxQ3ve6zf
	YaFD6tQcCGxpVMaZZ5ebEnOisQ34ScAep4HCv3ilcMr2bZ6kso9KStnFAC8fpfs5kOPCIkxK8gbPh
	AL7g2EPa4rdUy9BhxqZ/RiIJ9SVB11m/AzM7mgKuHb7XKu6Djht7KayP2uGZ29DntYNCsWqMgr8CS
	6yutU/fQZyeCoTGBeJXKAlBHzf728QdCWXD2XZVg6Z16Va/eqU9d5QtyBrRA7veY/3hwcEvLOTyMq
	OYUsAh6sOzhzhAxoQ1UGsOpeROZBtyu3fJE5tRHgp6DN3a2Vsy/a/mbAZZLws3SZyRM/BPozarQB3
	3zQGx08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZDb-002CBl-MV; Tue, 20 Sep 2022 09:07:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8e-0028zl-7l; Tue, 20 Sep 2022 09:01:59 +0000
X-UUID: c015cb9e125c481bb1b62bde91223c0b-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bi+lbqGHZ+GvTdVQwc41FrrgocUWNRHHKByu1hX6SDM=;
	b=C/hMsBH7GZc+Srnlj/D2H87/qKSYSHJy+DKHPm7d9+naXOdi5QWQq+i+vSp3CZc7nJUSdkNEtNZ986atBul8hEpsCK5Axcib/XBm2ms75nITB5VzjQHa2q+mYaqIIJPotiUY3xxCEHrVTMS0k4bCifHcp6Dp2Nb2r73cF1rS4qQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:0288c989-a777-4772-8917-895559d953fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:23cb6670-dafa-4a42-b716-cf2cd4845592,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c015cb9e125c481bb1b62bde91223c0b-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1975997718; Tue, 20 Sep 2022 02:01:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 10/18] phy: mediatek: hdmi: mt8173: use FIELD_PREP to prepare bits field
Date: Tue, 20 Sep 2022 17:00:30 +0800
Message-ID: <20220920090038.15133-11-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020156_380146_61324CB6 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 70 ++++++++--------------
 1 file changed, 26 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index 55fe97f5465d..8f93991fb09d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -9,27 +9,17 @@
 #define HDMI_CON0		0x00
 #define RG_HDMITX_PLL_EN		BIT(31)
 #define RG_HDMITX_PLL_FBKDIV		GENMASK(30, 24)
-#define PLL_FBKDIV_SHIFT		24
 #define RG_HDMITX_PLL_FBKSEL		GENMASK(23, 22)
-#define PLL_FBKSEL_SHIFT		22
 #define RG_HDMITX_PLL_PREDIV		GENMASK(21, 20)
-#define PREDIV_SHIFT			20
 #define RG_HDMITX_PLL_POSDIV		GENMASK(19, 18)
-#define POSDIV_SHIFT			18
 #define RG_HDMITX_PLL_RST_DLY		GENMASK(17, 16)
 #define RG_HDMITX_PLL_IR		GENMASK(15, 12)
-#define PLL_IR_SHIFT			12
 #define RG_HDMITX_PLL_IC		GENMASK(11, 8)
-#define PLL_IC_SHIFT			8
 #define RG_HDMITX_PLL_BP		GENMASK(7, 4)
-#define PLL_BP_SHIFT			4
 #define RG_HDMITX_PLL_BR		GENMASK(3, 2)
-#define PLL_BR_SHIFT			2
 #define RG_HDMITX_PLL_BC		GENMASK(1, 0)
-#define PLL_BC_SHIFT			0
 #define HDMI_CON1		0x04
 #define RG_HDMITX_PLL_DIVEN		GENMASK(31, 29)
-#define PLL_DIVEN_SHIFT			29
 #define RG_HDMITX_PLL_AUTOK_EN		BIT(28)
 #define RG_HDMITX_PLL_AUTOK_KF		GENMASK(27, 26)
 #define RG_HDMITX_PLL_AUTOK_KS		GENMASK(25, 24)
@@ -40,7 +30,6 @@
 #define RG_HDMITX_PLL_BIAS_LPF_EN	BIT(13)
 #define RG_HDMITX_PLL_TXDIV_EN		BIT(12)
 #define RG_HDMITX_PLL_TXDIV		GENMASK(11, 10)
-#define PLL_TXDIV_SHIFT			10
 #define RG_HDMITX_PLL_LVROD_EN		BIT(9)
 #define RG_HDMITX_PLL_MONVC_EN		BIT(8)
 #define RG_HDMITX_PLL_MONCK_EN		BIT(7)
@@ -58,7 +47,6 @@
 #define RG_HDMITX_PRD_IMP_EN		GENMASK(23, 20)
 #define RG_HDMITX_DRV_EN		GENMASK(19, 16)
 #define RG_HDMITX_DRV_IMP_EN		GENMASK(15, 12)
-#define DRV_IMP_EN_SHIFT		12
 #define RG_HDMITX_MHLCK_FORCE		BIT(10)
 #define RG_HDMITX_MHLCK_PPIX_EN		BIT(9)
 #define RG_HDMITX_MHLCK_EN		BIT(8)
@@ -72,28 +60,16 @@
 #define RG_HDMITX_PRD_IBIAS_D2		GENMASK(19, 16)
 #define RG_HDMITX_PRD_IBIAS_D1		GENMASK(11, 8)
 #define RG_HDMITX_PRD_IBIAS_D0		GENMASK(3, 0)
-#define PRD_IBIAS_CLK_SHIFT		24
-#define PRD_IBIAS_D2_SHIFT		16
-#define PRD_IBIAS_D1_SHIFT		8
-#define PRD_IBIAS_D0_SHIFT		0
 #define HDMI_CON5		0x14
 #define RG_HDMITX_DRV_IBIAS_CLK		GENMASK(29, 24)
 #define RG_HDMITX_DRV_IBIAS_D2		GENMASK(21, 16)
 #define RG_HDMITX_DRV_IBIAS_D1		GENMASK(13, 8)
 #define RG_HDMITX_DRV_IBIAS_D0		GENMASK(5, 0)
-#define DRV_IBIAS_CLK_SHIFT		24
-#define DRV_IBIAS_D2_SHIFT		16
-#define DRV_IBIAS_D1_SHIFT		8
-#define DRV_IBIAS_D0_SHIFT		0
 #define HDMI_CON6		0x18
 #define RG_HDMITX_DRV_IMP_CLK		GENMASK(29, 24)
 #define RG_HDMITX_DRV_IMP_D2		GENMASK(21, 16)
 #define RG_HDMITX_DRV_IMP_D1		GENMASK(13, 8)
 #define RG_HDMITX_DRV_IMP_D0		GENMASK(5, 0)
-#define DRV_IMP_CLK_SHIFT		24
-#define DRV_IMP_D2_SHIFT		16
-#define DRV_IMP_D1_SHIFT		8
-#define DRV_IMP_D0_SHIFT		0
 #define HDMI_CON7		0x1c
 #define RG_HDMITX_MHLCK_DRV_IBIAS	GENMASK(31, 27)
 #define RG_HDMITX_SER_DIN		GENMASK(25, 16)
@@ -178,21 +154,27 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  (pre_div << PREDIV_SHIFT), RG_HDMITX_PLL_PREDIV);
+			  FIELD_PREP(RG_HDMITX_PLL_PREDIV, pre_div),
+			  RG_HDMITX_PLL_PREDIV);
 	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  (0x1 << PLL_IC_SHIFT) | (0x1 << PLL_IR_SHIFT),
+			  FIELD_PREP(RG_HDMITX_PLL_IC, 0x1) |
+			  FIELD_PREP(RG_HDMITX_PLL_IR, 0x1),
 			  RG_HDMITX_PLL_IC | RG_HDMITX_PLL_IR);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1,
-			  (div << PLL_TXDIV_SHIFT), RG_HDMITX_PLL_TXDIV);
+			  FIELD_PREP(RG_HDMITX_PLL_TXDIV, div),
+			  RG_HDMITX_PLL_TXDIV);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  (0x1 << PLL_FBKSEL_SHIFT) | (19 << PLL_FBKDIV_SHIFT),
+			  FIELD_PREP(RG_HDMITX_PLL_FBKSEL, 0x1) |
+			  FIELD_PREP(RG_HDMITX_PLL_FBKDIV, 19),
 			  RG_HDMITX_PLL_FBKSEL | RG_HDMITX_PLL_FBKDIV);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1,
-			  (0x2 << PLL_DIVEN_SHIFT), RG_HDMITX_PLL_DIVEN);
+			  FIELD_PREP(RG_HDMITX_PLL_DIVEN, 0x2),
+			  RG_HDMITX_PLL_DIVEN);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  (0xc << PLL_BP_SHIFT) | (0x2 << PLL_BC_SHIFT) |
-			  (0x1 << PLL_BR_SHIFT),
+			  FIELD_PREP(RG_HDMITX_PLL_BP, 0xc) |
+			  FIELD_PREP(RG_HDMITX_PLL_BC, 0x2) |
+			  FIELD_PREP(RG_HDMITX_PLL_BR, 0x1),
 			  RG_HDMITX_PLL_BP | RG_HDMITX_PLL_BC |
 			  RG_HDMITX_PLL_BR);
 	if (rate < 165000000) {
@@ -209,29 +191,29 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		hdmi_ibias = hdmi_phy->ibias_up;
 	}
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4,
-			  (pre_ibias << PRD_IBIAS_CLK_SHIFT) |
-			  (pre_ibias << PRD_IBIAS_D2_SHIFT) |
-			  (pre_ibias << PRD_IBIAS_D1_SHIFT) |
-			  (pre_ibias << PRD_IBIAS_D0_SHIFT),
+			  FIELD_PREP(RG_HDMITX_PRD_IBIAS_CLK, pre_ibias) |
+			  FIELD_PREP(RG_HDMITX_PRD_IBIAS_D2, pre_ibias) |
+			  FIELD_PREP(RG_HDMITX_PRD_IBIAS_D1, pre_ibias) |
+			  FIELD_PREP(RG_HDMITX_PRD_IBIAS_D0, pre_ibias),
 			  RG_HDMITX_PRD_IBIAS_CLK |
 			  RG_HDMITX_PRD_IBIAS_D2 |
 			  RG_HDMITX_PRD_IBIAS_D1 |
 			  RG_HDMITX_PRD_IBIAS_D0);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON3,
-			  (imp_en << DRV_IMP_EN_SHIFT),
+			  FIELD_PREP(RG_HDMITX_DRV_IMP_EN, imp_en),
 			  RG_HDMITX_DRV_IMP_EN);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6,
-			  (hdmi_phy->drv_imp_clk << DRV_IMP_CLK_SHIFT) |
-			  (hdmi_phy->drv_imp_d2 << DRV_IMP_D2_SHIFT) |
-			  (hdmi_phy->drv_imp_d1 << DRV_IMP_D1_SHIFT) |
-			  (hdmi_phy->drv_imp_d0 << DRV_IMP_D0_SHIFT),
+			  FIELD_PREP(RG_HDMITX_DRV_IMP_CLK, hdmi_phy->drv_imp_clk) |
+			  FIELD_PREP(RG_HDMITX_DRV_IMP_D2, hdmi_phy->drv_imp_d2) |
+			  FIELD_PREP(RG_HDMITX_DRV_IMP_D1, hdmi_phy->drv_imp_d1) |
+			  FIELD_PREP(RG_HDMITX_DRV_IMP_D0, hdmi_phy->drv_imp_d0),
 			  RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
 			  RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0);
 	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON5,
-			  (hdmi_ibias << DRV_IBIAS_CLK_SHIFT) |
-			  (hdmi_ibias << DRV_IBIAS_D2_SHIFT) |
-			  (hdmi_ibias << DRV_IBIAS_D1_SHIFT) |
-			  (hdmi_ibias << DRV_IBIAS_D0_SHIFT),
+			  FIELD_PREP(RG_HDMITX_DRV_IBIAS_CLK, hdmi_ibias) |
+			  FIELD_PREP(RG_HDMITX_DRV_IBIAS_D2, hdmi_ibias) |
+			  FIELD_PREP(RG_HDMITX_DRV_IBIAS_D1, hdmi_ibias) |
+			  FIELD_PREP(RG_HDMITX_DRV_IBIAS_D0, hdmi_ibias),
 			  RG_HDMITX_DRV_IBIAS_CLK |
 			  RG_HDMITX_DRV_IBIAS_D2 |
 			  RG_HDMITX_DRV_IBIAS_D1 |
-- 
2.18.0


