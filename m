Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75802C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:17:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E6D221F7
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cq7y4gkq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pP232CuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E6D221F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uUWhXJdDIu0/ij/rSunTB0DOjICpBR9GQ3pxQlCWUlk=; b=Cq7y4gkqdJD/QYFZ5b1S2PBUg
	EGj9zL0dxjyDhT9j2tyxPUOpOiPWwitOe6IGKXfiJoyjOUdWJQETp7dkhupHMLrK5JWgjc9sz2mcW
	yHATRif0O0m0eju2qRKM4NxfxJQT0t89u+j+mPNreDqKjm77zglXmCZ2fr0Nk/+c771i21qdbbSUX
	qcRB+7RurZCxOdQn2pAaSaOIx0Ygu2pmll2LA1ctnf1UJk1vbzToF8t2EFmL9QNHT5dPBnjtASvoH
	WwP7lobUAzbCAcYzvRiSyAVo7ZCNzV7VMJZk5bQSb/dlW1V3oA+cGS8xFwaY76Qv5TjRItutpd/ab
	XQfLY25Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwkM-0000VC-At; Mon, 09 Nov 2020 02:17:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwhC-0006fH-DP; Mon, 09 Nov 2020 02:14:17 +0000
X-UUID: 2bdd8065a8ea4a3882efe760d0585112-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YoELkt3jncoV9qmRJx2dcGeYD818kvYnkljmGtP9+8E=; 
 b=pP232CuJUeBfe3mIWdjrY3vTT62CGIL88cdHdZqHkA3K57pdjHdFor8+PyWyzC7Xdw/tXsY2ygB5D9xkN8ohvRGgjqxZci7hhb4uCaXA2Hney8xDBbowYVz+a6aryG+BWUTzk9sWZPDOs5HgUkK2tDYJhXPJN/1+iscN/pPyJNI=;
X-UUID: 2bdd8065a8ea4a3882efe760d0585112-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1555163114; Sun, 08 Nov 2020 18:13:58 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:04:05 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:03:53 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v5 11/24] clk: mediatek: Add MT8192 audio clock support
Date: Mon, 9 Nov 2020 10:03:36 +0800
Message-ID: <1604887429-29445-12-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2556C35EEF090EEF05CBF0CB560667465D338E86A5B5BEAF1412ECA973DFDBF52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_211414_665773_034DD2FE 
X-CRM114-Status: GOOD (  18.59  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8192 audio clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |   6 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8192-aud.c | 118 ++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index f628efd..1a8b0c1 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -497,6 +497,12 @@ config COMMON_CLK_MT8192
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
index fcde421..1d0f2e8 100644
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
index 0000000..b38f5a5
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
