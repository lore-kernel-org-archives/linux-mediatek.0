Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190F8E9D814
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2026 06:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9MpSWEeOtFVXl58+rDfFFbpljSaaJoXfG6V58eCnX3o=; b=UFmektxIYnl0rZ5SWfBQu8U+QN
	SzGZ2NhnwQEFEVrGx3gukv8HxLVWALat8cY+qVNcpZ1zClQimdTxkNV6BzOv/IoNPmOmtxanN8QwR
	rvtx8HaDgBjQy5cBH+u3+wobNu1/j19j+RUh0rNCKRmLGgrF+tRUdIE10AOpwrcZNngvvcTKifVaD
	5ai6EbozpN3gO6Ai9y5MgDqo5l+XSyPOVlBKwXgVMyKerirb9oy+E2+aYsCIA/CUtAD1Epg2N4H5Z
	BNB/Gvq0i5D9dHaCgMsDO0nzWX80Gnv0UTLYjg0uRmPL6MtxoIT2vk8L3Jc5c+X94+qlqeeEaXDIm
	Cngo9StA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0EO-000000061WD-1MVR;
	Tue, 07 Apr 2026 06:48:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0EM-000000061Vl-2NoQ
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Apr 2026 06:48:11 +0000
X-UUID: ba861cb2324d11f1a6de359d7043e138-20260406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9MpSWEeOtFVXl58+rDfFFbpljSaaJoXfG6V58eCnX3o=;
	b=uU5y19o9CgafvqY5OoutrtKyB+NDd2KG8yTEgxnlMXtlhmeuVwfG+A0hlKa4xoKy6yLS6/UmPSwdMIbdubjHLHp0TsALgM0ZEHE15TLFNMk/IrFFJ6HbzxKBt5GWnokBA2y4g2MS5jLybURtHLoBPbB4J3zrSDKEj62Tk6OhAy0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ae6367ab-6597-4d29-8f8d-7732aaf297f1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:ec17218f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ba861cb2324d11f1a6de359d7043e138-20260406
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1721314805; Mon, 06 Apr 2026 23:48:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 7 Apr 2026 14:48:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 7 Apr 2026 14:48:02 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1] Bluetooth: btmtk: add event filter to filter specific event
Date: Tue, 7 Apr 2026 14:47:59 +0800
Message-ID: <20260407064759.3036650-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_234810_651090_47C4E3F2 
X-CRM114-Status: GOOD (  12.51  )
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

Due to some Bluetooth hosts have mechanism to detect invalid events,
causing abnormal behavior. Add a event filter to prevent debugging
events from being sent to host.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 22 ++++++++++++++++++++++
 drivers/bluetooth/btmtk.h |  7 +++++++
 drivers/bluetooth/btusb.c |  2 ++
 3 files changed, 31 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 55516b4602db..302d6ddf9062 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1503,6 +1503,28 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
+
+int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct hci_event_hdr *hdr = (void *)skb->data;
+
+	if (hdr->evt == HCI_EV_CMD_COMPLETE) {
+		struct hci_ev_cmd_complete *ec;
+		u16 opcode;
+
+		ec = (void *)(skb->data + HCI_EVENT_HDR_SIZE);
+		opcode = __le16_to_cpu(ec->opcode);
+
+		/* Filter vendor opcode */
+		if (opcode == 0xfc5d) {
+			kfree_skb(skb);
+			return 0;
+		}
+	}
+
+	return hci_recv_frame(hdev, skb);
+}
+EXPORT_SYMBOL_GPL(btmtk_recv_event);
 #endif
 
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index adaf385626ee..08b73927c8f3 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -218,6 +218,8 @@ int btmtk_usb_suspend(struct hci_dev *hdev);
 int btmtk_usb_setup(struct hci_dev *hdev);
 
 int btmtk_usb_shutdown(struct hci_dev *hdev);
+
+int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb);
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -296,4 +298,9 @@ static inline int btmtk_usb_shutdown(struct hci_dev *hdev)
 {
 	return -EOPNOTSUPP;
 }
+
+static inline int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	return -EOPNOTSUPP;
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index f9d515ee9124..daf8a387e660 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4150,6 +4150,8 @@ static int btusb_probe(struct usb_interface *intf,
 	} else if (id->driver_info & BTUSB_MEDIATEK) {
 		/* Allocate extra space for Mediatek device */
 		priv_size += sizeof(struct btmtk_data);
+
+		data->recv_event = btmtk_recv_event;
 	}
 
 	data->recv_acl = hci_recv_frame;
-- 
2.45.2


