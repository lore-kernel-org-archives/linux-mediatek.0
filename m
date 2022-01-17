Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9Q/FmARmAduGglMVgjwcUDxffYBAluLdUhA7XKxGDs=; b=bKZNdeeojO6gAX
	W3uoAZAsZ2Lh8A2SUN1iWpixbk46/sTJoGJK6bwGsLp4ZUevNiEP8M7oG7olf/428Y9Ugq9O8EyiI
	GjaoTUXciARQ8bCn38J6unWkLHWLljOHBS5AR5/9QcynqYwIOQJlk2ftzGWkum8br0jXoFvkSKgR3
	pcWSh3R1qlPsYMwiPn+urT7o9nHpywJl/7hLA3znhojEBFfrRLZtuauq/isqWoIKcsdIvu5PrrJi3
	pOSUe+fgEjy+FL5hMzXgeXyj1GeBSrlS4jWTeaw42L0H6ClBu+sQsH45cco8DGhI2HvvSeNaex8VC
	vA84z0HMvh+IbogNTgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Qnf-00Emke-Db; Mon, 17 Jan 2022 12:07:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Qmc-00Em8q-Ne; Mon, 17 Jan 2022 12:06:50 +0000
X-UUID: a34dfb1ce67f4132ad593e9b4a8be06b-20220117
X-UUID: a34dfb1ce67f4132ad593e9b4a8be06b-20220117
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1447125500; Mon, 17 Jan 2022 05:06:43 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 04:06:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 20:06:39 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 20:06:38 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 07/10] media: mtk-vcodec: Rewrite venc clock interface
Date: Mon, 17 Jan 2022 20:06:12 +0800
Message-ID: <20220117120615.21687-8-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117120615.21687-1-irui.wang@mediatek.com>
References: <20220117120615.21687-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_040646_830641_CC2068E2 
X-CRM114-Status: GOOD (  18.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dual core mode need enable the specific core's clk, add an
another param for clock_on/clock_off interface.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 96 ++++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  4 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   | 10 +-
 3 files changed, 86 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index dfaef884e6e3..4e37d68f75dd 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -83,17 +83,42 @@ int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_init_enc_clk);
 
-void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev, int core_id)
 {
-	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
+	struct mtk_venc_core_dev *core;
+	struct mtk_vcodec_pm *enc_pm;
+	struct mtk_vcodec_clk *enc_clk;
+	struct clk              *clk;
 	int ret, i = 0;
 
-	for (i = 0; i < enc_clk->clk_num; i++) {
-		ret = clk_prepare_enable(enc_clk->clk_info[i].vcodec_clk);
-		if (ret) {
-			mtk_v4l2_err("venc clk_prepare_enable %d %s fail %d", i,
-				enc_clk->clk_info[i].clk_name, ret);
-			goto clkerr;
+	if (dev->venc_pdata->core_mode == VENC_DUAL_CORE_MODE) {
+		core = (struct mtk_venc_core_dev *)dev->enc_core_dev[core_id];
+		enc_pm = &core->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = 0; i < enc_clk->clk_num; i++) {
+			clk = enc_clk->clk_info[i].vcodec_clk;
+			ret = clk_enable(clk);
+			if (ret) {
+				mtk_v4l2_err("clk_enable %d %s fail %d", i,
+					     enc_clk->clk_info[i].clk_name,
+					     ret);
+				goto core_clk_err;
+			}
+		}
+	} else {
+		enc_pm = &dev->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = 0; i < enc_clk->clk_num; i++) {
+			clk = enc_clk->clk_info[i].vcodec_clk;
+			ret = clk_prepare_enable(clk);
+			if (ret) {
+				mtk_v4l2_err("clk_prepare %d %s fail %d",
+					     i, enc_clk->clk_info[i].clk_name,
+					     ret);
+				goto clkerr;
+			}
 		}
 	}
 
@@ -104,27 +129,49 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
 	}
 	return;
 
+core_clk_err:
+	for (i -= 1; i >= 0; i--)
+		clk_disable(enc_clk->clk_info[i].vcodec_clk);
+
+	return;
+
 clkerr:
 	for (i -= 1; i >= 0; i--)
 		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_enc_clock_on);
 
