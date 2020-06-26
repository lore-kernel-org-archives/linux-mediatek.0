Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775FEC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 10:58:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 431EE206DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 10:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ruEoAdqP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Slagczj0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 431EE206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9C9h/UIorOWEHNlQXyBwUocZjMNwnxSMrv8g0B0MnIs=; b=ruEoAdqP0YN471VEN+wtHH7KM
	4umOqses2y3BSHkkxH6vXTUAqIBCJY8DHDplulKf7HYLVdSqS7NORVnWNxa9vHGkQHFVGIBuk8qz2
	zDdzSL623OCteGTlNIH95Ey7Jf0Lkq9C3SGNAkSunJ+XvYqwic+JmNemh7mCJ8/ksT/qj2RfB9/sD
	pbmBR383/U5XVT1/NN9ZaaxiYxOt9coQkyoEXNUIWGfl4xRKEMQsy6BdDoxplb9C+iWJMC3jhtot9
	qte0ZWBskJGe78Ws9xnZKA6ocynNebc0U42FAzeZ1uWFMaqvt1IO3IigChBo8YoOChRWQLQoDpXRE
	Qmk29RqLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jom3n-0000RY-3y; Fri, 26 Jun 2020 10:58:19 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jom3k-0000QW-Pn
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 10:58:17 +0000
Received: by mail-oi1-x241.google.com with SMTP id x83so130386oif.10
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 03:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWY5ln+C0L5OKLhUHNQQA4fWR9u7spTeGdlwWwYsNjU=;
 b=Slagczj0xrrOFm1MOfsX8roJrvclPrrdjO/KQF5e43edEdSHjpLmgtD7EMUFLumA2p
 F+NlibBwsDg954zvFK2IjotKSpE3+XXnK7Swg5QkeeEPHXz1+LeywZXNegqeBuIOE8mS
 sFFhGb0+UxEkvs5krTXfHTBFTFRqmyUjqw5LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TWY5ln+C0L5OKLhUHNQQA4fWR9u7spTeGdlwWwYsNjU=;
 b=hc5bdlHmPeP05++VDrFUBlPnLdxuU/OdhgQtCv571bioj7mvb/QnVICzqgdqrIQKEA
 vcaYYBgvyhxo4yFcvilDG7KOqvj34YwE77SVyE11duX8himdDtTCg0jDz46P/ytoiy8h
 LuOvEj9J0qu4OheFbXklDT4hHglq8O/hA0HjPeN/v3IdummQ9pqePMuJow5rl+s5Y3uo
 OIcuS2I+vpddpNpU7ZfxS/0R1l0+4VKhgsd+1onHkvyp4d+IUHOMr/PTVUF0xyQLK2Th
 uiGlnqE3ywMKoli7+uapE9b57WGLTSMgNqafpeJTLNnA1Z+1dhu+cb5Czl6MHsmgZ/Xk
 Ps3Q==
X-Gm-Message-State: AOAM532kfzTynnOFR1qqR5qcJImQgj5xBpS1oqUNXD3tFFoCIWcw1o+A
 JBs2jF9yBhG5KrzzIopDfwEVnQ1K28SN0w==
X-Google-Smtp-Source: ABdhPJzB6OS4MIy7FxYEhNxsUaXWLmhNbV7pXZcQs36M9K67HYVXmMOT1RHeGGDakRBrYaHMcAgM2Q==
X-Received: by 2002:a17:90a:4f4b:: with SMTP id
 w11mr2172580pjl.11.1593158771591; 
 Fri, 26 Jun 2020 01:06:11 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:06:10 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 13/18] media: mtk-vcodec: venc: use platform data for
 ENUM_FRAMESIZES
Date: Fri, 26 Jun 2020 17:04:37 +0900
Message-Id: <20200626080442.292309-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

vidioc_enum_framesizes() assumes that all encoders support H.264 and VP8,
which is not necessarily true and requires to duplicate information about
the supported codecs which is already stored in the platform data.

Fix this by referring to the platform data to find out whether a given
format is supported. Since the supported sizes are all the same
regardless of the format, we can then return a copy of a static value if
the format is supported.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 24 ++++++++-----------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 1a981d842c19..f8d4fbe927f9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -26,17 +26,9 @@
 
 static void mtk_venc_worker(struct work_struct *work);
 
-static const struct mtk_codec_framesizes mtk_venc_framesizes[] = {
-	{
-		.fourcc	= V4L2_PIX_FMT_H264,
-		.stepwise = { MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
-			      MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16 },
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_VP8,
-		.stepwise = { MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
-			      MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16 },
-	},
+static const struct v4l2_frmsize_stepwise mtk_venc_framesizes = {
+	MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
+	MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16,
 };
 
 #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_venc_framesizes)
@@ -134,17 +126,21 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f,
 static int vidioc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
+	const struct mtk_vcodec_enc_pdata *pdata =
+		fh_to_ctx(fh)->dev->venc_pdata;
 	int i = 0;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	for (i = 0; i < NUM_SUPPORTED_FRAMESIZE; ++i) {
-		if (fsize->pixel_format != mtk_venc_framesizes[i].fourcc)
+	for (i = 0; i < pdata->num_capture_formats; ++i) {
+		const struct mtk_video_fmt *fmt = &pdata->capture_formats[i];
+
+		if (fsize->pixel_format != fmt->fourcc)
 			continue;
 
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-		fsize->stepwise = mtk_venc_framesizes[i].stepwise;
+		fsize->stepwise = mtk_venc_framesizes;
 		return 0;
 	}
 
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
