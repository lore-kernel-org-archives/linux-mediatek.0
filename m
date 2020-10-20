Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A37C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 853F422244
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEa7lke8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m61n/shu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 853F422244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dWvBQ5xkx4o5P/+xaNtbJl3lV5dif3gg47e0q5HBa0U=; b=cEa7lke8BiWUhFGV2zoR+VwZG
	60tDy3/7r0e42yCQzt+c8kIT4YyC92EMEU+W9PrpUSeL7iBtrYfiPYg2QY27vFwTevn+mls9dLNXh
	+dWyVacHRHcbjiXbQtfuERvNXPY1eWa9p0dERS+UWv0nQVauBEXZqdJYxUhaZj0p49a4mTmUDI8Fy
	2APkMs4aCGtKl4A9Qbgtt+jmApEC5PIt/lNVXHFU5e79qRYItzHh1IxXrSe/m6X9Obwayv6IcNp6D
	qjXsstbebprdOHXMSAvZtwBsU8FbKFMF8FQ6djtAD4xHd06zMm/ln16vK4WYLCjgHNLe+gNGxCwWX
	Z8XXMS+1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvfg-0006eR-If; Tue, 20 Oct 2020 17:43:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvf5-0006RQ-6v
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id k18so2933067wmj.5
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJDT7M7U/DertPjHbQd+Y+qplapGoAL1OhIVqnBxURE=;
 b=m61n/shu260RiFLmYCOqn3vOgiflYZZAgoGSbOU1Gj7R0KO30b1TFe9gEsoSLUR3/V
 mIvnJJ8cvHNP4vT1ykTljPUZqS5hWNfBRbtkw/BkDXR6U8sAx+e77RFs1huAF1INPkWU
 OszFMX+4wJr1VMdaQWYHYrrtkUMV2tnU1a+6CO+AJVTCol0l9IwUrpRyUoK7T10ioyqW
 7X3L8c6oCQZfEy/Crye6MxZ4Fw17AlwxG72CdHiqGOmJvjnaWW2IpexTquL98PVkgVv1
 5SQ3GZzKZ04XwkZISIO3bkpHJqqojqoAwN4Hf4xxpn7g3+9njPeirmkpG75HHzpHZPys
 f9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJDT7M7U/DertPjHbQd+Y+qplapGoAL1OhIVqnBxURE=;
 b=KsUviJyP+C5WQTUnmM+RsRUHZkbCJAxHvzC5F/RDPKpjOqWi10vjnPH6jgLGSjxL29
 EEqXkbltqBHEPJuYPtkz8LcqQeR5aoDbjAUpIg5216G+kZJiU1r56Jv5qfJaNGJvPg1E
 IZst+UUUHVnsPneAsl6vmbcsJmp2U1aWWlliAMW7B8sEy9ls0Odw0tqc3od/fNP/Bwc7
 XwHdjrPmEi8U47Gll/YM0zi9Avzqs7rAEF/6ItoYxRDp1q6oKLtmRQ9hHESo0Pj/2xOH
 WKc8oq/83LpDrpa+1b4gAFo58p6+zmPBgQR0dFLPjb0ZHlMEwMyonoxkDM5M0uzOvEtG
 KYMA==
X-Gm-Message-State: AOAM530n/fYhmLJu85fOCcbfFwt12DjQKfHegpg3Ia2fbvMh5J6I55Yh
 74uXTZ/VlEv9lmuKI03PwsW8qnRD/71Cng==
X-Google-Smtp-Source: ABdhPJyiJ1X/RENQ6UMwjnjaZvMP64TrGUC2bLTjtsjWwKG9+Q1UUxrR5oo9Xj19HjmItbczgvkGyw==
X-Received: by 2002:a05:600c:21d3:: with SMTP id
 x19mr4078470wmj.170.1603215782078; 
 Tue, 20 Oct 2020 10:43:02 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:01 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/mediatek: add disp-color MT8167 support
Date: Tue, 20 Oct 2020 19:42:48 +0200
Message-Id: <20201020174253.3757771-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134303_283227_ED8B0EE8 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: chunkuang.hu@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for disp-color on MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 3ae9c810845b..a1227cefbf31 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -16,6 +16,7 @@
 
 #define DISP_COLOR_CFG_MAIN			0x0400
 #define DISP_COLOR_START_MT2701			0x0f00
+#define DISP_COLOR_START_MT8167			0x0400
 #define DISP_COLOR_START_MT8173			0x0c00
 #define DISP_COLOR_START(comp)			((comp)->data->color_offset)
 #define DISP_COLOR_WIDTH(comp)			(DISP_COLOR_START(comp) + 0x50)
@@ -148,6 +149,10 @@ static const struct mtk_disp_color_data mt2701_color_driver_data = {
 	.color_offset = DISP_COLOR_START_MT2701,
 };
 
+static const struct mtk_disp_color_data mt8167_color_driver_data = {
+	.color_offset = DISP_COLOR_START_MT8167,
+};
+
 static const struct mtk_disp_color_data mt8173_color_driver_data = {
 	.color_offset = DISP_COLOR_START_MT8173,
 };
@@ -155,6 +160,8 @@ static const struct mtk_disp_color_data mt8173_color_driver_data = {
 static const struct of_device_id mtk_disp_color_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = &mt2701_color_driver_data},
+	{ .compatible = "mediatek,mt8167-disp-color",
+	  .data = &mt8167_color_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = &mt8173_color_driver_data},
 	{},
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
