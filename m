Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBAEC54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 12:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGo2EnveMYisxsUB+qd8H3w61iWaL5V1pE+MhwGMyWU=; b=vRWwoY/tsO45R1NsXHh75ofEsK
	UQYq81KbBd1sZJARZLp/XFuNrDG2la8GsB8Sz3LFn7lyJbfwPKlOCfrrK/U4QlXHLg5SK8YTlbyPA
	yhRdXttU+Sq366VLUuciTXjmSK6QKVbelw1wq58fSpgPzLEm1IOOZWWQ13NuKZmZc/f6/vOunJIyJ
	EspkOhRgehmaIkX29Ose9MBCroyYUoTsYsETxbWVam6Oh0IOLkslIoYhM1X08iwfjQlaIYIKYyoHS
	fHrH5b8V3WJXF6eUjzBq3uCEY37AVGoE7ovnVTwuejxdLafcu8l66kfKn5Xyr2ZtXY2SD+aRfwZ34
	stbbOKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewK2-000000055l0-05R4;
	Tue, 27 Feb 2024 12:12:34 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewIF-000000054fz-15JB;
	Tue, 27 Feb 2024 12:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035842;
	bh=7dwcW721xQhnjT05thzylbyuJsM5PYC/qaTz/86b5ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dEXkJiLRlhz3D+H/KvmOlKbpvH0P6FEyhBqcyDMRNt6huKbpVv4p24hEW+4IkiyKk
	 GqAe0qiswiJqEg40s/kh4ysyULELaxMl2Gz2mxEqeu4CoVXOTs9o7beP7Oe0zM5mgo
	 sELOJrXE8B8zippevTi1LsmfpFlBXYOVkjDOoOP0v6wPpAplSid9WJsZRFsDJR7YqF
	 GNiaLhdqbvF4SxkVznTjVNMqwgQnq/Fl7zpN8sQYMCF8fweTy5POch8EeNiO5tSU5t
	 oUw3lzt4qcPbCaiyUiYL4yEpMWOJMHnG7qJRQgxefmHOqqOVC+Ovz56S4hzNjO3Eu/
	 /MJ+y8j93h5xw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A8A3737820DE;
	Tue, 27 Feb 2024 12:10:39 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 13/22] ASoC: mediatek: mt8192: Migrate to the common mtk_soundcard_startup
Date: Tue, 27 Feb 2024 13:09:30 +0100
Message-ID: <20240227120939.290143-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_041043_732599_AB70A201 
X-CRM114-Status: GOOD (  13.55  )
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

Add a const mtk_pcm_constraints_data struct array with all of the
(again, constant) constraints for all of the supported usecases,
remove the duplicated functions and call mtk_soundcard_startup()
instead in all of the .startup() callbacks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 139 ++++++------------
 1 file changed, 41 insertions(+), 98 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 645bc1aa67c7..5fb34a4834d2 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -389,100 +389,6 @@ static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int
