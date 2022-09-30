Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83800C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 00:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rBXAtDrZQiCn2meVosVdWFsBacLsqSXRiPraabhiYs=; b=kwg0rc9gArLN8lfg4wo3fQHgs1
	x7zmdhM+1xP4kQW92aOJlosZhTa9Z5qVtqSJ/niNBhEOZQwMr5lRKBVAvGHHKkl6X7m2Y4W8TnA+L
	LoFeS440w3fDgechQtM9yMFz9i/vZwT6arvIIt9DO9OX9wIkYXlzo76IwOJ+26aZPNAHRB9pu7wot
	wRqDpkJ5zUFXSr6Q37jzo4deGk4f/8MK/pNJI2xGqFrHCr4XH0mmz/bVlvoR7pZvVwjWJaG+jrw7e
	VTr8YHHMNqf9OvR+kXQ6cKtkn+dK3zjDhnuRM9WtzK7XxTc3w4X20QzgiaNqIekWuIH3dHTaAsqvQ
	Ik34j7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe4Az-006Qqu-1y; Fri, 30 Sep 2022 00:46:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe4Aw-006Qp0-1d
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 00:46:47 +0000
X-UUID: d867ecb64ec94478bdae96ac859a24f2-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2rBXAtDrZQiCn2meVosVdWFsBacLsqSXRiPraabhiYs=;
	b=Cso5nGPe/40aL2LVNNfaHNyZKzUq4kvs02R8cC4ejOpFyGiVBA7LBdYYE65ME96SZz+Y0ATTF4rXUnffxuSIZxnPAnHX8zd/dWSjjwTljI9KimovtY0SS9Dmuv2ZVawGei4xouF5NUpf22WkX7OLG1xBlgxjw8d5PJy+nkonWCI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bb5ec839-61b6-4feb-96fd-74034df65316,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:05978ca3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d867ecb64ec94478bdae96ac859a24f2-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1283680686; Thu, 29 Sep 2022 17:43:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 08:23:53 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 08:23:53 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <ted.huang@mediatek.com>,
	<Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
	<steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
	<abhishekpandit@google.com>, <michaelfsun@google.com>,
	<abhishekpandit@chromium.org>, <mcchou@chromium.org>, <shawnku@google.com>,
	<linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jing Cai <jing.cai@mediatek.com>
Subject: [PATCH v2 2/3] Bluetooth: btmtk: introduce btmtk reset work
Date: Fri, 30 Sep 2022 08:23:48 +0800
Message-ID: <5e49a1add04ad2377711c6da0512bb450fcbb49c.1664497281.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ab8958da839ecadc0ebff9f0a221ef49a2e5a4cc.1664497281.git.objelf@gmail.com>
References: <ab8958da839ecadc0ebff9f0a221ef49a2e5a4cc.1664497281.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_174646_126352_6CD61452 
X-CRM114-Status: GOOD (  18.20  )
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

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jing Cai <jing.cai@mediatek.com>
---
The patch is built and tested on the top of the patches
[v6,1/3] Bluetooth: Add support for hci devcoredump
[v6,2/3] Bluetooth: btusb: Add btusb devcoredump support
[v6,3/3] Bluetooth: btintel: Add Intel devcoredump support
which are contributed from Manish Mandlik

v2: rebase onto the latest codebase
---
 drivers/bluetooth/btmtk.c |  16 ++++++
 drivers/bluetooth/btmtk.h |  14 +++++
 drivers/bluetooth/btusb.c | 114 ++++++++++++++++++++------------------
 3 files changed, 90 insertions(+), 54 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 809762d64fc6..77df7b5c3ef3 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -53,6 +53,8 @@ struct btmtk_section_map {
 	};
 } __packed;
 
+static struct btmtk_reset_work reset_work;
+
 int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 			      wmt_cmd_sync_func_t wmt_cmd_sync)
 {
@@ -280,6 +282,20 @@ int btmtk_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 }
 EXPORT_SYMBOL_GPL(btmtk_set_bdaddr);
 
+void btmtk_init_reset_work(struct hci_dev *hdev, work_func_t func)
+{
+	reset_work.hdev = hdev;
+	INIT_WORK(&reset_work.work, func);
+}
+EXPORT_SYMBOL_GPL(btmtk_init_reset_work);
+
+void btmtk_reset_sync(struct hci_dev *hdev)
+{
+	schedule_work(&reset_work.work);
+	flush_work(&reset_work.work);
+}
+EXPORT_SYMBOL_GPL(btmtk_reset_sync);
+
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
 MODULE_DESCRIPTION("Bluetooth support for MediaTek devices ver " VERSION);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 2a88ea8e475e..22d39f637652 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -119,6 +119,11 @@ struct btmtk_hci_wmt_params {
 	u32 *status;
 };
 
+struct btmtk_reset_work {
+	struct hci_dev *hdev;
+	struct work_struct work;
+};
+
 typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
 				   struct btmtk_hci_wmt_params *);
 
@@ -131,6 +136,8 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 
 int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 			 wmt_cmd_sync_func_t wmt_cmd_sync);
+void btmtk_init_reset_work(struct hci_dev *hdev, work_func_t func);
+void btmtk_reset_sync(struct hci_dev *hdev);
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -151,4 +158,11 @@ static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 	return -EOPNOTSUPP;
 }
 
+static void btmtk_init_reset_work(struct hci_dev *hdev, work_func_t func)
+{
+}
+
+static void btmtk_reset_sync(struct hci_dev *hdev)
+{
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 9ef0dc648573..d0130a5b91d6 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2741,6 +2741,63 @@ static u32 btusb_mtk_reset_done(struct hci_dev *hdev)
 	return val;
 }
 
+static void btusb_mtk_reset_work(struct work_struct *work)
+{
+	struct btmtk_reset_work *info = container_of(work,
+						     struct btmtk_reset_work,
+						     work);
+	struct hci_dev *hdev = info->hdev;
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	u32 val;
+	int err;
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
+	err = readx_poll_timeout(btusb_mtk_reset_done, hdev, val,
+				 val & MTK_BT_RST_DONE,
+				 20000, 1000000);
+	if (err < 0)
+		bt_dev_err(hdev, "Reset timeout");
+
+	if (val & MTK_BT_RST_DONE)
+		bt_dev_err(hdev, "Bluetooth Reset Successfully");
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
 static int btusb_mtk_setup(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -2777,6 +2834,8 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 		}
 	}
 
+	btmtk_init_reset_work(hdev, btusb_mtk_reset_work);
+
 	switch (dev_id) {
 	case 0x7663:
 		fwname = FIRMWARE_MT7663;
@@ -2926,59 +2985,6 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
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
-				 val & MTK_BT_RST_DONE,
-				 20000, 1000000);
-	if (err < 0)
-		bt_dev_err(hdev, "Reset timeout");
-
-	if (val & MTK_BT_RST_DONE)
-		bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
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
@@ -3902,7 +3908,7 @@ static int btusb_probe(struct usb_interface *intf,
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


