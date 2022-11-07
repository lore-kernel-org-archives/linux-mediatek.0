Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5BDC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoGm/YvIu7CmIfCQIQ4ugMZNbm3cqB9AGKlSebBMzug=; b=ClslaDNwjaAESKKLT95bmCrd9D
	lSDElYpFZBnje9+ObPxMrFtC+U444l/zFQeKNtVs10A4kUpsaz+UNQYGnBM/CBJceXLUSH4GMQ7lj
	ZyOeSQUiJ/js3z5sJYBOnBI1Pql7k7OokCFDcA9FXUMh4cjshzoHMp+1CPniA4TPz1gYRAZUhL6qw
	VRj6QURfUP3/QK8sHl7oi/VzczANgSdrja75JzSNizi+K4bs7BpmSzJrvpxUI/QBzarCNpV4XvX3O
	6yID2v+zc7K9K3VPwlDInEmpx51QGeu3P7PEILO6JYzHaySVqPPdezw+grTpP/wwGqjqhZ3J7TGIf
	GpVNp7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwZ2-00CNi8-IA; Mon, 07 Nov 2022 07:29:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwTh-00CKKM-2A; Mon, 07 Nov 2022 07:23:32 +0000
X-UUID: b1f61eaf3b954a75b6e570417908f996-20221107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IoGm/YvIu7CmIfCQIQ4ugMZNbm3cqB9AGKlSebBMzug=;
	b=AvlPnGPsLVquIzfZ/au1BCZFPAD3Tva/Dc7eqL9yAcyLPFsn3o7lhZeePGpg2vUyE2SWRjvGY2AlbHzfw9cnsp2cRIZwIShpvtIBJwHoS4l+nAtA3f6/lSh0fobDXgWETKM0Y0QW2xF3ODr6mQGPAyssacacylDsxDK7nkvshtY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:ba7e45b6-5377-4f9c-a834-fe880395f3dc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:fe9ecb90-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b1f61eaf3b954a75b6e570417908f996-20221107
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 671363663; Mon, 07 Nov 2022 00:23:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 7 Nov 2022 15:22:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 7 Nov 2022 15:22:47 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	<nfraprado@collabora.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v28 08/11] soc: mediatek: mmsys: add mmsys for support 64 reset bits
Date: Mon, 7 Nov 2022 15:22:40 +0800
Message-ID: <20221107072243.15748-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221107072243.15748-1-nancy.lin@mediatek.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_232329_181210_8B65181E 
X-CRM114-Status: GOOD (  17.00  )
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

Add mmsys for support 64 reset bits. It is a preparation for MT8195
vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.

1. Add the number of reset bits in mmsys private data
2. move the whole "reset register code section" behind the
"get mmsys->data" code section for getting the num_resets in mmsys->data.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 40 +++++++++++++++++++++-----------
 drivers/soc/mediatek/mtk-mmsys.h |  1 +
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1bd2f8e45d85..78601372512f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -20,6 +20,8 @@
 #include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -51,6 +53,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
@@ -58,6 +61,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.routes = mmsys_mt8183_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
@@ -65,6 +69,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.routes = mmsys_mt8186_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -72,6 +77,7 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.routes = mmsys_mt8192_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
@@ -206,13 +212,19 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 {
 	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
 	unsigned long flags;
+	u32 offset;
+	u32 reg;
+
+	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
+	id = id % MMSYS_SW_RESET_PER_REG;
+	reg = mmsys->data->sw0_rst_offset + offset;
 
 	spin_lock_irqsave(&mmsys->lock, flags);
 
 	if (assert)
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0, NULL);
+		mtk_mmsys_update_bits(mmsys, reg, BIT(id), 0, NULL);
 	else
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id), NULL);
+		mtk_mmsys_update_bits(mmsys, reg, BIT(id), BIT(id), NULL);
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
@@ -267,20 +279,22 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	spin_lock_init(&mmsys->lock);
+	mmsys->data = of_device_get_match_data(&pdev->dev);
 
-	mmsys->rcdev.owner = THIS_MODULE;
-	mmsys->rcdev.nr_resets = 32;
-	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
-	mmsys->rcdev.of_node = pdev->dev.of_node;
-	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
-	if (ret) {
-		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
-		return ret;
+	if (mmsys->data->num_resets > 0) {
+		spin_lock_init(&mmsys->lock);
+
+		mmsys->rcdev.owner = THIS_MODULE;
+		mmsys->rcdev.nr_resets = mmsys->data->num_resets;
+		mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
+		mmsys->rcdev.of_node = pdev->dev.of_node;
+		ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
+			return ret;
+		}
 	}
 
-	mmsys->data = of_device_get_match_data(&pdev->dev);
-
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
 	if (ret)
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 77f37f8c715b..e19994749adb 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -91,6 +91,7 @@ struct mtk_mmsys_driver_data {
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
+	const u32 num_resets;
 };
 
 /*
-- 
2.18.0


