Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87149C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBMZWcluI0mb9Ysy8M9cMLosoCh4lNRVv9go/Nabg0w=; b=4xQk4nTf1CwNeaD68C99WIi5L9
	keqHX7wodt+vnFS8RnWDq/4GHfco0W6p24LkwU2QrzE2VWWID1hoSbz+u0xL6QKZVGBiVg6BB8i8L
	i5Wq2veUDnIqN9Bwx4BrUjfFQbQg1h1PGDT3jAtLkqNCCkYDuoSxWMUJJxu9mnYk2GHw4nfw+ERBO
	jG1BVrKa6Nwox5qS4o+UN9T4Kv05goKcwvmF98XjNPngbfLBBIVnPQKoN5q3wb7WAhMWffLcWDS+E
	bwo0LGwnDnmk8ffm0ZV/Wf7lEYroVAyvRms9bzl8L8t2gBx/vZurxzzADwBK6QajGLUHkaw4c+4i5
	FUv8XV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHwh-0021iY-Q4; Fri, 13 Jan 2023 11:10:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHsG-001zqK-6f; Fri, 13 Jan 2023 11:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wBMZWcluI0mb9Ysy8M9cMLosoCh4lNRVv9go/Nabg0w=; b=cdtMUDgez3+SJTE7xAxHhAtrHk
	3fSMR4Av0KO/T3QXLp7g3GeApgKdcvG4dOcSRl5IbJFu7xDKAk8GryedsrGpi7A6wNLtb8FCfSqpv
	ahdvxZb77GE+qB5FuwtrgDlhEkIzyGzAY3CVPJnVU6Si5xH+QG+qx/A4QrREaQBQlF4WOOVoRanhT
	u8eFMZI8v9QdgFAwDumChiNJfmNwKTc/t+FRl4KwXeK0f/LpfA1iJlPrW9Y4I0dCHDzkI1EKkBqwC
	0Cq1nVyWo5kbZ8fX6Mt/CLMdld/5QVu0YXQM9Cn/9vjZkCOgEXnr4UVerefsdzM7bcgVI+UfBf8Xh
	xkVWE5vg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGHs1-004KMs-0A;
	Fri, 13 Jan 2023 11:05:18 +0000
X-UUID: 26b14722933211eda08d4d6090ec5a5c-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wBMZWcluI0mb9Ysy8M9cMLosoCh4lNRVv9go/Nabg0w=;
	b=Bns2z+w923rIHv9VtEMii0yaqZXwJ1OUnyLjJ5XzqcPgJ6sbu8fSO/B/8nmt8oswvUwnVy6DqFqvnN/sYe4+fAvbF+s6ROYbA3aH6CPmZNOWR2IKtXodbSmBr52RuuZWWZZ7JKJeNI+fXDQjj3fZ2LWCayiOHNziV2eteXi48jk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:56383f2a-aae3-49b4-b849-ececbec2c443,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:49cf2e8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 26b14722933211eda08d4d6090ec5a5c-20230113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1079428875; Fri, 13 Jan 2023 04:05:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 18:44:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 18:44:37 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu
	<ck.hu@mediatek.com>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan
 Lu <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Xinlei
 Lee <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v30 08/11] soc: mediatek: mmsys: add mmsys for support 64 reset bits
Date: Fri, 13 Jan 2023 18:44:31 +0800
Message-ID: <20230113104434.28023-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113104434.28023-1-nancy.lin@mediatek.com>
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_110516_756631_A1CB832E 
X-CRM114-Status: GOOD (  17.57  )
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
index a0a584f16405..32b17c56c44a 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -22,6 +22,8 @@
 #include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -53,6 +55,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
@@ -60,6 +63,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.routes = mmsys_mt8183_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
@@ -67,6 +71,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.routes = mmsys_mt8186_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
@@ -80,6 +85,7 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.routes = mmsys_mt8192_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
@@ -229,13 +235,19 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
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
 
@@ -290,20 +302,22 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
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


