Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515CAC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0b2aB8dsm6abuB8bFakibbAeGq2tWQaYWHpzyPccvjo=; b=Tu+rqWWd2dGZDq
	bQhHav0aJcEcy6RLWArPavLozWoMB4iGS3OO8+3WEPsZUJLwvv6IISQfURuKx/BUaTayHCQn9sJq/
	7m3sj1WX79DD/Qrb36TxEA6pBPYCKRb4/ok3BqeBPDb1cYiVUKIndAWZxH2rQgwnicG8E3icvfbso
	vFwx7tSyKXOOz0w37JIMz5kFKXJgGjAOpkD7XpPL+qlTvUMLDQf1cOOT+VM+lwfDG6xB1zmRuX2af
	AweW1gSKclgQhuO8VjUk1sHullaMMRQ4yPZAsCum4mHi3icQwo9mwDpK6/RzdbLaG5xJ5qYGyvhk3
	gnIZL2gLHfpBnP3a+6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6q9e-009us6-Lz; Mon, 10 Jan 2022 08:35:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6q8i-009uJh-GR; Mon, 10 Jan 2022 08:34:55 +0000
X-UUID: 62a544b5e76e492aaaf6c25ab9a16279-20220110
X-UUID: 62a544b5e76e492aaaf6c25ab9a16279-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1003449359; Mon, 10 Jan 2022 01:34:48 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 00:34:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 10 Jan 2022 16:34:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 16:34:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Steve Cho <stevecho@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,
 01/15] media: mtk-vcodec: Add vdec enable/disable hardware helpers
Date: Mon, 10 Jan 2022 16:34:28 +0800
Message-ID: <20220110083442.32604-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110083442.32604-1-yunfei.dong@mediatek.com>
References: <20220110083442.32604-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_003452_582386_6E1F234B 
X-CRM114-Status: GOOD (  20.45  )
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

Lock, power and clock are highly coupled operations. Adds vdec
enable/disable hardware helpers and uses them.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   5 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 168 +++++++++++-------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |   6 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  20 +--
 .../platform/mtk-vcodec/vdec_msg_queue.c      |   2 +
 5 files changed, 117 insertions(+), 84 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index d44894fa2f6e..fc3e272d2059 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -195,9 +195,6 @@ static int fops_vcodec_open(struct file *file)
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-		ret = mtk_vcodec_dec_pw_on(dev, MTK_VDEC_LAT0);
-		if (ret < 0)
-			goto err_load_fw;
 		/*
 		 * Does nothing if firmware was already loaded.
 		 */
@@ -254,8 +251,6 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	mtk_vcodec_dec_release(ctx);
 
-	if (v4l2_fh_is_singular(&ctx->fh))
-		mtk_vcodec_dec_pw_off(dev, MTK_VDEC_LAT0);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index b9f5ef979c69..c2ed79bce686 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -80,74 +80,31 @@ int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_clk);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+static int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
-	struct mtk_vdec_hw_dev *subdev_dev;
-	struct mtk_vcodec_pm *pm;
 	int ret;
 
-	if (vdec_dev->vdec_pdata->is_subdev_supported) {
-		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
-		if (!subdev_dev) {
-			mtk_v4l2_err("Failed to get hw dev\n");
-			return -EINVAL;
-		}
-		pm = &subdev_dev->pm;
-	} else {
-		pm = &vdec_dev->pm;
-	}
-
 	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
 
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+static void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
-	struct mtk_vdec_hw_dev *subdev_dev;
-	struct mtk_vcodec_pm *pm;
 	int ret;
 
