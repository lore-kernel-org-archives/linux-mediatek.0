Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F2AC43462
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3CE6135A
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA3CE6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5jSbDIOiPBNnnxsiN8H9M9tpXAIpUWBVYp0hO8ruRF8=; b=GrVXpNnAE+gANYOW+Lpf+ln2g
	T7fwrvsCTZqprM4vrg7VUWge3PtEMaAB0YfHoazT7goqu9fNR9+RVMTHVZ6F6vQm+aF/r0oxwQp+t
	8ZznjXNhBCrnR3+cnf/FTv2fL8ss5VPt4KxKRpBe35/KSkt+9dK6/HCSLexZzBYvb+RdN62X9qQDy
	nIm4iNPTWXuVF5u8ixy6Fx7ShWJ2g6xo5KIbkPIAbGhNHrl7YV2S0cPgEK5PHRNitBsrxNrz9qWTX
	PywpymzKQ3XZipmu55UwGwILKAtKJ5ZH5hXKijrST900x7WjiWoZzd0FZOxrEkFxtHQq4nZCA75a5
	tqlm86NSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNDn-004Gfj-NE; Wed, 19 May 2021 14:30:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDl-004Gei-2W
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6kfOa099pLULt6jl0OFN8u1UODEiizY8ZTmqttw30oY=; b=h68v3H8JgSCE9Ov/+vhz6dw0KN
 3haTPTIJ8wbfBmdo6HdsIM0xNCA79uTB2KBOthA124dPGZnANUOywcZA3Fpncu6thdSTdC7ddtDBf
 wrKXxrkA1fufH5JxZXi/XxQBgePI07Nssp3LhiVNy2J+42Vqq1RTGM64dj3/XxkViYMjyE0WHjuUA
 M6XfrjhOmsJ+Yuy4/PPVyzn4BF0gOYnkKwHLfXnTE+Omrrba/LxYV2H7bz28jYpYCi4WhdLvC9/wb
 /fPk+IF413F+aaeLK7giAW1k9CnsJ74ZHKJ6UMjAjGcGzySi4f4wD3j4n8UcSr63yeNgB9nNPKGJ6
 VZrTx8qQ==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDi-00FXoa-JW
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:30:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id f22so1654854pfn.0
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6kfOa099pLULt6jl0OFN8u1UODEiizY8ZTmqttw30oY=;
 b=YYJFq2dgWieXlD+hnduTh0WtZyYeZa2EiPeTpa57lwQx9mTGzA66B6NQbzCbtqWUL9
 ZaZgHHENzsJ0sk17VTO6z5PDzEw/YKN4yBDtnWhcJkNm320t/00ciQPP/0RXOtEHC8yU
 Q+dm28F+rxbG953RMEJ0ptfP9zNQdFsJklcqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kfOa099pLULt6jl0OFN8u1UODEiizY8ZTmqttw30oY=;
 b=dCcYf744462bt82IXUvgzQnRwn9Cp4cPk6ytvt/D2KRDj9hjdAHfyMFAdLJidgE0vb
 cFJn0Bi1JgY4YGSxFQXjPCzagxYIth3RpagmznEbCfMw4S/LMZuACCRG5zNwaF0y6/qR
 NaON6WeepqIfU2IOSXYsKkEsbCkFHgrXZXJXVGlZRVACtnE9wXJH6iJ8+tI2Njmz/c2w
 wUgGRCixeRkPBZL0qS3uzudx5G4ALJ5ZOLgQjxkJajfLlgI8hoe2ZxttL4CbMpGJ73iX
 iHzfHq2XA4gG488OLX1WXw//J+zdmww34D02y67kcnUvjFIz31hpPC6zvdyPqFH6EUlY
 ax0w==
X-Gm-Message-State: AOAM532NPjwydpDhifGm00KGTaXa16tRMhYqaDHifuXcKGZwrem8/NfK
 2a+soTqGTXGqhmT2Ut4AS9X1BA==
X-Google-Smtp-Source: ABdhPJx1JoTLdOlAqO91SpwdnBsgYrywh1y4pWh6k1KrKQ93xhy72ahDDweSpIwRMcOnbAGct9eP6w==
X-Received: by 2002:a63:7e13:: with SMTP id z19mr11116767pgc.184.1621434645624; 
 Wed, 19 May 2021 07:30:45 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:87ab:ff82:1544:697])
 by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:30:45 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 03/14] media: mtk-vcodec: vdec: clamp OUTPUT resolution to
 hardware limits
Date: Wed, 19 May 2021 23:30:00 +0900
Message-Id: <20210519143011.1175546-4-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_073046_654182_2296CC18 
X-CRM114-Status: GOOD (  14.32  )
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
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 1a633b485a69..58e521096b94 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -649,19 +649,19 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
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
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
