Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lph7XCyL3BKHPmYp3XPvTUbit1YvosvnBnGbtVVYipo=; b=t7/LvvfDQPh3jG
	NnSWq/9ahzrIJzwe+048VhrPrQU0rNHkONxjv9WZ+V8yOrYxgVkAEQUssBzHwBWizVT7bJtQlcH4A
	YeAJgd35YvXjqaOyPBYk7kLXKFgnvWhm6wQAmU1APvE/E6/PBzX5e/kaITD3X4I8iwH3Ws9kTekMU
	Ikinw7LzNmSFYX7DXbdJmDtse6ACwam61on6CRp7KRY0mNgSTa+ag7yuVbzLiCYE1DomE9j7Cpt6P
	EM4M6Oiz78BvrPj8hcmIwvxUnTme6L3QlOTLKPFQSVsf8+ONMoIKOFGxuildCY9/RTolFfHIS2F6c
	dZOQPDzw5VPtv69oCHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26Lj-000Jbb-Cr; Tue, 28 Dec 2021 06:52:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26Le-000JXB-Ax; Tue, 28 Dec 2021 06:52:41 +0000
X-UUID: 4adbea0aa98243899a5f19248b817737-20211227
X-UUID: 4adbea0aa98243899a5f19248b817737-20211227
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 478434914; Mon, 27 Dec 2021 23:52:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Dec 2021 22:48:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 28 Dec 2021 14:48:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Dec 2021 14:48:22 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <jiaxin.yu@mediatek.com>, <shumingf@realtek.com>, <tzungbi@google.com>
Subject: [PATCH v2] ASoC: mediatek: mt8195: update control for RT5682 series
Date: Tue, 28 Dec 2021 14:48:21 +0800
Message-ID: <20211228064821.27865-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_225238_428169_6DD0B4C5 
X-CRM114-Status: GOOD (  19.14  )
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

Playback pop is observed and the root cause is the reference clock
provided by MT8195 is diabled before RT5682 finishes the control flow.

To ensure the reference clock supplied to RT5682 is disabled after RT5682
finishes all register controls. We replace BCLK with MCLK for RT5682
reference clock, and makes use of set_bias_level_post to handle MCLK
which guarantees MCLK is off after all RT5682 register access.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
Changes since v1:
  1. Adopt some suggestions from Tzung-bi.
  2. mclk phandle is retrieved from afe component instead of dts.
---
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 56 ++++++++++++++-
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 68 ++++++++++++++++---
 2 files changed, 110 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index ce8dace6527c..8adbd46c4bc4 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -18,6 +18,7 @@
 #include "../../codecs/rt1011.h"
 #include "../../codecs/rt5682.h"
 #include "../common/mtk-afe-platform-driver.h"
+#include "mt8195-afe-clk.h"
 #include "mt8195-afe-common.h"
 
 #define RT1011_CODEC_DAI	"rt1011-aif"
@@ -34,6 +35,7 @@ struct mt8195_mt6359_rt1011_rt5682_priv {
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack dp_jack;
 	struct snd_soc_jack hdmi_jack;
+	struct clk *i2so1_mclk;
 };
 
 static const struct snd_soc_dapm_widget
@@ -84,8 +86,8 @@ static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1, RT5682_PLL1_S_BCLK1,
-				  rate * 64, rate * 512);
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1, RT5682_PLL1_S_MCLK,
+				  rate * 256, rate * 512);
 	if (ret) {
 		dev_err(card->dev, "failed to set pll\n");
 		return ret;
@@ -98,7 +100,7 @@ static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 128,
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 256,
 				      SND_SOC_CLOCK_OUT);
 }
 
@@ -327,8 +329,14 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
 		snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &priv->headset_jack;
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int ret;
 
+	priv->i2so1_mclk = afe_priv->clk[MT8195_CLK_TOP_APLL12_DIV2];
+
 	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
@@ -562,6 +570,47 @@ static const struct snd_soc_ops mt8195_capture_ops = {
 	.startup = mt8195_capture_startup,
 };
 
