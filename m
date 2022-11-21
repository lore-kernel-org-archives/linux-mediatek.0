Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D14C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNtHweqp/lQ+VbBZiOp9AAQlB/1yRyJZTvlhA0U6eUM=; b=k7Mua71Wsh/PkFqvukNDFN6kta
	XRFM8oSDRQ6Pm+bLoyMM/ybFX9Rez9o7memd/RyW9YLBFas6vutmrDe26IXXe6hJty7YEQknc8D2z
	5li9MA1Gn3POf5MB2JQnkgERJNmaebJ0WsBHNa6kqRFpf51+7bgOVFN4AZ0e1UNFewQiLvkbfyp/f
	YWG4u090p06jTo/LySfXBEE60+AmyxYSAhAqpARrw60J4DT+jWj0AXkr0jOehU9Ket5KSjmgvPh5P
	sVD77o5pfPAaCcDHEwwE9jeoHOtE3+W58pK7g5T1KB3G/E11fncN2XG67wLMn69EKAIFaRSNPYYpG
	9ZtzT9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxCfD-00HIns-89; Mon, 21 Nov 2022 19:41:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxCf9-00HIms-Im
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 19:41:05 +0000
X-UUID: 827f40fb91dd40ec94880d7f1570ff62-20221121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pNtHweqp/lQ+VbBZiOp9AAQlB/1yRyJZTvlhA0U6eUM=;
	b=oDphsNHWetgZMRKm81AD4MOnsSbxbyJyhMZy/MG01Jz6rm51f6un4ISRp0saq3au7mZzKnsqra6gI4/Gfy4YM9sMGG2X/dTlLvFCLPUseM2wXMbuJyCCVkjiMqAGCiHMQRwwYOFxYr07EzevIMat7nba2yEkbMw+uNj24Frnxsw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:d79fdf14-5059-41fe-8038-9497fbb565f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:8183d2db-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 827f40fb91dd40ec94880d7f1570ff62-20221121
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1537400624; Mon, 21 Nov 2022 12:40:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 03:20:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 03:20:56 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<jenhao.yang@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
	<abhishekpandit@chromium.org>, <mcchou@chromium.org>, <shawnku@google.com>,
	<linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jing Cai <jing.cai@mediatek.com>
Subject: [PATCH v3 3/3] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
Date: Tue, 22 Nov 2022 03:20:53 +0800
Message-ID: <1f4a630c921a6594efd052d36cdd5841bc155342.1669057170.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <caf41c6a33b1ceeb36ec7261b0cc894082352c46.1669057170.git.objelf@gmail.com>
References: <caf41c6a33b1ceeb36ec7261b0cc894082352c46.1669057170.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_114103_661116_EDFDC967 
X-CRM114-Status: GOOD (  21.06  )
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

This patch implement function .coredump() and dmp_hdr() in btusb
driver for MediaTek controller.  FW core dump was triggered by FW
specific event to show something unexpected happened in the controller.

The driver would be responsible for collecting and uploading the device
core dump pieces in hci driver using core dump API. Once we finished
the whole process, the driver would reset the controller to recover the
kind of fatal error.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jing Cai <jing.cai@mediatek.com>
---
v2, v3: rebase onto the latest codebase
---
 drivers/bluetooth/btmtk.c | 124 ++++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btmtk.h |  13 ++++
 drivers/bluetooth/btusb.c |  11 ++++
 3 files changed, 148 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 77df7b5c3ef3..2835ae28ae35 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -18,6 +18,14 @@
 #define MTK_FW_ROM_PATCH_SEC_MAP_SIZE	64
 #define MTK_SEC_MAP_COMMON_SIZE	12
 #define MTK_SEC_MAP_NEED_SEND_SIZE	52
+#define MTK_DRIVER_NAME_LEN		16
+#define MTK_COREDUMP_END		"coredump end"
+
+enum {
+	BTMTK_COREDUMP_INIT,
+	BTMTK_COREDUMP_DISABLED,
+	BTMTK_COREDUMP_ACTIVE,
+};
 
 struct btmtk_patch_header {
 	u8 datetime[16];
@@ -53,8 +61,65 @@ struct btmtk_section_map {
 	};
 } __packed;
 
+static struct btmtk_coredump_info {
+	struct hci_dev *hdev;
+	char driver_name[MTK_DRIVER_NAME_LEN];
+	u32 dev_id;
+	u32 fw_version;
+	int state;
+} coredump_info;
+
 static struct btmtk_reset_work reset_work;
 
