Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3843AC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:10:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A067322275
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1wzQZMDF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r6fkkPdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A067322275
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FHSLE9S8hH6AYDFJ0i94ptMwJHLHb7EbB0d/IBJzPXY=; b=1wzQZMDFU/KLOoIZWIbHJ6ALL
	ucjcMoTLQ0Yr71J9d63hsKUdYQLWFOeSo3t0vD1SSkkP47yK4+Tuj9DlihKcLhZmdo14zlGNLE0bN
	4mbrWaXKrgMFQCwZSanqt/FITgd8Zn333iHBKrdgQ5DurZMaQ6J+IN9sEWy8diqmCAmVg2QQoh0hE
	/iTNgH/qgS0QJcO20ShqxzpVX6uBA2XTcpk97OSgLcjOoPB8sypkAHIDxtGJrIlOqus2recyJ/bui
	70rnMsZY76Rs2R8oQlJy7G7MDW8pqr/56qLx3B9NQP2f5gKGiEAkrhkAg0eToqkuxe+kLg2tBe927
	BpAXeNUVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZrOR-00077e-SZ; Tue, 03 Nov 2020 08:10:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZrO4-00072I-PU; Tue, 03 Nov 2020 08:09:55 +0000
X-UUID: ea319d9327b64a81a7bb943bdfb4e33e-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=d9r4ucj224d8zBybhW8x7NCgzh3nmiqPy1sXs/tIC7Q=; 
 b=r6fkkPdXfZtWuzsI5czyTIfSPrHSKoLLuLtiG4boW1OFUMoDjuzDAoOQuchrbFkudXFxLmTnAidLU5Fsh3Y1HhoydYpsI+5jTcY3rGgBHuF4m15Vf867XjlewtsKrD1RnTj8h9NCoS0TF2+paDaHP5P+2nHyYAjZsitbMlBeRLE=;
X-UUID: ea319d9327b64a81a7bb943bdfb4e33e-20201103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2114964353; Tue, 03 Nov 2020 00:09:49 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 23:59:51 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 15:59:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 15:59:49 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 8/9] ASoC: mediatek: mt8192: add machine driver with mt6359,
 rt1015 and rt5682
