Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2004C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 03:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YODgIkJ5B15rmZrHBBzn4vXZqLJDx2Vv+ld3YAklVw=; b=2tQfjiWHbbWzlvOQLiOgYez75j
	aAhzIRKTf13sP9LlvbQ+yyGa/OveDvpcIKVvU4JW6RjZIcqorIyviz+YoPyt9nTeY9cHb1juGD1Si
	CT49gmrWN4S4s4GMZIkuzsAZq2FVwhev8T3nSruxUkSGbTMrKcH+Q5W/aTys9bOM2NI0m+R/iFXMx
	5phzHSu0Wh0boZWmmacNSw+ZSv17YSdwTfzZhY9S64vMJwPMrJaTXfpPHcZKhPyo/NY3l9sWfHJqH
	GUztqCd53rXBnJUHNjjw2FijE4SpJyC2NFPCGFXT9bu4K8zrGDkV9XwD+u2mqQz/Q3cVqMoJrzTn1
	sj4sPHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHH3J-000Jh0-23; Fri, 29 Jul 2022 03:52:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHH3G-000JfH-4M; Fri, 29 Jul 2022 03:52:39 +0000
X-UUID: 1629b98dc2fa4817b970b4f1e258255e-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:db849eaf-6364-4e94-bd08-5730121d8927,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:1acaae24-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1629b98dc2fa4817b970b4f1e258255e-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 136734312; Thu, 28 Jul 2022 20:52:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 11:51:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Jul 2022 11:51:37 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Tomasz
 Figa <tfiga@google.com>, <nicolas.dufresne@collabora.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Irui
 Wang" <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5, 6/8] media: mediatek: vcodec: Refactor encoder clock on/off function
Date: Fri, 29 Jul 2022 11:51:27 +0800
Message-ID: <20220729035129.3634-7-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729035129.3634-1-irui.wang@mediatek.com>
References: <20220729035129.3634-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_205238_189514_73E513E4 
X-CRM114-Status: GOOD (  18.20  )
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

when enable multi-core encoding, encoder cores use their own clock,
refactor clock management functions with used encoder hardware id.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../mediatek/vcodec/mtk_vcodec_enc_pm.c       | 89 ++++++++++++++++---
 .../mediatek/vcodec/mtk_vcodec_enc_pm.h       |  6 +-
 .../platform/mediatek/vcodec/venc_drv_if.c    |  4 +-
 3 files changed, 84 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
index 213c3f50e9eb..2f83aade779a 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
@@ -60,7 +60,9 @@ EXPORT_SYMBOL_GPL(mtk_vcodec_init_enc_clk);
 static int mtk_enc_core_power_on(struct mtk_vcodec_ctx *ctx)
 {
 	struct mtk_venc_hw_dev *sub_core;
+	struct mtk_vcodec_clk *clk;
 	int ret, i;
+	int j = 0;
 
 	/* multi-core encoding need power on all available cores */
 	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
@@ -73,12 +75,27 @@ static int mtk_enc_core_power_on(struct mtk_vcodec_ctx *ctx)
 			mtk_v4l2_err("power on sub_core[%d] fail %d", i, ret);
 			goto pm_on_fail;
 		}
+
+		clk = &sub_core->pm.venc_clk;
+		for (j = 0; j < clk->clk_num; j++) {
+			ret = clk_prepare(clk->clk_info[j].vcodec_clk);
+			if (ret) {
+				mtk_v4l2_err("prepare clk [%s] fail %d",
+					     clk->clk_info[j].clk_name, ret);
+				goto pm_on_fail;
+			}
+		}
 	}
 	return ret;
 
 pm_on_fail:
 	for (i -= 1; i >= 0; i--) {
 		sub_core = (struct mtk_venc_hw_dev *)ctx->dev->enc_hw_dev[i];
+
+		clk = &sub_core->pm.venc_clk;
+		for (j -= 1; j >= 0; j--)
+			clk_unprepare(clk->clk_info[j].vcodec_clk);
+
 		pm_runtime_put_sync(&sub_core->plat_dev->dev);
 	}
 	return ret;
@@ -87,7 +104,9 @@ static int mtk_enc_core_power_on(struct mtk_vcodec_ctx *ctx)
 int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx)
 {
 	struct mtk_vcodec_pm *pm = &ctx->dev->pm;
+	struct mtk_vcodec_clk *clk;
 	int ret;
+	int i = 0;
 
 	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret) {
@@ -95,6 +114,16 @@ int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx)
 		return ret;
 	}
 
+	clk = &pm->venc_clk;
+	for (i = 0; i < clk->clk_num; i++) {
+		ret = clk_prepare(clk->clk_info[i].vcodec_clk);
+		if (ret) {
+			mtk_v4l2_err("prepare clk [%s] fail %d",
+				     clk->clk_info[i].clk_name, ret);
+			goto clk_error;
+		}
+	}
+
 	if (IS_VENC_MULTICORE(ctx->dev->enc_capability)) {
 		ret = mtk_enc_core_power_on(ctx);
 		if (ret) {
@@ -104,6 +133,9 @@ int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx)
 	}
 	return ret;
 
+clk_error:
+	for (i -= 1; i >= 0; i--)
+		clk_unprepare(clk->clk_info[i].vcodec_clk);
 core_error:
 	pm_runtime_put_sync(pm->dev);
 	return ret;
