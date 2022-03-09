Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1320C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 00:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9MDxAcl1KRj0mokt7hzS9DewAOam1z4tH7PGaJck494=; b=FHk7PSijluTe0b
	JJBp7LEeaee9RelEeDFLNzF4PA0TiztBPDsrXlnxnm2xQHPlu2DknD0HwLyNqpgoLbpUwRzjEKfWU
	XBL6kykvVez7/aGQWW5YrpJ/RjGXCgA8R25hJDlszFRBrkR+Qze8doUGxEQu7DlxTfWWBrO2Vmm3M
	K4eQ3VXiyACY47QSgtn7giILDO6nvtfbM2HaaEEOPHHOLGA13pnRYK0eOlWKIE6UvtsJmXUbZY5eM
	mP0wTWsATJIw6zGA8rlwwYRIRrpO2wuOug0/e/ctKAZ+3Yis/x4aRiY8Gz+5v2XZr39xuuMJLPylP
	9HrtE8CFIglEabSV3ldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRjxw-006i6C-Tt; Wed, 09 Mar 2022 00:14:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRjxt-006i4C-1a
 for linux-mediatek@lists.infradead.org; Wed, 09 Mar 2022 00:14:06 +0000
X-UUID: 7f7fedcd64194e64a3c02f5682b869ba-20220308
X-UUID: 7f7fedcd64194e64a3c02f5682b869ba-20220308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 750134756; Tue, 08 Mar 2022 17:13:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 16:03:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 9 Mar 2022 08:03:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 08:03:55 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/3] Bluetooth: btmtkuart: rely on BT_MTK module
Date: Wed, 9 Mar 2022 08:03:52 +0800
Message-ID: <f0167a9631fd0b392490311825ff0f826c054bc1.1646783737.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_161405_134541_BA7C5C61 
X-CRM114-Status: GOOD (  24.40  )
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

From: Sean Wang <sean.wang@mediatek.com>

Rely on btmtk module to reduce duplicated code

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/Kconfig     |   1 +
 drivers/bluetooth/btmtk.c     |   1 +
 drivers/bluetooth/btmtk.h     |   1 +
 drivers/bluetooth/btmtkuart.c | 184 +++++-----------------------------
 4 files changed, 29 insertions(+), 158 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 36380e618ba4..e30707405455 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -400,6 +400,7 @@ config BT_MTKSDIO
 config BT_MTKUART
 	tristate "MediaTek HCI UART driver"
 	depends on SERIAL_DEV_BUS
+	select BT_MTK
 	help
 	  MediaTek Bluetooth HCI UART driver.
 	  This driver is required if you want to use MediaTek Bluetooth
diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 526dfdf1fe01..809762d64fc6 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -285,6 +285,7 @@ MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
 MODULE_DESCRIPTION("Bluetooth support for MediaTek devices ver " VERSION);
 MODULE_VERSION(VERSION);
 MODULE_LICENSE("GPL");
+MODULE_FIRMWARE(FIRMWARE_MT7622);
 MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
 MODULE_FIRMWARE(FIRMWARE_MT7961);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 013850fd2055..2a88ea8e475e 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /* Copyright (C) 2021 MediaTek Inc. */
 
+#define FIRMWARE_MT7622		"mediatek/mt7622pr2h.bin"
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 9ba22b13b4fa..136b901eb6f2 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -28,13 +28,10 @@
 #include <net/bluetooth/hci_core.h>
 
 #include "h4_recv.h"
+#include "btmtk.h"
 
 #define VERSION "0.2"
 
-#define FIRMWARE_MT7622		"mediatek/mt7622pr2h.bin"
-#define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
-#define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
-
 #define MTK_STP_TLR_SIZE	2
 
 #define BTMTKUART_TX_STATE_ACTIVE	1
@@ -44,25 +41,6 @@
 
 #define BTMTKUART_FLAG_STANDALONE_HW	 BIT(0)
 
