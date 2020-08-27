Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DECFC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 03:17:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9FC2078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 03:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AdFhhmbP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UGWEtlmN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9FC2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LG9QTcU1+BHsh2SzDDTAKARza06QHVwAQIFKBTvuAIc=; b=AdFhhmbPdc51VSaHZrDSpEwSx
	gI1PLuyIUT/o0DvxkumZ1jBpqDmib5SJP0qn+5fbLaU5FEdDelpT/A4A+Zm4HM9F+YrKuzjM63xg2
	vZTy38u/WeOIkOU+/DHP2gDiIkBrMiUkYss+YX67CcX//pYRkhoWUXk2wIVLRaOtEolC22MImO6xe
	ZvY8TEkXtvQAQOndxxJVlq0neFPzyQRawwRHDFBuqKSzzNfz1VIOsgUJX10eTCDjeH4qxRl0lpOmX
	0WzkfNpaaIr1YDzjjQXIRiRMo/NVGhCBrGXOVcTw5l7zfZl45DIAGv1r/yFLFC4PUkZMJccS8+TPN
	SaQ4eLiaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB8Q2-0002EZ-7N; Thu, 27 Aug 2020 03:17:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB8Pq-0002BR-DV; Thu, 27 Aug 2020 03:17:31 +0000
X-UUID: 1029a9cd6d6f46339685680e5a430125-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BXG5bKpAqIIeUBAgRT7ICu1rDPXIWdPTOOcN/npDdrE=; 
 b=UGWEtlmNU3ZnkuEDmksGe6xbLhymYPrI7ppFEBgIuk5hPx8oaKTriykMcRLYUintvN5GzCgPmZbXl3EJ+O1xLEoKhGUqTlTyBfZvUlVJKQa/DQ025lOOA6rMvB6wDlw91dNPuWnJXyhK0n0lo4nNGnuOAkL+umhLqPBrSo/oMEg=;
