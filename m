Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D12C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 21:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3a+vrSpCVQeFi0WqRUg8vGI8nykKk7w7OUqSqNUJKko=; b=Pv2dNVCHkAB1PKqdvD+PqFOI5K
	qnXe2UlcDjIfPYjG+iy0L9bAm8u8R9Z8JcY5+jeaRR1vb69E0uP69dByW7mvJ0T571ydZXKZrMb7I
	dFspG7xn6CqEWpWZoOBhPXp7Fc8I0P84WP/Mxa28KQ6FhgKFIISsPIUwzQziZLG+YEN7vTgoD+OzV
	FkHfTmBO2Wr4KR51A0DlKvkNs8BW9QdQTGSAorp+q6U9or1YSf6bjzIXF+L0tceZh0wkIYKDFQdAJ
	HXxHtWpEPX2wodQEuzZVs1RoDw3cHftw/6iZ0vijguXowjDdH6Ji+hOMAau66fKMyfqB439I4gMgc
	gqoVA3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaBe-00D3rj-2m;
	Fri, 12 May 2023 21:20:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaBb-00D3qZ-1O
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 21:20:25 +0000
X-UUID: c9c34808f10a11ed912e1518a6540028-20230512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3a+vrSpCVQeFi0WqRUg8vGI8nykKk7w7OUqSqNUJKko=;
	b=GVPDhsB9z0QMPLJVfkU2HCO/0ZdcxacurIym1XIhtMEpc+jqkDbR5Oua11lnaO/dBEVbpGbil2WnTaB5LS1cO86styuvB365B2DrR5ixAv8PycOagR4B4zJ6QVxzSfqKJrdkHA5vF3K6PtnYHYcs907Mqo3rs0V9DEjT6lItmLE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:cc547bd7-56e3-4d9c-b4bc-1d2ef02a2d5a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:9128a86b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: c9c34808f10a11ed912e1518a6540028-20230512
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1959328797; Fri, 12 May 2023 14:20:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 13 May 2023 05:20:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 13 May 2023 05:20:12 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>
CC: <sean.wang@mediatek.com>, <chris.lu@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>,
	<ch.yeh@mediatek.com>, <jenhao.yang@mediatek.com>,
	<Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
	<steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
	<abhishekpandit@google.com>, <michaelfsun@google.com>,
	<abhishekpandit@chromium.org>, <mcchou@chromium.org>, <shawnku@google.com>,
	<linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jing Cai <jing.cai@mediatek.com>
Subject: [PATCH v6 2/3] Bluetooth: btmtk: introduce btmtk reset work
Date: Sat, 13 May 2023 05:20:08 +0800
Message-ID: <be13cf63ce5061b470021dc3b7a9a89cdf5c6feb.1683925801.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cc4ae6f7545cdf0615279890521b11774f062add.1683925801.git.objelf@gmail.com>
References: <cc4ae6f7545cdf0615279890521b11774f062add.1683925801.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_142023_506934_316CDDD5 
X-CRM114-Status: GOOD (  16.45  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jing Cai <jing.cai@mediatek.com>

Introduce btmtk_reset_work which can be called whenever the firmware abort,
HCI command timeout, other fatal error happen.

Co-developed-by: Chris Lu <chris.lu@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jing Cai <jing.cai@mediatek.com>
---
v2, v3, v4: rebase onto the latest codebase
v5: reset the device on hdev basis and use hci_cmd_sync_queue to
    schedule reset work
v6: rebase onto the latest codebase
---
 drivers/bluetooth/btmtk.c |  15 ++++++
 drivers/bluetooth/btmtk.h |  11 ++++
 drivers/bluetooth/btusb.c | 108 ++++++++++++++++++++------------------
 3 files changed, 84 insertions(+), 50 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 809762d64fc6..ac2fac7e3c5f 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -280,6 +280,21 @@ int btmtk_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 }
 EXPORT_SYMBOL_GPL(btmtk_set_bdaddr);
 
+void btmtk_reset_sync(struct hci_dev *hdev)
+{
+	struct btmtk_data *reset_work = hci_get_priv(hdev);
+	int err;
+
+	hci_dev_lock(hdev);
+
+	err = hci_cmd_sync_queue(hdev, reset_work->reset_sync, NULL, NULL);
+	if (err)
+		bt_dev_err(hdev, "failed to reset (%d)", err);
+
+	hci_dev_unlock(hdev);
+}
+EXPORT_SYMBOL_GPL(btmtk_reset_sync);
+
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
 MODULE_DESCRIPTION("Bluetooth support for MediaTek devices ver " VERSION);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 2a88ea8e475e..6245662f6ccb 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -122,6 +122,12 @@ struct btmtk_hci_wmt_params {
 typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
 				   struct btmtk_hci_wmt_params *);
 
