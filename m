Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F5FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M331DWHCCqSC9sVSDwF28T/y1jBvm90AxElw1INfbnE=; b=MlyYG/jVgiRsFI
	S3AwSXYQtVlbz/3n08Kl6KpIUNWOCbbUJiaKT9eVgQFA1WGSOeXYsdMNR7AjVVBq81txpb1MBi332
	SUAOiIQEWfx119+8mstNQktawJiclQBcsUrti8/oRbsrRxJQypuHv5kOcoY+gpzC9CG5xHTpJrSx0
	Om6CrHZLTUtLb38/PrZNZDz9vr1DSNyK7yVyKd5QzxCNQiAg0r9tMwLJUAMGgEKlvNFhCjrWmo2A9
	snZPkc2QI4nVG0VZxefBgQGzkhuOIjB3Kq/X04mqIFJfgPUwhr4K+ZJlfe5pphJe9JBxbJ2/TO8gp
	wuEOw4mh31ico91FtKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms4QZ-005fpq-4p; Tue, 30 Nov 2021 14:48:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms4QF-005fhp-QE; Tue, 30 Nov 2021 14:47:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7ADC6B81A28;
 Tue, 30 Nov 2021 14:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40F7C53FC7;
 Tue, 30 Nov 2021 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283673;
 bh=dB039tXiUfR5atMXTXRS1CLvWHjSriJnQGgSR4GL2LM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BBzFahDALdXxUQR3T9kIXCOLBeaJsk0UhTR6zK+YLhWZ9IXSKTeI+FnN3+TMK+GKG
 3qjVLAkZWFcDNO6k07quk5h2ZdpoagHHvihx1JMp7HkoCVY8caZj0smmx6FOv3+mVG
 /Ozu6XuxFtOk1q9/zr/VAhRJEFNKHMo5rNXDSddnG7zFBwZQQPsfz153Uy2/m+WT23
 9u3QN6MusFBUlS8evZGyIGVI1ZviG0HVkHlESsFkgpnAc28ejSY01pyKopypipQvpW
 VSqOeh+wfmldo5o+JnW998y4ckDp9AM8Wjejbw/1M/+6EUHL/QYm969POsG5EsybQV
 sn0wDxw6HUotw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, kuninori.morimoto.gx@renesas.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 13/68] ASoC: mediatek: mt8173: Fix debugfs
 registration for components
Date: Tue, 30 Nov 2021 09:46:09 -0500
Message-Id: <20211130144707.944580-13-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_064756_161570_C702D6DF 
X-CRM114-Status: GOOD (  16.64  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 8c32984bc7da29828260ac514d5d4967f7e8f62d ]

When registering the mt8173-afe-pcm driver, we are also adding two
components: one is for the PCM DAIs and one is for the HDMI DAIs, but
when debugfs is enabled, we're getting the following issue:

[   17.279176] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!
[   17.288345] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!

To overcome to that without any potentially big rewrite of this driver,
similarly to what was done in mt8195-afe-pcm, add a debugfs_prefix to
the components before actually adding them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20211111161108.502344-1-angelogioacchino.delregno@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 51 ++++++++++++++++++----
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 6350390414d4a..31494930433f7 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1054,6 +1054,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	int irq_id;
 	struct mtk_base_afe *afe;
 	struct mt8173_afe_private *afe_priv;
+	struct snd_soc_component *comp_pcm, *comp_hdmi;
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
 	if (ret)
@@ -1142,23 +1143,55 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_disable;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mt8173_afe_pcm_dai_component,
-					 mt8173_afe_pcm_dais,
-					 ARRAY_SIZE(mt8173_afe_pcm_dais));
+	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
+	if (!comp_pcm) {
+		ret = -ENOMEM;
+		goto err_pm_disable;
+	}
+
+	ret = snd_soc_component_initialize(comp_pcm,
+					   &mt8173_afe_pcm_dai_component,
+					   &pdev->dev);
 	if (ret)
 		goto err_pm_disable;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mt8173_afe_hdmi_dai_component,
-					 mt8173_afe_hdmi_dais,
-					 ARRAY_SIZE(mt8173_afe_hdmi_dais));
+#ifdef CONFIG_DEBUG_FS
+	comp_pcm->debugfs_prefix = "pcm";
+#endif
+
+	ret = snd_soc_add_component(comp_pcm,
+				    mt8173_afe_pcm_dais,
+				    ARRAY_SIZE(mt8173_afe_pcm_dais));
+	if (ret)
+		goto err_pm_disable;
+
+	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
+	if (!comp_hdmi) {
+		ret = -ENOMEM;
+		goto err_pm_disable;
+	}
+
+	ret = snd_soc_component_initialize(comp_hdmi,
+					   &mt8173_afe_hdmi_dai_component,
+					   &pdev->dev);
 	if (ret)
 		goto err_pm_disable;
 
+#ifdef CONFIG_DEBUG_FS
+	comp_hdmi->debugfs_prefix = "hdmi";
+#endif
+
+	ret = snd_soc_add_component(comp_hdmi,
+				    mt8173_afe_hdmi_dais,
+				    ARRAY_SIZE(mt8173_afe_hdmi_dais));
+	if (ret)
+		goto err_cleanup_components;
+
 	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
 	return 0;
 
+err_cleanup_components:
+	snd_soc_unregister_component(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 	return ret;
@@ -1166,6 +1199,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static int mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	snd_soc_unregister_component(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8173_afe_runtime_suspend(&pdev->dev);
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
