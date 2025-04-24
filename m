Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E109C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE7aKSxABLvt9Zl1mpyqzpBOR0S+DjSniaX8iFCPAyw=; b=C0ljR6pY9EOCy/0zQc0aLZh5zx
	bC3upjfiaUUVuqF114wEOBhaMmgHYoF5wjznadmhMlRhnm15VMMz+5iFglDHpx7cY2Zv0oPZLFvD7
	+Gk2qW0CB0KvTl/t/pfdE1y6Aa2RU0902nfE2B6IqkUWzeVL5hTwqAb7zU+QZ7yjnb73gKDtk2491
	EUG0dX4yWaoseYEMzadXAV0GpDGf9S9TY1SdcAsFVK6hih5YkxCxmekOD6IQ04VTFsA8AtgFlhgh+
	/+LnSznKSk3KAL/vIwiFFRO48I3kS4Ljy3biX58PJ7Kt3tU55QYaFmfKB2W0K1Za2JhKsEgV95n38
	OOdh+/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uzm-0000000DuBv-3NQz;
	Thu, 24 Apr 2025 11:43:58 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tm6-0000000DfXX-3ruo
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:48 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b1396171fb1so444209a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490346; x=1746095146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE7aKSxABLvt9Zl1mpyqzpBOR0S+DjSniaX8iFCPAyw=;
        b=HOp7ez+KBHZ1ocZxCPT6E9GNNUKE0AyOnnzgAjrlU6q7pxor9rXIg5N5KoJpXtHHRv
         MwEpy89ygzFWSCB5aUCffQdTGvS3Ww2h40DmF+zm7fXdvq75Chd64jawBMR1EnI4W56Y
         eN/HnyGDQbEcSmTt5MJzKfRmFDNiTTT6RcUs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490346; x=1746095146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE7aKSxABLvt9Zl1mpyqzpBOR0S+DjSniaX8iFCPAyw=;
        b=Bt1WGReky5iGVCfHIEZ2F2dy1OiR7Qt2Afm7ZCyQGNY/McC8CXlUPmHhx+bmjhMCMG
         vSwV4EwoyPhMUxltpSj7+huRnzoq4swGUQrda3PbHPGvVxVrR4wefb0+SnXwh8dZqH4B
         fu9Yi+XyqsRiVVfsOrbV6kohtAhxHb6f7N4RIIkfBa/7p9xBnOiEcKVH1cb8uW2q8jIP
         TDl/YUcsFgg+VXYdmuuydwvSP1+WhnezLsK4ryafQtnIPHKscl5Nx3rItOO8frELfhCT
         6turMc3Tk6RGwczJA0jkb6QCPLiZnO7kQNgYV4dnFhzfl+cxi946v5ogeJ7NDX2pWFfA
         ZQAw==
X-Forwarded-Encrypted: i=1; AJvYcCVmUwu1eFqFvVIJMY1URo915p99GQK5O2dn04unpc8M0RnpSh6vrRPxMxRozlhbM8n7qNONp5nzDZVus4o40g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRkLUyAQwoxieTwHjGukgHJu6eEUnpdOe2oncpcJQudi41x1Sv
	koiwxQ2YN6Kz2gxXuY/NAYm0L5XMX47GzW8wDRSL9LT/xbHuqYU/Y6XOp5/SGA==
X-Gm-Gg: ASbGncsiw7j9tmE3boZaB9ATAxAdNazaXq8yY4bOAhqiMXLlKDJrm4frnYY8Ti63gEw
	hao25VtNqwORKoXh+Rt9Pf8QmkimeUnX4FptI8X1IPbQsjtQk/XCJf2+8ze+WazonKvILKXHLMh
	77pnkHSiQcjIVG0U+uV79u6sNd7FWditIngx2SLfWe1xl4H5ZKFoGPUH14v9rey/PucJGZS9cM7
	MjULwaro4mJDGhGsuGChXZUm8ssGfBZ1Wacu2lGqrag5lUtULetFK3cHlaRT31CmcjPnIU2rStE
	n2cHsN5saqoiycllNZ+QpZ6XXGmJ8m1jo1A0cE7l5iXA9SCzdWRn5mEonA==
X-Google-Smtp-Source: AGHT+IEXiipgjpnZjo9b641rUil17G3O4+rk2vLeF36iNimZzjzuklvaviqehXQCV3mCF6B2BIqVZg==
X-Received: by 2002:a17:90b:224a:b0:2fe:d766:ad8e with SMTP id 98e67ed59e1d1-309ed24bc78mr3343313a91.4.1745490345566;
        Thu, 24 Apr 2025 03:25:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/13] ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver callbacks
Date: Thu, 24 Apr 2025 18:25:02 +0800
Message-ID: <20250424102509.1083185-9-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032546_978481_26B3AD1B 
X-CRM114-Status: GOOD (  17.34  )
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

