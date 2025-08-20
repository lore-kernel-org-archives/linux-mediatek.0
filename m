Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71860CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b6MrObmZF0W3Iz/7ouACW2WJ6KhbE+Mk18toMzH5Rik=; b=QpqtHuPeb7LYK3K5uo/WjvptW1
	0vODNwM90PhRDwdhfOcqWAD/FFBjmERk8BAlFaVr0FmiuuzT25lAqZwM2f1SzZ87qtNGbvJ1ikfAk
	3M2cnfO0Xj1LCd6xEre13QkahWyQOi3rqeDQ+4kUkd45+/tqw9AW1LxgvrzMkXrsa+x9jJ8bUSeAM
	PErNPGnY8waB3UQGTn4A6pL2LgT70Qa3odrsJw5woIwU/uiWNpToJESpUUVTTn1BPWN/IZeU5AIm5
	1FLZHdJ6hoCdC3uRg8839vpenvveRVMMFaetWgimNbSj8K8jF5IsTjfQctfc2rG6xOKoolD8Iv8Jb
	BO0fqWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodei-0000000CeEy-0P53;
	Wed, 20 Aug 2025 07:54:48 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodeB-0000000CeB9-1hsV
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 07:54:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso3999031b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Aug 2025 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755676454; x=1756281254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6MrObmZF0W3Iz/7ouACW2WJ6KhbE+Mk18toMzH5Rik=;
        b=drpB8C8RnDZ/aTXcxZlA+TiYkwOfvKU68QkZeB8sGnFEb9UNBFKzo1cr8EhYPyMD0H
         dmRdnLazjzd6DFD7XfVZP3JyvGr937QbRiwCwp6h6moAfOPYrxwVN0agH9bApOK8Jlj+
         mOAG0A3DMQAFh+qE4OGRX/qGD/2aCUN4OOudo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755676454; x=1756281254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6MrObmZF0W3Iz/7ouACW2WJ6KhbE+Mk18toMzH5Rik=;
        b=gNzbJULD4V70fUd7iZgtWW8qvgXHYRU92HUXgFF5/ziYB5VZ0sWm+5Drz1J+JZithM
         NanNvnwEJ2K0JG0SiHCz8BrQbKLUFTd5IlpE2bTv43CLT4mlie6WiRUMnvUkBjAUM/Je
         pZR3Nl+HQRtdpcbBvjiTbFhjQ225S5fPRHj4horPFXclVkja8OE05auOOUqwYutqq/Pv
         lbpunH1G11avFWEst+yTRFeY72gbmbLX44FXWwaV3j2SA3/aCkJ1Mwj1tEasNO+yJKA4
         HsnykIWQLJrMzzlLOWacFOEw52Sci7Q6xxzS8VMMuUbKbx06S2dVIx5uXbIig4FSNGl5
         8wFw==
X-Forwarded-Encrypted: i=1; AJvYcCWvEBYmgI48D6Odyg4+LfsQdLdiwQyTLOfhCWnupRzoMgWaEYASlRZi8Zf6iQpdRrWmxZp65PUEiZgAPURp2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKlPJLdQkx4Zohp9/+n5Ar4nnSnrmjnRDx1hScSLdJ57JjT2d8
	QAvCYWX6jwU/gPExzPkHT2wy1SpVW4JEBill5DUMHaFJHZ0cJWLNETeR8HwKNGntetyRnoWTnaJ
	9FFg=
X-Gm-Gg: ASbGncvt+YTwG6wM6khfEZFpOvBEnY7CjQmKVmn6ilEMZnq3z5P2PXHSf6ghnLbiZXW
	zwbkTbFbnRdGouZsg2NcKy8ohv4qTRHsbbPRHA4xSbVyUAOsrnpw9FcqE9rV0OIQRFp6CbC+0QD
	ex2c0naoq1XZqE1+Z8xzoLcvLmZ5pZOJ3uKkvUAlNy/szF9CAENH2IKaYqONYh3HzsZfVzQuBya
	0xiarhdQA1ijCMAAW432GaD9fcHxRRGHfTO0OdUn8ndzYRklDLlpQOYbhkhRhYk/TwDCtg/6BrS
	emp0SbiGZdqrcNaFaJvrL1nch6EmcTDUP62isId+Iv0umMKUcCzTFa4FmU2SGB8wx5wH+vjYxm4
	09EEZHKlorSjyffMY8npJPOB1XY7h79zQ4tQ37lmk
