Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA93C07548
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKgGKtJhLmXRufltux14fJMclaoxn7oMZiicA565Zb0=; b=SQektBpssTXCCz/97MA48BKSLf
	RaCgSANb/dZdEq2oqxmyKJUbDiMQKIZbPV9aYgpmQ0NnmI8XOuUY5kpAgb+a+YJIpPY578akbY5jl
	urCtMSxBelkGs4SqsY2qmXnytLKQGvJD1c+V9TksMjLjSq5AkSTV5F6z1u/a+xnXLcD25T0RtSp2L
	B3LjKEMUoRLRps4vmeS90ks0oCO0CDmmtDHvCGxgjxyQLXutTjFTxcomf+Ymz6MadJN+04aV28C2R
	0JIKrY2UZnSHI+y7YIopPeA4dsKNwUx+tdCClzW93ldgPem7m/KE7wfq3u81Mo508dnvk4fSuk+Zm
	SGzZHi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ber-000Gb8-00;
	Wed, 15 Nov 2023 08:54:01 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Bel-000GWs-2y
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 08:53:58 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-53fa455cd94so4704120a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 00:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700038428; x=1700643228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKgGKtJhLmXRufltux14fJMclaoxn7oMZiicA565Zb0=;
        b=TtMnPymJPsWXygiSO4QvibLZEIzxaZNkP6NSGUYNyuUOfIpjz65UIIpzsLzVHvgAUk
         jjGucw+b/6BlDKydFkC0Br6FjgDPSaEWaY/4IVJGnsWt+HsEG28JOTUnlyyiEj4d7qxb
         TGYY7km9Ftaw5OuiDx32v1jUxHAMmOccrtTt7DpkVHZlA76ynXAw/qpJ3cQ1ANMr4fEq
         BF0ns/S5S8h8NrvxJ2MtkuwA34hl1VKbrPNedW2bXnzAJiDN1ephP7GllX6D+H+xBn2E
         wlAs6cfhyrYt5ELY9TL+8JflHDy5mXGvrVPIRMuHbGRd7/+G8tEMR4AXMxK9R1Z7r7zn
         DnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700038428; x=1700643228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKgGKtJhLmXRufltux14fJMclaoxn7oMZiicA565Zb0=;
        b=a94xCsjFbb7bhestpLG8zEIthbKXEisXQf2PJZ16Zeb9+NhU93m0Lm8Pgzt31x2egO
         q1rNrsTldW+f6wJ5xXN4e98+5ztEac+gijKsOOC3267czJuChrz3J8hcr4DYP6tdkoOF
         bvzPekkFOapxsB8ey4zZ7Xf2e/fkHT0nJEeAD+Hecdd+4VGqzG+CX+g65Xzy4AMxZIxM
         Z159WxhhetZfAJQzgHUCzDkpjvtSjKwRS5stPF6nmUgnAFqcnlLTdQM9WA7E3Pxz7QmL
         MHJnP2VmPG6HTH7Bg7WZHi/URZtpYlPO+aQ+p0DX6aGha+yr/pO8IgNS3wbE62B2EZye
         cMcQ==
X-Gm-Message-State: AOJu0YxanoXdAp3tnMXD78oc/GdjIBu2RjWSzVwSinptR0vHaNBL3Z0F
	X1xONq6Nd5yvSC0r9IY1vQtBGQ==
X-Google-Smtp-Source: AGHT+IGaT0yGUrhZOPHKhYTAXxtytq5rQLRuJVBcKvhsD4m1WC8vAqlZm/TX4Jl8X+yBf/GX3i1qwA==
X-Received: by 2002:a05:6a20:a105:b0:187:6cc4:5aea with SMTP id q5-20020a056a20a10500b001876cc45aeamr835045pzk.59.1700038428564;
        Wed, 15 Nov 2023 00:53:48 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id z2-20020a17090ad78200b002794fe14cabsm8331449pju.12.2023.11.15.00.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 00:53:48 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v4 2/3] ASoC: mediatek: mt8188-mt6359: add es8326 support
Date: Wed, 15 Nov 2023 16:53:28 +0800
Message-Id: <20231115085329.541764-3-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com>
References: <20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_005355_964405_4F425E93 
X-CRM114-Status: GOOD (  21.18  )
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

Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig                |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 100 +++++++++++++++++++++-
 2 files changed, 100 insertions(+), 1 deletion(-)

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
index 33d477cc2e54..e994faa3556b 100644
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
+#define ES8326_CODEC_DAI  "es8326-hifi"
+
 #define SOF_DMA_DL2 "SOF_DMA_DL2"
 #define SOF_DMA_DL3 "SOF_DMA_DL3"
 #define SOF_DMA_UL4 "SOF_DMA_UL4"
@@ -261,6 +268,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
 	},
 };
 
+static struct snd_soc_jack_pin es8326_jack_pins[] = {
+	{
+		.pin    = "Headphone",
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
@@ -943,6 +961,71 @@ static const struct snd_soc_ops mt8188_sof_be_ops = {
 	.hw_params = mt8188_sof_be_hw_params,
 };
 
+static int mt8188_es8326_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
+	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_jack *jack = &priv->headset_jack;
+	int ret;
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3,
+					 jack,
+					 es8326_jack_pins,
+					 ARRAY_SIZE(es8326_jack_pins));
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
+	return ret;
+};
+
+static void mt8188_es8326_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int mt8188_es8326_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
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
@@ -1293,6 +1376,7 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 	struct mt8188_card_data *card_data;
 	struct snd_soc_dai_link *dai_link;
 	bool init_mt6359 = false;
+	bool init_es8326 = false;
 	bool init_nau8825 = false;
 	bool init_rt5682s = false;
 	bool init_max98390 = false;
@@ -1399,7 +1483,9 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 			   strcmp(dai_link->name, "ETDM1_IN_BE") == 0 ||
 			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
 			if (!strcmp(dai_link->codecs->dai_name, MAX98390_CODEC_DAI)) {
-				dai_link->ops = &mt8188_max98390_ops;
+				if (!(card_data->quirk & MAX98390_TWO_AMP)) {
+					dai_link->ops = &mt8188_max98390_ops;
+				}
 				if (!init_max98390) {
 					dai_link->init = mt8188_max98390_codec_init;
 					init_max98390 = true;
@@ -1417,6 +1503,12 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 					dai_link->init = mt8188_rt5682s_codec_init;
 					dai_link->exit = mt8188_rt5682s_codec_exit;
 					init_rt5682s = true;
+			} else if (!strcmp(dai_link->codecs->dai_name, ES8326_CODEC_DAI)) {
+				dai_link->ops = &mt8188_es8326_ops;
+				if (!init_es8326) {
+					dai_link->init = mt8188_es8326_codec_init;
+					dai_link->exit = mt8188_es8326_codec_exit;
+					init_es8326 = true;
 				}
 			} else {
 				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {
@@ -1460,10 +1552,16 @@ static struct mt8188_card_data mt8188_rt5682s_card = {
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


