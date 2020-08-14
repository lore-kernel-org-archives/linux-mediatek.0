Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2BDC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:25:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA628206DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DGNxJmlX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bkF2UT4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA628206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1aFgXPmMcfTtBolt7jbWR2P0MWFf0yDFmO/jbVJs7QM=; b=DGNxJmlXMIXJ7IE78z5Yzvp32
	enL1bGIn0CDiX6BTBAh6ai2Y4Uh/G1Fo59Zn4tDF8MxJr97emzkXbJLCIW66YfiALv0EhkqjtkYg5
	xBDfY4jI4OI94sxYHr6rJC2r6/FOlC/qORHt4/Jp3szo8jPsynRg4hidu1d2huJf3KLwDBLPixhb3
	lbQVLx0xa3I8CPaxbRU44QmM5foH1N0xZJlemSgICHHWWrTtPvkUkta3eb5Pw/3TzvmXjmQZRkpxf
	4ml4StF8QV9vAulw2hgKrZAa3OpihYvg1ZCEHy8cpPNdT7iSiwC/B4Ra6uv2KL0N5q/QUgYP11Y82
	Gsh5bkR1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6U5G-0004HJ-NA; Fri, 14 Aug 2020 07:25:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6U3f-0003N6-Q4; Fri, 14 Aug 2020 07:23:26 +0000
X-UUID: fc06895743834811b10f637610fc1425-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KoruD4ltcBpo2ra3J9S0eAKfJ8GHH4yZd7zq0+/1eIE=; 
 b=bkF2UT4Z8KpZPXt/NuA3Diy/8786zdN7bRdkkVn6e/34BxVifTTMn3S0jEyml9CrVRn5+IOTi0g2AHIvUA9ijdJ8o247WQ6sT5x+W0jcO4YTMGl+AbnnbiNnEUy3avUmUiRQ5v9XS6QtvSikZhKQasP9tyOzFtLVF/3UvLukkXo=;
X-UUID: fc06895743834811b10f637610fc1425-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 18430178; Thu, 13 Aug 2020 23:23:11 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:13:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:36 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v12 28/29] media: platform: Using the variant structure to
 contain the varability between dec and enc
Date: Fri, 14 Aug 2020 15:12:01 +0800
Message-ID: <20200814071202.25067-30-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_032324_069431_E41B0826 
X-CRM114-Status: GOOD (  17.50  )
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

Add varability which would be used between jpeg dec and enc to a match
data structure, it will make the code linear.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v12: no changes
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 113 +++++++++++-------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  36 +++++-
 2 files changed, 104 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 3d1383d2eac4..3d95c7f0a22d 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -80,8 +80,8 @@ static int mtk_jpeg_querycap(struct file *file, void *priv,
 {
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 
-	strscpy(cap->driver, MTK_JPEG_NAME " decoder", sizeof(cap->driver));
-	strscpy(cap->card, MTK_JPEG_NAME " decoder", sizeof(cap->card));
+	strscpy(cap->driver, jpeg->variant->dev_name, sizeof(cap->driver));
+	strscpy(cap->card, jpeg->variant->dev_name, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
 		 dev_name(jpeg->dev));
 
@@ -112,15 +112,23 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
 static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	return mtk_jpeg_enum_fmt(mtk_jpeg_dec_formats, MTK_JPEG_DEC_NUM_FORMATS,
-				 f, MTK_JPEG_FMT_FLAG_CAPTURE);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+
+	return mtk_jpeg_enum_fmt(jpeg->variant->formats,
+				 jpeg->variant->num_formats, f,
+				 MTK_JPEG_FMT_FLAG_CAPTURE);
 }
 
 static int mtk_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	return mtk_jpeg_enum_fmt(mtk_jpeg_dec_formats, MTK_JPEG_DEC_NUM_FORMATS,
-				 f, MTK_JPEG_FMT_FLAG_OUTPUT);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+
+	return mtk_jpeg_enum_fmt(jpeg->variant->formats,
+				 jpeg->variant->num_formats, f,
+				 MTK_JPEG_FMT_FLAG_OUTPUT);
 }
 
 static struct mtk_jpeg_q_data *mtk_jpeg_get_q_data(struct mtk_jpeg_ctx *ctx,
@@ -244,10 +252,11 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 					   struct v4l2_format *f)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct mtk_jpeg_fmt *fmt;
 
