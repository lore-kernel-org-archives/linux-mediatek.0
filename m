Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA0CC4167D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MhKZsumq4MWT0PZMk1o4yZqjjymXBYPrRSLeOSmgoI=; b=DZ3ZnolEBM6vj4vkngrGi0405H
	TAvs1Oapc3d82cpQqC97VVOMIFdFCtQNoVuqFkSZ/nQbJFAO/P9pnbZEtnbllxCnOarLfG3N/5i/P
	fIg4cQyvkdjBsLMXTov8WmNGxmIBdhytQvTEXveth5Fp3dDSImI/ilpIbAuXTyklYirhxnzdVG8r6
	z8m+1PPe+t94J0Trwll+uPlmmLzpgBpEhaXzpeDzqoqzeLTpH3rfFtVEk1jAaVHnXZd9sOVxd1xlU
	dLUt1V97xgipW8WnW3P7ublGTv4lWw4KT48ZAWLmAYmwmX6egTmAoT7tjzoA6lPI07IwumZc70BR4
	i12JKgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNb9-00EV9X-2u;
	Wed, 13 Dec 2023 11:40:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNb5-00EV6r-1k
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 11:40:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d075392ff6so53631105ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702467615; x=1703072415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MhKZsumq4MWT0PZMk1o4yZqjjymXBYPrRSLeOSmgoI=;
        b=jZew9MF5A21HfPWNVCpdeVIzgX4M8UrK//ZyHxLN7IvM25ov/5K3OSBQuLMgKZRrfG
         cWeV63ivafBz64Yyk5Ao4ByYXtrk616ic16tTavhPmFDnjVbjkKRRuv2trBlp9K4pqSn
         WjZd449aNdldUCnD3YBXZ7CYMZvhgKah2C7NJjCaQ9sZBb60ZdSkibVz1Hz5IgGLupkx
         IXkvplIlhPBU4pmv5ZeL0EjFIW8irYaKHVuODTer2gJnZne2QA1y3fLW5sNklyIF9wLh
         x54Kdjnva7GbGKiX5DDdgqLV8N5YtfodIY+G7xkRs+Azh+icHFV+md9vVOXz5ClHetox
         7vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467615; x=1703072415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MhKZsumq4MWT0PZMk1o4yZqjjymXBYPrRSLeOSmgoI=;
        b=rsCQwOVarmDUqhN7HzRdpVSHFORRGe1YjdoQi65ZurueQ2v6ukS3YiUYKYWnUDBqB7
         mvWEdPdDinztC7itRt5+i+sl+hwEsGEcxYCRX/73F1haOMWWPgZ2Thz0mYExdpfPtvy/
         dyTSXODZHpMCNd8dWUjL3QUDO4y3XC/c5qFl1WQLk8DHvAEWDD7wwOzpX96KVOd+ykEq
         KnROyj+hBxOsQcBtszpU8elAftzax7wKoKjK0yK6WCCobcEK6so81t9NhzVVS/ZTCZdI
         VkEAAda8bBdU6m0q7Xl9FyBpHs+lCnzh4ZxV+hJwiRlgwCd7pvwSwmLvyeA4Aa3xVdeh
         C01Q==
X-Gm-Message-State: AOJu0Yze01RDmcrAYuFSSX40talZIAH3NK/14DKLGWjahVgW8XIXwwOE
	YW5ij4MUzcG4sJNeLTeHZjqryA==