The probe and remove functions in the mt8183-afe-pcm driver repeatedly uses
`&pdev->dev` for |struct device *|, but then assigns this value to
`afe->dev` and uses that in other places in the same function.

Store `&pdev->dev` in a local pointer and use that exclusively to avoid
the numerous dereferences and to make the code more consistent. Lines
are reflowed where it makes sense.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 63 +++++++++++-----------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index f93d6348fdf8..c0fa623e0b17 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1054,26 +1054,26 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct mtk_base_afe *afe;
 	struct mt8173_afe_private *afe_priv;
 	struct snd_soc_component *comp_pcm, *comp_hdmi;
+	struct device *dev = &pdev->dev;
 
-	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));
 	if (ret)
 		return ret;
 
-	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
 
-	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
-					  GFP_KERNEL);
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
 	afe_priv = afe->platform_priv;
 	if (!afe_priv)
 		return -ENOMEM;
 
-	afe->dev = &pdev->dev;
+	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
+	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
-		dev_info(&pdev->dev, "no reserved memory found, pre-allocating buffers instead\n");
+		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
 	}
 
@@ -1085,27 +1085,27 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
 
-	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
-		&mt8173_afe_regmap_config);
+	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
+					    &mt8173_afe_regmap_config);
 	if (IS_ERR(afe->regmap))
 		return PTR_ERR(afe->regmap);
 
 	/* initial audio related clock */
 	ret = mt8173_afe_init_audio_clk(afe);
 	if (ret) {
-		dev_err(afe->dev, "mt8173_afe_init_audio_clk fail\n");
+		dev_err(dev, "mt8173_afe_init_audio_clk fail\n");
 		return ret;
 	}
 
 	/* memif % irq initialize*/
 	afe->memif_size = MT8173_AFE_MEMIF_NUM;
-	afe->memif = devm_kcalloc(afe->dev, afe->memif_size,
+	afe->memif = devm_kcalloc(dev, afe->memif_size,
 				  sizeof(*afe->memif), GFP_KERNEL);
 	if (!afe->memif)
 		return -ENOMEM;
 
 	afe->irqs_size = MT8173_AFE_IRQ_NUM;
-	afe->irqs = devm_kcalloc(afe->dev, afe->irqs_size,
+	afe->irqs = devm_kcalloc(dev, afe->irqs_size,
 				 sizeof(*afe->irqs), GFP_KERNEL);
 	if (!afe->irqs)
 		return -ENOMEM;
@@ -1124,9 +1124,9 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, afe);
 
-	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = mt8173_afe_runtime_resume(&pdev->dev);
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev)) {
+		ret = mt8173_afe_runtime_resume(dev);
 		if (ret)
 			goto err_pm_disable;
 	}
@@ -1136,13 +1136,12 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8173_afe_runtime_resume;
 	afe->runtime_suspend = mt8173_afe_runtime_suspend;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mtk_afe_pcm_platform,
-					 NULL, 0);
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
+					      NULL, 0);
 	if (ret)
 		goto err_pm_disable;
 
-	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
+	comp_pcm = devm_kzalloc(dev, sizeof(*comp_pcm), GFP_KERNEL);
 	if (!comp_pcm) {
 		ret = -ENOMEM;
 		goto err_pm_disable;
@@ -1150,7 +1149,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = snd_soc_component_initialize(comp_pcm,
 					   &mt8173_afe_pcm_dai_component,
-					   &pdev->dev);
+					   dev);
 	if (ret)
 		goto err_pm_disable;
 
@@ -1164,7 +1163,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_disable;
 
-	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
+	comp_hdmi = devm_kzalloc(dev, sizeof(*comp_hdmi), GFP_KERNEL);
 	if (!comp_hdmi) {
 		ret = -ENOMEM;
 		goto err_cleanup_components;
@@ -1172,7 +1171,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = snd_soc_component_initialize(comp_hdmi,
 					   &mt8173_afe_hdmi_dai_component,
-					   &pdev->dev);
+					   dev);
 	if (ret)
 		goto err_cleanup_components;
 
@@ -1186,30 +1185,32 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_components;
 
-	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
+	ret = devm_request_irq(dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret) {
-		dev_err(afe->dev, "could not request_irq\n");
+		dev_err(dev, "could not request_irq\n");
 		goto err_cleanup_components;
 	}
 
-	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
+	dev_info(dev, "MT8173 AFE driver initialized.\n");
 	return 0;
 
 err_cleanup_components:
-	snd_soc_unregister_component(&pdev->dev);
+	snd_soc_unregister_component(dev);
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
 static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	snd_soc_unregister_component(&pdev->dev);
+	struct device *dev = &pdev->dev;
 
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8173_afe_runtime_suspend(&pdev->dev);
+	snd_soc_unregister_component(dev);
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt8173_afe_runtime_suspend(dev);
 }
 
 static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
-- 
2.49.0.805.g082f7c87e0-goog