-	if (vdec_dev->vdec_pdata->is_subdev_supported) {
-		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
-		if (!subdev_dev) {
-			mtk_v4l2_err("Failed to get hw dev\n");
-			return;
-		}
-		pm = &subdev_dev->pm;
-	} else {
-		pm = &vdec_dev->pm;
-	}
-
 	ret = pm_runtime_put_sync(pm->dev);
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
 
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+static void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 {
-	struct mtk_vdec_hw_dev *subdev_dev;
-	struct mtk_vcodec_pm *pm;
 	struct mtk_vcodec_clk *dec_clk;
 	int ret, i;
 
-	if (vdec_dev->vdec_pdata->is_subdev_supported) {
-		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
-		if (!subdev_dev) {
-			mtk_v4l2_err("Failed to get hw dev\n");
-			return;
-		}
-		pm = &subdev_dev->pm;
-		enable_irq(subdev_dev->dec_irq);
-	} else {
-		pm = &vdec_dev->pm;
-		enable_irq(vdec_dev->dec_irq);
-	}
-
 	dec_clk = &pm->vdec_clk;
 	for (i = 0; i < dec_clk->clk_num; i++) {
 		ret = clk_prepare_enable(dec_clk->clk_info[i].vcodec_clk);
@@ -169,31 +126,120 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 	for (i -= 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
 
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+static void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 {
-	struct mtk_vdec_hw_dev *subdev_dev;
-	struct mtk_vcodec_pm *pm;
 	struct mtk_vcodec_clk *dec_clk;
 	int i;
 
+	dec_clk = &pm->vdec_clk;
+	mtk_smi_larb_put(pm->larbvdec);
+	for (i = dec_clk->clk_num - 1; i >= 0; i--)
+		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
+}
+
+static void mtk_vcodec_dec_enable_irq(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+ {
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	if (!test_bit(hw_idx, vdec_dev->subdev_bitmap))
+		return;
+
 	if (vdec_dev->vdec_pdata->is_subdev_supported) {
 		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
-		if (!subdev_dev) {
+		if (subdev_dev)
+			enable_irq(subdev_dev->dec_irq);
+		else
+			mtk_v4l2_err("Failed to get hw dev\n");
+	} else {
+		enable_irq(vdec_dev->dec_irq);
+	}
+}
+
+static void mtk_vcodec_dec_disable_irq(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
+{
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	if (!test_bit(hw_idx, vdec_dev->subdev_bitmap))
+		return;
+
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (subdev_dev)
+			disable_irq(subdev_dev->dec_irq);
+		else
 			mtk_v4l2_err("Failed to get hw dev\n");
-			return;
-		}
-		pm = &subdev_dev->pm;
-		disable_irq(subdev_dev->dec_irq);
 	} else {
-		pm = &vdec_dev->pm;
 		disable_irq(vdec_dev->dec_irq);
 	}
+}
 
-	dec_clk = &pm->vdec_clk;
-	mtk_smi_larb_put(pm->larbvdec);
-	for (i = dec_clk->clk_num - 1; i >= 0; i--)
-		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
+static struct mtk_vcodec_pm *mtk_vcodec_dec_get_pm(struct mtk_vcodec_dev *vdec_dev,
+	int hw_idx)
+{
+	struct mtk_vdec_hw_dev *subdev_dev;
+
+	if (!test_bit(hw_idx, vdec_dev->subdev_bitmap))
+		return NULL;
+
+	if (vdec_dev->vdec_pdata->is_subdev_supported) {
+		subdev_dev = mtk_vcodec_get_hw_dev(vdec_dev, hw_idx);
+		if (subdev_dev)
+			return &subdev_dev->pm;
+
+		mtk_v4l2_err("Failed to get hw dev\n");
+		return NULL;
+	}
+
+	return &vdec_dev->pm;
+}
+
+static void mtk_vcodec_dec_child_dev_on(struct mtk_vcodec_dev *vdec_dev,
+	int hw_idx)
+{
+	struct mtk_vcodec_pm *pm;
+
+	pm = mtk_vcodec_dec_get_pm(vdec_dev, hw_idx);
+	if (pm) {
+		mtk_vcodec_dec_pw_on(pm);
+		mtk_vcodec_dec_clock_on(pm);
+	}
+}
+
+static void mtk_vcodec_dec_child_dev_off(struct mtk_vcodec_dev *vdec_dev,
+	int hw_idx)
+{
+	struct mtk_vcodec_pm *pm;
+
+	pm = mtk_vcodec_dec_get_pm(vdec_dev, hw_idx);
+	if (pm) {
+		mtk_vcodec_dec_clock_off(pm);
+		mtk_vcodec_dec_pw_off(pm);
+	}
+}
+
+void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
+{
+	mutex_lock(&ctx->dev->dec_mutex[hw_idx]);
+
+	if (IS_VDEC_LAT_ARCH(ctx->dev->vdec_pdata->hw_arch) &&
+		hw_idx == MTK_VDEC_CORE)
+		mtk_vcodec_dec_child_dev_on(ctx->dev, MTK_VDEC_LAT0);
+	mtk_vcodec_dec_child_dev_on(ctx->dev, hw_idx);
+
+	mtk_vcodec_dec_enable_irq(ctx->dev, hw_idx);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_enable_hardware);
+
+void mtk_vcodec_dec_disable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
+{
+	mtk_vcodec_dec_disable_irq(ctx->dev, hw_idx);
+
+	mtk_vcodec_dec_child_dev_off(ctx->dev, hw_idx);
+	if (IS_VDEC_LAT_ARCH(ctx->dev->vdec_pdata->hw_arch) &&
+		hw_idx == MTK_VDEC_CORE)
+		mtk_vcodec_dec_child_dev_off(ctx->dev, MTK_VDEC_LAT0);
+
+	mutex_unlock(&ctx->dev->dec_mutex[hw_idx]);
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_off);
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_disable_hardware);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index c4121df9764f..b420739b373d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -12,9 +12,7 @@
 int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm);
 
-int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
+void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx);
+void mtk_vcodec_dec_disable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx);
 
 #endif /* _MTK_VCODEC_DEC_PM_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 05a5b240e906..c93dd0ea3537 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -38,11 +38,9 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		return -EINVAL;
 	}
 
