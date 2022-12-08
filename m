Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ABDC4708D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 03:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9NFGOF7xSAIvscQSeDOHyQBSK9GJ0gRvlmYb9iLZSg=; b=W7PQbpV08Xok1cH12oQX6w4537
	QlZDkcBtVyBRH90SwK/UKVElx47qSn81bjKggGMUigrej0PAbR1HZnENs65ui30FXOzThtOPQ/6P9
	5LH73nuJkLuNZB203uRtbDCaj/B/8zl/yo8Dc5rUrX1xCrbJQB7GkqZli6HjO1Bk/W8qWqpVbMkuk
	qNi+IOyejH7RDEPGMedSvYSxmXq+unWiBXrC40/oiNWZ5jQV+GetBFb8GPtANhNgXSj2BkZ2Fi7vu
	ay3rPEXZ8obNjTpgsLtBz8KeeuzP1GiReWOzpK6qBXneDRsPtWopoPOE39bfMZ6JFzJKIlQ/shZI+
	0bHrQ8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p37g4-000yDA-Qv; Thu, 08 Dec 2022 03:34:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p37f3-000xKa-5N; Thu, 08 Dec 2022 03:33:28 +0000
X-UUID: 19e882a543f8414cbbf0c721fbfd7be1-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=S9NFGOF7xSAIvscQSeDOHyQBSK9GJ0gRvlmYb9iLZSg=;
	b=qgF6tnooLadrN1ZvnPMbW2YCGO9D+zoKyds3WGOKKnC+JXGZ+D1jY6sMq6U5xljm8+74IcnV2yTrrl80vfQqFXe2OCBQW2JOIOToUQD878wSy6JAa2tojG9DgdRahlQaOmxqp55D79Uap3gwcis4QQOYUtW0Gh64/MzhRe6WE38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:11fa668a-c10a-461c-80b9-7bf86f7f347a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:de21e016-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 19e882a543f8414cbbf0c721fbfd7be1-20221207
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 261257207; Wed, 07 Dec 2022 20:33:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Dec 2022 11:32:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Dec 2022 11:32:13 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 07/12] ASoC: mediatek: mt8188: support audio clock control
Date: Thu, 8 Dec 2022 11:31:43 +0800
Message-ID: <20221208033148.21866-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221208033148.21866-1-trevor.wu@mediatek.com>
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_193325_336275_04FD7318 
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

