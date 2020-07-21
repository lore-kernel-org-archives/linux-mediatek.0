Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69ADDC433E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 04:00:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE8A2073A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 04:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="De2cywRx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oZivCz7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EE8A2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Or/nz6bXfojNORGEwYjJdQoO87N+GAVXvdBzlHW2QU=; b=De2cywRxV+36FnfSzBxPSk2uY
	kXtDGPqw4kMGr7C3ltH0IjbUuEQRaxnDPhm9FEah7j5WoK2SZqqhgL/l72Vx3lt5At4p1WVVvsJ/D
	TrWnHfjieQBVvWzFmGcKynz9jdaTNBvXttqSgzoaf6rv6v69OkYJ24As51mn8wrAWesshfW8iUdsz
	vT7qDky2dlYkgrZaaUdL4ZsMyq0SjFLkKjtNpTlQtYdFGRJ6jbtXjFhM6yemqIl7/r/vQWOSBJ9ic
	+xucmyeneTcAz2PnmTEVWsc5lvQ8YH4qspWpIgIQWnTaxDqKBFm5CsleXtCfzkn2pTNVWFsZU142Q
	f3a0NL0Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxjRX-0003fB-SC; Tue, 21 Jul 2020 03:59:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxjRQ-0003cj-Ed; Tue, 21 Jul 2020 03:59:45 +0000
X-UUID: ded028fbe54646d8b49748f17aef1c32-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rwrtl5qkYAB06GIEtyBjVaHw0WmiDOCorWtxIeA5meo=; 
 b=oZivCz7Zd73cYPb3fHDQyhpzBeG3xOVnBPJEYQ06RbVv4uWPWigl8NxpKy2JT5nr4VqahanGuctHA6sjTe+8uVlMxnMYl4UvtfllYIxuOHgEna7bkWX9qeJWMOeGhtHef861mHyLxEy77/++ppdOm4ec7zDA7SZ8Gvof0K7LnmI=;
