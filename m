Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD89C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 08:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3QLyZWVrd1766svQJ7h7hsX0PiMou7pmoKG/5mZx2U=; b=cE5ugu3cZkNFtm
	MVzLsSX0EDDo1gPF7668sa+Q30wVG/rspJlcDYXXt9T6Mi6L4tio7TC+j8a+MWmvUcCqRMajlLoHC
	nlr3y6ISYNbZV+LsgoCnDnWHXCQty/F38+dNNiB2icoAPQpy1izd6poHP4SwaULU19JtNgl9jmoub
	oyrZ1/b6jC+gvit33FBJqDQXJHWkf3uG+l0k++XfYBM3XFYLGxGM8FV1eMpj2mj7X984eTCk8DwaL
	cTESDAp15qclCYrkNPrfpyLNbgFJ4kfXf2uc+bn+IhZ9PXq+05RKiLk/FMw5LpOImGFBg0yilSRPn
	66pGjj4A3XAi6Y7+J3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np46C-00Avid-HI; Thu, 12 May 2022 08:23:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np45k-00AvXh-CQ; Thu, 12 May 2022 08:22:38 +0000
X-UUID: dc4c4541e518464587369b87d84e744a-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:679f6cd1-db53-48bd-8c0d-69ce28e34c08, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:8075f4f1-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: dc4c4541e518464587369b87d84e744a-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1190208273; Thu, 12 May 2022 01:22:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 01:22:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 16:22:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 12 May 2022 16:22:26 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Javier Martinez Canillas <javierm@redhat.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Michal Suchanek <msuchanek@suse.de>, Shuai Xue
 <xueshuai@linux.alibaba.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Marussi <cristian.marussi@arm.com>, TingHan Shen
 <tinghan.shen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz
 <john.stultz@linaro.org>, Curtis Malainey <cujomalainey@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, YC Hung <yc.hung@mediatek.com>, 
 Tzung-Bi Shih <tzungbi@google.com>, Yang Yingliang
 <yangyingliang@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <sound-open-firmware@alsa-project.org>, 
 <alsa-devel@alsa-project.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 1/3] firmware: mediatek: Add adsp ipc protocol interface
Date: Thu, 12 May 2022 16:22:13 +0800
Message-ID: <20220512082215.3018-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220512082215.3018-1-tinghan.shen@mediatek.com>
References: <20220512082215.3018-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_012236_515534_56FB3C22 
X-CRM114-Status: GOOD (  27.35  )
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

From: TingHan Shen <tinghan.shen@mediatek.com>

Some of mediatek processors contain
the Tensilica HiFix DSP for audio processing.

The communication between Host CPU and DSP firmware is
taking place using a shared memory area for message passing.

ADSP IPC protocol offers (send/recv) interfaces using
mediatek-mailbox APIs.

We use two mbox channels to implement a request-reply protocol.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mtk-adsp-ipc.c               | 157 ++++++++++++++++++
 .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 ++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 drivers/firmware/mtk-adsp-ipc.c
 create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index d65964996e8d..b59e3041fd62 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -203,6 +203,15 @@ config INTEL_STRATIX10_RSU
 
 	  Say Y here if you want Intel RSU support.
 
+config MTK_ADSP_IPC
+	tristate "MTK ADSP IPC Protocol driver"
+	depends on MTK_ADSP_MBOX
+	help
+	  Say yes here to add support for the MediaTek ADSP IPC
+	  between host AP (Linux) and the firmware running on ADSP.
+	  ADSP exists on some mtk processors.
+	  Client might use shared memory to exchange information with ADSP.
+
 config QCOM_SCM
 	tristate
 
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4e58cb474a68..1be0e8295222 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_INTEL_STRATIX10_RSU)     += stratix10-rsu.o
 obj-$(CONFIG_ISCSI_IBFT_FIND)	+= iscsi_ibft_find.o
 obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
