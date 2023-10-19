Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B73CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jy2Ch1JEdLGN/hTnIKDE58lJ94BQHeUPcnTqdlap1A=; b=DVz3Arm7DzAYp2jRhqyaNWeQHF
	WY+MBwOhIHdeiKtIQr+PP6k5jVR2w5+OHrmttwNExfd3D1qDoFBgqU4TabkmJ2VQ4inmcri+VEauS
	l1sgJRt/GhsaD5CEyC2bY/LKuEc8NNbcvAk0ZBVzRK9O4WSwK5w2Q8dueyQMV4rGA8tHm6zpHZ342
	Jwv0gF62enL7g7FJ8idXXwqP+d+8nwtMInT3XSWzVU7b30okAoTpTmEjbs0fxhpVMqDPPobP04564
	kpvVv0c+a572JsIFULS6GlT2ENgtB3XLr6ueZMNZNgDLFck2OVf57wbHwSlkIYJZaxMpyH/x+gV1/
	fGHQQKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPsU-00GtxI-12;
	Thu, 19 Oct 2023 10:03:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPsP-00GtvE-22
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 10:03:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6b87c1edfd5so4519791b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1697709815; x=1698314615; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jy2Ch1JEdLGN/hTnIKDE58lJ94BQHeUPcnTqdlap1A=;
        b=He4t2xO4dHkCnNeTm1OEZz3CVzVK5rwp+nRGdkRoaIjS8luNf3BtEfatagJZTYeTY+
         2vAt4kBPVdttE0s1sQJRhGWaDtA1bJk5MVD1olFbSS+76mb+0hEbpaVBXcSFI6hb6axz
         fzsx3Se6ObUUNB4qdGLAggwFR2Wbg6FkZyri/0TZL8dmCEFoFgHTWRsP0fMr+ITPa38S
         Inqj3tTmHp9AaexUn7LJ9TuhP/6RsX9zxhZ0dId23ZCPELVGn+67jbqO7nhxytCbomIk
         16rHL0TcH214DekNGpdfKn8cS20+SegTpNhe7SYx/XW/4WrNpYwm5BZDts43CflAf+Cd
         qhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709815; x=1698314615;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jy2Ch1JEdLGN/hTnIKDE58lJ94BQHeUPcnTqdlap1A=;
        b=s60x4JJcLRUYsLz3QK9eHlRXoBnWD9AxvUkfkgCfqVTLIbt2m32cwu3J6aSMh9lCwo
         sT0/tbaWr6hl4MI85ORTleVkatGbTM/Vt1SzoSUXpY7jAbAtzlveocSh5aUCqTktSouV
         tBRGVYexkEUYwXEXDwgLEVWe1tbJyGF8dv0Eb5iKFzKXZBkYlaR/tOYFkdvG8RgOpMKN
         JQ4eeVgOehKV5TXUnqdUZvWg7Pl3Nyqrv1txhding3WDMogquJPpFWqph3KyqpPty5Bh
         aIpeM2RrAHh9WOOy1Ebk4OeaGqrJnoNtVb98ldbEF4TrJjJpgTe1hQ21OXOHo9Q8hwrP
         KEEg==
X-Gm-Message-State: AOJu0Yx59Z8TwhAL++4lx6hzOwT4RIiu/i79664k4NfzYQoFF/ckMw5z
	Wjt8k+nzr3RLhfzPHZ8KiNsoYaEBwVXqACZCXcU=
X-Google-Smtp-Source: AGHT+IHuTIV8zd8oIWuYyHvZgbVMSpc3Bu+zC2skiZiABWHGYXflDFcB+DMne2So7LrkNPAQqeqglw==
X-Received: by 2002:aa7:9852:0:b0:68a:4bef:5f9a with SMTP id n18-20020aa79852000000b0068a4bef5f9amr1249581pfq.0.1697709815452;
        Thu, 19 Oct 2023 03:03:35 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id o9-20020a655209000000b005b46e691108sm2606680pgp.68.2023.10.19.03.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:03:35 -0700 (PDT)
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
Subject: [v2 2/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support
Date: Thu, 19 Oct 2023 18:03:22 +0800
Message-Id: <20231019100322.25425-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_030337_684850_6F062C57 
X-CRM114-Status: GOOD (  13.80  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 44 ++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

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
index 4684bfd89ecd..6dfcfcf47cab 100644
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
@@ -1058,6 +1060,27 @@ mt8186_mt6366_rt1019_rt5682s_routes[] = {
 	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
 };
 
+static const struct snd_soc_dapm_route mt8186_mt6366_rt5650_routes[] = {
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
@@ -1096,6 +1119,21 @@ static struct snd_soc_card mt8186_mt6366_rt5682s_max98360_soc_card = {
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
@@ -1253,6 +1291,10 @@ static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
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


