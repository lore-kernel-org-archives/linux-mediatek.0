Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A14C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+hGv37gCiC4Wt9k7p83b6rMFwUkB8NUy7FGC7+01Ao=; b=GuIZYadhQ9MFR404E4xgGxhW5P
	rRxwRFiR4SzMFMGKvnv3Va6pRUORwB5hUO5eNYlO1LpdOWPI1XMerHVaDzyAp+/hLWXFBS9LkU143
	HD69MuGNPJwNY1mAOfOJhb8aMihniPkdNyAVWxUzWklsuSFN0KHOD0NjNxfkUrUy0z5itdZM/DZWB
	Y1Zibrq6cCF7l4H4WdoV334dZ4vSoesR4NOXTQCv9RUcBBlYC4BpkkAHPeQS4EtRqAFPeQUps6kYW
	rccOL+0NXtYqq9UIW7frtzvkbc2t7zhdHtnUckhetWMEe0TkwAlHcxUpGP8AiZ9EkBVKlN2vC5CJx
	oRMMSysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Yme-002zBd-02;
	Thu, 16 Nov 2023 09:35:36 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Yma-002z8D-1O
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 09:35:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-28035cf6a30so441651a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Nov 2023 01:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700127328; x=1700732128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+hGv37gCiC4Wt9k7p83b6rMFwUkB8NUy7FGC7+01Ao=;
        b=yJFH6fb0uRir34UAwk6moO3/0Qv7P0Kj2UAG13VSiBZYH27o4Wx9/NjZoRdHk7LDmt
         /McyM5khTViufuNTTvKUILUQuomEJZ1EXDtstEU9jnxYYbJopTBqNn+KDvEXv3HEVA/C
         9GL7WJex4gPvUwlUV/UnDwJQJTSOv/PZJjWrfjIFuYYl3VUggbujjLiLC52oGEmZgxb8
         0Wxa5L5HTFXldEkMhrN1xR2Pq7+mS/RMjCiHzY1kCsNt5Xe0d8sDEs9nBqUki/LcJ651
         zIYtiCVB2KmLJROSEsGoeJBHi0JSkRAEekLcxG+ecuCkC4c/xaveiUQTkXJPCRRBdVoM
         ofMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700127328; x=1700732128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+hGv37gCiC4Wt9k7p83b6rMFwUkB8NUy7FGC7+01Ao=;
        b=jO+y0gRbUtb87ohttn6UrggXgg2WASPhCsCM6XcfnVz4RFFWmUHVTkMYmPryciK3sT
         nsJkwp73lGpFNuTTfXXfSIS21JyTv8L5RJzvo3//svGtTLPxxs28tYcWBEP1mWnzyuiB
         sOGEI+qAe5bjFNtiocvwErCODGhCBZ307sH29Hhsm0I8gqf7dx5FThpAU9M5RKSVVOBr
         oVkKeETSvLnOV2EzGZiwWPpLXF81yoNzoNORIxer8btxwnDH+er6qt+gC2pwNbyIUMI6
         GY921bpqF5XfHTyo/ZXKRCDLlDJVFdIRqdaqYJo8KKtsC3FtBa2MT4IATuQuwB+OMDxi
         G+dw==
X-Gm-Message-State: AOJu0YxWQPnlndS5+WyUB/JKqH2Xb2sf4gPxvpvrHGSmatfcpklgwZi+
	wedYLo5Uu9SioX6NxDNg3p/UXQ==
X-Google-Smtp-Source: AGHT+IENybR7kmU/GnU0pRVWMaavO1c74Bif8eg5BqsinfwIYbS3g6X9VRdIRjPnuafY4mAG0z1D6A==
X-Received: by 2002:a17:90b:1a90:b0:27d:4278:ba53 with SMTP id ng16-20020a17090b1a9000b0027d4278ba53mr14164844pjb.47.1700127328374;
        Thu, 16 Nov 2023 01:35:28 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090aac0a00b00280fcbbe774sm1175214pjq.10.2023.11.16.01.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 01:35:27 -0800 (PST)
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
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v7 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Date: Thu, 16 Nov 2023 17:35:11 +0800
Message-Id: <20231116093512.4180240-4-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_013532_471309_3A84A7D7 
X-CRM114-Status: GOOD (  19.97  )
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
 sound/soc/mediatek/Kconfig                |  1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 49 ++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

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
index b4606a28794c..96c39f4e4b70 100644
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
@@ -1238,6 +1269,7 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 	struct mt8188_card_data *card_data;
 	struct snd_soc_dai_link *dai_link;
 	bool init_mt6359 = false;
+	bool init_es8326 = false;
 	bool init_nau8825 = false;
 	bool init_rt5682s = false;
 	bool init_max98390 = false;
@@ -1344,7 +1376,9 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
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
@@ -1363,6 +1397,13 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
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
@@ -1405,10 +1446,16 @@ static struct mt8188_card_data mt8188_rt5682s_card = {
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


