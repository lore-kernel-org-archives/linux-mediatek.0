Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AB3C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:44:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351B222251
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q2x0xqcF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CXwhUZUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351B222251
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v6mQ+NCt3Seso1oQ9/urjDWQeBa2GmTshUjmUX/MYLM=; b=Q2x0xqcFek06LNHTBAmRoytTg
	jlHtGoZZZrPbPLbL1vaB8YpWpb3SduHy5T91LvIh8bHDkRwMk/Y+tyD+KiwSZYzmmSJLsSZUadVzX
	63TxEzgQLQqKGViznl05suf5irOPubPTyW+ZopZ6x0gvjU4Z6v3J48nMP5OCwSAnFUJr/JM1dY8sh
	n8BjWcZMm3Kx+f7gjXmim4abeEL7/ylY1U+PA/ONntDaVwiEua5/JUmVqoo7k+M8bSdh88ihlkXKN
	3agcxsU7sF8kzTponSHuUIkwSDpGCvB+gz2y/yCqM7ItAqFPT/Pzb2LgkWUBg62n2CvWKsp+kUFFP
	vXOlTrrSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvg7-0006zq-V8; Tue, 20 Oct 2020 17:44:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvfB-0006UU-Qu
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id y12so3219050wrp.6
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7RXDOliptKA8bPe7jbK0aPa/iXk1YfLM7zpkeUY4r0=;
 b=CXwhUZUUNIu919TmdIJ3eCAeLP//5WPFJPZJ0UYmflMIlE2lGVpLMtGA8VqCH7r0MB
 rW3rrLcXrn0j7H/eM6ScuHXAfxmrmwI4gKQ2a8E/wQM1Iwhzl1LV8giXT7uRhuj58Hb1
 68iWMSyi9qlM00AfKuJlyoBXRZktu95n7ZXLA6ZdDQYoFXkEtc2l+VfyYsdgB6zSV0RI
 kFMTxBNiOmOw+3RJ32r0sHyGmdp1UyHfBW5ZW+GVxqiTywFB8MVbwA1oEfhace7DQh3/
 aQYT2I6wRD1mx/ZSWQMp3ZqhMFqJt0cRqOebBPVatwEBBl6TpkdlSQkYWYNRYluwJOLU
 qExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7RXDOliptKA8bPe7jbK0aPa/iXk1YfLM7zpkeUY4r0=;
 b=pFv4UClEohzB1BZlzvaGVVm6TuFMQSpebRVrp4n4Qt8gZhiz/tW86W33aF3qzxZ4NO
 T2joWPsq4fSF9dabZi9W7xxsfCMqzBqBTTJI+sPok5tC0D12ekGvP8RJNbnPRyK6o6ca
 Gr11Sb2DSrl2QyVsz14IzQlcvaWcWEzO2zEHUUr6SL1n9hYwiyEE8EIh21nHFWSGaJst
 a4oyRhAVKBIO0ukSDvLeWJQw/zc4jH+hMHsuyvBCx7lRgxJLlCMuCJAUAUHNIa4dpdY7
 MRjoZahS+ihp0aRhaYcv0orG9OevCnC3YTjlRt208rHwVRclRhd40j8BNvDjnkswe950
 dtpA==
X-Gm-Message-State: AOAM531kRxkhjnrubj8683+tQUhZoZgc7dqUfksLSPjgRJSJ5om0FO12
 jJwgVKmgUD3Yn7H5rMF4q+OZZ70Nu7r36g==
X-Google-Smtp-Source: ABdhPJyBmc9IMC/NZiiAcSZYffBFsTH95Rfj5KqcMHO90F5XV49n9uEcwPTKapHZGWa/m5fl2bgSTA==
X-Received: by 2002:adf:e443:: with SMTP id t3mr4787042wrm.14.1603215788573;
 Tue, 20 Oct 2020 10:43:08 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:07 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/mediatek: add DDP support for MT8167
Date: Tue, 20 Oct 2020 19:42:52 +0200
Message-Id: <20201020174253.3757771-8-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134309_959721_2D0C9677 
X-CRM114-Status: GOOD (  12.61  )
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

Add DDP support for MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 50 ++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 014c1bbe1df2..bb62fdcf3d71 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -25,6 +25,19 @@
 
 #define INT_MUTEX				BIT(1)
 
