Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5637DCCA473
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2+1y0LCJVkrfpHsQlRGxEvdnIAFt/zhTxrdy/ouAhU=; b=NLsXoIKDQGwzFoIaVenSYddYJ4
	SI+Ev1SPTdNT9MR29cVveXzwbBxwXHwF7rRXzmwFXBJVSVdj0g8h+OPa5kOBPX6Mkhrn7nUh4Qusn
	pWcclcCe6la6NN8whk2yNFiSxRs0cKXVm9KDgy3bBS+TmqjcpTxqyGc+lUm3zK5r6sAABPmVpbZ2J
	xvDKv7yMCX4ps1jKBL1HiP4diH/sj2cCte3ggrVWlZluNEn07H/ZidPd67ogJ5evoUR2z4SNBrMFD
	29wRzdZCtRzEj3tUNBvt4F5FtUjj9f4WFw8kTQ/YmAYugi9WHEtThVEf6V90MNipUsJVfAm7yV/jm
	3f6bUj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mrg-000Te9-HA; Mon, 27 Jun 2022 11:25:12 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mrb-000TXu-7Z
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 11:25:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so12108441pjl.5
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 04:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D2+1y0LCJVkrfpHsQlRGxEvdnIAFt/zhTxrdy/ouAhU=;
        b=FRaInAGaTCaXwvPDQiOiybyVs1ZTq7aqp376IA6xTXMeo48fL1QiC0oNsa5/HetL55
         9HUHwrtKWYZ1Pn3nxng6Lr66Ut1zka2dTP94nT+yTufd+icL2WJ59mHZ/iaNZK4dkxE7
         7+g5zJGUIdsmMd22pGGmiLmu4Xk3PdkamGcOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D2+1y0LCJVkrfpHsQlRGxEvdnIAFt/zhTxrdy/ouAhU=;
        b=oD82HG632NQo1HeYlTBSNOG6+flYcNebNmWye4DxEcYISiK46R5vOx+Q4nigSwMAXk
         ST4M7ivoo3hsJpAdrloWGO/qRh/AvHqcTHZ6fmjl/bSo1QnyHZUv7ohZXrOXcXMJ3syl
         dBA6Xi8Y7z6QKihVJr95vJZ/DnPxHAsY85suHDU7kvejYudUMEYTc6muFos3lgvpbmo6
         RyYhAFD1JY5AZc4hkw/MIbDsGgj9ZLLIM7p+NEq1XcAiwE53Y6ZijaRgFotwWj+uZDAg
         0B6c/YOT6D4xXuoQEuRt75Qty7ZK25ghM5MmuNQnhCiYvuDBZUjQUo1jImW7gTrMSqU8
         rsOg==
X-Gm-Message-State: AJIora9Dnyv1wZOH8AQKZcLT/cFTbzsh1xdk8q2dfyJ3b3teaDu/AuaE
	8nWw38agcUKbJdN6QJSZX4XT6w==
X-Google-Smtp-Source: AGRyM1vq1tIU8x5lkBrW/7ilQI/Txpt0kSZaL6oXEJkTV+khkTTmLOcOfrxjLLVXkYCHw9PaRKrIdA==
X-Received: by 2002:a17:902:c2c6:b0:168:d8ce:90b2 with SMTP id c6-20020a170902c2c600b00168d8ce90b2mr14451592pla.110.1656329105228;
        Mon, 27 Jun 2022 04:25:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2dc1:c31b:b5ed:f3aa])
        by smtp.gmail.com with ESMTPSA id lj4-20020a17090b344400b001ece32cbec9sm9246889pjb.24.2022.06.27.04.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:25:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 3/4] media: mediatek: vcodec: dec: Fix resolution clamping in TRY_FMT
Date: Mon, 27 Jun 2022 19:24:01 +0800
Message-Id: <20220627112402.2332046-4-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220627112402.2332046-1-wenst@chromium.org>
References: <20220627112402.2332046-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_042507_311820_250194F1 
X-CRM114-Status: GOOD (  16.25  )
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

In commit b018be06f3c7 ("media: mediatek: vcodec: Read max resolution
from dec_capability"), TRY_FMT clamps the resolution to the maximum
that was previously set either by default 1080p or the limit set by a
previous S_FMT call. This does not make sense when doing TRY_FMT for
the output side, which may have different capabilities.

Instead, for the output side, find the maximum resolution based on the
pixel format requested. For the capture side, continue to use the
maximum resolution set by default or by a previous S_FMT call.

The maximum resolution is found from the list of per-format frame
sizes, so the patch "media: mediatek: vcodec: dec: Fix 4K frame size
enumeration" is needed.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index f1b82d4c5be5..ea951cb3b927 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -282,13 +282,29 @@ static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
 			  const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
+	unsigned int max_width, max_height;
+	int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		max_width = MTK_VDEC_MAX_W;
+		max_height = MTK_VDEC_MAX_H;
+		for (i = 0; i < *dec_pdata->num_framesizes; ++i)
+			if (f->fmt.pix_mp.pixelformat == dec_pdata->vdec_framesizes[i].fourcc) {
+				max_width = dec_pdata->vdec_framesizes[i].stepwise.max_width;
+				max_height = dec_pdata->vdec_framesizes[i].stepwise.max_height;
+			}
+	} else {
+		max_width = ctx->max_width;
+		max_height = ctx->max_height;
+	}
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
 	pix_fmt_mp->width =
-		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, ctx->max_width);
+		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, max_width);
 	pix_fmt_mp->height =
-		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, ctx->max_height);
+		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, max_height);
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
@@ -306,16 +322,16 @@ static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
 		tmp_h = pix_fmt_mp->height;
 		v4l_bound_align_image(&pix_fmt_mp->width,
 					MTK_VDEC_MIN_W,
-					ctx->max_width, 6,
+					max_width, 6,
 					&pix_fmt_mp->height,
 					MTK_VDEC_MIN_H,
-					ctx->max_height, 6, 9);
+					max_height, 6, 9);
 
 		if (pix_fmt_mp->width < tmp_w &&
-			(pix_fmt_mp->width + 64) <= ctx->max_width)
+			(pix_fmt_mp->width + 64) <= max_width)
 			pix_fmt_mp->width += 64;
 		if (pix_fmt_mp->height < tmp_h &&
-			(pix_fmt_mp->height + 64) <= ctx->max_height)
+			(pix_fmt_mp->height + 64) <= max_height)
 			pix_fmt_mp->height += 64;
 
 		mtk_v4l2_debug(0,
-- 
2.37.0.rc0.161.g10f37bed90-goog