X-Google-Smtp-Source: AGHT+IHvJjrk2TtQqpsyJ1Ye0D3Ld8eJPj/J3yAc/mNjIWdy7fiHoTPy/AdpxRywfbk04Kizt/1zwQ==
X-Received: by 2002:a05:6a20:389d:b0:23f:f431:9f64 with SMTP id adf61e73a8af0-2431b829560mr2427344637.25.1755676454152;
        Wed, 20 Aug 2025 00:54:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:53f4:ede0:803f:9a86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4764090714sm1547298a12.32.2025.08.20.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 00:54:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list protection lock
Date: Wed, 20 Aug 2025 15:54:05 +0800
Message-ID: <20250820075405.1041838-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_005415_478841_5B144506 
X-CRM114-Status: GOOD (  19.81  )
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

Previously a mutex was added to protect the encoder and decoder context
lists from unexpected changes originating from the SCP IP block, causing
the context pointer to go invalid, resulting in a NULL pointer
dereference in the IPI handler.

Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
context. This causes a big warning from the scheduler. This was first
reported downstream on the ChromeOS kernels, but is also reproducible
on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
the actual capture format is not supported, the affected code paths
are triggered.

Since this lock just protects the context list and operations on it are
very fast, it should be OK to switch to a spinlock.

Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect decoder context list")
Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect encoder context list")
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Switched to _irqsave / _irqrestore variants even in helper only called
  by IRQ handler (Tomasz)

 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  5 +++--
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
 .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  5 +++--
 7 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index d7027d600208..223fb2294894 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -47,30 +47,32 @@ static void mtk_vcodec_vpu_reset_dec_handler(void *priv)
 {
 	struct mtk_vcodec_dec_dev *dev = priv;
 	struct mtk_vcodec_dec_ctx *ctx;
+	unsigned long flags;
 
 	dev_err(&dev->plat_dev->dev, "Watchdog timeout!!");
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_for_each_entry(ctx, &dev->ctx_list, list) {
 		ctx->state = MTK_STATE_ABORT;
 		mtk_v4l2_vdec_dbg(0, ctx, "[%d] Change to state MTK_STATE_ABORT", ctx->id);
 	}
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 }
 
 static void mtk_vcodec_vpu_reset_enc_handler(void *priv)
 {
 	struct mtk_vcodec_enc_dev *dev = priv;
 	struct mtk_vcodec_enc_ctx *ctx;
+	unsigned long flags;
 
 	dev_err(&dev->plat_dev->dev, "Watchdog timeout!!");
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_for_each_entry(ctx, &dev->ctx_list, list) {
 		ctx->state = MTK_STATE_ABORT;
 		mtk_v4l2_vdec_dbg(0, ctx, "[%d] Change to state MTK_STATE_ABORT", ctx->id);
 	}
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 }
 
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 46d176e6de63..3b81fae9f913 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -198,6 +198,7 @@ static int fops_vcodec_open(struct file *file)
 	struct mtk_vcodec_dec_ctx *ctx = NULL;
 	int ret = 0, i, hw_count;
 	struct vb2_queue *src_vq;
+	unsigned long flags;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -267,9 +268,9 @@ static int fops_vcodec_open(struct file *file)
 
 	ctx->dev->vdec_pdata->init_vdec_params(ctx);
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_add(&ctx->list, &dev->ctx_list);
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 	mtk_vcodec_dbgfs_create(ctx);
 
 	mutex_unlock(&dev->dev_mutex);
