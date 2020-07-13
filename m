Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA75C4346B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EFD020791
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PKhT+B5z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KvjueiX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EFD020791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XsEoZ4gEWbv1avHCNWwgQZfH/kvB2YK0KSnM6xnYekQ=; b=PKhT+B5zjX/MOhgzIGgKFtBL8
	PHAxlmfHPqp3Lb5Xl0X4kXNgBo3vxxsPSCPr45tUa7Pj32jWAXeC3jKrWRJ2vccPsz30/G11R0iAJ
	YXo1z74JbEY3j6NtEazBvtFy8pPj1vc3MsKirnH6m93PtrsSoVgFm9rjoRz55Lrrtj6jmjrQergDm
	tD4ly+fkpyEV7AmksYY8I7Y82E7wM8qpfMziKsQeaMlcujQyfQ03LDk/s0pKO7hSAe66NCHg/Q2si
	0lDKlfIZyVG024U6CvmX8pHrpsxvrFgZPcvl84u+hmbVoRkJn61bqIFEAuJCi/YHQaT1ZI+hrOQHS
	3vSfTbfmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurf4-0000qv-4v; Mon, 13 Jul 2020 06:09:58 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurf1-0000nQ-Rm
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:09:56 +0000
Received: by mail-pl1-x642.google.com with SMTP id x11so5055372plo.7
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dIf/kbmDB8xe6X4lo4cpvvB2emLMAc7eYXhbCxEdg7A=;
 b=KvjueiX8a5M7s3DOVR4ub0g5vPoTlo1v0PFdNEE1FbjLLfEJDvO2nItXoNfgBA1n+c
 YD6uQYgUO0k7rfcU7MDnE/e+eZl7lWQaW5zrZdaRTkXnf/wRA56r6LD/PRSI3CpJqgtt
 Zp5Yjj+ERrihJzZWXHtTKO8i44u9M8aRl1eFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dIf/kbmDB8xe6X4lo4cpvvB2emLMAc7eYXhbCxEdg7A=;
 b=Pvu9PY7pHwRfj7xGyR5kKf1pNkxjnlUC4JOmjQw2L9YMIuuQEZXcoI7lafDv+0f/88
 PlaQFfLqQ8wPcx9lQFDOPwi33DEOKpcwDq4TqskzCgvj/GTt0TYxpazzguqg51q3Rzu5
 jk5JZd2OIg0EzvPNstZXUPbRbO0b+npoXftgVZAXfV746jgmAMIfCcprhTLx2PswuhCZ
 oKt1l1dpLWKH0QtZwRyetpHt/EuuyB49uUlX8f/hkpxyCFiLDi5g8g1U0Igg92FyLfeG
 1I15jmRFlCwPm2vSxx3h/unmuic4S6VDGq6gEQmoUrX+2WAS9zPPmc3InaqtkSn32oVP
 MiZw==
X-Gm-Message-State: AOAM531yT3VENAKtl5C2nNpNNdaw+ZjnmQBRgncXGV98rOrFckI8oL2i
 xF+217aMN6ZN9mdJAoNjApretg==
X-Google-Smtp-Source: ABdhPJyyNgcKwjr4YlNkGt0EkWZx1ghU0v4rcCtbtbVDVnNk7CIEc0d6/O+Z8WYcxD2E/rHe+eUL3A==
X-Received: by 2002:a17:90a:f996:: with SMTP id
 cq22mr19935477pjb.208.1594620593829; 
 Sun, 12 Jul 2020 23:09:53 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:53 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 14/16] media: mtk-vcodec: venc: support ENUM_FRAMESIZES on
 OUTPUT formats
Date: Mon, 13 Jul 2020 15:08:40 +0900
Message-Id: <20200713060842.471356-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_020956_018633_3B64D1B5 
X-CRM114-Status: GOOD (  14.74  )
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
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