-enum {
-	MTK_WMT_PATCH_DWNLD = 0x1,
-	MTK_WMT_TEST = 0x2,
-	MTK_WMT_WAKEUP = 0x3,
-	MTK_WMT_HIF = 0x4,
-	MTK_WMT_FUNC_CTRL = 0x6,
-	MTK_WMT_RST = 0x7,
-	MTK_WMT_SEMAPHORE = 0x17,
-};
-
-enum {
-	BTMTK_WMT_INVALID,
-	BTMTK_WMT_PATCH_UNDONE,
-	BTMTK_WMT_PATCH_DONE,
-	BTMTK_WMT_ON_UNDONE,
-	BTMTK_WMT_ON_DONE,
-	BTMTK_WMT_ON_PROGRESS,
-};
-
 struct mtk_stp_hdr {
 	u8	prefix;
 	__be16	dlen;
@@ -74,44 +52,6 @@ struct btmtkuart_data {
 	const char *fwname;
 };
 
-struct mtk_wmt_hdr {
-	u8	dir;
-	u8	op;
-	__le16	dlen;
-	u8	flag;
-} __packed;
-
-struct mtk_hci_wmt_cmd {
-	struct mtk_wmt_hdr hdr;
-	u8 data[256];
-} __packed;
-
-struct btmtk_hci_wmt_evt {
-	struct hci_event_hdr hhdr;
-	struct mtk_wmt_hdr whdr;
-} __packed;
-
-struct btmtk_hci_wmt_evt_funcc {
-	struct btmtk_hci_wmt_evt hwhdr;
-	__be16 status;
-} __packed;
-
-struct btmtk_tci_sleep {
-	u8 mode;
-	__le16 duration;
-	__le16 host_duration;
-	u8 host_wakeup_pin;
-	u8 time_compensation;
-} __packed;
-
-struct btmtk_hci_wmt_params {
-	u8 op;
-	u8 flag;
-	u16 dlen;
-	const void *data;
-	u32 *status;
-};
-
 struct btmtkuart_dev {
 	struct hci_dev *hdev;
 	struct serdev_device *serdev;
@@ -153,29 +93,34 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 	struct btmtk_hci_wmt_evt_funcc *wmt_evt_funcc;
 	u32 hlen, status = BTMTK_WMT_INVALID;
 	struct btmtk_hci_wmt_evt *wmt_evt;
-	struct mtk_hci_wmt_cmd wc;
-	struct mtk_wmt_hdr *hdr;
+	struct btmtk_hci_wmt_cmd *wc;
+	struct btmtk_wmt_hdr *hdr;
 	int err;
 
+	/* Send the WMT command and wait until the WMT event returns */
 	hlen = sizeof(*hdr) + wmt_params->dlen;
 	if (hlen > 255) {
 		err = -EINVAL;
 		goto err_free_skb;
 	}
 
-	hdr = (struct mtk_wmt_hdr *)&wc;
+	wc = kzalloc(hlen, GFP_KERNEL);
+	if (!wc)
+		return -ENOMEM;
+
+	hdr = &wc->hdr;
 	hdr->dir = 1;
 	hdr->op = wmt_params->op;
 	hdr->dlen = cpu_to_le16(wmt_params->dlen + 1);
 	hdr->flag = wmt_params->flag;
-	memcpy(wc.data, wmt_params->data, wmt_params->dlen);
+	memcpy(wc->data, wmt_params->data, wmt_params->dlen);
 
 	set_bit(BTMTKUART_TX_WAIT_VND_EVT, &bdev->tx_state);
 
-	err = __hci_cmd_send(hdev, 0xfc6f, hlen, &wc);
+	err = __hci_cmd_send(hdev, 0xfc6f, hlen, wc);
 	if (err < 0) {
 		clear_bit(BTMTKUART_TX_WAIT_VND_EVT, &bdev->tx_state);
-		goto err_free_skb;
+		goto err_free_wc;
 	}
 
 	/* The vendor specific WMT commands are all answered by a vendor
@@ -192,14 +137,14 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 	if (err == -EINTR) {
 		bt_dev_err(hdev, "Execution of wmt command interrupted");
 		clear_bit(BTMTKUART_TX_WAIT_VND_EVT, &bdev->tx_state);
-		goto err_free_skb;
+		goto err_free_wc;
 	}
 
 	if (err) {
 		bt_dev_err(hdev, "Execution of wmt command timed out");
 		clear_bit(BTMTKUART_TX_WAIT_VND_EVT, &bdev->tx_state);
 		err = -ETIMEDOUT;
-		goto err_free_skb;
+		goto err_free_wc;
 	}
 
 	/* Parse and handle the return WMT event */
@@ -212,13 +157,13 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 	}
 
 	switch (wmt_evt->whdr.op) {
-	case MTK_WMT_SEMAPHORE:
+	case BTMTK_WMT_SEMAPHORE:
 		if (wmt_evt->whdr.flag == 2)
 			status = BTMTK_WMT_PATCH_UNDONE;
 		else
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
-	case MTK_WMT_FUNC_CTRL:
+	case BTMTK_WMT_FUNC_CTRL:
 		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
 		if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
 			status = BTMTK_WMT_ON_DONE;
@@ -235,86 +180,12 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 err_free_skb:
 	kfree_skb(bdev->evt_skb);
 	bdev->evt_skb = NULL;
+err_free_wc:
+	kfree(wc);
 
 	return err;
 }
 
-static int mtk_setup_firmware(struct hci_dev *hdev, const char *fwname)
-{
-	struct btmtk_hci_wmt_params wmt_params;
-	const struct firmware *fw;
-	const u8 *fw_ptr;
-	size_t fw_size;
-	int err, dlen;
-	u8 flag;
-
-	err = request_firmware(&fw, fwname, &hdev->dev);
-	if (err < 0) {
-		bt_dev_err(hdev, "Failed to load firmware file (%d)", err);
-		return err;
-	}
-
-	fw_ptr = fw->data;
-	fw_size = fw->size;
-
-	/* The size of patch header is 30 bytes, should be skip */
-	if (fw_size < 30) {
-		err = -EINVAL;
-		goto free_fw;
-	}
-
-	fw_size -= 30;
-	fw_ptr += 30;
-	flag = 1;
-
-	wmt_params.op = MTK_WMT_PATCH_DWNLD;
-	wmt_params.status = NULL;
-
-	while (fw_size > 0) {
-		dlen = min_t(int, 250, fw_size);
-
-		/* Tell device the position in sequence */
-		if (fw_size - dlen <= 0)
-			flag = 3;
-		else if (fw_size < fw->size - 30)
-			flag = 2;
-
-		wmt_params.flag = flag;
-		wmt_params.dlen = dlen;
-		wmt_params.data = fw_ptr;
-
-		err = mtk_hci_wmt_sync(hdev, &wmt_params);
-		if (err < 0) {
-			bt_dev_err(hdev, "Failed to send wmt patch dwnld (%d)",
-				   err);
-			goto free_fw;
-		}
-
-		fw_size -= dlen;
-		fw_ptr += dlen;
-	}
-
-	wmt_params.op = MTK_WMT_RST;
-	wmt_params.flag = 4;
-	wmt_params.dlen = 0;
-	wmt_params.data = NULL;
-	wmt_params.status = NULL;
-
-	/* Activate funciton the firmware providing to */
-	err = mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
-		bt_dev_err(hdev, "Failed to send wmt rst (%d)", err);
-		goto free_fw;
-	}
-
-	/* Wait a few moments for firmware activation done */
-	usleep_range(10000, 12000);
-
-free_fw:
-	release_firmware(fw);
-	return err;
-}
-
 static int btmtkuart_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btmtkuart_dev *bdev = hci_get_drvdata(hdev);
