Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B401C47DA2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O8ZrcaR95aEVQuJKgVgDSb7Jh2dZAmhdZPIKOujSEo=; b=aVXKNrjLoUV9uJutr34r/HvK39
	rmYFJI/tR9Cj8m8tF6LbON+00eVqrXH7hSbzlMougXJxz0DceZS1ImEV5CXizt7atHwpAuI5/vX4Q
	orl3rVa7lRnWuJlCpmYCvXSPEnX+5HAeewdKg8E0HpqDWvhHShoEWOamiEuQjqLC+HAwj+8zktl/s
	m6SOu+FvrzWKwlXSJ98D1qPyXUT+nKnFK9ER3ni5+nykoMkWXScB3fUgKsZYnXQ3dOg2oySA2hN2h
	eDl/VFkRh7RkCLB1otuDcP53pESlM/cYlTRM5zUgJ+GyPjCXM8hvHskY6XgjQlA3Dl5gEp0BKT1Wi
	fa/d3IVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgK-00H60M-2p;
	Thu, 11 Jan 2024 10:53:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgB-00H5qp-35;
	Thu, 11 Jan 2024 10:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970374;
	bh=XtTNhQjNYRIFbYwAaKzO87OecuRQA3f4cAGt5GDFOck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNUrzbk4r7fbiviJuXD8oxOtb3iKe5EZ6yqmDkIH8kPltzXtNMpmI4NOGq83MEVI1
	 4Oo7NquB7Nzi2dhpP6zLKHsiIAv4YfyQ94P04Tt7KnQHn1+6cs/B/4ujmR4GY2/chb
	 ezNdk7jrKmWEYZYWLG6bfgIHa0EXuDHw+Quxj8Ab0WNdz0Vc6e1MUPPXwMtNqrI0+7
	 j99NGjV5OZp8xAq8LmRDhmiMLj2AONbdaj6D10To8MFPFOegcE7eEouWNyge8/QAJt
	 u5G+4gBJ0vGkhi/GVWq8O4Fyk+rBpNVNLUj10ulNJgIRmVx5HdI90peUi77GUlQZPL
	 IByK4lwVHvKtg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AB3883781FCD;
	Thu, 11 Jan 2024 10:52:53 +0000 (UTC)
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
Subject: [PATCH 3/7] ASoC: mediatek: mt8183-afe-pcm: Convert to devm_pm_runtime_enable()
Date: Thu, 11 Jan 2024 11:52:43 +0100
Message-ID: <20240111105247.117766-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025256_141528_4E97CBBE 
X-CRM114-Status: GOOD (  15.58  )
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

Switch from pm_runtime_enable() to devm_pm_runtime_enable() to simplify
the probe function and remove the now useless .remove_new() callback.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 57 ++++++++--------------
 1 file changed, 20 insertions(+), 37 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 9e432ed9124b..d10aabf65a78 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1113,32 +1113,33 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	/* regmap init */
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
 		dev_err(dev, "could not get regmap from parent\n");
-		ret = PTR_ERR(afe->regmap);
-		goto err_pm_disable;
+		return PTR_ERR(afe->regmap);
 	}
 	ret = regmap_attach_dev(dev, afe->regmap, &mt8183_afe_regmap_config);
 	if (ret) {
 		dev_warn(dev, "regmap_attach_dev fail, ret %d\n", ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	rstc = devm_reset_control_get(dev, "audiosys");
 	if (IS_ERR(rstc)) {
 		ret = PTR_ERR(rstc);
 		dev_err(dev, "could not get audiosys reset:%d\n", ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	ret = reset_control_reset(rstc);
 	if (ret) {
 		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	/* enable clock for regcache get default value from hw */
@@ -1148,7 +1149,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
 	if (ret) {
 		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	pm_runtime_put_sync(&pdev->dev);
@@ -1161,10 +1162,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->memif_size = MT8183_MEMIF_NUM;
 	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
 				  GFP_KERNEL);
-	if (!afe->memif) {
-		ret = -ENOMEM;
-		goto err_pm_disable;
-	}
+	if (!afe->memif)
+		return -ENOMEM;
 
 	for (i = 0; i < afe->memif_size; i++) {
 		afe->memif[i].data = &memif_data[i];
@@ -1181,26 +1180,22 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->irqs_size = MT8183_IRQ_NUM;
 	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
 				 GFP_KERNEL);
-	if (!afe->irqs) {
-		ret = -ENOMEM;
-		goto err_pm_disable;
-	}
+	if (!afe->irqs)
+		return -ENOMEM;
 
 	for (i = 0; i < afe->irqs_size; i++)
 		afe->irqs[i].irq_data = &irq_data[i];
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id < 0) {
-		ret = irq_id;
-		goto err_pm_disable;
-	}
+	if (irq_id < 0)
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret) {
 		dev_err(dev, "could not request_irq for asys-isr\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	/* init sub_dais */
@@ -1211,7 +1206,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
 				 i, ret);
-			goto err_pm_disable;
+			return ret;
 		}
 	}
 
@@ -1220,7 +1215,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
 			 ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	afe->mtk_afe_hardware = &mt8183_afe_hardware;
@@ -1236,7 +1231,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_component(afe->dev,
@@ -1245,21 +1240,10 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
-	return ret;
-
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	return ret;
-}
-
-static void mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8183_afe_runtime_suspend(&pdev->dev);
+	return 0;
 }
 
 static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
@@ -1280,7 +1264,6 @@ static struct platform_driver mt8183_afe_pcm_driver = {
 		   .pm = &mt8183_afe_pm_ops,
 	},
 	.probe = mt8183_afe_pcm_dev_probe,
-	.remove_new = mt8183_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8183_afe_pcm_driver);
-- 
2.43.0


