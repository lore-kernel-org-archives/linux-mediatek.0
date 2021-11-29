Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACA6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrCS7NX9yF0bUtAALQa5SsGPj7V6fy3HePScBDr5cFI=; b=eN/YLaWTtetnhp
	Y8YYbdQvuEUruvjbJPXMQ9XtsbYEhnWPx5FldIzWCjFG0eCT3v+Vao9J4/QqZMnoxS9z0shmq2OWi
	VVz1c9/HpgMQ48R84pq9hRSaSKCvekxXL5My98R/E+5WgfnaykhUIE+/T98lMrzLLw6/8jPs17RgO
	2zPSC0vIwur7nuRbqeV0VxAfRiAbBfbFXqv7RhfB9S/o0ZDS9mpkShiGu6QCcQZ0dO8JGhdO64Mcw
	WLJkNQYzr7qDIrgmgGfBJCiK3asmC+2rYtXU+N+1VXIJcxH/I9d8UvU1LvRCr36uaPkqjEa2sd0lc
	uqJcpYX5j56enpvZ+4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mraLJ-00HTLW-M9; Mon, 29 Nov 2021 06:40:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mraKm-00HTBM-99; Mon, 29 Nov 2021 06:40:18 +0000
X-UUID: c2db93f6f7874725baabf5943210294c-20211128
X-UUID: c2db93f6f7874725baabf5943210294c-20211128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1737889655; Sun, 28 Nov 2021 23:40:11 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 22:40:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Nov 2021 14:40:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 14:40:08 +0800
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
Subject: [PATCH v7 2/3] firmware: mediatek: add adsp ipc protocol interface
Date: Mon, 29 Nov 2021 14:39:53 +0800
Message-ID: <20211129063954.1616-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
References: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_224016_374784_5D826C3E 
X-CRM114-Status: GOOD (  26.07  )
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

Some of mediatek processors contain
the Tensilica HiFix DSP for audio processing.

The communication between Host CPU and DSP firmware is
taking place using a shared memory area for message passing.

ADSP IPC protocol offers (send/recv) interfaces using
mediatek-mailbox APIs.

We use two mbox channels to implement a request-reply protocol.

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mediatek/Kconfig             |   9 ++
 drivers/firmware/mediatek/Makefile            |   2 +
 drivers/firmware/mediatek/mtk-adsp-ipc.c      | 138 ++++++++++++++++++
 .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  70 +++++++++
 6 files changed, 221 insertions(+)
 create mode 100644 drivers/firmware/mediatek/Kconfig
 create mode 100644 drivers/firmware/mediatek/Makefile
 create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
 create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 220a58cf0a44..005f76a9a31a 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -301,6 +301,7 @@ source "drivers/firmware/broadcom/Kconfig"
 source "drivers/firmware/google/Kconfig"
 source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"
+source "drivers/firmware/mediatek/Kconfig"
 source "drivers/firmware/meson/Kconfig"
 source "drivers/firmware/psci/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 5ced0673d94b..c0d1f3bdeae4 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
 obj-$(CONFIG_EFI)		+= efi/
 obj-$(CONFIG_UEFI_CPER)		+= efi/
 obj-y				+= imx/
+obj-y				+= mediatek/
 obj-y				+= psci/
 obj-y				+= smccc/
 obj-y				+= tegra/
