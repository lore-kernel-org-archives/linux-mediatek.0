Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0362C3271F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 06:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWnyYNQ5wR95Rp+oqiCiXRCwx+R4allhZp/0A/Rh0ww=; b=rmrmAQbnSOgn+Btgp/3a9SdjTC
	DC035r/gqq4MHVgo6jN8QM+5Cy3kyrD/+87PJhsD3PUto9uJuKswZv+3tuBS7faFWS8pVMrpQqGlr
	Rg0vGvKCwPm9dOzgUdGzdU1jco3IG5UdRl7mhPbyIKKvojuTh/mCllobspt+jUjzWsIPvnrnuU60g
	vpf65tZUG+MawbEdTJyEdVOtIKRxEIykCnX0nSKSwRPaVC3FR45ll3uHDmsfK/6C0ma9tv9Qk17Vr
	N/m6HPx2EOsfKUphhFQv79yIqOIMfpk36+IaBRez61tepfkrpVQwKHblKtO29a9cBuy5CAOir2boY
	vvNS1V1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFXA-0000000CHK7-1Q3N;
	Thu, 04 Jul 2024 06:01:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFX6-0000000CHIc-30mg
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 06:01:30 +0000
X-UUID: d725390c39ca11efb2966dae1f787272-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FWnyYNQ5wR95Rp+oqiCiXRCwx+R4allhZp/0A/Rh0ww=;
	b=E2ICisZCB81HqI7cpewObgInZxrsaZLk1UNSCjt4E0aq2RR0SCvzDnfCxMmQx7k74REPc41s1pdzajDrtdMe4pd8VfbZL48kmr9oOcbJyGg0YvO9Bdh4Tm4CMBwviWbwcqaxNor982f1W6PRp4h20R1n60ipCI9ZDtPWV7tBRA8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:addc2e88-6802-43fa-a75b-ce66fae6ab5c,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:3c6e13d1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d725390c39ca11efb2966dae1f787272-20240703
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1761189147; Wed, 03 Jul 2024 23:01:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jul 2024 14:01:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jul 2024 14:01:20 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v7 7/8] Bluetooth: btmtk: move btusb_recv_acl_mtk to btmtk.c
Date: Thu, 4 Jul 2024 14:01:15 +0800
Message-ID: <20240704060116.16600-8-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240704060116.16600-1-chris.lu@mediatek.com>
References: <20240704060116.16600-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_230128_784620_110532E0 
X-CRM114-Status: GOOD (  17.30  )
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

Move btusb_recv_acl_mtk from btusb.c to btmtk.c which holds
vendor specific stuff and would make btusb.c clean.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 33 +++++++++++++++++++++++++++++++++
 drivers/bluetooth/btmtk.h |  7 +++++++
 drivers/bluetooth/btusb.c | 34 +---------------------------------
 3 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index f5ecb8227d3b..fe3b892f6c6e 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -930,6 +930,39 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 }
 EXPORT_SYMBOL_GPL(btmtk_usb_subsys_reset);
 
+int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_data *data = hci_get_priv(hdev);
+	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);
+
+	switch (handle) {
+	case 0xfc6f:		/* Firmware dump from device */
+		/* When the firmware hangs, the device can no longer
+		 * suspend and thus disable auto-suspend.
+		 */
+		usb_disable_autosuspend(data->udev);
+
+		/* We need to forward the diagnostic packet to userspace daemon
+		 * for backward compatibility, so we have to clone the packet
+		 * extraly for the in-kernel coredump support.
+		 */
+		if (IS_ENABLED(CONFIG_DEV_COREDUMP)) {
+			struct sk_buff *skb_cd = skb_clone(skb, GFP_ATOMIC);
+
+			if (skb_cd)
+				btmtk_process_coredump(hdev, skb_cd);
+		}
+
+		fallthrough;
+	case 0x05ff:		/* Firmware debug logging 1 */
+	case 0x05fe:		/* Firmware debug logging 2 */
+		return hci_recv_diag(hdev, skb);
+	}
+
+	return hci_recv_frame(hdev, skb);
+}
+EXPORT_SYMBOL_GPL(btmtk_usb_recv_acl);
+
 int btmtk_usb_setup(struct hci_dev *hdev)
 {
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index fe41528ae509..47193b867b9f 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -191,6 +191,8 @@ void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 
 int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id);
 
+int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
+
 int btmtk_usb_setup(struct hci_dev *hdev);
 
 int btmtk_usb_shutdown(struct hci_dev *hdev);
@@ -239,6 +241,11 @@ static int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	return -EOPNOTSUPP;
 }
 
+static int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	return -EOPNOTSUPP;
+}
+
 static int btmtk_usb_setup(struct hci_dev *hdev)
 {
 	return -EOPNOTSUPP;
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index d61a1d02e3e3..5de50c835964 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2690,38 +2690,6 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	return btmtk_usb_shutdown(hdev);
 }
 
-static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
-{
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);
-
-	switch (handle) {
-	case 0xfc6f:		/* Firmware dump from device */
-		/* When the firmware hangs, the device can no longer
-		 * suspend and thus disable auto-suspend.
-		 */
-		usb_disable_autosuspend(data->udev);
-
-		/* We need to forward the diagnostic packet to userspace daemon
-		 * for backward compatibility, so we have to clone the packet
-		 * extraly for the in-kernel coredump support.
-		 */
-		if (IS_ENABLED(CONFIG_DEV_COREDUMP)) {
-			struct sk_buff *skb_cd = skb_clone(skb, GFP_ATOMIC);
-
-			if (skb_cd)
-				btmtk_process_coredump(hdev, skb_cd);
-		}
-
-		fallthrough;
-	case 0x05ff:		/* Firmware debug logging 1 */
-	case 0x05fe:		/* Firmware debug logging 2 */
-		return hci_recv_diag(hdev, skb);
-	}
-
-	return hci_recv_frame(hdev, skb);
-}
-
 #ifdef CONFIG_PM
 /* Configure an out-of-band gpio as wake-up pin, if specified in device tree */
 static int marvell_config_oob_wake(struct hci_dev *hdev)
@@ -3827,7 +3795,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->set_bdaddr = btmtk_set_bdaddr;
 		set_bit(HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN, &hdev->quirks);
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
-		data->recv_acl = btusb_recv_acl_mtk;
+		data->recv_acl = btmtk_usb_recv_acl;
 	}
 
 	if (id->driver_info & BTUSB_SWAVE) {
-- 
2.18.0


