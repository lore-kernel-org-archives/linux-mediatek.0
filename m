Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB128C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OcBJm33YwmXnSYlGMrkQUNSuY8oa15V7K+gR1gnol0=; b=QF7+KnbB2/jocFvNxyGWdEWW8G
	PQe0Ok9fUgD+i4O74jYM0OzXmgAXtw1wQCLUpbXetz+8gghiZXKu/6ucw1fsEjN908HLJR3Q00p5C
	Ed588ummU2u4XCDmrHRpy6H8g/RmEhS6nlWrLY7yNng3Z0GYZbvuOWuITAoz1Icnl5Ev9TrJiu4dt
	aq9GmkM369ywhV0QPTWSLQrMdY2E+bSnOkpL25tpGVykbw+vM0y948Alf91jpfCnNKU/l6XNyK04E
	SDFvFWS1sY1NDaUQynB9BGmmaKET2g4jOIugHq0tTefF1CVlchmWSIhTtdb+F/y52K/F/PBi0CaYZ
	c8LV/FPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCzu-00Bfuw-Ns; Tue, 27 Sep 2022 15:59:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCzZ-00Bfpi-3H; Tue, 27 Sep 2022 15:59:30 +0000
X-UUID: 864845d2c9cb42bfb785ab31f55bef0c-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+OcBJm33YwmXnSYlGMrkQUNSuY8oa15V7K+gR1gnol0=;
	b=PwrPKfe4AwaixUMt4NyyPjZcgoeQeEnj8rwhzeyF3BMC+QB476HULkhH/+SNh99dS/gfK6UT09lWPCcXaYJyj/6WPS686d7ajziQWp4iB1yfYd8bgWsLE8Lj1CfZJHnEsO1FFMJ2nOCRtLaczwDr+bhXQwln5PuTNyGJy2M8vkA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:ecb2bab8-f638-48fd-b643-0396cca45f08,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:24d540a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 864845d2c9cb42bfb785ab31f55bef0c-20220927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1304653133; Tue, 27 Sep 2022 08:59:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 23:28:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Sep 2022 23:28:47 +0800
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
Subject: [PATCH v5 5/6] drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
Date: Tue, 27 Sep 2022 23:27:03 +0800
Message-ID: <20220927152704.12018-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_085929_149035_98279883 
X-CRM114-Status: GOOD (  10.92  )
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

Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 +++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 28 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 2cb90466798c..66cdd0bc1311 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -374,6 +374,10 @@ static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
 };
 
+static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
+	.fifo_size = 1920,
+};
+
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = &mt2701_rdma_driver_data},
@@ -383,6 +387,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	  .data = &mt8183_rdma_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = &mt8192_rdma_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = &mt8195_rdma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index adc9a4f4085b..9b5a7a7ddde0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -195,6 +195,19 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DSC0,
+	DDP_COMPONENT_MERGE0,
+	DDP_COMPONENT_DP_INTF0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -253,6 +266,11 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
+	.main_path = mt8195_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -470,12 +488,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8183-disp-dither",
 	  .data = (void *)MTK_DISP_DITHER },
+	{ .compatible = "mediatek,mt8195-disp-dsc",
+	  .data = (void *)MTK_DISP_DSC },
 	{ .compatible = "mediatek,mt8167-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8195-disp-merge",
+	  .data = (void *)MTK_DISP_MERGE },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
@@ -490,6 +512,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8195-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -524,6 +548,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
@@ -568,6 +594,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8186_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8195-vdosys0",
+	  .data = &mt8195_vdosys0_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
-- 
2.18.0