+typedef int (*btmtk_reset_sync_func_t)(struct hci_dev *, void *);
+
+struct btmtk_data {
+	btmtk_reset_sync_func_t reset_sync;
+};
+
 #if IS_ENABLED(CONFIG_BT_MTK)
 
 int btmtk_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
@@ -131,6 +137,8 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 
 int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 			 wmt_cmd_sync_func_t wmt_cmd_sync);
+
+void btmtk_reset_sync(struct hci_dev *hdev);
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -151,4 +159,7 @@ static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 	return -EOPNOTSUPP;
 }
 
+static void btmtk_reset_sync(struct hci_dev *hdev)
+{
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 275e0666503d..034edd8ad777 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2946,8 +2946,60 @@ static u32 btusb_mtk_reset_done(struct hci_dev *hdev)
 	return val & MTK_BT_RST_DONE;
 }
 
+static int btusb_mtk_reset_work(struct hci_dev *hdev, void *rst_data)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	u32 val;
+	int err;
+
+	/* It's MediaTek specific bluetooth reset mechanism via USB */
+	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
+		bt_dev_err(hdev, "last reset failed? Not resetting again");
+		return -EBUSY;
+	}
+
+	err = usb_autopm_get_interface(data->intf);
+	if (err < 0)
+		return err;
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
+	err = readx_poll_timeout(btusb_mtk_reset_done, hdev, val,
+				 val & MTK_BT_RST_DONE, 20000, 1000000);
+	if (err < 0)
+		bt_dev_err(hdev, "Reset timeout");
+
+	btusb_mtk_id_get(data, 0x70010200, &val);
+	if (!val)
+		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
+
+	usb_queue_reset_device(data->intf);
+
+	clear_bit(BTUSB_HW_RESET_ACTIVE, &data->flags);
+
+	return err;
+}
+
 static int btusb_mtk_setup(struct hci_dev *hdev)
 {
+	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct btmtk_hci_wmt_params wmt_params;
 	ktime_t calltime, delta, rettime;
@@ -2982,6 +3034,8 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 		}
 	}
 
+	btmtk_data->reset_sync = btusb_mtk_reset_work;
+
 	switch (dev_id) {
 	case 0x7663:
 		fwname = FIRMWARE_MT7663;
@@ -3131,55 +3185,6 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 
-static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
-{
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	u32 val;
-	int err;
-
-	/* It's MediaTek specific bluetooth reset mechanism via USB */
-	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
-		bt_dev_err(hdev, "last reset failed? Not resetting again");
-		return;
-	}
-
-	err = usb_autopm_get_interface(data->intf);
-	if (err < 0)
-		return;
-
-	btusb_stop_traffic(data);
-	usb_kill_anchored_urbs(&data->tx_anchor);
-
-	/* It's Device EndPoint Reset Option Register */
-	bt_dev_dbg(hdev, "Initiating reset mechanism via uhw");
-	btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
-	btusb_mtk_uhw_reg_read(data, MTK_BT_WDT_STATUS, &val);
-
-	/* Reset the bluetooth chip via USB interface. */
-	btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 1);
-	btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
-	btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT, &val);
-	btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT1, 0x000000FF);
-	btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT1, &val);
-	/* MT7921 need to delay 20ms between toggle reset bit */
-	msleep(20);
-	btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 0);
-	btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
-
-	err = readx_poll_timeout(btusb_mtk_reset_done, hdev, val,
-				 val & MTK_BT_RST_DONE, 20000, 1000000);
-	if (err < 0)
-		bt_dev_err(hdev, "Reset timeout");
-
-	btusb_mtk_id_get(data, 0x70010200, &val);
-	if (!val)
-		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
-
-	usb_queue_reset_device(data->intf);
-
-	clear_bit(BTUSB_HW_RESET_ACTIVE, &data->flags);
-}
-
 static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -4195,6 +4200,9 @@ static int btusb_probe(struct usb_interface *intf,
 	} else if (id->driver_info & BTUSB_REALTEK) {
 		/* Allocate extra space for Realtek device */
 		priv_size += sizeof(struct btrealtek_data);
+	} else if (id->driver_info & BTUSB_MEDIATEK) {
+		/* Allocate extra space for Mediatek device */
+		priv_size += sizeof(struct btmtk_data);
 	}
 
 	data->recv_acl = hci_recv_frame;
@@ -4301,7 +4309,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->setup = btusb_mtk_setup;
 		hdev->shutdown = btusb_mtk_shutdown;
 		hdev->manufacturer = 70;
-		hdev->cmd_timeout = btusb_mtk_cmd_timeout;
+		hdev->cmd_timeout = btmtk_reset_sync;
 		hdev->set_bdaddr = btmtk_set_bdaddr;
 		set_bit(HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN, &hdev->quirks);
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
-- 
2.25.1