-	fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
-				   MTK_JPEG_DEC_NUM_FORMATS,
+	fmt = mtk_jpeg_find_format(jpeg->variant->formats,
+				   jpeg->variant->num_formats,
 				   f->fmt.pix_mp.pixelformat,
 				   MTK_JPEG_FMT_FLAG_CAPTURE);
 	if (!fmt)
@@ -272,10 +281,11 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 					   struct v4l2_format *f)
 {
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct mtk_jpeg_fmt *fmt;
 
-	fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
-				   MTK_JPEG_DEC_NUM_FORMATS,
+	fmt = mtk_jpeg_find_format(jpeg->variant->formats,
+				   jpeg->variant->num_formats,
 				   f->fmt.pix_mp.pixelformat,
 				   MTK_JPEG_FMT_FLAG_OUTPUT);
 	if (!fmt)
@@ -316,9 +326,8 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 		return -EBUSY;
 	}
 
-
-	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
-					   MTK_JPEG_DEC_NUM_FORMATS,
+	q_data->fmt = mtk_jpeg_find_format(jpeg->variant->formats,
+					   jpeg->variant->num_formats,
 					   pix_mp->pixelformat, fmt_type);
 	q_data->pix_mp.width = pix_mp->width;
 	q_data->pix_mp.height = pix_mp->height;
@@ -519,9 +528,10 @@ static bool mtk_jpeg_check_resolution_change(struct mtk_jpeg_ctx *ctx,
 	}
 
 	q_data = &ctx->cap_q;
-	if (q_data->fmt != mtk_jpeg_find_format(mtk_jpeg_dec_formats,
-			MTK_JPEG_DEC_NUM_FORMATS, param->dst_fourcc,
-			MTK_JPEG_FMT_FLAG_CAPTURE)) {
+	if (q_data->fmt !=
+	    mtk_jpeg_find_format(jpeg->variant->formats,
+				 jpeg->variant->num_formats, param->dst_fourcc,
+				 MTK_JPEG_FMT_FLAG_CAPTURE)) {
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "format change\n");
 		return true;
 	}
@@ -542,8 +552,8 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
 	q_data = &ctx->cap_q;
 	q_data->pix_mp.width = param->dec_w;
 	q_data->pix_mp.height = param->dec_h;
-	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
-					   MTK_JPEG_DEC_NUM_FORMATS,
+	q_data->fmt = mtk_jpeg_find_format(jpeg->variant->formats,
+					   jpeg->variant->num_formats,
 					   param->dst_fourcc,
 					   MTK_JPEG_FMT_FLAG_CAPTURE);
 
@@ -749,13 +759,14 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 			       struct vb2_queue *dst_vq)
 {
 	struct mtk_jpeg_ctx *ctx = priv;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int ret;
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	src_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct mtk_jpeg_src_buf);
-	src_vq->ops = &mtk_jpeg_dec_qops;
+	src_vq->ops = jpeg->variant->qops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->jpeg->lock;
@@ -768,7 +779,7 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
-	dst_vq->ops = &mtk_jpeg_dec_qops;
+	dst_vq->ops = jpeg->variant->qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->jpeg->lock;
@@ -786,14 +797,16 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 	if (ret)
 		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
 
