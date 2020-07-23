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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447D6C433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:20:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249FC20771
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szavnoH/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AauNVH//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 249FC20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HJYlHDlzxXnUxF+f9Kb5KAKQEACQof0+kfobyyp5mZ8=; b=szavnoH/a/raIx/2OFPeZjEdT
	DDKLN8V9oEjfudErUpzZ8zKyHCIfm9yej6lZd3nel0W/kgra4sPbmnq1671tGWSU5AgbJ3Tow1gar
	aRsMuW+LDa4qx13Eb8e+ZcqFGDYFvm9Ri3JAqkKx37sDHt83G0eLTBiXf11bZZyK4GGAHHDXYWQ/d
	Eg1Rfw0OErCLnGuIeLCgCuOdytW8z7U1w0eKf43tVEkvymkbcRrAWT0V1lb34K8UsNn8cFT320gbC
	so2IFmIMDYPw+18YMEi31jlmAoIgHCDdUCNIiZp7c3xlMZUXlb3EKf+dTB88AgQVT8fPh3gnmDRg6
	g4nfNYELw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRmV-0006co-LA; Thu, 23 Jul 2020 03:20:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRir-0004yb-4E; Thu, 23 Jul 2020 03:16:43 +0000
X-UUID: 13097f2d72b3444aa96d1cf59f8ea832-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TxR4WcdHIGxSV4sw1H+TFFDn0Va5/ODdjFPOQRBdhDM=; 
 b=AauNVH//pmnrf21dVJjixexshJX9TnHrTdmRXdKPCDRZlkKXZ5wwl4W6sYV7+aoIPtIwnAUnc5lrFMg8gVl3gwcOU2/LkSCB3Ow3twmrU5jRj4YPBaiMy4NpN8YVWxI8M+nE4KEwZF2Bz029uMH+HGKhkdYkakHoNiBX5DLBk5g=;
X-UUID: 13097f2d72b3444aa96d1cf59f8ea832-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 956568193; Wed, 22 Jul 2020 19:16:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:28 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 18/28] media: platform: Refactor mtk_jpeg_find_format()
Date: Thu, 23 Jul 2020 11:04:41 +0800
Message-ID: <20200723030451.5616-19-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_231641_354075_5C0F279D 
X-CRM114-Status: GOOD (  15.13  )
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

Delete the unused ctx parameter.
Using mtk_jpeg_formats and num_formats parameters is more generic,
because that jpeg enc will also use it.
Delete the macro definition of MTK_JPEG_FMT_TYPE_OUTPUT and
MTK_JPEG_FMT_TYPE_CAPTURE, because that MTK_JPEG_FMT_FLAG_DEC_OUTPUT
and MTK_JPEG_FMT_FLAG_DEC_CAPTURE are enough.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: new add patch
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 64 ++++++++++---------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  3 -
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index aba583f03ef1..b3e38ffd4e81 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -131,20 +131,17 @@ static struct mtk_jpeg_q_data *mtk_jpeg_get_q_data(struct mtk_jpeg_ctx *ctx,
 	return &ctx->cap_q;
 }
 
-static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
-						 u32 pixelformat,
-						 unsigned int fmt_type)
+static struct mtk_jpeg_fmt *
+mtk_jpeg_find_format(struct mtk_jpeg_fmt *mtk_jpeg_formats, int num_formats,
+		     u32 pixelformat, unsigned int fmt_type)
 {
-	unsigned int k, fmt_flag;
-
-	fmt_flag = (fmt_type == MTK_JPEG_FMT_TYPE_OUTPUT) ?
-		   MTK_JPEG_FMT_FLAG_DEC_OUTPUT :
-		   MTK_JPEG_FMT_FLAG_DEC_CAPTURE;
+	unsigned int k;
+	struct mtk_jpeg_fmt *fmt;
 
-	for (k = 0; k < MTK_JPEG_NUM_FORMATS; k++) {
-		struct mtk_jpeg_fmt *fmt = &mtk_jpeg_formats[k];
+	for (k = 0; k < num_formats; k++) {
+		fmt = &mtk_jpeg_formats[k];
 
-		if (fmt->fourcc == pixelformat && fmt->flags & fmt_flag)
+		if (fmt->fourcc == pixelformat && fmt->flags & fmt_type)
 			return fmt;
 	}
 
@@ -249,8 +246,9 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
 	struct mtk_jpeg_fmt *fmt;
 
-	fmt = mtk_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat,
-				   MTK_JPEG_FMT_TYPE_CAPTURE);
+	fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
+				   f->fmt.pix_mp.pixelformat,
+				   MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
 	if (!fmt)
 		fmt = ctx->cap_q.fmt;
 
@@ -275,8 +273,9 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
 	struct mtk_jpeg_fmt *fmt;
 
-	fmt = mtk_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat,
-				   MTK_JPEG_FMT_TYPE_OUTPUT);
+	fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
+				   f->fmt.pix_mp.pixelformat,
+				   MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
 	if (!fmt)
 		fmt = ctx->out_q.fmt;
 
