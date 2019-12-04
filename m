Return-Path: <SRS0=B6WE=Z2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CCCC43603
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 09:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830EA206DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 09:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPlB6phP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V3p6tbZn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830EA206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSCpXRABxiAI4U+LDurqF7Z9NKcgNPW0MQ9VP9vkFAU=; b=PPlB6phP963coJ
	7ZiyhySqv7edxJGz48oG/EtzI6g7n+rgLeeirOS88++ovl/pp5gttvqo7SDb7bbm4CDzdgxw55nJ4
	j/6kNDXubJlowQ+ySWLbNO4Nq4fWpt/v4PRkvTbn0HyuzpnsWwVyKwxddY5T603nBsrC1stBDH0Uq
	bY4kpSBrb2sIPQpO4PvNOCP5EnZ+uOE72oLQJJQfNO3/LDGt/D2VZQF3psHiqYSFllq3xiJmzpOkX
	PkAKEhxXzGdX4L0HQMGfr9BEdGCb+ON54guw23ppmXeE81e+ViQZ3urWth96cPhfwhiJjR+8lpQAS
	x298afv187kRxavi387w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icROH-0006yy-W4; Wed, 04 Dec 2019 09:56:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icRN0-0004Vq-5r; Wed, 04 Dec 2019 09:54:57 +0000
X-UUID: 94c2ac3c9b264ccc821bba5aeee318e0-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fnbc/IeVbFcpugPLfDfh55LQ8c78H4saUcZT17XFcDU=; 
 b=V3p6tbZnc2dIlaBASF/XoUzRXoA80x6/XeZunJbo2PWTgDHF6BPqR5s3HSo+sw9Jih5IM+qx68OIG+guZTvdRWK8/cvcguvXrYMzek0HfFGrOzBjyEC5t+BY5QTOiNJ1CtKsXFnAm/vFiIABuUsQyGfXMmKM5THgpT2K+W/PQT8=;
X-UUID: 94c2ac3c9b264ccc821bba5aeee318e0-20191204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 796381255; Wed, 04 Dec 2019 01:54:49 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 01:45:33 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 17:44:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 17:44:19 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v5 1/5] media: platform: Fix jpeg dec driver bug and improve
 code quality
Date: Wed, 4 Dec 2019 17:44:21 +0800
Message-ID: <20191204094424.2562-2-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191204094424.2562-1-xia.jiang@mediatek.com>
References: <20191204094424.2562-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_015454_286262_671B6846 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix v4l2-compliance test bug and improve code quality of jpeg decode
driver, because the jpeg encode driver will base on it.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---                                               
v5: Use clamp()to replace mtk_jpeg_bound_align_image() and round_up()
    to replace mtk_jpeg_align().
    Get correct compose value in mtk_jpeg_selection().
    Cancel spin lock and unlock operation in device run function.
    Change register offset hex numberals from upercase to lowercase.

v4: new add patch for v4l2-compliance test bug fix
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 74 +++++++------------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  7 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c |  6 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h |  5 --
 .../media/platform/mtk-jpeg/mtk_jpeg_reg.h    | 19 +++--
 5 files changed, 42 insertions(+), 69 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index ee802fc3bcdf..da3daa02e94a 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -157,25 +157,6 @@ static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
 	return NULL;
 }
 
-static void mtk_jpeg_bound_align_image(u32 *w, unsigned int wmin,
-				       unsigned int wmax, unsigned int walign,
-				       u32 *h, unsigned int hmin,
-				       unsigned int hmax, unsigned int halign)
-{
-	int width, height, w_step, h_step;
-
-	width = *w;
-	height = *h;
-	w_step = 1 << walign;
-	h_step = 1 << halign;
-
-	v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax, halign, 0);
-	if (*w < width && (*w + w_step) <= wmax)
-		*w += w_step;
-	if (*h < height && (*h + h_step) <= hmax)
-		*h += h_step;
-}
-
 static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 				       struct v4l2_format *f)
 {
@@ -209,7 +190,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 
 	if (ctx->state != MTK_JPEG_INIT) {
 		mtk_jpeg_adjust_fmt_mplane(ctx, f);
-		goto end;
+		return 0;
 	}
 
 	pix_mp->num_planes = fmt->colplanes;
@@ -218,45 +199,35 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
 		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[0];
 
-		mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
-					   MTK_JPEG_MAX_WIDTH, 0,
-					   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
-					   MTK_JPEG_MAX_HEIGHT, 0);
+		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
+				       MTK_JPEG_MAX_HEIGHT);
+		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
+				      MTK_JPEG_MAX_WIDTH);
 
 		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 		pfmt->bytesperline = 0;
 		/* Source size must be aligned to 128 */
