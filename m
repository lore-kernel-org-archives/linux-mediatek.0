Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FE1CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 02:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TesY55WayWThzDzzYAmx0jlTWe8bYphYnJXBdBkbqm4=; b=TIYaSMOmglSK8LbsBKkufdDIGJ
	kcCFazGwMtRjaNqrtxtGfg5P71W+wOTTqeT5QRUyG493p0j76bSmGoS5f4j2VOv1aISjj2JS19lV9
	uxCv9iTM0Y+nzDgxJEny/qETOPxYrcL78u1lJuzHL1mgRFD37/IzIxBXR83gC1ZkcO0osrCbZZcnm
	pJOGE1WkIus3+iS2ztw8D4o1lmW4F/HsYLy9eOD+42AEhICrYmewz1j8RYDG0rA2U+i4sjW2Wejg9
	3lnbXPUxOug5gwgzJVazD0/Jmytq0m1DrtGYxprob+x8O+1s3c/JX6KgvrB6dH8XLoT7RdickyyV+
	qMdYzp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtIVs-00G6do-0x;
	Thu, 19 Oct 2023 02:11:52 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtIVn-00G6cX-35
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 02:11:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6bd96cfb99cso3360070b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Oct 2023 19:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1697681506; x=1698286306; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TesY55WayWThzDzzYAmx0jlTWe8bYphYnJXBdBkbqm4=;
        b=gMub6IoH0NWoCtWSOOYzsuNuLEuInG0zZDd5qw2B2+lTuTUtfehR15g5Uc60bRTM4u
         ns6eTQRP4KKM14FtIFYfFvoR66hAK/IgbsvbenZ/CGP2DJfxMQR5R/2Xm6wXHznOKFP7
         EXFICfDe6EvQ8GlIxhAmy1+EGpSFdFJHUbgCrMYNTA+HOcww4jPb9g0GGGJ/RoWzPAdj
         LEXk7n734ph5+t93psPm2Uso835Uoh1nKOYMlCoWYpmUSyOg6Us6/LoDtAHDh6SY0pY1
         5UidBfQWePGOTQ0mdcc1+xxSLlD6nCmarYp97Z6hgE+SZlqdUjmTyTRUcZZdJHuQ6nM4
         aHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697681506; x=1698286306;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TesY55WayWThzDzzYAmx0jlTWe8bYphYnJXBdBkbqm4=;
        b=VRC9R5KuMrpY3EYs2pD/htC6UtMM7BMb/LVCpoTelKFfxpRKs2ClXPykvQffutocxv
         p2kPiVR02Dz/rBVastn4OmrLuiuEAu/5XwldTdVHDE4G4qqAXGdzDE+MfEfwGYbXfKa0
         jF61mn8ZjbxdecfZQea11XffO/oLHpfOIFcMhb+99SPmJZCqjow0xOeP2dsKb+yqK44h
         XFpQaIhwYXFDnLwtM4C7Q+m86E5FhY8kbt4d67reJSyPifgBabd+/kbRHvSx3A6aKl5O
         t8uM0dSZssturQpo7zPfqj122unBbeEN2bYSMG8xgQfSpge4+ual0BjuhDURE9ESGQCY
         JTDA==
X-Gm-Message-State: AOJu0YwwJ9crS9bptqKpsg5Osdvgwce4fem0P9AhYCEHuFJG60jwTQhw
	J0UGrWGvU8FqBCkjNRfdTb/HJA==
X-Google-Smtp-Source: AGHT+IEjGbSHVE9/MFrqNqEm01C96ZHgZKf48mYBwZfkvR+TH1wdoxro0LKzp/BecYxza4103ygmyg==
X-Received: by 2002:a05:6a00:23c9:b0:693:3cac:7897 with SMTP id g9-20020a056a0023c900b006933cac7897mr947076pfc.9.1697681506266;
        Wed, 18 Oct 2023 19:11:46 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id d7-20020aa797a7000000b0068fadc9226dsm3974278pfq.33.2023.10.18.19.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:11:46 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 2/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support
Date: Thu, 19 Oct 2023 10:11:33 +0800
Message-Id: <20231019021133.23855-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_191147_997173_2BD21BE0 
X-CRM114-Status: GOOD (  13.73  )
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

To use RT5650 as the codec and the amp, add a new
sound card named mt8186_rt5650.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 45 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 43c8fea00439..b93d455744ab 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -210,6 +210,7 @@ config SND_SOC_MT8186_MT6366_RT1019_RT5682S
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682S
+	select SND_SOC_RT5645
 	select SND_SOC_BT_SCO
 	select SND_SOC_DMIC
 	select SND_SOC_HDMI_CODEC
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 4684bfd89ecd..8c534c338f0e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -170,6 +170,7 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_codec =
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
+	int type;
 
 	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
 	if (ret) {
@@ -193,7 +194,8 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	return snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
+	type = SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3;
+	return snd_soc_component_set_jack(cmpnt_codec, jack, (void *)&type);
 }
 
 static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -1058,6 +1060,28 @@ mt8186_mt6366_rt1019_rt5682s_routes[] = {
 	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
 };
 
+static const struct snd_soc_dapm_route
+mt8186_mt6366_rt5650_routes[] = {
+	/* SPK */
+	{"Speakers", NULL, "SPOL"},
+	{"Speakers", NULL, "SPOR"},
+	/* Headset */
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+	{ "IN1N", NULL, "Headset Mic"},
+	/* HDMI */
+	{ "HDMI1", NULL, "TX" },
+	/* SOF Uplink */
+	{SOF_DMA_UL1, NULL, "UL1_CH1"},
+	{SOF_DMA_UL1, NULL, "UL1_CH2"},
+	{SOF_DMA_UL2, NULL, "UL2_CH1"},
+	{SOF_DMA_UL2, NULL, "UL2_CH2"},
+	/* SOF Downlink */
+	{"DSP_DL1_VIRT", NULL, SOF_DMA_DL1},
+	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
+};
+
 static const struct snd_kcontrol_new
 mt8186_mt6366_rt1019_rt5682s_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
@@ -1096,6 +1120,21 @@ static struct snd_soc_card mt8186_mt6366_rt5682s_max98360_soc_card = {
 	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
 };
 
+static struct snd_soc_card mt8186_mt6366_rt5650_soc_card = {
+	.name = "mt8186_rt5650",
+	.owner = THIS_MODULE,
+	.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
+	.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
+	.controls = mt8186_mt6366_rt1019_rt5682s_controls,
+	.num_controls = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_controls),
+	.dapm_widgets = mt8186_mt6366_rt1019_rt5682s_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_widgets),
+	.dapm_routes = mt8186_mt6366_rt5650_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_rt5650_routes),
+	.codec_conf = mt8186_mt6366_rt1019_rt5682s_codec_conf,
+	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
+};
+
 static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -1253,6 +1292,10 @@ static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
 		.compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound",
 		.data = &mt8186_mt6366_rt5682s_max98360_soc_card,
 	},
+	{
+		.compatible = "mediatek,mt8186-mt6366-rt5650-sound",
+		.data = &mt8186_mt6366_rt5650_soc_card,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt8186_mt6366_rt1019_rt5682s_dt_match);
-- 
2.17.1


