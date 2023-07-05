Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F2DC00528
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb0FeHbTl82g9gvGdYG9nkMcIOCXB96+x5Y3VRSW9ck=; b=bGmbE8C7LtyM7W+deOwKoCOyG/
	zU4Nm5v+Td6L/12eHJAymhGM9nnzv7w/OmrY+D6YKAIS51LaYXnQqlzbIYEYUk8u1VMZEXEJAClg9
	KcdifwsezawM/COGWcL+jxhYLNq+wzKFE1F9TmWGJGHUgHwCrIpSQ9G0xvDJnFNc6YvQQ5RoQLyBs
	fcDabplS9u0cahOrW9K2k3Lph+qGHa/L6Wi5tfM2VGdZSsS4JVZmevzB7HNU6Ct3OZpxqYytgXLSh
	5cvHVt+ku2LokpZzsuu/KaKXe00imi3Q+ryAMHm65PFggk0pp6wyIU0XEx3VeOs+aBKu5814S12e7
	V9el0suA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1Lt-00Fpca-2A;
	Wed, 05 Jul 2023 12:11:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1Lj-00FpSV-0V;
	Wed, 05 Jul 2023 12:11:15 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:cbfb:e358:222c:d8c1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4EDCA6606FBA;
	Wed,  5 Jul 2023 13:11:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688559065;
	bh=/7DVclLTrBQzDYE1VjnNUTPJoyWcBdPfrc2tItSEaPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mn3LpKZYxlKyQBB3N2c5v26i0eEPM8P1D7FJnhnJbntqqmR/Hk/huWldbG7ZXL9A2
	 4Ovj40KnPUtrfjFxdd0sgXM9YPobNljguC0fM4a4gWw1LdLcIBKeerQxNqEMk+4+vS
	 O6oXa9FVUzUYCXAYz+izaDPZQ1MYhvIA2h8jbxvHUdGFUIRH/sNUAQ5J741lYd35UQ
	 Oj7d2QHBNDe0ksuLoCyh6+GfjqQRHVfC+VNfWQvZ2eU6wieeENk/2Yi2Kn7pqOX5oY
	 cj0tWk+vd2Vs03Lj2dAVO6SxvcccYlCnrdL4WBnxwXcL+1r7LpbJrzyjRcwFgAphBC
	 lbY+JjSfZlcgQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 04/10] media: verisilicon: Refactor postprocessor to store more buffers
Date: Wed,  5 Jul 2023 14:10:50 +0200
Message-Id: <20230705121056.37017-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
References: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_051111_501355_1A89BEB0 
X-CRM114-Status: GOOD (  22.33  )
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

Since vb2 queue can store than VB2_MAX_FRAME buffers postprocessor
buffer storage must be capable to store more buffers too.
Change static dec_q array to allocated array to be capable to store
up to queue 'max_allowed_buffers'.
Keep allocating queue 'num_buffers' at queue setup time but also allows
to allocate postprocessors buffers on the fly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h   |   7 +-
 .../media/platform/verisilicon/hantro_drv.c   |   4 +-
 .../media/platform/verisilicon/hantro_hw.h    |   2 +-
 .../platform/verisilicon/hantro_postproc.c    | 103 ++++++++++++++----
 .../media/platform/verisilicon/hantro_v4l2.c  |   2 +-
 5 files changed, 93 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 2989ebc631cc..c8a3cf10cc64 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -461,11 +461,14 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 bool hantro_needs_postproc(const struct hantro_ctx *ctx,
 			   const struct hantro_fmt *fmt);
 
+dma_addr_t
+hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index);
+
 static inline dma_addr_t
 hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
 {
 	if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
-		return ctx->postproc.dec_q[vb->index].dma;
+		return hantro_postproc_get_dec_buf_addr(ctx, vb->index);
 	return vb2_dma_contig_plane_dma_addr(vb, 0);
 }
 
@@ -477,8 +480,8 @@ vb2_to_hantro_decoded_buf(struct vb2_buffer *buf)
 
 void hantro_postproc_disable(struct hantro_ctx *ctx);
 void hantro_postproc_enable(struct hantro_ctx *ctx);
+int hantro_postproc_init(struct hantro_ctx *ctx);
 void hantro_postproc_free(struct hantro_ctx *ctx);
-int hantro_postproc_alloc(struct hantro_ctx *ctx);
 int hanto_postproc_enum_framesizes(struct hantro_ctx *ctx,
 				   struct v4l2_frmsizeenum *fsize);
 
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 09c74a573ddb..d908559817ce 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -234,8 +234,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	 * The Kernel needs access to the JPEG destination buffer for the
 	 * JPEG encoder to fill in the JPEG headers.
 	 */
