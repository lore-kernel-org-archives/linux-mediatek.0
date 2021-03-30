Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0557FC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 22:15:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3F2619B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 22:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3F2619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AWTLnG7QfaywO4Y2zhQBh+5spGCTDA5zg3l9Lf3in7I=; b=JrOPS/iZ8qUVK9Awzc/aVuYvbV
	K+PptMaGUOUdxVY0Q29P8mvvfUWAJe+1DAwbwjfW9Faw3cQIVRJ6XoKMQH8OoZvMtTb+riFOVrhj2
	gEKFQBTdKACYfzh4gVXij+zDUY9LcRHSAccmWZslhrVIjEuuQvzXtmcUlOvfEmgGodgz88BNw8LoK
	XmCTMNNrEM45Z5CoiBNcht0qzNULo2WzPMUxLCW+t7ZOsrbmilY8NOk+vqYSFYw+CGdbihplg3I7m
	kqou0zjXwtKIqeZLvK+vKhHKo4ClC/Ky2cte+0dQ1Tgipgcdq9hzkpLc4fH785LHXC8BPw1bzZGb4
	ZH+sCVjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRMds-004zdK-66; Tue, 30 Mar 2021 22:15:20 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRMdo-004zcW-HE
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 22:15:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id ha17so8482653pjb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEJVo99ddrzFsx+Y7vim0XaXbjg0vh0wW249qitilJc=;
 b=meUgQ8XuuGX2w/BSIG4Hz4EF7XC9+2efqf9gHbw/McANGT1S0Z0TwooXm0EwVoeeC9
 VE8+hDP4ClO6laZGUWRq3SVtNUY/kdGhkrNvjHfnz4qTguvnPvdB9sio+aLJYHTz63na
 0F//yTUTwk/POk31IhOjDpQm/II1tGnLMgLPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEJVo99ddrzFsx+Y7vim0XaXbjg0vh0wW249qitilJc=;
 b=Zcqw10P0Xg6q6p+JEcBe9wa0ndQbdt2RtM1BMYRezKFnpISuuai2tsa3Z22DugTFg4
 /ZzjhpUKic6Mby8PAFUKNmuLUE/kJ0+QVDxD1sdYY5G4olJ00zPK0VBFk4Y1Kt0QvKOg
 fVnUMbn7X5MYfRo0YKUI69hUY7jRqCp4Fh1DYb9KyUcBbeo0VaifSfwo9edNQMC4p6TW
 2RrVxQdUvT8Zz6qHDTclSqnKdZ1HUe3Xz8WkCMRvyWOtRhX/9P2MuKLF7U939nHHIZjZ
 MmE4y5yx8CKVZaxJMxiFYHckeTtdktlzPBJm985i5f483mmzLMjeuzxzaLJlHMb8H4Ol
 e/rQ==
X-Gm-Message-State: AOAM530XC2IhRtzr+NOlSB7Sp79QWrfuyi4VH6R7erlvle76Y2JAQUog
 QywlCRIQfZVLGTmVQqKc2AxtLQ==
X-Google-Smtp-Source: ABdhPJwNoj3YqVLpIvr86EesTfK7j0NfYhZD74Zo1vS33U/TjjIPnrqrAU2LRkP5QexaxBFNGQ6mcQ==
X-Received: by 2002:a17:90a:8b07:: with SMTP id y7mr439343pjn.78.1617142514280; 
 Tue, 30 Mar 2021 15:15:14 -0700 (PDT)
Received: from localhost (201.59.83.34.bc.googleusercontent.com.
 [34.83.59.201])
 by smtp.gmail.com with UTF8SMTPSA id q66sm124518pja.27.2021.03.30.15.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 15:15:13 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, tiffany.lin@mediatek.com,
 acourbot@chromium.org
Cc: Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH] media: mtk-vcodec: vdec: Reduce padding in VIDIOC_TRY_FMT
Date: Tue, 30 Mar 2021 22:15:06 +0000
Message-Id: <20210330221506.2278606-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_231517_064156_0CD393C0 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If the header has been parsed or the codec is stateless
reduce the padding of the decoded frame.
In stateless codecs width and height are specified by
the application.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 59 ++++++++++++-------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 56d86e59421e..9c88454dc10c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -653,7 +653,7 @@ static int vidioc_vdec_subscribe_evt(struct v4l2_fh *fh,
 	}
 }
 
