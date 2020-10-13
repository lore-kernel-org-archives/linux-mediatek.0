Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2453FC43457
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:44:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC5BE224DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4OsB2zD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="namv7hM2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC5BE224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SxuzbevJZaxlWioJw8EQPgxz5zRWWAZ4eCMyaQhza24=; b=n4OsB2zDE7FXhotJiHuaVkhX4
	R/LL5H7V+IfX87fL/8to9TF5THOkFBz6rxSD6HbP2TrcnL6HVVmVhkOhsCByv9daSWAL20lbtrKET
	OrNyMEQDSQFWxqi+5xck2ap8Eq473UQyOWk28O1uX6I61/rFA99tYIWlzbAphB9mQEWnucI5H37tg
	XFf/xPgAZMWEhHuQFWhUhe3glew2TVzBnR/IuF/tNDnQ3n2uQ/xHspr9r1SKCqs5UlVnHJJgJk4UO
	/XKMqm/MK4p8Hsyvwg2m80rNG0p8WXo3KkpvO0cxh78nie1ouoxAqW///hDssf/xzmB5i4aUDg3y6
	0wzw0A92g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSJfa-0007UE-NH; Tue, 13 Oct 2020 12:44:46 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSJfY-0007Sr-6p
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 12:44:45 +0000
Received: by mail-pj1-x1043.google.com with SMTP id p21so2095525pju.0
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 05:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tI9og2Mp3SvB/KIpM56bpbcWr59ULpoa9Os216f3JV0=;
 b=namv7hM2qX01p7pSVLVigshcmygAVma6KdSlv7b3MnVFtx05UOh3CHmCQeZriDzTnQ
 wVQ9qGrVMf/fkAp/Xcc2ZTEOqitbUztrR++k7ZeqMP1I8ZDedrv2ctaroVotc5zLD9Yj
 o8GiXTWaB6nckvOdz0X/JK5g8ctnfjo6Jba6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tI9og2Mp3SvB/KIpM56bpbcWr59ULpoa9Os216f3JV0=;
 b=QgS4eU19+HnlMUb8YeEVdH/def6YmIsSllpyIetglPfmqlPt0PPZ9k2CFFcKojB1+7
 UrlQ4RDEEFatMNnzc4E24T0EPbqibM0WjOvxs/9O5l2/cFLQ1x0IuRX8izICPndciNak
 Hsce8o94vWizHlqmQROV2hECrQ9f3E4O6lWAd6dRqU5SuJEjaQFeu//NfhEjUm7VilIK
 t9HGWkkdx3DcsL2nyv3J3pDe4wIx05bY/ciPMQiIURTNQglOT0Y8x9PTdAXVeXdcYMSc
 /cVxfWc8Yx+E15u2EeeIUy7hUeE9yN0KN14CKYBkO558aXA09WfwJvCAe6RPzkm7v9Al
 JNgg==
X-Gm-Message-State: AOAM530uZCYcbWjFIh41zdsbPCcSZCNAZ7aWpBsvI9bovxCPkt+8fgnO
 afmkb1Kr/PzbaWq99RSk/wPdiQ==
X-Google-Smtp-Source: ABdhPJyvAFvA4FZovSEnBAa4U4tIeAwOcgqT0/xB3z4J//fyGanoVqHLlyPaPtOUY8w8nLoEbzjGOA==
X-Received: by 2002:a17:902:9a84:b029:d2:9390:5e6 with SMTP id
 w4-20020a1709029a84b02900d2939005e6mr28510417plp.37.1602593081790; 
 Tue, 13 Oct 2020 05:44:41 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id b20sm18914536pjo.37.2020.10.13.05.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:44:41 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v4 1/2] media: mtk-vcodec: move firmware implementations into
 their own files
