Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E619C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DTLRwP2MhHKcLjQWWBHSbcc8J15dUOAU2GpEiOdci4=; b=Fwpb6jECrok4eO
	54H2mwh8NDb99ZywxYTXGJS1f7WfEI462OFEzKyCmgXXq0qlM+Sb8/nFCAX12BpkyZQHZ31K9yD5V
	oxSODGi+DyKItsbXuqjjuWV/5sGisYVRrmkG0yqk2ToWdU7o/uwjrruvnzIyZBHwFQRhABlOgk2T7
	exHbvktsxz4m2RTkBGZ0fvjfSuwRr6elA8ZwQbTlgo9vxNRAzJtmSO7S5py5/gG7ZaTnOtVAYbhAc
	aHfhOwLV9HzpgnNNSLOTlJCZFA0WNvIWz/Uqpz0K/dYGfWzek1k371UYPOr+OEnFeQpN8n1wPagFX
	UroigBfaoTxQ6jY/jgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nITSF-006fbx-IM; Fri, 11 Feb 2022 10:47:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nITNc-006dYE-N5; Fri, 11 Feb 2022 10:42:24 +0000
X-UUID: 46b6a13128864287a2941432151c2da7-20220211
X-UUID: 46b6a13128864287a2941432151c2da7-20220211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 241957471; Fri, 11 Feb 2022 03:42:14 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Feb 2022 02:38:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Feb 2022 18:38:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Feb 2022 18:38:27 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <perex@perex.cz>,
 <p.zabel@pengutronix.de>, <geert+renesas@glider.be>
CC: <trevor.wu@mediatek.com>, <tzungbi@google.com>, <zhangqilong3@huawei.com>, 
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH 05/15] ASoC: mediatek: mt8186: support hw gain in platform
 driver
Date: Fri, 11 Feb 2022 18:38:08 +0800
Message-ID: <20220211103818.8266-6-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_024220_823585_365C59C3 
X-CRM114-Status: GOOD (  15.62  )
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

This path adds mt8186 hw gain dai driver.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  | 246 ++++++++++++++++++
 1 file changed, 246 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
