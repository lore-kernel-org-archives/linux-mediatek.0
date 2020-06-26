Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3906EC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 10:55:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CA5206DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 10:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AmnFaQut";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HXd8cN7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05CA5206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uF95VyOITnzlch1r8U0Y37j7pHnqsENYGRDwohcU6b4=; b=AmnFaQutsEtdg1Nmh0GxPuvxX
	OlpsDFucZIAXtYMlRUps/1Ntw8RaJBgQKbMR2XUBZMKzdjFvS0cF1QCQ57yyVCgJZ4ZNai9mnNx9I
	wrSxBPBIhOzlOlrITYi5qKGo/XsaHUB6eabmlY5PXhBPdb6GsHSRfPu1GXy0pnpuT6XKm3UAir0F0
	ayWeiS7YY7ocoSeIuLxPz7f1Ku1pSDHWgXXmQ2XLBlCDdrrbALi/ae27IgWX91HixbV4voHZxIiAX
	ThhmtwrtIv6T3MbjeddMRmK8CA+V2zP1fihuI/pBEssxfIM47AQXLhyLHkIcS3ZckM6fofwkFwGs8
	NpIzxl8Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jom1Q-000843-1H; Fri, 26 Jun 2020 10:55:52 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jom1J-0007xi-32
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 10:55:49 +0000
Received: by mail-pl1-x641.google.com with SMTP id d12so4160968ply.1
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xHNRou80y9oPK1XHkY4t+2RP3g08PmvW2/CQnpLKVto=;
 b=HXd8cN7WAwO9yXq0bU783f15thXywJzamPxWe9xXZ4bcbJvz8TFq7+Gma6SIN+40hM
 DmQsLlFiGud8fA6ewGlYd9YVUDm8GVLwmJU3ZDSUG15sc0DG7wzRlEaw0MCiO48TaBhB
 wNAeceavH0x/cC0f/ak2YlxFQbXeM2+SjLbME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHNRou80y9oPK1XHkY4t+2RP3g08PmvW2/CQnpLKVto=;
 b=rseKg9sXqWDhEgWHUErb/ISuX+BfWly0clI3bugxsALyx7jm1fUQBs8Xqr3pEo6ab5
 tpblLnwD69E6K901AfBDUWh6Yy4yClHLsl6umSeiDwoAbfm9NENM3WIfXNwk3CM0bhv5
 pUlAs8uJy18ppHfciRJPzP3J7FBdtfCIc+PMZFpN5lSgjXnenkUDz+Ccdlt9ZFgJD2NH
 Clpu8yJFJ5Y7VYIK+hhTJOSN+eDl/teQOZ5o+jgpWLuvyTQQzM3c7uDdENT+AnyR1TEZ
 YIfpbmwOx1bjedZaiWim8SXrKGCGY7aoLNOMNCjwB7ORL+LgfSs6vmv58FiCusa5/pF2
 hAlA==
X-Gm-Message-State: AOAM530Zqguzgtk6AXtxi3hYh8kt4aGNup9oZXc0b9Kq5SGe3pfJNd0c
 xVz0otnUVgh/vsiznHwGocZ+kdwElnGHkA==
X-Google-Smtp-Source: ABdhPJy+YEcSOIUz859rpa74XW+WHGJIXKdl+x6O21q/qCBPJQdhlzc9iwX2umrqS3Gsu/B1P+pw4A==
X-Received: by 2002:aa7:87d3:: with SMTP id i19mr1572926pfo.203.1593158746196; 
 Fri, 26 Jun 2020 01:05:46 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:05:45 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 05/18] media: mtk-vcodec: venc: specify bitrate range
 per-chip
Date: Fri, 26 Jun 2020 17:04:29 +0900
Message-Id: <20200626080442.292309-6-acourbot@chromium.org>
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

Different chips have different supported bitrate ranges. Move the min
and max supported bitrates to the platform data.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 4 ++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c     | 3 ++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index e7b155e7432e..b8f913de8d80 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -311,12 +311,16 @@ enum mtk_chip {
  *
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @has_lt_irq: whether the encoder uses the LT irq
+ * @min_birate: minimum supported encoding bitrate
+ * @max_bitrate: maximum supported encoding bitrate
  */
 struct mtk_vcodec_enc_pdata {
 	enum mtk_chip chip;
 
 	bool uses_ext;
 	bool has_lt_irq;
+	unsigned long min_bitrate;
+	unsigned long max_bitrate;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index d469ff6464b2..50ba9da59153 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1232,7 +1232,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
 
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
-			1, 4000000, 1, 4000000);
+			  ctx->dev->venc_pdata->min_bitrate,
+			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_B_FRAMES,
 			0, 2, 1, 0);
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index c1365209263e..221fa0303075 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -380,6 +380,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
 	.chip = MTK_MT8173,
 	.has_lt_irq = true,
+	.min_bitrate = 1,
+	.max_bitrate = 4000000,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
