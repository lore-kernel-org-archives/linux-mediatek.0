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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50E7C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:44:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E83021D6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 17:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w4SW7iI0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tKhGvZjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E83021D6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cT4HMAOKIUuuMrtcXrQb7EuWGNqI39pDOzznGKwxeM4=; b=w4SW7iI07A8cf9RokWA9uaWsF
	LHylolvSEqmYdC+m4BgDMiD52rhc00EsS+ViILmBKyQwVuaFjU/x50coI/7AkAebXm6cXqWDQ+B8/
	cQeHZbefaN3dwNp1PUsmhklQ1a3KeteTymbaCc4sVOw/Ya7/drHaNX9T+mYA2nA9I5OP0N9AOsD/2
	YZJSOYClQJ9BLTXgdKWCRIpx2r+iuYmWQ78PAUxgEi6RluSYm+UQoHbxqOMiFfDdEY2S/v4SdxFjT
	8XAoPMdHvU8CfPYnD4JjT/1G/N9+XawnRQcOIzYlrn1n2s1HGfJTugNWkrq7PwWyLS7mRdJnnjiVc
	qS6azJCfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUvgH-000766-4i; Tue, 20 Oct 2020 17:44:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUvfD-0006VL-Ed
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 17:43:15 +0000
Received: by mail-wr1-x444.google.com with SMTP id j7so3198415wrt.9
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1A8pfSek/oH+kI//UrZrfn2qlGAQqPoXd9JAju99Kjw=;
 b=tKhGvZjHxPeNh1BqRsnqoK5mk8FKDP8GpA+8AwZOq42jOphNgYUY5iBbwL2iwYh643
 ilMXNPIoy1ITQRVR9VfbAvrhU4rIEuJJv6yHikwMBo07KK3uX4n5WqR5zSJ6x41578iY
 j3SAnl2D9opqS7C3H4iWZm1EV20bzt1Hh1n5APmPCznBedCN9vNxClJSDWtKygEqlGPk
 mS7ppoerv0bTUSu8loyCAvdl+3czi3yUA/xCIcunIHapYtBDEpQ0SBwR2gWtEcCt/eoK
 xk6W82bzd987JbfkGJrU8qZEb8urxe8+RejC+8Hilg247SVLbAEo5q566TEzSLAGlj1G
 j4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1A8pfSek/oH+kI//UrZrfn2qlGAQqPoXd9JAju99Kjw=;
 b=XM0ijU9om1AoEJo48VrPvGu5KAm942dqylD01cPj/MR6yPsyy/wyPdQpNR/LJeW28X
 uQMur/NyNUzmZD4jSFtpqlE6o2niPJJlHpZvKPu7uqttDw2Uf0iZWdVzNIgv3wTRjOWd
 QLsAsle4Gndwe1E4D1/TNnN0pfwx8u0etyl5Rj0WGbU+YDHrAhwPOSXU17BMVZtJNAKN
 Blgbb6ZVtY38NQ4kDe0uwrKvQ0g3dztiIJmigDa8uArta04v0A1++4Juk+TyncO2YNMs
 ltl39X0FrT4g/e/30E2U7JTVIEOq68FEGQ2FOZgM0kAJH+EpKTOEfMhxRvXKlf0UDA4e
 5Wig==
X-Gm-Message-State: AOAM531qX8/6UoD+B08T3XsNyYturNjxvpHzdSmY38Tr1rhdPWRsZpPP
 jHJ1tDT+5sX82mQFYDqd3vpp0jtL1Jjo4A==
X-Google-Smtp-Source: ABdhPJwqF5VYoBqPaVRJ2EDBqfvlSysBqq92CEHWViBWOriU59xWNrrDpDUp6DyvZcdF2kpfumUOMQ==
X-Received: by 2002:adf:f104:: with SMTP id r4mr4824741wro.202.1603215790101; 
 Tue, 20 Oct 2020 10:43:10 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:09 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/mediatek: Add support for main DDP path on MT8167
Date: Tue, 20 Oct 2020 19:42:53 +0200
Message-Id: <20201020174253.3757771-9-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_134311_681478_51F48947 
X-CRM114-Status: GOOD (  13.52  )
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

Add the main (DSI) drm display path for MT8167.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 59c85c63b7cc..3952435093fe 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -112,6 +112,17 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
 	DDP_COMPONENT_PWM2,
 };
 
+static enum mtk_ddp_comp_id mt8167_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_DSI0,
+};
+
 static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
@@ -163,6 +174,11 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
+	.main_path = mt8167_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -401,26 +417,42 @@ static const struct component_master_ops mtk_drm_ops = {
 static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8167-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8173-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8167-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
 	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt8167-disp-ccorr",
+	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
+	{ .compatible = "mediatek,mt8167-disp-color",
+	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
+	{ .compatible = "mediatek,mt8167-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8173-disp-aal",
 	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8167-disp-gamma",
+	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8167-disp-dither",
+	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8167-dsi",
+	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt2701-dpi",
@@ -431,10 +463,14 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8167-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2701-disp-pwm",
 	  .data = (void *)MTK_DISP_BLS },
+	{ .compatible = "mediatek,mt8167-disp-pwm",
+	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-pwm",
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
@@ -449,6 +485,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt7623_mmsys_driver_data},
 	{ .compatible = "mediatek,mt2712-mmsys",
 	  .data = &mt2712_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8167-mmsys",
+	  .data = &mt8167_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8173-mmsys",
 	  .data = &mt8173_mmsys_driver_data},
 	{ }
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
