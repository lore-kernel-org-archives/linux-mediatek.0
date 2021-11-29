Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omMS+tWjEIWG4lHrWIdCY1iG1lqNd7HiYuCGXOy4J8U=; b=um+nGsc6ZayTVb
	iENuKfShjeScSrVySySRAOcxLIgB4mI7hUhrr2GqO9a5yD1MxC1RsZb4e4Kf79ouWN0Rg5O3khQBm
	MZwyYZ4a8q1ER3dWWVrl7GPHwUhjDiGwnVsIv/8PN0lXCcBUMaznofvSFfOfgs7VQGtVH1MfY0VTv
	UacaxKIAVa666u/kTRdUAO9mdWVm81NoKIGwxnpWR11HnijYEY/hmXn1HbtuNYc3RbK2MtrxmJT24
	CiOyif7VXpqCld2QoC/n52Ba7sqtk+iyHJRcAGrUQcoW4/SBVeZPu01r19jVwe3SiC8vad1kf5eBq
	1qtri85Mnj/K0IZNWgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mraLX-00HTSA-FX; Mon, 29 Nov 2021 06:41:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mraKn-00HTBC-W9; Mon, 29 Nov 2021 06:40:19 +0000
X-UUID: e0301c927b624b248bed531dbb0e28b9-20211128
X-UUID: e0301c927b624b248bed531dbb0e28b9-20211128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 483606352; Sun, 28 Nov 2021 23:40:12 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 22:40:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Nov 2021 14:40:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 14:40:09 +0800
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
Subject: [PATCH v7 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Date: Mon, 29 Nov 2021 14:39:54 +0800
Message-ID: <20211129063954.1616-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
References: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_224018_093004_7B3E68FC 
X-CRM114-Status: GOOD (  22.68  )
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

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 drivers/mailbox/Kconfig            |   7 ++
 drivers/mailbox/Makefile           |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c | 175 +++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+)
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index c9fc06c7e685..722fbc93940b 100644
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
index 000000000000..fd8d73689024
--- /dev/null
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -0,0 +1,175 @@
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
+	struct adsp_mbox_ch_info *ch_info;
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
+	ret = devm_request_threaded_irq(dev, irq, mtk_adsp_ipc_irq_handler,
+					mtk_adsp_ipc_handler, IRQF_TRIGGER_NONE,
+					dev_name(dev), mbox->chans);
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