Add audio clock wrapper and audio tuner control.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 656 +++++++++++++++++++++
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h | 114 ++++
 2 files changed, 770 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-afe-clk.h

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
new file mode 100644
index 000000000000..67fecc5eeaf9
--- /dev/null
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -0,0 +1,656 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt8188-afe-clk.c  --  MediaTek 8188 afe clock ctrl
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ *         Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
+ */
+
+#include <linux/clk.h>
+
+#include "mt8188-afe-common.h"
+#include "mt8188-afe-clk.h"
+#include "mt8188-audsys-clk.h"
+#include "mt8188-reg.h"
+
+static const char *aud_clks[MT8188_CLK_NUM] = {
+	/* xtal */
+	[MT8188_CLK_XTAL_26M] = "clk26m",
+
+	/* divider */
+	[MT8188_CLK_TOP_APLL1] = "apll1_ck",
+	[MT8188_CLK_TOP_APLL2] = "apll2_ck",
+	[MT8188_CLK_TOP_APLL12_DIV0] = "apll12_div0",
+	[MT8188_CLK_TOP_APLL12_DIV1] = "apll12_div1",
+	[MT8188_CLK_TOP_APLL12_DIV2] = "apll12_div2",
+	[MT8188_CLK_TOP_APLL12_DIV3] = "apll12_div3",
+	[MT8188_CLK_TOP_APLL12_DIV9] = "apll12_div9",
+
+	/* mux */
+	[MT8188_CLK_TOP_A1SYS_HP_SEL] = "top_a1sys_hp",
+	[MT8188_CLK_TOP_AUD_INTBUS_SEL] = "top_aud_intbus",
+	[MT8188_CLK_TOP_AUDIO_H_SEL] = "top_audio_h",
+	[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL] = "top_audio_local_bus",
+	[MT8188_CLK_TOP_DPTX_M_SEL] = "top_dptx",
+	[MT8188_CLK_TOP_I2SO1_M_SEL] = "top_i2so1",
+	[MT8188_CLK_TOP_I2SO2_M_SEL] = "top_i2so2",
+	[MT8188_CLK_TOP_I2SI1_M_SEL] = "top_i2si1",
+	[MT8188_CLK_TOP_I2SI2_M_SEL] = "top_i2si2",
+
+	/* clock gate */
+	[MT8188_CLK_ADSP_AUDIO_26M] = "adsp_audio_26m",
+	/* afe clock gate */
+	[MT8188_CLK_AUD_AFE] = "aud_afe",
+	[MT8188_CLK_AUD_APLL1_TUNER] = "aud_apll1_tuner",
+	[MT8188_CLK_AUD_APLL2_TUNER] = "aud_apll2_tuner",
+	[MT8188_CLK_AUD_APLL] = "aud_apll",
+	[MT8188_CLK_AUD_APLL2] = "aud_apll2",
+	[MT8188_CLK_AUD_DAC] = "aud_dac",
+	[MT8188_CLK_AUD_ADC] = "aud_adc",
+	[MT8188_CLK_AUD_DAC_HIRES] = "aud_dac_hires",
+	[MT8188_CLK_AUD_A1SYS_HP] = "aud_a1sys_hp",
+	[MT8188_CLK_AUD_ADC_HIRES] = "aud_adc_hires",
+	[MT8188_CLK_AUD_I2SIN] = "aud_i2sin",
+	[MT8188_CLK_AUD_TDM_IN] = "aud_tdm_in",
+	[MT8188_CLK_AUD_I2S_OUT] = "aud_i2s_out",
+	[MT8188_CLK_AUD_TDM_OUT] = "aud_tdm_out",
+	[MT8188_CLK_AUD_HDMI_OUT] = "aud_hdmi_out",
+	[MT8188_CLK_AUD_ASRC11] = "aud_asrc11",
+	[MT8188_CLK_AUD_ASRC12] = "aud_asrc12",
+	[MT8188_CLK_AUD_A1SYS] = "aud_a1sys",
+	[MT8188_CLK_AUD_A2SYS] = "aud_a2sys",
+	[MT8188_CLK_AUD_PCMIF] = "aud_pcmif",
+	[MT8188_CLK_AUD_MEMIF_UL1] = "aud_memif_ul1",
+	[MT8188_CLK_AUD_MEMIF_UL2] = "aud_memif_ul2",
+	[MT8188_CLK_AUD_MEMIF_UL3] = "aud_memif_ul3",
+	[MT8188_CLK_AUD_MEMIF_UL4] = "aud_memif_ul4",
+	[MT8188_CLK_AUD_MEMIF_UL5] = "aud_memif_ul5",
+	[MT8188_CLK_AUD_MEMIF_UL6] = "aud_memif_ul6",
+	[MT8188_CLK_AUD_MEMIF_UL8] = "aud_memif_ul8",
+	[MT8188_CLK_AUD_MEMIF_UL9] = "aud_memif_ul9",
+	[MT8188_CLK_AUD_MEMIF_UL10] = "aud_memif_ul10",
+	[MT8188_CLK_AUD_MEMIF_DL2] = "aud_memif_dl2",
+	[MT8188_CLK_AUD_MEMIF_DL3] = "aud_memif_dl3",
+	[MT8188_CLK_AUD_MEMIF_DL6] = "aud_memif_dl6",
+	[MT8188_CLK_AUD_MEMIF_DL7] = "aud_memif_dl7",
+	[MT8188_CLK_AUD_MEMIF_DL8] = "aud_memif_dl8",
+	[MT8188_CLK_AUD_MEMIF_DL10] = "aud_memif_dl10",
+	[MT8188_CLK_AUD_MEMIF_DL11] = "aud_memif_dl11",
+};
+
+struct mt8188_afe_tuner_cfg {
+	unsigned int id;
+	int apll_div_reg;
+	unsigned int apll_div_shift;
+	unsigned int apll_div_maskbit;
+	unsigned int apll_div_default;
+	int ref_ck_sel_reg;
+	unsigned int ref_ck_sel_shift;
+	unsigned int ref_ck_sel_maskbit;
+	unsigned int ref_ck_sel_default;
+	int tuner_en_reg;
+	unsigned int tuner_en_shift;
+	unsigned int tuner_en_maskbit;
+	int upper_bound_reg;
+	unsigned int upper_bound_shift;
+	unsigned int upper_bound_maskbit;
+	unsigned int upper_bound_default;
+	spinlock_t ctrl_lock; /* lock for apll tuner ctrl*/
+	int ref_cnt;
+};
+
+static struct mt8188_afe_tuner_cfg
+	mt8188_afe_tuner_cfgs[MT8188_AUD_PLL_NUM] = {
+	[MT8188_AUD_PLL1] = {
+		.id = MT8188_AUD_PLL1,
+		.apll_div_reg = AFE_APLL_TUNER_CFG,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0xf,
+		.apll_div_default = 0x7,
+		.ref_ck_sel_reg = AFE_APLL_TUNER_CFG,
+		.ref_ck_sel_shift = 1,
+		.ref_ck_sel_maskbit = 0x3,
+		.ref_ck_sel_default = 0x2,
+		.tuner_en_reg = AFE_APLL_TUNER_CFG,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_APLL_TUNER_CFG,
+		.upper_bound_shift = 8,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x3,
+	},
+	[MT8188_AUD_PLL2] = {
+		.id = MT8188_AUD_PLL2,
+		.apll_div_reg = AFE_APLL_TUNER_CFG1,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0xf,
+		.apll_div_default = 0x7,
+		.ref_ck_sel_reg = AFE_APLL_TUNER_CFG1,
+		.ref_ck_sel_shift = 1,
+		.ref_ck_sel_maskbit = 0x3,
+		.ref_ck_sel_default = 0x1,
+		.tuner_en_reg = AFE_APLL_TUNER_CFG1,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_APLL_TUNER_CFG1,
+		.upper_bound_shift = 8,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x3,
+	},
+	[MT8188_AUD_PLL3] = {
+		.id = MT8188_AUD_PLL3,
+		.apll_div_reg = AFE_EARC_APLL_TUNER_CFG,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0x3f,
+		.apll_div_default = 0x3,
+		.ref_ck_sel_reg = AFE_EARC_APLL_TUNER_CFG,
+		.ref_ck_sel_shift = 24,
+		.ref_ck_sel_maskbit = 0x3,
+		.ref_ck_sel_default = 0x0,
+		.tuner_en_reg = AFE_EARC_APLL_TUNER_CFG,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_EARC_APLL_TUNER_CFG,
+		.upper_bound_shift = 12,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x4,
+	},
+	[MT8188_AUD_PLL4] = {
+		.id = MT8188_AUD_PLL4,
+		.apll_div_reg = AFE_SPDIFIN_APLL_TUNER_CFG,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0x3f,
+		.apll_div_default = 0x7,
+		.ref_ck_sel_reg = AFE_SPDIFIN_APLL_TUNER_CFG1,
+		.ref_ck_sel_shift = 8,
+		.ref_ck_sel_maskbit = 0x1,
+		.ref_ck_sel_default = 0,
+		.tuner_en_reg = AFE_SPDIFIN_APLL_TUNER_CFG,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_SPDIFIN_APLL_TUNER_CFG,
+		.upper_bound_shift = 12,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x4,
+	},
+	[MT8188_AUD_PLL5] = {
+		.id = MT8188_AUD_PLL5,
+		.apll_div_reg = AFE_LINEIN_APLL_TUNER_CFG,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0x3f,
+		.apll_div_default = 0x3,
+		.ref_ck_sel_reg = AFE_LINEIN_APLL_TUNER_CFG,
+		.ref_ck_sel_shift = 24,
+		.ref_ck_sel_maskbit = 0x1,
+		.ref_ck_sel_default = 0,
+		.tuner_en_reg = AFE_LINEIN_APLL_TUNER_CFG,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_LINEIN_APLL_TUNER_CFG,
+		.upper_bound_shift = 12,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x4,
+	},
+};
+
+static struct mt8188_afe_tuner_cfg *mt8188_afe_found_apll_tuner(unsigned int id)
+{
+	if (id >= MT8188_AUD_PLL_NUM)
+		return NULL;
+
+	return &mt8188_afe_tuner_cfgs[id];
+}
+
+static int mt8188_afe_init_apll_tuner(unsigned int id)
+{
+	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
+
+	if (!cfg)
+		return -EINVAL;
+
+	cfg->ref_cnt = 0;
+	spin_lock_init(&cfg->ctrl_lock);
+
+	return 0;
+}
+
+static int mt8188_afe_setup_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
+{
+	const struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
+
+	if (!cfg)
+		return -EINVAL;
+
+	regmap_update_bits(afe->regmap,
+			   cfg->apll_div_reg,
+			   cfg->apll_div_maskbit << cfg->apll_div_shift,
+			   cfg->apll_div_default << cfg->apll_div_shift);
+
+	regmap_update_bits(afe->regmap,
+			   cfg->ref_ck_sel_reg,
+			   cfg->ref_ck_sel_maskbit << cfg->ref_ck_sel_shift,
+			   cfg->ref_ck_sel_default << cfg->ref_ck_sel_shift);
+
+	regmap_update_bits(afe->regmap,
+			   cfg->upper_bound_reg,
+			   cfg->upper_bound_maskbit << cfg->upper_bound_shift,
+			   cfg->upper_bound_default << cfg->upper_bound_shift);
+
+	return 0;
+}
+
+static int mt8188_afe_enable_tuner_clk(struct mtk_base_afe *afe,
+				       unsigned int id)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+
+	switch (id) {
+	case MT8188_AUD_PLL1:
+		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		break;
+	case MT8188_AUD_PLL2:
+		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mt8188_afe_disable_tuner_clk(struct mtk_base_afe *afe,
+					unsigned int id)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+
+	switch (id) {
+	case MT8188_AUD_PLL1:
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+		break;
+	case MT8188_AUD_PLL2:
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mt8188_afe_enable_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
+{
+	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
+	unsigned long flags;
+	int ret;
+
+	if (!cfg)
+		return -EINVAL;
+
+	ret = mt8188_afe_setup_apll_tuner(afe, id);
+	if (ret)
+		return ret;
+
+	ret = mt8188_afe_enable_tuner_clk(afe, id);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&cfg->ctrl_lock, flags);
+
+	cfg->ref_cnt++;
+	if (cfg->ref_cnt == 1)
+		regmap_update_bits(afe->regmap,
+				   cfg->tuner_en_reg,
+				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+				   BIT(cfg->tuner_en_shift));
+
+	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+
+	return 0;
+}
+
+static int mt8188_afe_disable_apll_tuner(struct mtk_base_afe *afe, unsigned int id)
+{
+	struct mt8188_afe_tuner_cfg *cfg = mt8188_afe_found_apll_tuner(id);
+	unsigned long flags;
+	int ret;
+
+	if (!cfg)
+		return -EINVAL;
+
+	spin_lock_irqsave(&cfg->ctrl_lock, flags);
+
+	cfg->ref_cnt--;
+	if (cfg->ref_cnt == 0)
+		regmap_update_bits(afe->regmap,
+				   cfg->tuner_en_reg,
+				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+				   0 << cfg->tuner_en_shift);
+	else if (cfg->ref_cnt < 0)
+		cfg->ref_cnt = 0;
+
+	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+
+	ret = mt8188_afe_disable_tuner_clk(afe, id);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int mt8188_afe_get_mclk_source_clk_id(int sel)
+{
+	switch (sel) {
+	case MT8188_MCK_SEL_26M:
+		return MT8188_CLK_XTAL_26M;
+	case MT8188_MCK_SEL_APLL1:
+		return MT8188_CLK_TOP_APLL1;
+	case MT8188_MCK_SEL_APLL2:
+		return MT8188_CLK_TOP_APLL2;
+	default:
+		return -EINVAL;
+	}
+}
+
+int mt8188_afe_get_mclk_source_rate(struct mtk_base_afe *afe, int apll)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	int clk_id = mt8188_afe_get_mclk_source_clk_id(apll);
+
+	if (clk_id < 0) {
+		dev_dbg(afe->dev, "invalid clk id\n");
+		return 0;
+	}
+
+	return clk_get_rate(afe_priv->clk[clk_id]);
+}
+
+int mt8188_afe_get_default_mclk_source_by_rate(int rate)
+{
+	return ((rate % 8000) == 0) ?
+		MT8188_MCK_SEL_APLL1 : MT8188_MCK_SEL_APLL2;
+}
+
+int mt8188_afe_init_clock(struct mtk_base_afe *afe)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	int i, ret;
+
+	ret = mt8188_audsys_clk_register(afe);
+	if (ret) {
+		dev_err(afe->dev, "register audsys clk fail %d\n", ret);
+		return ret;
+	}
+
+	afe_priv->clk =
+		devm_kcalloc(afe->dev, MT8188_CLK_NUM, sizeof(*afe_priv->clk),
+			     GFP_KERNEL);
+	if (!afe_priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < MT8188_CLK_NUM; i++) {
+		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i])) {
+			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
+				__func__, aud_clks[i],
+				PTR_ERR(afe_priv->clk[i]));
+			return PTR_ERR(afe_priv->clk[i]);
+		}
+	}
+
+	/* initial tuner */
+	for (i = 0; i < MT8188_AUD_PLL_NUM; i++) {
+		ret = mt8188_afe_init_apll_tuner(i);
+		if (ret) {
+			dev_info(afe->dev, "%s(), init apll_tuner%d failed",
+				 __func__, (i + 1));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+void mt8188_afe_deinit_clock(void *priv)
+{
+	struct mtk_base_afe *afe = priv;
+
+	mt8188_audsys_clk_unregister(afe);
+}
+
+int mt8188_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), failed to enable clk\n",
+				__func__);
+			return ret;
+		}
+	} else {
+		dev_dbg(afe->dev, "NULL clk\n");
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8188_afe_enable_clk);
+
+void mt8188_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_disable_unprepare(clk);
+	else
+		dev_dbg(afe->dev, "NULL clk\n");
+}
+EXPORT_SYMBOL_GPL(mt8188_afe_disable_clk);
+
+int mt8188_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+			    unsigned int rate)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_set_rate(clk, rate);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), failed to set clk rate\n",
+				__func__);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int mt8188_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+			      struct clk *parent)
+{
+	int ret;
+
+	if (clk && parent) {
+		ret = clk_set_parent(clk, parent);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), failed to set clk parent\n",
+				__func__);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static unsigned int get_top_cg_reg(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8188_TOP_CG_A1SYS_TIMING:
+	case MT8188_TOP_CG_A2SYS_TIMING:
+	case MT8188_TOP_CG_26M_TIMING:
+		return ASYS_TOP_CON;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_mask(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8188_TOP_CG_A1SYS_TIMING:
+		return ASYS_TOP_CON_A1SYS_TIMING_ON;
+	case MT8188_TOP_CG_A2SYS_TIMING:
+		return ASYS_TOP_CON_A2SYS_TIMING_ON;
+	case MT8188_TOP_CG_26M_TIMING:
+		return ASYS_TOP_CON_26M_TIMING_ON;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_on_val(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8188_TOP_CG_A1SYS_TIMING:
+	case MT8188_TOP_CG_A2SYS_TIMING:
+	case MT8188_TOP_CG_26M_TIMING:
+		return get_top_cg_mask(cg_type);
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_off_val(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8188_TOP_CG_A1SYS_TIMING:
+	case MT8188_TOP_CG_A2SYS_TIMING:
+	case MT8188_TOP_CG_26M_TIMING:
+		return 0;
+	default:
+		return get_top_cg_mask(cg_type);
+	}
+}
+
+static int mt8188_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_on_val(cg_type);
+
+	regmap_update_bits(afe->regmap, reg, mask, val);
+
+	return 0;
+}
+
+static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_off_val(cg_type);
+
+	regmap_update_bits(afe->regmap, reg, mask, val);
+
+	return 0;
+}
+
+int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+
+	/* bus clock for AFE external access, like DRAM */
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+
+	/* bus clock for AFE internal access, like AFE SRAM */
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+
+	/* audio 26m clock source */
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+
+	/* AFE hw clock */
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+
+	return 0;
+}
+
+int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+
+	return 0;
+}
+
+static int mt8188_afe_enable_afe_on(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
+	return 0;
+}
+
+static int mt8188_afe_disable_afe_on(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
+	return 0;
+}
+
+static int mt8188_afe_enable_timing_sys(struct mtk_base_afe *afe)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A2SYS]);
+
+	mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A1SYS_TIMING);
+	mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A2SYS_TIMING);
+	mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
+
+	return 0;
+}
+
+static int mt8188_afe_disable_timing_sys(struct mtk_base_afe *afe)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A2SYS]);
+
+	mt8188_afe_disable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
+	mt8188_afe_disable_top_cg(afe, MT8188_TOP_CG_A2SYS_TIMING);
+	mt8188_afe_disable_top_cg(afe, MT8188_TOP_CG_A1SYS_TIMING);
+
+	return 0;
+}
+
+int mt8188_afe_enable_main_clock(struct mtk_base_afe *afe)
+{
+	mt8188_afe_enable_timing_sys(afe);
+
+	mt8188_afe_enable_afe_on(afe);
+
+	mt8188_afe_enable_apll_tuner(afe, MT8188_AUD_PLL1);
+	mt8188_afe_enable_apll_tuner(afe, MT8188_AUD_PLL2);
+
+	return 0;
+}
+
+int mt8188_afe_disable_main_clock(struct mtk_base_afe *afe)
+{
+	mt8188_afe_disable_apll_tuner(afe, MT8188_AUD_PLL2);
+	mt8188_afe_disable_apll_tuner(afe, MT8188_AUD_PLL1);
+
+	mt8188_afe_disable_afe_on(afe);
+
+	mt8188_afe_disable_timing_sys(afe);
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
new file mode 100644
index 000000000000..ea38767d3876
--- /dev/null
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8188-afe-clk.h  --  MediaTek 8188 afe clock ctrl definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ *         Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
+ */
+
+#ifndef _MT8188_AFE_CLK_H_
+#define _MT8188_AFE_CLK_H_
+
+enum {
+	/* xtal */
+	MT8188_CLK_XTAL_26M,
+	/* divider */
+	MT8188_CLK_TOP_APLL1,
+	MT8188_CLK_TOP_APLL2,
+	MT8188_CLK_TOP_APLL12_DIV0,
+	MT8188_CLK_TOP_APLL12_DIV1,
+	MT8188_CLK_TOP_APLL12_DIV2,
+	MT8188_CLK_TOP_APLL12_DIV3,
+	MT8188_CLK_TOP_APLL12_DIV9,
+	/* mux */
+	MT8188_CLK_TOP_A1SYS_HP_SEL,
+	MT8188_CLK_TOP_AUD_INTBUS_SEL,
+	MT8188_CLK_TOP_AUDIO_H_SEL,
+	MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL,
+	MT8188_CLK_TOP_DPTX_M_SEL,
+	MT8188_CLK_TOP_I2SO1_M_SEL,
+	MT8188_CLK_TOP_I2SO2_M_SEL,
+	MT8188_CLK_TOP_I2SI1_M_SEL,
+	MT8188_CLK_TOP_I2SI2_M_SEL,
+	/* clock gate */
+	MT8188_CLK_ADSP_AUDIO_26M,
+	MT8188_CLK_AUD_AFE,
+	MT8188_CLK_AUD_APLL1_TUNER,
+	MT8188_CLK_AUD_APLL2_TUNER,
+	MT8188_CLK_AUD_TOP0_SPDF,
+	MT8188_CLK_AUD_APLL,
+	MT8188_CLK_AUD_APLL2,
+	MT8188_CLK_AUD_DAC,
+	MT8188_CLK_AUD_ADC,
+	MT8188_CLK_AUD_DAC_HIRES,
+	MT8188_CLK_AUD_A1SYS_HP,
+	MT8188_CLK_AUD_ADC_HIRES,
+	MT8188_CLK_AUD_I2SIN,
+	MT8188_CLK_AUD_TDM_IN,
+	MT8188_CLK_AUD_I2S_OUT,
+	MT8188_CLK_AUD_TDM_OUT,
+	MT8188_CLK_AUD_HDMI_OUT,
+	MT8188_CLK_AUD_ASRC11,
+	MT8188_CLK_AUD_ASRC12,
+	MT8188_CLK_AUD_A1SYS,
+	MT8188_CLK_AUD_A2SYS,
+	MT8188_CLK_AUD_PCMIF,
+	MT8188_CLK_AUD_MEMIF_UL1,
+	MT8188_CLK_AUD_MEMIF_UL2,
+	MT8188_CLK_AUD_MEMIF_UL3,
+	MT8188_CLK_AUD_MEMIF_UL4,
+	MT8188_CLK_AUD_MEMIF_UL5,
+	MT8188_CLK_AUD_MEMIF_UL6,
+	MT8188_CLK_AUD_MEMIF_UL8,
+	MT8188_CLK_AUD_MEMIF_UL9,
+	MT8188_CLK_AUD_MEMIF_UL10,
+	MT8188_CLK_AUD_MEMIF_DL2,
+	MT8188_CLK_AUD_MEMIF_DL3,
+	MT8188_CLK_AUD_MEMIF_DL6,
+	MT8188_CLK_AUD_MEMIF_DL7,
+	MT8188_CLK_AUD_MEMIF_DL8,
+	MT8188_CLK_AUD_MEMIF_DL10,
+	MT8188_CLK_AUD_MEMIF_DL11,
+	MT8188_CLK_NUM,
+};
+
+enum {
+	MT8188_AUD_PLL1,
+	MT8188_AUD_PLL2,
+	MT8188_AUD_PLL3,
+	MT8188_AUD_PLL4,
+	MT8188_AUD_PLL5,
+	MT8188_AUD_PLL_NUM,
+};
+
+enum {
+	MT8188_MCK_SEL_26M,
+	MT8188_MCK_SEL_APLL1,
+	MT8188_MCK_SEL_APLL2,
+	MT8188_MCK_SEL_APLL3,
+	MT8188_MCK_SEL_APLL4,
+	MT8188_MCK_SEL_APLL5,
+	MT8188_MCK_SEL_NUM,
+};
+
+struct mtk_base_afe;
+
+int mt8188_afe_get_mclk_source_clk_id(int sel);
+int mt8188_afe_get_mclk_source_rate(struct mtk_base_afe *afe, int apll);
+int mt8188_afe_get_default_mclk_source_by_rate(int rate);
+int mt8188_afe_init_clock(struct mtk_base_afe *afe);
+void mt8188_afe_deinit_clock(void *priv);
+int mt8188_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
+void mt8188_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
+int mt8188_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+			    unsigned int rate);
+int mt8188_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+			      struct clk *parent);
+int mt8188_afe_enable_main_clock(struct mtk_base_afe *afe);
+int mt8188_afe_disable_main_clock(struct mtk_base_afe *afe);
+int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe);
+int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe);
+
+#endif
-- 
2.18.0


