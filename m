Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089F3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C522C61BE3
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C522C61BE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRDhOHJu34eyPsCiRiMMFoIiIyK71NG4S07ZwkFi7vE=; b=j/RMiw3TA4vvxM
	BhcNhmuNF4nIokP0hpkqlBjxDLlLPrxWycWGXlGtvei3vMCeDNPOGy+WaRRc5OSRmV4BKXni9u23J
	Una7wIk/P5Bdadcg5Y39lGoikf3p1vD52OzirQYyuynOnSN4cktJkjE5E+xPwAdEG4u44VifeGIJK
	A1NnUWUe3QZ2kbF/65btVcki9AvTlJezdI4RBn3DpUMZcj++An3rKiPADwFSEL6CkCtPQS24zM/wQ
	D3NFAtRs2pKs+t191lLgvg6mAoxBnV8bSHzTywfq4thPCae/1qB2uIUx+k5GJl27iO+k9ED6APMQv
	axni02ZPUsSbLNFnAszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKeX-004mpw-3C; Wed, 17 Nov 2021 13:07:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKeT-004mlT-Jl
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 13:07:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 8B4BB1F45D05
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637154420; bh=SOIfKJTF3ojVjdj5pNKtgKYrGmMpjOI/etlet6g4CfI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oXHaIMrHZL2Kf6Z6hLYftuq3Srst9bAzqCibEfCUy8HilO3ozsLTBneFywPwSp3RU
 bvTsliBjcRzI1Fx39XAx3mhwVNy2IED95Mx+bBqiHFR8EVXd4k0geTdjhA0uZYBYSS
 YlZmJytVyITNyhNBY2QKcgg/i/ysEeaYQTrHiO1/a5UKECVVa3XYfA+lvwD02oxY9y
 xcT/g2OzLx8TiLHb09YGNwLGZr2GtbR97/siReL6t+S9AzkWepXdqOuBsPJQ47yXze
 R5fELdZnNipwoYgRMwuAL0GZwXEzNmYqOFvFW1528G2KIty2zIY6JhxNePUngj7x+4
 TIKgjbar7REiw==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
 hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, tfiga@chromium.org, tiffany.lin@mediatek.com
Subject: [PATCH v2 6/7] media: mtk-vcodec: don't check return val of
 mtk_venc_get_q_data
Date: Wed, 17 Nov 2021 15:06:34 +0200
Message-Id: <20211117130635.11633-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_050701_936806_943B8311 
X-CRM114-Status: GOOD (  13.32  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The function mtk_venc_get_q_data always returns a reference
so there is no need to check if the return value is null.
In addition move the q_data initialization to the declaration

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 39 ++++---------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index be28f2401839..5caaeb4773ca 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -399,7 +399,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct vb2_queue *vq;
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int i, ret;
 	const struct mtk_video_fmt *fmt;
 
@@ -414,12 +414,6 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	q_data = mtk_venc_get_q_data(ctx, f->type);
-	if (!q_data) {
-		mtk_v4l2_err("fail to get q data");
-		return -EINVAL;
-	}
-
 	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->capture_formats[0];
@@ -460,7 +454,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct vb2_queue *vq;
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int ret, i;
 	const struct mtk_video_fmt *fmt;
 
@@ -475,12 +469,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	q_data = mtk_venc_get_q_data(ctx, f->type);
-	if (!q_data) {
-		mtk_v4l2_err("fail to get q data");
-		return -EINVAL;
-	}
-
 	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->output_formats[0];
@@ -520,14 +508,13 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	struct vb2_queue *vq;
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int i;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
 	if (!vq)
 		return -EINVAL;
 
-	q_data = mtk_venc_get_q_data(ctx, f->type);
 
 	pix->width = q_data->coded_width;
 	pix->height = q_data->coded_height;
@@ -596,15 +583,11 @@ static int vidioc_venc_g_selection(struct file *file, void *priv,
 				     struct v4l2_selection *s)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
-	q_data = mtk_venc_get_q_data(ctx, s->type);
-	if (!q_data)
-		return -EINVAL;
-
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -630,15 +613,11 @@ static int vidioc_venc_s_selection(struct file *file, void *priv,
 				     struct v4l2_selection *s)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
-	q_data = mtk_venc_get_q_data(ctx, s->type);
-	if (!q_data)
-		return -EINVAL;
-
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP:
 		/* Only support crop from (0,0) */
@@ -805,11 +784,9 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
 				   struct device *alloc_devs[])
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vq);
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, vq->type);
 	unsigned int i;
 
-	q_data = mtk_venc_get_q_data(ctx, vq->type);
-
 	if (q_data == NULL)
 		return -EINVAL;
 
@@ -829,11 +806,9 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
 static int vb2ops_venc_buf_prepare(struct vb2_buffer *vb)
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, vb->vb2_queue->type);
 	int i;
 
-	q_data = mtk_venc_get_q_data(ctx, vb->vb2_queue->type);
-
 	for (i = 0; i < q_data->fmt->num_planes; i++) {
 		if (vb2_plane_size(vb, i) < q_data->sizeimage[i]) {
 			mtk_v4l2_err("data will not fit into plane %d (%lu < %d)",
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
