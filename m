Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370BFECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vGk6cN09/V3DWUtire7LhnBOQQW7YK/Z95D3/kEt0g=; b=23ZqFDf8Z0V9dObRQAVKBFowvV
	nxDEGwzb5w95trC5DDS++ckfbLnmEX8Hn9KiBSvdpWEo1G6tC16GxZW5RTa6KNMg2y0pBEn1+bq1s
	r1XGFkqYHF4Xbxwgbz4n8NTlBSgWHOtqQatipI47VDyNN6ol25unyc0EFAKs7y2Hk0mvVMwSJBRcO
	v2zza7BfJ0srL4NMzLy1/Egpe48ZoLThHAEhKB+azWsR96riA+hFibuqtTo+3uoO48ZlNRwjC9eb4
	ns6K064g1yd79rzI5B6vX57x5dslzNdqG0kQYotGZt3PQpZwCfBOC1Ua9XcqtKcL+PUSmX6lTQHBy
	p+AbdXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYXWY-007ac4-Ph; Wed, 14 Sep 2022 18:54:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYXWL-007aUE-3x; Wed, 14 Sep 2022 18:54:03 +0000
X-UUID: cb91e7bd113a49ae828a5b0999b277a2-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9vGk6cN09/V3DWUtire7LhnBOQQW7YK/Z95D3/kEt0g=;
	b=kr025yP+fBQwqMQKGNBtxNGe/KdmacLsfmxxJm5Z+mj1IE6438ImPsL7s+FmDdq6sks3YyYPUL68v6pkJ9+ishBbKY3oU59OX6YBnMmRkhj8qJQwwcYpsj4pbOTWdMxU1n4vNNJZSSxd1bbYCFRS5UxX1fFfeVk/HObf/P20u0w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:de655a58-194b-48e7-b150-b16814ada6aa,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:1e2f69f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cb91e7bd113a49ae828a5b0999b277a2-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 68182913; Wed, 14 Sep 2022 11:53:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 02:23:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 02:23:54 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH 2/5] soc: mediatek: change compatible name for mt8195
Date: Thu, 15 Sep 2022 02:23:28 +0800
Message-ID: <20220914182331.20515-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_115401_183975_CACD3EB3 
X-CRM114-Status: GOOD (  18.21  )
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

In mt8195, vdosys0 and vdosys1 are 2 different function blocks
for mediatek-drm, so using 2 compatible instead of identifying
multiple mmsys by io_start.

Fixes: b804923b7ccb ("soc: mediatek: add mtk-mmsys support for mt8195 vdosys0")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 141 +++++--------------------------
 drivers/soc/mediatek/mtk-mmsys.h |   6 --
 2 files changed, 21 insertions(+), 126 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 06d8e83a2cb5..e1c653f3abc0 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -26,61 +26,26 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };
 
-static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt2701_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.clk_driver = "clk-mt2712-mm",
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };
 
-static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt2712_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
 	.clk_driver = "clk-mt6779-mm",
 };
 
-static const struct mtk_mmsys_match_data mt6779_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt6779_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
 
-static const struct mtk_mmsys_match_data mt6797_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt6797_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.clk_driver = "clk-mt8167-mm",
 	.routes = mt8167_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
 };
 
-static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8167_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
 	.routes = mmsys_default_routing_table,
@@ -88,13 +53,6 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
 };
 
-static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8173_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
 	.routes = mmsys_mt8183_routing_table,
@@ -102,13 +60,6 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
 };
 
-static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8183_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.clk_driver = "clk-mt8186-mm",
 	.routes = mmsys_mt8186_routing_table,
@@ -116,13 +67,6 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
 };
 
-static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8186_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -130,66 +74,29 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
 };
 
-static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8192_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
-	.io_start = 0x1c01a000,
 	.clk_driver = "clk-mt8195-vdo0",
 	.routes = mmsys_mt8195_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
-	.io_start = 0x1c100000,
 	.clk_driver = "clk-mt8195-vdo1",
 };
 
-static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
-	.num_drv_data = 2,
-	.drv_data = {
-		&mt8195_vdosys0_driver_data,
-		&mt8195_vdosys1_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
 };
 
