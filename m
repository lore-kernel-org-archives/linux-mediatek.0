Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F17ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7wZIkuPTiLOQCOIwIcXYf+aRsn+eYjwunznMxBD8LE=; b=g1gOWuEhL/fHe8EoJsq99rcqxa
	tB5frLGQfvVqrBfZSlE1C2GnR/Z0TRo6yz8qHtEdfTK/IFLoAbqKuBjeSYyTMQr9PA71j1dqu2nhO
	mXxqUtD67xYmXMr+ymy2Xfz4WhJZH5CJ69W8v2zRSdQoSOZUwgIJSCix82eG/foz+vwo8OgrDLvVC
	Kx4yArTz+EdRdmhCNMKtpmB7rzX9oXU4hL1F5LzI95kr9uB+bgtHqEGjCLZ/pG5wMYDkRoPXfEMD1
	PDdXsGguSQD3QSDYsoZ7UGUoBvqhgVnVFKt25ODp53EydKTQu8q+9yQ2NJOuc1qYgkBurhbP/KbrN
	vtvkJhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZEI-002CdL-5M; Tue, 20 Sep 2022 09:07:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8d-002941-TX; Tue, 20 Sep 2022 09:01:59 +0000
X-UUID: 37abb87abc164eb9874aa4598ef40c93-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=n7wZIkuPTiLOQCOIwIcXYf+aRsn+eYjwunznMxBD8LE=;
	b=bg80GbEXsNm2zgebjg5+y33/TWxfzQoALDN5bQeYuFQ6ePOTHSeETBGb9FC6SO58Y8pxZoNFBv2B/KlIBRkqJI8kyXWzRBrOUxnhmzSyZmnYkJK/m4CC98dUf//JLWKVdCrGKRZ4I5BRmXHdja+9DVUPLBDlPUxP3JSM7tbmWFg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:4e30d8ea-8c56-4e4f-9ae8-33859c9bd4d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:12f2435e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 37abb87abc164eb9874aa4598ef40c93-20220920
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 265281469; Tue, 20 Sep 2022 02:01:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jitao Shi
	<jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH 04/18] phy: mediatek: ufs: use common register access helpers
Date: Tue, 20 Sep 2022 17:00:24 +0800
Message-ID: <20220920090038.15133-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020156_007936_BD86ADBB 
X-CRM114-Status: GOOD (  11.38  )
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

No need define private register access helpers, use common ones defined
in phy-mtk-io.h

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-ufs.c | 78 +++++++++++-------------------
 1 file changed, 28 insertions(+), 50 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
index a6af06941203..fc19e0fa8ed5 100644
--- a/drivers/phy/mediatek/phy-mtk-ufs.c
+++ b/drivers/phy/mediatek/phy-mtk-ufs.c
@@ -11,6 +11,8 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "phy-mtk-io.h"
+
 /* mphy register and offsets */
 #define MP_GLB_DIG_8C               0x008C
 #define FRC_PLL_ISO_EN              BIT(8)
@@ -39,34 +41,6 @@ struct ufs_mtk_phy {
 	struct clk_bulk_data clks[UFSPHY_CLKS_CNT];
 };
 
