Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598B5C07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23BBC613C9
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23BBC613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnOViPodbadNlFWMl3gxXI6g7/oP6Owe3dfXAIQborw=; b=JM9/YwFoGTI5lC
	qzHuyUKSOnSgAqoPHvAuRyLsKOkTjApXK4l9Wl5k5SMeCx8eQdiilDPh7a/PQ7aj4t0yrpEVtjeza
	vi7sWZM8FeFLDe70Zn1wwwh1Otf3H85HZ2zapK+pIingmxFkJMi2iTayb8GSerDBDTxHVa1OOBhb1
	BmFqS1lc+Z4hDv5wPMs8rLIUCSe/yLaUX4pVXTdSffhFY5lgzbNYNwAuQdD05SMKF2lt1WT2h5+Ym
	BHCjZqBd6634cE6R/5NjCik3lQ2iSiJMDPCoOuW/PQBIYBV9SThUZHKD+A/txS3Ac210a+zMNOfXn
	gMTKKFeBlh/j6NhRWRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HEa-007qKH-8o; Mon, 05 Jul 2021 05:33:32 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HEX-007qIb-R0
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:33:31 +0000
Received: by mail-pg1-x535.google.com with SMTP id a2so17254631pgi.6
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ty0kyhtWCmc/mJ/gYFroekO5s9jDb3eEISEoLmjArWs=;
 b=IHt5LDTkxbU+zn0VJVhNdjIFM5RDmyGy+Er+nhVpv5o8L/UVrWhzeboTNv6DrlD9C4
 ZYGhOp59nzlOy2KjGuvoLzudSmcIBVAwox69Xdo1bXWPYjLnZfhxQ380dUF5TjNq1G+R
 2ZuikQHoBZv3UbEV3kmf0dZKIHfw5SGf3/5XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ty0kyhtWCmc/mJ/gYFroekO5s9jDb3eEISEoLmjArWs=;
 b=JNTL1EYAcHI942Erd7IKEo0a83Gitqccba5IXriVHYvy7ZrWkNalR9yVrlYOceVKqs
 fpHXkAElxfmNqI00Mqm0MRxAXQ36kyfBGZm20/MxDVYeZyr5B0Cf8dAll2UQbDrIlqUA
 i5jTbFgBhEyj2Ui/4A+qamGIT5dnYteHsLHmcTsp3P9y3Lb3wO9VsfiU82CCY7ay2Udi
 VDoc9h6MSS/px6ILEQVD8DwO4aiv2pSltTr6NTco812BiWZqZ+mopLfbJ1tWm9gkLoE/
 489luSjuKtIiCp31gkJ/fTw6gAN8PloUGHOHLcz8SuMjf4KcjzFJI+GTmfEOJNDFZHIs
 +KnA==
X-Gm-Message-State: AOAM533Qz1s9QHOD1Qku1G0qICS8FjnZnuLISfL9WaasOH+Li8Vct+IN
 nbsf6v7THZ4CyF4GZAIr/QbdBQ==
X-Google-Smtp-Source: ABdhPJxxdPRgp0ZkFWtVg8aX6w6dCuR/4nXM7ru9x489Z7hrvm+B5DFHfvBzYokCC0BlyOVKXsAEAg==
X-Received: by 2002:a62:7c43:0:b029:320:e367:13b0 with SMTP id
 x64-20020a627c430000b0290320e36713b0mr1397541pfc.18.1625463209164; 
 Sun, 04 Jul 2021 22:33:29 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:33:28 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 03/14] media: mtk-vcodec: vdec: clamp OUTPUT resolution to
 hardware limits
Date: Mon,  5 Jul 2021 14:32:47 +0900
Message-Id: <20210705053258.1614177-4-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223329_917859_32C97448 
X-CRM114-Status: GOOD (  13.62  )
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
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 1a633b485a69..16e057f73789 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -649,19 +649,17 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 	pix_fmt_mp->field = V4L2_FIELD_NONE;
 
+	pix_fmt_mp->width =
+		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, MTK_VDEC_MAX_W);
+	pix_fmt_mp->height =
+		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, MTK_VDEC_MAX_H);
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
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
