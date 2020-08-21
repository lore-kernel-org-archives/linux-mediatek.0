Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5740FC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A4820748
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S+zE/OE7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P8vvNleH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29A4820748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RcDlCgrfINba/cjRwiKJUUwgiezzaECI9nfnRr+A02w=; b=S+zE/OE7RD1SW9B40KLnT2MEF
	Ly7M3Way1ikKRxWdasTurINLjNKzVMRwae1mTwCQeW0w0E4Zw8Jhd0dk2KENBVRGg46pBex1NES/U
	7qxgO9/I8CRFbPC31EOspIF9UYdC8PVTm+0HLJcWhEz5humtKUc155vw/BKZNvbjEPC4QVqxOEmKd
	6ozRM+4O5fpYlzkopLYgjdmKb/CmSjxeKmt5czW0kys0htX3fKQteDzHPcs5TpyzlEczthyq6gj+G
	4Eae35NXYZrnZs6tdXNoGZ21Ifrl5fX/gFFplLPWjI7tgH/yqPlogxsKAnfOVTcaTiL3bx1DjG+OL
	sikLmuNYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94QI-0002Ul-Mx; Fri, 21 Aug 2020 10:37:26 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94QH-0002Sw-1r
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:25 +0000
Received: by mail-pf1-x441.google.com with SMTP id 17so864378pfw.9
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ljhi/VG5P34Hs9+4uh6nLgqd8v+gNFS6fb+CvHrY46E=;
 b=P8vvNleHgwAynsmC6lsMKY3uwNUsNbZ452tZWs27SpnLxhe2UCnzODapTh66dRpnyW
 cCwYlU0eob1fTTdvoCMzGkcjlp1+7SWxMOF06GyRJReplD8lO+viqGBFPZffZ2j1PDpu
 m8gMb3YxQc5AJYYMpqR4GoYAPjzM9401B+4w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ljhi/VG5P34Hs9+4uh6nLgqd8v+gNFS6fb+CvHrY46E=;
 b=K+EW5JACxtzpl4XTqzLxI70JAeg/mQ/nMFRTMNizrlvrioH7lbGY+gAxv1sHAJCC5V
 RVmdP859hnzVLhXIDeslzCZXtNGF6sIViEXaLEqLXmHyhglp1OSDwcHSP0Nj2Vzf4fJS
 sa4Spx272/vukDuh0ERjmHic/pZn+H+7lzuSof1bsPtoS4AsjZeeQ9iEK/UktbjNWyzD
 AGHcLXwd9e8eAeoUPsV1iDvcskuW5UhqDi20dy8O1K0Y0fBMvLPIqA32G5gCXRlJpvZw
 cIb1RVOD0MdYYn9Ahs1F2zZARYYbZ8uhxeQUkJdTMF4Vp92PRJFYaoJK+/u2f9jcYxvS
 4AfA==
X-Gm-Message-State: AOAM533X+J/mtsQkZjueMOwD+IqI0SBtE9AZBN0ET6K1MOHmtR8KYA+L
 hC5IL099AdqYGPZ4HfBkeLbL6w==
X-Google-Smtp-Source: ABdhPJxfUTmFDWyoXGgTXQnxxK5YQdD4uEr3YGTNDXasSVXq6ygIS2UJtCfWh+Z8fX1itWDOPrt+xg==
X-Received: by 2002:a62:8416:: with SMTP id k22mr1930146pfd.293.1598006243121; 
 Fri, 21 Aug 2020 03:37:23 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:22 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 15/17] media: mtk-vcodec: venc: support ENUM_FRAMESIZES on
 OUTPUT formats
Date: Fri, 21 Aug 2020 19:36:06 +0900
Message-Id: <20200821103608.2310097-16-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063725_167302_751156BD 
X-CRM114-Status: GOOD (  16.55  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v4l2-compliance requires ENUM_FRAMESIZES to support OUTPUT formats.
Reuse mtk_venc_find_format() to make sure both queues are considered
when serving an ENUM_FRAMESIZES.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 71 +++++++++----------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index f8d4fbe927f9..1b79185cf922 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -123,28 +123,44 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f,
 	return 0;
 }
 
+static const struct mtk_video_fmt *mtk_venc_find_format(u32 fourcc,
+	const struct mtk_vcodec_enc_pdata *pdata)
+{
+	const struct mtk_video_fmt *fmt;
+	unsigned int k;
+
+	for (k = 0; k < pdata->num_capture_formats; k++) {
+		fmt = &pdata->capture_formats[k];
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	for (k = 0; k < pdata->num_output_formats; k++) {
+		fmt = &pdata->output_formats[k];
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+
 static int vidioc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
-	const struct mtk_vcodec_enc_pdata *pdata =
-		fh_to_ctx(fh)->dev->venc_pdata;
-	int i = 0;
+	const struct mtk_video_fmt *fmt;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	for (i = 0; i < pdata->num_capture_formats; ++i) {
-		const struct mtk_video_fmt *fmt = &pdata->capture_formats[i];
+	fmt = mtk_venc_find_format(fsize->pixel_format,
+				   fh_to_ctx(fh)->dev->venc_pdata);
+	if (!fmt)
+		return -EINVAL;
 
-		if (fsize->pixel_format != fmt->fourcc)
-			continue;
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = mtk_venc_framesizes;
 
-		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-		fsize->stepwise = mtk_venc_framesizes;
-		return 0;
-	}
-
-	return -EINVAL;
+	return 0;
 }
 
 static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
@@ -222,27 +238,6 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
 	return &ctx->q_data[MTK_Q_DATA_DST];
 }
 
-static const struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f,
-	const struct mtk_vcodec_enc_pdata *pdata)
-{
-	const struct mtk_video_fmt *fmt;
-	unsigned int k;
-
-	for (k = 0; k < pdata->num_capture_formats; k++) {
-		fmt = &pdata->capture_formats[k];
-		if (fmt->fourcc == f->fmt.pix.pixelformat)
-			return fmt;
-	}
-
-	for (k = 0; k < pdata->num_output_formats; k++) {
-		fmt = &pdata->output_formats[k];
-		if (fmt->fourcc == f->fmt.pix.pixelformat)
-			return fmt;
-	}
-
-	return NULL;
-}
-
 /* V4L2 specification suggests the driver corrects the format struct if any of
  * the dimensions is unsupported
  */
@@ -403,7 +398,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	fmt = mtk_venc_find_format(f, pdata);
+	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->capture_formats[0];
 		f->fmt.pix.pixelformat = fmt->fourcc;
@@ -467,7 +462,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	fmt = mtk_venc_find_format(f, pdata);
+	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->output_formats[0];
 		f->fmt.pix.pixelformat = fmt->fourcc;
@@ -550,7 +545,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 
-	fmt = mtk_venc_find_format(f, pdata);
+	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->capture_formats[0];
 		f->fmt.pix.pixelformat = fmt->fourcc;
@@ -570,7 +565,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 
-	fmt = mtk_venc_find_format(f, pdata);
+	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->output_formats[0];
 		f->fmt.pix.pixelformat = fmt->fourcc;
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
