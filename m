Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD24ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8Nn45kFgt+1/zl+VyWWfD/CuQIYBmtC4EPy4fuEkAU=; b=VZHRHMZcMHO1dOONyNTlzC2ySN
	RcsAhOF3NA+UkpWOsbrCoCxTwTZGxkU+OTEXGfwDoNsMeeLapr/rTj9iCBjqvXtpGmBkRR/gGw6P/
	W8koEczn/0KCiAWPR9yeORSRR0yTBKglNPgZ5+NvqQzL4wyYgzzldlP3lVGWD7Fo/nLt6aINJ3AyE
	iUkkuH2PLTA1t5j6+HUUY1+Zw7RhUfs6c62lDfNrY5M7RWTjBEqpwnnXwryiWdkG6pydbqe5f3Zf+
	8SuHlra9y8em7Be0SYaEF2OopYXxwD+T2g0ZPZ/LIS1bFkLjzctfU3I8ZEXWRIe0Z6jZn5PDfPpvA
	eX0xRpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRul-000nTs-OR; Fri, 28 Oct 2022 16:08:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRu2-000n6B-PV
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 16:08:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so10249119pji.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8Nn45kFgt+1/zl+VyWWfD/CuQIYBmtC4EPy4fuEkAU=;
        b=gip4VKIWXDPUdGVhQB4daJvfaDsL1h/PftU4FOaEYO8E5ovKZQ+xvcEyUwgVeiXxV6
         ZeB3LBQs0nzir13iWlS879M7qVzHFU2zq9lnMS3EkSs9AY2O+LKJmT1zc8wOiav6HZOA
         lr/CTNsY+xOjoaCWgNV9cGOeg3XR9/UVwnQUdiUv01vHn5lcrK5nZyBkr1tjOs0MImET
         c+UxidVXdI6UGj0ltXIiTg+KzAS/mMFu+T/tWvFoMfuOglr1sojXgyJvHHvUsj7dpZa7
         ZHIFyyyZcw9qmznAIIYrqz8jW/AJ0pK/OGkr9zRfPd4Ko0gbamT7D3QxxHydmac5ZKIG
         9eRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8Nn45kFgt+1/zl+VyWWfD/CuQIYBmtC4EPy4fuEkAU=;
        b=dStbejXn388iNZHavV4B2PYpkhhshJzUHqJlDcZLrSy+eUwriIlfAx80qjQddG/wRj
         43cEvDs212vd7MSlFWAFGLi4t+6kycgAEuBn+yz9ojrSXihhUWLY+RQaWVT58K4dLQgT
         ZdROSEZp1yQNDUmKpoJugue564VqHRoMJLxaEszKjpW0voC6CSwCahHGPbAqMHJ3aBaW
         zY2vVy+LvB9EPwb6+9P5c0tVZy236hM7UyKgMyyEpNFip5URB4deBAXAH5VrGnfuPqgD
         cvJIWgkF57nuEySXahFgHRJ9qTViIrnESiduwAKR6klmVEjNSdx2tUqpAaCKWJ+kQAKy
         CpUQ==
X-Gm-Message-State: ACrzQf1LzjtgKw9YkhqKLZUcnPhZd3MwZ6jIyT3M54xKVviL6zCsFTSP
	mmZNkDR4bBenS1o7TNAfrSfJVw==
X-Google-Smtp-Source: AMsMyM6Ff9ha1gXGmB+slqYXn5um88qhDxWogLqwNuNaAS20732cykx+jATZzSm8t7qnxpNUd7BuHA==
X-Received: by 2002:a17:902:e902:b0:186:9c03:5f27 with SMTP id k2-20020a170902e90200b001869c035f27mr97854pld.16.1666973288800;
        Fri, 28 Oct 2022 09:08:08 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net. [118.167.210.30])
        by smtp.gmail.com with ESMTPSA id b70-20020a621b49000000b0056abfa74eddsm3112071pfb.147.2022.10.28.09.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:08:08 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	"chunxu . li" <chunxu.li@mediatek.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v1 2/2] ASoC: mediatek: mt8186-rt5682: Modify machine driver for two DMICs case
Date: Sat, 29 Oct 2022 00:07:33 +0800
Message-Id: <20221028160733.1390230-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
References: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_090814_953274_DC087180 
X-CRM114-Status: GOOD (  19.15  )
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

