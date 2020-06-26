Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69624C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 09:50:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E9BB21531
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 09:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y8mCrCuA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kn0f38cU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E9BB21531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iyu0nqqFcpmTP15iQsQNsSyaGJ0V66zAq8Bq8hTMPKU=; b=Y8mCrCuAOrOowJEbuLQdl2wUe
	WnWcYL11KnXnQRZy6/9T4vtO0MlC1IidubZ5xzpJMTLD9nGtRaMDfLDg1ZZv8+vyWKWCjjh3QbZ7E
	Iz9h0tovKBn8f3gnBZbYLpqPlViKweZJocfvSxE5CMsLCse7XYPWq7kIaM43ndOZqaaZTD6LOzJ1E
	/kjN8ZOXg9eUaGwLddmsXzynjPFik0cmWBarJKjFhpiq/cA530bTtln2rfymIvaB2pGjfbByCGpg2
	ptmGqJA2Li/aWPhqH7tuEoqIl8OtLWC4s191878R6hvgKrcghE+Sb7oVX7A/0b5sXh/wlupmoPnAX
	3YwqBt8ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jol0J-0002mI-S0; Fri, 26 Jun 2020 09:50:39 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojn8-00046e-7p
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 08:33:18 +0000
Received: by mail-oi1-x243.google.com with SMTP id k6so3529287oij.11
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uUZvKPdu95+p1R2WDIcCJ7SyPajp8Q6yltZNyWtDl8E=;
 b=kn0f38cUu5HpVoNWAmQuUmY3wSWXBg4e4KU/jshieaHLVbxnt6GLqB649HZyo6gh1r
 HuD38sdPCHmjucQjMigFzD/PzZdWzZgRAoor8v8umqD1RAnvlDaPd3J1usdqLEwFid/t
 SzVOFW6sLdk5HJ5BEurM29c6yXJVs5mT6U04g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uUZvKPdu95+p1R2WDIcCJ7SyPajp8Q6yltZNyWtDl8E=;
 b=PkPcIbOTN7xOcY8cPvgpzBlkBjiRTgIlM5exKRE2AwdBEkGR5/Yc/0Brhoz/9QlpiF
 UXUYyD8bRzJ3rtA4vvVTJ4/9S9pLNvsSPBNRLdhcrAjNGrIvGPTHLLeffGK4/ynKDoJE
 Trd8cgVtDFQa+Sqd5LIjjgNJHqoIr6qp/4st871IAJ421zbX1V9v8j3NYA0UGzejZBZ1
 FeTGsx+oKeWaPLMsaPO6aYP/ifKLf3Am2IOPW7OYjFG1ulVl6lbftCR3wWuGv8QCpIEQ
 qP1SHdihAkvwUIMhd0ljxzDPG+DtKynfPs8TRymC2H1riSLbHtoESAdHTOzLVMdD1nTv
 Nu+Q==
X-Gm-Message-State: AOAM532cyvHvdFE2asM3H9UTAp2S4jXEk8Vo+Oks/enKC3NPnMPblNEE
 bNGjUXI434EICAhknxj9dQmT/UQi/0PWVA==
X-Google-Smtp-Source: ABdhPJyZiwIhWsVYO/fYZLlAEUwziVOxGXat/RxgeH+igSibOnNZFxPjdh5knjob1x9yY3tsCkCscg==
X-Received: by 2002:a17:90a:ff91:: with SMTP id
 hf17mr2117166pjb.137.1593158752784; 
 Fri, 26 Jun 2020 01:05:52 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:05:51 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 07/18] media: mtk-vcodec: add support for MT8183 encoder
Date: Fri, 26 Jun 2020 17:04:31 +0900
Message-Id: <20200626080442.292309-8-acourbot@chromium.org>
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
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
