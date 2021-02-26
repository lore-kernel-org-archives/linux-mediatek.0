Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BB4C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4188964ED5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4188964ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MstUpmwUheTnNkW1xPytAqd3j3y7EqoziR0zJsuKWhQ=; b=2AmKjXn3/TYnYgYCh0wOKrNmf
	h1iXxsEsJl6gKZiFkvLBNhv1oJ0MnR+pc2Ywq5AYULuOVsWeGw0OwrpTw9CepzziP0Ycu+dXXQ5Hy
	Mb61GzqtKh3shiyxpakpuMB3QI+zEgTHPVjXpTnwoKh/mVwuhUszv+D8xxKIxBksfBe7IEKHzZjxR
	14jPSyZ2a9dYa3RapS+SIS8ZyTnepuDuzZmD28sAx0W9DbcbI8StSJZxBRB+pEZjaRGW6ewoVELxM
	/TZ/hE5UYRL/zqM0uriG64tGDvrEHr/xEm07IaiANnRHFZV/bF+AVZSV0gxxoELgWmPwvK3EX1BnW
	edm4ekJEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZxH-000865-Bs; Fri, 26 Feb 2021 10:02:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZxC-000803-JW
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id e6so5919069pgk.5
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/m9GfFw0MzWCiAlloHYC1CIUxqu/1B3ra32N28sGndM=;
 b=aScOQ4MRcOlglRBfncxwkth7ehHiLsqgplM12LYDfpJitm67IvT1WHUFAhl319dqjJ
 xUcB5q/+OetxdpwVx2KyjHix5Yn3a8AnD9YgsyeH0iRnYpM1tCv8oQ7pNWuvIvfnvXzI
 XDWDiS8e7uLrGVW/nWGrDHzTXTfXPhNxlIC2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/m9GfFw0MzWCiAlloHYC1CIUxqu/1B3ra32N28sGndM=;
 b=NMmhQDSQ4ekM/H4/nyfGY0p6ljptlUdWzQbT1AaHi3Unz4iEC8jcGkiXLB4bxourIX
 IU4+AqTMr+vh44CGRs5Zbu1GBYeRqicp0ScgoXgP1L+FVfQDzD2QSJ22jnW9WU0kNiXJ
 ztASOObr53L82t+oNtX5dyTYGMCzN0LFEhhLRwz4Mhp/onoZkrCr/iqI3v0/louBorW2
 zXloU3g+E/OFjaoz2mM0NfJ8C46kOEamPw6hJz9hyB6D1Bv/7HYEl1zmA5q04U7eiN2X
 u4iHt4lWVUgemgb1SfMMfwHw3HYA6w8NwlQY/+bYugMQnIwuwmT/ti6DRNr6QnKqm61M
 +ctg==
X-Gm-Message-State: AOAM531htrh61SyMHDR8f+C6mYH/n0c7OauoUHb+DoK3IadEmFzShksC
 nsogxLDOHFlKJ8SQ7GBGwM26gQ==
X-Google-Smtp-Source: ABdhPJzu+huZfKSj3BcpG4Sp46b2XI6By+Nh+9mV7RSGM8YSvyvupXS84VwTbmrHlv2tulwVuE4fMA==
X-Received: by 2002:a63:f202:: with SMTP id v2mr2248344pgh.24.1614333752258;
 Fri, 26 Feb 2021 02:02:32 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:31 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 11/15] media: mtk-vcodec: vdec: Support H264 profile control
Date: Fri, 26 Feb 2021 19:01:44 +0900
Message-Id: <20210226100148.1663389-12-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050234_694954_39E4149B 
X-CRM114-Status: GOOD (  11.87  )
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
 Hirokazu Honda <hiroh@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hirokazu Honda <hiroh@chromium.org>

Add H264 profiles supported by the MediaTek 8173 decoder.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
[acourbot: fix commit log a bit]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c     | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index f9db7ef19c28..3666c7e73bff 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -591,7 +591,16 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
 				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
-
+	/*
+	 * H264. Baseline / Extended decoding is not supported.
+	 */
+	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
+			&mtk_vcodec_dec_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
 	if (ctx->ctrl_hdl.error) {
 		mtk_v4l2_err("Adding control failed %d",
 				ctx->ctrl_hdl.error);
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
