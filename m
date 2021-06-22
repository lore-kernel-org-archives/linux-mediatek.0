Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5442DC48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 16:04:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0719F60FE3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 16:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0719F60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8kNkPnGLPPJupDgzw02XCBMDH3mlcDP4tLnLQSpNDiM=; b=4GPQyAjkgFqOzV
	cf+tSrpf3OA3YmAGPlO4eT8VOBBV/yz2VvxnYvZGwVqPwiG+T7wZhCs+axJUb4GzXUGB4g3/qXIy6
	i8Mx4FgBPMO0YwVrTuDl+21qDk0qdSzjgnndOUEeOH5/WO1IkuyF3Oixjz3gxxI9/3yxc2Yf0NpaA
	90I+kkJcO+Sh11J0pWpEtKXpqTZOV4UXhFYY5Rlk9+OdQ9ElLTCyUyR4f9XA7qYlnjSh2t8E7joSl
	i0PPL6z9N4XBjhoq5yN/lA2C2mlNEd7d0qBR4XyvK9/CU+3lJcfH2okyIKZQmNuwWj6oaGd/VZ/Ll
	FIFTnnfPERFrYuNWs8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvisc-007q5r-QD; Tue, 22 Jun 2021 16:04:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvisX-007q3i-Mm
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 16:04:00 +0000
X-UUID: e59b9f49c24e491eb47fa64efa39ee5d-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=rfOfrt7QT3HDn+4bnWoJ6s7XX9aDU+Fu4aSTvCAFO+s=; 
 b=Pnk97D54IuAcY8rdmx/PsxsRhyPd4vcQmjZ7dCt5FgpokMHNa1gC9zCy6/YgMTCx9Nhi7S77DpwnhDY6dgIuKuAanpbwyFpcpFJuoBY+dI8TWyon+YyD3FR5Ti10MykPJqttzA5FL7ul2G0HIUBT8y4eBEGEz4Kn47dq6TAKOOE=;
X-UUID: e59b9f49c24e491eb47fa64efa39ee5d-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1362999586; Tue, 22 Jun 2021 09:03:47 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 09:03:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:03:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Jun 2021 00:03:44 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <will-cy.lee@mediatek.com>,
 <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <shawnku@google.com>, <jemele@google.com>,
 mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH 1/1] Bluetooth: btusb: Support Bluetooth Reset for Mediatek
 Chip.
Date: Wed, 23 Jun 2021 00:02:55 +0800
Message-ID: <20210622160255.14906-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_090359_209660_CDC18C8B 
X-CRM114-Status: GOOD (  14.70  )
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

This change enable Mediatek reset mechanism via USB, it's a specific
reset mechanism with Mediatek chips. To handle error recovery, it use
the cmd_timoeut to reset Mediatek Bluetooth.

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 138 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 0a86713f496b..e8ad8ca4d346 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3076,6 +3076,18 @@ static int btusb_shutdown_intel_new(struct hci_dev *hdev)
 	return 0;
 }
 
+/* UHW CR mapping */
+#define BT_MISC			0x70002510
+#define BT_SUBSYS_RST		0x70002610
+#define UDMA_INT_STA_BT		0x74000024
+#define UDMA_INT_STA_BT1	0x74000308
+#define BT_WDT_STATUS		0x740003A0
+#define EP_RST_OPT		0x74011890
+#define EP_RST_IN_OUT_OPT	0x00010001
+#define BT_RST_DONE		0x00000100
+#define BT_RESET_WAIT_MS	100
+#define BT_RESET_NUM_TRIES	10
+
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 
@@ -3650,6 +3662,63 @@ static int btusb_mtk_func_query(struct hci_dev *hdev)
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
+	bt_dev_info(hdev, "%s: reg=%x, value=0x%08x", __func__, reg, *val);
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
@@ -3729,6 +3798,9 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = btusb_mtk_setup_firmware_79xx(hdev, fw_bin_name);
 
+		/* It's Device EndPoint Reset Option Register */
+		btusb_mtk_uhw_reg_write(data, EP_RST_OPT, EP_RST_IN_OUT_OPT);
+
 		/* Enable Bluetooth protocol */
 		param = 1;
 		wmt_params.op = BTMTK_WMT_FUNC_CTRL;
@@ -3852,6 +3924,71 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
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
+	if (enable_autosuspend)
+		usb_disable_autosuspend(data->udev);
+
+	data->sco_num = 0;
+
+	btusb_stop_traffic(data);
+	usb_kill_anchored_urbs(&data->tx_anchor);
+
+	/* It's Device EndPoint Reset Option Register */
+	bt_dev_info(hdev, "Initiating reset mechanism via uhw");
+	btusb_mtk_uhw_reg_write(data, EP_RST_OPT, EP_RST_IN_OUT_OPT);
+	btusb_mtk_uhw_reg_read(data, BT_WDT_STATUS, &val);
+
+	/* MediaTek Bluetooht Reset */
+	btusb_mtk_uhw_reg_write(data, BT_SUBSYS_RST, 1);
+	btusb_mtk_uhw_reg_write(data, UDMA_INT_STA_BT, 0x000000FF);
+	btusb_mtk_uhw_reg_read(data, UDMA_INT_STA_BT, &val);
+	btusb_mtk_uhw_reg_write(data, UDMA_INT_STA_BT1, 0x000000FF);
+	btusb_mtk_uhw_reg_read(data, UDMA_INT_STA_BT1, &val);
+	msleep(20);
+	btusb_mtk_uhw_reg_write(data, BT_SUBSYS_RST, 0);
+	btusb_mtk_uhw_reg_read(data, BT_SUBSYS_RST, &val);
+
+	/* Poll the register until reset is completed */
+	do {
+		btusb_mtk_uhw_reg_read(data, BT_MISC, &val);
+		if ((val & 0x00000100) == BT_RST_DONE) {
+			bt_dev_info(hdev, "Bluetooth Reset Successfully");
+			break;
+		}
+
+		bt_dev_dbg(hdev, "Polling Bluetooth Reset CR");
+		retry++;
+		msleep(BT_RESET_WAIT_MS);
+	} while (retry < BT_RESET_NUM_TRIES);
+
+	btusb_mtk_id_get(data, 0x70010200, &val);
+	bt_dev_info(hdev, "device id (%x)", val);
+
+	/* Re-Setup Mediatek device */
+	err = btusb_mtk_setup(hdev);
+	if (err < 0) {
+		bt_dev_err(hdev, "mtk_setup failed, err = %d", err);
+		return;
+	}
+	hci_reset_dev(hdev);
+
+	if (enable_autosuspend)
+		usb_enable_autosuspend(data->udev);
+
+	clear_bit(BTUSB_HW_RESET_ACTIVE, &data->flags);
+}
+
 static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -4689,6 +4826,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->setup = btusb_mtk_setup;
 		hdev->shutdown = btusb_mtk_shutdown;
 		hdev->manufacturer = 70;
+		hdev->cmd_timeout = btusb_mtk_cmd_timeout;
 		data->recv_acl = btusb_recv_acl_mtk;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