@@ -645,7 +516,7 @@ static int btmtkuart_func_query(struct hci_dev *hdev)
 	u8 param = 0;
 
 	/* Query whether the function is enabled */
-	wmt_params.op = MTK_WMT_FUNC_CTRL;
+	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 4;
 	wmt_params.dlen = sizeof(param);
 	wmt_params.data = &param;
@@ -672,7 +543,7 @@ static int btmtkuart_change_baudrate(struct hci_dev *hdev)
 	 * ready to change a new baudrate.
 	 */
 	baudrate = cpu_to_le32(bdev->desired_speed);
-	wmt_params.op = MTK_WMT_HIF;
+	wmt_params.op = BTMTK_WMT_HIF;
 	wmt_params.flag = 1;
 	wmt_params.dlen = 4;
 	wmt_params.data = &baudrate;
@@ -706,7 +577,7 @@ static int btmtkuart_change_baudrate(struct hci_dev *hdev)
 	usleep_range(20000, 22000);
 
 	/* Test the new baudrate */
-	wmt_params.op = MTK_WMT_TEST;
+	wmt_params.op = BTMTK_WMT_TEST;
 	wmt_params.flag = 7;
 	wmt_params.dlen = 0;
 	wmt_params.data = NULL;
@@ -741,7 +612,7 @@ static int btmtkuart_setup(struct hci_dev *hdev)
 	 * do any setups.
 	 */
 	if (test_bit(BTMTKUART_REQUIRED_WAKEUP, &bdev->tx_state)) {
-		wmt_params.op = MTK_WMT_WAKEUP;
+		wmt_params.op = BTMTK_WMT_WAKEUP;
 		wmt_params.flag = 3;
 		wmt_params.dlen = 0;
 		wmt_params.data = NULL;
@@ -760,7 +631,7 @@ static int btmtkuart_setup(struct hci_dev *hdev)
 		btmtkuart_change_baudrate(hdev);
 
 	/* Query whether the firmware is already download */
-	wmt_params.op = MTK_WMT_SEMAPHORE;
+	wmt_params.op = BTMTK_WMT_SEMAPHORE;
 	wmt_params.flag = 1;
 	wmt_params.dlen = 0;
 	wmt_params.data = NULL;
@@ -778,7 +649,7 @@ static int btmtkuart_setup(struct hci_dev *hdev)
 	}
 
 	/* Setup a firmware which the device definitely requires */
-	err = mtk_setup_firmware(hdev, bdev->data->fwname);
+	err = btmtk_setup_firmware(hdev, bdev->data->fwname, mtk_hci_wmt_sync);
 	if (err < 0)
 		return err;
 
@@ -801,7 +672,7 @@ static int btmtkuart_setup(struct hci_dev *hdev)
 	}
 
 	/* Enable Bluetooth protocol */
-	wmt_params.op = MTK_WMT_FUNC_CTRL;
+	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 0;
 	wmt_params.dlen = sizeof(param);
 	wmt_params.data = &param;
@@ -846,7 +717,7 @@ static int btmtkuart_shutdown(struct hci_dev *hdev)
 	int err;
 
 	/* Disable the device */
-	wmt_params.op = MTK_WMT_FUNC_CTRL;
+	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 0;
 	wmt_params.dlen = sizeof(param);
 	wmt_params.data = &param;
@@ -1131,6 +1002,3 @@ MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek Bluetooth Serial driver ver " VERSION);
 MODULE_VERSION(VERSION);
 MODULE_LICENSE("GPL");
-MODULE_FIRMWARE(FIRMWARE_MT7622);
-MODULE_FIRMWARE(FIRMWARE_MT7663);
-MODULE_FIRMWARE(FIRMWARE_MT7668);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
