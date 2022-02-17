Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0392C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6RybXL76jtSMe1Lp9twMQGNl//6zk1mIyFDVHgR5Ow=; b=txcbASPBeHvrDh
	I78N0JqM+fop0MK4IwPRnCYzgB6C6xcT0f5W43eFkmdZgxzo4/xyGpedNS2A9uU+6UqX7CQtHtyGc
	RjjlF7nqvrLcxoSpOiukF9rIbsthzpBF8Bb/waaEjhA6XxXelU5MLNXa9u6Sx4RKeChjCHpJHhjbi
	CHcMdQamBgDN3O5eIUGCKrca2s98xOBeCPqKRJ4voJmcdrp3aEUrjqJTnNDupcEkmFDgLZPRKjh1N
	2cXvgAAH8qz3VYUdfmEaErfpDOICaU1kYE+fzMa3YWBJsBIVJ7KrTZXU56b1k5w0n+3SzeeLXrpgS
	Bfmbpj9GFZCxZeD+QLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhKi-00ApEf-2e; Thu, 17 Feb 2022 14:00:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhCq-00Al7D-3e; Thu, 17 Feb 2022 13:52:27 +0000
X-UUID: e6ca102191e84bb3ab26f603b09e81e8-20220217
X-UUID: e6ca102191e84bb3ab26f603b09e81e8-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 585193747; Thu, 17 Feb 2022 06:52:19 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 05:42:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Feb 2022 21:42:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:42:14 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <aaronyu@google.com>, <zhangqilong3@huawei.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [v2 04/17] ASoC: mediatek: mt8186: support hostless in platform driver
Date: Thu, 17 Feb 2022 21:41:52 +0800
Message-ID: <20220217134205.15400-5-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_055224_306927_9C7F7788 
X-CRM114-Status: GOOD (  15.87  )
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

