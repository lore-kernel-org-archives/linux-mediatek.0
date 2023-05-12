Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EADC77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 21:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y69ufMAqUYfVUbII4JxVwe9FvW7v4sAn6IsWvtVGOs=; b=Cj4Y1Ut6HOHPeVbrmYftWwaPoq
	AHC1WhGAP2Ckm1YSq6UA3k4I+fTkMukMTNAAN3QPaqDJTZbj5Ifwth7DO6axPbYIzgZEF5A21mdUZ
	XGsk1xOxLY2AOZOFeLXl+0iQtSs7n/2mCSl1ZG1bj1CVWC4XW9fSRgoQr/7e1o/eGYBtubX9WnwNW
	prKVObBj2egEaGO2Vwqff+oEaDLZwQkUesHwjqS9sNLNasOzFEWajKmkLtCue4Nd+S24tCYFN8zlg
	slkPThB4v01dVpab6A6rREgDueCE436hsGlPOR6oXCrmr8D3CMwHqsD7JCjv/LOqJDrwkNoVW/jSM
	jjQJjYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaBh-00D3sC-18;
	Fri, 12 May 2023 21:20:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaBd-00D3qk-2y
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 21:20:27 +0000
X-UUID: ca84eddcf10a11ed83ed1395ce914268-20230512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2y69ufMAqUYfVUbII4JxVwe9FvW7v4sAn6IsWvtVGOs=;
	b=Be5jqB8eF7A0jkCPxRgVmL3pxXhwYoI23jljbMkQKQ19DAALpLm6dk+jh2gt5NnMASKocWXoy06H1Mg6+fv8+/RPMIqHz0I9OjsK4UmhAhAuAVihwTNw77+fpP1lI+4v6dXmFse6LEPmUljoQ+kH5wo4Dq2EcmNhwye7w7RiIh4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:f4bca3a2-83c0-4592-8489-253cafe75bf5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:d831033b-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: ca84eddcf10a11ed83ed1395ce914268-20230512
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1135658024; Fri, 12 May 2023 14:20:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 13 May 2023 05:20:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 13 May 2023 05:20:14 +0800
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
Subject: [PATCH v6 3/3] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
Date: Sat, 13 May 2023 05:20:09 +0800
Message-ID: <850ac832598f9d8558996fade7f7db0c0cf73521.1683925801.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cc4ae6f7545cdf0615279890521b11774f062add.1683925801.git.objelf@gmail.com>
References: <cc4ae6f7545cdf0615279890521b11774f062add.1683925801.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_142025_966196_922543ED 
X-CRM114-Status: GOOD (  21.31  )
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

Co-developed-by: Chris Lu <chris.lu@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jing Cai <jing.cai@mediatek.com>
---
v2, v3: rebase onto the latest codebase
v4: update the newest API usage for the coredump which was already
    into the upstream
v5: support devcoredump on hdev basis
v6: reuse the coredump state HCI_DEVCOREDUMP_* in driver
    and drop the driver name copying
---
 drivers/bluetooth/btmtk.c | 106 ++++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btmtk.h |  27 ++++++++++
 drivers/bluetooth/btusb.c |  14 +++++
 3 files changed, 147 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index ac2fac7e3c5f..60233afc0a9c 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -53,6 +53,56 @@ struct btmtk_section_map {
 	};
 } __packed;
 
+static void btmtk_coredump(struct hci_dev *hdev)
+{
+	int err;
+
+	err = __hci_cmd_send(hdev, 0xfd5b, 0, NULL);
+	if (err < 0)
+		bt_dev_err(hdev, "Coredump failed (%d)", err);
+}
+
+static void btmtk_coredump_hdr(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_data *data = hci_get_priv(hdev);
+	char buf[80];
+
+	snprintf(buf, sizeof(buf), "Controller Name: 0x%X\n",
+		 data->cd_info.dev_id);
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Firmware Version: 0x%X\n",
+		 data->cd_info.fw_version);
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Driver: %s\n",
+		 data->cd_info.driver_name);
+	skb_put_data(skb, buf, strlen(buf));
+
+	snprintf(buf, sizeof(buf), "Vendor: MediaTek\n");
+	skb_put_data(skb, buf, strlen(buf));
+}
+
+static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
+{
+	struct btmtk_data *data = hci_get_priv(hdev);
+
+	switch (state) {
+	case HCI_DEVCOREDUMP_IDLE:
+		data->cd_info.state = HCI_DEVCOREDUMP_IDLE;
+		break;
+	case HCI_DEVCOREDUMP_ACTIVE:
+		data->cd_info.state = HCI_DEVCOREDUMP_ACTIVE;
+		break;
+	case HCI_DEVCOREDUMP_TIMEOUT:
+	case HCI_DEVCOREDUMP_ABORT:
+	case HCI_DEVCOREDUMP_DONE:
+		data->cd_info.state = HCI_DEVCOREDUMP_IDLE;
+		btmtk_reset_sync(hdev);
+		break;
+	}
+}
+
 int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 			      wmt_cmd_sync_func_t wmt_cmd_sync)
 {
@@ -295,6 +345,62 @@ void btmtk_reset_sync(struct hci_dev *hdev)
 }
 EXPORT_SYMBOL_GPL(btmtk_reset_sync);
 
