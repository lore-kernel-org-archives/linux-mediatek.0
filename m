Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1455ECE7A89
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI5M8VqjHxg4TM8TEPWCg+/Qvd/N7ZnqfdNTC0OI6Ds=; b=pnB6GnRWf+rb5ANdVYDu4r2Nro
	dqbLlnsxNbbJLlwCSqliTf54fwolbqM791cSExL5BZq1WZNPWR6cpCzdtMOo1Cm0+o71w1LLeV5pQ
	6OM/QLjpSCtho2mw7D3mTHeHNbAqSpwMMvwHFWH/1iiTascSsxR7hWqZLOOeHhemFPwT3Ztfz6/fE
	6WfQTlv6HWtRGpJyJf8eAh7m1UqQ8E88hSMGDzd3MAPB53hozK2H3S1KDEc+bzcNjr2XarfKegp2v
	CWAAOH4j3kLDsPI6ddHz9z7sxhHeo4q/089XXt8FtdDb20trWAjo4MjUDuAW96OQCvyAGR+JShJYR
	KfdrP7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkh7h-00Dkx2-01;
	Mon, 25 Sep 2023 08:39:21 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkh7e-00Dkve-0c
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 08:39:19 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-564af0ac494so3638726a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 01:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1695631155; x=1696235955; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xI5M8VqjHxg4TM8TEPWCg+/Qvd/N7ZnqfdNTC0OI6Ds=;
        b=vFy2lJyIWrAEINxBSF3spNjHb1P0fbFhjjuli1NEyZm2yD2T0UOaO/PrQu2gvP81B7
         mX6O+AYk8QMfmpaaiDAQSTed+l4v3iieDbWjT8PTBk5Aa4jTjhkqYQqQ7/Y83ZKeqivO
         o7RcxnrH4hrut0HeZ/2a7N7pbiV07+7luAugcOArX5pLeZZtWavCxOMyRYl9o927OINC
         TV0REls0mPcbrGrIzLaAD8OunL9BZj/ufyIEl+1KCjNbitD/1kwTuaPEM+/a2qINZsG3
         X7vFU9g16YMJxBgDI8oeEuyWHtfdQTgnkIrmL1GQTuAokS+Hv4MUPQZ2BoA+KVfZ8xMs
         gugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695631155; x=1696235955;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xI5M8VqjHxg4TM8TEPWCg+/Qvd/N7ZnqfdNTC0OI6Ds=;
        b=MfbR2U3f7Lni2ImT2YE7R2RLBOQI21pBKKu7sZqLulSgHAO+4+GS+RisP6GXbZkP4q
         nJqyNJjLgaMO9B48fAWIvr5ZpvvxAkL4kjzuBDrMZGKKmhImiCIUhaDDRouJhGgIgp/8
         x8wqC59yfEhTULNf8aJWhLYf352TBqG+BgIXL3Iu0tf/Bz6ZDI0eFKPcJQYDbiKEQnhn
         mmiEzYJ39NEzB6O/tVMe6vcXmQt6h1EAkVAsIzGjSM4KaRpnNKlpNX6WqKrSKXw3yO0Z
         rjm7cYJQ1PXuAPIjID1CUDzeT5H2ZUw4rRmjL19INCjYCWuGU+HocNsWbxbH3835sS06
         kYKQ==
X-Gm-Message-State: AOJu0Yx4K6asT8Rdpefy0ehOzFkaojqS5Zpi84zP2hcQydTgBcW91iRS
	523o9ScnzEE614dSNwu8jxa5Wg==
X-Google-Smtp-Source: AGHT+IEidwo195lvaCNLYjcxjsIlUsTEIymmaFX1w9K4Gawo51vwYTFpYWEGe/sgYFMsSp9zfbUtiQ==
X-Received: by 2002:a17:90b:1012:b0:276:757d:8c89 with SMTP id gm18-20020a17090b101200b00276757d8c89mr3668309pjb.44.1695631155214;
        Mon, 25 Sep 2023 01:39:15 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a004e00b0025dc5749b4csm10141132pjb.21.2023.09.25.01.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:39:15 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Mon, 25 Sep 2023 16:38:47 +0800
Message-Id: <20230925083847.1496-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_013918_229099_279DC9EE 
X-CRM114-Status: GOOD (  21.48  )
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

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig                |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 154 +++++++++++++++++++++-
 2 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 8d1bc8814486..43c8fea00439 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -250,6 +250,7 @@ config SND_SOC_MT8188_MT6359
 	select SND_SOC_MAX98390
 	select SND_SOC_NAU8315
 	select SND_SOC_NAU8825
+	select SND_SOC_RT5682S
 	help
 	  This adds support for ASoC machine driver for MediaTek MT8188
 	  boards with the MT6359 and other I2S audio codecs.
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index e2416b981e1f..be632804c266 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -17,6 +17,7 @@
 #include "mt8188-afe-common.h"
 #include "../../codecs/nau8825.h"
 #include "../../codecs/mt6359.h"
+#include "../../codecs/rt5682.h"
 #include "../common/mtk-afe-platform-driver.h"
 #include "../common/mtk-soundcard-driver.h"
 #include "../common/mtk-dsp-sof-common.h"
