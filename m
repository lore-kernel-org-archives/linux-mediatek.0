Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805F0C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2732C64EFA
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2732C64EFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nt0aEC5RhAoJsXjbhslEzOI/hoJzrTSgGzo3nqYaFj4=; b=CJyK2x1XuvZ9dMYWDaDQ70kEV
	Qe3/WSJCwv0J3Bvq2gii1JHeakMgYJmzieECJeIh3I1800KxhxMTyArfO6WpjXrI8sIo4oR/ERxdh
	1vvDIh40EGcgd5XfBDGrFfPbtSgtn+FIklmbhPY7oix4zYqEG2Vz8ch+st//XG0dPdPDGVKA/V3kz
	utCVZPXsNoAdJ+32PjG7xhaKaTnMl8/9lruqZxFmnmd4Id9aCFez0ZNnnS3bMCFtcUAwlGi4rdxHw
	QwCbSIRIvdnXRkw8UXT3bUisI8vaISlkzZNj9N/MmkzUfoDy/AtBT83PtJmvHHdiys37KCL2aa6YI
	TQKe8Ib8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZxK-00088v-D5; Fri, 26 Feb 2021 10:02:42 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZxF-00082z-7A
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:38 +0000
Received: by mail-pg1-x52b.google.com with SMTP id g4so5946475pgj.0
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gJgvh0R1fbIgxse7gyq7HYcHWSSI9BRuWoAHbwnFZ7Y=;
 b=Cdnesy/S9Vewg8GbUNKD9HO7UJ5yWGwu5vDSGKyM7jSprc9wI/rmNMgQAXgoZ9OyfR
 221Of6Jf+Stja0LgBMQKyXxe5OrVYxLlLU2Qbqkzw8LODZO6hjXvnC7EqQxWbOjPzvFd
 O9e275ShxITllS7UbtqMV+fyMXeb7OI+GpnK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gJgvh0R1fbIgxse7gyq7HYcHWSSI9BRuWoAHbwnFZ7Y=;
 b=o85rUoQ4dPgz3Nqnehyk65X/rk/KON/7tegNlzJ2LNX+uan8o5OaZgJmaBTL+YXPnr
 BHktMhmKBpd7FU/1ICCFaZShPAC6c3cX4jgP8cuJESJw9XlyPLGNnWnOl5OEiuAxA8fT
 6Z5tyH+8TzxPuMzHjNpdsAX4HTPjSWOiIh44h2M/JTB0f8odRLFsqnt9Vai9ohhQXkNi
 m1Y8LCi3mPhMJZqX8sIao6iLPxbgatYaeWgD2u3fFqwubVWpPmjLZqyQz/QLz+5nzvv4
 Lx30RMuqCMNI3+LgYf6Whynw4vQWvoaNYnmbZ2IzhpaPvpA7N0j6EeGOLlfmhgol6j9B
 R8iw==
X-Gm-Message-State: AOAM531DfbC+prvrnJ6PzOFNqhFZw+alHthzBBVdz6FwxJoquy4GTGMF
 vSlCMiZTOQ2Zqu9cj8HH0f1xnw==
X-Google-Smtp-Source: ABdhPJwvhjb42g7FGahErDy7BbkM/Vo0fpcgW4EgznivAahJnVQA/d8Q+hv7py1rzJupdV9aJzzCYg==
X-Received: by 2002:a63:4761:: with SMTP id w33mr2284778pgk.118.1614333755035; 
 Fri, 26 Feb 2021 02:02:35 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:34 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 12/15] media: mtk-vcodec: vdec: clamp OUTPUT resolution to
 hardware limits
Date: Fri, 26 Feb 2021 19:01:45 +0900
Message-Id: <20210226100148.1663389-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050237_408967_92827BD7 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Calling S_FMT or TRY_FMT on the OUTPUT queue should adjust the
resolution to the limits supported by the hardware. Until now this was
only done on the CAPTURE queue, which could make clients believe that
unsupported resolutions can be used when they set the coded size on the
OUTPUT queue.

In the case of the stateless decoder, the problem was even bigger since
subsequently calling G_FMT on the CAPTURE queue would result in the
unclamped resolution being returned, further inducing the client into
error.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 8bcff0b3626e..209ccf3d2d67 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -223,19 +223,19 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
+	pix_fmt_mp->width = clamp(pix_fmt_mp->width,
+				MTK_VDEC_MIN_W,
+				MTK_VDEC_MAX_W);
+	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
+				MTK_VDEC_MIN_H,
+				MTK_VDEC_MAX_H);
+
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		pix_fmt_mp->num_planes = 1;
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
 
-		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
-					MTK_VDEC_MIN_H,
-					MTK_VDEC_MAX_H);
-		pix_fmt_mp->width = clamp(pix_fmt_mp->width,
-					MTK_VDEC_MIN_W,
-					MTK_VDEC_MAX_W);
-
 		/*
 		 * Find next closer width align 64, heign align 64, size align
 		 * 64 rectangle
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
