Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DF0C48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 19:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B43613C1
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 19:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B43613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZU9t9J0TmSbVBxjbCbq21+svbJiBADY/UlwRfG3CPs8=; b=MMpFRR1DX4Srwt
	RoL84XHLCiJp24x8xTZri2Dw9zBXXalK3xsilq5odzpQfUcaEbddIky4lR2aG6FxLODPOXr3ZPA57
	Z7JrkGWr+5iBVbKaswdZUyl3gSjq5WvqjOmWgSs+lDrYJA+7Ua7eBHlaoIH+sxJFYkBW0541gSh0O
	Quzi2uR7qpwk2xly9vWVOZ4Lt/gDdZxHKvS6qLgicxVZzrfNcH5H5L/BiBk8MfWXHRlA3irdVsMwD
	ZJJF6iFkxd2IBV5GA1swB5VxDd0hEivW7AdN7DFYayEkCJBMchlT9uAZILfxx5Bieu2VWBYCRRMFH
	/GP1e6VNv7bzSpAsm/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr3Yc-00FfNG-0Y; Wed, 09 Jun 2021 19:08:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr3YX-00FfMZ-S2
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 19:08:05 +0000
X-UUID: b5fcfe356e7b41f285716867bbcf6afb-20210609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=P7jQzz9hHlKb/eflB5Tw7uOKWy6BXJAvSlIp+UKLo/4=; 
 b=BFUHKxUdGrDg0NJwtlDj3zmdKB+o07eSsXVGQDvEPA/TOecA7kdgg44g8CUsM2F5JAdNpbnv7ea20PKu8veC2yLbAVe4O3cL7nZcQM/Ys+paxm83axUha0fZzeU51OMigu+9n7iT44cvWQ8I8orzrlXz9f7So7quiiWMUHz+W5c=;
X-UUID: b5fcfe356e7b41f285716867bbcf6afb-20210609
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1258578496; Wed, 09 Jun 2021 12:07:56 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Jun 2021 12:07:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 03:07:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Jun 2021 03:07:47 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <will-cy.lee@mediatek.com>,
 <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <shawnku@google.com>, <jemele@google.com>,
 mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH 2/2] Bluetooth: btusb: Support Bluetooth Reset for Mediatek
 Chip.
Date: Thu, 10 Jun 2021 03:07:34 +0800
Message-ID: <20210609190734.30088-2-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210609190734.30088-1-mark-yw.chen@mediatek.com>
References: <20210609190734.30088-1-mark-yw.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_120803_344757_223826CE 
X-CRM114-Status: GOOD (  16.22  )
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
 drivers/bluetooth/btusb.c | 145 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 2a55ae0a5f8c..acc23afbfe0f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3075,6 +3075,18 @@ static int btusb_shutdown_intel_new(struct hci_dev *hdev)
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
 
@@ -3649,6 +3661,59 @@ static int btusb_mtk_func_query(struct hci_dev *hdev)
 	return status;
 }
 