@@ -32,7 +33,7 @@
  #define TEST_MISO_DONE_2	BIT(29)
 
 #define NAU8825_HS_PRESENT	BIT(0)
-
+#define RT5682_HS_PRESENT	BIT(1)
 /*
  * Maxim MAX98390
  */
@@ -52,6 +53,8 @@
 #define SOF_DMA_UL4 "SOF_DMA_UL4"
 #define SOF_DMA_UL5 "SOF_DMA_UL5"
 
+#define RT5682_CODEC_DAI     "rt5682s-aif1"
+
 /* FE */
 SND_SOC_DAILINK_DEFS(playback2,
 		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
@@ -258,6 +261,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
 	},
 };
 
+static struct snd_soc_jack_pin rt5682_jack_pins[] = {
+	{
+		.pin    = "Headphone Jack",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
 struct mt8188_card_data {
 	const char *name;
 	unsigned long quirk;
@@ -316,10 +330,18 @@ static const struct snd_soc_dapm_widget mt8188_nau8825_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 };
 
+static const struct snd_soc_dapm_widget mt8188_rt5682_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+};
+
 static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 };
 
+static const struct snd_kcontrol_new mt8188_rt5682_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+};
+
 static const struct snd_soc_dapm_route mt8188_mt6359_routes[] = {
 	/* SOF Uplink */
 	{SOF_DMA_UL4, NULL, "O034"},
@@ -772,6 +794,55 @@ static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 };
 
+static int mt8188_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_jack *jack = &priv->headset_jack;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rt5682_widgets,
+					ARRAY_SIZE(mt8188_rt5682_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add rt5682 card widget, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, mt8188_rt5682_controls,
+					ARRAY_SIZE(mt8188_rt5682_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add rt5682 card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3,
+					 jack,
+					 rt5682_jack_pins,
+					 ARRAY_SIZE(rt5682_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+};
+
 static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
@@ -779,6 +850,13 @@ static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
 
+static void mt8188_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
 static int mt8188_nau8825_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
@@ -813,6 +891,51 @@ static const struct snd_soc_ops mt8188_nau8825_ops = {
 	.hw_params = mt8188_nau8825_hw_params,
 };
 
+static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int rate = params_rate(params);
+	int bitwidth;
+	int ret;
+
+	bitwidth = snd_pcm_format_width(params_format(params));
+	if (bitwidth < 0) {
+		dev_err(card->dev, "invalid bit width: %d\n", bitwidth);
+		return bitwidth;
+	}
+
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x00, 0x0, 0x2, bitwidth);
+	if (ret) {
+		dev_err(card->dev, "failed to set tdm slot\n");
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1, RT5682_PLL1_S_BCLK1,
+				  rate * 32, rate * 512);
+	if (ret) {
+		dev_err(card->dev, "failed to set pll\n");
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+				     rate * 512, SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(card->dev, "failed to set sysclk\n");
+		return ret;
+	}
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 128,
+				      SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8188_rt5682s_i2s_ops = {
+	.hw_params = mt8186_rt5682s_i2s_hw_params,
+};
+
 static int mt8188_sof_be_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
@@ -1163,6 +1286,21 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 			snd_ctl_remove(card->snd_card, kctl);
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
+	} else if (card_data->quirk & RT5682_HS_PRESENT) {
+		struct snd_soc_dapm_widget *w, *next_w;
+
+		for_each_card_widgets_safe(card, w, next_w) {
+			if (strcmp(w->name, "Headphone"))
+				continue;
+
+			snd_soc_dapm_free_widget(w);
+		}
+
+		kctl = ctl_find(card->snd_card, "Headphone Switch");
+		if (kctl)
+			snd_ctl_remove(card->snd_card, kctl);
+		else
+			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
 }
 
@@ -1190,6 +1328,7 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_link;
 	bool init_mt6359 = false;
 	bool init_nau8825 = false;
+	bool init_rt5682 = false;
 	bool init_max98390 = false;
 	bool init_dumb = false;
 	int ret, i;
@@ -1306,6 +1445,13 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 					dai_link->exit = mt8188_nau8825_codec_exit;
 					init_nau8825 = true;
 				}
+			} else if (!strcmp(dai_link->codecs->dai_name, RT5682_CODEC_DAI)) {
+				dai_link->ops = &mt8188_rt5682s_i2s_ops;
+				if (!init_rt5682) {
+					dai_link->init = mt8188_rt5682_codec_init;
+					dai_link->exit = mt8188_rt5682_codec_exit;
+					init_rt5682 = true;
+				}
 			} else {
 				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {
 					if (!init_dumb) {
@@ -1343,9 +1489,15 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 	.quirk = NAU8825_HS_PRESENT,
 };
 
+static struct mt8188_card_data mt8188_rt5682_card = {
+	.name = "mt8188_rt5682",
+	.quirk = RT5682_HS_PRESENT,
+};
+
 static const struct of_device_id mt8188_mt6359_dt_match[] = {
 	{ .compatible = "mediatek,mt8188-mt6359-evb", .data = &mt8188_evb_card, },
 	{ .compatible = "mediatek,mt8188-nau8825", .data = &mt8188_nau8825_card, },
+	{ .compatible = "mediatek,mt8188-rt5682", .data = &mt8188_rt5682_card, },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mt8188_mt6359_dt_match);
-- 
2.17.1


