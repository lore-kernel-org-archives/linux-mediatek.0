Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6222BC41513
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 11:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVodKyRsOcT/STMe2Z91D8J6McJz8ssQ55PR5jZhylM=; b=SKwab9GXIdowtaH6CWZwzGrpOI
	ub0ocqKY88FhCfXMa1VEjfgYKlc8fOzfAYY2fytamYXTWtzxPU9wAWxr7F2dnXn4x5xS8Xs7LuVtQ
	6TfOHx7gzINsUZa3AYBWw2F7y/XW1yd3z/IM1EY4UERdscL/R0HtvLSSbhTb3RT21UNJuy3Oi7SV1
	R+PWEpN2dbXatMlCcffLNAK8qWe/NpiYf2aJxjvaic580AqIbCCEBZQ8QMOOtBvAvtrfKJkr+bNxX
	fUwZSn4rGaXCVIpvar7wzbDOBTUyzt3In6IPt074JXn6GI0V8cGzLe2Ru0HU47FaC9Wz2R5zQ5s+Z
	3sJQzAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObj2-00000006TW0-2Zr5;
	Tue, 02 Jul 2024 11:31:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sObiv-00000006TTF-3vD8
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 11:31:06 +0000
X-UUID: 8c9d5910386611ef9daba96ee3f3cc8c-20240702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bVodKyRsOcT/STMe2Z91D8J6McJz8ssQ55PR5jZhylM=;
	b=cigV2OsMh+jq9TDtFUldrxD/KZ9NZimNfH25M/YjvH6b0mCEXV1KMdjvy3QcldWKN6eQVYla4+W15u0y2HeIzrEncHYpRvskogADSL1sZRkofnGL2ZQHz+1Um1gKW2Pi/fjCkLXfHJ73yX0Q6DmnYUuxSrtmTbCac96KUmUjspQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:b981e06b-a5e9-48ea-8fe0-dfa7cda5c2bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:9bbadcd4-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 8c9d5910386611ef9daba96ee3f3cc8c-20240702
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 442609209; Tue, 02 Jul 2024 04:30:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 2 Jul 2024 19:30:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 2 Jul 2024 19:30:54 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v6 3/8] Bluetooth: btmtk: rename btmediatek_data
Date: Tue, 2 Jul 2024 19:30:46 +0800
Message-ID: <20240702113051.24372-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240702113051.24372-1-chris.lu@mediatek.com>
References: <20240702113051.24372-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_043102_001754_3DF2EFBC 
X-CRM114-Status: GOOD (  14.54  )
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

Rename btmediatek_data to have a consistent prefix throughout the driver.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 10 +++++-----
 drivers/bluetooth/btmtk.h |  2 +-
 drivers/bluetooth/btusb.c |  9 ++++-----
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index a27c251bf56e..6489e4a63fb6 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -64,7 +64,7 @@ static void btmtk_coredump(struct hci_dev *hdev)
 
 static void btmtk_coredump_hdr(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct btmediatek_data *data = hci_get_priv(hdev);
+	struct btmtk_data *data = hci_get_priv(hdev);
 	char buf[80];
 
 	snprintf(buf, sizeof(buf), "Controller Name: 0x%X\n",
@@ -85,7 +85,7 @@ static void btmtk_coredump_hdr(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
 {
-	struct btmediatek_data *data = hci_get_priv(hdev);
+	struct btmtk_data *data = hci_get_priv(hdev);
 
 	switch (state) {
 	case HCI_DEVCOREDUMP_IDLE:
@@ -355,7 +355,7 @@ EXPORT_SYMBOL_GPL(btmtk_set_bdaddr);
 
 void btmtk_reset_sync(struct hci_dev *hdev)
 {
-	struct btmediatek_data *reset_work = hci_get_priv(hdev);
+	struct btmtk_data *reset_work = hci_get_priv(hdev);
 	int err;
 
 	hci_dev_lock(hdev);
@@ -371,7 +371,7 @@ EXPORT_SYMBOL_GPL(btmtk_reset_sync);
 int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
 			    u32 fw_version)
 {
-	struct btmediatek_data *data = hci_get_priv(hdev);
+	struct btmtk_data *data = hci_get_priv(hdev);
 
 	if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
 		return -EOPNOTSUPP;
@@ -387,7 +387,7 @@ EXPORT_SYMBOL_GPL(btmtk_register_coredump);
 
 int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct btmediatek_data *data = hci_get_priv(hdev);
+	struct btmtk_data *data = hci_get_priv(hdev);
 	int err;
 
 	if (!IS_ENABLED(CONFIG_DEV_COREDUMP)) {
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index e76b8a358be8..dde6fbdeb2b3 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -135,7 +135,7 @@ struct btmtk_coredump_info {
 	int state;
 };
 
-struct btmediatek_data {
+struct btmtk_data {
 	u32 dev_id;
 	btmtk_reset_sync_func_t reset_sync;
 	struct btmtk_coredump_info cd_info;
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 8239d9c891e6..7612f10f9d39 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3152,7 +3152,7 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
-	struct btmediatek_data *mtk_data;
+	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 	int err;
 
 	/* It's MediaTek specific bluetooth reset mechanism via USB */
@@ -3167,9 +3167,8 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 
 	btusb_stop_traffic(data);
 	usb_kill_anchored_urbs(&data->tx_anchor);
-	mtk_data = hci_get_priv(hdev);
 
-	err = btusb_mtk_subsys_reset(hdev, mtk_data->dev_id);
+	err = btusb_mtk_subsys_reset(hdev, btmtk_data->dev_id);
 
 	usb_queue_reset_device(data->intf);
 	clear_bit(BTUSB_HW_RESET_ACTIVE, &data->flags);
@@ -3191,7 +3190,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	char fw_bin_name[64];
 	u32 fw_version = 0, fw_flavor = 0;
 	u8 param;
-	struct btmediatek_data *mediatek;
+	struct btmtk_data *mediatek;
 
 	calltime = ktime_get();
 
@@ -4419,7 +4418,7 @@ static int btusb_probe(struct usb_interface *intf,
 		data->recv_event = btusb_recv_event_realtek;
 	} else if (id->driver_info & BTUSB_MEDIATEK) {
 		/* Allocate extra space for Mediatek device */
-		priv_size += sizeof(struct btmediatek_data);
+		priv_size += sizeof(struct btmtk_data);
 	}
 
 	data->recv_acl = hci_recv_frame;
-- 
2.18.0


