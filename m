Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4BBC43619
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:07:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC54220825
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rNNHSN4x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qPsvsZsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC54220825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DiLgzsri9LICWQDuac+ueQcdwtgcZf7m3gw772XDXaQ=; b=rNNHSN4xyq0cKTVc7RHOeqsXn
	rdAu/iapBZ6otcfrXWF/WEPqCwRfSYVfQZQC6cZaj/5CDmBDsFF1ibaCPseh4/FGar+iaJa8YmKKM
	B4wrE9G6spRi4cmAeDnywVErJxSZPXJOuLrQ1nW0chTbKpO7TtlfqBtJgnc4iMoOoYMy+145fqjKe
	vA3aILcP4yhd3+AiRqO1T1Ttmsb3ZEnoeyzjUvEjLVK2CPk6Mc8P0NZLusnCIwU/iLPOybnRZXaKs
	c9OmOpal8+RC9j1TejDD7QedUflImD6hq2jB0fPtsLp+qGlIeF1LDRf4a/Xs0A/klfoYfwIjuf+eQ
	3egd72KVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRZx-0001u7-Ap; Thu, 23 Jul 2020 03:07:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRYu-0001LR-Uz; Thu, 23 Jul 2020 03:06:26 +0000
X-UUID: eb64ee6909a74125a71533ad9b161523-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5NgUnUMcRy8Q2wsFxSIxDCVB6qlXDJIrkJNBYcNYcys=; 
 b=qPsvsZsaHf7eRcL4hflZ4C97gJAxrWwVg1mnbVDB3orntYgioHvbTUqlaYkecsxxf2Bic8xdLQqu9aiZZHoXr88bHBdeSRRlOL/Hk+IzxqQkU/Xz5agJJpm20XZhJlHBY5wXKwu2Z5/NTRAxbq6czBzBUgxnm9ejRot4gAU1beE=;
X-UUID: eb64ee6909a74125a71533ad9b161523-20200722
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 790382053; Wed, 22 Jul 2020 19:06:21 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:09 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 09/28] media: platform: Cancel the last frame handling flow
Date: Thu, 23 Jul 2020 11:04:32 +0800
Message-ID: <20200723030451.5616-10-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_230625_178531_AD8775FD 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is no need to queue an empty buffer for signaling a last frame,
because all frames are separate from each other in JPEG.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: delete mtk_jpeg_qbuf()
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 46 +------------------
 1 file changed, 2 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 9baeeacb4452..ffb486e537b6 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -55,15 +55,9 @@ static struct mtk_jpeg_fmt mtk_jpeg_formats[] = {
 
 #define MTK_JPEG_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_formats)
 
-enum {
-	MTK_JPEG_BUF_FLAGS_INIT			= 0,
-	MTK_JPEG_BUF_FLAGS_LAST_FRAME		= 1,
-};
-
 struct mtk_jpeg_src_buf {
 	struct vb2_v4l2_buffer b;
 	struct list_head list;
-	int flags;
 	struct mtk_jpeg_dec_param dec_param;
 };
 
@@ -501,31 +495,6 @@ static int mtk_jpeg_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
-{
-	struct v4l2_fh *fh = file->private_data;
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
-	struct vb2_queue *vq;
-	struct vb2_buffer *vb;
-	struct mtk_jpeg_src_buf *jpeg_src_buf;
-
-	if (buf->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
-		goto end;
-
-	vq = v4l2_m2m_get_vq(fh->m2m_ctx, buf->type);
-	if (buf->index >= vq->num_buffers) {
-		dev_err(ctx->jpeg->dev, "buffer index out of range\n");
-		return -EINVAL;
-	}
-
-	vb = vb2_get_buffer(vq, buf->index);
-	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(vb);
-	jpeg_src_buf->flags = (buf->m.planes[0].bytesused == 0) ?
-		MTK_JPEG_BUF_FLAGS_LAST_FRAME : MTK_JPEG_BUF_FLAGS_INIT;
-end:
-	return v4l2_m2m_qbuf(file, fh->m2m_ctx, buf);
-}
-
 static const struct v4l2_ioctl_ops mtk_jpeg_ioctl_ops = {
 	.vidioc_querycap                = mtk_jpeg_querycap,
 	.vidioc_enum_fmt_vid_cap	= mtk_jpeg_enum_fmt_vid_cap,
@@ -536,7 +505,7 @@ static const struct v4l2_ioctl_ops mtk_jpeg_ioctl_ops = {
 	.vidioc_g_fmt_vid_out_mplane    = mtk_jpeg_g_fmt_vid_mplane,
 	.vidioc_s_fmt_vid_cap_mplane    = mtk_jpeg_s_fmt_vid_cap_mplane,
 	.vidioc_s_fmt_vid_out_mplane    = mtk_jpeg_s_fmt_vid_out_mplane,
-	.vidioc_qbuf                    = mtk_jpeg_qbuf,
+	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
 	.vidioc_subscribe_event         = mtk_jpeg_subscribe_event,
 	.vidioc_g_selection		= mtk_jpeg_g_selection,
 	.vidioc_s_selection		= mtk_jpeg_s_selection,
@@ -676,10 +645,6 @@ static void mtk_jpeg_buf_queue(struct vb2_buffer *vb)
 	param = &jpeg_src_buf->dec_param;
 	memset(param, 0, sizeof(*param));
 
-	if (jpeg_src_buf->flags & MTK_JPEG_BUF_FLAGS_LAST_FRAME) {
-		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "Got eos\n");
-		goto end;
-	}
 	header_valid = mtk_jpeg_parse(param, (u8 *)vb2_plane_vaddr(vb, 0),
 				      vb2_get_plane_payload(vb, 0));
 	if (!header_valid) {
@@ -792,19 +757,12 @@ static void mtk_jpeg_device_run(void *priv)
 	struct mtk_jpeg_src_buf *jpeg_src_buf;
 	struct mtk_jpeg_bs bs;
 	struct mtk_jpeg_fb fb;
-	int i, ret;
+	int ret;
 
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
 
-	if (jpeg_src_buf->flags & MTK_JPEG_BUF_FLAGS_LAST_FRAME) {
-		for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
-			vb2_set_plane_payload(&dst_buf->vb2_buf, i, 0);
-		buf_state = VB2_BUF_STATE_DONE;
-		goto dec_end;
-	}
-
 	if (mtk_jpeg_check_resolution_change(ctx, &jpeg_src_buf->dec_param)) {
 		mtk_jpeg_queue_src_chg_event(ctx);
 		ctx->state = MTK_JPEG_SOURCE_CHANGE;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