@@ -296,13 +295,12 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 }
 
 static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
-				 struct v4l2_format *f)
+				 struct v4l2_format *f, unsigned int fmt_type)
 {
 	struct vb2_queue *vq;
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
-	unsigned int f_type;
 	int i;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
@@ -316,10 +314,10 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 		return -EBUSY;
 	}
 
-	f_type = V4L2_TYPE_IS_OUTPUT(f->type) ?
-			 MTK_JPEG_FMT_TYPE_OUTPUT : MTK_JPEG_FMT_TYPE_CAPTURE;
 
-	q_data->fmt = mtk_jpeg_find_format(ctx, pix_mp->pixelformat, f_type);
+	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_formats,
+					   MTK_JPEG_NUM_FORMATS,
+					   pix_mp->pixelformat, fmt_type);
 	q_data->w = pix_mp->width;
 	q_data->h = pix_mp->height;
 	ctx->colorspace = pix_mp->colorspace;
@@ -356,7 +354,8 @@ static int mtk_jpeg_s_fmt_vid_out_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f);
+	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
+				     MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
 }
 
 static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file, void *priv,
@@ -368,7 +367,8 @@ static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f);
+	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
+				     MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
 }
 
 static void mtk_jpeg_queue_src_chg_event(struct mtk_jpeg_ctx *ctx)
@@ -512,8 +512,9 @@ static bool mtk_jpeg_check_resolution_change(struct mtk_jpeg_ctx *ctx,
 	}
 
 	q_data = &ctx->cap_q;
-	if (q_data->fmt != mtk_jpeg_find_format(ctx, param->dst_fourcc,
-						MTK_JPEG_FMT_TYPE_CAPTURE)) {
+	if (q_data->fmt != mtk_jpeg_find_format(mtk_jpeg_formats,
+			MTK_JPEG_NUM_FORMATS, param->dst_fourcc,
+			MTK_JPEG_FMT_FLAG_DEC_CAPTURE)) {
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "format change\n");
 		return true;
 	}
@@ -534,9 +535,10 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
 	q_data = &ctx->cap_q;
 	q_data->w = param->dec_w;
 	q_data->h = param->dec_h;
-	q_data->fmt = mtk_jpeg_find_format(ctx,
+	q_data->fmt = mtk_jpeg_find_format(mtk_jpeg_formats,
+					   MTK_JPEG_NUM_FORMATS,
 					   param->dst_fourcc,
-					   MTK_JPEG_FMT_TYPE_CAPTURE);
+					   MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		q_data->bytesperline[i] = param->mem_stride[i];
@@ -844,16 +846,18 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
 	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
-	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
-					      MTK_JPEG_FMT_TYPE_OUTPUT);
+	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
+				      V4L2_PIX_FMT_JPEG,
+				      MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
 	q->w = MTK_JPEG_MIN_WIDTH;
 	q->h = MTK_JPEG_MIN_HEIGHT;
 	q->bytesperline[0] = 0;
 	q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
 
 	q = &ctx->cap_q;
-	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUV420M,
-					      MTK_JPEG_FMT_TYPE_CAPTURE);
+	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
+				      V4L2_PIX_FMT_YUV420M,
+				      MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
 	q->w = MTK_JPEG_MIN_WIDTH;
 	q->h = MTK_JPEG_MIN_HEIGHT;
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 6106cfaba311..192ee488a50a 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -20,9 +20,6 @@
 #define MTK_JPEG_FMT_FLAG_DEC_OUTPUT	BIT(0)
 #define MTK_JPEG_FMT_FLAG_DEC_CAPTURE	BIT(1)
 
-#define MTK_JPEG_FMT_TYPE_OUTPUT	1
-#define MTK_JPEG_FMT_TYPE_CAPTURE	2
-
 #define MTK_JPEG_MIN_WIDTH	32U
 #define MTK_JPEG_MIN_HEIGHT	32U
 #define MTK_JPEG_MAX_WIDTH	65535U
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
