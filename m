Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38100C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:46:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB54D619B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB54D619B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xbDkIGbebIPANM0Lbub6wJAvahb90OMyIY/pHpccGYw=; b=f3/imSQdlmHxKcQtcDJJ4eRGP
	8sJdU6RuhoNq1c9mNr+iAqBk9OLxe49Ut0qCkPnNnxd2l8tc5yxazqscMEf42y0f/GP9+RkMVGGjB
	gpJbXKMolE+uHqyWJm3x5TGypJOC2yS2qjuRQdEbDNf81F58vAI24vCFqQV/b+oJ/jqRw6mwsruME
	0ghemSicpGtT4tmDpHXvSMRXCw4WHxBo/VL4TVr7TC0xbOnAu7wgidRvNle2kbiFSXwPc+Nex38A+
	ls7qKgvOiV5OugBEbnu+wEtunhfj4Q0Seqegy04IXWxD7MgBx0qK/4BkVaKEZ1Z3IhUrIr7aouzp6
	PIK86avGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfU1-00EmLp-FZ; Tue, 23 Mar 2021 11:46:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfTq-00EmG4-6O; Tue, 23 Mar 2021 11:45:52 +0000
X-UUID: 692192ad17e540808740362ab17907bd-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kwVXvR2inJWiBa0f1dOWpsVT9gJ5UfM5QR1swzq8HAc=; 
 b=KPvrkZue/bTyjN/XawhNK2S2l9x4v54nDSegv3defEMMLhOH3l9Tt7Wz7yoHg2g34VMDWBGYvdfaM1aYhOAjwsTPRccAJX1IXDtMjkzjt8BoBHL5XD1EWTTPKJhE7A93WhKK/3+Sz+9aa8LxTMGo2kdsG7yfienTdV0vaORS2+s=;
X-UUID: 692192ad17e540808740362ab17907bd-20210323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1306895639; Tue, 23 Mar 2021 03:45:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 04:35:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 19:35:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Mar 2021 19:35:35 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH v7 11/22] clk: mediatek: Add MT8192 audio clock support
Date: Tue, 23 Mar 2021 19:35:01 +0800
Message-ID: <20210323113512.4980-12-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210323113512.4980-1-chun-jie.chen@mediatek.com>
References: <20210323113512.4980-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_114550_713342_68AA7846 
X-CRM114-Status: GOOD (  18.00  )
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

Add MT8192 audio clock provider

Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |   6 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8192-aud.c | 118 ++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 6075b48377d5..909f423d7c4c 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -508,6 +508,12 @@ config COMMON_CLK_MT8192
 	help
 	  This driver supports MediaTek MT8192 basic clocks.
 
+config COMMON_CLK_MT8192_AUDSYS
+	bool "Clock driver for MediaTek MT8192 audsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 audsys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index fcde42160720..1d0f2e8e9661 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -68,5 +68,6 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
+obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
new file mode 100644
index 000000000000..b38f5a5ab57c
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs aud0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs aud1_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x4,
+};
+
+static const struct mtk_gate_regs aud2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_AUD0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &aud0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &aud1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &aud2_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+static const struct mtk_gate aud_clks[] = {
+	/* AUD0 */
+	GATE_AUD0(CLK_AUD_AFE, "aud_afe", "audio_sel", 2),
+	GATE_AUD0(CLK_AUD_22M, "aud_22m", "aud_engen1_sel", 8),
+	GATE_AUD0(CLK_AUD_24M, "aud_24m", "aud_engen2_sel", 9),
+	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "aud_engen2_sel", 18),
+	GATE_AUD0(CLK_AUD_APLL_TUNER, "aud_apll_tuner", "aud_engen1_sel", 19),
+	GATE_AUD0(CLK_AUD_TDM, "aud_tdm", "aud_1_sel", 20),
+	GATE_AUD0(CLK_AUD_ADC, "aud_adc", "audio_sel", 24),
+	GATE_AUD0(CLK_AUD_DAC, "aud_dac", "audio_sel", 25),
+	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "audio_sel", 26),
+	GATE_AUD0(CLK_AUD_TML, "aud_tml", "audio_sel", 27),
+	GATE_AUD0(CLK_AUD_NLE, "aud_nle", "audio_sel", 28),
+	/* AUD1 */
+	GATE_AUD1(CLK_AUD_I2S1_B, "aud_i2s1_b", "audio_sel", 4),
+	GATE_AUD1(CLK_AUD_I2S2_B, "aud_i2s2_b", "audio_sel", 5),
+	GATE_AUD1(CLK_AUD_I2S3_B, "aud_i2s3_b", "audio_sel", 6),
+	GATE_AUD1(CLK_AUD_I2S4_B, "aud_i2s4_b", "audio_sel", 7),
+	GATE_AUD1(CLK_AUD_CONNSYS_I2S_ASRC, "aud_connsys_i2s_asrc", "audio_sel", 12),
+	GATE_AUD1(CLK_AUD_GENERAL1_ASRC, "aud_general1_asrc", "audio_sel", 13),
+	GATE_AUD1(CLK_AUD_GENERAL2_ASRC, "aud_general2_asrc", "audio_sel", 14),
+	GATE_AUD1(CLK_AUD_DAC_HIRES, "aud_dac_hires", "audio_h_sel", 15),
+	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "audio_h_sel", 16),
+	GATE_AUD1(CLK_AUD_ADC_HIRES_TML, "aud_adc_hires_tml", "audio_h_sel", 17),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "audio_sel", 20),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "audio_h_sel", 21),
+	GATE_AUD1(CLK_AUD_3RD_DAC, "aud_3rd_dac", "audio_sel", 28),
+	GATE_AUD1(CLK_AUD_3RD_DAC_PREDIS, "aud_3rd_dac_predis", "audio_sel", 29),
+	GATE_AUD1(CLK_AUD_3RD_DAC_TML, "aud_3rd_dac_tml", "audio_sel", 30),
+	GATE_AUD1(CLK_AUD_3RD_DAC_HIRES, "aud_3rd_dac_hires", "audio_h_sel", 31),
+	/* AUD2 */
+	GATE_AUD2(CLK_AUD_I2S5_B, "aud_i2s5_b", "audio_sel", 0),
+	GATE_AUD2(CLK_AUD_I2S6_B, "aud_i2s6_b", "audio_sel", 1),
+	GATE_AUD2(CLK_AUD_I2S7_B, "aud_i2s7_b", "audio_sel", 2),
+	GATE_AUD2(CLK_AUD_I2S8_B, "aud_i2s8_b", "audio_sel", 3),
+	GATE_AUD2(CLK_AUD_I2S9_B, "aud_i2s9_b", "audio_sel", 4),
+};
+
+static int clk_mt8192_aud_probe(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+
+	clk_data = mtk_alloc_clk_data(CLK_AUD_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, aud_clks, ARRAY_SIZE(aud_clks), clk_data);
+	if (r)
+		return r;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		return r;
+
+	r = devm_of_platform_populate(&pdev->dev);
+	if (r)
+		of_clk_del_provider(node);
+
+	return r;
+}
+
+static const struct of_device_id of_match_clk_mt8192_aud[] = {
+	{ .compatible = "mediatek,mt8192-audsys", },
+	{}
+};
+
+static struct platform_driver clk_mt8192_aud_drv = {
+	.probe = clk_mt8192_aud_probe,
+	.driver = {
+		.name = "clk-mt8192-aud",
+		.of_match_table = of_match_clk_mt8192_aud,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_aud_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