-	if (!ctx->is_encoder)
+	if (!ctx->is_encoder) {
 		dst_vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
+		dst_vq->max_allowed_buffers = 64;
+	}
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index e83f0c523a30..6fd6c9d53cec 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -253,7 +253,7 @@ struct hantro_vp9_dec_hw_ctx {
  * @dec_q:		References buffers, in decoder format.
  */
 struct hantro_postproc_ctx {
-	struct hantro_aux_buf dec_q[VB2_MAX_FRAME];
+	struct hantro_aux_buf *dec_q;
 };
 
 /**
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 6437423ccf3a..9dfe3141a398 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -173,9 +173,11 @@ static int hantro_postproc_g2_enum_framesizes(struct hantro_ctx *ctx,
 void hantro_postproc_free(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_queue *queue = &m2m_ctx->cap_q_ctx.q;
 	unsigned int i;
 
-	for (i = 0; i < VB2_MAX_FRAME; ++i) {
+	for (i = 0; i < queue->max_allowed_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
 
 		if (priv->cpu) {
@@ -184,22 +186,21 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
 			priv->cpu = NULL;
 		}
 	}
+	kfree(ctx->postproc.dec_q);
+	ctx->postproc.dec_q = NULL;
 }
 
-int hantro_postproc_alloc(struct hantro_ctx *ctx)
+static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
-	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
-	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
-	unsigned int num_buffers = cap_queue->num_buffers;
 	struct v4l2_pix_format_mplane pix_mp;
 	const struct hantro_fmt *fmt;
-	unsigned int i, buf_size;
+	unsigned int buf_size;
 
 	/* this should always pick native format */
 	fmt = hantro_get_default_fmt(ctx, false, ctx->bit_depth);
 	if (!fmt)
-		return -EINVAL;
+		return 0;
+
 	v4l2_fill_pixfmt_mp(&pix_mp, fmt->fourcc, ctx->src_fmt.width,
 			    ctx->src_fmt.height);
 
@@ -214,23 +215,85 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
 		buf_size += hantro_hevc_mv_size(pix_mp.width,
 						pix_mp.height);
 
-	for (i = 0; i < num_buffers; ++i) {
-		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
+	return buf_size;
+}
+
+static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
+	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
+
+	if (!buf_size)
+		return -EINVAL;
+
+	/*
+	 * The buffers on this queue are meant as intermediate
+	 * buffers for the decoder, so no mapping is needed.
+	 */
+	priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
+				    GFP_KERNEL, priv->attrs);
+	if (!priv->cpu)
+		return -ENOMEM;
+	priv->size = buf_size;
+
+	return 0;
+}
+
+int hantro_postproc_init(struct hantro_ctx *ctx)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
+	unsigned int num_buffers = cap_queue->num_buffers;
+	unsigned int i;
+	int ret;
 
-		/*
-		 * The buffers on this queue are meant as intermediate
-		 * buffers for the decoder, so no mapping is needed.
-		 */
-		priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
-		priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
-					    GFP_KERNEL, priv->attrs);
-		if (!priv->cpu)
-			return -ENOMEM;
-		priv->size = buf_size;
+	if (!ctx->postproc.dec_q)
+		ctx->postproc.dec_q = kcalloc(cap_queue->max_allowed_buffers,
+					      sizeof(*ctx->postproc.dec_q),
+					      GFP_KERNEL);
+
+	if (!ctx->postproc.dec_q)
+		return -EINVAL;
+
+	for (i = 0; i < num_buffers; i++) {
+		ret = hantro_postproc_alloc(ctx, i);
+		if (ret)
+			return ret;
 	}
+
 	return 0;
 }
 
+dma_addr_t
+hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index)
+{
+	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
+	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
+	struct hantro_dev *vpu = ctx->dev;
+	int ret;
+
+	if (priv->size < buf_size && priv->cpu) {
+		/* buffer is too small, release it */
+		dma_free_attrs(vpu->dev, priv->size, priv->cpu,
+			       priv->dma, priv->attrs);
+		priv->cpu = NULL;
+	}
+
+	if (!priv->cpu) {
+		/* buffer not already allocated, try getting a new one */
+		ret = hantro_postproc_alloc(ctx, index);
+		if (ret)
+			return 0;
+	}
+
+	if (!priv->cpu)
+		return 0;
+
+	return priv->dma;
+}
+
 static void hantro_postproc_g1_disable(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 61cfaaf4e927..898e8763d63a 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -897,7 +897,7 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 		}
 
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt)) {
-			ret = hantro_postproc_alloc(ctx);
+			ret = hantro_postproc_init(ctx);
 			if (ret)
 				goto err_codec_exit;
 		}
-- 
2.39.2


