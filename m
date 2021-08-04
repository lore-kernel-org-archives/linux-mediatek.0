Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F21AC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:24:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E79A660F38
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E79A660F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fiOFr8cTzgCsR+SPrRq7X1jKiuY82nHdirpyVhGGzeU=; b=s1UnqF5H2wzfEA
	EtlCkTv9nbi8i95PkpJAUbRTVhwt9dLUlhh4UIc1vyjTCNuyg7YWJ7S3j1QnoawA1sjXcs7Eab5/z
	qeKqrQTUAWpVJ2myxqWBNd80CPcA9/zoRvfStk11YeuJAELvrSAVrKVo1Pk0zLrU2sONHxksdKIPj
	vklXsMwJEXD3n8WVXwfKVaH9W0bIgjn9pbugQQHt/HhQ0QnVahU/Ya5ZivcMC67rl6XRhwXbsmLkD
	u9+tNuCQ/S3ELJYevDnaonXxCFibfx9eRW9QDMpPD/CnfHdX/UIG9cAIO0BA+dmEXhEjWKnJYDXhT
	TZIjOxXpmVmNPULUEHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBD7x-005PP9-CV; Wed, 04 Aug 2021 09:23:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCxa-005LLW-FI
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 09:13:12 +0000
X-UUID: bc713e8fb21a44efa15b501ff0450539-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HqckSUEhQnIEJZML7gKBR32WPFvGve2OpyeKq4HCINA=; 
 b=SYMaQoot2mKCxOG82Sx7rKTom7CEVtCGNW4KjcwzDXVpkIKtAe8eRvx7wajFmiD/XD5vqMX2lrvgGRKcPrRV1b4jT5cjNcXHZiELYAm7FLnM/jyqsjTYJ73Cm6hRNCZyXrC4AvSEiOl2SY5FiOmEQnLPE3MMv8CRxUSD5zlDT6o=;
X-UUID: bc713e8fb21a44efa15b501ff0450539-20210804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 438612044; Wed, 04 Aug 2021 02:13:06 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 02:06:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 17:06:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 4 Aug 2021 17:06:54 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <will-cy.lee@mediatek.com>,
 <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <shawnku@google.com>, <jemele@google.com>,
 <apusaka@google.com>, <mcchou@chromium.org>, mark-yw.chen
 <mark-yw.chen@mediatek.com>
Subject: [PATCH v5 2/2] Bluetooth: btusb: Support Bluetooth Reset for Mediatek
 Chip(MT7921)
Date: Wed, 4 Aug 2021 17:06:47 +0800
Message-ID: <20210804090647.12193-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_021310_599157_367F3B39 
X-CRM114-Status: GOOD (  17.57  )
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

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

When the firmware hang or command no response, driver can reset the
bluetooth mcu via USB to recovery it. The reset steps as follows.

1. Cancel USB transfer requests before reset.
2. It use speicific USB HW Register to reset Bluetooth MCU, at the
   same time, the USB Endpoint0 still keep alive.
3. Poll the USB HW register until reset is completed by Endpoint0.
4. To recovery unexpected USB state and behavior during resetting the
   Bluetooth MCU, the driver need to reset the USB device for MT7921.
5. After the reset is completed, the Bluetooth MCU need to re-setup,
   such as download patch, power-on sequence and etc.

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
Reviewed-by: Michael Sun <michaelfsun@google.com>
Reviewed-by: Archie Pusaka <apusaka@chromium.org>
---
 drivers/bluetooth/btusb.c | 129 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 115c01150c02..a4cee8327295 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3110,6 +3110,17 @@ static int btusb_shutdown_intel_new(struct hci_dev *hdev)
 	return 0;
 }
 
+/* UHW CR mapping */
+#define MTK_BT_MISC		0x70002510
+#define MTK_BT_SUBSYS_RST	0x70002610
+#define MTK_UDMA_INT_STA_BT	0x74000024
+#define MTK_UDMA_INT_STA_BT1	0x74000308
+#define MTK_BT_WDT_STATUS	0x740003A0
+#define MTK_EP_RST_OPT		0x74011890
+#define MTK_EP_RST_IN_OUT_OPT	0x00010001
+#define MTK_BT_RST_DONE		0x00000100
+#define MTK_BT_RESET_WAIT_MS	100
+#define MTK_BT_RESET_NUM_TRIES	10
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 
@@ -3684,6 +3695,63 @@ static int btusb_mtk_func_query(struct hci_dev *hdev)
 	return status;
 }
 
