Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB48C38A02
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CLvTkmlFURtDEd8JKfEk5mMDoaPLqHdlnnztyHVUao=; b=oX9i7NCwQZFAATEq9Sl0qqyFpP
	90AucbqU4qGqt6w+562BhpUn6wNSdcGPxzk50zJ6kw2VKYJi9YOpWZcyrSSHdkgy2bK7dGXYbJWdD
	yL9srY58V/9AfBQUhp5dmm06bM9OP7gGpmiIjXzXzhjPaagwI9YJslhKMdWoM+ohv6UfjryDeElBO
	KZ17mJc44+9v075kxgWzHdIZINBpa7M1xijvTTVvkjLp/+61YFhJk4w+wfmducFD0DJHXldt/vE0G
	dIOJeOqxTEVNmeufLEymkPUZ72MBeMHlOGbVp+NDQTHKWqnWy0447e0PttLtxRSzPTO7/XcbiYQHs
	ubR1qtXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opC5l-0018Or-CT; Sun, 30 Oct 2022 17:27:25 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opC4t-0017sg-QJ
	for linux-mediatek@lists.infradead.org; Sun, 30 Oct 2022 17:26:33 +0000
Received: by mail-pj1-x1042.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so11066407pjh.1
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Oct 2022 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CLvTkmlFURtDEd8JKfEk5mMDoaPLqHdlnnztyHVUao=;
        b=n3IRtQJE5TLtkrNDDscRgSlAy4vp1fA+fZuVruAWfCKFHN4rBqckBmcm1vrobbtagt
         ff6E6eJCZU1PGpzscG52OwunWV2u2LLJm5A4X4RVqgwPGpCg0h/CAeVUuA2PAvGFuuhB
         OrcQ7ArFo9a4ZN7QmkINuYtbtoZ6WbTrdBvPxiogesfkVvg4QQg9SRsEcDiCBNn4nFqW
         Okj90TA4u7eouptcyfOEcbXWy+JdS5GGEdE1Kge8+ok10gmTylTjjg1/Sle9tWOBHL8f
         u4mNzZAVoNxCHoS34ON7vniY1/xxhyIEDrd1sPZDja+QALzKe8Ts+8dCPvEQ8DwlXy7b
         YHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CLvTkmlFURtDEd8JKfEk5mMDoaPLqHdlnnztyHVUao=;
        b=xRiBnIXd1xqWs2iNwfO4EdcIlCJVHnueerhPIOBL7i22u2SwZWC7KcTv9Yp/AC+p8l
         Pf6RpJlvHAb8eEMUMe/ny2Ky9n1gwjiVWpwfISO2h6SP23iz3q8YgOVHutuTateWFdyC
         TgFGeL8QVD7CmIgQb2G7tVENNN6hch5LknO1eYsXzUnqdMfQaFHR3b+XF3KQZk805kUy
         Nvl9YtpBr6RLB7g85rHbehPPqxZbNIYF1RKrvJa07CXyRqRSyvwWZMe9TiOkoVt6hcYl
         8g5ZkeuUzPqoK3C46pyM3lTC0FCYrjKPMIOd3dleSNyt/HvzSEQinzPwxno/N0pjrOcL
         fotg==
X-Gm-Message-State: ACrzQf2w5eHu16Ojpzo/PS5JiRKizLBsjwJwxO4XVJC1scJrBf/AyyMz
	g/oMJry9HpoJ8InWctDnnbFThg==
X-Google-Smtp-Source: AMsMyM4CzVH//ceOeMRtn/UZ+GsaqMaKcQLg7IVwBGlW84c14ZpQ6WKA4F8hqYjgnqJ2dWQRoRa7xA==
X-Received: by 2002:a17:90b:38c:b0:212:fe14:4ba0 with SMTP id ga12-20020a17090b038c00b00212fe144ba0mr28049976pjb.138.1667150789913;
        Sun, 30 Oct 2022 10:26:29 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net. [118.167.185.125])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902a3ce00b00186c6d2e7e3sm2933881plb.26.2022.10.30.10.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 10:26:29 -0700 (PDT)
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
Subject: [PATCH v4 2/2] ASoC: mediatek: mt8186-rt5682: Modify machine driver for two DMICs case
Date: Mon, 31 Oct 2022 01:26:09 +0800
Message-Id: <20221030172609.1635096-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
References: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_102631_918433_222877A5 
X-CRM114-Status: GOOD (  18.85  )
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
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 2414c5b77233..75351734464c 100644
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
+			 priv->dmic_switch);
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
@@ -1015,6 +1107,14 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 
 	soc_card_data->mach_priv = mach_priv;
 
+	mach_priv->dmic_sel = devm_gpiod_get_optional(&pdev->dev,
+						      "dmic", GPIOD_OUT_LOW);
+	if (IS_ERR(mach_priv->dmic_sel)) {
+		dev_err(&pdev->dev, "DMIC gpio failed err=%ld\n",
+			PTR_ERR(mach_priv->dmic_sel));
+		return PTR_ERR(mach_priv->dmic_sel);
+	}
+
 	adsp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,adsp", 0);
 	if (adsp_node) {
 		struct mtk_sof_priv *sof_priv;
-- 
2.25.1


