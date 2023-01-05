Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3096C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 19:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ47V1Nxsm5xIBY7uDVQ+veI3ngl2d6KM73Bju0xkiQ=; b=wkHpsKp8eXwOOHd7odRaMn797G
	oSbcPWmqsjpTFZg9RAHSiLvZCAlDg9yQQ1unp7uBxInKoWAOVBZfVgSrcC9NzThpNd5Ho/tJNCqaR
	LOCVHW1xg0zzKgJp1jlVwMWp0mHlFj45hweyvpvxLEKpvFA04EtvMDUTjZkqwmKlLb3ElWwJ+zQRe
	DxHjFSOn7fe3aFIkBDpof/iv6TZQ/yDd8piX278yUVwcy27Fn0/AeV5sD40mrHfuR9GDSIos3wbKE
	iGPkO0Ke/4JshWPwNYU5Qn4XbaP4Uli/OnppyUDGCeVd2A4KLgaHaf6bMKo9dH87E5hPIisrjbRBf
	MccFZIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVpt-00E5Lw-1f; Thu, 05 Jan 2023 19:23:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDLQv-008T6d-32; Thu, 05 Jan 2023 08:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hZ47V1Nxsm5xIBY7uDVQ+veI3ngl2d6KM73Bju0xkiQ=; b=X329i/pD9vwF8ixREVvE6huii9
	sle2zDjjJYQbj6sfIVZuSusA41wTF4Jr2wFrbd0cV3+C9fJIEYWhhdMs2mtugbP00FsyDT0Lv+J3x
	cgz6Zgy0FdCWoRiYWTE+HkGF0h1OSMBggl7WpG1eVmeHqaVFL7U+CHHXIzpx1yGp+KMjjAomb8SbS
	vrKKAQuxIgmDKGfVhDXhFemWlQQY3rikfirLp5w00BD2cjP712tSDsKhpXNYaU7coW+7iXJj9QLqs
	sBoaPALteqSYJ0LocVhLPLsMHqHkYOcUuvmscsRbIra6hl+QK94ABJfm8rrpSLJvAyenfQ+1OVMp0
	NrtTPibA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDLQd-001FdJ-20;
	Thu, 05 Jan 2023 08:16:51 +0000
X-UUID: 37bbdd34264149c5ad43480eb33e65bd-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hZ47V1Nxsm5xIBY7uDVQ+veI3ngl2d6KM73Bju0xkiQ=;
	b=E1Kc9Pdvz0JUq7zQ+3ARf8JS0BEPJ41iZxDKTRU92KEnkZRrwM1eUxkNHfPlFt1qaYN6TX8Th6gWdKYgWGrT4ad1qxh8S3LDcH6HD+kA76Jb46RAKK31YZO22Qfh3JKQTgBVQJY7Os1zycRwKsJn5/XXNYIZZIvUITLUYA5h4y8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f4274f29-870e-4fd0-aafa-c71b0fd7674d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:a617548b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 37bbdd34264149c5ad43480eb33e65bd-20230105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1985845500; Thu, 05 Jan 2023 01:16:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 5 Jan 2023 16:16:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 16:16:14 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v5 03/13] ASoC: mediatek: mt8188: support audsys clock
Date: Thu, 5 Jan 2023 16:15:56 +0800
Message-ID: <20230105081606.6582-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230105081606.6582-1-trevor.wu@mediatek.com>
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_081648_606006_C79CBD0A 
X-CRM114-Status: GOOD (  17.19  )
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

Add mt8188 audio cg clock control. Audio clock gates are registered to CCF
for reference count and clock parent management.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 205 ++++++++++++++++++
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |  15 ++
 .../soc/mediatek/mt8188/mt8188-audsys-clkid.h |  83 +++++++
 3 files changed, 303 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h

diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
new file mode 100644
index 000000000000..be1c53bf4729
--- /dev/null
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt8188-audsys-clk.c  --  MediaTek 8188 audsys clock control
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include "mt8188-afe-common.h"
+#include "mt8188-audsys-clk.h"
+#include "mt8188-audsys-clkid.h"
+#include "mt8188-reg.h"
+
+struct afe_gate {
+	int id;
+	const char *name;
+	const char *parent_name;
+	int reg;
+	u8 bit;
+	const struct clk_ops *ops;
+	unsigned long flags;
+	u8 cg_flags;
+};
+
+#define GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit, _flags, _cgflags) {\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _parent,				\
+		.reg = _reg,					\
+		.bit = _bit,					\
+		.flags = _flags,				\
+		.cg_flags = _cgflags,				\
+	}
+
+#define GATE_AFE(_id, _name, _parent, _reg, _bit)		\
+	GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit,		\
+		       CLK_SET_RATE_PARENT, CLK_GATE_SET_TO_DISABLE)
+
+#define GATE_AUD0(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON0, _bit)
+
+#define GATE_AUD1(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON1, _bit)
+
+#define GATE_AUD3(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON3, _bit)
+
+#define GATE_AUD4(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON4, _bit)
+
+#define GATE_AUD5(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON5, _bit)
+
+#define GATE_AUD6(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON6, _bit)
+
+static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
+	/* AUD0 */
+	GATE_AUD0(CLK_AUD_AFE, "aud_afe", "top_a1sys_hp", 2),
+	GATE_AUD0(CLK_AUD_LRCK_CNT, "aud_lrck_cnt", "top_a1sys_hp", 4),
+	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_APLL, "aud_spdifin_tuner_apll", "top_apll4", 10),
+	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_DBG, "aud_spdifin_tuner_dbg", "top_apll4", 11),
+	GATE_AUD0(CLK_AUD_UL_TML, "aud_ul_tml", "top_a1sys_hp", 18),
+	GATE_AUD0(CLK_AUD_APLL1_TUNER, "aud_apll1_tuner", "top_apll1", 19),
+	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "top_apll2", 20),
+	GATE_AUD0(CLK_AUD_TOP0_SPDF, "aud_top0_spdf", "top_aud_iec_clk", 21),
+	GATE_AUD0(CLK_AUD_APLL, "aud_apll", "top_apll1", 23),
+	GATE_AUD0(CLK_AUD_APLL2, "aud_apll2", "top_apll2", 24),
+	GATE_AUD0(CLK_AUD_DAC, "aud_dac", "top_a1sys_hp", 25),
+	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "top_a1sys_hp", 26),
+	GATE_AUD0(CLK_AUD_TML, "aud_tml", "top_a1sys_hp", 27),
+	GATE_AUD0(CLK_AUD_ADC, "aud_adc", "top_a1sys_hp", 28),
+	GATE_AUD0(CLK_AUD_DAC_HIRES, "aud_dac_hires", "top_audio_h", 31),
+
+	/* AUD1 */
+	GATE_AUD1(CLK_AUD_A1SYS_HP, "aud_a1sys_hp", "top_a1sys_hp", 2),
+	GATE_AUD1(CLK_AUD_AFE_DMIC1, "aud_afe_dmic1", "top_a1sys_hp", 10),
+	GATE_AUD1(CLK_AUD_AFE_DMIC2, "aud_afe_dmic2", "top_a1sys_hp", 11),
+	GATE_AUD1(CLK_AUD_AFE_DMIC3, "aud_afe_dmic3", "top_a1sys_hp", 12),
+	GATE_AUD1(CLK_AUD_AFE_DMIC4, "aud_afe_dmic4", "top_a1sys_hp", 13),
+	GATE_AUD1(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "top_a1sys_hp", 14),
+	GATE_AUD1(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "top_audio_h", 16),
+	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "top_audio_h", 17),
+
+	/* AUD3 */
+	GATE_AUD3(CLK_AUD_LINEIN_TUNER, "aud_linein_tuner", "top_apll5", 5),
+	GATE_AUD3(CLK_AUD_EARC_TUNER, "aud_earc_tuner", "top_apll3", 7),
+
+	/* AUD4 */
+	GATE_AUD4(CLK_AUD_I2SIN, "aud_i2sin", "top_a1sys_hp", 0),
+	GATE_AUD4(CLK_AUD_TDM_IN, "aud_tdm_in", "top_a1sys_hp", 1),
+	GATE_AUD4(CLK_AUD_I2S_OUT, "aud_i2s_out", "top_a1sys_hp", 6),
+	GATE_AUD4(CLK_AUD_TDM_OUT, "aud_tdm_out", "top_a1sys_hp", 7),
+	GATE_AUD4(CLK_AUD_HDMI_OUT, "aud_hdmi_out", "top_a1sys_hp", 8),
+	GATE_AUD4(CLK_AUD_ASRC11, "aud_asrc11", "top_a1sys_hp", 16),
+	GATE_AUD4(CLK_AUD_ASRC12, "aud_asrc12", "top_a1sys_hp", 17),
+	GATE_AUD4(CLK_AUD_MULTI_IN, "aud_multi_in", "mphone_slave_b", 19),
+	GATE_AUD4(CLK_AUD_INTDIR, "aud_intdir", "top_intdir", 20),
+	GATE_AUD4(CLK_AUD_A1SYS, "aud_a1sys", "top_a1sys_hp", 21),
+	GATE_AUD4(CLK_AUD_A2SYS, "aud_a2sys", "top_a2sys", 22),
+	GATE_AUD4(CLK_AUD_PCMIF, "aud_pcmif", "top_a1sys_hp", 24),
+	GATE_AUD4(CLK_AUD_A3SYS, "aud_a3sys", "top_a3sys", 30),
+	GATE_AUD4(CLK_AUD_A4SYS, "aud_a4sys", "top_a4sys", 31),
+
+	/* AUD5 */
+	GATE_AUD5(CLK_AUD_MEMIF_UL1, "aud_memif_ul1", "top_a1sys_hp", 0),
+	GATE_AUD5(CLK_AUD_MEMIF_UL2, "aud_memif_ul2", "top_a1sys_hp", 1),
+	GATE_AUD5(CLK_AUD_MEMIF_UL3, "aud_memif_ul3", "top_a1sys_hp", 2),
+	GATE_AUD5(CLK_AUD_MEMIF_UL4, "aud_memif_ul4", "top_a1sys_hp", 3),
+	GATE_AUD5(CLK_AUD_MEMIF_UL5, "aud_memif_ul5", "top_a1sys_hp", 4),
+	GATE_AUD5(CLK_AUD_MEMIF_UL6, "aud_memif_ul6", "top_a1sys_hp", 5),
+	GATE_AUD5(CLK_AUD_MEMIF_UL8, "aud_memif_ul8", "top_a1sys_hp", 7),
+	GATE_AUD5(CLK_AUD_MEMIF_UL9, "aud_memif_ul9", "top_a1sys_hp", 8),
+	GATE_AUD5(CLK_AUD_MEMIF_UL10, "aud_memif_ul10", "top_a1sys_hp", 9),
+	GATE_AUD5(CLK_AUD_MEMIF_DL2, "aud_memif_dl2", "top_a1sys_hp", 18),
+	GATE_AUD5(CLK_AUD_MEMIF_DL3, "aud_memif_dl3", "top_a1sys_hp", 19),
+	GATE_AUD5(CLK_AUD_MEMIF_DL6, "aud_memif_dl6", "top_a1sys_hp", 22),
+	GATE_AUD5(CLK_AUD_MEMIF_DL7, "aud_memif_dl7", "top_a1sys_hp", 23),
+	GATE_AUD5(CLK_AUD_MEMIF_DL8, "aud_memif_dl8", "top_a1sys_hp", 24),
+	GATE_AUD5(CLK_AUD_MEMIF_DL10, "aud_memif_dl10", "top_a1sys_hp", 26),
+	GATE_AUD5(CLK_AUD_MEMIF_DL11, "aud_memif_dl11", "top_a1sys_hp", 27),
+
+	/* AUD6 */
+	GATE_AUD6(CLK_AUD_GASRC0, "aud_gasrc0", "top_asm_h", 0),
+	GATE_AUD6(CLK_AUD_GASRC1, "aud_gasrc1", "top_asm_h", 1),
+	GATE_AUD6(CLK_AUD_GASRC2, "aud_gasrc2", "top_asm_h", 2),
+	GATE_AUD6(CLK_AUD_GASRC3, "aud_gasrc3", "top_asm_h", 3),
+	GATE_AUD6(CLK_AUD_GASRC4, "aud_gasrc4", "top_asm_h", 4),
+	GATE_AUD6(CLK_AUD_GASRC5, "aud_gasrc5", "top_asm_h", 5),
+	GATE_AUD6(CLK_AUD_GASRC6, "aud_gasrc6", "top_asm_h", 6),
+	GATE_AUD6(CLK_AUD_GASRC7, "aud_gasrc7", "top_asm_h", 7),
+	GATE_AUD6(CLK_AUD_GASRC8, "aud_gasrc8", "top_asm_h", 8),
+	GATE_AUD6(CLK_AUD_GASRC9, "aud_gasrc9", "top_asm_h", 9),
+	GATE_AUD6(CLK_AUD_GASRC10, "aud_gasrc10", "top_asm_h", 10),
+	GATE_AUD6(CLK_AUD_GASRC11, "aud_gasrc11", "top_asm_h", 11),
+};
+
+int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int i;
+
+	afe_priv->lookup = devm_kcalloc(afe->dev, CLK_AUD_NR_CLK,
+					sizeof(*afe_priv->lookup),
+					GFP_KERNEL);
+
+	if (!afe_priv->lookup)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
+		const struct afe_gate *gate = &aud_clks[i];
+
+		clk = clk_register_gate(afe->dev, gate->name, gate->parent_name,
+					gate->flags, afe->base_addr + gate->reg,
+					gate->bit, gate->cg_flags, NULL);
+
+		if (IS_ERR(clk)) {
+			dev_err(afe->dev, "Failed to register clk %s: %ld\n",
+				gate->name, PTR_ERR(clk));
+			continue;
+		}
+
+		/* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUPPLY) */
+		cl = kzalloc(sizeof(*cl), GFP_KERNEL);
+		if (!cl)
+			return -ENOMEM;
+
+		cl->clk = clk;
+		cl->con_id = gate->name;
+		cl->dev_id = dev_name(afe->dev);
+		cl->clk_hw = NULL;
+		clkdev_add(cl);
+
+		afe_priv->lookup[i] = cl;
+	}
+
+	return 0;
+}
+
+void mt8188_audsys_clk_unregister(struct mtk_base_afe *afe)
+{
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int i;
+
+	if (!afe_priv)
+		return;
+
+	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
+		cl = afe_priv->lookup[i];
+		if (!cl)
+			continue;
+
+		clk = cl->clk;
+		clk_unregister_gate(clk);
+
+		clkdev_drop(cl);
+	}
+}
diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
new file mode 100644
index 000000000000..6c5f463ad7e4
--- /dev/null
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8188-audsys-clk.h  --  MediaTek 8188 audsys clock definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
+ */
+
+#ifndef _MT8188_AUDSYS_CLK_H_
+#define _MT8188_AUDSYS_CLK_H_
+
+int mt8188_audsys_clk_register(struct mtk_base_afe *afe);
+void mt8188_audsys_clk_unregister(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
new file mode 100644
index 000000000000..6f34ffc760e0
--- /dev/null
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clkid.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8188-audsys-clkid.h  --  MediaTek 8188 audsys clock id definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
+ */
+
+#ifndef _MT8188_AUDSYS_CLKID_H_
+#define _MT8188_AUDSYS_CLKID_H_
+
+enum{
+	CLK_AUD_AFE,
+	CLK_AUD_LRCK_CNT,
+	CLK_AUD_SPDIFIN_TUNER_APLL,
+	CLK_AUD_SPDIFIN_TUNER_DBG,
+	CLK_AUD_UL_TML,
+	CLK_AUD_APLL1_TUNER,
+	CLK_AUD_APLL2_TUNER,
+	CLK_AUD_TOP0_SPDF,
+	CLK_AUD_APLL,
+	CLK_AUD_APLL2,
+	CLK_AUD_DAC,
+	CLK_AUD_DAC_PREDIS,
+	CLK_AUD_TML,
+	CLK_AUD_ADC,
+	CLK_AUD_DAC_HIRES,
+	CLK_AUD_A1SYS_HP,
+	CLK_AUD_AFE_DMIC1,
+	CLK_AUD_AFE_DMIC2,
+	CLK_AUD_AFE_DMIC3,
+	CLK_AUD_AFE_DMIC4,
+	CLK_AUD_AFE_26M_DMIC_TM,
+	CLK_AUD_UL_TML_HIRES,
+	CLK_AUD_ADC_HIRES,
+	CLK_AUD_LINEIN_TUNER,
+	CLK_AUD_EARC_TUNER,
+	CLK_AUD_I2SIN,
+	CLK_AUD_TDM_IN,
+	CLK_AUD_I2S_OUT,
+	CLK_AUD_TDM_OUT,
+	CLK_AUD_HDMI_OUT,
+	CLK_AUD_ASRC11,
+	CLK_AUD_ASRC12,
+	CLK_AUD_MULTI_IN,
+	CLK_AUD_INTDIR,
+	CLK_AUD_A1SYS,
+	CLK_AUD_A2SYS,
+	CLK_AUD_PCMIF,
+	CLK_AUD_A3SYS,
+	CLK_AUD_A4SYS,
+	CLK_AUD_MEMIF_UL1,
+	CLK_AUD_MEMIF_UL2,
+	CLK_AUD_MEMIF_UL3,
+	CLK_AUD_MEMIF_UL4,
+	CLK_AUD_MEMIF_UL5,
+	CLK_AUD_MEMIF_UL6,
+	CLK_AUD_MEMIF_UL8,
+	CLK_AUD_MEMIF_UL9,
+	CLK_AUD_MEMIF_UL10,
+	CLK_AUD_MEMIF_DL2,
+	CLK_AUD_MEMIF_DL3,
+	CLK_AUD_MEMIF_DL6,
+	CLK_AUD_MEMIF_DL7,
+	CLK_AUD_MEMIF_DL8,
+	CLK_AUD_MEMIF_DL10,
+	CLK_AUD_MEMIF_DL11,
+	CLK_AUD_GASRC0,
+	CLK_AUD_GASRC1,
+	CLK_AUD_GASRC2,
+	CLK_AUD_GASRC3,
+	CLK_AUD_GASRC4,
+	CLK_AUD_GASRC5,
+	CLK_AUD_GASRC6,
+	CLK_AUD_GASRC7,
+	CLK_AUD_GASRC8,
+	CLK_AUD_GASRC9,
+	CLK_AUD_GASRC10,
+	CLK_AUD_GASRC11,
+	CLK_AUD_NR_CLK,
+};
+
+#endif
-- 
2.18.0