-	mtk_vdec_lock(ctx);
-	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
+	mtk_vcodec_dec_enable_hardware(ctx, ctx->hw_id);
 	ret = ctx->dec_if->init(ctx);
-	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
-	mtk_vdec_unlock(ctx);
+	mtk_vcodec_dec_disable_hardware(ctx, ctx->hw_id);
 
 	return ret;
 }
@@ -70,15 +68,11 @@ int vdec_if_decode(struct mtk_vcodec_ctx *ctx, struct mtk_vcodec_mem *bs,
 	if (!ctx->drv_handle)
 		return -EIO;
 
-	mtk_vdec_lock(ctx);
-
+	mtk_vcodec_dec_enable_hardware(ctx, ctx->hw_id);
 	mtk_vcodec_set_curr_ctx(ctx->dev, ctx, ctx->hw_id);
-	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
 	ret = ctx->dec_if->decode(ctx->drv_handle, bs, fb, res_chg);
-	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
 	mtk_vcodec_set_curr_ctx(ctx->dev, NULL, ctx->hw_id);
-
-	mtk_vdec_unlock(ctx);
+	mtk_vcodec_dec_disable_hardware(ctx, ctx->hw_id);
 
 	return ret;
 }
@@ -103,11 +97,9 @@ void vdec_if_deinit(struct mtk_vcodec_ctx *ctx)
 	if (!ctx->drv_handle)
 		return;
 
-	mtk_vdec_lock(ctx);
-	mtk_vcodec_dec_clock_on(ctx->dev, ctx->hw_id);
+	mtk_vcodec_dec_enable_hardware(ctx, ctx->hw_id);
 	ctx->dec_if->deinit(ctx->drv_handle);
-	mtk_vcodec_dec_clock_off(ctx->dev, ctx->hw_id);
-	mtk_vdec_unlock(ctx);
+	mtk_vcodec_dec_disable_hardware(ctx, ctx->hw_id);
 
 	ctx->drv_handle = NULL;
 }
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
index 576e08200a10..900d04fd4e66 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -212,11 +212,13 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 		return;
 
 	ctx = lat_buf->ctx;
+	mtk_vcodec_dec_enable_hardware(ctx, MTK_VDEC_CORE);
 	mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
 
 	lat_buf->core_decode(lat_buf);
 
 	mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
+	mtk_vcodec_dec_disable_hardware(ctx, MTK_VDEC_CORE);
 	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 
 	if (!list_empty(&ctx->msg_queue.lat_ctx.ready_queue)) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
