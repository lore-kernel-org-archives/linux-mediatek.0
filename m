Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829DDC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B1D60EFF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38B1D60EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAMUqGi5G0mSZ7JQibVhCkgiYkOURRXjupS5R3VrPs0=; b=z/7Lrip9Pax6nE
	dzSeitmbZmc7QReSbu9hmY2UH1zqkIPGNegbVF8f2fWqUSCWWsnhOxGve3PgU+jPgTts4yBx2xmlW
	ZyrnWE3kfovrVPOqlDeKXMHwuBZS0dokKSEFdz9At4j27ntH09c5RUB3tBUeCSwCNCtKEfqCvQLQp
	2IfjBPcWi833PrZFwrCO19s6sVgQ35Yuo9y/9qs2IBhyx1kM03NmqLGEcaDCg379BY/8K0bLaWi/2
	RObFNg7UgciSdbYXre8BZQHq2y38QmeMqE4EF38V06ntVwxxs8qIN7f6+ycx1oAjZARz4FwFcQxo7
	Gc9REmNuEIOEasWGpcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFaN7-00GoRX-VV; Mon, 16 Aug 2021 11:01:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFaMI-00Go3r-89; Mon, 16 Aug 2021 11:00:53 +0000
X-UUID: 4eecc51baed44858b64db9db75d16457-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fcuMhayIEbbGPPdM3o7uqL06T2WyTkL3hhTmJOnUjv0=; 
 b=YlAZdtf19k+bvGvhNk+fX5b9LwFahLN4tiLyFjelBjY5WpdAW6aiaLvWgeJk9TGWaK3+HZGbH9PegabrPejLRl6nmLIhmd+P497YpIPpnQuSaiGX/4V0aqDZmiSGhRtF7xvKgykfNbIw9y3lhqLYvKPNVoizTlJwm2kcFHCrmNQ=;
X-UUID: 4eecc51baed44858b64db9db75d16457-20210816
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 851819423; Mon, 16 Aug 2021 04:00:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 04:00:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 16 Aug 2021 19:00:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:38 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 7/9] media: mtk-vcodec: Add frame racing mode encode process
Date: Mon, 16 Aug 2021 18:59:32 +0800
Message-ID: <20210816105934.28265-8-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_040046_451201_631CF5BE 
X-CRM114-Status: GOOD (  21.56  )
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

The frame_racing mode encoding is try to use the two venc cores:
frame#0 use core#0, frame#1 use core#1, frame#2 use core#0...,

