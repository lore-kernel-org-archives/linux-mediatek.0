Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FBDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=udYlmaWQWMXXWK9el9CP9zwL1GF8JHhi9YGSYOksmjI=; b=vurzUOyITHoPJE
	pjSn40rjaCE+GhFkoFKdFgb9KS+RiCqu4BlIw27IHbNGuXW+tNAXcik4TiCU/4UrjRRGFpDrRss9Q
	bdJKUZ2FS5MfV92XK8AWxLsnukEmHCjjBDZbbgw284wdopl6FIHf6gwp+ArTNJqOQZVSvKIIZo/3u
	KBi9UESHVJ019jHS3QATzGmqtKGP8FfjryImaQ88PGu69FQZWO9gSHlhHOWymGyXQk1NpTXflhGoF
	HZKLQpOMj8G4H3YSjfF+lrUnN0qZkYvUnU7L+6NIy7mVvxf3A5HOl8wNPYX5Fa7IuDbFAaFWU9aM8
	0Go/fVRDIjMSpPPDJB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM1hd-003YxC-0o; Mon, 21 Feb 2022 05:57:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM1hP-003YuO-BU; Mon, 21 Feb 2022 05:57:30 +0000
X-UUID: ba890080f91b4158bb68db14aa5db201-20220220
X-UUID: ba890080f91b4158bb68db14aa5db201-20220220
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 488485619; Sun, 20 Feb 2022 22:57:22 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 21:57:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 13:57:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Feb 2022 13:57:19 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <bicycle.tsai@mediatek.com>,
 <yc.hung@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8195: enable apll tuner
Date: Mon, 21 Feb 2022 13:57:16 +0800
Message-ID: <20220221055716.18580-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_215727_430192_A6C99415 
X-CRM114-Status: GOOD (  18.30  )
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

Normally, the clock source of audio module is either 26M or APLL1/APLL2,
but APLL1/APLL2 are not the multiple of 26M.