X-UUID: ded028fbe54646d8b49748f17aef1c32-20200720
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 941218729; Mon, 20 Jul 2020 19:59:35 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 20:59:35 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 11:59:33 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Jul 2020 11:59:33 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/2] soc: mediatek: add mtk-devapc driver
Date: Tue, 21 Jul 2020 11:59:31 +0800
Message-ID: <1595303971-8793-3-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595303971-8793-1-git-send-email-neal.liu@mediatek.com>
References: <1595303971-8793-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 286DBE0385449444B7ED4DFE2B7ECFEB77A4A0B02E7E3BA5B071D643A490BD2D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_235944_720461_DD0F14BA 
X-CRM114-Status: GOOD (  21.26  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek bus fabric provides TrustZone security support and data
protection to prevent slaves from being accessed by unexpected
masters.
The security violation is logged and sent to the processor for
further analysis or countermeasures.

Any occurrence of security violation would raise an interrupt, and
it will be handled by mtk-devapc driver. The violation
information is printed in order to find the murderer.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 drivers/soc/mediatek/Kconfig      |    9 +
 drivers/soc/mediatek/Makefile     |    1 +
 drivers/soc/mediatek/mtk-devapc.c |  372 +++++++++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-devapc.h |   54 ++++++
 4 files changed, 436 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c
 create mode 100644 drivers/soc/mediatek/mtk-devapc.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 59a56cd..1177c98 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -17,6 +17,15 @@ config MTK_CMDQ
 	  time limitation, such as updating display configuration during the
 	  vblank.
 
+config MTK_DEVAPC
+	tristate "Mediatek Device APC Support"
+	help
+	  Say yes here to enable support for Mediatek Device APC driver.
+	  This driver is mainly used to handle the violation which catches
+	  unexpected transaction.
+	  The violation information is logged for further analysis or
+	  countermeasures.
+
 config MTK_INFRACFG
 	bool "MediaTek INFRACFG Support"
 	select REGMAP
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 01f9f87..abfd4ba 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
+obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
 obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
new file mode 100644
index 0000000..1397e98
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include "mtk-devapc.h"
+
+static u32 get_shift_group(struct mtk_devapc_context *ctx, u32 vio_idx)
+{
+	u32 vio_shift_sta;
+	void __iomem *reg;
+
+	reg = ctx->devapc_pd_base + ctx->offset->vio_shift_sta;
+	vio_shift_sta = readl(reg);
+
+	if (vio_shift_sta)
+		return __ffs(vio_shift_sta);
+
+	return 31;
+}
+
+static int check_vio_mask_sta(struct mtk_devapc_context *ctx, u32 module,
+			      u32 offset)
+{
+	void __iomem *reg;
+	u32 value;
+
+	reg = ctx->devapc_pd_base + offset;
+	reg += 0x4 * VIO_MOD_TO_REG_IND(module);
+
+	value = readl(reg);
+
+	return ((value >> VIO_MOD_TO_REG_OFF(module)) & 0x1);
+}
+
+static int check_vio_mask(struct mtk_devapc_context *ctx, u32 module)
+{
+	return check_vio_mask_sta(ctx, module, ctx->offset->vio_mask);
+}
+
+static int check_vio_status(struct mtk_devapc_context *ctx, u32 module)
+{
+	return check_vio_mask_sta(ctx, module, ctx->offset->vio_sta);
+}
+
+static void clear_vio_status(struct mtk_devapc_context *ctx, u32 module)
+{
+	void __iomem *reg;
+
+	reg = ctx->devapc_pd_base + ctx->offset->vio_sta;
+	reg += 0x4 * VIO_MOD_TO_REG_IND(module);
+
+	writel(0x1 << VIO_MOD_TO_REG_OFF(module), reg);
+
+	if (check_vio_status(ctx, module))
+		dev_err(ctx->dev, "%s: Clear failed, module_index:0x%x\n",
+			__func__, module);
+}
+
+static void mask_module_irq(struct mtk_devapc_context *ctx, u32 module,
+			    bool mask)
+{
+	void __iomem *reg;
+	u32 value;
+
+	reg = ctx->devapc_pd_base + ctx->offset->vio_mask;
+	reg += 0x4 * VIO_MOD_TO_REG_IND(module);
+
+	value = readl(reg);
+	if (mask)
+		value |= (0x1 << VIO_MOD_TO_REG_OFF(module));
+	else
+		value &= ~(0x1 << VIO_MOD_TO_REG_OFF(module));
+
+	writel(value, reg);
+}
+
+#define PHY_DEVAPC_TIMEOUT	0x10000
+
+/*
+ * sync_vio_dbg - do "shift" mechansim" to get full violation information.
+ *                shift mechanism is depends on devapc hardware design.
+ *                Mediatek devapc set multiple slaves as a group. When violation
+ *                is triggered, violation info is kept inside devapc hardware.
+ *                Driver should do shift mechansim to "shift" full violation
+ *                info to VIO_DBGs registers.
+ *
+ */
+static int sync_vio_dbg(struct mtk_devapc_context *ctx, u32 shift_bit)
+{
+	void __iomem *pd_vio_shift_sta_reg;
+	void __iomem *pd_vio_shift_sel_reg;
+	void __iomem *pd_vio_shift_con_reg;
+	int ret;
+	u32 val;
+
+	pd_vio_shift_sta_reg = ctx->devapc_pd_base + ctx->offset->vio_shift_sta;
+	pd_vio_shift_sel_reg = ctx->devapc_pd_base + ctx->offset->vio_shift_sel;
+	pd_vio_shift_con_reg = ctx->devapc_pd_base + ctx->offset->vio_shift_con;
+
+	/* Enable shift mechansim */
+	writel(0x1 << shift_bit, pd_vio_shift_sel_reg);
+	writel(0x1, pd_vio_shift_con_reg);
+
+	ret = readl_poll_timeout(pd_vio_shift_con_reg, val, val & 0x3, 1000,
+				 PHY_DEVAPC_TIMEOUT);
+	if (ret)
+		dev_err(ctx->dev, "%s: Shift violation info failed\n",
+			__func__);
+
+	/* Disable shift mechanism */
+	writel(0x0, pd_vio_shift_con_reg);
+	writel(0x0, pd_vio_shift_sel_reg);
+	writel(0x1 << shift_bit, pd_vio_shift_sta_reg);
+
+	return ret;
+}
+
+static void devapc_vio_info_print(struct mtk_devapc_context *ctx)
+{
+	struct mtk_devapc_vio_info *vio_info = ctx->vio_info;
+
+	/* Print violation information */
+	if (vio_info->write)
+		dev_info(ctx->dev, "Write Violation\n");
+	else if (vio_info->read)
+		dev_info(ctx->dev, "Read Violation\n");
+
+	dev_info(ctx->dev, "Vio Addr:0x%x, High:0x%x, Bus ID:0x%x, Dom ID:%x\n",
+		 vio_info->vio_addr, vio_info->vio_addr_high,
+		 vio_info->master_id, vio_info->domain_id);
+}
+
+/*
+ * devapc_extract_vio_dbg - extract full violation information after doing
+ *                          shift mechanism.
+ */
+static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
+{
+	const struct mtk_devapc_vio_dbgs *vio_dbgs;
+	struct mtk_devapc_vio_info *vio_info;
+	void __iomem *vio_dbg0_reg;
+	void __iomem *vio_dbg1_reg;
+	u32 dbg0;
+
+	vio_dbg0_reg = ctx->devapc_pd_base + ctx->offset->vio_dbg0;
+	vio_dbg1_reg = ctx->devapc_pd_base + ctx->offset->vio_dbg1;
+
+	vio_dbgs = ctx->vio_dbgs;
+	vio_info = ctx->vio_info;
+
+	/* Starts to extract violation information */
+	dbg0 = readl(vio_dbg0_reg);
+	vio_info->vio_addr = readl(vio_dbg1_reg);
+
+	vio_info->master_id = (dbg0 & vio_dbgs->mstid.mask) >>
+			      vio_dbgs->mstid.start;
+	vio_info->domain_id = (dbg0 & vio_dbgs->dmnid.mask) >>
+			      vio_dbgs->dmnid.start;
+	vio_info->write = ((dbg0 & vio_dbgs->vio_w.mask) >>
+			    vio_dbgs->vio_w.start) == 1;
+	vio_info->read = ((dbg0 & vio_dbgs->vio_r.mask) >>
+			  vio_dbgs->vio_r.start) == 1;
+	vio_info->vio_addr_high = (dbg0 & vio_dbgs->addr_h.mask) >>
+				  vio_dbgs->addr_h.start;
+
+	devapc_vio_info_print(ctx);
+}
+
+/*
+ * mtk_devapc_dump_vio_dbg - get the violation index and dump the full violation
+ *                           debug information.
+ */
+static bool mtk_devapc_dump_vio_dbg(struct mtk_devapc_context *ctx, u32 vio_idx)
+{
+	u32 shift_bit;
+
+	if (check_vio_mask(ctx, vio_idx))
+		return false;
+
+	if (!check_vio_status(ctx, vio_idx))
+		return false;
+
+	shift_bit = get_shift_group(ctx, vio_idx);
+
+	if (sync_vio_dbg(ctx, shift_bit))
+		return false;
+
+	devapc_extract_vio_dbg(ctx);
+
+	return true;
+}
+
+/*
+ * devapc_violation_irq - the devapc Interrupt Service Routine (ISR) will dump
+ *                        violation information including which master violates
+ *                        access slave.
+ */
+static irqreturn_t devapc_violation_irq(int irq_number,
+					struct mtk_devapc_context *ctx)
+{
+	u32 vio_idx;
+
+	for (vio_idx = 0; vio_idx < ctx->vio_idx_num; vio_idx++) {
+		if (!mtk_devapc_dump_vio_dbg(ctx, vio_idx))
+			continue;
+
+		/* Ensure that violation info are written before
+		 * further operations
+		 */
+		smp_mb();
+
+		/*
+		 * Mask slave's irq before clearing vio status.
+		 * Must do it to avoid nested interrupt and prevent
+		 * unexpected behavior.
+		 */
+		mask_module_irq(ctx, vio_idx, true);
+
+		clear_vio_status(ctx, vio_idx);
+
+		mask_module_irq(ctx, vio_idx, false);
+	}
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * start_devapc - initialize devapc status and start receiving interrupt
+ *                while devapc violation is triggered.
+ */
+static int start_devapc(struct mtk_devapc_context *ctx)
+{
+	void __iomem *pd_vio_shift_sta_reg;
+	void __iomem *pd_apc_con_reg;
+	u32 vio_shift_sta;
+	u32 vio_idx;
+
+	pd_apc_con_reg = ctx->devapc_pd_base + ctx->offset->apc_con;
+	pd_vio_shift_sta_reg = ctx->devapc_pd_base + ctx->offset->vio_shift_sta;
+	if (!pd_apc_con_reg || !pd_vio_shift_sta_reg)
+		return -EINVAL;
+
+	/* Clear devapc violation status */
+	writel(BIT(31), pd_apc_con_reg);
+
+	/* Clear violation shift status */
+	vio_shift_sta = readl(pd_vio_shift_sta_reg);
+	if (vio_shift_sta)
+		writel(vio_shift_sta, pd_vio_shift_sta_reg);
+
+	/* Clear slave violation status */
+	for (vio_idx = 0; vio_idx < ctx->vio_idx_num; vio_idx++) {
+		clear_vio_status(ctx, vio_idx);
+		mask_module_irq(ctx, vio_idx, false);
+	}
+
+	return 0;
+}
+
+static const struct mtk_devapc_pd_offset mt6779_pd_offset = {
+	.vio_mask = 0x0,
+	.vio_sta = 0x400,
+	.vio_dbg0 = 0x900,
+	.vio_dbg1 = 0x904,
+	.apc_con = 0xF00,
+	.vio_shift_sta = 0xF10,
+	.vio_shift_sel = 0xF14,
+	.vio_shift_con = 0xF20,
+};
+
+static const struct mtk_devapc_vio_dbgs mt6779_vio_dbgs = {
+	.mstid =  {0x0000FFFF, 0x0},
+	.dmnid =  {0x003F0000, 0x10},
+	.vio_w =  {0x00400000, 0x16},
+	.vio_r =  {0x00800000, 0x17},
+	.addr_h = {0x0F000000, 0x18},
+};
+
+static const struct mtk_devapc_context devapc_mt6779 = {
+	.vio_idx_num = 510,
+	.offset = &mt6779_pd_offset,
+	.vio_dbgs = &mt6779_vio_dbgs,
+};
+
+static const struct of_device_id mtk_devapc_dt_match[] = {
+	{
+		.compatible = "mediatek,mt6779-devapc",
+		.data = &devapc_mt6779,
+	}, {
+	},
+};
+
+static int mtk_devapc_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct mtk_devapc_context *ctx;
+	struct clk *devapc_infra_clk;
+	u32 devapc_irq;
+	int ret;
+
+	if (IS_ERR(node))
+		return -ENODEV;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx = (struct mtk_devapc_context *)of_device_get_match_data(&pdev->dev);
+	ctx->dev = &pdev->dev;
+
+	ctx->vio_info = devm_kzalloc(&pdev->dev,
+				     sizeof(struct mtk_devapc_vio_info),
+				     GFP_KERNEL);
+	if (!ctx->vio_info)
+		return -ENOMEM;
+
+	ctx->devapc_pd_base = of_iomap(node, 0);
+	if (!ctx->devapc_pd_base)
+		return -EINVAL;
+
+	devapc_irq = irq_of_parse_and_map(node, 0);
+	if (!devapc_irq)
+		return -EINVAL;
+
+	devapc_infra_clk = devm_clk_get(&pdev->dev, "devapc-infra-clock");
+	if (IS_ERR(devapc_infra_clk))
+		return -EINVAL;
+
+	if (clk_prepare_enable(devapc_infra_clk))
+		return -EINVAL;
+
+	ret = start_devapc(ctx);
+	if (ret)
+		return ret;
+
+	ret = devm_request_irq(&pdev->dev, devapc_irq,
+			       (irq_handler_t)devapc_violation_irq,
+			       IRQF_TRIGGER_NONE, "devapc", ctx);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mtk_devapc_remove(struct platform_device *dev)
+{
+	return 0;
+}
+
+static struct platform_driver mtk_devapc_driver = {
+	.probe = mtk_devapc_probe,
+	.remove = mtk_devapc_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = mtk_devapc_dt_match,
+	},
+};
+
+module_platform_driver(mtk_devapc_driver);
+
+MODULE_DESCRIPTION("Mediatek Device APC Driver");
+MODULE_AUTHOR("Neal Liu <neal.liu@mediatek.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/mediatek/mtk-devapc.h b/drivers/soc/mediatek/mtk-devapc.h
new file mode 100644
index 0000000..7bd7e66
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-devapc.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+
+#ifndef __MTK_DEVAPC_H__
+#define __MTK_DEVAPC_H__
+
+#define VIO_MOD_TO_REG_IND(m)	((m) / 32)
+#define VIO_MOD_TO_REG_OFF(m)	((m) % 32)
+
+struct mtk_devapc_pd_offset {
+	u32 vio_mask;
+	u32 vio_sta;
+	u32 vio_dbg0;
+	u32 vio_dbg1;
+	u32 apc_con;
+	u32 vio_shift_sta;
+	u32 vio_shift_sel;
+	u32 vio_shift_con;
+};
+
+struct mtk_devapc_vio_dbgs_desc {
+	u32 mask;
+	u32 start;
+};
+
+struct mtk_devapc_vio_dbgs {
+	struct mtk_devapc_vio_dbgs_desc mstid;
+	struct mtk_devapc_vio_dbgs_desc dmnid;
+	struct mtk_devapc_vio_dbgs_desc vio_w;
+	struct mtk_devapc_vio_dbgs_desc vio_r;
+	struct mtk_devapc_vio_dbgs_desc addr_h;
+};
+
+struct mtk_devapc_vio_info {
+	bool read;
+	bool write;
+	u32 vio_addr;
+	u32 vio_addr_high;
+	u32 master_id;
+	u32 domain_id;
+};
+
+struct mtk_devapc_context {
+	struct device *dev;
+	u32 vio_idx_num;
+	void __iomem *devapc_pd_base;
+	struct mtk_devapc_vio_info *vio_info;
+	const struct mtk_devapc_pd_offset *offset;
+	const struct mtk_devapc_vio_dbgs *vio_dbgs;
+};
+
+#endif /* __MTK_DEVAPC_H__ */
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
