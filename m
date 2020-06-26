Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88A1C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:27:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9716920724
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WuTtslpQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uBzG0iss";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BViNojs9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9716920724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AKl+SKz+vy5W4SmnQBXdeMVgptJz0fEHVli3Xxfyw/I=; b=WuTtslpQ0YSFR/fgvIQk3DIH1
	89X+yds7yFSqx/NvemGbLEV0F53MdHEDAgRpY4YSAa/uETmJnPVVwf84KK3wMkZDFMOp/gNmjpRQ8
	WVmcuXvgJgw4cjBkbMddxEinwkuMeliji8ISBe/QvQG2y9DNh5VTYGILLxaRz/92EwJQoUVZjF0Ox
	tmxMmRDrwR3RqjMxs4ZGVcwQ/sZ1uOIi2VqBVUDWYSqhaGHKC7oryJIebgwpekyOBRWmCrDaJY7rj
	2EtF1aO0QHvo2ap+zhdfsQH9IsIwEI5HhawLZSjIXYPseM0ESv39VKydeKsLyM9wT3tDYsrp4zKH3
	Y5qehvd5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomVY-0002jb-Qk; Fri, 26 Jun 2020 11:27:01 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolFC-0000hS-0Y
 for linux-mediatek@merlin.infradead.org; Fri, 26 Jun 2020 10:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=evtrCYHSdHnuBRytP/f+jrOFkvug6jATLmDqRSZ+8hQ=; b=uBzG0issN+Hcz1WhwhWr9rnF8A
 L2dU2pZUBrVp5Cc2U/QnvVKh0p1fwbIg5wlRoOD2sxT2aySSE2NidnxDf26TazCZSocbU14WsjGe6
 C0SqA+iuRHqATqI2xtDa/r9vTZf289/JBqmM+ltastSZcmgaA4yS4OIRiqlecddr/lbH+4zsarAuH
 lE+Ksz1clLhE3ttzWgOl4M3FulXPKpCP0e+Ynki01T7xTaU7As53IIDyohTwJ8YAR7M7dt6uMlVSe
 gGm3/ALueO9YHZIUpoSfT0ZmYyHMOCPhZfKBZmwBsw3PI9P3Q+/vIvTFCn5Aq54hSfXSeI36tuIVS
 PUeb/9Kg==;
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joksV-0005fj-QT
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 09:42:59 +0000
Received: by mail-io1-xd41.google.com with SMTP id e64so4191002iof.12
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=evtrCYHSdHnuBRytP/f+jrOFkvug6jATLmDqRSZ+8hQ=;
 b=BViNojs9YIai+UQ26YKPc1Gyi2EqGuh9US29Lyjnq64nTD6Sua6s9TpttvyM1p5+dg
 gOdYTif5UB5tXvI4hchPwtbdMKFdasEtaf6vn6DfmMHoafNdsnsxn2toJUNy5G6Umv4Q
 ULDjoAXmqcURsZh3Knw87m5QS0qnUjJgQzs+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=evtrCYHSdHnuBRytP/f+jrOFkvug6jATLmDqRSZ+8hQ=;
 b=EwdoLBWwibb+s13tUXKqKgYBusi40TT8YwE/an0VLEl3cEUUoy/OhHLV/dmafTs/M6
 3mnT8DPijR2yr05JXWl8SR5xMdPuXdIPrW2g4WRBpkJx485qzy2JH2PpdQHaBZctH7Lt
 TX0xTxzpinheo6Hx5WxnXmsZVCULAkBbU27ZSD9rvU2mXvE63XPhukI8qy9A9xwqVghX
 TxjgOMnoxSkswvc+RY5gO50CwYAJnrLMqtDiVWFYEEGqi68qmaWRIbUd2HqMqpJAlLvf
 BgGlx9lxVeHe+uCR9qOPyCMW+xaRruzRZZQEqfSRCeif3SQ+KkUdp1nmAvIRIiWqw5VF
 7ACA==
X-Gm-Message-State: AOAM530tkrbBSUnJY9JOEXxIGd/SGg7fuXr/vwl9VHfKLM45hGj8NMpi
 Jx4JYMCA3KLepdORfmymj7K3bhbpq2pB6w==
X-Google-Smtp-Source: ABdhPJy3zAAopqxOej7DoxBkHLfq5ZCjDR98UaQJgPW5fCnUtFw9ztF6Gjw128Pr5KHLMZEmeWmYCw==
X-Received: by 2002:a65:6089:: with SMTP id t9mr1726244pgu.236.1593158786871; 
 Fri, 26 Jun 2020 01:06:26 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:06:26 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 18/18] media: mtk-vcodec: venc: fix invalid time per frame
 in S_PARM
Date: Fri, 26 Jun 2020 17:04:42 +0900
Message-Id: <20200626080442.292309-19-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_104236_216086_974A0F46 
X-CRM114-Status: GOOD (  13.16  )
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

v4l2-compliance expects the driver to adjust the time per frame if it is
invalid (numerator or denominator set to 0). Adjust it to the default
value in these cases.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index c9756a4748ef..1b4be2493aa5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -201,14 +201,18 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct v4l2_fract *timeperframe = &a->parm.output.timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return -ENOTTY;
 
-	ctx->enc_params.framerate_num =
-			a->parm.output.timeperframe.denominator;
-	ctx->enc_params.framerate_denom =
-			a->parm.output.timeperframe.numerator;
+	if (timeperframe->numerator == 0 || timeperframe->denominator == 0) {
+		timeperframe->numerator = MTK_DEFAULT_FRAMERATE_NUM;
+		timeperframe->denominator = MTK_DEFAULT_FRAMERATE_DENOM;
+	}
+
+	ctx->enc_params.framerate_num = timeperframe->denominator;
+	ctx->enc_params.framerate_denom = timeperframe->numerator;
 	ctx->param_change |= MTK_ENCODE_PARAM_FRAMERATE;
 
 	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