This patch adds mt8186 hostless dai driver.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../soc/mediatek/mt8186/mt8186-dai-hostless.c | 295 ++++++++++++++++++
 1 file changed, 295 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hostless.c

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-hostless.c b/sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
new file mode 100644
index 000000000000..37460a3acc93
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// MediaTek ALSA SoC Audio DAI Hostless Control
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+#include "mt8186-afe-common.h"
+
+static const struct snd_pcm_hardware mt8186_hostless_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_MMAP_VALID),
+	.period_bytes_min = 256,
+	.period_bytes_max = 4 * 48 * 1024,
+	.periods_min = 2,
+	.periods_max = 256,
+	.buffer_bytes_max = 4 * 48 * 1024,
+	.fifo_size = 0,
+};
+
+/* dai component */
+static const struct snd_soc_dapm_route mtk_dai_hostless_routes[] = {
+	/* Hostless ADDA Loopback */
+	{"ADDA_DL_CH1", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
+	{"ADDA_DL_CH1", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
+	{"ADDA_DL_CH2", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
+	{"ADDA_DL_CH2", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
+	{"I2S1_CH1", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
+	{"I2S1_CH2", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
+	{"I2S3_CH1", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
+	{"I2S3_CH1", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
+	{"I2S3_CH2", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
+	{"I2S3_CH2", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
+	{"Hostless LPBK UL", NULL, "ADDA_UL_Mux"},
+
+	/* Hostelss FM */
+	/* connsys_i2s to hw gain 1*/
+	{"Hostless FM UL", NULL, "Connsys I2S"},
+
+	{"HW_GAIN1_IN_CH1", "CONNSYS_I2S_CH1 Switch", "Hostless FM DL"},
+	{"HW_GAIN1_IN_CH2", "CONNSYS_I2S_CH2 Switch", "Hostless FM DL"},
+	/* hw gain to adda dl */
+	{"Hostless FM UL", NULL, "HW Gain 1 Out"},
+
+	{"ADDA_DL_CH1", "GAIN1_OUT_CH1 Switch", "Hostless FM DL"},
+	{"ADDA_DL_CH2", "GAIN1_OUT_CH2 Switch", "Hostless FM DL"},
+	/* hw gain to i2s3 */
+	{"I2S3_CH1", "GAIN1_OUT_CH1 Switch", "Hostless FM DL"},
+	{"I2S3_CH2", "GAIN1_OUT_CH2 Switch", "Hostless FM DL"},
+	/* hw gain to i2s1 */
+	{"I2S1_CH1", "GAIN1_OUT_CH1 Switch", "Hostless FM DL"},
+	{"I2S1_CH2", "GAIN1_OUT_CH2 Switch", "Hostless FM DL"},
+
+	/* Hostless_SRC */
+	{"ADDA_DL_CH1", "SRC_1_OUT_CH1 Switch", "Hostless_SRC_1_DL"},
+	{"ADDA_DL_CH2", "SRC_1_OUT_CH2 Switch", "Hostless_SRC_1_DL"},
+	{"I2S1_CH1", "SRC_1_OUT_CH1 Switch", "Hostless_SRC_1_DL"},
+	{"I2S1_CH2", "SRC_1_OUT_CH2 Switch", "Hostless_SRC_1_DL"},
+	{"I2S3_CH1", "SRC_1_OUT_CH1 Switch", "Hostless_SRC_1_DL"},
+	{"I2S3_CH2", "SRC_1_OUT_CH2 Switch", "Hostless_SRC_1_DL"},
+	{"Hostless_SRC_1_UL", NULL, "HW_SRC_1_Out"},
+
+	/* Hostless_SRC_bargein */
+	{"HW_SRC_1_IN_CH1", "I2S0_CH1 Switch", "Hostless_SRC_Bargein_DL"},
+	{"HW_SRC_1_IN_CH2", "I2S0_CH2 Switch", "Hostless_SRC_Bargein_DL"},
+	{"Hostless_SRC_Bargein_UL", NULL, "I2S0"},
+
+	/* Hostless AAudio */
+	{"Hostless HW Gain AAudio In", NULL, "HW Gain 2 In"},
+	{"Hostless SRC AAudio UL", NULL, "HW Gain 2 Out"},
+	{"HW_SRC_2_IN_CH1", "HW_GAIN2_OUT_CH1 Switch", "Hostless SRC AAudio DL"},
+	{"HW_SRC_2_IN_CH2", "HW_GAIN2_OUT_CH2 Switch", "Hostless SRC AAudio DL"},
+};
+
+/* dai ops */
+static int mtk_dai_hostless_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
+
+	snd_soc_set_runtime_hwparams(substream, &mt8186_hostless_hardware);
+
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		dev_info(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+	return ret;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_hostless_ops = {
+	.startup = mtk_dai_hostless_startup,
+};
+
+/* dai driver */
+#define MTK_HOSTLESS_RATES (SNDRV_PCM_RATE_8000_48000 |\
+			   SNDRV_PCM_RATE_88200 |\
+			   SNDRV_PCM_RATE_96000 |\
+			   SNDRV_PCM_RATE_176400 |\
+			   SNDRV_PCM_RATE_192000)
+
+#define MTK_HOSTLESS_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			     SNDRV_PCM_FMTBIT_S24_LE |\
+			     SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mtk_dai_hostless_driver[] = {
+	{
+		.name = "Hostless LPBK DAI",
+		.id = MT8186_DAI_HOSTLESS_LPBK,
+		.playback = {
+			.stream_name = "Hostless LPBK DL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Hostless LPBK UL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless FM DAI",
+		.id = MT8186_DAI_HOSTLESS_FM,
+		.playback = {
+			.stream_name = "Hostless FM DL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Hostless FM UL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless_SRC_1_DAI",
+		.id = MT8186_DAI_HOSTLESS_SRC_1,
+		.playback = {
+			.stream_name = "Hostless_SRC_1_DL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Hostless_SRC_1_UL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless_SRC_Bargein_DAI",
+		.id = MT8186_DAI_HOSTLESS_SRC_BARGEIN,
+		.playback = {
+			.stream_name = "Hostless_SRC_Bargein_DL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Hostless_SRC_Bargein_UL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	/* BE dai */
+	{
+		.name = "Hostless_UL1 DAI",
+		.id = MT8186_DAI_HOSTLESS_UL1,
+		.capture = {
+			.stream_name = "Hostless_UL1 UL",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless_UL2 DAI",
+		.id = MT8186_DAI_HOSTLESS_UL2,
+		.capture = {
+			.stream_name = "Hostless_UL2 UL",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless_UL3 DAI",
+		.id = MT8186_DAI_HOSTLESS_UL3,
+		.capture = {
+			.stream_name = "Hostless_UL3 UL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless_UL5 DAI",
+		.id = MT8186_DAI_HOSTLESS_UL5,
+		.capture = {
+			.stream_name = "Hostless_UL5 UL",
+			.channels_min = 1,
+			.channels_max = 12,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless_UL6 DAI",
+		.id = MT8186_DAI_HOSTLESS_UL6,
+		.capture = {
+			.stream_name = "Hostless_UL6 UL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless HW Gain AAudio DAI",
+		.id = MT8186_DAI_HOSTLESS_HW_GAIN_AAUDIO,
+		.capture = {
+			.stream_name = "Hostless HW Gain AAudio In",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+	{
+		.name = "Hostless SRC AAudio DAI",
+		.id = MT8186_DAI_HOSTLESS_SRC_AAUDIO,
+		.playback = {
+			.stream_name = "Hostless SRC AAudio DL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Hostless SRC AAudio UL",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_HOSTLESS_RATES,
+			.formats = MTK_HOSTLESS_FORMATS,
+		},
+		.ops = &mtk_dai_hostless_ops,
+	},
+};
+
+int mt8186_dai_hostless_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_hostless_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_hostless_driver);
+
+	dai->dapm_routes = mtk_dai_hostless_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_hostless_routes);
+
+	return 0;
+}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