Lock the device and enabe the clock by used core, for sequence
header encoding, it always used core#0.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  5 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 35 ++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc.h      |  4 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  6 +-
 .../platform/mtk-vcodec/venc/venc_common_if.c |  6 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  6 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  2 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   | 85 ++++++++++++++-----
 .../media/platform/mtk-vcodec/venc_drv_if.h   |  4 +
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 11 ++-
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |  3 +-
 11 files changed, 118 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 1c6c1eca649f..7a9c2dd52b91 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -273,6 +273,7 @@ struct vdec_pic_info {
  * @decoded_frame_cnt: number of decoded frames
  * @lock: protect variables accessed by V4L2 threads and worker thread such as
  *	  mtk_video_dec_buf.
+ * @enc_idx: used to record encoded frame count
  */
 struct mtk_vcodec_ctx {
 	enum mtk_instance_type type;
@@ -313,6 +314,8 @@ struct mtk_vcodec_ctx {
 	int decoded_frame_cnt;
 	struct mutex lock;
 
+	int hw_id;
+	int enc_idx;
 };
 
 enum mtk_chip {
@@ -422,7 +425,7 @@ struct mtk_vcodec_dev {
 	int enc_irq;
 
 	struct mutex dec_mutex;
-	struct mutex enc_mutex;
+	struct mutex enc_mutex[MTK_VENC_HW_MAX];
 
 	struct mtk_vcodec_pm pm;
 	unsigned int dec_capability;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index d22f9c8fd063..6b37bd092fdf 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1090,21 +1090,26 @@ static void mtk_venc_worker(struct work_struct *work)
 	if (enc_result.is_key_frm)
 		dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
 
-	if (ret) {
-		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-		dst_buf->vb2_buf.planes[0].bytesused = 0;
-		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
-		mtk_v4l2_err("venc_if_encode failed=%d", ret);
-	} else {
-		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
-		dst_buf->vb2_buf.planes[0].bytesused = enc_result.bs_size;
-		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
-		mtk_v4l2_debug(2, "venc_if_encode bs size=%d",
-				 enc_result.bs_size);
+	if (ctx->dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE) {
+		if (ret) {
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			dst_buf->vb2_buf.planes[0].bytesused = 0;
+			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+			mtk_v4l2_err("venc_if_encode failed=%d", ret);
+		} else {
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+			dst_buf->vb2_buf.planes[0].bytesused =
+					enc_result.bs_size;
+			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+			mtk_v4l2_debug(2, "venc_if_encode bs size=%d",
+				       enc_result.bs_size);
+		}
 	}
 
 	v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m_ctx);
 
+	ctx->enc_idx++;
+
 	mtk_v4l2_debug(1, "<=== src_buf[%d] dst_buf[%d] venc_if_encode ret=%d Size=%u===>",
 			src_buf->vb2_buf.index, dst_buf->vb2_buf.index, ret,
 			enc_result.bs_size);
@@ -1305,19 +1310,19 @@ int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq,
 	return vb2_queue_init(dst_vq);
 }
 
-int mtk_venc_unlock(struct mtk_vcodec_ctx *ctx)
+int mtk_venc_unlock(struct mtk_vcodec_ctx *ctx, int core_id)
 {
 	struct mtk_vcodec_dev *dev = ctx->dev;
 
-	mutex_unlock(&dev->enc_mutex);
+	mutex_unlock(&dev->enc_mutex[core_id]);
 	return 0;
 }
 
-int mtk_venc_lock(struct mtk_vcodec_ctx *ctx)
+int mtk_venc_lock(struct mtk_vcodec_ctx *ctx, int core_id)
 {
 	struct mtk_vcodec_dev *dev = ctx->dev;
 
-	mutex_lock(&dev->enc_mutex);
+	mutex_lock(&dev->enc_mutex[core_id]);
 	return 0;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
index 30b6d7f22ed7..8d486f532025 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
@@ -41,8 +41,8 @@ struct mtk_video_enc_buf {
 extern const struct v4l2_ioctl_ops mtk_venc_ioctl_ops;
 extern const struct v4l2_m2m_ops mtk_venc_m2m_ops;
 
-int mtk_venc_unlock(struct mtk_vcodec_ctx *ctx);
-int mtk_venc_lock(struct mtk_vcodec_ctx *ctx);
+int mtk_venc_unlock(struct mtk_vcodec_ctx *ctx, int core_id);
+int mtk_venc_lock(struct mtk_vcodec_ctx *ctx, int core_id);
 int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq,
 			      struct vb2_queue *dst_vq);
 void mtk_vcodec_enc_release(struct mtk_vcodec_ctx *ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index b78435e8223a..ff1f05a5ca28 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -320,7 +320,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct resource *res;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
-	int ret;
+	int ret, i;
 	struct component_match *match = NULL;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -384,7 +384,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		}
 	}
 
-	mutex_init(&dev->enc_mutex);
+	for (i = 0; i < MTK_VENC_HW_MAX; i++)
+		mutex_init(&dev->enc_mutex[i]);
+
 	mutex_init(&dev->dev_mutex);
 	spin_lock_init(&dev->irqlock);
 
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
index 01b7d93241af..1580bd1beaac 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
@@ -300,7 +300,7 @@ static int venc_encode_sps(struct venc_common_inst *inst,
 	mtk_vcodec_debug_enter(inst);
 
 	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_SPS, NULL,
-			     bs_buf, bs_size, NULL);
+			     bs_buf, bs_size, NULL, MTK_VENC_CORE0);
 	if (ret)
 		return ret;
 
@@ -328,7 +328,7 @@ static int venc_encode_pps(struct venc_common_inst *inst,
 	mtk_vcodec_debug_enter(inst);
 
 	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_PPS, NULL,
-			     bs_buf, bs_size, NULL);
+			     bs_buf, bs_size, NULL, MTK_VENC_CORE0);
 	if (ret)
 		return ret;
 
@@ -386,7 +386,7 @@ static int venc_encode_frame(struct venc_common_inst *inst,
 			 frame_info.frm_count, frame_info.skip_frm_count,
 			 frame_info.frm_type);
 	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_FRAME, frm_buf,
-			     bs_buf, bs_size, &frame_info);
+			     bs_buf, bs_size, &frame_info, hw_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index b6a4f2074fa5..a90b06a3fe5a 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -368,7 +368,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
 	mtk_vcodec_debug_enter(inst);
 
 	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