+static int mt8195_set_bias_level_post(struct snd_soc_card *card,
+	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
+{
+	struct snd_soc_component *component = dapm->component;
+	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
+		snd_soc_card_get_drvdata(card);
+	int ret;
+
+	/*
+	 * It's required to control mclk directly in the set_bias_level_post
+	 * function for rt5682 and rt5682s codec, or the unexpected pop happens
+	 * at the end of playback.
+	 */
+	if (!component ||
+	    (strcmp(component->name, RT5682_DEV0_NAME) &&
+	    strcmp(component->name, RT5682S_DEV0_NAME)))
+		return 0;
+
+	switch (level) {
+	case SND_SOC_BIAS_OFF:
+		if (!__clk_is_enabled(priv->i2so1_mclk))
+			return 0;
+
+		clk_disable_unprepare(priv->i2so1_mclk);
+		dev_dbg(card->dev, "Disable i2so1 mclk\n");
+		break;
+	case SND_SOC_BIAS_ON:
+		ret = clk_prepare_enable(priv->i2so1_mclk);
+		if (ret) {
+			dev_err(card->dev, "Can't enable i2so1 mclk: %d\n", ret);
+			return ret;
+		}
+		dev_dbg(card->dev, "Enable i2so1 mclk\n");
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 enum {
 	DAI_LINK_DL2_FE,
 	DAI_LINK_DL3_FE,
@@ -1037,6 +1086,7 @@ static struct snd_soc_card mt8195_mt6359_rt1011_rt5682_soc_card = {
 	.num_dapm_routes = ARRAY_SIZE(mt8195_mt6359_rt1011_rt5682_routes),
 	.codec_conf = rt1011_amp_conf,
 	.num_configs = ARRAY_SIZE(rt1011_amp_conf),
+	.set_bias_level_post = mt8195_set_bias_level_post,
 };
 
 static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index c15c58170e9d..20b351faeaff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -19,6 +19,7 @@
 #include "../../codecs/mt6359.h"
 #include "../../codecs/rt5682.h"
 #include "../common/mtk-afe-platform-driver.h"
+#include "mt8195-afe-clk.h"
 #include "mt8195-afe-common.h"
 
 #define RT1019_CODEC_DAI	"HiFi"
@@ -46,6 +47,7 @@ struct mt8195_mt6359_rt1019_rt5682_priv {
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack dp_jack;
 	struct snd_soc_jack hdmi_jack;
+	struct clk *i2so1_mclk;
 };
 
 static const struct snd_soc_dapm_widget
@@ -92,8 +94,6 @@ static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
-	unsigned int mclk_fs_ratio = 128;
-	unsigned int mclk_fs = rate * mclk_fs_ratio;
 	int bitwidth;
 	int ret;
 
@@ -109,25 +109,22 @@ static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1,
-				  RT5682_PLL1_S_BCLK1,
-				  params_rate(params) * 64,
-				  params_rate(params) * 512);
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1, RT5682_PLL1_S_MCLK,
+				  rate * 256, rate * 512);
 	if (ret) {
 		dev_err(card->dev, "failed to set pll\n");
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(codec_dai,
-				     RT5682_SCLK_S_PLL1,
-				     params_rate(params) * 512,
-				     SND_SOC_CLOCK_IN);
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+				     rate * 512, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(card->dev, "failed to set sysclk\n");
 		return ret;
 	}
 
-	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 256,
+				      SND_SOC_CLOCK_OUT);
 }
 
 static const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
@@ -322,8 +319,14 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
 		snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &priv->headset_jack;
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int ret;
 
+	priv->i2so1_mclk = afe_priv->clk[MT8195_CLK_TOP_APLL12_DIV2];
+
 	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
@@ -560,6 +563,48 @@ static const struct snd_soc_ops mt8195_capture_ops = {
 	.startup = mt8195_capture_startup,
 };
 
+static int mt8195_set_bias_level_post(struct snd_soc_card *card,
+	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
+{
+	struct snd_soc_component *component = dapm->component;
+	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
+		snd_soc_card_get_drvdata(card);
+	int ret;
+
+	/*
+	 * It's required to control mclk directly in the set_bias_level_post
+	 * function for rt5682 and rt5682s codec, or the unexpected pop happens
+	 * at the end of playback.
+	 */
+	if (!component ||
+	    (strcmp(component->name, RT5682_DEV0_NAME) &&
+	    strcmp(component->name, RT5682S_DEV0_NAME)))
+		return 0;
+
+
+	switch (level) {
+	case SND_SOC_BIAS_OFF:
+		if (!__clk_is_enabled(priv->i2so1_mclk))
+			return 0;
+
+		clk_disable_unprepare(priv->i2so1_mclk);
+		dev_dbg(card->dev, "Disable i2so1 mclk\n");
+		break;
+	case SND_SOC_BIAS_ON:
+		ret = clk_prepare_enable(priv->i2so1_mclk);
+		if (ret) {
+			dev_err(card->dev, "Can't enable i2so1 mclk: %d\n", ret);
+			return ret;
+		}
+		dev_dbg(card->dev, "Enable i2so1 mclk\n");
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 enum {
 	DAI_LINK_DL2_FE,
 	DAI_LINK_DL3_FE,
@@ -1199,6 +1244,7 @@ static struct snd_soc_card mt8195_mt6359_rt1019_rt5682_soc_card = {
 	.num_dapm_widgets = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_widgets),
 	.dapm_routes = mt8195_mt6359_rt1019_rt5682_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_routes),
+	.set_bias_level_post = mt8195_set_bias_level_post,
 };
 
 static int mt8195_dailink_parse_of(struct snd_soc_card *card, struct device_node *np,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
