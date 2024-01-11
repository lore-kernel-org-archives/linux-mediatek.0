Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3947AC4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ALrbd2JpX74rt3/OOa08roRjOzOcpqki0C3oZHINDg=; b=JWemyuT8FtiL3jdCr1thjFo3I0
	bx+IyfsJKlEy5VSFheY+PG6vPprnVmcH0nymjLo5sv/tviRbCinahM9hMKcrJIUOdLZM8905LTmaj
	QOZE5xxrudSXgT2d9omSIHXwzPN1Bz83VV6RzmFQFJkKMxhEME03B0I/Nx6SPDJmFyDCcz4hIWr3n
	ucqN/QdBnUBcAE6zY6p5Tr82axHVFU5s7RkPJieauUH/zltu2TCvCnZREe2RJ0ZUsdQsCAukSvtf7
	KoA5RUIXpss5xuGnZWFP5P/IkhBVxYZ5rEouGnjLLAmzMWoS/W37YTN/gKJfkOIJKRvMBrJTLJBP7
	uSxQOn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgS-00H67Z-1K;
	Thu, 11 Jan 2024 10:53:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgF-00H5vl-2f;
	Thu, 11 Jan 2024 10:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970378;
	bh=3cQvnwcXHoi10LGhXXkqD+S50rLO3Wezsg1rzILzUxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLVk0hS9qP1S0SfjosuThhHcG23RNZwo7E3I5N+W/tIuoxBDnsIj+HaMXf69ntc4i
	 WNK7/lNLCd/XFvkNMyM/+Y7z/UEIFzf45S7zaWASQFMA88ATcBJCB+O3RSIVm23plI
	 K/KPoRpBKcat+wzk0kK3DpfkHl4EtN3Ie+DRu0dz6W7M7TGBFOa7DlKL+PQDS9yx+7
	 QJSODtPQv5ASzB1zbVYuzxXnF/J1BrT78DYGqTVPr/E8mC6uEcY38yz+qCMbZyjiGw
	 G6c78RnowRrlD36tFeMHibVHe5cJJWpeYGDXJBVTKgAxM2s+Mpa/6a8v4hMkuqMsG9
	 1cdHYvyEgmPcw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8FB5F3781F8E;
	Thu, 11 Jan 2024 10:52:57 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ribalda@chromium.org,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6/7] ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err_probe()
Date: Thu, 11 Jan 2024 11:52:46 +0100
Message-ID: <20240111105247.117766-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025300_004849_696068B0 
X-CRM114-Status: GOOD (  13.36  )
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

Simplify the probe function by switching error prints to return
dev_err_probe(), lowering the lines count; while at it, also
beautify some messages and change some others' level from warn
to error.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 65 ++++++++--------------
 1 file changed, 22 insertions(+), 43 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 794419d16b01..7242e6a4625c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2205,17 +2205,12 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
-	if (IS_ERR(rstc)) {
-		ret = PTR_ERR(rstc);
-		dev_err(dev, "could not get audiosys reset:%d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "could not get audiosys reset\n");
 
 	ret = reset_control_reset(rstc);
-	if (ret) {
-		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to trigger audio reset\n");
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
@@ -2223,25 +2218,21 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* regmap init */
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
-	if (IS_ERR(afe->regmap)) {
-		dev_err(dev, "could not get regmap from parent\n");
-		return PTR_ERR(afe->regmap);
-	}
+	if (IS_ERR(afe->regmap))
+		return dev_err_probe(dev, PTR_ERR(afe->regmap),
+				     "could not get regmap from parent");
+
 	ret = regmap_attach_dev(dev, afe->regmap, &mt8192_afe_regmap_config);
-	if (ret) {
-		dev_warn(dev, "regmap_attach_dev fail, ret %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "regmap_attach_dev fail\n");
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
 	pm_runtime_get_sync(&pdev->dev);
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
-	if (ret) {
-		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
 
 	pm_runtime_put_sync(&pdev->dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
@@ -2281,30 +2272,22 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for Afe_ISR_Handle\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
 
 	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
 		ret = dai_register_cbs[i](afe);
-		if (ret) {
-			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
-				 i, ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(afe->dev, ret, "dai %d register fail");
 	}
 
 	/* init dai_driver and component_driver */
 	ret = mtk_afe_combine_sub_dai(afe);
-	if (ret) {
-		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
-			 ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(afe->dev, ret, "mtk_afe_combine_sub_dai fail\n");
 
 	/* others */
 	afe->mtk_afe_hardware = &mt8192_afe_hardware;
@@ -2320,19 +2303,15 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register platform */
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &mt8192_afe_component, NULL, 0);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't register AFE component\n");
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &mt8192_afe_pcm_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_dai_component\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't register AFE-PCM component\n");
 
 	return 0;
 }
-- 
2.43.0