+#define MT8167_MUTEX_MOD_DISP_PWM		1
+#define MT8167_MUTEX_MOD_DISP_OVL0		6
+#define MT8167_MUTEX_MOD_DISP_OVL1		7
+#define MT8167_MUTEX_MOD_DISP_RDMA0		8
+#define MT8167_MUTEX_MOD_DISP_RDMA1		9
+#define MT8167_MUTEX_MOD_DISP_WDMA0		10
+#define MT8167_MUTEX_MOD_DISP_CCORR		11
+#define MT8167_MUTEX_MOD_DISP_COLOR		12
+#define MT8167_MUTEX_MOD_DISP_AAL		13
+#define MT8167_MUTEX_MOD_DISP_GAMMA		14
+#define MT8167_MUTEX_MOD_DISP_DITHER		15
+#define MT8167_MUTEX_MOD_DISP_UFOE		16
+
 #define MT8173_MUTEX_MOD_DISP_OVL0		11
 #define MT8173_MUTEX_MOD_DISP_OVL1		12
 #define MT8173_MUTEX_MOD_DISP_RDMA0		13
@@ -73,6 +86,8 @@
 #define MUTEX_SOF_DPI1			4
 #define MUTEX_SOF_DSI2			5
 #define MUTEX_SOF_DSI3			6
+#define MT8167_MUTEX_SOF_DPI0		2
+#define MT8167_MUTEX_SOF_DPI1		3
 
 
 struct mtk_disp_mutex {
@@ -135,6 +150,21 @@ static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT2712_MUTEX_MOD_DISP_WDMA1,
 };
 
+static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_AAL0] = MT8167_MUTEX_MOD_DISP_AAL,
+	[DDP_COMPONENT_CCORR] = MT8167_MUTEX_MOD_DISP_CCORR,
+	[DDP_COMPONENT_COLOR0] = MT8167_MUTEX_MOD_DISP_COLOR,
+	[DDP_COMPONENT_DITHER] = MT8167_MUTEX_MOD_DISP_DITHER,
+	[DDP_COMPONENT_GAMMA] = MT8167_MUTEX_MOD_DISP_GAMMA,
+	[DDP_COMPONENT_OVL0] = MT8167_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL1] = MT8167_MUTEX_MOD_DISP_OVL1,
+	[DDP_COMPONENT_PWM0] = MT8167_MUTEX_MOD_DISP_PWM,
+	[DDP_COMPONENT_RDMA0] = MT8167_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA1] = MT8167_MUTEX_MOD_DISP_RDMA1,
+	[DDP_COMPONENT_UFOE] = MT8167_MUTEX_MOD_DISP_UFOE,
+	[DDP_COMPONENT_WDMA0] = MT8167_MUTEX_MOD_DISP_WDMA0,
+};
+
 static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8173_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_COLOR0] = MT8173_MUTEX_MOD_DISP_COLOR0,
@@ -163,6 +193,16 @@ static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
 	[DDP_MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
 };
 
+static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_DSI3 + 1] = {
+	[DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
+	[DDP_MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
+	[DDP_MUTEX_SOF_DPI0] = MT8167_MUTEX_SOF_DPI0,
+	[DDP_MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
+	[DDP_MUTEX_SOF_DSI2] = MUTEX_SOF_DSI2,
+	[DDP_MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
+};
+
 static const struct mtk_ddp_data mt2701_ddp_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -177,6 +217,14 @@ static const struct mtk_ddp_data mt2712_ddp_driver_data = {
 	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
 };
 
+static const struct mtk_ddp_data mt8167_ddp_driver_data = {
+	.mutex_mod = mt8167_mutex_mod,
+	.mutex_sof = mt8167_mutex_sof,
+	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
+	.no_clk = true,
+};
+
 static const struct mtk_ddp_data mt8173_ddp_driver_data = {
 	.mutex_mod = mt8173_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -400,6 +448,8 @@ static const struct of_device_id ddp_driver_dt_match[] = {
 	  .data = &mt2701_ddp_driver_data},
 	{ .compatible = "mediatek,mt2712-disp-mutex",
 	  .data = &mt2712_ddp_driver_data},
+	{ .compatible = "mediatek,mt8167-disp-mutex",
+	  .data = &mt8167_ddp_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-mutex",
 	  .data = &mt8173_ddp_driver_data},
 	{},
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