+obj-$(CONFIG_MTK_ADSP_IPC)	+= mtk-adsp-ipc.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
new file mode 100644
index 000000000000..cb255a99170c
--- /dev/null
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 MediaTek Corporation. All rights reserved.
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
+/*
+ * mtk_adsp_ipc_send - send ipc cmd to MTK ADSP
+ *
+ * @ipc: ADSP IPC handle
+ * @idx: index of the mailbox channel
+ * @msg: IPC cmd (reply or request)
+ *
+ * Returns zero for success from mbox_send_message
+ * negative value for error
+ */
+int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t msg)
+{
+	struct mtk_adsp_chan *adsp_chan;
+	int ret;
+
+	if (idx >= MTK_ADSP_MBOX_NUM)
+		return -EINVAL;
+
+	adsp_chan = &ipc->chans[idx];
+	ret = mbox_send_message(adsp_chan->ch, &msg);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_adsp_ipc_send);
+
+/*
+ * mtk_adsp_ipc_recv - recv callback used by MTK ADSP mailbox
+ *
+ * @c: mbox client
+ * @msg: message received
+ *
+ * Users of ADSP IPC will need to privde handle_reply and handle_request
+ * callbacks.
+ */
+static void mtk_adsp_ipc_recv(struct mbox_client *c, void *msg)
+{
+	struct mtk_adsp_chan *chan = container_of(c, struct mtk_adsp_chan, cl);
+	struct device *dev = c->dev;
+
+	switch (chan->idx) {
+	case MTK_ADSP_MBOX_REPLY:
+		chan->ipc->ops->handle_reply(chan->ipc);
+		break;
+	case MTK_ADSP_MBOX_REQUEST:
+		chan->ipc->ops->handle_request(chan->ipc);
+		break;
+	default:
+		dev_err(dev, "wrong mbox chan %d\n", chan->idx);
+		break;
+	}
+}
+
+static int mtk_adsp_ipc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_adsp_ipc *adsp_ipc;
+	struct mtk_adsp_chan *adsp_chan;
+	struct mbox_client *cl;
+	char *chan_name;
+	int ret;
+	int i, j;
+
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+
+	adsp_ipc = devm_kzalloc(dev, sizeof(*adsp_ipc), GFP_KERNEL);
+	if (!adsp_ipc)
+		return -ENOMEM;
+
+	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
+		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
+		if (!chan_name) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		adsp_chan = &adsp_ipc->chans[i];
+		cl = &adsp_chan->cl;
+		cl->dev = dev->parent;
+		cl->tx_block = false;
+		cl->knows_txdone = false;
+		cl->tx_prepare = NULL;
+		cl->rx_callback = mtk_adsp_ipc_recv;
+
+		adsp_chan->ipc = adsp_ipc;
+		adsp_chan->idx = i;
+		adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
+		if (IS_ERR(adsp_chan->ch)) {
+			ret = PTR_ERR(adsp_chan->ch);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
+					i, ret);
+			goto out_free;
+		}
+
+		dev_dbg(dev, "request mbox chan %s\n", chan_name);
+		kfree(chan_name);
+	}
+
+	adsp_ipc->dev = dev;
+	dev_set_drvdata(dev, adsp_ipc);
+	dev_dbg(dev, "MTK ADSP IPC initialized\n");
+
+	return 0;
+
+out_free:
+	kfree(chan_name);
+out:
+	for (j = 0; j < i; j++) {
+		adsp_chan = &adsp_ipc->chans[j];
+		mbox_free_channel(adsp_chan->ch);
+	}
+
+	return ret;
+}
+
+static int mtk_adsp_ipc_remove(struct platform_device *pdev)
+{
+	struct mtk_adsp_ipc *adsp_ipc = dev_get_drvdata(&pdev->dev);
+	struct mtk_adsp_chan *adsp_chan;
+	int i;
+
+	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
+		adsp_chan = &adsp_ipc->chans[i];
+		mbox_free_channel(adsp_chan->ch);
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
+	.remove = mtk_adsp_ipc_remove,
+};
+builtin_platform_driver(mtk_adsp_ipc_driver);
+
+MODULE_AUTHOR("Allen-KH Cheng <allen-kh.cheng@mediatek.com>");
+MODULE_DESCRIPTION("MTK ADSP IPC Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/mediatek/mtk-adsp-ipc.h b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
new file mode 100644
index 000000000000..28fd313340b8
--- /dev/null
+++ b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
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
+static inline void mtk_adsp_ipc_set_data(struct mtk_adsp_ipc *ipc, void *data)
+{
+	if (!ipc)
+		return;
+
+	ipc->private_data = data;
+}
+
+static inline void *mtk_adsp_ipc_get_data(struct mtk_adsp_ipc *ipc)
+{
+	if (!ipc)
+		return NULL;
+
+	return ipc->private_data;
+}
+
+int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t op);
+
+#endif /* MTK_ADSP_IPC_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