-			     bs_buf, bs_size, NULL);
+			     bs_buf, bs_size, NULL, MTK_VENC_CORE0);
 	if (ret)
 		return ret;
 
@@ -395,7 +395,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
 	mtk_vcodec_debug_enter(inst);
 
 	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
-			     bs_buf, bs_size, NULL);
+			     bs_buf, bs_size, NULL, MTK_VENC_CORE0);
 	if (ret)
 		return ret;
 
@@ -452,7 +452,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
 			 frame_info.frm_count, frame_info.skip_frm_count,
 			 frame_info.frm_type);
 	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
-			     bs_buf, bs_size, &frame_info);
+			     bs_buf, bs_size, &frame_info, MTK_VENC_CORE0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 8267a9c4fd25..a68bf53d7d81 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -303,7 +303,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
 	mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
 
 	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
-			     NULL);
+			     NULL, MTK_VENC_CORE0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index 93936d002bed..09fcec05a655 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -15,6 +15,7 @@
 
 #include "mtk_vcodec_enc.h"
 #include "mtk_vcodec_enc_pm.h"
+#include "mtk_vcodec_enc_hw.h"
 
 int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
@@ -34,9 +35,9 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		return -EINVAL;
 	}
 
-	mtk_venc_lock(ctx);
+	mtk_venc_lock(ctx, 0);
 	ret = ctx->enc_if->init(ctx);
-	mtk_venc_unlock(ctx);
+	mtk_venc_unlock(ctx, 0);
 
 	return ret;
 }
@@ -46,9 +47,9 @@ int venc_if_set_param(struct mtk_vcodec_ctx *ctx,
 {
 	int ret = 0;
 
-	mtk_venc_lock(ctx);
+	mtk_venc_lock(ctx, 0);
 	ret = ctx->enc_if->set_param(ctx->drv_handle, type, in);
-	mtk_venc_unlock(ctx);
+	mtk_venc_unlock(ctx, 0);
 
 	return ret;
 }
@@ -59,24 +60,12 @@ int venc_if_encode(struct mtk_vcodec_ctx *ctx,
 		   struct venc_done_result *result)
 {
 	int ret = 0;
-	unsigned long flags;
-
-	mtk_venc_lock(ctx);
 
-	spin_lock_irqsave(&ctx->dev->irqlock, flags);
-	ctx->dev->curr_ctx = ctx;
-	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
-
-	mtk_vcodec_enc_clock_on(ctx->dev, 0);
+	venc_encode_prepare(ctx, opt);
 	ret = ctx->enc_if->encode(ctx->drv_handle, opt, frm_buf,
 				  bs_buf, result);
-	mtk_vcodec_enc_clock_off(ctx->dev, 0);
-
-	spin_lock_irqsave(&ctx->dev->irqlock, flags);
-	ctx->dev->curr_ctx = NULL;
-	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
+	venc_encode_unprepare(ctx, opt);
 
-	mtk_venc_unlock(ctx);
 	return ret;
 }
 
@@ -87,11 +76,67 @@ int venc_if_deinit(struct mtk_vcodec_ctx *ctx)
 	if (!ctx->drv_handle)
 		return 0;
 
-	mtk_venc_lock(ctx);
+	mtk_venc_lock(ctx, 0);
 	ret = ctx->enc_if->deinit(ctx->drv_handle);
-	mtk_venc_unlock(ctx);
+	mtk_venc_unlock(ctx, 0);
 
 	ctx->drv_handle = NULL;
 
 	return ret;
 }
