Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3EFC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9146101E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD9146101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16R1/mWQz4x177KP3qF4pklG05lUoXaLnbVta26a4s8=; b=cZotfkT5hr9DZ3
	rAR5qsmrOQBrSI775qcplR2B5EA37s7B2SSrayZaI4u/oAA/p5mvroThKLIj2ZmIbdQ6e8KLCuYUB
	H0RhCOajKZwCRo81dZmsFS3CLiFB8z4X92ZIYY9h/2NA3vjkWkNDlGAbhddK77yvzxuPr65h3MSUa
	WDEBjfsxd3elb/cZvm4v7wejwxliLmU0lcFHzkIqm22Asmrs7Op2pEHNbXlrfP8VteC1UOedd8WpD
	LD2zBPQKK+Kv4m3OPMTehzkAv32RwfJBtxnXfXZEzeDTitvbWG0MEQdj8Gn9+8cNWmjztxy+ompaZ
	TMJSCJNqEWONIsKDOCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD1yU-0005N9-2X; Mon, 09 Aug 2021 09:53:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD1xz-0005Bu-IK; Mon, 09 Aug 2021 09:53:10 +0000
X-UUID: 049d683054ba4959b25c419bc9208924-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=V+MYQvssVLnX/IVH2qIySe1GnbQ9c8N3Cf6xUrSHTC4=; 
 b=d1FwF32vZCd7tvBcl1qx0vBmqoUzUfoCu7G5483S7RCUI61CvQ2gwJ8c2tgSU3tE761w1X2pZ5udI7NJ6gIv8jhaGisLiyCI6HhynGFDiKWTOLqcc42xTMLcZlXXCZa38tNWoGYVBYM09Ie0oCmXkeBC915vYG9WlfWWjKUF4XI=;
X-UUID: 049d683054ba4959b25c419bc9208924-20210809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1302257171; Mon, 09 Aug 2021 02:53:03 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 02:49:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 17:48:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 17:48:59 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, <jiaxin.yu@mediatek.com>, <cychiang@google.com>, 
 <aaronyu@google.com>, <wenst@chromium.org>
Subject: [PATCH v3 4/9] ASoC: mediatek: mt8195: support adda in platform driver
Date: Mon, 9 Aug 2021 17:48:50 +0800
Message-ID: <20210809094855.7169-5-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210809094855.7169-1-trevor.wu@mediatek.com>
References: <20210809094855.7169-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_025307_664672_8102AD6D 
X-CRM114-Status: GOOD (  19.38  )
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

This patch adds mt8195 adda dai driver.

