Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB8BC36002
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Mar 2025 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZKjyFb8BZx79o9w3IcZRsKDUkbzPE3rt8zz+Ry3hx0=; b=SWVOt/DnQ5Zeex/L32XSeW1va0
	4B+VHpOpeIXsSw/kTPzMS+WHsrQJBhwKFA47aCAfaxA5BPY+uh1sCqVbxAsrDY5364QNwIQrpwcKY
	CKeNUQYXiItczE6Dg/QDDSOD/YlCUN3d3cO9m3VAFbIKk5pv68DG+E7D4IVY2h+7h+9nqIp5VIf7J
	JEmjxthqhKj67WB4ZevhtqPmI6EY1zzXl0pontvROoDyilwLUWfV2mlgACpj0HG8Jvan7KHs0C1+Y
	KEB0WDgz5E9Wqfe3opKR62CdLrpo/QO1Qsdibrf9XzrL+Rh1e86uJopg6G9nRT1uXpPWTgWJQXpRa
	zIVdJh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBfZ-0000000Bbhg-0wbq;
	Thu, 20 Mar 2025 08:54:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBaY-0000000Baqf-0HvJ
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Mar 2025 08:49:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d0618746bso3009405e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Mar 2025 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460556; x=1743065356; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZKjyFb8BZx79o9w3IcZRsKDUkbzPE3rt8zz+Ry3hx0=;
        b=P5kM3EQoFxKxinqxZbjTMUeYz1lMZvjxZfdI1CB3BSX+xaQ2DostGI2Qtmlf0Q6ZQH
         CIce4AsXnFagn6Aha5owsat170Zm2WXqDibGKAbIsrlRFS7xqXYZ62uqeboQMQGK9QcB
         KUUnlg8MmmHVeRHDsYQ4nQuKAHOYhAafSvFyt70ivIS6abPGXXaNLMG+EmkUjXEYq9IJ
         Y5RMgayq4EFKv9FITbhwji5InqIyw9EcVH5c61oM6C/Bz6q9FRraRO7TRd+w3d+Beyuk
         KzEHo4K8xJ4wRAXxM6eV1Wbc/OM2aJQDwzo69x3xLobJw7QGYNoV1LCv+w6buIcB2Wls
         hK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460556; x=1743065356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZKjyFb8BZx79o9w3IcZRsKDUkbzPE3rt8zz+Ry3hx0=;
        b=SMGuew4+zBONEffqZ3SFk1YmGyXs5I2rgJyqmvgR05O4Hq6zLwWXaPr1Y9pHcvh64b
         bYYxgxWlXEld34nATD5zoLdCV2oRZIyVE8rHrR/EhsKQIY+1rj6OqF6H7UTNlIs2tofk
         yYi1LMRGaoDUUnjUmHjHhKNQB4/3Mm5ODaVG6cFDwd3cAD/crpNwEaGLBTf7fnHBB+Hh
         GBtYwiVqKImp2l65MGjQHB+/4qkkl+tD910H8Un+LteT2ccO5COep6OZ+++QJ1+s4CI1
         iR3Zuif/FRkh9GZ+6WIe9WIiVJS9Zb6g9Sr9H5zmyQ6HcIjAi9Juzy8W3XTHyNNokecY
         C2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX7BCobdy9edhvOSPeS4HcakGwBHZ6QEvzL16FOT90chahJ1awZQ5HGDWFRRDJcXKvBKrADb1RmY3wZ1BcrAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxECyIWlymfagOvn8gqjWw3+jFSFROQpdGBQK+MksNPCpbtSoUN
	g8DwdYgDjRm9XFrVf7NdBTutnj/6Xkdsqhu9I8a2RDXfqL41VdRbZVhe7CBnXHk=
X-Gm-Gg: ASbGncvpWrpBI7ebCq5AT58TCriHZXR24fHQatYqmsRDb7UCWshPxV72IdhuFhclDqZ
	HDpQvVrnKdkdGOO4HpSaaKBMZTQW/K72RjWSiXYeqNwCeIgVdRJOBdB8ZDN3Ngw3TLAA02dIW24
	hx97fmo2rAI1dDg4x5MofvB93nYSEueKkh1e6JUmz81dAC9k8GAxDDEaFjKygg/KF3ai/4Cw6wE
	p1LhbIftX7SBFWCwIS3oianzHpTt1nVW2XR9OxN6WsnuXUwKzQyTw9PTIsXYO4xB1OlM3N2ag51
	nrmH2twRgW1/KmpY2kNSNzgo99bKDbkmTUhPLs8sy2QFc1Om
