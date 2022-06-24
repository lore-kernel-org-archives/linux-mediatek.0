Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B71EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNRU+1O5OLOAabOim9aUifVjNjBaLKHqCBz3ZBptZk0=; b=M7TfSWDtLL6PvUJIeiCq96F0iw
	FPT0X2pWEnxiwLJNaLOOA/LeyClQUtxaoFxyAB9F+w5gIxluyVo9JYExcNERCaPGRjpaDEYvvfOw9
	eV4H8Xm3VrIER7kr/N6r7Hptx7silNSHAVGiuJdm8CH5HIU/LZ+ezRSQfx410C3txEKMIQVb0XJTU
	VgkBa9sMqrXX8cKyTPiVkcyw2utqdjBWPdaPJlLEm10On20nAB6tNcC792RTsmbRlgmFh2aFc9XJX
	mropNZyPxiMtPhtBLVDrySgfTOxde5vM7qgc11lo3bosnysvkiNLFbNAcYvH2Uza6meTpRomN741N
	D04ukDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4ejo-001BzN-Mc; Fri, 24 Jun 2022 08:32:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4ehw-001B6x-FX; Fri, 24 Jun 2022 08:30:32 +0000
X-UUID: 10c6539658014143a3279f14495d64a8-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:2f4e71af-4038-4041-a127-827896d06b9a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:64a0f22d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 10c6539658014143a3279f14495d64a8-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 694019319; Fri, 24 Jun 2022 01:30:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 01:23:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 24 Jun 2022 16:23:44 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jun 2022 16:23:42 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Tzung-Bi Shih
	<tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4, 5/8] media: mediatek: vcodec: Add venc power on/off function
Date: Fri, 24 Jun 2022 16:23:32 +0800
Message-ID: <20220624082335.10165-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624082335.10165-1-irui.wang@mediatek.com>
References: <20220624082335.10165-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_013028_551118_70EC6539 
X-CRM114-Status: GOOD (  19.17  )
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

when enable multi-core encoding, all available encoder cores' power need
to be on/off, add new functions for encoder cores' power management.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_enc.c | 30 +++----
 .../mediatek/vcodec/mtk_vcodec_enc_pm.c       | 84 +++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_enc_pm.h       |  2 +
 .../platform/mediatek/vcodec/venc_drv_if.c    |  6 --
 4 files changed, 98 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index c21367038c34..2b4a2acc8d2d 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -8,10 +8,10 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
-#include <linux/pm_runtime.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_enc.h"
+#include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 #include "venc_drv_if.h"
@@ -849,7 +849,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(q);
 	struct venc_enc_param param;
