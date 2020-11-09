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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB3BC388F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:17:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27342206D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:17:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONAn8Mfp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SyD//EBg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27342206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OXslYM7XdLoBVBKVvFubLFAC8WJFrVrtOF7lsmPGQ1w=; b=ONAn8Mfp2aG6Ek4ctLeGiakiV
	5DxMk1VtkVvECIOR+b2wFuRwdxzFVxy0oxS0tdYwpZEq820E+Nt/ucVsOifzOQGFT7X5QhRgf+qPT
	mt1XoDSS+eN6Vkf3S4V0PrLyLyunENniQhcaXpQiOexeD+6ONDEMDTcr5PaTfQVO9j2eCY3DKvgjR
	Z00WFvTRoCLstBhDN4Z3dPobOnbBky0UABvctj1hz74f6SjKfJDDm31yuknPKZKUQjWSUJ1N8cepc
	u4K1EdUH/rspXu0Imf596bwBGm1K654fbEfkhuHRr4eAmfcGrIDKn9WTPQ3mr1AO2kk6Zw2Qr+2Ds
	eFdWg7EFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwkA-0000N1-KF; Mon, 09 Nov 2020 02:17:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwhA-0006f7-DP; Mon, 09 Nov 2020 02:14:16 +0000
X-UUID: 7c963f3becf94deeba1270ad160aa645-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6mOjFQp5tiS27/BpZ/cU8++Z2JHSDO2GwBGWDc1VIQc=; 
 b=SyD//EBgIW9PRKhNO28soRs1Xpw+M8s4wCY3AQ8YMRhe5b7AN62C2FGyYtvE1nR85swYDQTugxCrzeg1/AxJbWPxw/kTHlqqu3AOYSKm0UL4HxJNQ2bV26eG1VYaLXLMP9g/x1lbrYLW6rgSyJ8bGBsPqjCcGcu/saFxUKYtDA0=;
X-UUID: 7c963f3becf94deeba1270ad160aa645-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 368588173; Sun, 08 Nov 2020 18:13:58 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:03:57 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 10:03:54 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v5 21/24] clk: mediatek: Add MT8192 vdecsys clock support
Date: Mon, 9 Nov 2020 10:03:46 +0800
Message-ID: <1604887429-29445-22-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_211412_754809_9168E555 
X-CRM114-Status: GOOD (  18.12  )
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

Add MT8192 vdecsys and vdecsys soc clock providers

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |  6 +++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8192-vdec.c | 94 ++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 1009e1f..633e806 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -557,6 +557,12 @@ config COMMON_CLK_MT8192_SCP_ADSP
 	help
 	  This driver supports MediaTek MT8192 scp_adsp clocks.
 
+config COMMON_CLK_MT8192_VDECSYS
+	bool "Clock driver for MediaTek MT8192 vdecsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 vdecsys and vdecsys_soc clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index a336fe7..887dd6b 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -78,5 +78,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MFGCFG) += clk-mt8192-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
 obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
+obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-vdec.c b/drivers/clk/mediatek/clk-mt8192-vdec.c
new file mode 100644
index 0000000..a6043c1
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-vdec.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs vdec0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vdec2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec_clks[] = {
+	/* VDEC0 */
+	GATE_VDEC0(CLK_VDEC_VDEC, "vdec_vdec", "vdec_sel", 0),
+	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "vdec_sel", 4),
+	/* VDEC1 */
+	GATE_VDEC1(CLK_VDEC_LAT, "vdec_lat", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC_LAT_ACTIVE, "vdec_lat_active", "vdec_sel", 4),
+	/* VDEC2 */
+	GATE_VDEC2(CLK_VDEC_LARB1, "vdec_larb1", "vdec_sel", 0),
+};
+
+static const struct mtk_gate vdec_soc_clks[] = {
+	/* VDEC_SOC0 */
+	GATE_VDEC0(CLK_VDEC_SOC_VDEC, "vdec_soc_vdec", "vdec_sel", 0),
+	GATE_VDEC0(CLK_VDEC_SOC_VDEC_ACTIVE, "vdec_soc_vdec_active", "vdec_sel", 4),
+	/* VDEC_SOC1 */
+	GATE_VDEC1(CLK_VDEC_SOC_LAT, "vdec_soc_lat", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC_SOC_LAT_ACTIVE, "vdec_soc_lat_active", "vdec_sel", 4),
+	/* VDEC_SOC2 */
+	GATE_VDEC2(CLK_VDEC_SOC_LARB1, "vdec_soc_larb1", "vdec_sel", 0),
+};
+
+static const struct mtk_clk_desc vdec_desc = {
+	.clks = vdec_clks,
+	.num_clks = ARRAY_SIZE(vdec_clks),
+};
+
+static const struct mtk_clk_desc vdec_soc_desc = {
+	.clks = vdec_soc_clks,
+	.num_clks = ARRAY_SIZE(vdec_soc_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_vdec[] = {
+	{
+		.compatible = "mediatek,mt8192-vdecsys",
+		.data = &vdec_desc,
+	}, {
+		.compatible = "mediatek,mt8192-vdecsys_soc",
+		.data = &vdec_soc_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_vdec_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-vdec",
+		.of_match_table = of_match_clk_mt8192_vdec,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_vdec_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
