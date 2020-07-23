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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71C4C43460
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:06:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC51207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="elJECoYQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r4eJMLj1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC51207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oV1re9kolhsff3fd1J1wx7OJx6KLBjrWSUX9t/8ljEk=; b=elJECoYQ6tKdtX+97dR/vtxXW
	VxKB+4hMVtN+GMVLkCMIDU+2bHzOfNARklNBt9y9lItawJuBR3bE6W5H6T4s5pRAx7ZsAEmxUVER4
	PNq0yJK0VGAhQA3FRtk/uXgPSIer7mYKXWsjGKOhBrOGYFshmHjyfKwkzs6wy3OjcTt/5B+bwUhfO
	HB6jm9OqhT/WnO7cwU62N584EnFNARE6ZoSmgJF1L+Q9VyKXF9TxwXeK0A3jS/ky5d5kFMa85U5Ny
	2O75IVwnZsGzoANUWDJUU7gAizjFaM8n+KrGtIv+aIrTBkF3WUa9N3BACMwUFPlfJyW9DInkBpLTa
	9bfz4QEzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRZ8-0001Ra-GD; Thu, 23 Jul 2020 03:06:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRYl-0001Ci-2S; Thu, 23 Jul 2020 03:06:17 +0000
X-UUID: ead527baa7264086a876e7227953c6d5-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=URdUoq8M+whZhazI2kNK4B6x/nto9y7oIquYZmUl4VA=; 
 b=r4eJMLj1rAPKUCaKNM9a2I9rjx8uQxXIu26ds90393Va5BY11rnyq8Ae1qC/uMw7U+KPm4nPG21q7fg9tRC9gKaQ1N8AVuk4aZC4EQgftp8SAyYRaNi3JoWKGnx9N1BUxQckLTDjsye5kfKaTnSRpTrUrTiJLsgAShi1lSkd4tI=;
X-UUID: ead527baa7264086a876e7227953c6d5-20200722
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 217475825; Wed, 22 Jul 2020 19:06:11 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:04 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 05/28] media: platform: Improve power on and power off flow
Date: Thu, 23 Jul 2020 11:04:28 +0800
Message-ID: <20200723030451.5616-6-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_230615_282192_BD52B3A0 
X-CRM114-Status: GOOD (  14.09  )
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

Call pm_runtime_get_sync() before starting a frame and then
pm_runtime_put() after completing it. This can save power for the time
between processing two frames.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: no changes
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 27 +++++--------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 12609ca46fd9..fb624385969e 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -710,23 +710,6 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 		return v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 }
 
-static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
-{
-	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
-	struct vb2_v4l2_buffer *vb;
-	int ret = 0;
-
-	ret = pm_runtime_get_sync(ctx->jpeg->dev);
-	if (ret < 0)
-		goto err;
-
-	return 0;
-err:
-	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
-		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_QUEUED);
-	return ret;
-}
-
 static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
@@ -751,8 +734,6 @@ static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
 
 	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
 		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
-
-	pm_runtime_put_sync(ctx->jpeg->dev);
 }
 
 static const struct vb2_ops mtk_jpeg_qops = {
@@ -761,7 +742,6 @@ static const struct vb2_ops mtk_jpeg_qops = {
 	.buf_queue          = mtk_jpeg_buf_queue,
 	.wait_prepare       = vb2_ops_wait_prepare,
 	.wait_finish        = vb2_ops_wait_finish,
-	.start_streaming    = mtk_jpeg_start_streaming,
 	.stop_streaming     = mtk_jpeg_stop_streaming,
 };
 
@@ -812,7 +792,7 @@ static void mtk_jpeg_device_run(void *priv)
 	struct mtk_jpeg_src_buf *jpeg_src_buf;
 	struct mtk_jpeg_bs bs;
 	struct mtk_jpeg_fb fb;
-	int i;
+	int i, ret;
 
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -832,6 +812,10 @@ static void mtk_jpeg_device_run(void *priv)
 		return;
 	}
 
+	ret = pm_runtime_get_sync(jpeg->dev);
+	if (ret < 0)
+		goto dec_end;
+
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
 		goto dec_end;
@@ -957,6 +941,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	pm_runtime_put(ctx->jpeg->dev);
 	return IRQ_HANDLED;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