X-Google-Smtp-Source: AGHT+IHPM0t2mzP01VO6cshlgighsDqYCmxGKn5nvhUslBUK1iGtE1r4KJF4obXaN6/7iR1x0S6uiA==
X-Received: by 2002:a17:902:d48e:b0:1d3:5da4:68e7 with SMTP id c14-20020a170902d48e00b001d35da468e7mr88730plg.53.1702467614952;
        Wed, 13 Dec 2023 03:40:14 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902b20100b001bb9d6b1baasm10331066plr.198.2023.12.13.03.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:40:14 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [RESEND PATCH v9 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Date: Wed, 13 Dec 2023 19:39:54 +0800
Message-Id: <20231213113955.47668-4-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
References: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_034015_579503_1D141541 
X-CRM114-Status: GOOD (  21.90  )
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

To use ES8326 as the codec, add a new sound card
named mt8186_es8326.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig                |  1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 56 ++++++++++++++++++++++-
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index b93d455744ab..296b434caf81 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -252,6 +252,7 @@ config SND_SOC_MT8188_MT6359
 	select SND_SOC_NAU8315
 	select SND_SOC_NAU8825
 	select SND_SOC_RT5682S
+	select SND_SOC_ES8326
 	help
 	  This adds support for ASoC machine driver for MediaTek MT8188
 	  boards with the MT6359 and other I2S audio codecs.
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index b4606a28794c..d1884f23a1a7 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -34,6 +34,8 @@
 
 #define NAU8825_HS_PRESENT	BIT(0)
 #define RT5682S_HS_PRESENT	BIT(1)
+#define ES8326_HS_PRESENT	BIT(2)
+#define MAX98390_TWO_AMP	BIT(3)
 /*
  * Maxim MAX98390
  */
@@ -48,6 +50,11 @@
  */
 #define NAU8825_CODEC_DAI  "nau8825-hifi"
 
+/*
+ * ES8326
+ */
+#define ES8326_CODEC_DAI  "ES8326 HiFi"
+
 #define SOF_DMA_DL2 "SOF_DMA_DL2"
 #define SOF_DMA_DL3 "SOF_DMA_DL3"
 #define SOF_DMA_UL4 "SOF_DMA_UL4"
@@ -888,6 +895,30 @@ static const struct snd_soc_ops mt8188_sof_be_ops = {
 	.hw_params = mt8188_sof_be_hw_params,
 };
 
+static int mt8188_es8326_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	unsigned int rate = params_rate(params);
+	int ret;
+
+	/* Configure MCLK for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, rate * 256, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set MCLK %d\n", ret);
+		return ret;
+	}
+
+	/* Configure MCLK for cpu */
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 256, SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8188_es8326_ops = {
+	.hw_params = mt8188_es8326_hw_params,
+};
+
 static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	/* FE */
 	[DAI_LINK_DL2_FE] = {
@@ -1197,7 +1228,7 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 	struct mt8188_card_data *card_data = (struct mt8188_card_data *)priv->private_data;
 	struct snd_kcontrol *kctl;
 
-	if (card_data->quirk & (NAU8825_HS_PRESENT | RT5682S_HS_PRESENT)) {
+	if (card_data->quirk & (NAU8825_HS_PRESENT | RT5682S_HS_PRESENT | ES8326_HS_PRESENT)) {
 		struct snd_soc_dapm_widget *w, *next_w;
 
 		for_each_card_widgets_safe(card, w, next_w) {
@@ -1238,6 +1269,7 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 	struct mt8188_card_data *card_data;
 	struct snd_soc_dai_link *dai_link;
 	bool init_mt6359 = false;
+	bool init_es8326 = false;
 	bool init_nau8825 = false;
 	bool init_rt5682s = false;
 	bool init_max98390 = false;
@@ -1344,7 +1376,14 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 			   strcmp(dai_link->name, "ETDM1_IN_BE") == 0 ||
 			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
 			if (!strcmp(dai_link->codecs->dai_name, MAX98390_CODEC_DAI)) {
-				dai_link->ops = &mt8188_max98390_ops;
+				/*
+				 * The TDM protocol settings with fixed 4 slots are defined in
+				 * mt8188_max98390_ops. Two amps is I2S mode,
+				 * SOC and codec don't require TDM settings.
+				 */
+				if (!(card_data->quirk & MAX98390_TWO_AMP)) {
+					dai_link->ops = &mt8188_max98390_ops;
+				}
 				if (!init_max98390) {
 					dai_link->init = mt8188_max98390_codec_init;
 					init_max98390 = true;
@@ -1363,6 +1402,13 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 					dai_link->exit = mt8188_headset_codec_exit;
 					init_rt5682s = true;
 				}
+			} else if (!strcmp(dai_link->codecs->dai_name, ES8326_CODEC_DAI)) {
+				dai_link->ops = &mt8188_es8326_ops;
+				if (!init_es8326) {
+					dai_link->init = mt8188_headset_codec_init;
+					dai_link->exit = mt8188_headset_codec_exit;
+					init_es8326 = true;
+				}
 			} else {
 				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {
 					if (!init_dumb) {
@@ -1405,10 +1451,16 @@ static struct mt8188_card_data mt8188_rt5682s_card = {
 	.quirk = RT5682S_HS_PRESENT,
 };
 
+static struct mt8188_card_data mt8188_es8326_card = {
+	.name = "mt8188_es8326",
+	.quirk = ES8326_HS_PRESENT | MAX98390_TWO_AMP,
+};
+
 static const struct of_device_id mt8188_mt6359_dt_match[] = {
 	{ .compatible = "mediatek,mt8188-mt6359-evb", .data = &mt8188_evb_card, },
 	{ .compatible = "mediatek,mt8188-nau8825", .data = &mt8188_nau8825_card, },
 	{ .compatible = "mediatek,mt8188-rt5682s", .data = &mt8188_rt5682s_card, },
+	{ .compatible = "mediatek,mt8188-es8326", .data = &mt8188_es8326_card, },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mt8188_mt6359_dt_match);
-- 
2.25.1