diff --git a/drivers/firmware/mediatek/Kconfig b/drivers/firmware/mediatek/Kconfig
new file mode 100644
index 000000000000..5588af455ad1
--- /dev/null
+++ b/drivers/firmware/mediatek/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config MTK_ADSP_IPC
+	tristate "MTK ADSP IPC Protocol driver"
+	depends on MTK_ADSP_MBOX
+	help
+	  Say yes here to add support for the MediaTek ADSP IPC protocol
+	  between host AP (Linux) and the firmware running on ADSP.
+	  ADSP exists on some mtk processors.
+	  Client might use shared memory to exchange information with ADSP side.
diff --git a/drivers/firmware/mediatek/Makefile b/drivers/firmware/mediatek/Makefile
new file mode 100644
index 000000000000..4e840b65650d
--- /dev/null
+++ b/drivers/firmware/mediatek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_MTK_ADSP_IPC)		+= mtk-adsp-ipc.o
diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
new file mode 100644
index 000000000000..33c28f3fbb1a
--- /dev/null
+++ b/drivers/firmware/mediatek/mtk-adsp-ipc.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Corporation. All rights reserved.
+ * Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+ */
+
+#include <linux/firmware/mediatek/mtk-adsp-ipc.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+int adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t op)
+{
+	struct mtk_adsp_chan *dsp_chan;
+	struct adsp_mbox_ch_info *ch_info;
+	int ret;
+
+	if (idx >= MTK_ADSP_MBOX_NUM)
+		return -EINVAL;
+
+	dsp_chan = &ipc->chans[idx];
+	ch_info = dsp_chan->ch->con_priv;
+	ch_info->ipc_op_val = op;
+	ret = mbox_send_message(dsp_chan->ch, NULL);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(adsp_ipc_send);
+
+static void adsp_ipc_recv(struct mbox_client *c, void *msg)
+{
+	struct mtk_adsp_chan *chan = container_of(c, struct mtk_adsp_chan, cl);
+
+	switch (chan->idx) {
+	case MTK_ADSP_MBOX_REPLY:
+		chan->ipc->ops->handle_reply(chan->ipc);
+		break;
+	case MTK_ADSP_MBOX_REQUEST:
+		chan->ipc->ops->handle_request(chan->ipc);
+		break;
+	default:
+		break;
+	}
+}
+
+static int mtk_adsp_ipc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_adsp_ipc *dsp_ipc;
+	struct mtk_adsp_chan *dsp_chan;
+	struct mbox_client *cl;
+	char *chan_name;
+	int ret;
+	int i, j;
+
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+
+	dsp_ipc = devm_kzalloc(dev, sizeof(*dsp_ipc), GFP_KERNEL);
+	if (!dsp_ipc)
+		return -ENOMEM;
+
+	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
+		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
+		if (!chan_name) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		dsp_chan = &dsp_ipc->chans[i];
+		cl = &dsp_chan->cl;
+		cl->dev = dev->parent;
+		cl->tx_block = false;
+		cl->knows_txdone = false;
+		cl->tx_prepare = NULL;
+		cl->rx_callback = adsp_ipc_recv;
+
+		dsp_chan->ipc = dsp_ipc;
+		dsp_chan->idx = i;
+		dsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
+		if (IS_ERR(dsp_chan->ch)) {
+			ret = PTR_ERR(dsp_chan->ch);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
+					i, ret);
+			goto out;
+		}
+
+		dev_dbg(dev, "request mbox chan %s\n", chan_name);
+		kfree(chan_name);
+	}
+
+	dsp_ipc->dev = dev;
+	dev_set_drvdata(dev, dsp_ipc);
+	dev_dbg(dev, "MTK ADSP IPC initialized\n");
+
+	return 0;
+
+out:
+	kfree(chan_name);
+	for (j = 0; j < i; j++) {
+		dsp_chan = &dsp_ipc->chans[j];
+		mbox_free_channel(dsp_chan->ch);
+	}
+
+	return ret;
+}
+
+static int mtk_adsp_remove(struct platform_device *pdev)
+{
+	struct mtk_adsp_ipc *dsp_ipc = dev_get_drvdata(&pdev->dev);
+	struct mtk_adsp_chan *dsp_chan;
+	int i;
+
+	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
+		dsp_chan = &dsp_ipc->chans[i];
+		mbox_free_channel(dsp_chan->ch);
+	}
+
+	return 0;
+}
+
+static struct platform_driver mtk_adsp_ipc_driver = {
+	.driver = {
+		.name = "mtk-adsp-ipc",
+	},
+	.probe = mtk_adsp_ipc_probe,
+	.remove = mtk_adsp_remove,
+};
+builtin_platform_driver(mtk_adsp_ipc_driver);
+
+MODULE_AUTHOR("Allen-KH Cheng <allen-kh.cheng@mediatek.com>");
+MODULE_DESCRIPTION("MTK ADSP IPC protocol driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/firmware/mediatek/mtk-adsp-ipc.h b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
new file mode 100644
index 000000000000..7f0d1c479b92
--- /dev/null
+++ b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef MTK_ADSP_IPC_H
+#define MTK_ADSP_IPC_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox_client.h>
+
+#define MTK_ADSP_IPC_REQ 0
+#define MTK_ADSP_IPC_RSP 1
+#define MTK_ADSP_IPC_OP_REQ 0x1
+#define MTK_ADSP_IPC_OP_RSP 0x2
+
+enum {
+	MTK_ADSP_MBOX_REPLY,
+	MTK_ADSP_MBOX_REQUEST,
+	MTK_ADSP_MBOX_NUM,
+};
+
+struct mtk_adsp_ipc;
+
+struct mtk_adsp_ipc_ops {
+	void (*handle_reply)(struct mtk_adsp_ipc *ipc);
+	void (*handle_request)(struct mtk_adsp_ipc *ipc);
+};
+
+struct mtk_adsp_chan {
+	struct mtk_adsp_ipc *ipc;
+	struct mbox_client cl;
+	struct mbox_chan *ch;
+	char *name;
+	int idx;
+};
+
+struct mtk_adsp_ipc {
+	struct mtk_adsp_chan chans[MTK_ADSP_MBOX_NUM];
+	struct device *dev;
+	struct mtk_adsp_ipc_ops *ops;
+	void *private_data;
+};
+
+struct adsp_mbox_ch_info {
+	u32 ipc_op_val;
+	void __iomem *va_reg;
+};
+
+static inline void adsp_ipc_set_data(struct mtk_adsp_ipc *ipc, void *data)
+{
+	if (!ipc)
+		return;
+
+	ipc->private_data = data;
+}
+
+static inline void *adsp_ipc_get_data(struct mtk_adsp_ipc *ipc)
+{
+	if (!ipc)
+		return NULL;
+
+	return ipc->private_data;
+}
+
+int adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t op);
+
+#endif /* MTK_ADSP_IPC_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