Date: Tue, 13 Oct 2020 21:44:27 +0900
Message-Id: <20201013124428.783025-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201013124428.783025-1-acourbot@chromium.org>
References: <20201013124428.783025-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_084444_336206_FEB3033E 
X-CRM114-Status: GOOD (  25.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk-vcodec supports two kinds of firmware, VPU and SCP. Both were
supported from the same source files, but this is clearly unclean and
makes it more difficult to disable support for one or the other.

Move these implementations into their own file, after adding the
necessary private interfaces.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   2 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 174 +-----------------
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  |  34 ++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_scp.c   |  73 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   | 109 +++++++++++
 8 files changed, 232 insertions(+), 173 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index f679c6e1a3e9..6e1ea3a9f052 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -24,4 +24,6 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 
 mtk-vcodec-common-y := mtk_vcodec_intr.o \
 		mtk_vcodec_util.o \
-		mtk_vcodec_fw.o
+		mtk_vcodec_fw.o \
+		mtk_vcodec_fw_vpu.o \
+		mtk_vcodec_fw_scp.o
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index d14bc208ea5e..145686d2c219 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -241,7 +241,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
-	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, VPU_RST_DEC);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, DECODER);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index dcfa2c2d4def..3be8a04c4c67 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -293,7 +293,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
-	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, VPU_RST_ENC);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, ENCODER);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
index 6c2a2568d844..94b39ae5c2e1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
@@ -1,193 +1,29 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include "mtk_vcodec_fw.h"
+#include "mtk_vcodec_fw_priv.h"
 #include "mtk_vcodec_util.h"
 #include "mtk_vcodec_drv.h"
 
