Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A4CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhUTBTuVB8DZb6aUBl+O3Vq+VnVbuBGByiqQ4Uv5WSQ=; b=1vO7A//exRXA+4MR1rI+CNwXTp
	qQbHJWI3Xu2Dr2oxCiErHStAKeT1eNAyxPVxFwKS2+7N/DXtxOYLr5owKuw7HbVmuwyzop4Nh/yQ/
	SyvGrWZyUJFziOzqcF3Q0k3bKhV42AanQzmB5Akon8aGPndJ25np5y+OD78HR97ZzKcgzYHhEQKif
	87lYQCsINjb+VuwWy3Fj7VUAX9oxIt5SwKeZXnsOWWEp5pynfm+upmNNvgTCqhl2PAe82up8sRLGm
	cAfJQaPuptXxQlkhvS4gV2ZFkTVPQmYd4JKg/4R4W1JbWluJVt/bRefs9SFpNLcglVDsNLtnv1uDk
	Vvu5z8rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquEB-000sYD-1V;
	Thu, 12 Oct 2023 11:51:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9w-000oO3-2u;
	Thu, 12 Oct 2023 11:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XhUTBTuVB8DZb6aUBl+O3Vq+VnVbuBGByiqQ4Uv5WSQ=; b=XQHmVWyNA0dmCOKSSr4YpnoIcJ
	3buJVXsOIjMklh5cNybvKxToEVavVTd3sJ71RfO4pT/QOfQIPxF6L1suP6a+1etEKIEjQPrLpUbul
	VuMF9O7PgvD3o6r89UjR1cy1f+IP6UUz3nLqmLCUSPPQ5j9MwymKzJMnwEs1eWH9/FdHksnFu2vZy
	duJYcKPUlLAIF8Ic7fWtGwXnEBKvG+iobqJRCPKwv0X2X3HQK7pKMh4pKnTnA912w3iz+aVpo0zIw
	CoUKhVsw5swDzgA5SSsrOg5K5qnj/Tl0JUTmAOxTp1FGTBwbBzkRLMK3Avrld3VAyk4njBSjiSxqS
	HeggRtkg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9k-001nJF-2f;
	Thu, 12 Oct 2023 11:47:15 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A0A1660734F;
	Thu, 12 Oct 2023 12:47:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111226;
	bh=kDFtrZ4zFUeHfWfJJ6YMQqB6iaea9mEI5MMOiS3HlSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jl+BxZg1vf0RrKfn/NsEj2nUgLll8t3S+MrVeafFLGO+6yL/Z2hC0rDg7TBn44B63
	 oBqlQaJXiFtG4uxCzHlsSK9XQa664LdHE7Etxye8z+xh7GO8ZXpFhrc3NoRhGjQGC9
	 a8JqPvoIxNxxCTiHOHJC+XdzCuhZB8xLNiGL3czjyhIxyyrCORK8l26fiX+pjQnJjS
	 F2zGK2NPRDdaWLaDmaqUJ58XVH7qVXTEsLlCR1saKGrLgrk3WX6v1EatsZ5l5KAthm
	 xdzZA/8DJynGdICB95DaCTI7ENGOtCkR6rwC9nlM9YL9DUkjWjVHOu81IPL21QJMkQ
	 8+yUpmBvNCIpw==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v11 32/56] media: test-drivers: Stop direct calls to queue num_buffers field
Date: Thu, 12 Oct 2023 13:46:18 +0200
Message-Id: <20231012114642.19040-33-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124711_372723_D55B3567 
X-CRM114-Status: GOOD (  13.78  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
If min_buffers_needed is set remove useless checks.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/media/test-drivers/visl/visl-dec.c         | 4 ++--
 drivers/media/test-drivers/vivid/vivid-meta-cap.c  | 3 ---
 drivers/media/test-drivers/vivid/vivid-meta-out.c  | 5 +++--
 drivers/media/test-drivers/vivid/vivid-touch-cap.c | 5 +++--
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   | 5 +++--
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   | 5 +++--
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 5 +++--
 drivers/media/test-drivers/vivid/vivid-vid-out.c   | 5 +----
 8 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index ba20ea998d19..4672dc5e52bb 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -287,7 +287,7 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
 
 	len = 0;
-	for (i = 0; i < out_q->num_buffers; i++) {
+	for (i = 0; i < vb2_get_num_buffers(out_q); i++) {
 		char entry[] = "index: %u, state: %s, request_fd: %d, ";
 		u32 old_len = len;
 		struct vb2_buffer *vb2;
@@ -347,7 +347,7 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
 
 	len = 0;
-	for (i = 0; i < cap_q->num_buffers; i++) {
+	for (i = 0; i < vb2_get_num_buffers(cap_q); i++) {
 		u32 old_len = len;
 		struct vb2_buffer *vb2;
 		char *q_status;
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.c b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
index 780f96860a6d..0a718d037e59 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
@@ -30,9 +30,6 @@ static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 		sizes[0] = size;
 	}
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
-
 	*nplanes = 1;
 	return 0;
 }
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
index 95835b52b58f..4a569a6e58be 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
@@ -18,6 +18,7 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 				struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned int size =  sizeof(struct vivid_meta_out_buf);
 
 	if (!vivid_is_webcam(dev))
@@ -30,8 +31,8 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 		sizes[0] = size;
 	}
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 
 	*nplanes = 1;
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index c7f6e23df51e..4b3c6ea0afde 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -13,6 +13,7 @@ static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 				 struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	struct v4l2_pix_format *f = &dev->tch_format;
 	unsigned int size = f->sizeimage;
 
@@ -23,8 +24,8 @@ static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 		sizes[0] = size;
 	}
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 
 	*nplanes = 1;
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index b65b02eeeb97..fcd7f40385e9 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -124,6 +124,7 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
 		       unsigned sizes[], struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
 	unsigned size = vq->type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ?
 		36 * sizeof(struct v4l2_sliced_vbi_data) :
@@ -134,8 +135,8 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
 
 	sizes[0] = size;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 
 	*nplanes = 1;
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
index cd56476902a2..8f0da5d88bcc 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
@@ -20,6 +20,7 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
 		       unsigned sizes[], struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	bool is_60hz = dev->std_out & V4L2_STD_525_60;
 	unsigned size = vq->type == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT ?
 		36 * sizeof(struct v4l2_sliced_vbi_data) :
@@ -30,8 +31,8 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
 
 	sizes[0] = size;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 
 	*nplanes = 1;
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 3a06df35a2d7..0cc7602b9fb2 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -77,6 +77,7 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
 		       unsigned sizes[], struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned buffers = tpg_g_buffers(&dev->tpg);
 	unsigned h = dev->fmt_cap_rect.height;
 	unsigned p;
@@ -117,8 +118,8 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
 					dev->fmt_cap->data_offset[p];
 	}
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 
 	*nplanes = buffers;
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 184a6df2c29f..24c6dc896255 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -73,12 +73,9 @@ static int vid_out_queue_setup(struct vb2_queue *vq,
 				       vfmt->data_offset[p] : size;
 	}
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
-
 	*nplanes = planes;
 
-	dprintk(dev, 1, "%s: count=%d\n", __func__, *nbuffers);
+	dprintk(dev, 1, "%s: count=%u\n", __func__, vb2_get_num_buffers(vq));
 	for (p = 0; p < planes; p++)
 		dprintk(dev, 1, "%s: size[%u]=%u\n", __func__, p, sizes[p]);
 	return 0;
-- 
2.39.2