-		pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
+		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
 		if (pfmt->sizeimage == 0)
 			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
-		goto end;
+		return 0;
 	}
 
 	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
-	mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
-				   MTK_JPEG_MAX_WIDTH, fmt->h_align,
-				   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
-				   MTK_JPEG_MAX_HEIGHT, fmt->v_align);
+	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
+			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
+	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
+			      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
 
 	for (i = 0; i < fmt->colplanes; i++) {
 		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[i];
 		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
 		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
 
-		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 		pfmt->bytesperline = stride;
 		pfmt->sizeimage = stride * h;
 	}
-end:
-	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "wxh:%ux%u\n",
-		 pix_mp->width, pix_mp->height);
-	for (i = 0; i < pix_mp->num_planes; i++) {
-		v4l2_dbg(2, debug, &jpeg->v4l2_dev,
-			 "plane[%d] bpl=%u, size=%u\n",
-			 i,
-			 pix_mp->plane_fmt[i].bytesperline,
-			 pix_mp->plane_fmt[i].sizeimage);
-	}
+
 	return 0;
 }
 
@@ -446,9 +417,9 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
 	switch (sub->type) {
 	case V4L2_EVENT_SOURCE_CHANGE:
 		return v4l2_src_change_event_subscribe(fh, sub);
-	default:
-		return -EINVAL;
 	}
