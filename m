Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA1FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/TnFKd6tEb3x2xxuAE60bxk2CbH38UFbACGqWtUzx8=; b=vownT4zAEyjY/4
	9OnjgKX9RnErasykbIn00PNdx7WDTW1Q0zqjW9hGHsF1B4kHSLvXezbZQFOzxSvkrQ9p+DHeNXWaj
	lfK4TD3XDYZn0aGK9ffHelouroAlFyJ+w8BUGGQi9L0zJm7QHAu4uqrV3F5maVR39UQVJSPkDqk4L
	PPYq7Wh91IaPkNJlqhKJaw+E5AdklobhkQjT4dHAYE9B6qpLIf6oeVktVtDbquVwOm5+xGmuBN9iZ
	0uchyDREe+XsJdaZ8TJ31exdiFwQXUet4MlmlhpKr4USJko1bHynQIV2pky2ci1rnx1Lhd0Z0+WMj
	U5pydlY8/aeJyEY6g4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvloX-0089r4-FR; Mon, 30 May 2022 20:16:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvlnA-00899u-Sq
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:15:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h5so7931887wrb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OCqq60cIFpi0W5rW/stTGkbaV47iCHB38Vu44v/Je2Q=;
        b=r9ZERXT93z+iXWs30IEZqxm8a2ISlpmrexl1aU/BnE/7kGjjGr4YcPWE9vj9KVytZ7
         EXMDYWAv+Kzl5tX1Aefpo97MFGU4puqLGykM6pMvQiY+UBANlF5C/hjRyUXDjZJPi35S
         pw6uKMSt97KH4ttpx561Glm9iCRqlqrtr5Ja8WNAQgDyGwrsZUvKkQla5T9nmkLTFrlO
         5BxSh/2BNI9W+uwzbAxP9YA6YaA3Zm+uQ0cR4s7lFmZ83zmQ4DNvR1UaqcgvfJnva4Ad
         22PeNE2w+HQ7GT1F5dustciKNtdPrgQ9Y3aZm1eFQRrcwVyPCH1QEoOZkS/BH5qibec0
         IROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OCqq60cIFpi0W5rW/stTGkbaV47iCHB38Vu44v/Je2Q=;
        b=pcEsnrKqtuJwWREO3DMz7gz8+wJ8uAtW1BSRrUnZo/C9hDyjJToBkfE7zwA2LhX5sC
         QXlWCFigbtOau5T/FFFbthUIJj/18p24fiC54TRAui0SKKzTskiZRqPvk3Uj13ASMmUE
         5dEeE4EDHbznXZ5rQ1dKKF+A/plKQwVR7sNqSljlSUh5FMMjt5kuA7/uG82zT/6dX9Gk
         iq4KxDT/VSck/NaOCLZEMcJNDcK2sFVO0IZiBxSJCCqczGnxtFKy7Gy8hA9sJ9i5bCVT
         heBxyTfS+6GcxLdBC+xGy8XWim89ABzsIPZi9tv2RKqttu1CT7mjnpRLjKHBoHCW7oaf
         H1IQ==
X-Gm-Message-State: AOAM530L/yJbXNmwbYieWVKcFpu+jRLMriz+FoQjR6cMc3Lc2W2UN1eh
	KTDDlkivWNW5J0epLGmHrcY4Ww==
X-Google-Smtp-Source: ABdhPJzjkNI9SKbyu+IPKMI7hdxzFtaOw5Wr2qt8pXhyFiGleK1poevdfJ72z/Y8dOnIezY6TauObw==
X-Received: by 2002:a05:6000:1611:b0:210:28cc:65dd with SMTP id u17-20020a056000161100b0021028cc65ddmr10243171wrb.700.1653941708426;
        Mon, 30 May 2022 13:15:08 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:15:07 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 7/7] drm/mediatek: add MT8365 SoC support
Date: Mon, 30 May 2022 22:14:36 +0200
Message-Id: <20220530201436.902505-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_131508_982059_157230E0 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6abe6bcacbdc..0a30ec75b1e2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -195,6 +195,22 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt8365_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DSI0,
+};
+
+static const enum mtk_ddp_comp_id mt8365_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -253,6 +269,13 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.main_path = mt8365_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
+	.ext_path = mt8365_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -490,6 +513,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -564,6 +589,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8186_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