-void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev, int core_id)
 {
-	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
+	struct mtk_venc_core_dev *core;
+	struct mtk_vcodec_pm *enc_pm;
+	struct mtk_vcodec_clk *enc_clk;
 	int i = 0;
 
 	mtk_smi_larb_put(pm->larbvenc);
-	for (i = enc_clk->clk_num - 1; i >= 0; i--)
-		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
+
+	if (dev->venc_pdata->core_mode == VENC_DUAL_CORE_MODE) {
+		core = (struct mtk_venc_core_dev *)dev->enc_core_dev[core_id];
+		enc_pm = &core->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = enc_clk->clk_num - 1; i >= 0; i--)
+			clk_disable(enc_clk->clk_info[i].vcodec_clk);
+	} else {
+		enc_pm = &dev->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = enc_clk->clk_num - 1; i >= 0; i--)
+			clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_enc_clock_off);
 
 int mtk_venc_core_pw_on(struct mtk_vcodec_dev *dev)
 {
-	int i, ret;
+	int i, ret, j = 0;
 	struct mtk_venc_core_dev *core;
+	struct mtk_vcodec_clk *clk;
 
 	/* power on all available venc cores */
 	for (i = 0; i < MTK_VENC_CORE_MAX; i++) {
@@ -137,12 +184,28 @@ int mtk_venc_core_pw_on(struct mtk_vcodec_dev *dev)
 			mtk_v4l2_err("power on core[%d] fail %d", i, ret);
 			goto pw_on_fail;
 		}
+
+		clk = &core->pm.venc_clk;
+		for (j = 0; j < clk->clk_num; j++) {
+			ret = clk_prepare(clk->clk_info[j].vcodec_clk);
+			if (ret) {
+				mtk_v4l2_err("prepare clk [%s] fail %d",
+					     clk->clk_info[j].clk_name,
+					     ret);
+				goto pw_on_fail;
+			}
+		}
 	}
 	return 0;
 
 pw_on_fail:
 	for (i -= 1; i >= 0; i--) {
 		core = (struct mtk_venc_core_dev *)dev->enc_core_dev[i];
+
+		clk = &core->pm.venc_clk;
+		for (j -= 1; j >= 0; j--)
+			clk_unprepare(clk->clk_info[j].vcodec_clk);
+
 		pm_runtime_put_sync(&core->plat_dev->dev);
 	}
 	return ret;
@@ -150,8 +213,9 @@ int mtk_venc_core_pw_on(struct mtk_vcodec_dev *dev)
 
 int mtk_venc_core_pw_off(struct mtk_vcodec_dev *dev)
 {
-	int i, ret;
+	int i, ret, j;
 	struct mtk_venc_core_dev *core;
+	struct mtk_vcodec_clk *clk;
 
 	/* power off all available venc cores */
 	for (i = 0; i < MTK_VENC_CORE_MAX; i++) {
@@ -159,6 +223,10 @@ int mtk_venc_core_pw_off(struct mtk_vcodec_dev *dev)
 		if (!core)
 			return 0;
 
+		clk = &core->pm.venc_clk;
+		for (j = clk->clk_num - 1; j >= 0; j--)
+			clk_unprepare(clk->clk_info[j].vcodec_clk);
+
 		ret = pm_runtime_put_sync(&core->plat_dev->dev);
 		if (ret < 0)
 			mtk_v4l2_err("power off core[%d] fail %d", i, ret);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index 99b6b6e29e35..5113ed8a869e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -11,8 +11,8 @@
 
 int mtk_vcodec_init_enc_clk(struct platform_device *pdev,
 			    struct mtk_vcodec_pm *pm);
-void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
+void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev, int core_id);
+void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev, int core_id);
 
 int mtk_venc_core_pw_on(struct mtk_vcodec_dev *dev);
 int mtk_venc_core_pw_off(struct mtk_vcodec_dev *dev);
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index ce0bce811615..6cbdb7e30bb3 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
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
@@ -68,10 +64,10 @@ int venc_if_encode(struct mtk_vcodec_ctx *ctx,
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