In the patch, APLL1 and APLL2 tuners are enabled to handle sample rate
mismatch when the data path crosses two different clock domains.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 282 ++++++++++++++++++++-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h |  11 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |   3 -
 3 files changed, 292 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index c2543f4cffb7..efd5cc364a35 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -40,6 +40,8 @@ static const char *aud_clks[MT8195_CLK_NUM] = {
 	[MT8195_CLK_SCP_ADSP_AUDIODSP] = "scp_adsp_audiodsp",
 	/* afe clock gate */
 	[MT8195_CLK_AUD_AFE] = "aud_afe",
+	[MT8195_CLK_AUD_APLL1_TUNER] = "aud_apll1_tuner",
+	[MT8195_CLK_AUD_APLL2_TUNER] = "aud_apll2_tuner",
 	[MT8195_CLK_AUD_APLL] = "aud_apll",
 	[MT8195_CLK_AUD_APLL2] = "aud_apll2",
 	[MT8195_CLK_AUD_DAC] = "aud_dac",
@@ -77,6 +79,268 @@ static const char *aud_clks[MT8195_CLK_NUM] = {
 	[MT8195_CLK_AUD_MEMIF_DL11] = "aud_memif_dl11",
 };
 
+struct mt8195_afe_tuner_cfg {
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
+static struct mt8195_afe_tuner_cfg mt8195_afe_tuner_cfgs[MT8195_AUD_PLL_NUM] = {
+	[MT8195_AUD_PLL1] = {
+		.id = MT8195_AUD_PLL1,
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
+		.upper_bound_default = 0x2,
+	},
+	[MT8195_AUD_PLL2] = {
+		.id = MT8195_AUD_PLL2,
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
+		.upper_bound_default = 0x2,
+	},
+	[MT8195_AUD_PLL3] = {
+		.id = MT8195_AUD_PLL3,
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
+	[MT8195_AUD_PLL4] = {
+		.id = MT8195_AUD_PLL4,
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
+	[MT8195_AUD_PLL5] = {
+		.id = MT8195_AUD_PLL5,
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
+static struct mt8195_afe_tuner_cfg *mt8195_afe_found_apll_tuner(unsigned int id)
+{
+	if (id >= MT8195_AUD_PLL_NUM)
+		return NULL;
+
+	return &mt8195_afe_tuner_cfgs[id];
+}
+
+static int mt8195_afe_init_apll_tuner(unsigned int id)
+{
+	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
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
+static int mt8195_afe_setup_apll_tuner(struct mtk_base_afe *afe,
+				       unsigned int id)
+{
+	const struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
+
+	if (!cfg)
+		return -EINVAL;
+
+	regmap_update_bits(afe->regmap, cfg->apll_div_reg,
+			   cfg->apll_div_maskbit << cfg->apll_div_shift,
+			   cfg->apll_div_default << cfg->apll_div_shift);
+
+	regmap_update_bits(afe->regmap, cfg->ref_ck_sel_reg,
+			   cfg->ref_ck_sel_maskbit << cfg->ref_ck_sel_shift,
+			   cfg->ref_ck_sel_default << cfg->ref_ck_sel_shift);
+
+	regmap_update_bits(afe->regmap, cfg->upper_bound_reg,
+			   cfg->upper_bound_maskbit << cfg->upper_bound_shift,
+			   cfg->upper_bound_default << cfg->upper_bound_shift);
+
+	return 0;
+}
+
+static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
+				       unsigned int id)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	switch (id) {
+	case MT8195_AUD_PLL1:
+		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		break;
+	case MT8195_AUD_PLL2:
+		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
+					unsigned int id)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	switch (id) {
+	case MT8195_AUD_PLL1:
+		mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		break;
+	case MT8195_AUD_PLL2:
+		mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
+					unsigned int id)
+{
+	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
+	unsigned long flags;
+	int ret = 0;
+
+	if (!cfg)
+		return -EINVAL;
+
+	ret = mt8195_afe_setup_apll_tuner(afe, id);
+	if (ret)
+		return ret;
+
+	ret = mt8195_afe_enable_tuner_clk(afe, id);
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
+				   1 << cfg->tuner_en_shift);
+
+	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+
+	return ret;
+}
+
+static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
+					 unsigned int id)
+{
+	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
+	unsigned long flags;
+	int ret = 0;
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
+	ret = mt8195_afe_disable_tuner_clk(afe, id);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 int mt8195_afe_get_mclk_source_clk_id(int sel)
 {
 	switch (sel) {
@@ -113,7 +377,7 @@ int mt8195_afe_get_default_mclk_source_by_rate(int rate)
 int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 
 	mt8195_audsys_clk_register(afe);
 
@@ -133,6 +397,16 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 		}
 	}
 
+	/* initial tuner */
+	for (i = 0; i < MT8195_AUD_PLL_NUM; i++) {
+		ret = mt8195_afe_init_apll_tuner(i);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), init apll_tuner%d failed",
+				__func__, (i + 1));
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
@@ -428,11 +702,17 @@ int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 
 	mt8195_afe_enable_afe_on(afe);
 
+	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL1);
+	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL2);
+
 	return 0;
 }
 
 int mt8195_afe_disable_main_clock(struct mtk_base_afe *afe)
 {
+	mt8195_afe_disable_apll_tuner(afe, MT8195_AUD_PLL2);
+	mt8195_afe_disable_apll_tuner(afe, MT8195_AUD_PLL1);
+
 	mt8195_afe_disable_afe_on(afe);
 
 	mt8195_afe_disable_timing_sys(afe);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
index f8e6eeb29a89..40663e31becd 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
@@ -35,6 +35,8 @@ enum {
 	MT8195_CLK_INFRA_AO_AUDIO_26M_B,
 	MT8195_CLK_SCP_ADSP_AUDIODSP,
 	MT8195_CLK_AUD_AFE,
+	MT8195_CLK_AUD_APLL1_TUNER,
+	MT8195_CLK_AUD_APLL2_TUNER,
 	MT8195_CLK_AUD_APLL,
 	MT8195_CLK_AUD_APLL2,
 	MT8195_CLK_AUD_DAC,
@@ -84,6 +86,15 @@ enum {
 	MT8195_MCK_SEL_NUM,
 };
 
+enum {
+	MT8195_AUD_PLL1,
+	MT8195_AUD_PLL2,
+	MT8195_AUD_PLL3,
+	MT8195_AUD_PLL4,
+	MT8195_AUD_PLL5,
+	MT8195_AUD_PLL_NUM,
+};
+
 struct mtk_base_afe;
 
 int mt8195_afe_get_mclk_source_clk_id(int sel);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index e425f868476a..b77c2ba5a629 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2583,8 +2583,6 @@ static bool mt8195_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_IRQ3_CON_MON:
 	case AFE_IRQ_MCU_MON2:
 	case ADSP_IRQ_STATUS:
-	case AFE_APLL_TUNER_CFG:
-	case AFE_APLL_TUNER_CFG1:
 	case AUDIO_TOP_STA0:
 	case AUDIO_TOP_STA1:
 	case AFE_GAIN1_CUR:
@@ -2623,7 +2621,6 @@ static bool mt8195_is_volatile_reg(struct device *dev, unsigned int reg)
 	case SPDIFIN_USERCODE10:
 	case SPDIFIN_USERCODE11:
 	case SPDIFIN_USERCODE12:
-	case AFE_SPDIFIN_APLL_TUNER_CFG:
 	case AFE_LINEIN_APLL_TUNER_MON:
 	case AFE_EARC_APLL_TUNER_MON:
 	case AFE_CM0_MON:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