Having two DMICs, a front DMIC and a Rear DMIC,
but only host audio input AUX port0 is used for these two Dmics.
A "dmic-gpios" property is used for a mixer control to switch
the dmic signal source between the Front and Rear Dmic.

Refer to this one as an example,
commit 3cfbf07c6d27
("ASoC: qcom: sc7180: Modify machine driver for 2mic")

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 104 +++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 2414c5b77233..7190a60300a1 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -7,6 +7,8 @@
 // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
 //
 
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -39,6 +41,8 @@
 
 struct mt8186_mt6366_rt1019_rt5682s_priv {
 	struct snd_soc_jack headset_jack, hdmi_jack;
+	struct gpio_desc *dmic_sel;
+	int dmic_switch;
 };
 
 /* Headset jack detection DAPM pins */
@@ -68,6 +72,94 @@ static struct snd_soc_codec_conf mt8186_mt6366_rt1019_rt5682s_codec_conf[] = {
 	},
 };
 
+static int dmic_get(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct mtk_soc_card_data *soc_card_data =
+		snd_soc_card_get_drvdata(dapm->card);
+	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
+
+	ucontrol->value.integer.value[0] = priv->dmic_switch;
+	return 0;
+}
+
+static int dmic_set(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct mtk_soc_card_data *soc_card_data =
+		snd_soc_card_get_drvdata(dapm->card);
+	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
+
+	priv->dmic_switch = ucontrol->value.integer.value[0];
+	if (priv->dmic_sel) {
+		gpiod_set_value(priv->dmic_sel, priv->dmic_switch);
+		dev_info(dapm->card->dev, "dmic_set_value %d\n",
+		priv->dmic_switch);
+	}
+	return 0;
+}
+
+static const char * const dmic_mux_text[] = {
+	"FrontMic",
+	"RearMic",
+};
+
+static SOC_ENUM_SINGLE_DECL(mt8186_dmic_enum,
+			    SND_SOC_NOPM, 0, dmic_mux_text);
+
+static const struct snd_kcontrol_new mt8186_dmic_mux_control =
+	SOC_DAPM_ENUM_EXT("DMIC Select Mux", mt8186_dmic_enum,
+			  dmic_get, dmic_set);
+
+static const struct snd_soc_dapm_widget dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &mt8186_dmic_mux_control),
+};
+
+static const struct snd_soc_dapm_route dmic_map[] = {
+	/* digital mics */
+	{"Dmic Mux", "FrontMic", "DMIC"},
+	{"Dmic Mux", "RearMic", "DMIC"},
+};
+
+static int primary_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
+	int ret;
+
+	ret = mt8186_mt6366_init(rtd);
+
+	if (ret) {
+		dev_err(card->dev, "mt8186_mt6366_init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (!priv->dmic_sel) {
+		dev_info(card->dev, "dmic_sel is null\n");
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+					ARRAY_SIZE(dmic_widgets));
+	if (ret) {
+		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
+				      ARRAY_SIZE(dmic_map));
+
+	if (ret)
+		dev_err(card->dev, "DMic map addition failed: %d\n", ret);
+
+	return ret;
+}
+
 static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_afe =
@@ -775,7 +867,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
-		.init = mt8186_mt6366_init,
+		.init = primary_codec_init,
 		SND_SOC_DAILINK_REG(adda),
 	},
 	{
@@ -1015,6 +1107,16 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 
 	soc_card_data->mach_priv = mach_priv;
 
+	if (of_property_read_bool(pdev->dev.of_node, "dmic-gpios")) {
+		mach_priv->dmic_sel = devm_gpiod_get_optional(&pdev->dev,
+							"dmic", GPIOD_OUT_LOW);
+		if (IS_ERR(mach_priv->dmic_sel)) {
+			dev_err(&pdev->dev, "DMIC gpio failed err=%ld\n",
+				PTR_ERR(mach_priv->dmic_sel));
+			return PTR_ERR(mach_priv->dmic_sel);
+		}
+	}
+
 	adsp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,adsp", 0);
 	if (adsp_node) {
 		struct mtk_sof_priv *sof_priv;
-- 
2.25.1