-static int vidioc_try_fmt(struct v4l2_format *f,
+static int vidioc_try_fmt(struct v4l2_format *f, void *priv,
 			  const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
@@ -665,6 +665,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
+		struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 
 		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
 					MTK_VDEC_MIN_H,
@@ -673,27 +674,45 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 					MTK_VDEC_MIN_W,
 					MTK_VDEC_MAX_W);
 
+		tmp_w = pix_fmt_mp->width;
+		tmp_h = pix_fmt_mp->height;
+
+		if (ctx->dev->vdec_pdata->uses_stateless_api ||
+			ctx->state >= MTK_STATE_HEADER) {
+			v4l_bound_align_image(&pix_fmt_mp->width,
+						MTK_VDEC_MIN_W,
+						MTK_VDEC_MAX_W, 4,
+						&pix_fmt_mp->height,
+						MTK_VDEC_MIN_H,
+						MTK_VDEC_MAX_H, 5, 6);
+
+			if (pix_fmt_mp->width < tmp_w &&
+				(pix_fmt_mp->width + 16) <= MTK_VDEC_MAX_W)
+				pix_fmt_mp->width += 16;
+			if (pix_fmt_mp->height < tmp_h &&
+				(pix_fmt_mp->height + 32) <= MTK_VDEC_MAX_H)
+				pix_fmt_mp->height += 32;
+		} else {
 		/*
-		 * Find next closer width align 64, heign align 64, size align
+		 * Find next closer width align 64, height align 64, size align
 		 * 64 rectangle
 		 * Note: This only get default value, the real HW needed value
 		 *       only available when ctx in MTK_STATE_HEADER state
 		 */
-		tmp_w = pix_fmt_mp->width;
-		tmp_h = pix_fmt_mp->height;
-		v4l_bound_align_image(&pix_fmt_mp->width,
-					MTK_VDEC_MIN_W,
-					MTK_VDEC_MAX_W, 6,
-					&pix_fmt_mp->height,
-					MTK_VDEC_MIN_H,
-					MTK_VDEC_MAX_H, 6, 9);
-
-		if (pix_fmt_mp->width < tmp_w &&
-			(pix_fmt_mp->width + 64) <= MTK_VDEC_MAX_W)
-			pix_fmt_mp->width += 64;
-		if (pix_fmt_mp->height < tmp_h &&
-			(pix_fmt_mp->height + 64) <= MTK_VDEC_MAX_H)
-			pix_fmt_mp->height += 64;
+			v4l_bound_align_image(&pix_fmt_mp->width,
+						MTK_VDEC_MIN_W,
+						MTK_VDEC_MAX_W, 6,
+						&pix_fmt_mp->height,
+						MTK_VDEC_MIN_H,
+						MTK_VDEC_MAX_H, 6, 9);
+
+			if (pix_fmt_mp->width < tmp_w &&
+				(pix_fmt_mp->width + 64) <= MTK_VDEC_MAX_W)
+				pix_fmt_mp->width += 64;
+			if (pix_fmt_mp->height < tmp_h &&
+				(pix_fmt_mp->height + 64) <= MTK_VDEC_MAX_H)
+				pix_fmt_mp->height += 64;
+		}
 
 		mtk_v4l2_debug(0,
 			"before resize width=%d, height=%d, after resize width=%d, height=%d, sizeimage=%d",
@@ -729,7 +748,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 		fmt = mtk_vdec_find_format(f);
 	}
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(f, priv, fmt);
 }
 
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
@@ -749,7 +768,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(f, priv, fmt);
 }
 
 static int vidioc_vdec_g_selection(struct file *file, void *priv,
@@ -875,7 +894,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		return -EINVAL;
 
 	q_data->fmt = fmt;
-	vidioc_try_fmt(f, q_data->fmt);
+	vidioc_try_fmt(f, priv, q_data->fmt);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		q_data->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
 		q_data->coded_width = pix_mp->width;
-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