X-UUID: 1029a9cd6d6f46339685680e5a430125-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 651511081; Wed, 26 Aug 2020 19:17:11 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 20:07:36 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 11:06:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 27 Aug 2020 11:06:39 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
Date: Thu, 27 Aug 2020 11:06:33 +0800
Message-ID: <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: ACF4E102C31550AC6CAA3F167AE1A913935FE1EDED591538BB9A8C7FE9E4B4912000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_231730_707970_E93FE9D9 
X-CRM114-Status: GOOD (  26.09  )
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
 drivers/soc/mediatek/Kconfig      |    9 ++
 drivers/soc/mediatek/Makefile     |    1 +
 drivers/soc/mediatek/mtk-devapc.c |  305 +++++++++++++++++++++++++++++++++++++
 3 files changed, 315 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-devapc.c

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
index 0000000..0ba61d7
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -0,0 +1,305 @@
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
+
+#define VIO_MOD_TO_REG_IND(m)	((m) / 32)
+#define VIO_MOD_TO_REG_OFF(m)	((m) % 32)
+
+struct mtk_devapc_vio_dbgs {
+	union {
+		u32 vio_dbg0;
+		struct {
+			u32 mstid:16;
+			u32 dmnid:6;
+			u32 vio_w:1;
+			u32 vio_r:1;
+			u32 addr_h:4;
+			u32 resv:4;
+		} dbg0_bits;
+	};
+
+	u32 vio_dbg1;
+};
+
+struct mtk_devapc_data {
+	u32 vio_idx_num;
+	u32 vio_mask_offset;
+	u32 vio_sta_offset;
+	u32 vio_dbg0_offset;
+	u32 vio_dbg1_offset;
+	u32 apc_con_offset;
+	u32 vio_shift_sta_offset;
+	u32 vio_shift_sel_offset;
+	u32 vio_shift_con_offset;
+};
+
+struct mtk_devapc_context {
+	struct device *dev;
+	void __iomem *infra_base;
+	struct clk *infra_clk;
+	const struct mtk_devapc_data *data;
+};
+
+static void clear_vio_status(struct mtk_devapc_context *ctx)
+{
+	void __iomem *reg;
+	int i;
+
+	reg = ctx->infra_base + ctx->data->vio_sta_offset;
+
+	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num - 1); i++)
+		writel(GENMASK(31, 0), reg + 4 * i);
+
+	writel(GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1), 0),
+	       reg + 4 * i);
+}
+
+static void mask_module_irq(struct mtk_devapc_context *ctx, bool mask)
+{
+	void __iomem *reg;
+	u32 val;
+	int i;
+
+	reg = ctx->infra_base + ctx->data->vio_mask_offset;
+
+	if (mask)
+		val = GENMASK(31, 0);
+	else
+		val = 0;
+
+	for (i = 0; i < VIO_MOD_TO_REG_IND(ctx->data->vio_idx_num - 1); i++)
+		writel(val, reg + 4 * i);
+
+	val = readl(reg + 4 * i);
+	if (mask)
+		val |= GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1),
+			       0);
+	else
+		val &= ~GENMASK(VIO_MOD_TO_REG_OFF(ctx->data->vio_idx_num - 1),
+				0);
+
+	writel(val, reg + 4 * i);
+}
+
+#define PHY_DEVAPC_TIMEOUT	0x10000
+
+/*
+ * devapc_sync_vio_dbg - do "shift" mechansim" to get full violation information.
+ *                       shift mechanism is depends on devapc hardware design.
+ *                       Mediatek devapc set multiple slaves as a group.
+ *                       When violation is triggered, violation info is kept
+ *                       inside devapc hardware.
+ *                       Driver should do shift mechansim to sync full violation
+ *                       info to VIO_DBGs registers.
+ *
+ */
+static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
+{
+	void __iomem *pd_vio_shift_sta_reg;
+	void __iomem *pd_vio_shift_sel_reg;
+	void __iomem *pd_vio_shift_con_reg;
+	int min_shift_group;
+	int ret;
+	u32 val;
+
+	pd_vio_shift_sta_reg = ctx->infra_base +
+			       ctx->data->vio_shift_sta_offset;
+	pd_vio_shift_sel_reg = ctx->infra_base +
+			       ctx->data->vio_shift_sel_offset;
+	pd_vio_shift_con_reg = ctx->infra_base +
+			       ctx->data->vio_shift_con_offset;
+
+	/* Find the minimum shift group which has violation */
+	val = readl(pd_vio_shift_sta_reg);
+	if (!val)
+		return false;
+
+	min_shift_group = __ffs(val);
+
+	/* Assign the group to sync */
+	writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
+
+	/* Start syncing */
+	writel(0x1, pd_vio_shift_con_reg);
+
+	ret = readl_poll_timeout(pd_vio_shift_con_reg, val, val == 0x3, 0,
+				 PHY_DEVAPC_TIMEOUT);
+	if (ret) {
+		dev_err(ctx->dev, "%s: Shift violation info failed\n", __func__);
+		return false;
+	}
+
+	/* Stop syncing */
+	writel(0x0, pd_vio_shift_con_reg);
+
+	/* Write clear */
+	writel(0x1 << min_shift_group, pd_vio_shift_sta_reg);
+
+	return true;
+}
+
+/*
+ * devapc_extract_vio_dbg - extract full violation information after doing
+ *                          shift mechanism.
+ */
+static void devapc_extract_vio_dbg(struct mtk_devapc_context *ctx)
+{
+	struct mtk_devapc_vio_dbgs vio_dbgs;
+	void __iomem *vio_dbg0_reg;
+	void __iomem *vio_dbg1_reg;
+
+	vio_dbg0_reg = ctx->infra_base + ctx->data->vio_dbg0_offset;
+	vio_dbg1_reg = ctx->infra_base + ctx->data->vio_dbg1_offset;
+
+	vio_dbgs.vio_dbg0 = readl(vio_dbg0_reg);
+	vio_dbgs.vio_dbg1 = readl(vio_dbg1_reg);
+
+	/* Print violation information */
+	if (vio_dbgs.dbg0_bits.vio_w)
+		dev_info(ctx->dev, "Write Violation\n");
+	else if (vio_dbgs.dbg0_bits.vio_r)
+		dev_info(ctx->dev, "Read Violation\n");
+
+	dev_info(ctx->dev, "Bus ID:0x%x, Dom ID:0x%x, Vio Addr:0x%x\n",
+		 vio_dbgs.dbg0_bits.mstid, vio_dbgs.dbg0_bits.dmnid,
+		 vio_dbgs.vio_dbg1);
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
+	while (devapc_sync_vio_dbg(ctx))
+		devapc_extract_vio_dbg(ctx);
+
+	clear_vio_status(ctx);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * start_devapc - unmask slave's irq to start receiving devapc violation.
+ */
+static void start_devapc(struct mtk_devapc_context *ctx)
+{
+	writel(BIT(31), ctx->infra_base + ctx->data->apc_con_offset);
+
+	mask_module_irq(ctx, false);
+}
+
+/*
+ * stop_devapc - mask slave's irq to stop service.
+ */
+static void stop_devapc(struct mtk_devapc_context *ctx)
+{
+	mask_module_irq(ctx, true);
+
+	writel(BIT(2), ctx->infra_base + ctx->data->apc_con_offset);
+}
+
+static const struct mtk_devapc_data devapc_mt6779 = {
+	.vio_idx_num = 511,
+	.vio_mask_offset = 0x0,
+	.vio_sta_offset = 0x400,
+	.vio_dbg0_offset = 0x900,
+	.vio_dbg1_offset = 0x904,
+	.apc_con_offset = 0xF00,
+	.vio_shift_sta_offset = 0xF10,
+	.vio_shift_sel_offset = 0xF14,
+	.vio_shift_con_offset = 0xF20,
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
+	ctx->data = of_device_get_match_data(&pdev->dev);
+	ctx->dev = &pdev->dev;
+
+	ctx->infra_base = of_iomap(node, 0);
+	if (!ctx->infra_base)
+		return -EINVAL;
+
+	devapc_irq = irq_of_parse_and_map(node, 0);
+	if (!devapc_irq)
+		return -EINVAL;
+
+	ctx->infra_clk = devm_clk_get(&pdev->dev, "devapc-infra-clock");
+	if (IS_ERR(ctx->infra_clk))
+		return -EINVAL;
+
+	if (clk_prepare_enable(ctx->infra_clk))
+		return -EINVAL;
+
+	ret = devm_request_irq(&pdev->dev, devapc_irq,
+			       (irq_handler_t)devapc_violation_irq,
+			       IRQF_TRIGGER_NONE, "devapc", ctx);
+	if (ret) {
+		clk_disable_unprepare(ctx->infra_clk);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, ctx);
+
+	start_devapc(ctx);
+
+	return 0;
+}
+
+static int mtk_devapc_remove(struct platform_device *pdev)
+{
+	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
+
+	stop_devapc(ctx);
+
+	clk_disable_unprepare(ctx->infra_clk);
+
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
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
