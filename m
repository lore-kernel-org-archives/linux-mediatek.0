Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A461C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+97G2VSPoyQpzrT5LBXNBke+RT3M8v9qI8iiBdGQKm0=; b=Xmd+Yq++x0NPuOPM2JOpXMZJ68
	LvmRqq3Grcvkpksto6hvlqEnA3Z4eVlTprhVNh3w0QT5ZRghFB5rXD3oOMoc4dOIXu0VpqxE812fJ
	CSlww+SeAUbpFJyOVMISG5NUdt48vRUfl4K5Hd9uVcgge3oHGLsCCqla2zua4TnbClvFlXDLaRY+O
	e5FhyxytVz693Vrcs5EoRjx2RSX6hly9mYtG0aXjnW6ut1DXWdeBSx93xlLLOO7kc/JFu+vO6woMp
	B1u3dYHPSFEeXiyIVhI6g2XI0u3x3PPQfo7DkJ3EHNtx4tXTblaO+8Zj8F3/ZyhZzX/7ZzTI02ovd
	3xaahEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piA27-006LGl-0N;
	Fri, 31 Mar 2023 08:22:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piA1a-006L0u-1k;
	Fri, 31 Mar 2023 08:22:20 +0000
X-UUID: 236c1216cf9d11ed8687db9d93187ff1-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+97G2VSPoyQpzrT5LBXNBke+RT3M8v9qI8iiBdGQKm0=;
	b=tRU4oEqFhEXVmR4h6fufiOTY67klOlgyqoNdFfnondqEzS7G+L+RjuUm2szIH4Bvk15VZPc9eaRUvUqd88fGssYpBAxdKLE6f39JbHgmmOgczYhn6ip+THunJviHLZ3gmsE+zURaGv8Gr7+D+cyq3EX060ajVjiP/uPOM3kxORk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:cb2c5ca8-572c-47d2-bc87-eb80a88ebde1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:61bef4b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 236c1216cf9d11ed8687db9d93187ff1-20230331
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1603690183; Fri, 31 Mar 2023 01:22:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 16:21:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 16:21:40 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v7 13/19] clk: mediatek: Add MT8188 vdosys1 clock support
Date: Fri, 31 Mar 2023 16:21:25 +0800
Message-ID: <20230331082131.12517-14-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_012218_616350_FC9EC4EE 
X-CRM114-Status: GOOD (  17.33  )
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

Add MT8188 vdosys1 clock controller which provides clock gate
control in video system. This is integrated with mtk-mmsys
driver which will populate device by platform_device_register_data
to start vdosys clock driver.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |   2 +-
 drivers/clk/mediatek/clk-mt8188-vdo1.c | 152 +++++++++++++++++++++++++
 2 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo1.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 4ca2bdf07b63..a6b80bb0b1bf 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_IMGSYS) += clk-mt8188-img.o
 obj-$(CONFIG_COMMON_CLK_MT8188_IPESYS) += clk-mt8188-ipe.o
 obj-$(CONFIG_COMMON_CLK_MT8188_MFGCFG) += clk-mt8188-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8188_VDECSYS) += clk-mt8188-vdec.o
-obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o
+obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-vdo1.c b/drivers/clk/mediatek/clk-mt8188-vdo1.c
new file mode 100644
index 000000000000..99fcf6d7b1ab
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-vdo1.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Garmin Chang <garmin.chang@mediatek.com>
+ */
+
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs vdo1_0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs vdo1_1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs vdo1_2_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+static const struct mtk_gate_regs vdo1_3_cg_regs = {
+	.set_ofs = 0x134,
+	.clr_ofs = 0x138,
+	.sta_ofs = 0x130,
+};
+
+static const struct mtk_gate_regs vdo1_4_cg_regs = {
+	.set_ofs = 0x144,
+	.clr_ofs = 0x148,
+	.sta_ofs = 0x140,
+};
+
+#define GATE_VDO1_0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO1_1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO1_2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO1_3(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_VDO1_3_FLAGS(_id, _name, _parent, _shift, _flags)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &vdo1_3_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, _flags)
+
+#define GATE_VDO1_4(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_4_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate vdo1_clks[] = {
+	/* VDO1_0 */
+	GATE_VDO1_0(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "top_vpp", 0),
+	GATE_VDO1_0(CLK_VDO1_SMI_LARB3, "vdo1_smi_larb3", "top_vpp", 1),
+	GATE_VDO1_0(CLK_VDO1_GALS, "vdo1_gals", "top_vpp", 2),
+	GATE_VDO1_0(CLK_VDO1_FAKE_ENG0, "vdo1_fake_eng0", "top_vpp", 3),
+	GATE_VDO1_0(CLK_VDO1_FAKE_ENG1, "vdo1_fake_eng1", "top_vpp", 4),
+	GATE_VDO1_0(CLK_VDO1_MDP_RDMA0, "vdo1_mdp_rdma0", "top_vpp", 5),
+	GATE_VDO1_0(CLK_VDO1_MDP_RDMA1, "vdo1_mdp_rdma1", "top_vpp", 6),
+	GATE_VDO1_0(CLK_VDO1_MDP_RDMA2, "vdo1_mdp_rdma2", "top_vpp", 7),
+	GATE_VDO1_0(CLK_VDO1_MDP_RDMA3, "vdo1_mdp_rdma3", "top_vpp", 8),
+	GATE_VDO1_0(CLK_VDO1_VPP_MERGE0, "vdo1_vpp_merge0", "top_vpp", 9),
+	GATE_VDO1_0(CLK_VDO1_VPP_MERGE1, "vdo1_vpp_merge1", "top_vpp", 10),
+	GATE_VDO1_0(CLK_VDO1_VPP_MERGE2, "vdo1_vpp_merge2", "top_vpp", 11),
+	/* VDO1_1 */
+	GATE_VDO1_1(CLK_VDO1_VPP_MERGE3, "vdo1_vpp_merge3", "top_vpp", 0),
+	GATE_VDO1_1(CLK_VDO1_VPP_MERGE4, "vdo1_vpp_merge4", "top_vpp", 1),
+	GATE_VDO1_1(CLK_VDO1_VPP2_TO_VDO1_DL_ASYNC, "vdo1_vpp2_to_vdo1_dl_async", "top_vpp", 2),
+	GATE_VDO1_1(CLK_VDO1_VPP3_TO_VDO1_DL_ASYNC, "vdo1_vpp3_to_vdo1_dl_async", "top_vpp", 3),
+	GATE_VDO1_1(CLK_VDO1_DISP_MUTEX, "vdo1_disp_mutex", "top_vpp", 4),
+	GATE_VDO1_1(CLK_VDO1_MDP_RDMA4, "vdo1_mdp_rdma4", "top_vpp", 5),
+	GATE_VDO1_1(CLK_VDO1_MDP_RDMA5, "vdo1_mdp_rdma5", "top_vpp", 6),
+	GATE_VDO1_1(CLK_VDO1_MDP_RDMA6, "vdo1_mdp_rdma6", "top_vpp", 7),
+	GATE_VDO1_1(CLK_VDO1_MDP_RDMA7, "vdo1_mdp_rdma7", "top_vpp", 8),
+	GATE_VDO1_1(CLK_VDO1_DP_INTF0_MMCK, "vdo1_dp_intf0_mmck", "top_vpp", 9),
+	GATE_VDO1_1(CLK_VDO1_DPI0_MM, "vdo1_dpi0_mm_ck", "top_vpp", 10),
+	GATE_VDO1_1(CLK_VDO1_DPI1_MM, "vdo1_dpi1_mm_ck", "top_vpp", 11),
+	GATE_VDO1_1(CLK_VDO1_MERGE0_DL_ASYNC, "vdo1_merge0_dl_async", "top_vpp", 13),
+	GATE_VDO1_1(CLK_VDO1_MERGE1_DL_ASYNC, "vdo1_merge1_dl_async", "top_vpp", 14),
+	GATE_VDO1_1(CLK_VDO1_MERGE2_DL_ASYNC, "vdo1_merge2_dl_async", "top_vpp", 15),
+	GATE_VDO1_1(CLK_VDO1_MERGE3_DL_ASYNC, "vdo1_merge3_dl_async", "top_vpp", 16),
+	GATE_VDO1_1(CLK_VDO1_MERGE4_DL_ASYNC, "vdo1_merge4_dl_async", "top_vpp", 17),
+	GATE_VDO1_1(CLK_VDO1_DSC_VDO1_DL_ASYNC, "vdo1_dsc_vdo1_dl_async", "top_vpp", 18),
+	GATE_VDO1_1(CLK_VDO1_MERGE_VDO1_DL_ASYNC, "vdo1_merge_vdo1_dl_async", "top_vpp", 19),
+	GATE_VDO1_1(CLK_VDO1_PADDING0, "vdo1_padding0", "top_vpp", 20),
+	GATE_VDO1_1(CLK_VDO1_PADDING1, "vdo1_padding1", "top_vpp", 21),
+	GATE_VDO1_1(CLK_VDO1_PADDING2, "vdo1_padding2", "top_vpp", 22),
+	GATE_VDO1_1(CLK_VDO1_PADDING3, "vdo1_padding3", "top_vpp", 23),
+	GATE_VDO1_1(CLK_VDO1_PADDING4, "vdo1_padding4", "top_vpp", 24),
+	GATE_VDO1_1(CLK_VDO1_PADDING5, "vdo1_padding5", "top_vpp", 25),
+	GATE_VDO1_1(CLK_VDO1_PADDING6, "vdo1_padding6", "top_vpp", 26),
+	GATE_VDO1_1(CLK_VDO1_PADDING7, "vdo1_padding7", "top_vpp", 27),
+	GATE_VDO1_1(CLK_VDO1_DISP_RSZ0, "vdo1_disp_rsz0", "top_vpp", 28),
+	GATE_VDO1_1(CLK_VDO1_DISP_RSZ1, "vdo1_disp_rsz1", "top_vpp", 29),
+	GATE_VDO1_1(CLK_VDO1_DISP_RSZ2, "vdo1_disp_rsz2", "top_vpp", 30),
+	GATE_VDO1_1(CLK_VDO1_DISP_RSZ3, "vdo1_disp_rsz3", "top_vpp", 31),
+	/* VDO1_2 */
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE0, "vdo1_hdr_vdo_fe0", "top_vpp", 0),
+	GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE0, "vdo1_hdr_gfx_fe0", "top_vpp", 1),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_BE, "vdo1_hdr_vdo_be", "top_vpp", 2),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE1, "vdo1_hdr_vdo_fe1", "top_vpp", 16),
+	GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE1, "vdo1_hdr_gfx_fe1", "top_vpp", 17),
+	GATE_VDO1_2(CLK_VDO1_DISP_MIXER, "vdo1_disp_mixer", "top_vpp", 18),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE0_DL_ASYNC, "vdo1_hdr_vdo_fe0_dl_async", "top_vpp", 19),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_FE1_DL_ASYNC, "vdo1_hdr_vdo_fe1_dl_async", "top_vpp", 20),
+	GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE0_DL_ASYNC, "vdo1_hdr_gfx_fe0_dl_async", "top_vpp", 21),
+	GATE_VDO1_2(CLK_VDO1_HDR_GFX_FE1_DL_ASYNC, "vdo1_hdr_gfx_fe1_dl_async", "top_vpp", 22),
+	GATE_VDO1_2(CLK_VDO1_HDR_VDO_BE_DL_ASYNC, "vdo1_hdr_vdo_be_dl_async", "top_vpp", 23),
+	/* VDO1_3 */
+	GATE_VDO1_3(CLK_VDO1_DPI0, "vdo1_dpi0_ck", "top_vpp", 0),
+	GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPI0, "vdo1_disp_monitor_dpi0_ck", "top_vpp", 1),
+	GATE_VDO1_3(CLK_VDO1_DPI1, "vdo1_dpi1_ck", "top_vpp", 8),
+	GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPI1, "vdo1_disp_monitor_dpi1_ck", "top_vpp", 9),
+	GATE_VDO1_3_FLAGS(CLK_VDO1_DPINTF, "vdo1_dpintf", "top_dp", 16, CLK_SET_RATE_PARENT),
+	GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf_ck", "top_vpp", 17),
+	/* VDO1_4 */
+	GATE_VDO1_4(CLK_VDO1_26M_SLOW, "vdo1_26m_slow_ck", "clk26m", 8),
+};
+
+static const struct mtk_clk_desc vdo1_desc = {
+	.clks = vdo1_clks,
+	.num_clks = ARRAY_SIZE(vdo1_clks),
+};
+
+static const struct platform_device_id clk_mt8188_vdo1_id_table[] = {
+	{ .name = "clk-mt8188-vdo1", .driver_data = (kernel_ulong_t)&vdo1_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, clk_mt8188_vdo1_id_table);
+
+static struct platform_driver clk_mt8188_vdo1_drv = {
+	.probe = mtk_clk_pdev_probe,
+	.remove = mtk_clk_pdev_remove,
+	.driver = {
+		.name = "clk-mt8188-vdo1",
+	},
+	.id_table = clk_mt8188_vdo1_id_table,
+};
+module_platform_driver(clk_mt8188_vdo1_drv);
+MODULE_LICENSE("GPL");
-- 
2.18.0