new file mode 100644
index 000000000000..9c451bdf79e9
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  MediaTek ALSA SoC Audio DAI HW Gain Control
+ *
+ *  Copyright (c) 2022 MediaTek Inc.
+ *  Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+ */
+
+#include <linux/regmap.h>
+#include "mt8186-afe-common.h"
+#include "mt8186-interconnection.h"
+
+#define HW_GAIN_1_EN_W_NAME "HW GAIN 1 Enable"
+#define HW_GAIN_2_EN_W_NAME "HW GAIN 2 Enable"
+
+/* dai component */
+static const struct snd_kcontrol_new mtk_hw_gain1_in_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH1", AFE_CONN13_1,
+				    I_CONNSYS_I2S_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_hw_gain1_in_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH2", AFE_CONN14_1,
+				    I_CONNSYS_I2S_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_hw_gain2_in_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN15,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_hw_gain2_in_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN16,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static int mtk_hw_gain_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int gain_cur;
+	unsigned int gain_con1;
+
+	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
+		 __func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (strcmp(w->name, HW_GAIN_1_EN_W_NAME) == 0) {
+			gain_cur = AFE_GAIN1_CUR;
+			gain_con1 = AFE_GAIN1_CON1;
+		} else {
+			gain_cur = AFE_GAIN2_CUR;
+			gain_con1 = AFE_GAIN2_CON1;
+		}
+
+		/* let hw gain ramp up, set cur gain to 0 */
+		regmap_update_bits(afe->regmap,
+				   gain_cur,
+				   AFE_GAIN1_CUR_MASK_SFT,
+				   0);
+
+		/* set target gain to 0 */
+		regmap_update_bits(afe->regmap,
+				   gain_con1,
+				   GAIN1_TARGET_MASK_SFT,
+				   0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget mtk_dai_hw_gain_widgets[] = {
+	/* inter-connections */
+	SND_SOC_DAPM_MIXER("HW_GAIN1_IN_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_hw_gain1_in_ch1_mix,
+			   ARRAY_SIZE(mtk_hw_gain1_in_ch1_mix)),
+	SND_SOC_DAPM_MIXER("HW_GAIN1_IN_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_hw_gain1_in_ch2_mix,
+			   ARRAY_SIZE(mtk_hw_gain1_in_ch2_mix)),
+	SND_SOC_DAPM_MIXER("HW_GAIN2_IN_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_hw_gain2_in_ch1_mix,
+			   ARRAY_SIZE(mtk_hw_gain2_in_ch1_mix)),
+	SND_SOC_DAPM_MIXER("HW_GAIN2_IN_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_hw_gain2_in_ch2_mix,
+			   ARRAY_SIZE(mtk_hw_gain2_in_ch2_mix)),
+
+	SND_SOC_DAPM_SUPPLY(HW_GAIN_1_EN_W_NAME,
+			    AFE_GAIN1_CON0, GAIN1_ON_SFT, 0,
+			    mtk_hw_gain_event,
+			    SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_SUPPLY(HW_GAIN_2_EN_W_NAME,
+			    AFE_GAIN2_CON0, GAIN2_ON_SFT, 0,
+			    mtk_hw_gain_event,
+			    SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_INPUT("HW Gain 1 Out Endpoint"),
+	SND_SOC_DAPM_INPUT("HW Gain 2 Out Endpoint"),
+	SND_SOC_DAPM_OUTPUT("HW Gain 1 In Endpoint"),
+};
+
+static const struct snd_soc_dapm_route mtk_dai_hw_gain_routes[] = {
+	{"HW Gain 1 In", NULL, "HW_GAIN1_IN_CH1"},
+	{"HW Gain 1 In", NULL, "HW_GAIN1_IN_CH2"},
+	{"HW Gain 2 In", NULL, "HW_GAIN2_IN_CH1"},
+	{"HW Gain 2 In", NULL, "HW_GAIN2_IN_CH2"},
+
+	{"HW Gain 1 In", NULL, HW_GAIN_1_EN_W_NAME},
+	{"HW Gain 1 Out", NULL, HW_GAIN_1_EN_W_NAME},
+	{"HW Gain 2 In", NULL, HW_GAIN_2_EN_W_NAME},
+	{"HW Gain 2 Out", NULL, HW_GAIN_2_EN_W_NAME},
+
+	{"HW Gain 1 In Endpoint", NULL, "HW Gain 1 In"},
+	{"HW Gain 1 Out", NULL, "HW Gain 1 Out Endpoint"},
+	{"HW Gain 2 Out", NULL, "HW Gain 2 Out Endpoint"},
+};
+
+static const struct snd_kcontrol_new mtk_hw_gain_controls[] = {
+	SOC_SINGLE("HW Gain 1", AFE_GAIN1_CON1,
+		   GAIN1_TARGET_SFT, GAIN1_TARGET_MASK, 0),
+	SOC_SINGLE("HW Gain 2", AFE_GAIN2_CON1,
+		   GAIN2_TARGET_SFT, GAIN2_TARGET_MASK, 0),
+};
+
+/* dai ops */
+static int mtk_dai_gain_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	unsigned int rate = params_rate(params);
+	unsigned int rate_reg = mt8186_rate_transform(afe->dev, rate, dai->id);
+
+	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d\n",
+		 __func__,
+		 dai->id,
+		 substream->stream,
+		 rate);
+
+	/* rate */
+	regmap_update_bits(afe->regmap,
+			   dai->id == MT8186_DAI_HW_GAIN_1 ?
+			   AFE_GAIN1_CON0 : AFE_GAIN2_CON0,
+			   GAIN1_MODE_MASK_SFT,
+			   rate_reg << GAIN1_MODE_SFT);
+
+	/* sample per step */
+	regmap_update_bits(afe->regmap,
+			   dai->id == MT8186_DAI_HW_GAIN_1 ?
+			   AFE_GAIN1_CON0 : AFE_GAIN2_CON0,
+			   GAIN1_SAMPLE_PER_STEP_MASK_SFT,
+			   (dai->id == MT8186_DAI_HW_GAIN_1 ? 0x40 : 0x0) <<
+			   GAIN1_SAMPLE_PER_STEP_SFT);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_gain_ops = {
+	.hw_params = mtk_dai_gain_hw_params,
+};
+
+/* dai driver */
+#define MTK_HW_GAIN_RATES (SNDRV_PCM_RATE_8000_48000 |\
+			   SNDRV_PCM_RATE_88200 |\
+			   SNDRV_PCM_RATE_96000 |\
+			   SNDRV_PCM_RATE_176400 |\
+			   SNDRV_PCM_RATE_192000)
+
+#define MTK_HW_GAIN_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			     SNDRV_PCM_FMTBIT_S24_LE |\
+			     SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mtk_dai_gain_driver[] = {
+	{
+		.name = "HW Gain 1",
+		.id = MT8186_DAI_HW_GAIN_1,
+		.playback = {
+			.stream_name = "HW Gain 1 In",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HW_GAIN_RATES,
+			.formats = MTK_HW_GAIN_FORMATS,
+		},
+		.capture = {
+			.stream_name = "HW Gain 1 Out",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HW_GAIN_RATES,
+			.formats = MTK_HW_GAIN_FORMATS,
+		},
+		.ops = &mtk_dai_gain_ops,
+		.symmetric_rate = 1,
+		.symmetric_channels = 1,
+		.symmetric_sample_bits = 1,
+	},
+	{
+		.name = "HW Gain 2",
+		.id = MT8186_DAI_HW_GAIN_2,
+		.playback = {
+			.stream_name = "HW Gain 2 In",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HW_GAIN_RATES,
+			.formats = MTK_HW_GAIN_FORMATS,
+		},
+		.capture = {
+			.stream_name = "HW Gain 2 Out",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HW_GAIN_RATES,
+			.formats = MTK_HW_GAIN_FORMATS,
+		},
+		.ops = &mtk_dai_gain_ops,
+		.symmetric_rate = 1,
+		.symmetric_channels = 1,
+		.symmetric_sample_bits = 1,
+	},
+};
+
+int mt8186_dai_hw_gain_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_gain_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_gain_driver);
+
+	dai->controls = mtk_hw_gain_controls;
+	dai->num_controls = ARRAY_SIZE(mtk_hw_gain_controls);
+	dai->dapm_widgets = mtk_dai_hw_gain_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_hw_gain_widgets);
+	dai->dapm_routes = mtk_dai_hw_gain_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_hw_gain_routes);
+	return 0;
+}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
