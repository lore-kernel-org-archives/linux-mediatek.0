Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE354C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:47:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1255613C2
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 03:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1255613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vW54S1+wYQ+4Im/Z9/qMKSc7vtXfuvwSuZ2Cpyqgc7Q=; b=d9WAhQ1MQfn0Y5
	Y7DWQTTHwXdMXjvxtlM79Hdd8j5ggJzVTYU/WM49e3lfyNJhW0N3uZFKd9qf34WyBx5J3lI56EV8m
	6rm1yHFMjdM3SMtUD+sTGQgAosO6JkZ/15FgEkDcw1tPUUg4ov+fRQpNhoIbiD4oXOwRAkPoG+shu
	ibGXNjRfIU1aiFdHPsGL5WJs1eRhpmEKVhijzhqrqjBoyRbHpq5zpx+d8mcF/7MQZxBdEI9yo1kwH
	1b5Gg0g5/2opI3Coy/IxkHqXUhwLPbjp1fLg9hnEbAm7t/706qapA1628mEW/fzhj3b4d5D/N4Ocm
	/MqrMrC3It1saRTfbePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0FZT-007djW-VZ; Mon, 05 Jul 2021 03:47:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0FZQ-007dh7-Qt; Mon, 05 Jul 2021 03:46:58 +0000
X-UUID: 308a2f64c23f4aa9ba714ba1d21855ad-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=s+jTm2+M2yNsl9xx4nYTrMuBMeTiPnSEDwQILf152HM=; 
 b=QWBa2MGZIS2UcmTNNgnwIBFBtzw9LJ7+hEXAsr+hClCgwaJX50ZjZ2kMXxmUsq158e303p28mahKXLz1Ue8ZNNOErwViRJFKIM/ZlIEAm5nPeXdefdpEd+Eup5ScTbFw6LzOacyaB7LhoZ4YyrzfHPSuPXlwTB+4ZOltgWoVRaM=;
X-UUID: 308a2f64c23f4aa9ba714ba1d21855ad-20210704
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1148330297; Sun, 04 Jul 2021 20:46:53 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 20:42:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 11:42:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 11:42:04 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v12 14/20] clk: mediatek: Add MT8192 mdpsys clock support
Date: Mon, 5 Jul 2021 11:38:18 +0800
Message-ID: <20210705033824.1934-15-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_204656_938227_7ADA27AB 
X-CRM114-Status: GOOD (  16.07  )
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

Add MT8192 mdpsys clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig          |  6 ++
 drivers/clk/mediatek/Makefile         |  1 +
 drivers/clk/mediatek/clk-mt8192-mdp.c | 82 +++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-mdp.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 02e626270ee7..59104b8cd7dc 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -538,6 +538,12 @@ config COMMON_CLK_MT8192_IPESYS
 	help
 	  This driver supports MediaTek MT8192 ipesys clocks.
 
+config COMMON_CLK_MT8192_MDPSYS
+	bool "Clock driver for MediaTek MT8192 mdpsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 mdpsys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 33dc974c6638..7b258cb1f914 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -73,5 +73,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMGSYS) += clk-mt8192-img.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP) += clk-mt8192-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8192_IPESYS) += clk-mt8192-ipe.o
+obj-$(CONFIG_COMMON_CLK_MT8192_MDPSYS) += clk-mt8192-mdp.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-mdp.c b/drivers/clk/mediatek/clk-mt8192-mdp.c
new file mode 100644
index 000000000000..93c87ae2f332
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-mdp.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
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
+static const struct mtk_gate_regs mdp0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mdp1_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+#define GATE_MDP0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mdp0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MDP1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mdp1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mdp_clks[] = {
+	/* MDP0 */
+	GATE_MDP0(CLK_MDP_RDMA0, "mdp_mdp_rdma0", "mdp_sel", 0),
+	GATE_MDP0(CLK_MDP_TDSHP0, "mdp_mdp_tdshp0", "mdp_sel", 1),
+	GATE_MDP0(CLK_MDP_IMG_DL_ASYNC0, "mdp_img_dl_async0", "mdp_sel", 2),
+	GATE_MDP0(CLK_MDP_IMG_DL_ASYNC1, "mdp_img_dl_async1", "mdp_sel", 3),
+	GATE_MDP0(CLK_MDP_RDMA1, "mdp_mdp_rdma1", "mdp_sel", 4),
+	GATE_MDP0(CLK_MDP_TDSHP1, "mdp_mdp_tdshp1", "mdp_sel", 5),
+	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp_sel", 6),
+	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp_sel", 7),
+	GATE_MDP0(CLK_MDP_WROT0, "mdp_mdp_wrot0", "mdp_sel", 8),
+	GATE_MDP0(CLK_MDP_RSZ0, "mdp_mdp_rsz0", "mdp_sel", 9),
+	GATE_MDP0(CLK_MDP_HDR0, "mdp_mdp_hdr0", "mdp_sel", 10),
+	GATE_MDP0(CLK_MDP_MUTEX0, "mdp_mdp_mutex0", "mdp_sel", 11),
+	GATE_MDP0(CLK_MDP_WROT1, "mdp_mdp_wrot1", "mdp_sel", 12),
+	GATE_MDP0(CLK_MDP_RSZ1, "mdp_mdp_rsz1", "mdp_sel", 13),
+	GATE_MDP0(CLK_MDP_HDR1, "mdp_mdp_hdr1", "mdp_sel", 14),
+	GATE_MDP0(CLK_MDP_FAKE_ENG0, "mdp_mdp_fake_eng0", "mdp_sel", 15),
+	GATE_MDP0(CLK_MDP_AAL0, "mdp_mdp_aal0", "mdp_sel", 16),
+	GATE_MDP0(CLK_MDP_AAL1, "mdp_mdp_aal1", "mdp_sel", 17),
+	GATE_MDP0(CLK_MDP_COLOR0, "mdp_mdp_color0", "mdp_sel", 18),
+	GATE_MDP0(CLK_MDP_COLOR1, "mdp_mdp_color1", "mdp_sel", 19),
+	/* MDP1 */
+	GATE_MDP1(CLK_MDP_IMG_DL_RELAY0_ASYNC0, "mdp_img_dl_relay0_async0", "mdp_sel", 0),
+	GATE_MDP1(CLK_MDP_IMG_DL_RELAY1_ASYNC1, "mdp_img_dl_relay1_async1", "mdp_sel", 8),
+};
+
+static const struct mtk_clk_desc mdp_desc = {
+	.clks = mdp_clks,
+	.num_clks = ARRAY_SIZE(mdp_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_mdp[] = {
+	{
+		.compatible = "mediatek,mt8192-mdpsys",
+		.data = &mdp_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_mdp_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-mdp",
+		.of_match_table = of_match_clk_mt8192_mdp,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_mdp_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
