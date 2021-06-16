Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3282C48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:04:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C90561246
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C90561246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFu55Kg92Ov67umuWCeuRCwWjXUwRQegUbCkFZLhWU0=; b=LP6RGnmq2fsOIT
	/ZFh+VWTmTjMvb9Wn1m0wU0WiUxgwFAMCq9eMqRgevnJ3BZO/jntv/GyQloUrykLYhshTNy4NnsnD
	L9KoIT/YrV1hAes2xZ5i8yT4tgCriG+q5+QIXTK5OpPk0z1SsC/LGlKBUxPHwMqJgleD4WihmL/He
	1408+SFngY3UDqDRGDcdooA2oNlkt9WSW8eO1jVTarJ50WulWKE3DkQ/i3dKnRoiGdAmWC7xh1SLT
	G9iEjto4ZklkXbtRmWa/SHTHChyNHWfFeyqHPkz9kbuW95Rx9/5W40Z+UdGMC/NiTvqCezEhUiKDK
	y/3iilii9S9PXKqZpvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteaW-007zyR-Tq; Wed, 16 Jun 2021 23:04:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVT-007xLK-4y; Wed, 16 Jun 2021 22:59:37 +0000
X-UUID: a40278eb2bb7455f87af361f5ad60d7e-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aQD2J7ZFZ7m3Gf/qZu3rwuot5W5qJ5f7ph2eJCyMfVk=; 
 b=N/d58u5Xxhq2mLlujva0dkf7iOvh4inIJhC8YYDA1HyxBouUVN9FGUp1uJVDA9Ykk6XX1eEi5JSxmHIt+CnTN2L50jRVlzWoQRcqitknLvrofOLIYNtUOZLel3Z7LTZeULRvCe/DjRt3drshrM1XnMGne9SMxX/ehEiKj6c4dfE=;
X-UUID: a40278eb2bb7455f87af361f5ad60d7e-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1903073884; Wed, 16 Jun 2021 15:59:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:49:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:49:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:49:30 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 05/22] clk: mediatek: Add MT8195 audio clock support
Date: Thu, 17 Jun 2021 06:47:26 +0800
Message-ID: <20210616224743.5109-6-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_155935_244124_A5F1946A 
X-CRM114-Status: GOOD (  17.42  )
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

Add MT8195 audio clock provider

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |   6 +
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8195-aud.c | 198 ++++++++++++++++++++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-aud.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 6707aba3d500..e2bae9d490a4 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -588,6 +588,12 @@ config COMMON_CLK_MT8195
 	help
 	  This driver supports MediaTek MT8195 basic clocks.
 