+
+void venc_encode_prepare(struct mtk_vcodec_ctx *ctx,
+			 enum venc_start_opt opt)
+{
+	unsigned long flags;
+	struct mtk_venc_comp_dev *venc;
+
+	if (ctx->dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		if (ctx->enc_idx & 0x01)
+			ctx->hw_id = MTK_VENC_CORE1;
+		else
+			ctx->hw_id = MTK_VENC_CORE0;
+	} else {
+		ctx->hw_id = MTK_VENC_CORE0;
+	}
+	mtk_venc_lock(ctx, ctx->hw_id);
+
+	spin_lock_irqsave(&ctx->dev->irqlock, flags);
+
+	if (ctx->dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		venc = ctx->dev->enc_comp_dev[ctx->hw_id];
+
+		venc->curr_ctx = ctx;
+	} else {
+		ctx->dev->curr_ctx = ctx;
+	}
+
+	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
+
+	mtk_vcodec_enc_clock_on(ctx->dev, ctx->hw_id);
+}
+
+void venc_encode_unprepare(struct mtk_vcodec_ctx *ctx,
+			   enum venc_start_opt opt)
+{
+	unsigned long flags;
+	struct mtk_venc_comp_dev *venc;
+
+	/*clock off and unlock after irq done*/
+	if (ctx->dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		if (opt == VENC_START_OPT_ENCODE_SEQUENCE_HEADER) {
+			mtk_vcodec_enc_clock_off(ctx->dev, ctx->hw_id);
+			spin_lock_irqsave(&ctx->dev->irqlock, flags);
+			venc = ctx->dev->enc_comp_dev[ctx->hw_id];
+			venc->curr_ctx = NULL;
+			spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
+			mtk_venc_unlock(ctx, ctx->hw_id);
+		}
+	} else {
+		mtk_vcodec_enc_clock_off(ctx->dev, ctx->hw_id);
+		spin_lock_irqsave(&ctx->dev->irqlock, flags);
+		ctx->dev->curr_ctx = NULL;
+		spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
+		mtk_venc_unlock(ctx, ctx->hw_id);
+	}
+}
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.h b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
index 8f384ba24ddf..7bd1f437d8e3 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.h
@@ -168,4 +168,8 @@ int venc_if_encode(struct mtk_vcodec_ctx *ctx,
 		   struct mtk_vcodec_mem *bs_buf,
 		   struct venc_done_result *result);
 
+void venc_encode_prepare(struct mtk_vcodec_ctx *ctx,
+			 enum venc_start_opt opt);
+void venc_encode_unprepare(struct mtk_vcodec_ctx *ctx,
+			   enum venc_start_opt opt);
 #endif /* _VENC_DRV_IF_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index be6d8790a41e..5bee5f1828f1 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -226,9 +226,12 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 		   struct venc_frm_buf *frm_buf,
 		   struct mtk_vcodec_mem *bs_buf,
 		   unsigned int *bs_size,
-		   struct venc_frame_info *frame_info)
+		   struct venc_frame_info *frame_info,
+		   int hw_id)
 {
 	const bool is_ext = MTK_ENC_CTX_IS_EXT(vpu->ctx);
+	const int hw_mode = MTK_ENC_HW_MODE(vpu->ctx);
+
 	size_t msg_size = is_ext ?
 		sizeof(struct venc_ap_ipi_msg_enc_ext) :
 		sizeof(struct venc_ap_ipi_msg_enc);
@@ -262,6 +265,12 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 		out.data[1] = frame_info->skip_frm_count;
 		out.data[2] = frame_info->frm_type;
 	}
+
+	if (hw_mode == VENC_FRAME_RACING_MODE) {
+		out.data_item = 4;
+		out.data[3] = hw_id;
+	}
+
 	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
 		mtk_vcodec_err(vpu, "AP_IPIMSG_ENC_ENCODE %d fail",
 			       bs_mode);
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
index f9be9cab7ff7..e55656781f6e 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
@@ -46,7 +46,8 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 		   struct venc_frm_buf *frm_buf,
 		   struct mtk_vcodec_mem *bs_buf,
 		   unsigned int *bs_size,
-		   struct venc_frame_info *frame_info);
+		   struct venc_frame_info *frame_info,
+		   int hw_id);
 int vpu_enc_deinit(struct venc_vpu_inst *vpu);
 
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