audio_h clock is used by ADSP bus and ADDA module.
When ADDA requires audio_h clock, it is switched to APLL1, otherwise
it is switched to Xtal_26m so that APLL1 can be turned off when audio
feature is not used.
ADSP bus only requires that the clock is on, so dynamic reparenting
is used for the purpose of lowering power consumption.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 830 ++++++++++++++++++++
 1 file changed, 830 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-adda.c

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
new file mode 100644
index 000000000000..878dec0b69ed
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -0,0 +1,830 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek ALSA SoC Audio DAI ADDA Control
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/regmap.h>
+#include "mt8195-afe-clk.h"
+#include "mt8195-afe-common.h"
+#include "mt8195-reg.h"
+
+#define ADDA_DL_GAIN_LOOPBACK 0x1800
+#define ADDA_HIRES_THRES 48000
+
+enum {
+	SUPPLY_SEQ_CLOCK_SEL,
+	SUPPLY_SEQ_CLOCK_ON,
+	SUPPLY_SEQ_ADDA_DL_ON,
+	SUPPLY_SEQ_ADDA_MTKAIF_CFG,
+	SUPPLY_SEQ_ADDA_UL_ON,
+	SUPPLY_SEQ_ADDA_AFE_ON,
+};
+
+enum {
+	MTK_AFE_ADDA_DL_RATE_8K = 0,
+	MTK_AFE_ADDA_DL_RATE_11K = 1,
+	MTK_AFE_ADDA_DL_RATE_12K = 2,
+	MTK_AFE_ADDA_DL_RATE_16K = 3,
+	MTK_AFE_ADDA_DL_RATE_22K = 4,
+	MTK_AFE_ADDA_DL_RATE_24K = 5,
+	MTK_AFE_ADDA_DL_RATE_32K = 6,
+	MTK_AFE_ADDA_DL_RATE_44K = 7,
+	MTK_AFE_ADDA_DL_RATE_48K = 8,
+	MTK_AFE_ADDA_DL_RATE_96K = 9,
+	MTK_AFE_ADDA_DL_RATE_192K = 10,
+};
+
+enum {
+	MTK_AFE_ADDA_UL_RATE_8K = 0,
+	MTK_AFE_ADDA_UL_RATE_16K = 1,
+	MTK_AFE_ADDA_UL_RATE_32K = 2,
+	MTK_AFE_ADDA_UL_RATE_48K = 3,
+	MTK_AFE_ADDA_UL_RATE_96K = 4,
+	MTK_AFE_ADDA_UL_RATE_192K = 5,
+};
+
+enum {
+	DELAY_DATA_MISO1 = 0,
+	DELAY_DATA_MISO0 = 1,
+	DELAY_DATA_MISO2 = 1,
+};
+
+enum {
+	MTK_AFE_ADDA,
+	MTK_AFE_ADDA6,
+};
+
+struct mtk_dai_adda_priv {
+	bool hires_required;
+};
+
+static unsigned int afe_adda_dl_rate_transform(struct mtk_base_afe *afe,
+					       unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_ADDA_DL_RATE_8K;
+	case 11025:
+		return MTK_AFE_ADDA_DL_RATE_11K;
+	case 12000:
+		return MTK_AFE_ADDA_DL_RATE_12K;
+	case 16000:
+		return MTK_AFE_ADDA_DL_RATE_16K;
+	case 22050:
+		return MTK_AFE_ADDA_DL_RATE_22K;
+	case 24000:
+		return MTK_AFE_ADDA_DL_RATE_24K;
+	case 32000:
+		return MTK_AFE_ADDA_DL_RATE_32K;
+	case 44100:
+		return MTK_AFE_ADDA_DL_RATE_44K;
+	case 48000:
+		return MTK_AFE_ADDA_DL_RATE_48K;
+	case 96000:
+		return MTK_AFE_ADDA_DL_RATE_96K;
+	case 192000:
+		return MTK_AFE_ADDA_DL_RATE_192K;
+	default:
+		dev_info(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
+			 __func__, rate);
+		return MTK_AFE_ADDA_DL_RATE_48K;
+	}
+}
+
+static unsigned int afe_adda_ul_rate_transform(struct mtk_base_afe *afe,
+					       unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_ADDA_UL_RATE_8K;
+	case 16000:
+		return MTK_AFE_ADDA_UL_RATE_16K;
+	case 32000:
+		return MTK_AFE_ADDA_UL_RATE_32K;
+	case 48000:
+		return MTK_AFE_ADDA_UL_RATE_48K;
+	case 96000:
+		return MTK_AFE_ADDA_UL_RATE_96K;
+	case 192000:
+		return MTK_AFE_ADDA_UL_RATE_192K;
+	default:
+		dev_info(afe->dev, "%s(), rate %d invalid, use 48kHz!!!\n",
+			 __func__, rate);
+		return MTK_AFE_ADDA_UL_RATE_48K;
+	}
+}
+
+static int mt8195_adda_mtkaif_init(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtkaif_param *param = &afe_priv->mtkaif_params;
+	int delay_data;
+	int delay_cycle;
+	unsigned int mask = 0;
+	unsigned int val = 0;
+
+	/* set rx protocol 2 & mtkaif_rxif_clkinv_adc inverse */
+	mask = (MTKAIF_RXIF_CLKINV_ADC | MTKAIF_RXIF_PROTOCOL2);
+	val = (MTKAIF_RXIF_CLKINV_ADC | MTKAIF_RXIF_PROTOCOL2);
+
+	regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIF_CFG0, mask, val);
+	regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIF_CFG0, mask, val);
+
+	mask = RG_RX_PROTOCOL2;
+	val = RG_RX_PROTOCOL2;
+	regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP, mask, val);
+
+	if (!param->mtkaif_calibration_ok) {
+		dev_info(afe->dev, "%s(), calibration fail\n",  __func__);
+		return 0;
+	}
+
+	/* set delay for ch1, ch2 */
+	if (param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_0] >=
+	    param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1]) {
+		delay_data = DELAY_DATA_MISO1;
+		delay_cycle =
+			param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_0] -
+			param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1];
+	} else {
+		delay_data = DELAY_DATA_MISO0;
+		delay_cycle =
+			param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1] -
+			param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_0];
+	}
+
+	val = 0;
+	mask = (MTKAIF_RXIF_DELAY_DATA | MTKAIF_RXIF_DELAY_CYCLE_MASK);
+	val |= MTKAIF_RXIF_DELAY_CYCLE(delay_cycle) &
+	       MTKAIF_RXIF_DELAY_CYCLE_MASK;
+	val |= delay_data << MTKAIF_RXIF_DELAY_DATA_SHIFT;
+	regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIF_RX_CFG2, mask, val);
+
+	/* set delay between ch3 and ch2 */
+	if (param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_2] >=
+	    param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1]) {
+		delay_data = DELAY_DATA_MISO1;
+		delay_cycle =
+			param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_2] -
+			param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1];
+	} else {
+		delay_data = DELAY_DATA_MISO2;
+		delay_cycle =
+			param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1] -
+			param->mtkaif_phase_cycle[MT8195_MTKAIF_MISO_2];
+	}
+
+	val = 0;
+	mask = (MTKAIF_RXIF_DELAY_DATA | MTKAIF_RXIF_DELAY_CYCLE_MASK);
+	val |= MTKAIF_RXIF_DELAY_CYCLE(delay_cycle) &
+	       MTKAIF_RXIF_DELAY_CYCLE_MASK;
+	val |= delay_data << MTKAIF_RXIF_DELAY_DATA_SHIFT;
+	regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIF_RX_CFG2, mask, val);
+
+	return 0;
+}
+
+static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol,
+				     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8195_adda_mtkaif_init(afe);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMD:
+		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
+		usleep_range(125, 135);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void mtk_adda_ul_mictype(struct mtk_base_afe *afe, int adda, bool dmic)
+{
+	unsigned int reg = 0;
+	unsigned int mask = 0;
+	unsigned int val = 0;
+
+	switch (adda) {
+	case MTK_AFE_ADDA:
+		reg = AFE_ADDA_UL_SRC_CON0;
+		break;
+	case MTK_AFE_ADDA6:
+		reg = AFE_ADDA6_UL_SRC_CON0;
+		break;
+	default:
+		dev_info(afe->dev, "%s(), wrong parameter\n",  __func__);
+		return;
+	}
+
+	mask = (UL_SDM3_LEVEL_CTL | UL_MODE_3P25M_CH1_CTL |
+		UL_MODE_3P25M_CH2_CTL);
+
+	/* turn on dmic, ch1, ch2 */
+	if (dmic)
+		val = mask;
+
+	regmap_update_bits(afe->regmap, reg, mask, val);
+}
+
+static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtkaif_param *param = &afe_priv->mtkaif_params;
+
+	dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mtk_adda_ul_mictype(afe, MTK_AFE_ADDA, param->mtkaif_dmic_on);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
+		usleep_range(125, 135);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_adda6_ul_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol,
+			      int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtkaif_param *param = &afe_priv->mtkaif_params;
+	unsigned int val;
+
+	dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mtk_adda_ul_mictype(afe, MTK_AFE_ADDA6, param->mtkaif_dmic_on);
+
+		val = (param->mtkaif_adda6_only ?
+			ADDA6_MTKAIF_RX_SYNC_WORD2_DISABLE : 0);
+
+		regmap_update_bits(afe->regmap,
+				   AFE_ADDA_MTKAIF_SYNCWORD_CFG,
+				   ADDA6_MTKAIF_RX_SYNC_WORD2_DISABLE,
+				   val);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
+		usleep_range(125, 135);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol,
+				 int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk = afe_priv->clk[MT8195_CLK_TOP_AUDIO_H_SEL];
+	struct clk *clk_parent;
+
+	dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		clk_parent = afe_priv->clk[MT8195_CLK_TOP_APLL1];
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		clk_parent = afe_priv->clk[MT8195_CLK_XTAL_26M];
+		break;
+	default:
+		return 0;
+	}
+	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
+
+	return 0;
+}
+
+static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
+						       const char *name)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int dai_id;
+
+	if (strstr(name, "aud_adc_hires"))
+		dai_id = MT8195_AFE_IO_UL_SRC1;
+	else if (strstr(name, "aud_adda6_adc_hires"))
+		dai_id = MT8195_AFE_IO_UL_SRC2;
+	else if (strstr(name, "aud_dac_hires"))
+		dai_id = MT8195_AFE_IO_DL_SRC;
+	else
+		return NULL;
+
+	return afe_priv->dai_priv[dai_id];
+}
+
+static int mtk_afe_adda_hires_connect(struct snd_soc_dapm_widget *source,
+				      struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = source;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_dai_adda_priv *adda_priv;
+
+	adda_priv = get_adda_priv_by_name(afe, w->name);
+
+	if (!adda_priv) {
+		dev_info(afe->dev, "adda_priv == NULL");
+		return 0;
+	}
+
+	return (adda_priv->hires_required) ? 1 : 0;
+}
+
+static const struct snd_kcontrol_new mtk_dai_adda_o176_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I000 Switch", AFE_CONN176, 0, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I002 Switch", AFE_CONN176, 2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I020 Switch", AFE_CONN176, 20, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I022 Switch", AFE_CONN176, 22, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I070 Switch", AFE_CONN176_2, 6, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_dai_adda_o177_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I001 Switch", AFE_CONN177, 1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I003 Switch", AFE_CONN177, 3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I021 Switch", AFE_CONN177, 21, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I023 Switch", AFE_CONN177, 23, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I071 Switch", AFE_CONN177_2, 7, 1, 0),
+};
+
+static const char * const adda_dlgain_mux_map[] = {
+	"Bypass", "Connect",
+};
+
+static SOC_ENUM_SINGLE_DECL(adda_dlgain_mux_map_enum,
+			    SND_SOC_NOPM, 0,
+			    adda_dlgain_mux_map);
+
+static const struct snd_kcontrol_new adda_dlgain_mux_control =
+	SOC_DAPM_ENUM("DL_GAIN_MUX", adda_dlgain_mux_map_enum);
+
+static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] = {
+	SND_SOC_DAPM_MIXER("I168", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I169", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I170", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I171", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MIXER("O176", SND_SOC_NOPM, 0, 0,
+			   mtk_dai_adda_o176_mix,
+			   ARRAY_SIZE(mtk_dai_adda_o176_mix)),
+	SND_SOC_DAPM_MIXER("O177", SND_SOC_NOPM, 0, 0,
+			   mtk_dai_adda_o177_mix,
+			   ARRAY_SIZE(mtk_dai_adda_o177_mix)),
+
+	SND_SOC_DAPM_SUPPLY_S("ADDA Enable", SUPPLY_SEQ_ADDA_AFE_ON,
+			      AFE_ADDA_UL_DL_CON0,
+			      ADDA_AFE_ON_SHIFT, 0,
+			      NULL,
+			      0),
+
+	SND_SOC_DAPM_SUPPLY_S("ADDA Playback Enable", SUPPLY_SEQ_ADDA_DL_ON,
+			      AFE_ADDA_DL_SRC2_CON0,
+			      DL_2_SRC_ON_TMP_CTRL_PRE_SHIFT, 0,
+			      mtk_adda_dl_event,
+			      SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("ADDA Capture Enable", SUPPLY_SEQ_ADDA_UL_ON,
+			      AFE_ADDA_UL_SRC_CON0,
+			      UL_SRC_ON_TMP_CTL_SHIFT, 0,
+			      mtk_adda_ul_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("ADDA6 Capture Enable", SUPPLY_SEQ_ADDA_UL_ON,
+			      AFE_ADDA6_UL_SRC_CON0,
+			      UL_SRC_ON_TMP_CTL_SHIFT, 0,
+			      mtk_adda6_ul_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("AUDIO_HIRES", SUPPLY_SEQ_CLOCK_SEL,
+			      SND_SOC_NOPM,
+			      0, 0,
+			      mtk_audio_hires_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("ADDA_MTKAIF_CFG", SUPPLY_SEQ_ADDA_MTKAIF_CFG,
+			      SND_SOC_NOPM,
+			      0, 0,
+			      mtk_adda_mtkaif_cfg_event,
+			      SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_MUX("DL_GAIN_MUX", SND_SOC_NOPM, 0, 0,
+			 &adda_dlgain_mux_control),
+
+	SND_SOC_DAPM_PGA("DL_GAIN", AFE_ADDA_DL_SRC2_CON0,
+			 DL_2_GAIN_ON_CTL_PRE_SHIFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_INPUT("ADDA_INPUT"),
+	SND_SOC_DAPM_OUTPUT("ADDA_OUTPUT"),
+
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_dac"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_adc"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_adda6_adc"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_dac_hires"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_adc_hires"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_adda6_adc_hires"),
+};
+
+static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
+	{"ADDA Capture", NULL, "ADDA Enable"},
+	{"ADDA Capture", NULL, "ADDA Capture Enable"},
+	{"ADDA Capture", NULL, "ADDA_MTKAIF_CFG"},
+	{"ADDA Capture", NULL, "aud_adc"},
+	{"ADDA Capture", NULL, "aud_adc_hires", mtk_afe_adda_hires_connect},
+	{"aud_adc_hires", NULL, "AUDIO_HIRES"},
+
+	{"ADDA6 Capture", NULL, "ADDA Enable"},
+	{"ADDA6 Capture", NULL, "ADDA6 Capture Enable"},
+	{"ADDA6 Capture", NULL, "ADDA_MTKAIF_CFG"},
+	{"ADDA6 Capture", NULL, "aud_adda6_adc"},
+	{"ADDA6 Capture", NULL, "aud_adda6_adc_hires",
+	mtk_afe_adda_hires_connect},
+	{"aud_adda6_adc_hires", NULL, "AUDIO_HIRES"},
+
+	{"I168", NULL, "ADDA Capture"},
+	{"I169", NULL, "ADDA Capture"},
+	{"I170", NULL, "ADDA6 Capture"},
+	{"I171", NULL, "ADDA6 Capture"},
+
+	{"ADDA Playback", NULL, "ADDA Enable"},
+	{"ADDA Playback", NULL, "ADDA Playback Enable"},
+	{"ADDA Playback", NULL, "aud_dac"},
+	{"ADDA Playback", NULL, "aud_dac_hires", mtk_afe_adda_hires_connect},
+	{"aud_dac_hires", NULL, "AUDIO_HIRES"},
+
+	{"DL_GAIN", NULL, "O176"},
+	{"DL_GAIN", NULL, "O177"},
+
+	{"DL_GAIN_MUX", "Bypass", "O176"},
+	{"DL_GAIN_MUX", "Bypass", "O177"},
+	{"DL_GAIN_MUX", "Connect", "DL_GAIN"},
+
+	{"ADDA Playback", NULL, "DL_GAIN_MUX"},
+
+	{"O176", "I000 Switch", "I000"},
+	{"O177", "I001 Switch", "I001"},
+
+	{"O176", "I002 Switch", "I002"},
+	{"O177", "I003 Switch", "I003"},
+
+	{"O176", "I020 Switch", "I020"},
+	{"O177", "I021 Switch", "I021"},
+
+	{"O176", "I022 Switch", "I022"},
+	{"O177", "I023 Switch", "I023"},
+
+	{"O176", "I070 Switch", "I070"},
+	{"O177", "I071 Switch", "I071"},
+
+	{"ADDA Capture", NULL, "ADDA_INPUT"},
+	{"ADDA6 Capture", NULL, "ADDA_INPUT"},
+	{"ADDA_OUTPUT", NULL, "ADDA Playback"},
+};
+
+static int mt8195_adda_dl_gain_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	unsigned int reg = AFE_ADDA_DL_SRC2_CON1;
+	unsigned int mask = DL_2_GAIN_CTL_PRE_MASK;
+	unsigned int value = (unsigned int)(ucontrol->value.integer.value[0]);
+
+	regmap_update_bits(afe->regmap, reg, mask, DL_2_GAIN_CTL_PRE(value));
+	return 0;
+}
+
+static int mt8195_adda_dl_gain_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	unsigned int reg = AFE_ADDA_DL_SRC2_CON1;
+	unsigned int mask = DL_2_GAIN_CTL_PRE_MASK;
+	unsigned int value = 0;
+
+	regmap_read(afe->regmap, reg, &value);
+
+	ucontrol->value.integer.value[0] = ((value & mask) >>
+					    DL_2_GAIN_CTL_PRE_SHIFT);
+	return 0;
+}
+
+static int mt8195_adda6_only_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtkaif_param *param = &afe_priv->mtkaif_params;
+
+	ucontrol->value.integer.value[0] = param->mtkaif_adda6_only;
+	return 0;
+}
+
+static int mt8195_adda6_only_set(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtkaif_param *param = &afe_priv->mtkaif_params;
+	int mtkaif_adda6_only;
+
+	mtkaif_adda6_only = ucontrol->value.integer.value[0];
+
+	dev_info(afe->dev, "%s(), kcontrol name %s, mtkaif_adda6_only %d\n",
+		 __func__, kcontrol->id.name, mtkaif_adda6_only);
+
+	param->mtkaif_adda6_only = mtkaif_adda6_only;
+
+	return 0;
+}
+
+static int mt8195_adda_dmic_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtkaif_param *param = &afe_priv->mtkaif_params;
+
+	ucontrol->value.integer.value[0] = param->mtkaif_dmic_on;
+	return 0;
+}
+
+static int mt8195_adda_dmic_set(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtkaif_param *param = &afe_priv->mtkaif_params;
+	int dmic_on;
+
+	dmic_on = ucontrol->value.integer.value[0];
+
+	dev_dbg(afe->dev, "%s(), kcontrol name %s, dmic_on %d\n",
+		__func__, kcontrol->id.name, dmic_on);
+
+	param->mtkaif_dmic_on = dmic_on;
+	return 0;
+}
+
+static const struct snd_kcontrol_new mtk_dai_adda_controls[] = {
+	SOC_SINGLE_EXT("ADDA_DL_Gain", SND_SOC_NOPM, 0, 65535, 0,
+		       mt8195_adda_dl_gain_get, mt8195_adda_dl_gain_put),
+	SOC_SINGLE_BOOL_EXT("MTKAIF_DMIC", 0,
+			    mt8195_adda_dmic_get, mt8195_adda_dmic_set),
+	SOC_SINGLE_BOOL_EXT("MTKAIF_ADDA6_ONLY", 0,
+			    mt8195_adda6_only_get,
+			    mt8195_adda6_only_set),
+};
+
+static int mtk_dai_da_configure(struct mtk_base_afe *afe,
+				unsigned int rate, int id)
+{
+	unsigned int val = 0;
+	unsigned int mask = 0;
+
+	/* set sampling rate */
+	mask |= DL_2_INPUT_MODE_CTL_MASK;
+	val |= DL_2_INPUT_MODE_CTL(afe_adda_dl_rate_transform(afe, rate));
+
+	/* turn off saturation */
+	mask |= DL_2_CH1_SATURATION_EN_CTL;
+	mask |= DL_2_CH2_SATURATION_EN_CTL;
+
+	/* turn off mute function */
+	mask |= DL_2_MUTE_CH1_OFF_CTL_PRE;
+	mask |= DL_2_MUTE_CH2_OFF_CTL_PRE;
+	val |= DL_2_MUTE_CH1_OFF_CTL_PRE;
+	val |= DL_2_MUTE_CH2_OFF_CTL_PRE;
+
+	/* set voice input data if input sample rate is 8k or 16k */
+	mask |= DL_2_VOICE_MODE_CTL_PRE;
+	if (rate == 8000 || rate == 16000)
+		val |= DL_2_VOICE_MODE_CTL_PRE;
+
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, mask, val);
+
+	mask = 0;
+	val = 0;
+
+	/* new 2nd sdm */
+	mask |= DL_USE_NEW_2ND_SDM;
+	val |= DL_USE_NEW_2ND_SDM;
+	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SDM_DCCOMP_CON, mask, val);
+
+	return 0;
+}
+
+static int mtk_dai_ad_configure(struct mtk_base_afe *afe,
+				unsigned int rate, int id)
+{
+	unsigned int val = 0;
+	unsigned int mask = 0;
+
+	mask |= UL_VOICE_MODE_CTL_MASK;
+	val |= UL_VOICE_MODE_CTL(afe_adda_ul_rate_transform(afe, rate));
+
+	switch (id) {
+	case MT8195_AFE_IO_UL_SRC1:
+		regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0,
+				   mask, val);
+		break;
+	case MT8195_AFE_IO_UL_SRC2:
+		regmap_update_bits(afe->regmap, AFE_ADDA6_UL_SRC_CON0,
+				   mask, val);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_adda_priv *adda_priv = afe_priv->dai_priv[dai->id];
+	unsigned int rate = params_rate(params);
+	int id = dai->id;
+	int ret = 0;
+
+	dev_dbg(afe->dev, "%s(), id %d, stream %d, rate %d\n",
+		__func__, id, substream->stream, rate);
+
+	if (rate > ADDA_HIRES_THRES)
+		adda_priv->hires_required = 1;
+	else
+		adda_priv->hires_required = 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		ret = mtk_dai_da_configure(afe, rate, id);
+	else
+		ret = mtk_dai_ad_configure(afe, rate, id);
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_adda_ops = {
+	.hw_params = mtk_dai_adda_hw_params,
+};
+
+/* dai driver */
+#define MTK_ADDA_PLAYBACK_RATES (SNDRV_PCM_RATE_8000_48000 |\
+				 SNDRV_PCM_RATE_96000 |\
+				 SNDRV_PCM_RATE_192000)
+
+#define MTK_ADDA_CAPTURE_RATES (SNDRV_PCM_RATE_8000 |\
+				SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 |\
+				SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_96000 |\
+				SNDRV_PCM_RATE_192000)
+
+#define MTK_ADDA_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			  SNDRV_PCM_FMTBIT_S24_LE |\
+			  SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mtk_dai_adda_driver[] = {
+	{
+		.name = "DL_SRC",
+		.id = MT8195_AFE_IO_DL_SRC,
+		.playback = {
+			.stream_name = "ADDA Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_ADDA_PLAYBACK_RATES,
+			.formats = MTK_ADDA_FORMATS,
+		},
+		.ops = &mtk_dai_adda_ops,
+	},
+	{
+		.name = "UL_SRC1",
+		.id = MT8195_AFE_IO_UL_SRC1,
+		.capture = {
+			.stream_name = "ADDA Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_ADDA_CAPTURE_RATES,
+			.formats = MTK_ADDA_FORMATS,
+		},
+		.ops = &mtk_dai_adda_ops,
+	},
+	{
+		.name = "UL_SRC2",
+		.id = MT8195_AFE_IO_UL_SRC2,
+		.capture = {
+			.stream_name = "ADDA6 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_ADDA_CAPTURE_RATES,
+			.formats = MTK_ADDA_FORMATS,
+		},
+		.ops = &mtk_dai_adda_ops,
+	},
+};
+
+static int init_adda_priv_data(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_adda_priv *adda_priv;
+	int adda_dai_list[] = { MT8195_AFE_IO_DL_SRC,
+				MT8195_AFE_IO_UL_SRC1,
+				MT8195_AFE_IO_UL_SRC2};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(adda_dai_list); i++) {
+		adda_priv = devm_kzalloc(afe->dev,
+					 sizeof(struct mtk_dai_adda_priv),
+					 GFP_KERNEL);
+		if (!adda_priv)
+			return -ENOMEM;
+
+		afe_priv->dai_priv[adda_dai_list[i]] = adda_priv;
+	}
+
+	return 0;
+}
+
+int mt8195_dai_adda_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_adda_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_adda_driver);
+
+	dai->dapm_widgets = mtk_dai_adda_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_adda_widgets);
+	dai->dapm_routes = mtk_dai_adda_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_adda_routes);
+	dai->controls = mtk_dai_adda_controls;
+	dai->num_controls = ARRAY_SIZE(mtk_dai_adda_controls);
+
+	return init_adda_priv_data(afe);
+}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
