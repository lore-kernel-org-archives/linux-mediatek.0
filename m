Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D7FC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXa4ipj5zRw2bVBNxgQx3ZtVKWlGRcCu0Y2bi/aJ5mI=; b=K4nGRYN5or1jBWDOibyz10XOIr
	r1rnQO8jho/5rOG7D8S8ez1TYg+vtyVZCggjBTwidKuPaMdcJ7MTqxIvCA+QOPD6/JNMWJvoVp8V/
	kErFN++NKm4wT9MrYoWI3B2aQDy8USAi518Z5D1FBI0RVZiPcQAamdgtaUiyhM609EBxmeA3n69rc
	XreizerYUsntAJXoPS2vGLHHfGwQuHl0q0zWAYUXF2xdKkJfIk9JrZv/O+7IdM55xdwO0ZroynIGo
	9VucxeHVLyKdrGWqYUNvZiqqKTT0rcw64NkpSy+o4ZhPkxtPAe0vX/tPnDW+6qAukV9TIg+2dqhjq
	2vSWmabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzF8H-009ZNd-2G;
	Wed, 17 May 2023 11:15:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzF8D-009ZLm-2K;
	Wed, 17 May 2023 11:15:47 +0000
X-UUID: 26fca356f4a411ed83ed1395ce914268-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OXa4ipj5zRw2bVBNxgQx3ZtVKWlGRcCu0Y2bi/aJ5mI=;
	b=oLYkwVK+LKgONlLVW6qm6ywX7/ZPMGf8uMboANpKA4GMl/luoQTSGA9pn+FiisDM/QWTRgPiF2zEQtOQE/gmS7R0dYdCY9pKS40QUgGhiS1TzXzg8kPS3ROnteqAtj8VESOdIOe4mnvi9Kfeiaok8vdiFbgWnKvbAXgb5M/kSSI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:94bc3186-493c-4948-91ec-e1288028e20f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:887825c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 26fca356f4a411ed83ed1395ce914268-20230517
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 894884119; Wed, 17 May 2023 04:15:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:15:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:15:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/5] ASoC: mediatek: mt8188: separate ADDA playback dai from capture dai
Date: Wed, 17 May 2023 19:15:30 +0800
Message-ID: <20230517111534.32630-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517111534.32630-1-trevor.wu@mediatek.com>
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_041545_775289_6C350670 
X-CRM114-Status: GOOD (  23.10  )
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

MT8188 will support SOF. In SOF, be_hw_params_fixup callback are used to
configure BE hardware parameters. However, playback and capture stream
share the same callback function in which it can't know the stream type.

It's possible to require different paremters for playback and capture
stream, so separate them into two dais for SOF usage.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-common.h |  3 +-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c   | 76 ++++++++++---------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 34 +++++++--
 3 files changed, 68 insertions(+), 45 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-common.h b/sound/soc/mediatek/mt8188/mt8188-afe-common.h
