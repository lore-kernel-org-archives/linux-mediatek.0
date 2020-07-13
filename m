Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A68AC4345B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5B72068F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bBYVQPmZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MJI0XNhB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5B72068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4AhWzJK19WKsjyR7JaC/pIzqurHTWdV/kKdCMzr/gfE=; b=bBYVQPmZslj/pQOQJ2iUi1Z8y
	Ja+/gmvGFrNG+WBFHUgd6Sihp2LNIVxo1NcQVZ3E2f725lhWkWC6hWpiKFbNjvCdz4QubMISFRAhP
	BUzuM6acAuTVOQw8fagCKbRHb8UZ5uzfJVBzIpXQtf2uJ9fdVlHXNHvAR67e3ZiKUZlPjHeTvhuYr
	iBoDLNktJ061FM8bHCk9chdY716YUyf1MKOcLrZFCLIYVK2/nh76C4oY6O/etH3U6/6IfQZOtVXgG
	yJtmg7rUyf7OIRnTIpnzSNbfSykwmYe5grICapxqsINze6Oxkl4eKx34er+hod9nrREIYRVBxm27F
	we3+/u/oQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jureo-0000Xs-AC; Mon, 13 Jul 2020 06:09:42 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurem-0000Ut-0J
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:09:40 +0000
Received: by mail-pl1-x641.google.com with SMTP id q17so5049111pls.9
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emr/NGqj2O214H2RbodqJQHnJMZ9UzU1pc+xV9IRc4I=;
 b=MJI0XNhBy7D66xtLNgM0JoF5yJyBliChbZhl+Ewb7Rxb0zXallIaPeV0iHxOcHqBMM
 foYz0ZreIMkRc8Pto9PpxS3ZTignfJ5HuqD+fs1zRlIBgymv2Xph23P9lNGblMZGfR8U
 EdINi2IIzILZ9kdLXxkMo1GtL0K/6kbFSHy7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emr/NGqj2O214H2RbodqJQHnJMZ9UzU1pc+xV9IRc4I=;
 b=MlN3R7X6WLZKbCOlOmQsFnbPFh9pxusB9PpwMpuHeX6v7FP/BHIg7iRKuDLPZ/yOYw
 wGIHY6bqfr1EJJ2/2H+ccc6OWBZp6CReqyQTs2Hgg5QdYqG6uud057rtO3gP4nRefZfb
 ISqm4pgTxqfxc7AIFWTlKBPcHjq+sf5yvM4cz3skuuN0vzRwpZA3eUHLGnBb9jvI+kyp
 anJpn+19PkPSJ6D58OsK7ZNhyJbcN1LmffPSnsKHBnFRt0q3lQgIg6/lD7QYRsOAWh3P
 qi6camSmjnui/dqyFkLO0oP+/qQ2IGmTpdiFQytjvbjeQsQtRqQn9hWHaC92Cqgx9dxw
 19AQ==
X-Gm-Message-State: AOAM531SUYvCKleQIoPUeZw+gpXfYN+ARrbHlZI5kE6pIXU3FybtOvey
 7AtWAO+dSHwziXxUHpYQJYVWRg==
X-Google-Smtp-Source: ABdhPJysjlLkR7LkuQ6sWSWbC6lkJls5Z50Q4yTfrVa+t5ZL7a+g9iV25BOY6gvfVvL6OvzXgbJlvw==
X-Received: by 2002:a17:90b:2348:: with SMTP id
 ms8mr17509414pjb.5.1594620578321; 
 Sun, 12 Jul 2020 23:09:38 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:37 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 09/16] media: mtk-vcodec: add support for MT8183 encoder
Date: Mon, 13 Jul 2020 15:08:35 +0900
Message-Id: <20200713060842.471356-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_020940_119885_71331FE7 
X-CRM114-Status: GOOD (  12.21  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable encoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 59b4b750666b..a271611750ad 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -302,6 +302,7 @@ struct mtk_vcodec_ctx {
 
 enum mtk_chip {
 	MTK_MT8173,
+	MTK_MT8183,
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index c8a4b85a81c4..b8fe408dd6c7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -62,6 +62,14 @@ static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
 	},
 };
 
+static const struct mtk_video_fmt mtk_video_formats_capture_mt8183[] =  {
+	{
+		.fourcc = V4L2_PIX_FMT_H264,
+		.type = MTK_FMT_ENC,
+		.num_planes = 1,
+	},
+};
+
 /* Wake up context wait_queue */
 static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
 {
@@ -424,8 +432,22 @@ static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
 	.max_bitrate = 4000000,
 };
 
+static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
+	.chip = MTK_MT8183,
+	.has_lt_irq = false,
+	.uses_ext = true,
+	.capture_formats = mtk_video_formats_capture_mt8183,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
+	/* MT8183 supports the same output formats as MT8173 */
+	.output_formats = mtk_video_formats_output_mt8173,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.min_bitrate = 64,
+	.max_bitrate = 40000000,
+};
+
 static const struct of_device_id mtk_vcodec_enc_match[] = {
 	{.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
+	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
