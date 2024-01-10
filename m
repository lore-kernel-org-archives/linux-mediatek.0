Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D09C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Rl+iEa6cK9wzmOdCEGnhWOT8PAhGDZuza6jLI6/6x4=; b=wSbyt6Ig52OWG/tRUEngYl1bRX
	o9WT6U63r/g9WThEdGDn+7V97DTTHvGurEDrQaQZ6FOkNF0KcOFxP1eRWJmA1G2gsU4ZtHet0AGkQ
	ub3hdCMvbYp/V8nBDHDwQETXSMRsJyKnDM0JDtfKmoyodkoariX8m8HZtdT49YoKmNoQp10dbpCNK
	OadNIqflslMIt+ugo5VKVkWTHX/aEHgtM4EDGqCQ4oHvEpUEIzIo/bEUX+cyh/u0UCcgbbVK8sZmx
	1SdtFA/xL/4gTwhwImN47U2LZjG9FzRqbxcwvTK3rAv4J06iTuL8kKL4a4lBtf7u8QPaeUQumw739
	UZmfRwMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWHt-00B7lD-0l;
	Wed, 10 Jan 2024 10:58:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWHp-00B7jr-1q;
	Wed, 10 Jan 2024 10:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704884294;
	bh=ejCQ/B2168XNcMV52MIKqts9e15VwfWaFghCB5BVK5M=;
	h=From:To:Cc:Subject:Date:From;
	b=ZZyHrYV3/0myTKoWch/rgpBIlOIGYxgRA1mywFfFpVBmqCBn9/9zFri/PCwHKtDm8
	 VBzZXQF28pRNt3yryKEPWeLBMxIK8IdBwRk/3y4JnPUwgPg4yk/C2OiEmBFvOKAOzn
	 9PyMICsaY/bVtP1YUh0qnXBcydNwdryl37wgf67EFayGxaZqFrZTL2q94jItQLKg/N
	 Q0e8CnDgQa+GD6IqkcobAFTv/e8mRFvXh8kt3pbZZ4Li2y75ipw7pGUEqjeDVoqHbR
	 /GHZLCtopQ4/BgvkMQ38FEJI2RinLXuQz6Bd5yEu+aKFzlS3KE/0Hiw7lAWyguGcdG
	 1NDRZi+UR0WZw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A85273780C21;
	Wed, 10 Jan 2024 10:58:13 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	trevor.wu@mediatek.com,
	jernej.skrabec@gmail.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link
Date: Wed, 10 Jan 2024 11:57:57 +0100
Message-ID: <20240110105757.539089-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_025817_761455_2EAB8823 
X-CRM114-Status: GOOD (  21.63  )
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

Remove the extra 'mt8195-afe-pcm-dai' component, register the DAI
drivers to the main AFE component, and rework the DAI linking between
the headset codec (RT5682/RT5682S) and the TDM interface in the probe
function to stop assigning name, relying on the of_node of the codec.
Also replace the COMP_DUMMY codec entry with a COMP_EMPTY for the
ETDM2_IN and remove it entirely from ETDM1_OUT to fix the registration
flow for this sound card.

While at it, since we also need to swap the codec init function from
ETDM2_IN to ETDM1_OUT, remove the static assignment of both `ops` and
`init` for both, as we now assign these dynamically during probe.

Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

This was tested on the MT8195 Cherry Tomato Chromebook w/Pipewire:
audio works again with both internal speakers and 3.5mm jack.
As a (mostly personal) note, this driver's probe function should get
refactored at some point to rely on snd_soc_of_parse_audio_routing()
instead; I plan to do that as soon as I can (bandwidth permitting...!)

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 33 +----------------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c  | 41 +++++++++++++++-------
 2 files changed, 29 insertions(+), 45 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1e33863c85ca..620d7ade1992 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -1795,10 +1795,6 @@ static const struct snd_kcontrol_new mt8195_memif_controls[] = {
 			    MT8195_AFE_IRQ_28),
 };
 