index eb7e57c239bd..1304d685a306 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-common.h
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-common.h
@@ -39,7 +39,7 @@ enum {
 	MT8188_AFE_MEMIF_END,
 	MT8188_AFE_MEMIF_NUM = (MT8188_AFE_MEMIF_END - MT8188_AFE_MEMIF_START),
 	MT8188_AFE_IO_START = MT8188_AFE_MEMIF_END,
-	MT8188_AFE_IO_ADDA = MT8188_AFE_IO_START,
+	MT8188_AFE_IO_DL_SRC = MT8188_AFE_IO_START,
 	MT8188_AFE_IO_DMIC_IN,
 	MT8188_AFE_IO_DPTX,
 	MT8188_AFE_IO_ETDM_START,
@@ -52,6 +52,7 @@ enum {
 	MT8188_AFE_IO_ETDM_NUM =
 		(MT8188_AFE_IO_ETDM_END - MT8188_AFE_IO_ETDM_START),
 	MT8188_AFE_IO_PCM = MT8188_AFE_IO_ETDM_END,
+	MT8188_AFE_IO_UL_SRC,
 	MT8188_AFE_IO_END,
 	MT8188_AFE_IO_NUM = (MT8188_AFE_IO_END - MT8188_AFE_IO_START),
 	MT8188_DAI_END = MT8188_AFE_IO_END,
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
index fed9f927e623..9a6673a6f28a 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
@@ -53,8 +53,7 @@ enum {
 };
 
 struct mtk_dai_adda_priv {
-	unsigned int dl_rate;
-	unsigned int ul_rate;
+	bool hires_required;
 };
 
 static unsigned int afe_adda_dl_rate_transform(struct mtk_base_afe *afe,
@@ -241,42 +240,35 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int mtk_afe_adc_hires_connect(struct snd_soc_dapm_widget *source,
-				     struct snd_soc_dapm_widget *sink)
+static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
+						       const char *name)
 {
-	struct snd_soc_dapm_widget *w = source;
-	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
-	struct mtk_dai_adda_priv *adda_priv;
-
-	adda_priv = afe_priv->dai_priv[MT8188_AFE_IO_ADDA];
 
-	if (!adda_priv) {
-		dev_err(afe->dev, "%s adda_priv == NULL", __func__);
-		return 0;
-	}
-
-	return !!(adda_priv->ul_rate > ADDA_HIRES_THRES);
+	if (strstr(name, "aud_adc_hires"))
+		return afe_priv->dai_priv[MT8188_AFE_IO_UL_SRC];
+	else if (strstr(name, "aud_dac_hires"))
+		return afe_priv->dai_priv[MT8188_AFE_IO_DL_SRC];
+	else
+		return NULL;
 }
 
-static int mtk_afe_dac_hires_connect(struct snd_soc_dapm_widget *source,
-				     struct snd_soc_dapm_widget *sink)
+static int mtk_afe_adda_hires_connect(struct snd_soc_dapm_widget *source,
+				      struct snd_soc_dapm_widget *sink)
 {
 	struct snd_soc_dapm_widget *w = source;
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
-	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_adda_priv *adda_priv;
 
-	adda_priv = afe_priv->dai_priv[MT8188_AFE_IO_ADDA];
+	adda_priv = get_adda_priv_by_name(afe, w->name);
 
 	if (!adda_priv) {
-		dev_err(afe->dev, "%s adda_priv == NULL", __func__);
+		dev_dbg(afe->dev, "adda_priv == NULL");
 		return 0;
 	}
 
-	return !!(adda_priv->dl_rate > ADDA_HIRES_THRES);
+	return (adda_priv->hires_required) ? 1 : 0;
 }
 
 static const struct snd_kcontrol_new mtk_dai_adda_o176_mix[] = {
@@ -361,7 +353,7 @@ static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
 	{"ADDA Capture", NULL, "ADDA Capture Enable"},
 	{"ADDA Capture", NULL, "ADDA_MTKAIF_CFG"},
 	{"ADDA Capture", NULL, "aud_adc"},
-	{"ADDA Capture", NULL, "aud_adc_hires", mtk_afe_adc_hires_connect},
+	{"ADDA Capture", NULL, "aud_adc_hires", mtk_afe_adda_hires_connect},
 
 	{"I168", NULL, "ADDA Capture"},
 	{"I169", NULL, "ADDA Capture"},
@@ -369,7 +361,7 @@ static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
 	{"ADDA Playback", NULL, "ADDA Enable"},
 	{"ADDA Playback", NULL, "ADDA Playback Enable"},
 	{"ADDA Playback", NULL, "aud_dac"},
-	{"ADDA Playback", NULL, "aud_dac_hires", mtk_afe_dac_hires_connect},
+	{"ADDA Playback", NULL, "aud_dac_hires", mtk_afe_adda_hires_connect},
 
 	{"DL_GAIN", NULL, "O176"},
 	{"DL_GAIN", NULL, "O177"},
@@ -503,13 +495,15 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %u\n",
 		__func__, id, substream->stream, rate);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		adda_priv->dl_rate = rate;
+	if (rate > ADDA_HIRES_THRES)
+		adda_priv->hires_required = 1;
+	else
+		adda_priv->hires_required = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		ret = mtk_dai_da_configure(afe, rate, id);
-	} else {
-		adda_priv->ul_rate = rate;
+	else
 		ret = mtk_dai_ad_configure(afe, rate, id);
-	}
 
 	return ret;
 }