-struct mtk_vcodec_fw_ops {
-	int (*load_firmware)(struct mtk_vcodec_fw *fw);
-	unsigned int (*get_vdec_capa)(struct mtk_vcodec_fw *fw);
-	unsigned int (*get_venc_capa)(struct mtk_vcodec_fw *fw);
-	void * (*map_dm_addr)(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr);
-	int (*ipi_register)(struct mtk_vcodec_fw *fw, int id,
-			    mtk_vcodec_ipi_handler handler, const char *name, void *priv);
-	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
-			unsigned int len, unsigned int wait);
-};
-
-struct mtk_vcodec_fw {
-	enum mtk_vcodec_fw_type type;
-	const struct mtk_vcodec_fw_ops *ops;
-	struct platform_device *pdev;
-	struct mtk_scp *scp;
-};
-
-static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
-{
-	return vpu_load_firmware(fw->pdev);
-}
-
-static unsigned int mtk_vcodec_vpu_get_vdec_capa(struct mtk_vcodec_fw *fw)
-{
-	return vpu_get_vdec_hw_capa(fw->pdev);
-}
-
-static unsigned int mtk_vcodec_vpu_get_venc_capa(struct mtk_vcodec_fw *fw)
-{
-	return vpu_get_venc_hw_capa(fw->pdev);
-}
-
-static void *mtk_vcodec_vpu_map_dm_addr(struct mtk_vcodec_fw *fw,
-					u32 dtcm_dmem_addr)
-{
-	return vpu_mapping_dm_addr(fw->pdev, dtcm_dmem_addr);
-}
-
-static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
-					   mtk_vcodec_ipi_handler handler,
-					   const char *name, void *priv)
-{
-	/*
-	 * The handler we receive takes a void * as its first argument. We
-	 * cannot change this because it needs to be passed down to the rproc
-	 * subsystem when SCP is used. VPU takes a const argument, which is
-	 * more constrained, so the conversion below is safe.
-	 */
-	ipi_handler_t handler_const = (ipi_handler_t)handler;
-
-	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
-}
-
-static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
-				   unsigned int len, unsigned int wait)
-{
-	return vpu_ipi_send(fw->pdev, id, buf, len);
-}
-
-static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
-	.load_firmware = mtk_vcodec_vpu_load_firmware,
-	.get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
-	.get_venc_capa = mtk_vcodec_vpu_get_venc_capa,
-	.map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
-	.ipi_register = mtk_vcodec_vpu_set_ipi_register,
-	.ipi_send = mtk_vcodec_vpu_ipi_send,
-};
-
-static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
-{
-	return rproc_boot(scp_get_rproc(fw->scp));
-}
-
-static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
-{
-	return scp_get_vdec_hw_capa(fw->scp);
-}
-
-static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
-{
-	return scp_get_venc_hw_capa(fw->scp);
-}
-
-static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
-					u32 dtcm_dmem_addr)
-{
-	return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
-}
-
-static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
-					   mtk_vcodec_ipi_handler handler,
-					   const char *name, void *priv)
-{
-	return scp_ipi_register(fw->scp, id, handler, priv);
-}
-
-static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
-				   unsigned int len, unsigned int wait)
-{
-	return scp_ipi_send(fw->scp, id, buf, len, wait);
-}
-
-static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
-	.load_firmware = mtk_vcodec_scp_load_firmware,
-	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
-	.get_venc_capa = mtk_vcodec_scp_get_venc_capa,
-	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
-	.ipi_register = mtk_vcodec_scp_set_ipi_register,
-	.ipi_send = mtk_vcodec_scp_ipi_send,
-};
-
-static void mtk_vcodec_reset_handler(void *priv)
-{
-	struct mtk_vcodec_dev *dev = priv;
-	struct mtk_vcodec_ctx *ctx;
-
-	mtk_v4l2_err("Watchdog timeout!!");
-
-	mutex_lock(&dev->dev_mutex);
-	list_for_each_entry(ctx, &dev->ctx_list, list) {
-		ctx->state = MTK_STATE_ABORT;
-		mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
-			       ctx->id);
-	}
-	mutex_unlock(&dev->dev_mutex);
-}
-
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 					   enum mtk_vcodec_fw_type type,
-					   enum rst_id rst_id)
+					   enum mtk_vcodec_fw_use fw_use)
 {
-	const struct mtk_vcodec_fw_ops *ops;
-	struct mtk_vcodec_fw *fw;
-	struct platform_device *fw_pdev = NULL;
-	struct mtk_scp *scp = NULL;
-
 	switch (type) {
 	case VPU:
-		ops = &mtk_vcodec_vpu_msg;
-		fw_pdev = vpu_get_plat_device(dev->plat_dev);
-		if (!fw_pdev) {
-			mtk_v4l2_err("firmware device is not ready");
-			return ERR_PTR(-EINVAL);
-		}
-		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_reset_handler,
-				    dev, rst_id);
-		break;
+		return mtk_vcodec_fw_vpu_init(dev, fw_use);
 	case SCP:
-		ops = &mtk_vcodec_rproc_msg;
-		scp = scp_get(dev->plat_dev);
-		if (!scp) {
-			mtk_v4l2_err("could not get vdec scp handle");
-			return ERR_PTR(-EPROBE_DEFER);
-		}
-		break;
+		return mtk_vcodec_fw_scp_init(dev);
 	default:
 		mtk_v4l2_err("invalid vcodec fw type");
 		return ERR_PTR(-EINVAL);
 	}
-
-	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
-		return ERR_PTR(-EINVAL);
-
-	fw->type = type;
-	fw->ops = ops;
-	fw->pdev = fw_pdev;
-	fw->scp = scp;
-
-	return fw;
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_select);
 
 void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw)
 {
-	switch (fw->type) {
-	case VPU:
-		put_device(&fw->pdev->dev);
-		break;
-	case SCP:
-		scp_put(fw->scp);
-		break;
-	}
+	fw->ops->release(fw);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_fw_release);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
index fadbbe6ba6cd..539bb626772c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
@@ -15,6 +15,11 @@ enum mtk_vcodec_fw_type {
 	SCP,
 };
 