-	int ret, pm_ret;
+	int ret;
 	int i;
 
 	/* Once state turn into MTK_STATE_ABORT, we need stop_streaming
@@ -869,18 +869,12 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 			return 0;
 	}
 
-	ret = pm_runtime_resume_and_get(&ctx->dev->plat_dev->dev);
-	if (ret < 0) {
-		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
-		goto err_start_stream;
-	}
-
 	mtk_venc_set_param(ctx, &param);
 	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
 	if (ret) {
 		mtk_v4l2_err("venc_if_set_param failed=%d", ret);
 		ctx->state = MTK_STATE_ABORT;
-		goto err_set_param;
+		goto err_start_stream;
 	}
 	ctx->param_change = MTK_ENCODE_PARAM_NONE;
 
@@ -893,17 +887,19 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 		if (ret) {
 			mtk_v4l2_err("venc_if_set_param failed=%d", ret);
 			ctx->state = MTK_STATE_ABORT;
-			goto err_set_param;
+			goto err_start_stream;
 		}
 		ctx->state = MTK_STATE_HEADER;
 	}
 
-	return 0;
+	ret = mtk_vcodec_enc_power_on(ctx);
+	if (ret) {
+		mtk_v4l2_err("mtk_vcodec_enc_power_on failed=%d", ret);
+		ctx->state = MTK_STATE_ABORT;
+		goto err_start_stream;
+	}
 
-err_set_param:
-	pm_ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
-	if (pm_ret < 0)
-		mtk_v4l2_err("pm_runtime_put fail %d", pm_ret);
+	return 0;
 
 err_start_stream:
 	for (i = 0; i < q->num_buffers; ++i) {
@@ -988,9 +984,7 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 	if (ret)
 		mtk_v4l2_err("venc_if_deinit failed=%d", ret);
 
-	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
-	if (ret < 0)
-		mtk_v4l2_err("pm_runtime_put fail %d", ret);
+	mtk_vcodec_enc_power_off(ctx);
 
 	ctx->state = MTK_STATE_FREE;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
index 75de5031d292..a6f30b3a6bc5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c
@@ -9,6 +9,7 @@
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 
+#include "mtk_vcodec_enc_hw.h"
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
 
@@ -56,6 +57,89 @@ int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_init_enc_clk);
 
+static int mtk_enc_core_power_on(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_venc_hw_dev *sub_core;
+	int ret, i;
+
+	/* multi-core encoding need power on all available cores */
+	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
+		sub_core = (struct mtk_venc_hw_dev *)ctx->dev->enc_hw_dev[i];
+		if (!sub_core)
+			continue;
+
+		ret = pm_runtime_resume_and_get(&sub_core->plat_dev->dev);
+		if (ret) {
+			mtk_v4l2_err("power on sub_core[%d] fail %d", i, ret);
+			goto pm_on_fail;
+		}
+	}
+	return ret;
+
+pm_on_fail:
+	for (i -= 1; i >= 0; i--) {
+		sub_core = (struct mtk_venc_hw_dev *)ctx->dev->enc_hw_dev[i];
+		pm_runtime_put_sync(&sub_core->plat_dev->dev);
+	}
+	return ret;
+}
+
+int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_vcodec_pm *pm = &ctx->dev->pm;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(pm->dev);
+	if (ret) {
+		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
+		return ret;
+	}
+
+	if (IS_VENC_MULTICORE(ctx->dev->enc_capability)) {
+		ret = mtk_enc_core_power_on(ctx);
+		if (ret) {
+			mtk_v4l2_err("mtk_enc_core_power_on fail %d", ret);
+			goto core_error;
+		}
+	}
+	return ret;
+
+core_error:
+	pm_runtime_put_sync(pm->dev);
+	return ret;
+}
+
+static void mtk_enc_core_power_off(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_venc_hw_dev *sub_core;
+	int ret, i;
+
+	/* multi-core encoding need power off all available cores */
+	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
+		sub_core = (struct mtk_venc_hw_dev *)ctx->dev->enc_hw_dev[i];
+		if (!sub_core)
+			continue;
+
+		ret = pm_runtime_put_sync(&sub_core->plat_dev->dev);
+		if (ret)
+			mtk_v4l2_err("power off sub_core[%d] fail %d", i, ret);
+	}
+}
+
+void mtk_vcodec_enc_power_off(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_vcodec_pm *pm = &ctx->dev->pm;
+	int ret;
+
+	ret = pm_runtime_put_sync(pm->dev);
+	if (ret)
+		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
+
+	if (IS_VENC_MULTICORE(ctx->dev->enc_capability)) {
+		mtk_enc_core_power_off(ctx);
+	}
+}
+
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
 {
 	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h
index 361dec5be47f..9065dec4ed4f 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.h
@@ -12,6 +12,8 @@
 int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
 			    struct mtk_vcodec_pm *pm);
 
+int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx);
+void mtk_vcodec_enc_power_off(struct mtk_vcodec_ctx *ctx);
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
 
diff --git a/drivers/media/platform/mediatek/vcodec/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/venc_drv_if.c
index ce0bce811615..65a27e39ef5b 100644
--- a/drivers/media/platform/mediatek/vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc_drv_if.c
@@ -32,9 +32,7 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 	}
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->init(ctx);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	return ret;
@@ -46,9 +44,7 @@ int venc_if_set_param(struct mtk_vcodec_ctx *ctx,
 	int ret = 0;
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->set_param(ctx->drv_handle, type, in);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	return ret;
@@ -89,9 +85,7 @@ int venc_if_deinit(struct mtk_vcodec_ctx *ctx)
 		return 0;
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->deinit(ctx->drv_handle);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	ctx->drv_handle = NULL;
-- 
2.18.0


