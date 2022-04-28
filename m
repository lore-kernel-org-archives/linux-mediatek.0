Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E4CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ky4L58z73ziBEI6uojZnt/7lMPVIhoJ598SUdvgXuqE=; b=QZGhT0El9uPwOt
	Q+0+88HyVqPoaunHDh8j30Y/8EMnOw9isQnzQm+RVNREqMX3U+rp2oTU3e5/x+pJJC+YsuTpEtgrL
	J8qk2rCWHKhCDvtybH9eCqnALtC0vgvsQnK/+mQhm4G/J8X/Ri3enDAoBKxTlNRlgMLonqgltAnRO
	eZOJOcSaBKAFQSpTOEtdc5zCfsD6NG2cZE68N8cUQCY021wu3K2oXMlc+18rEih3dVw+FgXH8hV8q
	nEnUL/VD6vAr4QxodcNVxh210ooxyuGjoAPOwfag5mR3oPiuFGM9k9wMsIW3ZXtlsBp2TmK7OAj3w
	bWy8VncAfVnyWfVFShmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0fQ-005nxe-Pf; Thu, 28 Apr 2022 09:42:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0fN-005nuW-Px; Thu, 28 Apr 2022 09:42:31 +0000
X-UUID: d4e668127bba4f1491e301a95789eb10-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ec7f16fc-efa7-454e-af86-8d3eab5b23fe, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:69b2d0c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d4e668127bba4f1491e301a95789eb10-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 503624232; Thu, 28 Apr 2022 02:42:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 02:34:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 28 Apr 2022 17:33:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 17:33:59 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <julianbraha@gmail.com>,
 <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [v4 03/18] ASoC: mediatek: mt8186: support audsys clock control
Date: Thu, 28 Apr 2022 17:33:40 +0800
Message-ID: <20220428093355.16172-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_024229_904021_20D45863 
X-CRM114-Status: GOOD (  15.79  )
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

Add mt8186 audio cg control. Audio clock gates are registered to
CCF for reference count and clock parent management.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c | 150 ++++++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |  15 ++
 .../soc/mediatek/mt8186/mt8186-audsys-clkid.h |  45 ++++++
 3 files changed, 210 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h

diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
new file mode 100644
index 000000000000..578969ca91c8
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8186-audsys-clk.h  --  Mediatek 8186 audsys clock control
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include "mt8186-afe-common.h"
+#include "mt8186-audsys-clk.h"
+#include "mt8186-audsys-clkid.h"
+#include "mt8186-reg.h"
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
+#define GATE_AUD2(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON2, _bit)
+
+static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
+	/* AUD0 */
+	GATE_AUD0(CLK_AUD_AFE, "aud_afe_clk", "top_audio", 2),
+	GATE_AUD0(CLK_AUD_22M, "aud_apll22m_clk", "top_aud_engen1", 8),
+	GATE_AUD0(CLK_AUD_24M, "aud_apll24m_clk", "top_aud_engen2", 9),
+	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner_clk", "top_aud_engen2", 18),
+	GATE_AUD0(CLK_AUD_APLL_TUNER, "aud_apll_tuner_clk", "top_aud_engen1", 19),
+	GATE_AUD0(CLK_AUD_TDM, "aud_tdm_clk", "top_aud_1", 20),
+	GATE_AUD0(CLK_AUD_ADC, "aud_adc_clk", "top_audio", 24),
+	GATE_AUD0(CLK_AUD_DAC, "aud_dac_clk", "top_audio", 25),
+	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis_clk", "top_audio", 26),
+	GATE_AUD0(CLK_AUD_TML, "aud_tml_clk", "top_audio", 27),
+	GATE_AUD0(CLK_AUD_NLE, "aud_nle_clk", "top_audio", 28),
+
+	/* AUD1 */
+	GATE_AUD1(CLK_AUD_I2S1_BCLK, "aud_i2s1_bclk", "top_audio", 4),
+	GATE_AUD1(CLK_AUD_I2S2_BCLK, "aud_i2s2_bclk", "top_audio", 5),
+	GATE_AUD1(CLK_AUD_I2S3_BCLK, "aud_i2s3_bclk", "top_audio", 6),
+	GATE_AUD1(CLK_AUD_I2S4_BCLK, "aud_i2s4_bclk", "top_audio", 7),
+	GATE_AUD1(CLK_AUD_CONNSYS_I2S_ASRC, "aud_connsys_i2s_asrc", "top_audio", 12),
+	GATE_AUD1(CLK_AUD_GENERAL1_ASRC, "aud_general1_asrc", "top_audio", 13),
+	GATE_AUD1(CLK_AUD_GENERAL2_ASRC, "aud_general2_asrc", "top_audio", 14),
+	GATE_AUD1(CLK_AUD_DAC_HIRES, "aud_dac_hires_clk", "top_audio_h", 15),
+	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires_clk", "top_audio_h", 16),
+	GATE_AUD1(CLK_AUD_ADC_HIRES_TML, "aud_adc_hires_tml", "top_audio_h", 17),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "top_audio", 20),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "top_audio_h", 21),
+	GATE_AUD1(CLK_AUD_3RD_DAC, "aud_3rd_dac", "top_audio", 28),
+	GATE_AUD1(CLK_AUD_3RD_DAC_PREDIS, "aud_3rd_dac_predis", "top_audio", 29),
+	GATE_AUD1(CLK_AUD_3RD_DAC_TML, "aud_3rd_dac_tml", "top_audio", 30),
+	GATE_AUD1(CLK_AUD_3RD_DAC_HIRES, "aud_3rd_dac_hires", "top_audio_h", 31),
+
+	/* AUD2 */
+	GATE_AUD2(CLK_AUD_ETDM_IN1_BCLK, "aud_etdm_in1_bclk", "top_audio", 23),
+	GATE_AUD2(CLK_AUD_ETDM_OUT1_BCLK, "aud_etdm_out1_bclk", "top_audio", 24),
+};
+
+int mt8186_audsys_clk_register(struct mtk_base_afe *afe)
+{
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
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
+		clkdev_add(cl);
+
+		afe_priv->lookup[i] = cl;
+	}
+
+	return 0;
+}
+
+void mt8186_audsys_clk_unregister(struct mtk_base_afe *afe)
+{
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
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
diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
new file mode 100644
index 000000000000..b8d6a06e11e8
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * mt8186-audsys-clk.h  --  Mediatek 8186 audsys clock definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT8186_AUDSYS_CLK_H_
+#define _MT8186_AUDSYS_CLK_H_
+
+int mt8186_audsys_clk_register(struct mtk_base_afe *afe);
+void mt8186_audsys_clk_unregister(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h b/sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h
new file mode 100644
index 000000000000..3ce5937c1823
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * mt8186-audsys-clkid.h  --  Mediatek 8186 audsys clock id definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+ */
+
+#ifndef _MT8186_AUDSYS_CLKID_H_
+#define _MT8186_AUDSYS_CLKID_H_
+
+enum{
+	CLK_AUD_AFE,
+	CLK_AUD_22M,
+	CLK_AUD_24M,
+	CLK_AUD_APLL2_TUNER,
+	CLK_AUD_APLL_TUNER,
+	CLK_AUD_TDM,
+	CLK_AUD_ADC,
+	CLK_AUD_DAC,
+	CLK_AUD_DAC_PREDIS,
+	CLK_AUD_TML,
+	CLK_AUD_NLE,
+	CLK_AUD_I2S1_BCLK,
+	CLK_AUD_I2S2_BCLK,
+	CLK_AUD_I2S3_BCLK,
+	CLK_AUD_I2S4_BCLK,
+	CLK_AUD_CONNSYS_I2S_ASRC,
+	CLK_AUD_GENERAL1_ASRC,
+	CLK_AUD_GENERAL2_ASRC,
+	CLK_AUD_DAC_HIRES,
+	CLK_AUD_ADC_HIRES,
+	CLK_AUD_ADC_HIRES_TML,
+	CLK_AUD_ADDA6_ADC,
+	CLK_AUD_ADDA6_ADC_HIRES,
+	CLK_AUD_3RD_DAC,
+	CLK_AUD_3RD_DAC_PREDIS,
+	CLK_AUD_3RD_DAC_TML,
+	CLK_AUD_3RD_DAC_HIRES,
+	CLK_AUD_ETDM_IN1_BCLK,
+	CLK_AUD_ETDM_OUT1_BCLK,
+	CLK_AUD_NR_CLK,
+};
+
+#endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