Date: Tue, 3 Nov 2020 15:59:37 +0800
Message-ID: <1604390378-23993-9-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_030953_137362_09E28DFC 
X-CRM114-Status: GOOD (  23.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Trevor.Wu@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds support for the machine board with mt6359, rt1015
and rt5682.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                    |   13 +
 sound/soc/mediatek/mt8192/Makefile            |    2 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 1058 +++++++++++++++++
 3 files changed, 1073 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 10588cf809dc7..dc628fb6c1025 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -167,3 +167,16 @@ config SND_SOC_MT8192
 	  that can be used with other codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8192_MT6359_RT1015_RT5682
+	tristate "ASoC Audio driver for MT8192 with MT6359 RT1015 RT5682 codec"
+	depends on I2C
+	depends on SND_SOC_MT8192
+	select SND_SOC_MT6359
+	select SND_SOC_RT1015
+	select SND_SOC_RT5682_I2C
+	help
+	  This adds ASoC driver for Mediatek MT8192 boards
+	  with the MT6359 RT1015 RT5682 audio codec.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/mt8192/Makefile b/sound/soc/mediatek/mt8192/Makefile
index dd18486881708..8b27d82626ea4 100644
--- a/sound/soc/mediatek/mt8192/Makefile
+++ b/sound/soc/mediatek/mt8192/Makefile
@@ -12,3 +12,5 @@ snd-soc-mt8192-afe-objs := \
 	mt8192-dai-tdm.o
 
 obj-$(CONFIG_SND_SOC_MT8192) += snd-soc-mt8192-afe.o
+obj-$(CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682) += \
+	mt8192-mt6359-rt1015-rt5682.o
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
new file mode 100644
index 0000000000000..41d8a8567bb38
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -0,0 +1,1058 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8192-mt6359-rt1015-rt5682.c  --
+//	MT8192-MT6359-RT1015-RT6358 ALSA SoC machine driver
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+//
+
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/jack.h>
+#include <sound/pcm_params.h>
+#include <sound/rt5682.h>
+#include <sound/soc.h>
+
+#include "../../codecs/mt6359.h"
+#include "../../codecs/rt1015.h"
+#include "../../codecs/rt5682.h"
+#include "../common/mtk-afe-platform-driver.h"
+#include "mt8192-afe-common.h"
+#include "mt8192-afe-clk.h"
+#include "mt8192-afe-gpio.h"
+
+#define RT1015_CODEC_DAI	"rt1015-aif"
+#define RT1015_DEV0_NAME	"rt1015.1-0028"
+#define RT1015_DEV1_NAME	"rt1015.1-0029"
+
+#define RT5682_CODEC_DAI	"rt5682-aif1"
+#define RT5682_DEV0_NAME	"rt5682.1-001a"
+
+static struct snd_soc_jack headset_jack;
+
+static const struct snd_soc_dapm_widget
+mt8192_mt6359_rt1015_rt5682_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route mt8192_mt6359_rt1015_rt5682_routes[] = {
+	/* speaker */
+	{ "Left Spk", NULL, "Left SPO" },
+	{ "Right Spk", NULL, "Right SPO" },
+	/* headset */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+};
+
+static const struct snd_kcontrol_new mt8192_mt6359_rt1015_rt5682_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	unsigned int rate = params_rate(params);
+	unsigned int mclk_fs_ratio = 128;
+	unsigned int mclk_fs = rate * mclk_fs_ratio;
+	int ret, i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+		if (ret) {
+			dev_err(card->dev, "failed to set bclk ratio\n");
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_pll(codec_dai, 0,
+					  RT1015_PLL_S_BCLK,
+					  params_rate(params) * 64,
+					  params_rate(params) * 256);
+		if (ret) {
+			dev_err(card->dev, "failed to set pll\n");
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_sysclk(codec_dai,
+					     RT1015_SCLK_S_PLL,
+					     params_rate(params) * 256,
+					     SND_SOC_CLOCK_IN);
+		if (ret) {
+			dev_err(card->dev, "failed to set sysclk\n");
+			return ret;
+		}
+	}
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
+}
+
+static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int rate = params_rate(params);
+	unsigned int mclk_fs_ratio = 128;
+	unsigned int mclk_fs = rate * mclk_fs_ratio;
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
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1,
+				  RT5682_PLL1_S_BCLK1,
+				  params_rate(params) * 64,
+				  params_rate(params) * 512);
+	if (ret) {
+		dev_err(card->dev, "failed to set pll\n");
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai,
+				     RT5682_SCLK_S_PLL1,
+				     params_rate(params) * 512,
+				     SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(card->dev, "failed to set sysclk\n");
+		return ret;
+	}
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8192_rt1015_i2s_ops = {
+	.hw_params = mt8192_rt1015_i2s_hw_params,
+};
+
+static const struct snd_soc_ops mt8192_rt5682_i2s_ops = {
+	.hw_params = mt8192_rt5682_i2s_hw_params,
+};
+
+static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+	int phase;
+	unsigned int monitor;
+	int test_done_1, test_done_2, test_done_3;
+	int cycle_1, cycle_2, cycle_3;
+	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
+	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
+	int counter;
+	int mtkaif_calib_ok;
+
+	dev_info(afe->dev, "%s(), start\n", __func__);
+
+	pm_runtime_get_sync(afe->dev);
+	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 1);
+	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 0);
+
+	mt6359_mtkaif_calibration_enable(cmpnt_codec);
+
+	/* set clock protocol 2 */
+	regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP, 0xff, 0x38);
+	regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP, 0xff, 0x39);
+
+	/* set test type to synchronizer pulse */
+	regmap_update_bits(afe_priv->topckgen,
+			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
+
+	mtkaif_calib_ok = true;
+	afe_priv->mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
+	afe_priv->mtkaif_chosen_phase[0] = -1;
+	afe_priv->mtkaif_chosen_phase[1] = -1;
+	afe_priv->mtkaif_chosen_phase[2] = -1;
+
+	for (phase = 0;
+	     phase <= afe_priv->mtkaif_calibration_num_phase &&
+	     mtkaif_calib_ok;
+	     phase++) {
+		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
+						    phase, phase, phase);
+
+		regmap_update_bits(afe_priv->topckgen,
+				   CKSYS_AUD_TOP_CFG, 0x1, 0x1);
+
+		test_done_1 = 0;
+		test_done_2 = 0;
+		test_done_3 = 0;
+		cycle_1 = -1;
+		cycle_2 = -1;
+		cycle_3 = -1;
+		counter = 0;
+		while (test_done_1 == 0 ||
+		       test_done_2 == 0 ||
+		       test_done_3 == 0) {
+			regmap_read(afe_priv->topckgen,
+				    CKSYS_AUD_TOP_MON, &monitor);
+
+			test_done_1 = (monitor >> 28) & 0x1;
+			test_done_2 = (monitor >> 29) & 0x1;
+			test_done_3 = (monitor >> 30) & 0x1;
+			if (test_done_1 == 1)
+				cycle_1 = monitor & 0xf;
+
+			if (test_done_2 == 1)
+				cycle_2 = (monitor >> 4) & 0xf;
+
+			if (test_done_3 == 1)
+				cycle_3 = (monitor >> 8) & 0xf;
+
+			/* handle if never test done */
+			if (++counter > 10000) {
+				dev_err(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, cycle_3 %d, monitor 0x%x\n",
+					__func__,
+					cycle_1, cycle_2, cycle_3, monitor);
+				mtkaif_calib_ok = false;
+				break;
+			}
+		}
+
+		if (phase == 0) {
+			prev_cycle_1 = cycle_1;
+			prev_cycle_2 = cycle_2;
+			prev_cycle_3 = cycle_3;
+		}
+
+		if (cycle_1 != prev_cycle_1 &&
+		    afe_priv->mtkaif_chosen_phase[0] < 0) {
+			afe_priv->mtkaif_chosen_phase[0] = phase - 1;
+			afe_priv->mtkaif_phase_cycle[0] = prev_cycle_1;
+		}
+
+		if (cycle_2 != prev_cycle_2 &&
+		    afe_priv->mtkaif_chosen_phase[1] < 0) {
+			afe_priv->mtkaif_chosen_phase[1] = phase - 1;
+			afe_priv->mtkaif_phase_cycle[1] = prev_cycle_2;
+		}
+
+		if (cycle_3 != prev_cycle_3 &&
+		    afe_priv->mtkaif_chosen_phase[2] < 0) {
+			afe_priv->mtkaif_chosen_phase[2] = phase - 1;
+			afe_priv->mtkaif_phase_cycle[2] = prev_cycle_3;
+		}
+
+		regmap_update_bits(afe_priv->topckgen,
+				   CKSYS_AUD_TOP_CFG, 0x1, 0x0);
+
+		if (afe_priv->mtkaif_chosen_phase[0] >= 0 &&
+		    afe_priv->mtkaif_chosen_phase[1] >= 0 &&
+		    afe_priv->mtkaif_chosen_phase[2] >= 0)
+			break;
+	}
+
+	if (afe_priv->mtkaif_chosen_phase[0] < 0)
+		chosen_phase_1 = 0;
+	else
+		chosen_phase_1 = afe_priv->mtkaif_chosen_phase[0];
+
+	if (afe_priv->mtkaif_chosen_phase[1] < 0)
+		chosen_phase_2 = 0;
+	else
+		chosen_phase_2 = afe_priv->mtkaif_chosen_phase[1];
+
+	if (afe_priv->mtkaif_chosen_phase[2] < 0)
+		chosen_phase_3 = 0;
+	else
+		chosen_phase_3 = afe_priv->mtkaif_chosen_phase[2];
+
+	mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
+					    chosen_phase_1,
+					    chosen_phase_2,
+					    chosen_phase_3);
+
+	/* disable rx fifo */
+	regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP, 0xff, 0x38);
+
+	mt6359_mtkaif_calibration_disable(cmpnt_codec);
+
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 1);
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 0);
+	pm_runtime_put(afe->dev);
+
+	dev_info(afe->dev, "%s(), mtkaif_chosen_phase[0/1/2]:%d/%d/%d\n",
+		 __func__,
+		 afe_priv->mtkaif_chosen_phase[0],
+		 afe_priv->mtkaif_chosen_phase[1],
+		 afe_priv->mtkaif_chosen_phase[2]);
+
+	return 0;
+}
+
+static int mt8192_mt6359_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	struct mt8192_afe_private *afe_priv = afe->platform_priv;
+
+	/* set mtkaif protocol */
+	mt6359_set_mtkaif_protocol(cmpnt_codec,
+				   MT6359_MTKAIF_PROTOCOL_2_CLK_P2);
+	afe_priv->mtkaif_protocol = MTKAIF_PROTOCOL_2_CLK_P2;
+
+	/* mtkaif calibration */
+	mt8192_mt6359_mtkaif_calibration(rtd);
+
+	return 0;
+}
+
+static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_jack *jack = &headset_jack;
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    jack, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	ret = snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack set failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+};
+
+static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				      struct snd_pcm_hw_params *params)
+{
+	/* fix BE i2s format to 32bit, clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+
+	return 0;
+}
+
+static int
+mt8192_mt6359_rt1015_rt5682_cap1_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	static const unsigned int channels[] = {
+		1, 2, 4
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list = channels,
+		.mask = 0,
+	};
+	static const unsigned int rates[] = {
+		8000, 16000, 32000, 48000, 96000, 192000
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 &constraints_channels);
+	if (ret < 0) {
+		dev_err(afe->dev, "hw_constraint_list channels failed\n");
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &constraints_rates);
+	if (ret < 0) {
+		dev_err(afe->dev, "hw_constraint_list rate failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8192_mt6359_rt1015_rt5682_capture1_ops = {
+	.startup = mt8192_mt6359_rt1015_rt5682_cap1_startup,
+};
+
+/* FE */
+SND_SOC_DAILINK_DEFS(playback1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback12,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL12")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback4,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback6,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback7,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL7")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback8,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL8")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback9,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL9")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture4,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture6,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture7,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL7")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture8,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL8")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture_mono1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_MONO_1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture_mono2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_MONO_2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture_mono3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_MONO_3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback_hdmi,
+		     DAILINK_COMP_ARRAY(COMP_CPU("HDMI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* BE */
+SND_SOC_DAILINK_DEFS(primary_codec,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif1")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(primary_codec_ch34,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ADDA_CH34")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif2")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ap_dmic,
+		     DAILINK_COMP_ARRAY(COMP_CPU("AP_DMIC")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ap_dmic_ch34,
+		     DAILINK_COMP_ARRAY(COMP_CPU("AP_DMIC_CH34")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s0,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S0")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME,
+						   RT1015_CODEC_DAI),
+					COMP_CODEC(RT1015_DEV1_NAME,
+						   RT1015_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s6,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s7,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S7")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s8,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S8")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
+						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s9,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S9")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
+						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(connsys_i2s,
+		     DAILINK_COMP_ARRAY(COMP_CPU("CONNSYS_I2S")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(pcm1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("PCM 1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(pcm2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("PCM 2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(tdm,
+		     DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link mt8192_mt6359_rt1015_rt5682_dai_links[] = {
+	/* Front End DAI links */
+	{
+		.name = "Playback_1",
+		.stream_name = "Playback_1",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback1),
+	},
+	{
+		.name = "Playback_12",
+		.stream_name = "Playback_12",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback12),
+	},
+	{
+		.name = "Playback_2",
+		.stream_name = "Playback_2",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback2),
+	},
+	{
+		.name = "Playback_3",
+		.stream_name = "Playback_3",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback3),
+	},
+	{
+		.name = "Playback_4",
+		.stream_name = "Playback_4",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback4),
+	},
+	{
+		.name = "Playback_5",
+		.stream_name = "Playback_5",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback5),
+	},
+	{
+		.name = "Playback_6",
+		.stream_name = "Playback_6",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback6),
+	},
+	{
+		.name = "Playback_7",
+		.stream_name = "Playback_7",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback7),
+	},
+	{
+		.name = "Playback_8",
+		.stream_name = "Playback_8",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback8),
+	},
+	{
+		.name = "Playback_9",
+		.stream_name = "Playback_9",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback9),
+	},
+	{
+		.name = "Capture_1",
+		.stream_name = "Capture_1",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		.ops = &mt8192_mt6359_rt1015_rt5682_capture1_ops,
+		SND_SOC_DAILINK_REG(capture1),
+	},
+	{
+		.name = "Capture_2",
+		.stream_name = "Capture_2",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture2),
+	},
+	{
+		.name = "Capture_3",
+		.stream_name = "Capture_3",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture3),
+	},
+	{
+		.name = "Capture_4",
+		.stream_name = "Capture_4",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture4),
+	},
+	{
+		.name = "Capture_5",
+		.stream_name = "Capture_5",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture5),
+	},
+	{
+		.name = "Capture_6",
+		.stream_name = "Capture_6",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture6),
+	},
+	{
+		.name = "Capture_7",
+		.stream_name = "Capture_7",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture7),
+	},
+	{
+		.name = "Capture_8",
+		.stream_name = "Capture_8",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture8),
+	},
+	{
+		.name = "Capture_Mono_1",
+		.stream_name = "Capture_Mono_1",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture_mono1),
+	},
+	{
+		.name = "Capture_Mono_2",
+		.stream_name = "Capture_Mono_2",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture_mono2),
+	},
+	{
+		.name = "Capture_Mono_3",
+		.stream_name = "Capture_Mono_3",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture_mono3),
+	},
+	{
+		.name = "playback_hdmi",
+		.stream_name = "Playback_HDMI",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback_hdmi),
+	},
+	/* Back End DAI links */
+	{
+		.name = "Primary Codec",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		.init = mt8192_mt6359_init,
+		SND_SOC_DAILINK_REG(primary_codec),
+	},
+	{
+		.name = "Primary Codec CH34",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(primary_codec_ch34),
+	},
+	{
+		.name = "AP_DMIC",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(ap_dmic),
+	},
+	{
+		.name = "AP_DMIC_CH34",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(ap_dmic_ch34),
+	},
+	{
+		.name = "I2S0",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s0),
+	},
+	{
+		.name = "I2S1",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s1),
+	},
+	{
+		.name = "I2S2",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s2),
+	},
+	{
+		.name = "I2S3",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s3),
+		.ops = &mt8192_rt1015_i2s_ops,
+	},
+	{
+		.name = "I2S5",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s5),
+	},
+	{
+		.name = "I2S6",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s6),
+	},
+	{
+		.name = "I2S7",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s7),
+	},
+	{
+		.name = "I2S8",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		.init = mt8192_rt5682_init,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s8),
+		.ops = &mt8192_rt5682_i2s_ops,
+	},
+	{
+		.name = "I2S9",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s9),
+		.ops = &mt8192_rt5682_i2s_ops,
+	},
+	{
+		.name = "CONNSYS_I2S",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(connsys_i2s),
+	},
+	{
+		.name = "PCM 1",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(pcm1),
+	},
+	{
+		.name = "PCM 2",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(pcm2),
+	},
+	{
+		.name = "TDM",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(tdm),
+	},
+};
+
+static struct snd_soc_codec_conf rt1015_amp_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(RT1015_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1015_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
+static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_soc_card = {
+	.name = "mt8192_mt6359_rt1015_rt5682",
+	.owner = THIS_MODULE,
+	.dai_link = mt8192_mt6359_rt1015_rt5682_dai_links,
+	.num_links = ARRAY_SIZE(mt8192_mt6359_rt1015_rt5682_dai_links),
+	.controls = mt8192_mt6359_rt1015_rt5682_controls,
+	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015_rt5682_controls),
+	.dapm_widgets = mt8192_mt6359_rt1015_rt5682_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015_rt5682_widgets),
+	.dapm_routes = mt8192_mt6359_rt1015_rt5682_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015_rt5682_routes),
+	.codec_conf = rt1015_amp_conf,
+	.num_configs = ARRAY_SIZE(rt1015_amp_conf),
+};
+
+static int mt8192_mt6359_rt1015_rt5682_dev_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt8192_mt6359_rt1015_rt5682_soc_card;
+	struct device_node *platform_node;
+	int ret, i;
+	struct snd_soc_dai_link *dai_link;
+
+	card->dev = &pdev->dev;
+
+	platform_node = of_parse_phandle(pdev->dev.of_node,
+					 "mediatek,platform", 0);
+	if (!platform_node) {
+		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (!dai_link->platforms->name)
+			dai_link->platforms->of_node = platform_node;
+	}
+
+	ret = mt8192_afe_gpio_init(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "init gpio error %d\n", ret);
+		return ret;
+	}
+
+	return devm_snd_soc_register_card(&pdev->dev, card);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id mt8192_mt6359_rt1015_rt5682_dt_match[] = {
+	{.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",},
+	{}
+};
+#endif
+
+static const struct dev_pm_ops mt8192_mt6359_rt1015_rt5682_pm_ops = {
+	.poweroff = snd_soc_poweroff,
+	.restore = snd_soc_resume,
+};
+
+static struct platform_driver mt8192_mt6359_rt1015_rt5682_driver = {
+	.driver = {
+		.name = "mt8192_mt6359_rt1015_rt5682",
+#ifdef CONFIG_OF
+		.of_match_table = mt8192_mt6359_rt1015_rt5682_dt_match,
+#endif
+		.pm = &mt8192_mt6359_rt1015_rt5682_pm_ops,
+	},
+	.probe = mt8192_mt6359_rt1015_rt5682_dev_probe,
+};
+
+module_platform_driver(mt8192_mt6359_rt1015_rt5682_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8192-MT6359-RT1015-RT5682 ALSA SoC machine driver");
+MODULE_AUTHOR("Jiaxin Yu <jiaxin.yu@mediatek.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("mt8192_mt6359_rt1015_rt5682 soc card");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
