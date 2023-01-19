Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D1EC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 12:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=By5dmUTTi0RMykkCxUwouTNNTUHYVuF6+0ar226R6Mw=; b=Dph8jd7fgRQgqowGInIl0/5Fz+
	1fYNYPvZ5nS1tdGAmavDIumsExXjKPRIidDDvvzK1y7qd5pUSkFhgyeT33Qk0sxNteq2tOgdLq8nF
	ckVpHRaz66e9mK/pQZlf0e7mMA3VIRx0iuYZIyWl64F2F1Oh29GGISya+iF85YLEWogKxEOZAfWep
	lTZRqOdbCksZlzTgyX1Y8amyfHcTOjC9xBkNf2H91gwetbxLa3JjZJs+Fq1L9CEKgU1B7KE8YKfWI
	jKutsoogI9KDA7FOkQH7YU+SHhmGZAANyWn9yZ7hREXy81Zx38KjlfClxyk9fRQVu+PQm8zH92Fiv
	6/KZAwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMP-004rkC-V9; Thu, 19 Jan 2023 12:49:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMN-004rii-07; Thu, 19 Jan 2023 12:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=By5dmUTTi0RMykkCxUwouTNNTUHYVuF6+0ar226R6Mw=; b=YChH5agAE8x7KNnnvsSgPUXVXH
	npktB9B5jNNS57aIwzmb/QEgHJscj+XidhFoeY6XoV8d//cLsNBNWblATZ2YO0Hl8xO/kWn7O1/2Q
	UfZ1NksRqwWlcMeMpkJhJON5z7iNMlGJt/tuzgGs5bttnzs3o9ZkBOtcJYEqatr8PTh0+RFtNUEeM
	tx72RlTAmSQJNRiwA5BtvePM1pRjegiP4QsKu62EtZ/tjrG9DG3ozpQkkybSsUiTjvCxkyKt8nESj
	abRmMMfpyzPR6lre70MjTmCJbgJVHijxWku96f2SO5nvmEyJuhy6kEi91qU6dEmLkpR7nw3Lmldm/
	9b7r4JDg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIULk-000IPJ-1I;
	Thu, 19 Jan 2023 12:49:08 +0000
X-UUID: a538655297f711edbbe3f76fe852e059-20230119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=By5dmUTTi0RMykkCxUwouTNNTUHYVuF6+0ar226R6Mw=;
	b=nkNo3cncArNKhP5750C524OHtf8xRet3uqav0CW9yHm16hH+Hrqczkk1ONJ3uJA1OdDC7vi8ql1DDcxQRfegXzbmk8ikNPqUXy5RseFaZ1wYV3Z6R3FJJg5MpR6PYKD5p50OI42MZJDK6/6zxhgRGhJgMAmR/AyRr3khhQs/T2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:1cf1928d-da1a-466b-9011-96ff45caed49,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:e9ba1f55-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: a538655297f711edbbe3f76fe852e059-20230119
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1726130719; Thu, 19 Jan 2023 05:49:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 19 Jan 2023 20:48:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 20:48:56 +0800
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
Subject: [PATCH v5 11/19] clk: mediatek: Add MT8188 vdecsys clock support
Date: Thu, 19 Jan 2023 20:48:40 +0800
Message-ID: <20230119124848.26364-12-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_124903_676390_22AB01F7 
X-CRM114-Status: GOOD (  16.23  )
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

Add MT8188 vdec clock controllers which provide clock gate
control for video decoder.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |  2 +-
 drivers/clk/mediatek/clk-mt8188-vdec.c | 90 ++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdec.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index a0fd87a882b5..7d09e9fc6538 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -86,7 +86,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
 				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
 				   clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
-				   clk-mt8188-ipe.o clk-mt8188-mfg.o
+				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vdec.c b/drivers/clk/mediatek/clk-mt8188-vdec.c
new file mode 100644
index 000000000000..e05a27957136
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vdec.c
@@ -0,0 +1,90 @@
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
+static const struct mtk_gate_regs vde0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vde1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vde2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDE0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vde0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDE1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vde1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDE2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vde2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vde1_clks[] = {
+	/* VDE1_0 */
+	GATE_VDE0(CLK_VDE1_SOC_VDEC, "vde1_soc_vdec", "top_vdec", 0),
+	GATE_VDE0(CLK_VDE1_SOC_VDEC_ACTIVE, "vde1_soc_vdec_active", "top_vdec", 4),
+	GATE_VDE0(CLK_VDE1_SOC_VDEC_ENG, "vde1_soc_vdec_eng", "top_vdec", 8),
+	/* VDE1_1 */
+	GATE_VDE1(CLK_VDE1_SOC_LAT, "vde1_soc_lat", "top_vdec", 0),
+	GATE_VDE1(CLK_VDE1_SOC_LAT_ACTIVE, "vde1_soc_lat_active", "top_vdec", 4),
+	GATE_VDE1(CLK_VDE1_SOC_LAT_ENG, "vde1_soc_lat_eng", "top_vdec", 8),
+	/* VDE12 */
+	GATE_VDE2(CLK_VDE1_SOC_LARB1, "vde1_soc_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_gate vde2_clks[] = {
+	/* VDE2_0 */
+	GATE_VDE0(CLK_VDE2_VDEC, "vde2_vdec", "top_vdec", 0),
+	GATE_VDE0(CLK_VDE2_VDEC_ACTIVE, "vde2_vdec_active", "top_vdec", 4),
+	GATE_VDE0(CLK_VDE2_VDEC_ENG, "vde2_vdec_eng", "top_vdec", 8),
+	/* VDE2_1 */
+	GATE_VDE1(CLK_VDE2_LAT, "vde2_lat", "top_vdec", 0),
+	/* VDE2_2 */
+	GATE_VDE2(CLK_VDE2_LARB1, "vde2_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_clk_desc vde1_desc = {
+	.clks = vde1_clks,
+	.num_clks = ARRAY_SIZE(vde1_clks),
+};
+
+static const struct mtk_clk_desc vde2_desc = {
+	.clks = vde2_clks,
+	.num_clks = ARRAY_SIZE(vde2_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_vde[] = {
+	{ .compatible = "mediatek,mt8188-vdecsys-soc", .data = &vde1_desc },
+	{ .compatible = "mediatek,mt8188-vdecsys", .data = &vde2_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_vde_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-vde",
+		.of_match_table = of_match_clk_mt8188_vde,
+	},
+};
+
+builtin_platform_driver(clk_mt8188_vde_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


