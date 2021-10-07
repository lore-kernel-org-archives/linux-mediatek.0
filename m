Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18192C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 12:42:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4758610E6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 12:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4758610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o6hVU4imgF6W7c1XBCrttyN0MtavqPaSEJr2KmEt9aE=; b=Ss2jYQwqKnvVFY
	ybhQZVxWZA3MwIw71mMSIPC8oChkqVYyMAunG6y81m+oQqx58+gR5QRvZUEGAIuYHbxh0dswbbn94
	HegjnETqO0SMizsEMfSFQKMoeNcOmaGxRA155CZLEIgfQ4pLcWMRRcIlUUL0rKfwHqnFz25YKwkT8
	/Uf8Bh+6s74HowjABFfBSnDV3cn32dKqMh/jaFMkQZxXIidOFNg25N4LB1eOMzv+SWDklzCLp9F28
	InDN8z8MDxxpYQHG1DugMvM7pTegOXAap1uf7NCsRucQNIWm1/ZIFeezg2J/JU+y7UPcnyCLJCVWV
	G7dNcLzGcj17ddVTuX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSj1-00HJrf-EU; Thu, 07 Oct 2021 12:42:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSix-00HJq6-5x; Thu, 07 Oct 2021 12:42:14 +0000
X-UUID: 9cf16a0199c5436c88399957f0788cb5-20211007
X-UUID: 9cf16a0199c5436c88399957f0788cb5-20211007
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 653606710; Thu, 07 Oct 2021 05:42:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 05:32:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Oct 2021 20:32:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Oct 2021 20:32:02 +0800
From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH] mailbox: mediatek: add support for dsp ipc
Date: Thu, 7 Oct 2021 20:32:00 +0800
Message-ID: <20211007123200.16857-1-Allen-KH.Cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_054211_261375_00A1E0CE 
X-CRM114-Status: GOOD (  24.84  )
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

This patch is for Mediatek DSP IPC which allows applications
implement communication using mbox.

Two mailboxes used to send notification or short message
between processors with dsp

mbox0 is for ipc request.
mbox1 is for ipc reply.

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 drivers/mailbox/Kconfig            |  10 ++
 drivers/mailbox/Makefile           |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c | 209 +++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index c9fc06c7e685..4435af555b63 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -236,6 +236,16 @@ config MTK_CMDQ_MBOX
 	  critical time limitation, such as updating display configuration
 	  during the vblank.
 