@@ -294,6 +295,7 @@ static int fops_vcodec_release(struct file *file)
 {
 	struct mtk_vcodec_dec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
+	unsigned long flags;
 
 	mtk_v4l2_vdec_dbg(0, ctx, "[%d] decoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
@@ -312,9 +314,9 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
 	mtk_vcodec_dbgfs_remove(dev, ctx->id);
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
@@ -407,7 +409,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	mutex_init(&dev->dev_mutex);
-	mutex_init(&dev->dev_ctx_lock);
+	spin_lock_init(&dev->dev_ctx_lock);
 	spin_lock_init(&dev->irqlock);
 
 	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index d047d7c580fb..9d68808e8f9c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -285,7 +285,7 @@ struct mtk_vcodec_dec_dev {
 	/* decoder hardware mutex lock */
 	struct mutex dec_mutex[MTK_VDEC_HW_MAX];
 	struct mutex dev_mutex;
-	struct mutex dev_ctx_lock;
+	spinlock_t dev_ctx_lock;
 	struct workqueue_struct *decode_workqueue;
 
 	spinlock_t irqlock;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 145958206e38..40b97f114cf6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -75,16 +75,17 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
 static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec_dev *dec_dev, struct vdec_vpu_inst *vpu)
 {
 	struct mtk_vcodec_dec_ctx *ctx;
+	unsigned long flags;
 	int ret = false;
 
-	mutex_lock(&dec_dev->dev_ctx_lock);
+	spin_lock_irqsave(&dec_dev->dev_ctx_lock, flags);
 	list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
 		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
 			ret = true;
 			break;
 		}
 	}
-	mutex_unlock(&dec_dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dec_dev->dev_ctx_lock, flags);
 
 	return ret;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index fb1c3bdc2dae..82b8ff38e8f1 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -117,6 +117,7 @@ static int fops_vcodec_open(struct file *file)
 	struct mtk_vcodec_enc_ctx *ctx = NULL;
 	int ret = 0;
 	struct vb2_queue *src_vq;
+	unsigned long flags;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -176,9 +177,9 @@ static int fops_vcodec_open(struct file *file)
 	mtk_v4l2_venc_dbg(2, ctx, "Create instance [%d]@%p m2m_ctx=%p ",
 			  ctx->id, ctx, ctx->m2m_ctx);
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_add(&ctx->list, &dev->ctx_list);
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 
 	mutex_unlock(&dev->dev_mutex);
 	mtk_v4l2_venc_dbg(0, ctx, "%s encoder [%d]", dev_name(&dev->plat_dev->dev),
@@ -203,6 +204,7 @@ static int fops_vcodec_release(struct file *file)
 {
 	struct mtk_vcodec_enc_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
+	unsigned long flags;
 
 	mtk_v4l2_venc_dbg(1, ctx, "[%d] encoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
@@ -213,9 +215,9 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
-	mutex_lock(&dev->dev_ctx_lock);
+	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
-	mutex_unlock(&dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
@@ -297,7 +299,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->enc_mutex);
 	mutex_init(&dev->dev_mutex);
-	mutex_init(&dev->dev_ctx_lock);
+	spin_lock_init(&dev->dev_ctx_lock);
 	spin_lock_init(&dev->irqlock);
 
 	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 5b304a551236..0cddfa13594f 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -206,7 +206,7 @@ struct mtk_vcodec_enc_dev {
 	/* encoder hardware mutex lock */
 	struct mutex enc_mutex;
 	struct mutex dev_mutex;
-	struct mutex dev_ctx_lock;
+	spinlock_t dev_ctx_lock;
 	struct workqueue_struct *encode_workqueue;
 
 	int enc_irq;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 51bb7ee141b9..3c229b1f6b21 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -45,16 +45,17 @@ static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
 static bool vpu_enc_check_ap_inst(struct mtk_vcodec_enc_dev *enc_dev, struct venc_vpu_inst *vpu)
 {
 	struct mtk_vcodec_enc_ctx *ctx;
+	unsigned long flags;
 	int ret = false;
 
-	mutex_lock(&enc_dev->dev_ctx_lock);
+	spin_lock_irqsave(&enc_dev->dev_ctx_lock, flags);
 	list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
 		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
 			ret = true;
 			break;
 		}
 	}
-	mutex_unlock(&enc_dev->dev_ctx_lock);
+	spin_unlock_irqrestore(&enc_dev->dev_ctx_lock, flags);
 
 	return ret;
 }
-- 
2.51.0.rc1.167.g924127e9c0-goog