-	ret = clk_bulk_prepare_enable(jpeg->num_clks, jpeg->clks);
+	ret = clk_bulk_prepare_enable(jpeg->variant->num_clks,
+				      jpeg->variant->clks);
 	if (ret)
 		dev_err(jpeg->dev, "Failed to open jpeg clk: %d\n", ret);
 }
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
-	clk_bulk_disable_unprepare(jpeg->num_clks, jpeg->clks);
+	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
+				   jpeg->variant->clks);
 	mtk_smi_larb_put(jpeg->larb);
 }
 
@@ -847,24 +860,25 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 {
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
 	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
 	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
 	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	q->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
 
-	q->fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
-				      MTK_JPEG_DEC_NUM_FORMATS,
-				      V4L2_PIX_FMT_JPEG,
+	q->fmt = mtk_jpeg_find_format(jpeg->variant->formats,
+				      jpeg->variant->num_formats,
+				      jpeg->variant->out_q_default_fourcc,
 				      MTK_JPEG_FMT_FLAG_OUTPUT);
 	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
 	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
 	mtk_jpeg_try_fmt_mplane(&q->pix_mp, q->fmt);
 
 	q = &ctx->cap_q;
-	q->fmt = mtk_jpeg_find_format(mtk_jpeg_dec_formats,
-				      MTK_JPEG_DEC_NUM_FORMATS,
-				      V4L2_PIX_FMT_YUV420M,
+	q->fmt = mtk_jpeg_find_format(jpeg->variant->formats,
+				      jpeg->variant->num_formats,
+				      jpeg->variant->cap_q_default_fourcc,
 				      MTK_JPEG_FMT_FLAG_CAPTURE);
 	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
 	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
@@ -963,9 +977,8 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
 
 	jpeg->larb = &pdev->dev;
 
-	jpeg->clks = mt8173_jpeg_dec_clocks;
-	jpeg->num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks);
-	ret = devm_clk_bulk_get(jpeg->dev, jpeg->num_clks, jpeg->clks);
+	ret = devm_clk_bulk_get(jpeg->dev, jpeg->variant->num_clks,
+				jpeg->variant->clks);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to get jpeg clock:%d\n", ret);
 		return ret;
@@ -985,7 +998,7 @@ static void mtk_jpeg_job_timeout_work(struct work_struct *work)
 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	mtk_jpeg_dec_reset(jpeg->reg_base);
+	jpeg->variant->hw_reset(jpeg->reg_base);
 
 	pm_runtime_put(jpeg->dev);
 
@@ -1007,6 +1020,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	mutex_init(&jpeg->lock);
 	spin_lock_init(&jpeg->hw_lock);
 	jpeg->dev = &pdev->dev;
+	jpeg->variant = of_device_get_match_data(jpeg->dev);
 	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1022,8 +1036,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		return jpeg_irq;
 	}
 
-	ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq, 0,
-			       pdev->name, jpeg);
+	ret = devm_request_irq(&pdev->dev, jpeg_irq,
+			       jpeg->variant->irq_handler, 0, pdev->name, jpeg);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
 			jpeg_irq, ret);
@@ -1043,7 +1057,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		goto err_dev_register;
 	}
 
-	jpeg->m2m_dev = v4l2_m2m_init(&mtk_jpeg_dec_m2m_ops);
+	jpeg->m2m_dev = v4l2_m2m_init(jpeg->variant->m2m_ops);
+
 	if (IS_ERR(jpeg->m2m_dev)) {
 		v4l2_err(&jpeg->v4l2_dev, "Failed to init mem2mem device\n");
 		ret = PTR_ERR(jpeg->m2m_dev);
@@ -1056,9 +1071,9 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		goto err_vfd_jpeg_alloc;
 	}
 	snprintf(jpeg->vdev->name, sizeof(jpeg->vdev->name),
-		 "%s-dec", MTK_JPEG_NAME);
+		 "%s", jpeg->variant->dev_name);
 	jpeg->vdev->fops = &mtk_jpeg_fops;