X-Google-Smtp-Source: AGHT+IF1ShRsZAhXeGcFF/eH1QOBy38lGwVALG8wcA9aWqeTkHgVv4Ae8bUcyD5nie1uQZaBU4zsBA==
X-Received: by 2002:a5d:64c4:0:b0:391:2d97:7d0e with SMTP id ffacd0b85a97d-39973af6beamr5443274f8f.42.1742460556286;
        Thu, 20 Mar 2025 01:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c11c:487d:c821:54a0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43fdac9dsm41381655e9.30.2025.03.20.01.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:49:15 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Mar 2025 09:48:47 +0100
Subject: [PATCH v8 3/3] drm/mediatek: dsi: remove custom init part
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v8-3-c2dd7b0fb2bd@baylibre.com>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
In-Reply-To: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=TX7OcGVRtr1P2pPXrsvbTSXIwOoVwPaz45DKWAiAmLc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn29aHumqlEtPmW0ArR5jYJL5IvH5lLNSxMmfrFswE
 D6QNUKyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ9vWhwAKCRArRkmdfjHURTTUD/
 9/d7eGtM1x5wW0jXmYe6IW8fwisk78gewlZv0z4juc7RAlpd2GbJSBerX6VBJY/DL8d0V7/u5WVa90
 P1bZxxvdxm79wEjWsSyJYbCwQWH/Wmn8zyZQvwZXUaOjh1uuoiKmuhNi3oP7o8ikoo/7Yerpza6BoU
 +gKMkpOuW0YAy/jdv8/xCqXCcMGD9z7lU7wbKFgnDi1QD1X0aTCoXoxb4rKmZSJxJ1A7tvGKWA1R8y
 D0MqNsi/HjfA/hNYullag24K50oJOlOCoT9fCeQ0yLvALuNPn6K9jIXfGgHO45KgYsShibM1bRt83M
 UxZrEncVEifz0mKSROkc1yiKmHlushJSeifzd3fe09pGcBc0lTubg4AQ/ysBmKzDuOuqNTOP9tOIMq
 iyNSOj1tdoWtwP0BOSlY+ElUwUdM5mdhUzZRHIDLkHDybrZP9YSCEmb+joNt4IhE8rvoDc+B3q4PpJ
 l88Ls1+kFFuSSpOjoMgvg276mnZ1igr7TmVTxl3n5f/WVT3XKpUDhopnmpc7DroirFG5Bc0xJVSYT1
 x93zcH7j9Yu+1KuQpRU9VBR7lne920Op7uje9MJSB5eFZlRdbHGOlqiXFUB5/jnQqbtO6DUZOTIiKV
 Ry4pSE6S5lwJfZrZoSCAgSky6flyYM5QMBBHyvf2yuZqxL6xz9WxweVYp5JQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_014918_175941_97D998F5 
X-CRM114-Status: GOOD (  11.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To be aligned with the DRM framework and avoid DSI power being driven
by two different entities, remove the custom function and keep the DRM
API to initialize the DSI.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  2 --
 drivers/gpu/drm/mediatek/mtk_dsi.c      | 16 ----------------
 3 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index edc6417639e64..d86eed0d279d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -317,8 +317,6 @@ static const struct mtk_ddp_comp_funcs ddp_dsc = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dsi = {
-	.start = mtk_dsi_ddp_start,
-	.stop = mtk_dsi_ddp_stop,
 	.encoder_index = mtk_dsi_encoder_index,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 04217a36939cd..5657854fa2f9e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -47,8 +47,6 @@ void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
 unsigned int mtk_dpi_encoder_index(struct device *dev);
 
-void mtk_dsi_ddp_start(struct device *dev);
-void mtk_dsi_ddp_stop(struct device *dev);
 unsigned int mtk_dsi_encoder_index(struct device *dev);
 
 int mtk_gamma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a3..b813b49340420 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -787,7 +787,6 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 {
 	if (dsi->enabled)
 		return;
-
 	mtk_dsi_lane_ready(dsi);
 	mtk_dsi_set_mode(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 1);
@@ -893,20 +892,6 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-void mtk_dsi_ddp_start(struct device *dev)
-{
-	struct mtk_dsi *dsi = dev_get_drvdata(dev);
-
-	mtk_dsi_poweron(dsi);
-}
-
-void mtk_dsi_ddp_stop(struct device *dev)
-{
-	struct mtk_dsi *dsi = dev_get_drvdata(dev);
-
-	mtk_dsi_poweroff(dsi);
-}
-
 static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
@@ -1243,7 +1228,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	}
 
 	init_waitqueue_head(&dsi->irq_wait_queue);
-
 	platform_set_drvdata(pdev, dsi);
 
 	dsi->bridge.funcs = &mtk_dsi_bridge_funcs;

-- 
2.25.1