-mt8192_mt6359_cap1_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int channels[] = {
-		1, 2, 4
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list = channels,
-		.mask = 0,
-	};
-	static const unsigned int rates[] = {
-		8000, 16000, 32000, 48000, 96000, 192000
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channels failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8192_mt6359_capture1_ops = {
-	.startup = mt8192_mt6359_cap1_startup,
-};
-
-static int
-mt8192_mt6359_rt5682_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int channels[] = {
-		1, 2
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list = channels,
-		.mask = 0,
-	};
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channels failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8192_mt6359_rt5682_ops = {
-	.startup = mt8192_mt6359_rt5682_startup,
-};
-
 /* FE */
 SND_SOC_DAILINK_DEFS(playback1,
 		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
@@ -720,7 +626,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
-		.ops = &mt8192_mt6359_rt5682_ops,
+		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	{
@@ -784,7 +690,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
-		.ops = &mt8192_mt6359_capture1_ops,
+		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
@@ -794,7 +700,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
-		.ops = &mt8192_mt6359_rt5682_ops,
+		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	{
@@ -1146,7 +1052,7 @@ static int mt8192_mt6359_legacy_probe(struct mtk_soc_card_data *soc_card_data)
 	struct device *dev = card->dev;
 	struct device_node *hdmi_codec, *headset_codec, *speaker_codec;
 	struct snd_soc_dai_link *dai_link;
-	int ret, i;
+	int i, ret = 0;
 
 	hdmi_codec = of_parse_phandle(dev->of_node, "mediatek,hdmi-codec", 0);
 	if (!hdmi_codec)
@@ -1235,11 +1141,44 @@ static int mt8192_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 	return 0;
 }
 
+static const unsigned int mt8192_pcm_playback_channels[] = { 1, 2 };
+static const unsigned int mt8192_pcm_playback_rates[] = { 48000 };
+
+static const unsigned int mt8192_pcm_capture_channels[] = { 1, 2, 4 };
+static const unsigned int mt8192_pcm_capture_rates[] = {
+	8000, 16000, 32000, 48000, 96000, 192000
+};
+
+static const struct mtk_pcm_constraints_data mt8192_pcm_constraints[MTK_CONSTRAINT_CAPTURE + 1] = {
+	[MTK_CONSTRAINT_PLAYBACK] = {
+		.channels = {
+			.list = mt8192_pcm_playback_channels,
+			.count = ARRAY_SIZE(mt8192_pcm_playback_channels)
+		},
+		.rates = {
+			.list = mt8192_pcm_playback_rates,
+			.count = ARRAY_SIZE(mt8192_pcm_playback_rates)
+		}
+	},
+	[MTK_CONSTRAINT_CAPTURE] = {
+		.channels = {
+			.list = mt8192_pcm_capture_channels,
+			.count = ARRAY_SIZE(mt8192_pcm_capture_channels)
+		},
+		.rates = {
+			.list = mt8192_pcm_capture_rates,
+			.count = ARRAY_SIZE(mt8192_pcm_capture_rates)
+		}
+	}
+};
+
 static const struct mtk_soundcard_pdata mt8192_mt6359_rt1015_rt5682_pdata = {
 	.card_name = RT1015_RT5682_CARD_NAME,
 	.card_data = &(struct mtk_platform_card_data) {
 		.card = &mt8192_mt6359_rt1015_rt5682_card,
 		.num_jacks = MT8192_JACK_MAX,
+		.pcm_constraints = mt8192_pcm_constraints,
+		.num_pcm_constraints = ARRAY_SIZE(mt8192_pcm_constraints),
 	},
 	.soc_probe = mt8192_mt6359_soc_card_probe
 };
@@ -1249,6 +1188,8 @@ static const struct mtk_soundcard_pdata mt8192_mt6359_rt1015p_rt5682_pdata = {
 	.card_data = &(struct mtk_platform_card_data) {
 		.card = &mt8192_mt6359_rt1015p_rt5682x_card,
 		.num_jacks = MT8192_JACK_MAX,
+		.pcm_constraints = mt8192_pcm_constraints,
+		.num_pcm_constraints = ARRAY_SIZE(mt8192_pcm_constraints),
 	},
 	.soc_probe = mt8192_mt6359_soc_card_probe
 };
@@ -1258,6 +1199,8 @@ static const struct mtk_soundcard_pdata mt8192_mt6359_rt1015p_rt5682s_pdata = {
 	.card_data = &(struct mtk_platform_card_data) {
 		.card = &mt8192_mt6359_rt1015p_rt5682x_card,
 		.num_jacks = MT8192_JACK_MAX,
+		.pcm_constraints = mt8192_pcm_constraints,
+		.num_pcm_constraints = ARRAY_SIZE(mt8192_pcm_constraints),
 	},
 	.soc_probe = mt8192_mt6359_soc_card_probe
 };
-- 
2.44.0


