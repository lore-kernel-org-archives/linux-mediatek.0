Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DFDC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:25:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D837A2074D
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X5LGs0zb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LFAWn2HS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D837A2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s8r9PgpJCbOk7G3+0oQUCr7m4f2uumcH0ZOd1ya9ad8=; b=X5LGs0zb6E8cbwT0dQi+Bu9Ov
	ZDvvpLatGZkRamxvM8vEIlTjn12n5n/tlE3MpKUoXhcbtBJX/fTlkqCWO1GqlN0S01H9ZdmugYKVA
	/U9RX9IxgQ1M8psMV15ZrqhyBo30y8QY/tgEPlqy6dio4Ed/jDFcsc7VFAOKPg2RPv2QfOOWBok4a
	qVo/D/ufbxw4piPGQikFfQX4ICitvIZlpPldOtJ2F6iAa88Tzi5MsgeWDv4ewQNLMqF28ty5oYqTe
	ua55oC6rvtyvK6PqBr/OzUFBWzcmXw6ssZmN34kxY1GNXh1DoJOOOWb262TbTO/q15SKG9CkRLyY8
	Xr5dWKkEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6U55-0004Ay-QC; Fri, 14 Aug 2020 07:24:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6U3f-0003N2-Te; Fri, 14 Aug 2020 07:23:26 +0000
X-UUID: 7c8d9eda85d94cf4a257389c1b119985-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Xdw36FEdfbjrpmm/25wdOBNJsrHP+0pR/IpHGiG6feo=; 
 b=LFAWn2HSadYtlLDMeCWsDzXyPP8SnGdgOrXQTU/P90RYa/ZXrdeV0mhonbj6qwaqoTjd92kIAO0FZK7GBN//hG5Yxrzj8MCtHxAglWIRJP7w9yNkbGAr3EPNX+JYcENJdnWZx3UP6v97IAU1wF8wUgf3VprzuN9hzBYig35USaY=;
X-UUID: 7c8d9eda85d94cf4a257389c1b119985-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 207299636; Thu, 13 Aug 2020 23:23:11 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:13:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:13 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v12 10/29] media: platform: Cancel the last frame handling flow
Date: Fri, 14 Aug 2020 15:11:43 +0800
Message-ID: <20200814071202.25067-12-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_032324_166440_ED4FACD1 
X-CRM114-Status: GOOD (  15.34  )
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
v12: no changes
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
