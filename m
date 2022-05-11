Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01B1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 04:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMavgNCSxW+Q8PK2g5nxcKDFe7HOZxuBE+04EwAq6JA=; b=tOZChdHYwB5uCf
	i36w02+gpJVMs+cPc8ifzbVeWwHyFcq2Tep6suggxgMdcWrIXuAXB5rHhgMnF/kBNtBVIvSx8kGBN
	YN0oWNpqhcdIeosjSJqXUG2Tp5tySaduwPhO7ZO10Px3WQV8TZEaCN+bhSAAuYCX6eXOLe9PHRfgB
	y/tXNV/6wtTOycRDrcC5+yY5Iy9qA2nbILRfKlxgiLdNqZupkfaUITNpWzi4MlL0jP4V09WToc05R
	SfJbdM+tC549LSWgADG2uZW0SkY3ML0aZpC+K9XqXg+CQgzYDqTAXJ1Hm7gAE7JABnnMdqS+qZVM8
	+P9GrUhYh656knowSQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noe0j-0059kZ-RM; Wed, 11 May 2022 04:31:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noe0g-0059jS-Px; Wed, 11 May 2022 04:31:40 +0000
X-UUID: 0d2cd31d6c3f47acb9472557b0ce7f64-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:aa26d7d8-1be6-4877-87cd-7ead1097a975, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:f0e15eb3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0d2cd31d6c3f47acb9472557b0ce7f64-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1674206240; Tue, 10 May 2022 21:31:34 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 21:28:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 12:28:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 11 May 2022 12:28:02 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v8 3/3] ASoC: SOF: mediatek: Add mt8186 ipc support
Date: Wed, 11 May 2022 12:27:18 +0800
Message-ID: <20220511042718.4305-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220511042718.4305-1-tinghan.shen@mediatek.com>
References: <20220511042718.4305-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_213138_875085_4D82BB4E 
X-CRM114-Status: GOOD (  23.34  )
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

mt8186 DSP uses two hardware mailbox IP to communicate with AP.
One mailbox is used for requests coming from AP, and the other
one is for requests from DSP.

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c |   5 +
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 141 ++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
index 548b12c33d8a..946e6c43204f 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
@@ -17,6 +17,11 @@ void mt8186_sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
 				RUNSTALL, RUNSTALL);
 
+	/* enable mbox 0 & 1 IRQ */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_MBOX_IRQ_EN,
+				DSP_MBOX0_IRQ_EN | DSP_MBOX1_IRQ_EN,
+				DSP_MBOX0_IRQ_EN | DSP_MBOX1_IRQ_EN);
+
 	/* set core boot address */
 	snd_sof_dsp_write(sdev, DSP_SECREG_BAR, ADSP_ALTVEC_C0, boot_addr);
 	snd_sof_dsp_write(sdev, DSP_SECREG_BAR, ADSP_ALTVECSEL, ADSP_ALTVECSEL_C0);
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 6d574fd4492e..3333a0634e29 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -27,6 +27,99 @@
 #include "mt8186.h"
 #include "mt8186-clk.h"
 
