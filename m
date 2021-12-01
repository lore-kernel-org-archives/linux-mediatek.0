Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA9BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrjCY8/03qOyHf9aaV1hJFHDe6Zb2kCasnxiCPSqlz4=; b=GBLXRSMaRvdI7Y
	/5cQ1+svxWYqusp3tiKK9v4aVlP6NjWsc185mt5CToS79aP6vuUFFN9gblG13rhRfO07HYxxw6ji7
	Yk/j+i82/YLWlrDFu4o6+DsuaFM/CzMXKLpoyD7mqn+vVcYQZjQeyyQvU0bQOsk2i4/NHXBcXWTdP
	8YOfClgL5YT/+M3nytkoWQBzYOr1GW+mxdLQBvCN8aDKEL77VHvfGECKsSNdUp/N3X4YL+pfUZpl+
	rbaDZyJaDSNUSNZrunfFvFpi/nh9w8IsYFgFDPv4+4bpeE44QvzkTEX2WFf3lYuwaiinOB+3rZ1wE
	TiH/61Z+kD+jw9l8lMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msKUI-007jyR-GH; Wed, 01 Dec 2021 07:57:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msKTW-007jh2-Ke; Wed, 01 Dec 2021 07:56:24 +0000
X-UUID: 167d4637c216401ca0a2db531338f436-20211201
X-UUID: 167d4637c216401ca0a2db531338f436-20211201
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 786787048; Wed, 01 Dec 2021 00:56:15 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 23:56:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Dec 2021 15:56:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 15:56:12 +0800
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
Subject: [PATCH v9 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Date: Wed, 1 Dec 2021 15:56:04 +0800
Message-ID: <20211201075604.27864-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211201075604.27864-1-allen-kh.cheng@mediatek.com>
References: <20211201075604.27864-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_235622_725141_8A306164 
X-CRM114-Status: GOOD (  22.87  )
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
 drivers/mailbox/mtk-adsp-mailbox.c | 176 +++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index c9fc06c7e685..6922ffef6036 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -226,6 +226,13 @@ config STM32_IPCC
 	  with hardware for Inter-Processor Communication Controller (IPCC)
 	  between processors. Say Y here if you want to have this support.
 
+config MTK_ADSP_MBOX
+	tristate "MediaTek ADSP Mailbox Controller"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Say yes here to add support for MediaTek ADSP mailbox controller
+	  driver. It is used to send short messages between processors with dsp.
+
 config MTK_CMDQ_MBOX
 	tristate "MediaTek CMDQ Mailbox Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index c2089f04887e..18793e6caa2f 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -49,6 +49,8 @@ obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
 
 obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
+obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o
+
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
new file mode 100644
index 000000000000..b12107bc846a
--- /dev/null
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Corporation. All rights reserved.
+ * Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+struct mtk_adsp_mbox_priv {
+	struct device *dev;
+	struct mbox_controller mbox;
+	void __iomem *va_mboxreg;
+	const struct mtk_adsp_mbox_cfg *cfg;
+};
+
+struct mtk_adsp_mbox_cfg {
+	u32 set_in;
+	u32 set_out;
+	u32 clr_in;
+	u32 clr_out;
+};
+
+static struct mtk_adsp_mbox_priv *get_mtk_adsp_mbox_priv(struct mbox_controller *mbox)
+{
+	return container_of(mbox, struct mtk_adsp_mbox_priv, mbox);
+}
+
+static irqreturn_t mtk_adsp_mbox_irq(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+	u32 op = readl(priv->va_mboxreg + priv->cfg->set_out);
+
+	writel(op, priv->va_mboxreg + priv->cfg->clr_out);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mtk_adsp_mbox_isr(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+
+	mbox_chan_received_data(chan, NULL);
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
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+
+	/* Clear DSP mbox command */
+	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_in);
+	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_out);
+
+	return 0;
+}
+
+static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+
+	/* Clear DSP mbox command */
+	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_in);
+	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_out);
+}
+
+static int mtk_adsp_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+	u32 *msg = data;
+
+	writel(*msg, priv->va_mboxreg + priv->cfg->set_in);
+
+	return 0;
+}
+
+static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+
+	return readl(priv->va_mboxreg + priv->cfg->set_in) == 0;
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
+	struct mtk_adsp_mbox_priv *priv;
+	const struct mtk_adsp_mbox_cfg *cfg;
+	struct mbox_controller *mbox;
+	int ret, irq;
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
+	mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->va_mboxreg))
+		return PTR_ERR(priv->va_mboxreg);
+
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
+		return -EINVAL;
+	priv->cfg = cfg;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(dev, irq, mtk_adsp_mbox_irq,
+					mtk_adsp_mbox_isr, IRQF_TRIGGER_NONE,
+					dev_name(dev), mbox->chans);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+
+	return devm_mbox_controller_register(dev, &priv->mbox);
+}
+
+static const struct mtk_adsp_mbox_cfg mt8195_adsp_mbox_cfg = {
+	.set_in		= 0x00,
+	.set_out	= 0x1c,
+	.clr_in		= 0x04,
+	.clr_out	= 0x20,
+};
+
+static const struct of_device_id mtk_adsp_mbox_of_match[] = {
+	{ .compatible = "mediatek,mt8195-adsp-mbox", .data = &mt8195_adsp_mbox_cfg },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_adsp_mbox_of_match);
+
+static struct platform_driver mtk_adsp_mbox_driver = {
+	.probe		= mtk_adsp_mbox_probe,
+	.driver = {
+		.name	= "mtk_adsp_mbox",
+		.of_match_table = mtk_adsp_mbox_of_match,
+	},
+};
+module_platform_driver(mtk_adsp_mbox_driver);
+
+MODULE_AUTHOR("Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>");
+MODULE_DESCRIPTION("MTK ADSP Mailbox Controller");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