+config MTK_ADSP_IPC_MBOX
+	tristate "MediaTek ADSP Mailbox Support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Say yes here to add support for ADSP IPC mailbox driver.
+	  This mailbox driver is used to send notification or short message
+	  between processors with dsp. It will place the
+	  message to the share buffer and will access the ADSP mailbox
+	  registers to kick dsp.
+
 config ZYNQMP_IPI_MBOX
 	bool "Xilinx ZynqMP IPI Mailbox"
 	depends on ARCH_ZYNQMP && OF
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index c2089f04887e..479a9ae56d5e 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -51,6 +51,8 @@ obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
+obj-$(CONFIG_MTK_ADSP_IPC_MBOX)	+= mtk-adsp-mailbox.o
+
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
new file mode 100644
index 000000000000..120e1be39118
--- /dev/null
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Corporation. All rights reserved.
+ * Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+ */
+
+#include <linux/firmware/mediatek/mtk-adsp-ipc.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+/* adsp mbox register offset */
+#define MTK_ADSP_MBOX_IN_CMD 0x00
+#define MTK_ADSP_MBOX_IN_CMD_CLR 0x04
+#define MTK_ADSP_MBOX_OUT_CMD 0x1c
+#define MTK_ADSP_MBOX_OUT_CMD_CLR 0x20
+#define MTK_ADSP_MBOX_IN_MSG0 0x08
+#define MTK_ADSP_MBOX_IN_MSG1 0x0C
+#define MTK_ADSP_MBOX_OUT_MSG0 0x24
+#define MTK_ADSP_MBOX_OUT_MSG1 0x28
+
+struct mtk_adsp_mbox_priv {
+	struct device *dev;
+	struct mbox_controller mbox;
+	phys_addr_t pa_mboxreg[MTK_ADSP_MBOX_NUM];
+	void __iomem *va_mboxreg[MTK_ADSP_MBOX_NUM];
+};
+
+static irqreturn_t mtk_adsp_ipc_irq_handler(int irq, void *data)
+{
+	struct mbox_chan *ch = (struct mbox_chan *)data;
+	struct adsp_mbox_ch_info *ch_info = ch->con_priv;
+	void __iomem *reg = ch_info->va_reg[ch_info->id];
+	u32 op = readl(reg + MTK_ADSP_MBOX_OUT_CMD);
+
+	writel(op, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mtk_adsp_ipc_handler(int irq, void *data)
+{
+	struct mbox_chan *ch = (struct mbox_chan *)data;
+	struct adsp_mbox_ch_info *ch_info = ch->con_priv;
+
+	mbox_chan_received_data(ch, ch_info);
+
+	return IRQ_HANDLED;
+}
+
+static struct mbox_chan *mtk_adsp_mbox_xlate(struct mbox_controller *mbox,
+					     const struct of_phandle_args *sp)
+{
+	return &mbox->chans[sp->args[0]];
+}
+
+static int mtk_adsp_mbox_startup(struct mbox_chan *chan)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	struct platform_device *pdev;
+	struct device *dev = chan->mbox->dev;
+	char *name;
+	int ret;
+	int irq;
+
+	pdev = container_of(dev, struct platform_device, dev);
+	name = kasprintf(GFP_KERNEL, "irq_mbox%d", ch_info->id);
+	if (!name) {
+		dev_err(dev, "mtk adsp mbox startup mbox%d %s\n", ch_info->id, name);
+		return -ENOMEM;
+	}
+
+	irq = platform_get_irq_byname(pdev, name);
+	if (irq < 0) {
+		dev_err(dev, "Failed to get ipc irq\n");
+		ret = -ENODEV;
+		goto err_name_free;
+	}
+
+	ret = devm_request_threaded_irq(dev, irq,
+					mtk_adsp_ipc_irq_handler, mtk_adsp_ipc_handler,
+					IRQF_TRIGGER_NONE, name,
+					chan);
+	if (ret < 0)
+		dev_err(dev, "failed to request irq %d\n", irq);
+
+err_name_free:
+	kfree(name);
+	return ret;
+}
+
+static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
+{
+	chan->con_priv = NULL;
+}
+
+static int mtk_adsp_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	void __iomem *reg = ch_info->va_reg[ch_info->id];
+
+	spin_lock(&ch_info->lock);
+	writel(ch_info->ipc_op_val, reg + MTK_ADSP_MBOX_IN_CMD);
+	spin_unlock(&ch_info->lock);
+
+	return 0;
+}
+
+static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	u32 id = ch_info->id;
+	void __iomem *reg = ch_info->va_reg[id];
+	u32 op = readl(reg + MTK_ADSP_MBOX_IN_CMD);
+
+	return (op == 0) ? true : false;
+}
+
+static const struct mbox_chan_ops adsp_mbox_chan_ops = {
+	.send_data	= mtk_adsp_mbox_send_data,
+	.startup	= mtk_adsp_mbox_startup,
+	.shutdown	= mtk_adsp_mbox_shutdown,
+	.last_tx_done	= mtk_adsp_mbox_last_tx_done,
+};
+
+static int mtk_adsp_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mbox_controller *mbox;
+	struct mtk_adsp_mbox_priv *priv;
+	struct resource *res;
+	char *name;
+	int ret;
+	int i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mbox = &priv->mbox;
+	mbox->dev = dev;
+	mbox->ops = &adsp_mbox_chan_ops;
+	mbox->txdone_irq = false;
+	mbox->txdone_poll = true;
+	mbox->of_xlate = mtk_adsp_mbox_xlate;
+	mbox->num_chans = MTK_ADSP_MBOX_NUM;
+	mbox->chans = devm_kcalloc(mbox->dev, mbox->num_chans,
+				   sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	for (i = 0; i < mbox->num_chans; i++) {
+		struct adsp_mbox_ch_info *ch_info;
+
+		name = kasprintf(GFP_KERNEL, "reg_mbox%d", i);
+		/* parse adsp mbox base */
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+		if (!res) {
+			dev_err(dev, "no MBOX resource %s\n", name);
+			return -ENXIO;
+		}
+
+		priv->pa_mboxreg[i] = (phys_addr_t)res->start;
+		priv->va_mboxreg[i] = devm_ioremap_resource(dev, res);
+		if (IS_ERR(priv->va_mboxreg[i]))
+			return PTR_ERR(priv->va_mboxreg[i]);
+
+		/* set adsp mbox channel info */
+		ch_info = devm_kzalloc(mbox->dev, sizeof(*ch_info), GFP_KERNEL);
+		if (!ch_info)
+			return -ENOMEM;
+
+		spin_lock_init(&ch_info->lock);
+		ch_info->id = i;
+		ch_info->va_reg[i] = priv->va_mboxreg[i];
+		mbox->chans[i].con_priv = ch_info;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	ret = devm_mbox_controller_register(dev, &priv->mbox);
+	if (ret < 0)
+		dev_err(dev, "error: failed to register mailbox:%d\n", ret);
+
+	return ret;
+}
+
+static const struct of_device_id mtk_adsp_mbox_of_match[] = {
+	{ .compatible = "mediatek,mt8195-adsp-mbox", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_adsp_mbox_of_match);
+
+static struct platform_driver mtk_adsp_ipc_mbox_driver = {
+	.probe		= mtk_adsp_mbox_probe,
+	.driver = {
+		.name	= "mtk_adsp_mbox",
+		.of_match_table = mtk_adsp_mbox_of_match,
+	},
+};
+module_platform_driver(mtk_adsp_ipc_mbox_driver);
+
+MODULE_AUTHOR("Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>");
+MODULE_DESCRIPTION("MTK ADSP mailbox IPC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
