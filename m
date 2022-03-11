Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CB9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcoDIBvavXStO87+pqeFV8D4nkYqca6gXwmEvmB1sSc=; b=kONtREk1ZU8YTg
	7sl7zzk64S5nb1doZbo/1rwJLCvgTs5v1HGjHwEvBarhw/V95nKrIJHimN6lGs7H2U7kwk9OudM9u
	Je5tDY/6D9JWdDmi8jxncJIa0wNJamaUOaTCST57maE4/OgoZz5xAwjadzb81sMkGVINPgEFfAxyY
	jcG+GKJSamXGVOJ9Ti2HZcA6Jw+P69Vz+mwg17efcA8Em48FDNG56w91fgxgTPD2DOUOx/ECjL1ba
	5Fz8DRaMldg1ON6yRbu7b7aum3dcF3TLRyVXx5HJGYkPcZ70npzlJABhTr8WAztOxuIT3K/85w1Z/
	tLnwwiZHWs89PM4gPuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSi2K-00HKFJ-Hf; Fri, 11 Mar 2022 16:22:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSi27-00HK9o-QA; Fri, 11 Mar 2022 16:22:29 +0000
X-UUID: 38f76a9aa3c84f8d90ea21716ca0bb85-20220311
X-UUID: 38f76a9aa3c84f8d90ea21716ca0bb85-20220311
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1861453812; Fri, 11 Mar 2022 09:22:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 08:22:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 12 Mar 2022 00:22:17 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Mar 2022 00:22:16 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <linmq006@gmail.com>, <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, kernel test robot <lkp@intel.com>
Subject: [v4 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Date: Sat, 12 Mar 2022 00:22:13 +0800
Message-ID: <20220311162213.6942-3-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311162213.6942-1-jiaxin.yu@mediatek.com>
References: <20220311162213.6942-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_082227_901097_D61E9CCA 
X-CRM114-Status: GOOD (  22.26  )
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

Supports machines with rt1015p and rt5682s. Uses new proposed compatible
string "mt8192_mt6359_rt1015p_rt5682s". Using define to simplifies card
name and compatible name, and uses the snd_soc_of_get_dai_link_codecs()
to complete the configuration of dai_link's codecs.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/mediatek/Kconfig                    |   1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 204 +++++++++++-------
 2 files changed, 128 insertions(+), 77 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 0d154350f180..bb774dfe867f 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -179,6 +179,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	help
 	  This adds ASoC driver for Mediatek MT8192 boards
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index ee91569c0911..c140d3a5978e 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -28,8 +28,13 @@
 #define RT1015_DEV0_NAME	"rt1015.1-0028"
 #define RT1015_DEV1_NAME	"rt1015.1-0029"
 
-#define RT5682_CODEC_DAI	"rt5682-aif1"
-#define RT5682_DEV0_NAME	"rt5682.1-001a"
+#define RT1015_RT5682_CARD_NAME "mt8192_mt6359_rt1015_rt5682"
+#define RT1015P_RT5682_CARD_NAME "mt8192_mt6359_rt1015p_rt5682"
+#define RT1015P_RT5682S_CARD_NAME "mt8192_mt6359_rt1015p_rt5682s"
+
+#define RT1015_RT5682_OF_NAME "mediatek,mt8192_mt6359_rt1015_rt5682"
+#define RT1015P_RT5682_OF_NAME "mediatek,mt8192_mt6359_rt1015p_rt5682"
+#define RT1015P_RT5682S_OF_NAME "mediatek,mt8192_mt6359_rt1015p_rt5682s"
 
 struct mt8192_mt6359_priv {
 	struct snd_soc_jack headset_jack;
@@ -71,8 +76,8 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
-static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
-				       struct snd_pcm_hw_params *params)
+static int mt8192_rt5682x_i2s_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
@@ -121,8 +126,8 @@ static const struct snd_soc_ops mt8192_rt1015_i2s_ops = {
 	.hw_params = mt8192_rt1015_i2s_hw_params,
 };
 
-static const struct snd_soc_ops mt8192_rt5682_i2s_ops = {
-	.hw_params = mt8192_rt5682_i2s_hw_params,
+static const struct snd_soc_ops mt8192_rt5682x_i2s_ops = {
+	.hw_params = mt8192_rt5682x_i2s_hw_params,
 };
 
 static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
@@ -604,17 +609,9 @@ SND_SOC_DAILINK_DEFS(i2s2,
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-SND_SOC_DAILINK_DEFS(i2s3_rt1015,
-		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME,
-						   RT1015_CODEC_DAI),
-					COMP_CODEC(RT1015_DEV1_NAME,
-						   RT1015_CODEC_DAI)),
-		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
+SND_SOC_DAILINK_DEFS(i2s3,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC("rt1015p", "HiFi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(i2s5,
@@ -634,14 +631,12 @@ SND_SOC_DAILINK_DEFS(i2s7,
 
 SND_SOC_DAILINK_DEFS(i2s8,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S8")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(i2s9,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S9")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(connsys_i2s,
@@ -929,6 +924,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s3),
 	},
 	{
 		.name = "I2S5",
@@ -962,7 +958,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.init = mt8192_rt5682_init,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s8),
-		.ops = &mt8192_rt5682_i2s_ops,
+		.ops = &mt8192_rt5682x_i2s_ops,
 	},
 	{
 		.name = "I2S9",
@@ -971,7 +967,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s9),
-		.ops = &mt8192_rt5682_i2s_ops,
+		.ops = &mt8192_rt5682x_i2s_ops,
 	},
 	{
 		.name = "CONNSYS_I2S",
@@ -1051,7 +1047,7 @@ static struct snd_soc_codec_conf rt1015_amp_conf[] = {
 };
 
 static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
-	.name = "mt8192_mt6359_rt1015_rt5682",
+	.name = RT1015_RT5682_CARD_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
@@ -1066,13 +1062,13 @@ static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
 };
 
 static const struct snd_soc_dapm_widget
-mt8192_mt6359_rt1015p_rt5682_widgets[] = {
+mt8192_mt6359_rt1015p_rt5682x_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
-static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682_routes[] = {
+static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682x_routes[] = {
 	/* speaker */
 	{ "Speakers", NULL, "Speaker" },
 	/* headset */
@@ -1081,74 +1077,112 @@ static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682_routes[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682_controls[] = {
+static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682x_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
-static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
-	.name = "mt8192_mt6359_rt1015p_rt5682",
+static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682x_card = {
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
-	.controls = mt8192_mt6359_rt1015p_rt5682_controls,
-	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_controls),
-	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_widgets),
-	.dapm_routes = mt8192_mt6359_rt1015p_rt5682_routes,
-	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
+	.controls = mt8192_mt6359_rt1015p_rt5682x_controls,
+	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_controls),
+	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682x_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_widgets),
+	.dapm_routes = mt8192_mt6359_rt1015p_rt5682x_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_routes),
 };
 
+static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
+					  struct snd_soc_dai_link *link,
+					  struct device_node *node,
+					  char *link_name)
+{
+	int ret;
+
+	if (node && strcmp(link->name, link_name) == 0) {
+		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
+		if (ret < 0) {
+			dev_err(card->dev, "get dai link codecs fail\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node, *hdmi_codec;
+	struct device_node *platform_node, *hdmi_codec, *headset_codec, *speaker_codec;
 	int ret, i;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8192_mt6359_priv *priv;
+	struct device *dev;
 
-	platform_node = of_parse_phandle(pdev->dev.of_node,
-					 "mediatek,platform", 0);
-	if (!platform_node) {
-		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
+	if (!card)
 		return -EINVAL;
+	card->dev = &pdev->dev;
+	dev = &pdev->dev;
+
+	if (of_device_is_compatible(dev->of_node, RT1015P_RT5682_OF_NAME))
+		card->name = RT1015P_RT5682_CARD_NAME;
+	else if (of_device_is_compatible(dev->of_node, RT1015P_RT5682S_OF_NAME))
+		card->name = RT1015P_RT5682S_CARD_NAME;
+	else
+		dev_dbg(dev, "No need to set card name\n");
+
+	platform_node = of_parse_phandle(dev->of_node, "mediatek,platform", 0);
+	if (!platform_node) {
+		ret = -EINVAL;
+		dev_err_probe(dev, ret, "Property 'platform' missing or invalid\n");
+		goto err_platform_node;
 	}
 
-	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card) {
+	hdmi_codec = of_parse_phandle(dev->of_node, "mediatek,hdmi-codec", 0);
+	if (!hdmi_codec) {
 		ret = -EINVAL;
-		goto put_platform_node;
+		dev_err_probe(dev, ret, "Property 'hdmi-codec' missing or invalid\n");
+		goto err_hdmi_codec;
 	}
-	card->dev = &pdev->dev;
 
-	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
-				      "mediatek,hdmi-codec", 0);
+	speaker_codec = of_get_child_by_name(dev->of_node, "mediatek,speaker-codec");
+	if (!speaker_codec) {
+		ret = -EINVAL;
+		dev_err_probe(dev, ret, "Property 'speaker_codec' missing or invalid\n");
+		goto err_speaker_codec;
+	}
+
+	headset_codec = of_get_child_by_name(dev->of_node, "mediatek,headset-codec");
+	if (!headset_codec) {
+		ret = -EINVAL;
+		dev_err_probe(dev, ret, "Property 'headset_codec' missing or invalid\n");
+		goto err_headset_codec;
+	}
 
 	for_each_card_prelinks(card, i, dai_link) {
-		if (strcmp(dai_link->name, "I2S3") == 0) {
-			if (card == &mt8192_mt6359_rt1015_rt5682_card) {
-				dai_link->ops = &mt8192_rt1015_i2s_ops;
-				dai_link->cpus = i2s3_rt1015_cpus;
-				dai_link->num_cpus =
-					ARRAY_SIZE(i2s3_rt1015_cpus);
-				dai_link->codecs = i2s3_rt1015_codecs;
-				dai_link->num_codecs =
-					ARRAY_SIZE(i2s3_rt1015_codecs);
-				dai_link->platforms = i2s3_rt1015_platforms;
-				dai_link->num_platforms =
-					ARRAY_SIZE(i2s3_rt1015_platforms);
-			} else if (card == &mt8192_mt6359_rt1015p_rt5682_card) {
-				dai_link->cpus = i2s3_rt1015p_cpus;
-				dai_link->num_cpus =
-					ARRAY_SIZE(i2s3_rt1015p_cpus);
-				dai_link->codecs = i2s3_rt1015p_codecs;
-				dai_link->num_codecs =
-					ARRAY_SIZE(i2s3_rt1015p_codecs);
-				dai_link->platforms = i2s3_rt1015p_platforms;
-				dai_link->num_platforms =
-					ARRAY_SIZE(i2s3_rt1015p_platforms);
-			}
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
+		}
+
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S8");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
+		}
+
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S9");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
 		}
 
 		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
@@ -1156,6 +1190,9 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 			dai_link->ignore = 0;
 		}
 
+		if (strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
+			dai_link->ops = &mt8192_rt1015_i2s_ops;
+
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
 	}
@@ -1163,34 +1200,47 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-		goto put_hdmi_codec;
+		goto err_probe;
 	}
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = mt8192_afe_gpio_init(&pdev->dev);
 	if (ret) {
-		dev_err(&pdev->dev, "init gpio error %d\n", ret);
-		goto put_hdmi_codec;
+		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
+		goto err_probe;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-
-put_hdmi_codec:
+	if (ret)
+		dev_err_probe(&pdev->dev, ret,
+			      "%s snd_soc_register_card fail\n", __func__);
+
+err_probe:
+	of_node_put(headset_codec);
+err_headset_codec:
+	of_node_put(speaker_codec);
+err_speaker_codec:
 	of_node_put(hdmi_codec);
-put_platform_node:
+err_hdmi_codec:
 	of_node_put(platform_node);
+err_platform_node:
+
 	return ret;
 }
 
 #ifdef CONFIG_OF
 static const struct of_device_id mt8192_mt6359_dt_match[] = {
 	{
-		.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",
+		.compatible = RT1015_RT5682_OF_NAME,
 		.data = &mt8192_mt6359_rt1015_rt5682_card,
 	},
 	{
-		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682",
-		.data = &mt8192_mt6359_rt1015p_rt5682_card,
+		.compatible = RT1015P_RT5682_OF_NAME,
+		.data = &mt8192_mt6359_rt1015p_rt5682x_card,
+	},
+	{
+		.compatible = RT1015P_RT5682S_OF_NAME,
+		.data = &mt8192_mt6359_rt1015p_rt5682x_card,
 	},
 	{}
 };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