@@ -112,7 +144,8 @@ int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx)
 static void mtk_enc_core_power_off(struct mtk_vcodec_ctx *ctx)
 {
 	struct mtk_venc_hw_dev *sub_core;
-	int ret, i;
+	struct mtk_vcodec_clk *clk;
+	int ret, i, j;
 
 	/* multi-core encoding need power off all available cores */
 	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
@@ -120,6 +153,10 @@ static void mtk_enc_core_power_off(struct mtk_vcodec_ctx *ctx)
 		if (!sub_core)
 			continue;
 
+		clk = &sub_core->pm.venc_clk;
+		for (j = clk->clk_num - 1; j >= 0; j--)
+			clk_unprepare(clk->clk_info[j].vcodec_clk);
+
 		ret = pm_runtime_put_sync(&sub_core->plat_dev->dev);
 		if (ret)
 			mtk_v4l2_err("power off sub_core[%d] fail %d", i, ret);
@@ -129,26 +166,44 @@ static void mtk_enc_core_power_off(struct mtk_vcodec_ctx *ctx)
 void mtk_vcodec_enc_power_off(struct mtk_vcodec_ctx *ctx)
 {
 	struct mtk_vcodec_pm *pm = &ctx->dev->pm;
-	int ret;
+	struct mtk_vcodec_clk *clk;
+	int ret, i;
 
 	if (IS_VENC_MULTICORE(ctx->dev->enc_capability))
 		mtk_enc_core_power_off(ctx);
 
+	clk = &pm->venc_clk;
+	for (i = clk->clk_num - 1; i >= 0; i--)
+		clk_unprepare(clk->clk_info[i].vcodec_clk);
+
 	ret = pm_runtime_put_sync(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
 
-void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev,
+			     enum mtk_venc_hw_id hw_id)
 {
-	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
+	struct mtk_venc_hw_dev *sub_core;
+	struct mtk_vcodec_clk *enc_clk;
+
 	int ret, i = 0;
 
+	if (hw_id == MTK_VENC_CORE_0) {
+		enc_clk = &dev->pm.venc_clk;
+	} else if (hw_id == MTK_VENC_CORE_1) {
+		sub_core = (struct mtk_venc_hw_dev *)dev->enc_hw_dev[hw_id];
+		enc_clk = &sub_core->pm.venc_clk;
+	} else {
+		mtk_v4l2_err("invalid hw id : %d", hw_id);
+		return;
+	}
+
 	for (i = 0; i < enc_clk->clk_num; i++) {
-		ret = clk_prepare_enable(enc_clk->clk_info[i].vcodec_clk);
+		ret = clk_enable(enc_clk->clk_info[i].vcodec_clk);
 		if (ret) {
-			mtk_v4l2_err("venc clk_prepare_enable %d %s fail %d", i,
-				enc_clk->clk_info[i].clk_name, ret);
+			mtk_v4l2_err("venc clk_enable %d %s fail %d", i,
+				     enc_clk->clk_info[i].clk_name, ret);
 			goto clkerr;
 		}
 	}
@@ -157,14 +212,26 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
 
 clkerr:
 	for (i -= 1; i >= 0; i--)
-		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
+		clk_disable(enc_clk->clk_info[i].vcodec_clk);
 }
 
-void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev,
+			      enum mtk_venc_hw_id hw_id)
 {
-	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
+	struct mtk_venc_hw_dev *sub_core;
+	struct mtk_vcodec_clk *enc_clk;
 	int i = 0;
 
+	if (hw_id == MTK_VENC_CORE_0) {
+		enc_clk = &dev->pm.venc_clk;
+	} else if (hw_id == MTK_VENC_CORE_1) {
+		sub_core = (struct mtk_venc_hw_dev *)dev->enc_hw_dev[hw_id];
+		enc_clk = &sub_core->pm.venc_clk;
+	} else {
+		mtk_v4l2_err("invalid hw id : %d", hw_id);
+		return;
+	}
+
 	for (i = enc_clk->clk_num - 1; i >= 0; i--)
-		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
+		clk_disable(enc_clk->clk_info[i].vcodec_clk);
 }
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h
index 9065dec4ed4f..a2906d2971ee 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h
@@ -14,7 +14,9 @@ int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
 
 int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx);
 void mtk_vcodec_enc_power_off(struct mtk_vcodec_ctx *ctx);
-void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
+void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev,
+			     enum mtk_venc_hw_id hw_id);
+void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev,
+			      enum mtk_venc_hw_id hw_id);
 
 #endif /* _MTK_VCODEC_ENC_PM_H_ */
diff --git a/drivers/media/platform/mediatek/vcodec/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/venc_drv_if.c
index 65a27e39ef5b..6cbdb7e30bb3 100644
--- a/drivers/media/platform/mediatek/vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc_drv_if.c
@@ -64,10 +64,10 @@ int venc_if_encode(struct mtk_vcodec_ctx *ctx,
 	ctx->dev->curr_ctx = ctx;
 	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
 
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
+	mtk_vcodec_enc_clock_on(ctx->dev, 0);
 	ret = ctx->enc_if->encode(ctx->drv_handle, opt, frm_buf,
 				  bs_buf, result);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
+	mtk_vcodec_enc_clock_off(ctx->dev, 0);
 
 	spin_lock_irqsave(&ctx->dev->irqlock, flags);
 	ctx->dev->curr_ctx = NULL;
-- 
2.18.0