+config COMMON_CLK_MT8195_AUDSYS
+	bool "Clock driver for MediaTek MT8195 audsys"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 audsys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index f8002d8966e1..f27c04314186 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -81,5 +81,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195.o
+obj-$(CONFIG_COMMON_CLK_MT8195_AUDSYS) += clk-mt8195-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-aud.c b/drivers/clk/mediatek/clk-mt8195-aud.c
new file mode 100644
index 000000000000..db5f80d41de0
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-aud.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8195-clk.h>
+
+static const struct mtk_gate_regs aud0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x0,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs aud1_cg_regs = {
+	.set_ofs = 0x10,
+	.clr_ofs = 0x10,
+	.sta_ofs = 0x10,
+};
+
+static const struct mtk_gate_regs aud2_cg_regs = {
+	.set_ofs = 0x14,
+	.clr_ofs = 0x14,
+	.sta_ofs = 0x14,
+};
+
+static const struct mtk_gate_regs aud3_cg_regs = {
+	.set_ofs = 0x18,
+	.clr_ofs = 0x18,
+	.sta_ofs = 0x18,
+};
+
+static const struct mtk_gate_regs aud4_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x4,
+};
+
+static const struct mtk_gate_regs aud5_cg_regs = {
+	.set_ofs = 0xc,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0xc,
+};
+
+#define GATE_AUD0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &aud0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &aud1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &aud2_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD3(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &aud3_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD4(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &aud4_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+#define GATE_AUD5(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &aud5_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+static const struct mtk_gate aud_clks[] = {
+	/* AUD0 */
+	GATE_AUD0(CLK_AUD_AFE, "aud_afe", "a1sys_hp_sel", 2),
+	GATE_AUD0(CLK_AUD_LRCK_CNT, "aud_lrck_cnt", "a1sys_hp_sel", 4),
+	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_APLL, "aud_spdifin_tuner_apll", "apll4_sel", 10),
+	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_DBG, "aud_spdifin_tuner_dbg", "apll4_sel", 11),
+	GATE_AUD0(CLK_AUD_UL_TML, "aud_ul_tml", "a1sys_hp_sel", 18),
+	GATE_AUD0(CLK_AUD_APLL1_TUNER, "aud_apll1_tuner", "apll1_sel", 19),
+	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "apll2_sel", 20),
+	GATE_AUD0(CLK_AUD_TOP0_SPDF, "aud_top0_spdf", "aud_iec_sel", 21),
+	GATE_AUD0(CLK_AUD_APLL, "aud_apll", "apll1_sel", 23),
+	GATE_AUD0(CLK_AUD_APLL2, "aud_apll2", "apll2_sel", 24),
+	GATE_AUD0(CLK_AUD_DAC, "aud_dac", "a1sys_hp_sel", 25),
+	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "a1sys_hp_sel", 26),
+	GATE_AUD0(CLK_AUD_TML, "aud_tml", "a1sys_hp_sel", 27),
+	GATE_AUD0(CLK_AUD_ADC, "aud_adc", "a1sys_hp_sel", 28),
+	GATE_AUD0(CLK_AUD_DAC_HIRES, "aud_dac_hires", "audio_h_sel", 31),
+	/* AUD1 */
+	GATE_AUD1(CLK_AUD_I2SIN, "aud_i2sin", "a1sys_hp_sel", 0),
+	GATE_AUD1(CLK_AUD_TDM_IN, "aud_tdm_in", "a1sys_hp_sel", 1),
+	GATE_AUD1(CLK_AUD_I2S_OUT, "aud_i2s_out", "a1sys_hp_sel", 6),
+	GATE_AUD1(CLK_AUD_TDM_OUT, "aud_tdm_out", "a1sys_hp_sel", 7),
+	GATE_AUD1(CLK_AUD_HDMI_OUT, "aud_hdmi_out", "a1sys_hp_sel", 8),
+	GATE_AUD1(CLK_AUD_ASRC11, "aud_asrc11", "a1sys_hp_sel", 16),
+	GATE_AUD1(CLK_AUD_ASRC12, "aud_asrc12", "a1sys_hp_sel", 17),
+	GATE_AUD1(CLK_AUD_MULTI_IN, "aud_multi_in", "mphone_slave_b", 19),
+	GATE_AUD1(CLK_AUD_INTDIR, "aud_intdir", "intdir_sel", 20),
+	GATE_AUD1(CLK_AUD_A1SYS, "aud_a1sys", "a1sys_hp_sel", 21),
+	GATE_AUD1(CLK_AUD_A2SYS, "aud_a2sys", "a2sys_sel", 22),
+	GATE_AUD1(CLK_AUD_PCMIF, "aud_pcmif", "a1sys_hp_sel", 24),
+	GATE_AUD1(CLK_AUD_A3SYS, "aud_a3sys", "a3sys_sel", 30),
+	GATE_AUD1(CLK_AUD_A4SYS, "aud_a4sys", "a4sys_sel", 31),
+	/* AUD2 */
+	GATE_AUD2(CLK_AUD_MEMIF_UL1, "aud_memif_ul1", "a1sys_hp_sel", 0),
+	GATE_AUD2(CLK_AUD_MEMIF_UL2, "aud_memif_ul2", "a1sys_hp_sel", 1),
+	GATE_AUD2(CLK_AUD_MEMIF_UL3, "aud_memif_ul3", "a1sys_hp_sel", 2),
+	GATE_AUD2(CLK_AUD_MEMIF_UL4, "aud_memif_ul4", "a1sys_hp_sel", 3),
+	GATE_AUD2(CLK_AUD_MEMIF_UL5, "aud_memif_ul5", "a1sys_hp_sel", 4),
+	GATE_AUD2(CLK_AUD_MEMIF_UL6, "aud_memif_ul6", "a1sys_hp_sel", 5),
+	GATE_AUD2(CLK_AUD_MEMIF_UL8, "aud_memif_ul8", "a1sys_hp_sel", 7),
+	GATE_AUD2(CLK_AUD_MEMIF_UL9, "aud_memif_ul9", "a1sys_hp_sel", 8),
+	GATE_AUD2(CLK_AUD_MEMIF_UL10, "aud_memif_ul10", "a1sys_hp_sel", 9),
+	GATE_AUD2(CLK_AUD_MEMIF_DL2, "aud_memif_dl2", "a1sys_hp_sel", 18),
+	GATE_AUD2(CLK_AUD_MEMIF_DL3, "aud_memif_dl3", "a1sys_hp_sel", 19),
+	GATE_AUD2(CLK_AUD_MEMIF_DL6, "aud_memif_dl6", "a1sys_hp_sel", 22),
+	GATE_AUD2(CLK_AUD_MEMIF_DL7, "aud_memif_dl7", "a1sys_hp_sel", 23),
+	GATE_AUD2(CLK_AUD_MEMIF_DL8, "aud_memif_dl8", "a1sys_hp_sel", 24),
+	GATE_AUD2(CLK_AUD_MEMIF_DL10, "aud_memif_dl10", "a1sys_hp_sel", 26),
+	GATE_AUD2(CLK_AUD_MEMIF_DL11, "aud_memif_dl11", "a1sys_hp_sel", 27),
+	/* AUD3 */
+	GATE_AUD3(CLK_AUD_GASRC0, "aud_gasrc0", "asm_h_sel", 0),
+	GATE_AUD3(CLK_AUD_GASRC1, "aud_gasrc1", "asm_h_sel", 1),
+	GATE_AUD3(CLK_AUD_GASRC2, "aud_gasrc2", "asm_h_sel", 2),
+	GATE_AUD3(CLK_AUD_GASRC3, "aud_gasrc3", "asm_h_sel", 3),
+	GATE_AUD3(CLK_AUD_GASRC4, "aud_gasrc4", "asm_h_sel", 4),
+	GATE_AUD3(CLK_AUD_GASRC5, "aud_gasrc5", "asm_h_sel", 5),
+	GATE_AUD3(CLK_AUD_GASRC6, "aud_gasrc6", "asm_h_sel", 6),
+	GATE_AUD3(CLK_AUD_GASRC7, "aud_gasrc7", "asm_h_sel", 7),
+	GATE_AUD3(CLK_AUD_GASRC8, "aud_gasrc8", "asm_h_sel", 8),
+	GATE_AUD3(CLK_AUD_GASRC9, "aud_gasrc9", "asm_h_sel", 9),
+	GATE_AUD3(CLK_AUD_GASRC10, "aud_gasrc10", "asm_h_sel", 10),
+	GATE_AUD3(CLK_AUD_GASRC11, "aud_gasrc11", "asm_h_sel", 11),
+	GATE_AUD3(CLK_AUD_GASRC12, "aud_gasrc12", "asm_h_sel", 12),
+	GATE_AUD3(CLK_AUD_GASRC13, "aud_gasrc13", "asm_h_sel", 13),
+	GATE_AUD3(CLK_AUD_GASRC14, "aud_gasrc14", "asm_h_sel", 14),
+	GATE_AUD3(CLK_AUD_GASRC15, "aud_gasrc15", "asm_h_sel", 15),
+	GATE_AUD3(CLK_AUD_GASRC16, "aud_gasrc16", "asm_h_sel", 16),
+	GATE_AUD3(CLK_AUD_GASRC17, "aud_gasrc17", "asm_h_sel", 17),
+	GATE_AUD3(CLK_AUD_GASRC18, "aud_gasrc18", "asm_h_sel", 18),
+	GATE_AUD3(CLK_AUD_GASRC19, "aud_gasrc19", "asm_h_sel", 19),
+	/* AUD4 */
+	GATE_AUD4(CLK_AUD_A1SYS_HP, "aud_a1sys_hp", "a1sys_hp_sel", 2),
+	GATE_AUD4(CLK_AUD_AFE_DMIC1, "aud_afe_dmic1", "a1sys_hp_sel", 10),
+	GATE_AUD4(CLK_AUD_AFE_DMIC2, "aud_afe_dmic2", "a1sys_hp_sel", 11),
+	GATE_AUD4(CLK_AUD_AFE_DMIC3, "aud_afe_dmic3", "a1sys_hp_sel", 12),
+	GATE_AUD4(CLK_AUD_AFE_DMIC4, "aud_afe_dmic4", "a1sys_hp_sel", 13),
+	GATE_AUD4(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "a1sys_hp_sel", 14),
+	GATE_AUD4(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "audio_h_sel", 16),
+	GATE_AUD4(CLK_AUD_ADC_HIRES, "aud_adc_hires", "audio_h_sel", 17),
+	GATE_AUD4(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "a1sys_hp_sel", 18),
+	GATE_AUD4(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "audio_h_sel", 19),
+	/* AUD5 */
+	GATE_AUD5(CLK_AUD_LINEIN_TUNER, "aud_linein_tuner", "apll5_sel", 5),
+	GATE_AUD5(CLK_AUD_EARC_TUNER, "aud_earc_tuner", "apll3_sel", 7),
+};
+
+static int clk_mt8195_aud_probe(struct platform_device *pdev)
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
+		goto err_clk_provider;
+
+	r = devm_of_platform_populate(&pdev->dev);
+	if (r)
+		goto err_plat_populate;
+
+	return 0;
+
+err_plat_populate:
+	of_clk_del_provider(node);
+err_clk_provider:
+	return r;
+}
+
+static const struct of_device_id of_match_clk_mt8195_aud[] = {
+	{ .compatible = "mediatek,mt8195-audsys", },
+	{}
+};
+
+static struct platform_driver clk_mt8195_aud_drv = {
+	.probe = clk_mt8195_aud_probe,
+	.driver = {
+		.name = "clk-mt8195-aud",
+		.of_match_table = of_match_clk_mt8195_aud,
+	},
+};
+
+builtin_platform_driver(clk_mt8195_aud_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