-static inline u32 mphy_readl(struct ufs_mtk_phy *phy, u32 reg)
-{
-	return readl(phy->mmio + reg);
-}
-
-static inline void mphy_writel(struct ufs_mtk_phy *phy, u32 val, u32 reg)
-{
-	writel(val, phy->mmio + reg);
-}
-
-static void mphy_set_bit(struct ufs_mtk_phy *phy, u32 reg, u32 bit)
-{
-	u32 val;
-
-	val = mphy_readl(phy, reg);
-	val |= bit;
-	mphy_writel(phy, val, reg);
-}
-
-static void mphy_clr_bit(struct ufs_mtk_phy *phy, u32 reg, u32 bit)
-{
-	u32 val;
-
-	val = mphy_readl(phy, reg);
-	val &= ~bit;
-	mphy_writel(phy, val, reg);
-}
-
 static struct ufs_mtk_phy *get_ufs_mtk_phy(struct phy *generic_phy)
 {
 	return (struct ufs_mtk_phy *)phy_get_drvdata(generic_phy);
@@ -84,57 +58,61 @@ static int ufs_mtk_phy_clk_init(struct ufs_mtk_phy *phy)
 
 static void ufs_mtk_phy_set_active(struct ufs_mtk_phy *phy)
 {
+	void __iomem *mmio = phy->mmio;
+
 	/* release DA_MP_PLL_PWR_ON */
-	mphy_set_bit(phy, MP_GLB_DIG_8C, PLL_PWR_ON);
-	mphy_clr_bit(phy, MP_GLB_DIG_8C, FRC_FRC_PWR_ON);
+	mtk_phy_set_bits(mmio + MP_GLB_DIG_8C, PLL_PWR_ON);
+	mtk_phy_clear_bits(mmio + MP_GLB_DIG_8C, FRC_FRC_PWR_ON);
 
 	/* release DA_MP_PLL_ISO_EN */
-	mphy_clr_bit(phy, MP_GLB_DIG_8C, PLL_ISO_EN);
-	mphy_clr_bit(phy, MP_GLB_DIG_8C, FRC_PLL_ISO_EN);
+	mtk_phy_clear_bits(mmio + MP_GLB_DIG_8C, PLL_ISO_EN);
+	mtk_phy_clear_bits(mmio + MP_GLB_DIG_8C, FRC_PLL_ISO_EN);
 
 	/* release DA_MP_CDR_PWR_ON */
-	mphy_set_bit(phy, MP_LN_RX_44, CDR_PWR_ON);
-	mphy_clr_bit(phy, MP_LN_RX_44, FRC_CDR_PWR_ON);
+	mtk_phy_set_bits(mmio + MP_LN_RX_44, CDR_PWR_ON);
+	mtk_phy_clear_bits(mmio + MP_LN_RX_44, FRC_CDR_PWR_ON);
 
 	/* release DA_MP_CDR_ISO_EN */
-	mphy_clr_bit(phy, MP_LN_RX_44, CDR_ISO_EN);
-	mphy_clr_bit(phy, MP_LN_RX_44, FRC_CDR_ISO_EN);
+	mtk_phy_clear_bits(mmio + MP_LN_RX_44, CDR_ISO_EN);
+	mtk_phy_clear_bits(mmio + MP_LN_RX_44, FRC_CDR_ISO_EN);
 
 	/* release DA_MP_RX0_SQ_EN */
-	mphy_set_bit(phy, MP_LN_DIG_RX_AC, RX_SQ_EN);
-	mphy_clr_bit(phy, MP_LN_DIG_RX_AC, FRC_RX_SQ_EN);
+	mtk_phy_set_bits(mmio + MP_LN_DIG_RX_AC, RX_SQ_EN);
+	mtk_phy_clear_bits(mmio + MP_LN_DIG_RX_AC, FRC_RX_SQ_EN);
 
 	/* delay 1us to wait DIFZ stable */
 	udelay(1);
 
 	/* release DIFZ */
-	mphy_clr_bit(phy, MP_LN_DIG_RX_9C, FSM_DIFZ_FRC);
+	mtk_phy_clear_bits(mmio + MP_LN_DIG_RX_9C, FSM_DIFZ_FRC);
 }
 
 static void ufs_mtk_phy_set_deep_hibern(struct ufs_mtk_phy *phy)
 {
+	void __iomem *mmio = phy->mmio;
+
 	/* force DIFZ */
-	mphy_set_bit(phy, MP_LN_DIG_RX_9C, FSM_DIFZ_FRC);
+	mtk_phy_set_bits(mmio + MP_LN_DIG_RX_9C, FSM_DIFZ_FRC);
 
 	/* force DA_MP_RX0_SQ_EN */
-	mphy_set_bit(phy, MP_LN_DIG_RX_AC, FRC_RX_SQ_EN);
-	mphy_clr_bit(phy, MP_LN_DIG_RX_AC, RX_SQ_EN);
+	mtk_phy_set_bits(mmio + MP_LN_DIG_RX_AC, FRC_RX_SQ_EN);
+	mtk_phy_clear_bits(mmio + MP_LN_DIG_RX_AC, RX_SQ_EN);
 
 	/* force DA_MP_CDR_ISO_EN */
-	mphy_set_bit(phy, MP_LN_RX_44, FRC_CDR_ISO_EN);
-	mphy_set_bit(phy, MP_LN_RX_44, CDR_ISO_EN);
+	mtk_phy_set_bits(mmio + MP_LN_RX_44, FRC_CDR_ISO_EN);
+	mtk_phy_set_bits(mmio + MP_LN_RX_44, CDR_ISO_EN);
 
 	/* force DA_MP_CDR_PWR_ON */
-	mphy_set_bit(phy, MP_LN_RX_44, FRC_CDR_PWR_ON);
-	mphy_clr_bit(phy, MP_LN_RX_44, CDR_PWR_ON);
+	mtk_phy_set_bits(mmio + MP_LN_RX_44, FRC_CDR_PWR_ON);
+	mtk_phy_clear_bits(mmio + MP_LN_RX_44, CDR_PWR_ON);
 
 	/* force DA_MP_PLL_ISO_EN */
-	mphy_set_bit(phy, MP_GLB_DIG_8C, FRC_PLL_ISO_EN);
-	mphy_set_bit(phy, MP_GLB_DIG_8C, PLL_ISO_EN);
+	mtk_phy_set_bits(mmio + MP_GLB_DIG_8C, FRC_PLL_ISO_EN);
+	mtk_phy_set_bits(mmio + MP_GLB_DIG_8C, PLL_ISO_EN);
 
 	/* force DA_MP_PLL_PWR_ON */
-	mphy_set_bit(phy, MP_GLB_DIG_8C, FRC_FRC_PWR_ON);
-	mphy_clr_bit(phy, MP_GLB_DIG_8C, PLL_PWR_ON);
+	mtk_phy_set_bits(mmio + MP_GLB_DIG_8C, FRC_FRC_PWR_ON);
+	mtk_phy_clear_bits(mmio + MP_GLB_DIG_8C, PLL_PWR_ON);
 }
 
 static int ufs_mtk_phy_power_on(struct phy *generic_phy)
-- 
2.18.0