+static int btusb_mtk_uhw_reg_write(struct btusb_data *data, u32 reg, u32 val)
+{
+	int pipe, err, size = sizeof(u32);
+	u8 buf[4];
+
+	buf[0] = (val & 0x00ff);
+	buf[1] = ((val >> 8) & 0x00ff);
+	buf[2] = ((val >> 16) & 0x00ff);
+	buf[3] = ((val >> 24) & 0x00ff);
+
+	pipe = usb_sndctrlpipe(data->udev, 0);
+	err = usb_control_msg(data->udev, pipe, 0x02,
+			      0x5E,
+			      reg >> 16, reg & 0xffff,
+			      buf, size, USB_CTRL_SET_TIMEOUT);
+	if (err < 0) {
+		BT_ERR("Failed to write uhw reg(%d)", err);
+		goto err_free_buf;
+	}
+
+err_free_buf:
+
+	return err;
+}
+
+static int btusb_mtk_uhw_reg_read(struct btusb_data *data, u32 reg, u32 *val)
+{
+	int pipe, err, size = sizeof(u32);
+	void *buf;
+
+	buf = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	pipe = usb_rcvctrlpipe(data->udev, 0);
+	err = usb_control_msg(data->udev, pipe, 0x01,
+			      0xDE,
+			      reg >> 16, reg & 0xffff,
+			      buf, size, USB_CTRL_SET_TIMEOUT);
+	if (err < 0) {
+		BT_ERR("Failed to read uhw reg(%d)", err);
+		goto err_free_buf;
+	}
+
+	*val = get_unaligned_le32(buf);
+	BT_INFO("%s: reg=%x, value=0x%08x", __func__, reg, *val);
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
@@ -3728,6 +3793,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = btusb_mtk_setup_firmware_79xx(hdev, fw_bin_name);
 
+		btusb_mtk_uhw_reg_write(data, EP_RST_OPT, EP_RST_IN_OUT_OPT);
 		/* Enable Bluetooth protocol */
 		param = 1;
 		wmt_params.op = BTMTK_WMT_FUNC_CTRL;
@@ -3851,6 +3917,84 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 
+static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	u32 val;
+	int err, retry = 0;
+
+	/*
+	 * Toggle the bluetooth reset via usb. It's mediatek spicific reset
+	 * mechanism, and the reset flow won't replug the USB. Thus, it must
+	 * handle the urb transaction, such as stop_traffic and submit_urb.
+	 * After bluetooth reset completed, we will re-download the firmware
+	 * and send hw_err to host.
+	 */
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
+	/* For reset */
+	bt_dev_info(hdev, "Initiating reset mechanism via uhw");
+	/*
+	 * Todo - add error handling for usb no response case and uhw
+	 * something worng.
+	 */
+	btusb_mtk_uhw_reg_write(data, EP_RST_OPT, EP_RST_IN_OUT_OPT);
+	btusb_mtk_uhw_reg_read(data, BT_WDT_STATUS, &val);
+
+	/* Write Reset CR to 1 */
+	btusb_mtk_uhw_reg_write(data, BT_SUBSYS_RST, 1);
+
+	btusb_mtk_uhw_reg_write(data, UDMA_INT_STA_BT, 0x000000FF);
+	btusb_mtk_uhw_reg_read(data, UDMA_INT_STA_BT, &val);
+	btusb_mtk_uhw_reg_write(data, UDMA_INT_STA_BT1, 0x000000FF);
+	btusb_mtk_uhw_reg_read(data, UDMA_INT_STA_BT1, &val);
+	msleep(1);
+
+	/* Write Reset CR to 0 */
+	btusb_mtk_uhw_reg_write(data, BT_SUBSYS_RST, 0);
+
+	/* Read reset CR */
+	btusb_mtk_uhw_reg_read(data, BT_SUBSYS_RST, &val);
+
+	do {
+		btusb_mtk_uhw_reg_read(data, BT_MISC, &val);
+		if ((val & 0x00000100) == BT_RST_DONE) {
+			bt_dev_info(hdev, "Bluetooth Reset Sucessfully");
+			break;
+		} else
+			bt_dev_dbg(hdev, "Polling Bluetooth Reset CR");
+
+		retry++;
+		msleep(BT_RESET_WAIT_MS);
+	} while (retry < BT_RESET_NUM_TRIES);
+
+	btusb_mtk_id_get(data, 0x70010200, &val);
+	bt_dev_info(hdev, "device id (%x)", val);
+
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
 static int btusb_recv_bulk_mtk(struct btusb_data *data, void *buffer, int count)
 {
 	struct sk_buff *skb;
@@ -4736,6 +4880,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->shutdown = btusb_mtk_shutdown;
 		hdev->manufacturer = 70;
 		data->recv_bulk = btusb_recv_bulk_mtk;
+		hdev->cmd_timeout = btusb_mtk_cmd_timeout;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