+enum mtk_vcodec_fw_use {
+	DECODER,
+	ENCODER,
+};
+
 struct mtk_vcodec_fw;
 
 typedef void (*mtk_vcodec_ipi_handler) (void *data,
@@ -22,7 +27,7 @@ typedef void (*mtk_vcodec_ipi_handler) (void *data,
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(struct mtk_vcodec_dev *dev,
 					   enum mtk_vcodec_fw_type type,
-					   enum rst_id rst_id);
+					   enum mtk_vcodec_fw_use fw_use);
 void mtk_vcodec_fw_release(struct mtk_vcodec_fw *fw);
 
 int mtk_vcodec_fw_load_firmware(struct mtk_vcodec_fw *fw);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
new file mode 100644
index 000000000000..51f1694a7c7d
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _MTK_VCODEC_FW_PRIV_H_
+#define _MTK_VCODEC_FW_PRIV_H_
+
+#include "mtk_vcodec_fw.h"
+
+struct mtk_vcodec_dev;
+
+struct mtk_vcodec_fw {
+	enum mtk_vcodec_fw_type type;
+	const struct mtk_vcodec_fw_ops *ops;
+	struct platform_device *pdev;
+	struct mtk_scp *scp;
+};
+
+struct mtk_vcodec_fw_ops {
+	int (*load_firmware)(struct mtk_vcodec_fw *fw);
+	unsigned int (*get_vdec_capa)(struct mtk_vcodec_fw *fw);
+	unsigned int (*get_venc_capa)(struct mtk_vcodec_fw *fw);
+	void *(*map_dm_addr)(struct mtk_vcodec_fw *fw, u32 dtcm_dmem_addr);
+	int (*ipi_register)(struct mtk_vcodec_fw *fw, int id,
+			    mtk_vcodec_ipi_handler handler, const char *name,
+			    void *priv);
+	int (*ipi_send)(struct mtk_vcodec_fw *fw, int id, void *buf,
+			unsigned int len, unsigned int wait);
+	void (*release)(struct mtk_vcodec_fw *fw);
+};
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
+					     enum mtk_vcodec_fw_use fw_use);
+struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev);
+
+#endif /* _MTK_VCODEC_FW_PRIV_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
new file mode 100644
index 000000000000..d8e66b645bd8
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_util.h"
+#include "mtk_vcodec_drv.h"
+
+static int mtk_vcodec_scp_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	return rproc_boot(scp_get_rproc(fw->scp));
+}
+
+static unsigned int mtk_vcodec_scp_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return scp_get_vdec_hw_capa(fw->scp);
+}
+
+static unsigned int mtk_vcodec_scp_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return scp_get_venc_hw_capa(fw->scp);
+}
+
+static void *mtk_vcodec_vpu_scp_dm_addr(struct mtk_vcodec_fw *fw,
+					u32 dtcm_dmem_addr)
+{
+	return scp_mapping_dm_addr(fw->scp, dtcm_dmem_addr);
+}
+
+static int mtk_vcodec_scp_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
+					   mtk_vcodec_ipi_handler handler,
+					   const char *name, void *priv)
+{
+	return scp_ipi_register(fw->scp, id, handler, priv);
+}
+
+static int mtk_vcodec_scp_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+				   unsigned int len, unsigned int wait)
+{
+	return scp_ipi_send(fw->scp, id, buf, len, wait);
+}
+
+static void mtk_vcodec_scp_release(struct mtk_vcodec_fw *fw)
+{
+	scp_put(fw->scp);
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_rproc_msg = {
+	.load_firmware = mtk_vcodec_scp_load_firmware,
+	.get_vdec_capa = mtk_vcodec_scp_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_scp_get_venc_capa,
+	.map_dm_addr = mtk_vcodec_vpu_scp_dm_addr,
+	.ipi_register = mtk_vcodec_scp_set_ipi_register,
+	.ipi_send = mtk_vcodec_scp_ipi_send,
+	.release = mtk_vcodec_scp_release,
+};
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
+{
+	struct mtk_vcodec_fw *fw;
+	struct mtk_scp *scp;
+
+	scp = scp_get(dev->plat_dev);
+	if (!scp) {
+		mtk_v4l2_err("could not get vdec scp handle");
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	fw->type = SCP;
+	fw->ops = &mtk_vcodec_rproc_msg;
+	fw->scp = scp;
+
+	return fw;
+}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
new file mode 100644
index 000000000000..4cd512101542
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "mtk_vcodec_fw_priv.h"
+#include "mtk_vcodec_util.h"
+#include "mtk_vcodec_drv.h"
+
+static int mtk_vcodec_vpu_load_firmware(struct mtk_vcodec_fw *fw)
+{
+	return vpu_load_firmware(fw->pdev);
+}
+
+static unsigned int mtk_vcodec_vpu_get_vdec_capa(struct mtk_vcodec_fw *fw)
+{
+	return vpu_get_vdec_hw_capa(fw->pdev);
+}
+
+static unsigned int mtk_vcodec_vpu_get_venc_capa(struct mtk_vcodec_fw *fw)
+{
+	return vpu_get_venc_hw_capa(fw->pdev);
+}
+
+static void *mtk_vcodec_vpu_map_dm_addr(struct mtk_vcodec_fw *fw,
+					u32 dtcm_dmem_addr)
+{
+	return vpu_mapping_dm_addr(fw->pdev, dtcm_dmem_addr);
+}
+
+static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
+					   mtk_vcodec_ipi_handler handler,
+					   const char *name, void *priv)
+{
+	/*
+	 * The handler we receive takes a void * as its first argument. We
+	 * cannot change this because it needs to be passed down to the rproc
+	 * subsystem when SCP is used. VPU takes a const argument, which is
+	 * more constrained, so the conversion below is safe.
+	 */
+	ipi_handler_t handler_const = (ipi_handler_t)handler;
+
+	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
+}
+
+static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
+				   unsigned int len, unsigned int wait)
+{
+	return vpu_ipi_send(fw->pdev, id, buf, len);
+}
+
+static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
+{
+	put_device(&fw->pdev->dev);
+}
+
+static void mtk_vcodec_vpu_reset_handler(void *priv)
+{
+	struct mtk_vcodec_dev *dev = priv;
+	struct mtk_vcodec_ctx *ctx;
+
+	mtk_v4l2_err("Watchdog timeout!!");
+
+	mutex_lock(&dev->dev_mutex);
+	list_for_each_entry(ctx, &dev->ctx_list, list) {
+		ctx->state = MTK_STATE_ABORT;
+		mtk_v4l2_debug(0, "[%d] Change to state MTK_STATE_ABORT",
+			       ctx->id);
+	}
+	mutex_unlock(&dev->dev_mutex);
+}
+
+static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
+	.load_firmware = mtk_vcodec_vpu_load_firmware,
+	.get_vdec_capa = mtk_vcodec_vpu_get_vdec_capa,
+	.get_venc_capa = mtk_vcodec_vpu_get_venc_capa,
+	.map_dm_addr = mtk_vcodec_vpu_map_dm_addr,
+	.ipi_register = mtk_vcodec_vpu_set_ipi_register,
+	.ipi_send = mtk_vcodec_vpu_ipi_send,
+	.release = mtk_vcodec_vpu_release,
+};
+
+struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
+					     enum mtk_vcodec_fw_use fw_use)
+{
+	struct platform_device *fw_pdev;
+	struct mtk_vcodec_fw *fw;
+	enum rst_id rst_id;
+
+	switch (fw_use) {
+	case ENCODER:
+		rst_id = VPU_RST_ENC;
+		break;
+	case DECODER:
+		rst_id = VPU_RST_DEC;
+		break;
+	}
+
+	fw_pdev = vpu_get_plat_device(dev->plat_dev);
+	if (!fw_pdev) {
+		mtk_v4l2_err("firmware device is not ready");
+		return ERR_PTR(-EINVAL);
+	}
+	vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler, dev, rst_id);
+
+	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	fw->type = VPU;
+	fw->ops = &mtk_vcodec_vpu_msg;
+	fw->pdev = fw_pdev;
+
+	return fw;
+}
-- 
2.29.0.rc1.297.gfa9743e501-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