+static void btmtk_coredump(struct hci_dev *hdev)
+{
+	int err;
+
+	err = __hci_cmd_send(hdev, 0xfd5b, 0, NULL);
+	if (err < 0)
+		bt_dev_err(hdev, "Coredump failed (%d)", err);
+}
+
+static int btmtk_coredump_hdr(struct hci_dev *hdev, char *buf, size_t size)
+{
+	char *ptr = buf;
+	size_t rem = size;
+	size_t read = 0;
+
+	read = snprintf(ptr, rem, "Controller Name: 0x%X\n", coredump_info.dev_id);
+	rem -= read;
+	ptr += read;
+
+	read = snprintf(ptr, rem, "Firmware Version: 0x%X\n", coredump_info.fw_version);
+	rem -= read;
+	ptr += read;
+
+	read = snprintf(ptr, rem, "Driver: %s\n", coredump_info.driver_name);
+	rem -= read;
+	ptr += read;
+
+	read = snprintf(ptr, rem, "Vendor: MediaTek\n");
+	rem -= read;
+	ptr += read;
+
+	return size - rem;
+}
+
+static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
+{
+	switch (state) {
+	case HCI_DEVCOREDUMP_ACTIVE:
+		coredump_info.state = BTMTK_COREDUMP_ACTIVE;
+		break;
+	case HCI_DEVCOREDUMP_TIMEOUT:
+	case HCI_DEVCOREDUMP_ABORT:
+	case HCI_DEVCOREDUMP_DONE:
+		coredump_info.state = BTMTK_COREDUMP_INIT;
+		btmtk_reset_sync(coredump_info.hdev);
+		break;
+	}
+}
+
 int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 			      wmt_cmd_sync_func_t wmt_cmd_sync)
 {
@@ -296,6 +361,65 @@ void btmtk_reset_sync(struct hci_dev *hdev)
 }
 EXPORT_SYMBOL_GPL(btmtk_reset_sync);
 
+void btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id,
+			     const char *name, u32 fw_version)
+{
+	if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
+		return;
+
+	coredump_info.hdev = hdev;
+	coredump_info.dev_id = dev_id;
+	coredump_info.fw_version = fw_version;
+	coredump_info.state = BTMTK_COREDUMP_INIT;
+	strncpy(coredump_info.driver_name, name, MTK_DRIVER_NAME_LEN - 1);
+
+	hci_devcoredump_register(hdev, btmtk_coredump, btmtk_coredump_hdr,
+				 btmtk_coredump_notify);
+}
+EXPORT_SYMBOL_GPL(btmtk_register_coredump);
+
+int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	int err;
+
+	if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
+		return 0;
+
+	switch (coredump_info.state) {
+	case BTMTK_COREDUMP_DISABLED:
+		err = -EINVAL;
+		break;
+	case BTMTK_COREDUMP_INIT:
+		err = hci_devcoredump_init(hdev, 1024000);
+		if (err < 0)
+			break;
+		/* It is supposed coredump can be done within 5 seconds */
+		schedule_delayed_work(&hdev->dump.dump_timeout,
+				      msecs_to_jiffies(5000));
+		fallthrough;
+	case BTMTK_COREDUMP_ACTIVE:
+	default:
+		err = hci_devcoredump_append(hdev, skb);
+		if (err < 0)
+			break;
+
+		if (skb->len > 12 &&
+		    !strncmp((char *)&skb->data[skb->len - 13],
+			     MTK_COREDUMP_END, 12))
+			hci_devcoredump_complete(hdev);
+
+		break;
+	}
+
+	if (err < 0) {
+		coredump_info.state = BTMTK_COREDUMP_DISABLED;
+		kfree_skb(skb);
+	}
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(btmtk_process_coredump);
+
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
 MODULE_DESCRIPTION("Bluetooth support for MediaTek devices ver " VERSION);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 22d39f637652..faf941ce7ca2 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -138,6 +138,9 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 			 wmt_cmd_sync_func_t wmt_cmd_sync);
 void btmtk_init_reset_work(struct hci_dev *hdev, work_func_t func);
 void btmtk_reset_sync(struct hci_dev *hdev);
+void btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const char *name,
+			     u32 fw_version);
+int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -165,4 +168,14 @@ static void btmtk_init_reset_work(struct hci_dev *hdev, work_func_t func)
 static void btmtk_reset_sync(struct hci_dev *hdev)
 {
 }
+
+void btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const char *name,
+			     u32 fw_version)
+{
+}
+
+static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	return -EOPNOTSUPP;
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 0ad54a4d095e..f8ac8dfa425b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2777,6 +2777,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	}
 
 	btmtk_init_reset_work(hdev, btusb_mtk_reset_work);
+	btmtk_register_coredump(hdev, dev_id, btusb_driver.name, fw_version);
 
 	switch (dev_id) {
 	case 0x7663:
@@ -2931,6 +2932,7 @@ static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);
+	struct sk_buff *skb_cd;
 
 	switch (handle) {
 	case 0xfc6f:		/* Firmware dump from device */
@@ -2938,6 +2940,15 @@ static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
 		 * suspend and thus disable auto-suspend.
 		 */
 		usb_disable_autosuspend(data->udev);
+
+		/* We need to forward the diagnostic packet to userspace daemon
+		 * for backward compatibility, so we have to clone the packet
+		 * extraly for the in-kernel coredump support.
+		 */
+		skb_cd = skb_clone(skb, GFP_ATOMIC);
+		if (skb_cd)
+			btmtk_process_coredump(hdev, skb_cd);
+
 		fallthrough;
 	case 0x05ff:		/* Firmware debug logging 1 */
 	case 0x05fe:		/* Firmware debug logging 2 */
-- 
2.25.1


