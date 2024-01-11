Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C754C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IYyC4d/hNrMlC2tVu1GIwMwt/EpR1E5m0XFiTNzcRE=; b=ZPe50OV+WIuEtXvJg1/opX1TWw
	PCcJTFq/WijKPWTlLxt/EDBeBaNB+/B/ZfrkLEUBrsqrGUrGa4lUPQOi9UVLhMU/CsfufxH5TT0a5
	8UmNRQYq9SdPvv6yHVCI8NwCFfPH1PO3MjyhAFEPEtKyYaclrkgjc1c33j7cu+/Yq+dJDGYxtZmMq
	Hyzbw88JMEqevCnEyQ7IhLRtkY0vgvwkXfnZhLj8thCRkN+RWDSjZTLge0Vx9sSd6UVVgeQClHNfn
	Rrf9W0ITqMb33ireacJkwvqwCoKuqk3Gci0XGFkTS04h8SY/puRzGI8dLEK36ZuRr/MhR+HCRsJba
	X/cg/5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsgG-00H5xR-2m;
	Thu, 11 Jan 2024 10:53:00 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsg9-00H5oo-1G;
	Thu, 11 Jan 2024 10:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970372;
	bh=AMVfzvbVKztx/7y6kdCGWvpZXOG+ZdfCsQ9HsmGMSIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qk+I+0DxAYUMmqa4SXs2yQNDEr8U9KFs2met++sPRrAGr9Sv8ukwt5HOmrMslZ1b/
	 C8gok5VsWBPtXV+T38iN7/ogRpLsVSWbXRN7Lb7Ut714tTRoLCRRlpfMw9GtJvcqTj
	 fwUvnljf4hrlDGINcL0v6lLnfJ22gP2G1iYV94ya+8jhgU5a0UzBweWPJ+QGF+R7TN
	 XJkTvLgVkz+XLA6MV/Bb5fHToJfW0gNcJysA9P0lCXXFl2enyOS3rrUltQ5JFXEXX0
	 s4N1UbVY+stgZdg4nG7rRkiyFH/TO78m1+9AWXJOXqsb4164xAbxlZBQ/3c0JFsvDH
	 LidQhyG5J8XVQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 21F8E3781F8E;
	Thu, 11 Jan 2024 10:52:51 +0000 (UTC)
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
Subject: [PATCH 1/7] ASoC: mediatek: mt8173-afe-pcm: Convert to devm_pm_runtime_enable()
Date: Thu, 11 Jan 2024 11:52:41 +0100
Message-ID: <20240111105247.117766-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025253_561276_967582FE 
X-CRM114-Status: GOOD (  12.32  )
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
the probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b6291b7c811e..ea611730de9c 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1117,11 +1117,11 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, afe);
 
-	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret) {
 		ret = mt8173_afe_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
 
 	afe->reg_back_up_list = mt8173_afe_backup_list;
@@ -1133,19 +1133,17 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 					 &mtk_afe_pcm_platform,
 					 NULL, 0);
 	if (ret)
-		goto err_pm_disable;
+		return ret;
 
 	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
-	if (!comp_pcm) {
-		ret = -ENOMEM;
-		goto err_pm_disable;
-	}
+	if (!comp_pcm)
+		return -ENOMEM;
 
 	ret = snd_soc_component_initialize(comp_pcm,
 					   &mt8173_afe_pcm_dai_component,
 					   &pdev->dev);
 	if (ret)
-		goto err_pm_disable;
+		return ret;
 
 #ifdef CONFIG_DEBUG_FS
 	comp_pcm->debugfs_prefix = "pcm";
@@ -1155,7 +1153,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 				    mt8173_afe_pcm_dais,
 				    ARRAY_SIZE(mt8173_afe_pcm_dais));
 	if (ret)
-		goto err_pm_disable;
+		return ret;
 
 	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
 	if (!comp_hdmi) {
@@ -1191,18 +1189,12 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 err_cleanup_components:
 	snd_soc_unregister_component(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
 
 static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	snd_soc_unregister_component(&pdev->dev);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8173_afe_runtime_suspend(&pdev->dev);
 }
 
 static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
-- 
2.43.0


