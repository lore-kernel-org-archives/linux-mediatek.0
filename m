Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F26C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 13:32:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E119820795
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 13:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PrBOI9Us";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dPB4J4uq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E119820795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tjwtr+Lp1/A0H63A3sOEOxnVgQDPWlCTwbYGMyQH8is=; b=PrBOI9UsKwJjXzpH3m7T74hfo
	UhYzggJ8UGUvXJ/FK6Yv4MdAhT5fCWQGoV8B2cjPa83QlQFjXrpIA6XTIOprhT13tJbROhyp0Cb6H
	7dUfe8Hb5zTu0zOpIvisyksIen2u6Lk/ErEoqm04scRyhjL7Bhzo2KjewVxSR/IqBashebmhw1rCM
	/94xdcu+ddTp0wHNkuXTxx+5DMjMHGIU4iuH+EBCj//o3lW5T7sI9h718wWfVYuIqcd5SxchLHXGs
	9Nx8TlH1e17MOQXqKnzcuIF/PuXrow99l1UOYTFwr3fogqNEALc2QpR8ks4s/qOF1t/M2RyOG6+5J
	Fonf5HEXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVxB9-0003uC-Ny; Fri, 23 Oct 2020 13:32:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVxAT-0003eJ-6T
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 13:31:43 +0000
Received: by mail-wm1-x343.google.com with SMTP id c16so1576644wmd.2
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g+2yN9MeRTEf/pnT8y/kZe4gz63gE6nshqU+Yqjv0/I=;
 b=dPB4J4uq4UmIx/feUZt/6vYh5sK0pnO9jZRfvO+jfbOL6OULIEcCQo/zLlWVo0Re9T
 PBQfcFLylfMH9c5MILSk/ytseU3R6p4wywTIPUZyVJgQ5MHgJoPVLFu8CtaTvU0rpXAc
 D7dh1HC3zpOl3Elt/GbcDesudaLQ6/lmnOL7RNILjDR9Wgz6yHarIqBGxds8PD/2J8xq
 sV5IjcrI6TZlHIzo+IVQ59ohoRQDy0+YSGpB5FRAkBlBzZmITIecDJGZ++eeDV58inNr
 ofy48vywVaElIXHD/S37euH4PaLPyQ0pQEKrQRuZVsGM45I1Q9XvtFQF+Fc6t9C5AjfZ
 J+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+2yN9MeRTEf/pnT8y/kZe4gz63gE6nshqU+Yqjv0/I=;
 b=IavFTcrUVgnpIsGNY3v/mNRo5/cy2EuFUhmc1/Jc9UHN2djMhv3zhMY1XVJhOEtBf7
 lPXxmI1z4v5EJOyKHx8RjfItyKrl3N84TXmyb2G2Vg8YB7x+ZnPhQiVJdPsLHuEStLaB
 ve8t+nubsNuQXjBANoBIfXOuQ0UjTPb8TAjqdCoAKYManTyQJELPwLJWzIeRXlfbKwqU
 ecqKz5iAnaQdFf0rM+SeAI6C+jlVdQHXEaQzCNqO8PqIBQVn9d1yQCQ4B5CvaP6q4Djs
 GOg8YPvEP1JVzC4sWIga91cYEngXuFXz9v/MH5huHkmt/yfhOrTSTh+KmhzF7IHWJ5bR
 tcgg==
X-Gm-Message-State: AOAM530nc7CJ66bqkEBG2sULrfae+e8z8J6hsK9vhzm4OV2pPUVdIQmK
 oaukW0ze9/38+fQAfCWjK9Q7BnfC63rw0w==
X-Google-Smtp-Source: ABdhPJx3cxGQumgk9TFoam7BXXLYtxG3Pzw2YD4YI6h/rEfg8EwN7KF842rzjfywLCEt05riGq4EBQ==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr2295428wmc.27.1603459899863; 
 Fri, 23 Oct 2020 06:31:39 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id f6sm3146107wru.50.2020.10.23.06.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:31:39 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/mediatek: add disp-color MT8167 support
Date: Fri, 23 Oct 2020 15:31:28 +0200
Message-Id: <20201023133130.194140-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023133130.194140-1-fparent@baylibre.com>
References: <20201023133130.194140-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_093141_525898_48A1ABF8 
X-CRM114-Status: GOOD (  11.26  )
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
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---

Changelog:

V2: No change

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