-	jpeg->vdev->ioctl_ops = &mtk_jpeg_dec_ioctl_ops;
+	jpeg->vdev->ioctl_ops = jpeg->variant->ioctl_ops;
 	jpeg->vdev->minor = -1;
 	jpeg->vdev->release = video_device_release;
 	jpeg->vdev->lock = &jpeg->lock;
@@ -1075,8 +1090,9 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 
 	video_set_drvdata(jpeg->vdev, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
-		  "decoder device registered as /dev/video%d (%d,%d)\n",
-		  jpeg->vdev->num, VIDEO_MAJOR, jpeg->vdev->minor);
+		  "%s device registered as /dev/video%d (%d,%d)\n",
+		  jpeg->variant->dev_name, jpeg->vdev->num,
+		  VIDEO_MAJOR, jpeg->vdev->minor);
 
 	platform_set_drvdata(pdev, jpeg);
 
@@ -1159,14 +1175,29 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops = {
 	SET_RUNTIME_PM_OPS(mtk_jpeg_pm_suspend, mtk_jpeg_pm_resume, NULL)
 };
 
+static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
+	.clks = mt8173_jpeg_dec_clocks,
+	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.irq_handler = mtk_jpeg_dec_irq,
+	.hw_reset = mtk_jpeg_dec_reset,
+	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+};
+
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
-		.data       = NULL,
+		.data = &mt8173_jpeg_drvdata,
 	},
 	{
 		.compatible = "mediatek,mt2701-jpgdec",
-		.data       = NULL,
+		.data = &mt8173_jpeg_drvdata,
 	},
 	{},
 };
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 0f27480dd90d..d11d366a247e 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -41,6 +41,36 @@ enum mtk_jpeg_ctx_state {
 	MTK_JPEG_SOURCE_CHANGE,
 };
 
+/**
+ * mtk_jpeg_variant - mtk jpeg driver variant
+ * @clks:			clock names
+ * @num_clks:			numbers of clock
+ * @format:			jpeg driver's internal color format
+ * @num_format:			number of format
+ * @qops:			the callback of jpeg vb2_ops
+ * @irq_handler:		jpeg irq handler callback
+ * @hw_reset:			jpeg hardware reset callback
+ * @m2m_ops:			the callback of jpeg v4l2_m2m_ops
+ * @dev_name:			jpeg device name
+ * @ioctl_ops:			the callback of jpeg v4l2_ioctl_ops
+ * @out_q_default_fourcc:	output queue default fourcc
+ * @cap_q_default_fourcc:	capture queue default fourcc
+ */
+struct mtk_jpeg_variant {
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct mtk_jpeg_fmt *formats;
+	int num_formats;
+	const struct vb2_ops *qops;
+	irqreturn_t (*irq_handler)(int irq, void *priv);
+	void (*hw_reset)(void __iomem *base);
+	const struct v4l2_m2m_ops *m2m_ops;
+	const char *dev_name;
+	const struct v4l2_ioctl_ops *ioctl_ops;
+	u32 out_q_default_fourcc;
+	u32 cap_q_default_fourcc;
+};
+
 /**
  * struct mt_jpeg - JPEG IP abstraction
  * @lock:		the mutex protecting this structure
@@ -52,10 +82,9 @@ enum mtk_jpeg_ctx_state {
  * @alloc_ctx:		videobuf2 memory allocator's context
  * @vdev:		video device node for jpeg mem2mem mode
  * @reg_base:		JPEG registers mapping
- * @clks:		clock names
- * @num_clks:		numbers of clock
  * @larb:		SMI device
  * @job_timeout_work:	IRQ timeout structure
+ * @variant:		driver variant to be used
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -67,10 +96,9 @@ struct mtk_jpeg_dev {
 	void			*alloc_ctx;
 	struct video_device	*vdev;
 	void __iomem		*reg_base;
-	struct clk_bulk_data *clks;
-	int num_clks;
 	struct device		*larb;
 	struct delayed_work job_timeout_work;
+	const struct mtk_jpeg_variant *variant;
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