+static int btusb_mtk_uhw_reg_write(struct btusb_data *data, u32 reg, u32 val)
+{
+	struct hci_dev *hdev = data->hdev;
+	int pipe, err;
+	void *buf;
+
+	buf = kzalloc(4, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	put_unaligned_le32(val, buf);
+
+	pipe = usb_sndctrlpipe(data->udev, 0);
+	err = usb_control_msg(data->udev, pipe, 0x02,
+			      0x5E,
+			      reg >> 16, reg & 0xffff,
+			      buf, 4, USB_CTRL_SET_TIMEOUT);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to write uhw reg(%d)", err);
+		goto err_free_buf;
+	}
+
+err_free_buf:
+	kfree(buf);
+
+	return err;
+}
+
+static int btusb_mtk_uhw_reg_read(struct btusb_data *data, u32 reg, u32 *val)
+{
+	struct hci_dev *hdev = data->hdev;
+	int pipe, err;
+	void *buf;
+
+	buf = kzalloc(4, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	pipe = usb_rcvctrlpipe(data->udev, 0);
+	err = usb_control_msg(data->udev, pipe, 0x01,
+			      0xDE,
+			      reg >> 16, reg & 0xffff,
+			      buf, 4, USB_CTRL_SET_TIMEOUT);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to read uhw reg(%d)", err);
+		goto err_free_buf;
+	}
+
+	*val = get_unaligned_le32(buf);
+	bt_dev_dbg(hdev, "reg=%x, value=0x%08x", reg, *val);
+
+err_free_buf:
+	kfree(buf);
+
+	return err;
+}
+
 static int btusb_mtk_reg_read(struct btusb_data *data, u32 reg, u32 *val)
 {
 	int pipe, err, size = sizeof(u32);
@@ -3763,6 +3831,9 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = btusb_mtk_setup_firmware_79xx(hdev, fw_bin_name);
 
+		/* It's Device EndPoint Reset Option Register */
+		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
+
 		/* Enable Bluetooth protocol */
 		param = 1;
 		wmt_params.op = BTMTK_WMT_FUNC_CTRL;
@@ -3888,6 +3959,63 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 
+static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	u32 val;
+	int err, retry = 0;
+
+	/* It's MediaTek specific bluetooth reset mechanism via USB */
+	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
+		bt_dev_err(hdev, "last reset failed? Not resetting again");
+		return;
+	}
+
+	err = usb_autopm_get_interface(data->intf);
+	if (err < 0)
+		return;
+
+	btusb_stop_traffic(data);
+	usb_kill_anchored_urbs(&data->tx_anchor);
+
+	/* It's Device EndPoint Reset Option Register */
+	bt_dev_dbg(hdev, "Initiating reset mechanism via uhw");
+	btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
+	btusb_mtk_uhw_reg_read(data, MTK_BT_WDT_STATUS, &val);
+
+	/* Reset the bluetooth chip via USB interface. */
+	btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 1);
+	btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+	btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT, &val);
+	btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT1, 0x000000FF);
+	btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT1, &val);
+	/* MT7921 need to delay 20ms between toggle reset bit */
+	msleep(20);
+	btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 0);
+	btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+
+	/* Poll the register until reset is completed */
+	do {
+		btusb_mtk_uhw_reg_read(data, MTK_BT_MISC, &val);
+		if (val & MTK_BT_RST_DONE) {
+			bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
+			break;
+		}
+
+		bt_dev_dbg(hdev, "Polling Bluetooth Reset CR");
+		retry++;
+		msleep(MTK_BT_RESET_WAIT_MS);
+	} while (retry < MTK_BT_RESET_NUM_TRIES);
+
+	btusb_mtk_id_get(data, 0x70010200, &val);
+	if (!val)
+		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
+
+	usb_queue_reset_device(data->intf);
+
+	clear_bit(BTUSB_HW_RESET_ACTIVE, &data->flags);
+}
+
 static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -4738,6 +4866,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->setup = btusb_mtk_setup;
 		hdev->shutdown = btusb_mtk_shutdown;
 		hdev->manufacturer = 70;
+		hdev->cmd_timeout = btusb_mtk_cmd_timeout;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 		data->recv_acl = btusb_recv_acl_mtk;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
