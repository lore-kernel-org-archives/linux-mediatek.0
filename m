Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318CCC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FuoQTvQgmXE1hb2sh7533FbKajPgelX54NR+X+WeyXE=; b=cxuPL5DMZrUzMd
	TPlD9U+tCSChNaSvlZwdU9XGr4s1NkBLV+QBTb/0Yti7Fudmq6iw3p7nOjbV1R8/5Uo8wSKy0G4TN
	W+pTq3MeUyQotaPId3C3q+atyOG/rJrjUqhQ/0GwNF/o+uq8WseTsHK1BDCTa0MlR2jbB9gF/iEzW
	TTYZzOiF7/yy+f5q4vW1Y3c4FuDraCicm0qXoHo+7us+pOErUyahnU5vKuuIT+UR1SJpHy1/xWvPM
	od6tEC9DrBqLfikqacVFIGltIlAZM12zaRrMr1TpVpt3hc/ZWQM2SdXAI/1yBWgTgXdpnNSg9/5kP
	xEKYmhXZ/mvNKq0hv2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXiv-009jzD-Qt; Fri, 26 Nov 2021 09:40:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXiW-009jtP-Gn; Fri, 26 Nov 2021 09:40:31 +0000
X-UUID: 5423ae9a35644ffd864aa5e0247f2569-20211126
X-UUID: 5423ae9a35644ffd864aa5e0247f2569-20211126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 171833384; Fri, 26 Nov 2021 02:40:23 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 01:30:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 26 Nov 2021 17:30:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Nov 2021 17:30:26 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v6 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Date: Fri, 26 Nov 2021 17:30:21 +0800
Message-ID: <20211126093021.25462-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211126093021.25462-1-allen-kh.cheng@mediatek.com>
References: <20211126093021.25462-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_014028_574864_2C184CDD 
X-CRM114-Status: GOOD (  22.92  )
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

This patch is to for MediaTek ADSP IPC mailbox controller driver
It is used to send short messages between processors with adsp

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 drivers/mailbox/Kconfig            |   7 ++
 drivers/mailbox/Makefile           |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c | 178 +++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index c9fc06c7e685..c44a0102585d 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -226,6 +226,13 @@ config STM32_IPCC
 	  with hardware for Inter-Processor Communication Controller (IPCC)
 	  between processors. Say Y here if you want to have this support.
 
+config MTK_ADSP_IPC_MBOX
+	tristate "MediaTek ADSP Mailbox Controller"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Say yes here to add support for MediaTek ADSP IPC mailbox controller
+	  driver. It is used to send short messages between processors with dsp.
+
 config MTK_CMDQ_MBOX
 	tristate "MediaTek CMDQ Mailbox Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index c2089f04887e..13d5c81852ca 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -49,6 +49,8 @@ obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
 
 obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
+obj-$(CONFIG_MTK_ADSP_IPC_MBOX)	+= mtk-adsp-mailbox.o
+
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
new file mode 100644
index 000000000000..8928bb3874c4
--- /dev/null
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -0,0 +1,178 @@
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
+	void __iomem *va_mboxreg;
+};
+
+static irqreturn_t mtk_adsp_ipc_irq_handler(int irq, void *data)
+{
+	struct mbox_chan *ch = data;
+	struct adsp_mbox_ch_info *ch_info = ch->con_priv;
+	void __iomem *reg = ch_info->va_reg;
+	u32 op = readl(reg + MTK_ADSP_MBOX_OUT_CMD);
+
+	writel(op, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mtk_adsp_ipc_handler(int irq, void *data)
+{
+	struct mbox_chan *ch = data;
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
+	void __iomem *reg = ch_info->va_reg;
+
+	/* Clear DSP mbox command */
+	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
+	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
+
+	return 0;
+}
+
+static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	void __iomem *reg = ch_info->va_reg;
+
+	/* Clear DSP mbox command */
+	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
+	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
+	chan->con_priv = NULL;
+}
+
+static int mtk_adsp_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	void __iomem *reg = ch_info->va_reg;
+
+	writel(ch_info->ipc_op_val, reg + MTK_ADSP_MBOX_IN_CMD);
+
+	return 0;
+}
+
+static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	void __iomem *reg = ch_info->va_reg;
+
+	return readl(reg + MTK_ADSP_MBOX_IN_CMD) == 0;
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
+	struct adsp_mbox_ch_info *ch_info;
+	int ret;
+	int irq;
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
+	mbox->num_chans = 1;
+	mbox->chans = devm_kzalloc(mbox->dev, sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->va_mboxreg))
+		return PTR_ERR(priv->va_mboxreg);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(dev, irq,
+					mtk_adsp_ipc_irq_handler, mtk_adsp_ipc_handler,
+					IRQF_TRIGGER_NONE, dev_name(dev),
+					mbox->chans);
+	if (ret < 0)
+		return ret;
+
+	/* set adsp mbox channel info */
+	ch_info = devm_kzalloc(dev, sizeof(*ch_info), GFP_KERNEL);
+	if (!ch_info)
+		return -ENOMEM;
+
+	ch_info->va_reg = priv->va_mboxreg;
+	mbox->chans->con_priv = ch_info;
+	platform_set_drvdata(pdev, priv);
+
+	return devm_mbox_controller_register(dev, &priv->mbox);
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