-static const struct snd_soc_component_driver mt8195_afe_pcm_dai_component = {
-	.name = "mt8195-afe-pcm-dai",
-};
-
 static const struct mtk_base_memif_data memif_data[MT8195_AFE_MEMIF_NUM] = {
 	[MT8195_AFE_MEMIF_DL2] = {
 		.name = "DL2",
@@ -3037,7 +3033,6 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
 	int i, irq_id, ret;
-	struct snd_soc_component *component;
 
 	ret = of_reserved_mem_device_init(dev);
 	if (ret)
@@ -3170,36 +3165,12 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mt8195_afe_component,
-					      NULL, 0);
+					      afe->dai_drivers, afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
 		goto err_pm_put;
 	}
 
-	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
-	if (!component) {
-		ret = -ENOMEM;
-		goto err_pm_put;
-	}
-
-	ret = snd_soc_component_initialize(component,
-					   &mt8195_afe_pcm_dai_component,
-					   dev);
-	if (ret)
-		goto err_pm_put;
-
-#ifdef CONFIG_DEBUG_FS
-	component->debugfs_prefix = "pcm";
-#endif
-
-	ret = snd_soc_add_component(component,
-				    afe->dai_drivers,
-				    afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_dai_component\n");
-		goto err_pm_put;
-	}
-
 	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
 				     ARRAY_SIZE(mt8195_afe_reg_defaults));
 	if (ret)
@@ -3224,8 +3195,6 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	snd_soc_unregister_component(&pdev->dev);
-
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8195_afe_runtime_suspend(&pdev->dev);
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 4feb9fb76967..53fd8a897b9d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -934,12 +934,11 @@ SND_SOC_DAILINK_DEFS(ETDM1_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_IN")),
-		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
-		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
@@ -1237,8 +1236,6 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_capture = 1,
-		.init = mt8195_rt5682_init,
-		.ops = &mt8195_rt5682_etdm_ops,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM2_IN_BE),
 	},
@@ -1249,7 +1246,6 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_playback = 1,
-		.ops = &mt8195_rt5682_etdm_ops,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
 	},
@@ -1381,7 +1377,7 @@ static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_link;
 	struct mtk_soc_card_data *soc_card_data;
 	struct mt8195_mt6359_priv *mach_priv;
-	struct device_node *platform_node, *adsp_node, *dp_node, *hdmi_node;
+	struct device_node *platform_node, *adsp_node, *codec_node, *dp_node, *hdmi_node;
 	struct mt8195_card_data *card_data;
 	int is5682s = 0;
 	int init6359 = 0;
@@ -1401,8 +1397,12 @@ static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
 	if (!card->name)
 		card->name = card_data->name;
 
-	if (strstr(card->name, "_5682s"))
+	if (strstr(card->name, "_5682s")) {
+		codec_node = of_find_compatible_node(NULL, NULL, "realtek,rt5682s");
 		is5682s = 1;
+	} else
+		codec_node = of_find_compatible_node(NULL, NULL, "realtek,rt5682i");
+
 	soc_card_data = devm_kzalloc(&pdev->dev, sizeof(*card_data), GFP_KERNEL);
 	if (!soc_card_data)
 		return -ENOMEM;
@@ -1488,12 +1488,27 @@ static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
 			}
-		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
-			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
-			dai_link->codecs->name =
-				is5682s ? RT5682S_DEV0_NAME : RT5682_DEV0_NAME;
-			dai_link->codecs->dai_name =
-				is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
+		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0) {
+			if (!codec_node) {
+				dev_err(&pdev->dev, "Codec not found!\n");
+			} else {
+				dai_link->codecs->of_node = codec_node;
+				dai_link->codecs->name = NULL;
+				dai_link->codecs->dai_name =
+					is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
+				dai_link->init = mt8195_rt5682_init;
+				dai_link->ops = &mt8195_rt5682_etdm_ops;
+			}
+		} else if (strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			if (!codec_node) {
+				dev_err(&pdev->dev, "Codec not found!\n");
+			} else {
+				dai_link->codecs->of_node = codec_node;
+				dai_link->codecs->name = NULL;
+				dai_link->codecs->dai_name =
+					is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
+				dai_link->ops = &mt8195_rt5682_etdm_ops;
+			}
 		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
 			   strcmp(dai_link->name, "UL_SRC1_BE") == 0 ||
 			   strcmp(dai_link->name, "UL_SRC2_BE") == 0) {
-- 
2.43.0


