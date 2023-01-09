Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7B8C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM/qJox+f9T86lXVee+PHkGr5yQqFoaFKdGA+upFfso=; b=ofaJi9VZJWRQszggMdZxPIDj3S
	+7rYuDrFD/0wCJA8udhVv6Lal9VVETW4N0dHQW4n/BctYfse8ZT61m1gHb91sRvks5Kck0Go2Hz8i
	5PFfP/3gtink8RsxfkN7qE7gnUzb7i89ZjDfkiwcumO0u6FIjO8ATGXUYlcZZHUypenYuH5tbppxv
	jaPctij0Cf1wHkCk5Wa8no0KiIUqW4d0Fh6q5ra6mnUPddAPU+UPPayiG0Fp7zySRZ9xeM63cwmjD
	U8nVw9VshaobdTgX258wrYTeUxvTndYR5/gQtZknDD2RdiTVAbl5FMTMVIM9BY64/qBFwETba3bIt
	CRKx7FWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErrD-001QgA-9G; Mon, 09 Jan 2023 13:06:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErr8-001Qdw-AG; Mon, 09 Jan 2023 13:06:29 +0000
X-UUID: 06d4ca2a7e4045218c29a1983371c17e-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eM/qJox+f9T86lXVee+PHkGr5yQqFoaFKdGA+upFfso=;
	b=j8hH9Sm461x6tTU25RjwIEtsHbEeOQd0/1jtULUsnnOpopgwa1dP51fpotNYypvx5Tre1uzSJNJLS5lf830tkF3PVSYhxO7aoobu8vtfbfINJdnXeamzI1Uf5pvTJNabiWvgGGHYaWA594b6Ry9h4PJriuPbSljO8eaIMVQS9Ts=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:e4736941-27d1-422f-86b7-c0d29d93d8c2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:21a4b88b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 06d4ca2a7e4045218c29a1983371c17e-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 235846813; Mon, 09 Jan 2023 06:06:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 20:45:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Jan 2023 20:45:21 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v4 04/19] clk: mediatek: Add MT8188 peripheral clock support
Date: Mon, 9 Jan 2023 20:45:01 +0800
Message-ID: <20230109124516.31425-5-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
References: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_050626_426151_D37D205F 
X-CRM114-Status: GOOD (  16.14  )
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

Add MT8188 peripheral clock controller which provides clock
gate control for ethernet/flashif/pcie/ssusb.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile             |  3 +-
 drivers/clk/mediatek/clk-mt8188-peri_ao.c | 56 +++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-peri_ao.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 89b1b331cad0..b8a3042f4809 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -83,7 +83,8 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o \
 				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o \
 				   clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
-obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
+obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
+				   clk-mt8188-peri_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-peri_ao.c b/drivers/clk/mediatek/clk-mt8188-peri_ao.c
new file mode 100644
index 000000000000..683010453a10
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-peri_ao.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs peri_ao_cg_regs = {
+	.set_ofs = 0x10,
+	.clr_ofs = 0x14,
+	.sta_ofs = 0x18,
+};
+
+#define GATE_PERI_AO(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &peri_ao_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate peri_ao_clks[] = {
+	GATE_PERI_AO(CLK_PERI_AO_ETHERNET, "peri_ao_ethernet", "top_axi", 0),
+	GATE_PERI_AO(CLK_PERI_AO_ETHERNET_BUS, "peri_ao_ethernet_bus", "top_axi", 1),
+	GATE_PERI_AO(CLK_PERI_AO_FLASHIF_BUS, "peri_ao_flashif_bus", "top_axi", 3),
+	GATE_PERI_AO(CLK_PERI_AO_FLASHIF_26M, "peri_ao_flashif_26m", "clk26m", 4),
+	GATE_PERI_AO(CLK_PERI_AO_FLASHIFLASHCK, "peri_ao_flashiflashck", "top_spinor", 5),
+	GATE_PERI_AO(CLK_PERI_AO_SSUSB_2P_BUS, "peri_ao_ssusb_2p_bus", "top_usb_top_2p", 9),
+	GATE_PERI_AO(CLK_PERI_AO_SSUSB_2P_XHCI, "peri_ao_ssusb_2p_xhci", "top_ssusb_xhci_2p", 10),
+	GATE_PERI_AO(CLK_PERI_AO_SSUSB_3P_BUS, "peri_ao_ssusb_3p_bus", "top_usb_top_3p", 11),
+	GATE_PERI_AO(CLK_PERI_AO_SSUSB_3P_XHCI, "peri_ao_ssusb_3p_xhci", "top_ssusb_xhci_3p", 12),
+	GATE_PERI_AO(CLK_PERI_AO_SSUSB_BUS, "peri_ao_ssusb_bus", "top_usb_top", 13),
+	GATE_PERI_AO(CLK_PERI_AO_SSUSB_XHCI, "peri_ao_ssusb_xhci", "top_ssusb_xhci", 14),
+	GATE_PERI_AO(CLK_PERI_AO_ETHERNET_MAC, "peri_ao_ethernet_mac_clk", "top_snps_eth_250m", 16),
+	GATE_PERI_AO(CLK_PERI_AO_PCIE_P0_FMEM, "peri_ao_pcie_p0_fmem", "hd_466m_fmem_ck", 24),
+};
+
+static const struct mtk_clk_desc peri_ao_desc = {
+	.clks = peri_ao_clks,
+	.num_clks = ARRAY_SIZE(peri_ao_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_peri_ao[] = {
+	{ .compatible = "mediatek,mt8188-pericfg-ao", .data = &peri_ao_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_peri_ao_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-peri_ao",
+		.of_match_table = of_match_clk_mt8188_peri_ao,
+	},
+};
+builtin_platform_driver(clk_mt8188_peri_ao_drv);
-- 
2.18.0