+static int mt8186_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return MBOX_OFFSET;
+}
+
+static int mt8186_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return MBOX_OFFSET;
+}
+
+static int mt8186_send_msg(struct snd_sof_dev *sdev,
+			   struct snd_sof_ipc_msg *msg)
+{
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+
+	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
+			  msg->msg_size);
+
+	return mtk_adsp_ipc_send(priv->dsp_ipc, MTK_ADSP_IPC_REQ, MTK_ADSP_IPC_OP_REQ);
+}
+
+static void mt8186_get_reply(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = sdev->msg;
+	struct sof_ipc_reply reply;
+	int ret = 0;
+
+	if (!msg) {
+		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
+		return;
+	}
+
+	/* get reply */
+	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
+	if (reply.error < 0) {
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		ret = reply.error;
+	} else {
+		/* reply has correct size? */
+		if (reply.hdr.size != msg->reply_size) {
+			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
+				msg->reply_size, reply.hdr.size);
+			ret = -EINVAL;
+		}
+
+		/* read the message */
+		if (msg->reply_size > 0)
+			sof_mailbox_read(sdev, sdev->host_box.offset,
+					 msg->reply_data, msg->reply_size);
+	}
+
+	msg->reply_error = ret;
+}
+
+static void mt8186_dsp_handle_reply(struct mtk_adsp_ipc *ipc)
+{
+	struct adsp_priv *priv = mtk_adsp_ipc_get_data(ipc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
+	mt8186_get_reply(priv->sdev);
+	snd_sof_ipc_reply(priv->sdev, 0);
+	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
+}
+
+static void mt8186_dsp_handle_request(struct mtk_adsp_ipc *ipc)
+{
+	struct adsp_priv *priv = mtk_adsp_ipc_get_data(ipc);
+	u32 p; /* panic code */
+	int ret;
+
+	/* Read the message from the debug box. */
+	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4,
+			 &p, sizeof(p));
+
+	/* Check to see if the message is a panic code 0x0dead*** */
+	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
+		snd_sof_dsp_panic(priv->sdev, p, true);
+	} else {
+		snd_sof_ipc_msgs_rx(priv->sdev);
+
+		/* tell DSP cmd is done */
+		ret = mtk_adsp_ipc_send(priv->dsp_ipc, MTK_ADSP_IPC_RSP, MTK_ADSP_IPC_OP_RSP);
+		if (ret)
+			dev_err(priv->dev, "request send ipc failed");
+	}
+}
+
+static struct mtk_adsp_ipc_ops dsp_ops = {
+	.handle_reply		= mt8186_dsp_handle_reply,
+	.handle_request		= mt8186_dsp_handle_request,
+};
+
 static int platform_parse_resource(struct platform_device *pdev, void *data)
 {
 	struct resource *mmio;
@@ -271,6 +364,9 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 	sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
 	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
 
+	/* set default mailbox offset for FW ready message */
+	sdev->dsp_box.offset = mt8186_get_mailbox_offset(sdev);
+
 	ret = adsp_memory_remap_init(sdev, priv->adsp);
 	if (ret) {
 		dev_err(sdev->dev, "adsp_memory_remap_init fail!\n");
@@ -292,11 +388,41 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 
 	adsp_sram_power_on(sdev);
 
+	priv->ipc_dev = platform_device_register_data(&pdev->dev, "mtk-adsp-ipc",
+						      PLATFORM_DEVID_NONE,
+						      pdev, sizeof(*pdev));
+	if (IS_ERR(priv->ipc_dev)) {
+		ret = IS_ERR(priv->ipc_dev);
+		dev_err(sdev->dev, "failed to create mtk-adsp-ipc device\n");
+		goto err_adsp_off;
+	}
+
+	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
+	if (!priv->dsp_ipc) {
+		ret = -EPROBE_DEFER;
+		dev_err(sdev->dev, "failed to get drvdata\n");
+		goto exit_pdev_unregister;
+	}
+
+	mtk_adsp_ipc_set_data(priv->dsp_ipc, priv);
+	priv->dsp_ipc->ops = &dsp_ops;
+
 	return 0;
+
+exit_pdev_unregister:
+	platform_device_unregister(priv->ipc_dev);
+err_adsp_off:
+	adsp_sram_power_off(sdev);
+	mt8186_adsp_clock_off(sdev);
+
+	return ret;
 }
 
 static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 {
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+
+	platform_device_unregister(priv->ipc_dev);
 	mt8186_sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
 	mt8186_adsp_clock_off(sdev);
@@ -334,6 +460,14 @@ static int mt8186_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	return type;
 }
 
+static int mt8186_ipc_msg_data(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       void *p, size_t sz)
+{
+	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+	return 0;
+}
+
 /* mt8186 ops */
 static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* probe and remove */
@@ -353,6 +487,13 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.write64	= sof_io_write64,
 	.read64		= sof_io_read64,
 
+	/* ipc */
+	.send_msg		= mt8186_send_msg,
+	.get_mailbox_offset	= mt8186_get_mailbox_offset,
+	.get_window_offset	= mt8186_get_window_offset,
+	.ipc_msg_data		= mt8186_ipc_msg_data,
+	.set_stream_data_offset = sof_set_stream_data_offset,
+
 	/* misc */
 	.get_bar_index	= mt8186_get_bar_index,
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
