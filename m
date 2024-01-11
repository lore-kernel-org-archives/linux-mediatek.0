Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC360C4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCkOlbpufV21T73lKyqSSfv/lw+c6vBMckvXJPt/9ic=; b=C8h0AHskomhSPqoYY+qbeZxyVP
	jIgPrroEpv+Awf4pN8oNqn+HUpDWrfcBcGZHj77NwNoYte8g4BkJQEpwSCxbkauEtfepKPH9hCTC4
	qm6TH/Xispc8FchKF/B/SIcR+0Drpui292E+WKVlTPdvFscFgr/O1Q2tPOiwP/WD/EfIUjfJf+hgC
	NG0zNt44ShmPCT9qGE/l58S6nxMI711ToW9NQoNRBxCMbMm5uPneUebJU0mNwSt0CcDt5QnDLTN02
	8XmqisDQ2VkmgNQxV1ISoZ1CingSL3Iyr92sfSVrguiRND8hK2fbiRU7tJ3acj2QjT84gJmViwrJm
	8WVAPNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgJ-00H5z6-0R;
	Thu, 11 Jan 2024 10:53:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgA-00H5pg-21;
	Thu, 11 Jan 2024 10:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970373;
	bh=t5/M/FDJlEol50qHM5SqsEKoXsNv1Vb4Pkp42aLqIa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4kLQ0pRzFTsf7+QSE8HGBiTkkbxto3GLyZ/YvnTZ3mYaGX8FfpVDoW/lCHeVEnrp
	 KDquhySZRSotQRrNpFz7IxcBhS8HRZql2vryLjMWnFXGTsPv1mm83U4LWKVWBbFh1n
	 kNp5Q0TsZ4yta0eBv1yrC3tqnJJTrn5uMX1BLsO1an4Om8eIsjITCVEyP2Ge9CLhXz
	 AVRGSiVkjnfVb9kpbBfTX9kERC6Xsl8c4gwQuOo2AF/PHqrXvKSWgPTtGbCs1Hs2qQ
	 Igi4DuQN7WY0gWzRwOnUKN+jHP27eSWNFbWSYz6lwKV+xDJIKIwqjyrKQ5zUgG2YPn
	 TBQ7/nNSxctcA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 65DF93781FCB;
	Thu, 11 Jan 2024 10:52:52 +0000 (UTC)
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
Subject: [PATCH 2/7] ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
Date: Thu, 11 Jan 2024 11:52:42 +0100
Message-ID: <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025254_796563_FF5171B5 
X-CRM114-Status: GOOD (  15.19  )
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

Function devm_snd_soc_register_component() allocates a new struct
snd_soc_component, adds components and initializes them; since this
is also devm, it automatically unregisters components and frees
memory upon destruction.

That's exactly what we're doing in the probe function of this driver:
switch to that function instead, allowing to remove the last goto and
to discard the .remove_new() callback for this driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 58 +++-------------------
 1 file changed, 8 insertions(+), 50 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index ea611730de9c..b887e10635fe 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1129,72 +1129,31 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8173_afe_runtime_resume;
 	afe->runtime_suspend = mt8173_afe_runtime_suspend;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mtk_afe_pcm_platform,
-					 NULL, 0);
+	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform, NULL, 0);
 	if (ret)
 		return ret;
 
-	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
-	if (!comp_pcm)
-		return -ENOMEM;
-
-	ret = snd_soc_component_initialize(comp_pcm,
-					   &mt8173_afe_pcm_dai_component,
-					   &pdev->dev);
+	ret = devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_pcm_dai_component,
+					      mt8173_afe_pcm_dais,
+					      ARRAY_SIZE(mt8173_afe_pcm_dais));
 	if (ret)
 		return ret;
 
-#ifdef CONFIG_DEBUG_FS
-	comp_pcm->debugfs_prefix = "pcm";
-#endif
-
-	ret = snd_soc_add_component(comp_pcm,
-				    mt8173_afe_pcm_dais,
-				    ARRAY_SIZE(mt8173_afe_pcm_dais));
+	ret = devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_hdmi_dai_component,
+					      mt8173_afe_hdmi_dais,
+					      ARRAY_SIZE(mt8173_afe_hdmi_dais));
 	if (ret)
 		return ret;
 
-	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
-	if (!comp_hdmi) {
-		ret = -ENOMEM;
-		goto err_cleanup_components;
-	}
-
-	ret = snd_soc_component_initialize(comp_hdmi,
-					   &mt8173_afe_hdmi_dai_component,
-					   &pdev->dev);
-	if (ret)
-		goto err_cleanup_components;
-
-#ifdef CONFIG_DEBUG_FS
-	comp_hdmi->debugfs_prefix = "hdmi";
-#endif
-
-	ret = snd_soc_add_component(comp_hdmi,
-				    mt8173_afe_hdmi_dais,
-				    ARRAY_SIZE(mt8173_afe_hdmi_dais));
-	if (ret)
-		goto err_cleanup_components;
-
 	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret) {
 		dev_err(afe->dev, "could not request_irq\n");
-		goto err_cleanup_components;
+		return ret;
 	}
 
 	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
 	return 0;
-
-err_cleanup_components:
-	snd_soc_unregister_component(&pdev->dev);
-	return ret;
-}
-
-static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_component(&pdev->dev);
 }
 
 static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
@@ -1215,7 +1174,6 @@ static struct platform_driver mt8173_afe_pcm_driver = {
 		   .pm = &mt8173_afe_pm_ops,
 	},
 	.probe = mt8173_afe_pcm_dev_probe,
-	.remove_new = mt8173_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8173_afe_pcm_driver);
-- 
2.43.0