-static const struct mtk_mmsys_match_data mt8365_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8365_mmsys_driver_data,
-	},
-};
-
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
-	phys_addr_t io_start;
 };
 
-static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
-					const struct mtk_mmsys_match_data *match)
-{
-	int i;
-
-	for (i = 0; i < match->num_drv_data; i++)
-		if (mmsys->io_start == match->drv_data[i]->io_start)
-			return i;
-
-	return -EINVAL;
-}
-
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
@@ -284,7 +191,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct platform_device *clks;
 	struct platform_device *drm;
-	const struct mtk_mmsys_match_data *match_data;
 	struct mtk_mmsys *mmsys;
 	struct resource *res;
 	int ret;
@@ -317,20 +223,11 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		dev_err(dev, "Couldn't get mmsys resource\n");
 		return -EINVAL;
 	}
-	mmsys->io_start = res->start;
-
-	match_data = of_device_get_match_data(dev);
-	if (match_data->num_drv_data > 1) {
-		/* This SoC has multiple mmsys channels */
-		ret = mtk_mmsys_find_match_drvdata(mmsys, match_data);
-		if (ret < 0) {
-			dev_err(dev, "Couldn't get match driver data\n");
-			return ret;
-		}
-		mmsys->data = match_data->drv_data[ret];
-	} else {
-		dev_dbg(dev, "Using single mmsys channel\n");
-		mmsys->data = match_data->drv_data[0];
+
+	mmsys->data = of_device_get_match_data(&pdev->dev);
+	if (!mmsys->data) {
+		dev_err(dev, "Couldn't get match driver data\n");
+		return -EINVAL;
 	}
 
 	platform_set_drvdata(pdev, mmsys);
@@ -353,47 +250,51 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 static const struct of_device_id of_match_mtk_mmsys[] = {
 	{
 		.compatible = "mediatek,mt2701-mmsys",
-		.data = &mt2701_mmsys_match_data,
+		.data = &mt2701_mmsys_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt2712-mmsys",
-		.data = &mt2712_mmsys_match_data,
+		.data = &mt2712_mmsys_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt6779-mmsys",
-		.data = &mt6779_mmsys_match_data,
+		.data = &mt6779_mmsys_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt6797-mmsys",
-		.data = &mt6797_mmsys_match_data,
+		.data = &mt6797_mmsys_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt8167-mmsys",
-		.data = &mt8167_mmsys_match_data,
+		.data = &mt8167_mmsys_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt8173-mmsys",
-		.data = &mt8173_mmsys_match_data,
+		.data = &mt8173_mmsys_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt8183-mmsys",
-		.data = &mt8183_mmsys_match_data,
+		.data = &mt8183_mmsys_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt8186-mmsys",
-		.data = &mt8186_mmsys_match_data,
+		.data = &mt8186_mmsys_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt8192-mmsys",
-		.data = &mt8192_mmsys_match_data,
+		.data = &mt8192_mmsys_driver_data,
+	},
+	{
+		.compatible = "mediatek,mt8195-vdosys0",
+		.data = &mt8195_vdosys0_driver_data,
 	},
 	{
-		.compatible = "mediatek,mt8195-mmsys",
-		.data = &mt8195_mmsys_match_data,
+		.compatible = "mediatek,mt8195-vdosys1",
+		.data = &mt8195_vdosys1_driver_data,
 	},
 	{
 		.compatible = "mediatek,mt8365-mmsys",
-		.data = &mt8365_mmsys_match_data,
+		.data = &mt8365_mmsys_driver_data,
 	},
 	{ }
 };
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index f01ba206481d..77f37f8c715b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -87,18 +87,12 @@ struct mtk_mmsys_routes {
 };
 
 struct mtk_mmsys_driver_data {
-	const resource_size_t io_start;
 	const char *clk_driver;
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
 };
 
-struct mtk_mmsys_match_data {
-	unsigned short num_drv_data;
-	const struct mtk_mmsys_driver_data *drv_data[];
-};
-
 /*
  * Routes in mt8173, mt2701, mt2712 are different. That means
  * in the same register address, it controls different input/output
-- 
2.18.0