+
+	return v4l2_ctrl_subscribe_event(fh, sub);
 }
 
 static int mtk_jpeg_g_selection(struct file *file, void *priv,
@@ -492,8 +463,8 @@ static int mtk_jpeg_s_selection(struct file *file, void *priv,
 	case V4L2_SEL_TGT_COMPOSE:
 		s->r.left = 0;
 		s->r.top = 0;
-		s->r.width = ctx->out_q.w;
-		s->r.height = ctx->out_q.h;
+		ctx->out_q.w = s->r.width;
+		ctx->out_q.h = s->r.height;
 		break;
 	default:
 		return -EINVAL;
@@ -571,6 +542,13 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
 	if (!q_data)
 		return -EINVAL;
 
+	if (*num_planes) {
+		for (i = 0; i < *num_planes; i++)
+			if (sizes[i] < q_data->sizeimage[i])
+				return -EINVAL;
+		return 0;
+	}
+
 	*num_planes = q_data->fmt->colplanes;
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		sizes[i] = q_data->sizeimage[i];
@@ -764,8 +742,8 @@ static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
 {
 	bs->str_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
 	bs->end_addr = bs->str_addr +
-			 mtk_jpeg_align(vb2_get_plane_payload(src_buf, 0), 16);
-	bs->size = mtk_jpeg_align(vb2_plane_size(src_buf, 0), 128);
+		       round_up(vb2_get_plane_payload(src_buf, 0), 16);
+	bs->size = round_up(vb2_plane_size(src_buf, 0), 128);
 }
 
 static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
@@ -829,13 +807,11 @@ static void mtk_jpeg_device_run(void *priv)
 	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
 		goto dec_end;
 
-	spin_lock_irqsave(&jpeg->hw_lock, flags);
 	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
 	mtk_jpeg_dec_set_config(jpeg->dec_reg_base,
 				&jpeg_src_buf->dec_param, &bs, &fb);
 
 	mtk_jpeg_dec_start(jpeg->dec_reg_base);
-	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
 	return;
 
 dec_end:
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 999bd1427809..d32a6fbaa311 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -15,6 +15,8 @@
 
 #define MTK_JPEG_NAME		"mtk-jpeg"
 
+#define MTK_JPEG_COMP_MAX		3
+
 #define MTK_JPEG_FMT_FLAG_DEC_OUTPUT	BIT(0)
 #define MTK_JPEG_FMT_FLAG_DEC_CAPTURE	BIT(1)
 
@@ -28,6 +30,9 @@
 
 #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
 
+/**
+ * enum mtk_jpeg_ctx_state - contex state of jpeg
+ */
 enum mtk_jpeg_ctx_state {
 	MTK_JPEG_INIT = 0,
 	MTK_JPEG_RUNNING,
@@ -107,9 +112,7 @@ struct mtk_jpeg_q_data {
  * @out_q:		source (output) queue information
  * @cap_q:		destination (capture) queue queue information
  * @fh:			V4L2 file handle
- * @dec_param		parameters for HW decoding
  * @state:		state of the context
- * @header_valid:	set if header has been parsed and valid
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
  * @quantization: enum v4l2_quantization, colorspace quantization
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
index ddf0dfa78e20..e2fc66f3770e 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
@@ -153,10 +153,10 @@ static int mtk_jpeg_calc_dst_size(struct mtk_jpeg_dec_param *param)
 				param->sampling_w[i];
 		/* output format is 420/422 */
 		param->comp_w[i] = padding_w >> brz_w[i];
-		param->comp_w[i] = mtk_jpeg_align(param->comp_w[i],
+		param->comp_w[i] = round_up(param->comp_w[i],
 						  MTK_JPEG_DCTSIZE);
-		param->img_stride[i] = i ? mtk_jpeg_align(param->comp_w[i], 16)
-					: mtk_jpeg_align(param->comp_w[i], 32);
+		param->img_stride[i] = i ? round_up(param->comp_w[i], 16)
+					: round_up(param->comp_w[i], 32);
 		ds_row_h[i] = (MTK_JPEG_DCTSIZE * param->sampling_h[i]);
 	}
 	param->dec_w = param->img_stride[0];
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
index 9c6584eaad99..7b0687f8f4b6 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
@@ -54,11 +54,6 @@ struct mtk_jpeg_dec_param {
 	u8 uv_brz_w;
 };
 
-static inline u32 mtk_jpeg_align(u32 val, u32 align)
-{
-	return (val + align - 1) & ~(align - 1);
-}
-
 struct mtk_jpeg_bs {
 	dma_addr_t	str_addr;
 	dma_addr_t	end_addr;
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
index 94db04e9cdb6..21ec8f96797f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
@@ -8,7 +8,6 @@
 #ifndef _MTK_JPEG_REG_H
 #define _MTK_JPEG_REG_H
 
-#define MTK_JPEG_COMP_MAX		3
 #define MTK_JPEG_BLOCK_MAX		10
 #define MTK_JPEG_DCTSIZE		8
 
@@ -20,29 +19,29 @@
 #define BIT_INQST_MASK_ALLIRQ		0x37
 
 #define JPGDEC_REG_RESET		0x0090
-#define JPGDEC_REG_BRZ_FACTOR		0x00F8
-#define JPGDEC_REG_DU_NUM		0x00FC
+#define JPGDEC_REG_BRZ_FACTOR		0x00f8
+#define JPGDEC_REG_DU_NUM		0x00fc
 #define JPGDEC_REG_DEST_ADDR0_Y		0x0140
 #define JPGDEC_REG_DEST_ADDR0_U		0x0144
 #define JPGDEC_REG_DEST_ADDR0_V		0x0148
-#define JPGDEC_REG_DEST_ADDR1_Y		0x014C
+#define JPGDEC_REG_DEST_ADDR1_Y		0x014c
 #define JPGDEC_REG_DEST_ADDR1_U		0x0150
 #define JPGDEC_REG_DEST_ADDR1_V		0x0154
 #define JPGDEC_REG_STRIDE_Y		0x0158
-#define JPGDEC_REG_STRIDE_UV		0x015C
+#define JPGDEC_REG_STRIDE_UV		0x015c
 #define JPGDEC_REG_IMG_STRIDE_Y		0x0160
 #define JPGDEC_REG_IMG_STRIDE_UV	0x0164
-#define JPGDEC_REG_WDMA_CTRL		0x016C
+#define JPGDEC_REG_WDMA_CTRL		0x016c
 #define JPGDEC_REG_PAUSE_MCU_NUM	0x0170
-#define JPGDEC_REG_OPERATION_MODE	0x017C
+#define JPGDEC_REG_OPERATION_MODE	0x017c
 #define JPGDEC_REG_FILE_ADDR		0x0200
-#define JPGDEC_REG_COMP_ID		0x020C
+#define JPGDEC_REG_COMP_ID		0x020c
 #define JPGDEC_REG_TOTAL_MCU_NUM	0x0210
 #define JPGDEC_REG_COMP0_DATA_UNIT_NUM	0x0224
-#define JPGDEC_REG_DU_CTRL		0x023C
+#define JPGDEC_REG_DU_CTRL		0x023c
 #define JPGDEC_REG_TRIG			0x0240
 #define JPGDEC_REG_FILE_BRP		0x0248
-#define JPGDEC_REG_FILE_TOTAL_SIZE	0x024C
+#define JPGDEC_REG_FILE_TOTAL_SIZE	0x024c
 #define JPGDEC_REG_QT_ID		0x0270
 #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
 #define JPGDEC_REG_STATUS		0x0278
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