@@ -536,8 +530,8 @@ static const struct snd_soc_dai_ops mtk_dai_adda_ops = {
 
 static struct snd_soc_dai_driver mtk_dai_adda_driver[] = {
 	{
-		.name = "ADDA",
-		.id = MT8188_AFE_IO_ADDA,
+		.name = "DL_SRC",
+		.id = MT8188_AFE_IO_DL_SRC,
 		.playback = {
 			.stream_name = "ADDA Playback",
 			.channels_min = 1,
@@ -545,6 +539,11 @@ static struct snd_soc_dai_driver mtk_dai_adda_driver[] = {
 			.rates = MTK_ADDA_PLAYBACK_RATES,
 			.formats = MTK_ADDA_FORMATS,
 		},
+		.ops = &mtk_dai_adda_ops,
+	},
+	{
+		.name = "UL_SRC",
+		.id = MT8188_AFE_IO_UL_SRC,
 		.capture = {
 			.stream_name = "ADDA Capture",
 			.channels_min = 1,
@@ -560,13 +559,18 @@ static int init_adda_priv_data(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_adda_priv *adda_priv;
+	int adda_dai_list[] = {MT8188_AFE_IO_DL_SRC, MT8188_AFE_IO_UL_SRC};
+	int i;
 
-	adda_priv = devm_kzalloc(afe->dev, sizeof(struct mtk_dai_adda_priv),
-				 GFP_KERNEL);
-	if (!adda_priv)
-		return -ENOMEM;
+	for (i = 0; i < ARRAY_SIZE(adda_dai_list); i++) {
+		adda_priv = devm_kzalloc(afe->dev,
+					 sizeof(struct mtk_dai_adda_priv),
+					 GFP_KERNEL);
+		if (!adda_priv)
+			return -ENOMEM;
 
-	afe_priv->dai_priv[MT8188_AFE_IO_ADDA] = adda_priv;
+		afe_priv->dai_priv[adda_dai_list[i]] = adda_priv;
+	}
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 919d74ea1934..833bc362dad2 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -99,8 +99,8 @@ SND_SOC_DAILINK_DEFS(capture10,
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 /* BE */
-SND_SOC_DAILINK_DEFS(adda,
-		     DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
+SND_SOC_DAILINK_DEFS(dl_src,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL_SRC")),
 		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
 						   "mt6359-snd-codec-aif1")),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
@@ -140,6 +140,12 @@ SND_SOC_DAILINK_DEFS(pcm1,
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(ul_src,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif1")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 struct mt8188_mt6359_priv {
 	struct snd_soc_jack dp_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -345,7 +351,7 @@ enum {
 	DAI_LINK_UL8_FE,
 	DAI_LINK_UL9_FE,
 	DAI_LINK_UL10_FE,
-	DAI_LINK_ADDA_BE,
+	DAI_LINK_DL_SRC_BE,
 	DAI_LINK_DPTX_BE,
 	DAI_LINK_ETDM1_IN_BE,
 	DAI_LINK_ETDM2_IN_BE,
@@ -353,6 +359,7 @@ enum {
 	DAI_LINK_ETDM2_OUT_BE,
 	DAI_LINK_ETDM3_OUT_BE,
 	DAI_LINK_PCM1_BE,
+	DAI_LINK_UL_SRC_BE,
 };
 
 static int mt8188_dptx_hw_params(struct snd_pcm_substream *substream,
@@ -604,13 +611,11 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		SND_SOC_DAILINK_REG(capture10),
 	},
 	/* BE */
-	[DAI_LINK_ADDA_BE] = {
-		.name = "ADDA_BE",
+	[DAI_LINK_DL_SRC_BE] = {
+		.name = "DL_SRC_BE",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		.init = mt8188_mt6359_init,
-		SND_SOC_DAILINK_REG(adda),
+		SND_SOC_DAILINK_REG(dl_src),
 	},
 	[DAI_LINK_DPTX_BE] = {
 		.name = "DPTX_BE",
@@ -676,6 +681,12 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(pcm1),
 	},
+	[DAI_LINK_UL_SRC_BE] = {
+		.name = "UL_SRC_BE",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ul_src),
+	},
 };
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
@@ -695,6 +706,7 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 	struct mt8188_mt6359_priv *priv;
 	struct mt8188_card_data *card_data;
 	struct snd_soc_dai_link *dai_link;
+	bool init_mt6359 = false;
 	int ret, i;
 
 	card_data = (struct mt8188_card_data *)of_device_get_match_data(&pdev->dev);
@@ -739,6 +751,12 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
 			if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
 				dai_link->init = mt8188_hdmi_codec_init;
+		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
+			   strcmp(dai_link->name, "UL_SRC_BE") == 0) {
+			if (!init_mt6359) {
+				dai_link->init = mt8188_mt6359_init;
+				init_mt6359 = true;
+			}
 		}
 	}
 
-- 
2.18.0