+int btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id,
+			     const char *name, u32 fw_version)
+{
+	struct btmtk_data *data = hci_get_priv(hdev);
+
+	if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
+		return -EOPNOTSUPP;
+
+	data->cd_info.dev_id = dev_id;
+	data->cd_info.fw_version = fw_version;
+	data->cd_info.state = HCI_DEVCOREDUMP_IDLE;
+	data->cd_info.driver_name = name;
+
+	return hci_devcd_register(hdev, btmtk_coredump, btmtk_coredump_hdr,
+				  btmtk_coredump_notify);
+}
+EXPORT_SYMBOL_GPL(btmtk_register_coredump);
+
+int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_data *data = hci_get_priv(hdev);
+	int err;
+
+	if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
+		return 0;
+
+	switch (data->cd_info.state) {
+	case HCI_DEVCOREDUMP_IDLE:
+		err = hci_devcd_init(hdev, MTK_COREDUMP_SIZE);
+		if (err < 0)
+			break;
+		/* It is supposed coredump can be done within 5 seconds */
+		schedule_delayed_work(&hdev->dump.dump_timeout,
+				      msecs_to_jiffies(5000));
+		fallthrough;
+	case HCI_DEVCOREDUMP_ACTIVE:
+	default:
+		err = hci_devcd_append(hdev, skb);
+		if (err < 0)
+			break;
+
+		if (skb->len > 12 &&
+		    !strncmp((char *)&skb->data[skb->len - 13],
+			     MTK_COREDUMP_END, 12))
+			hci_devcd_complete(hdev);
+
+		break;
+	}
+
+	if (err < 0)
+		kfree_skb(skb);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(btmtk_process_coredump);
+
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
 MODULE_DESCRIPTION("Bluetooth support for MediaTek devices ver " VERSION);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 6245662f6ccb..852a67db8f80 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -21,6 +21,9 @@
 #define MT7921_DLSTATUS 0x7c053c10
 #define BT_DL_STATE BIT(1)
 
+#define MTK_COREDUMP_SIZE		(1024 * 1000)
+#define MTK_COREDUMP_END		"coredump end"
+
 enum {
 	BTMTK_WMT_PATCH_DWNLD = 0x1,
 	BTMTK_WMT_TEST = 0x2,
@@ -119,12 +122,20 @@ struct btmtk_hci_wmt_params {
 	u32 *status;
 };
 
+struct btmtk_coredump_info {
+	const char *driver_name;
+	u32 dev_id;
+	u32 fw_version;
+	int state;
+};
+
 typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
 				   struct btmtk_hci_wmt_params *);
 
 typedef int (*btmtk_reset_sync_func_t)(struct hci_dev *, void *);
 
 struct btmtk_data {
+	struct btmtk_coredump_info cd_info;
 	btmtk_reset_sync_func_t reset_sync;
 };
 
@@ -139,6 +150,11 @@ int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 			 wmt_cmd_sync_func_t wmt_cmd_sync);
 
 void btmtk_reset_sync(struct hci_dev *hdev);
+
+int btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const char *name,
+			     u32 fw_version);
+
+int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -162,4 +178,15 @@ static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
 static void btmtk_reset_sync(struct hci_dev *hdev)
 {
 }
+
+static int btmtk_register_coredump(struct hci_dev *hdev, u32 dev_id, const char *name,
+			     u32 fw_version)
+{
+	return -EOPNOTSUPP;
+}
+
+static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	return -EOPNOTSUPP;
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 034edd8ad777..1c2a0cbcf62e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3035,6 +3035,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	}
 
 	btmtk_data->reset_sync = btusb_mtk_reset_work;
+	err = btmtk_register_coredump(hdev, dev_id, btusb_driver.name,
+				fw_version);
+	if (err < 0)
+		bt_dev_err(hdev, "Failed to register coredump (%d)", err);
 
 	switch (dev_id) {
 	case 0x7663:
@@ -3189,6 +3193,7 @@ static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);
+	struct sk_buff *skb_cd;
 
 	switch (handle) {
 	case 0xfc6f:		/* Firmware dump from device */
@@ -3196,6 +3201,15 @@ static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
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


