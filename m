Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98781F3ED6C
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Apr 2026 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eswdepsRpw7C5ySDeJmU7CTcV9FFqFZQAQ3ydAH/FJg=; b=WWy8upLyEUPNOaOHOC8iicyF1M
	CDfmiLDoi3Pl/t+jCfgWhTd3WXNTysLP1izknIYOCxhjIFS9XL+crj9LlVUENG8g3qVG+/p5Lwm1o
	twuvo5tF3vMzWgE46YGKKQy7Epi4sJ+Dj63fOOT9k1ZswLKKiaeLZzP2DkhqCu6optj7j5+J8gKN8
	l+FZYDYHtos1ShugxC/jU8p8b91FGPxFJ5gI92bE11IWpTqLS4+r+k46LX6SIbrsh3UHYvW199j/X
	bwFJknYIlj1P9ePQ7MmKq4xUPcEjX2b6G1vbxyAi5d0MPbjJE1XxVELr7Y92n/eUqsZISwbrpb1My
	/FsIGAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqiX-0000000EB0g-3fvL;
	Sun, 12 Apr 2026 09:02:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqiV-0000000EAzu-0B1q
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Apr 2026 09:02:56 +0000
X-UUID: 5fb9fd62364e11f1a6de359d7043e138-20260412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eswdepsRpw7C5ySDeJmU7CTcV9FFqFZQAQ3ydAH/FJg=;
	b=AIEtBjxo7H8BY4cwD9fF2KTvV0Gj6uDHfHwGJsHBIRoz6WijwrU14WU7x5fy+KuIV3h05KKSUQjAO+XAc4NtjEfHXf+tbiX/pWitsAcf2takfKxqtHyVMEAl7CDRz8gqlFnT2y251a2QvnVyNDgd4S0dkVvnMBAX4VAPv91IvjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b2212bd1-30b2-454b-a926-7211cd4f9ff2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0b48c324-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5fb9fd62364e11f1a6de359d7043e138-20260412
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1892268187; Sun, 12 Apr 2026 02:02:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 12 Apr 2026 17:02:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sun, 12 Apr 2026 17:02:44 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3] Bluetooth: btmtk: add event filter to filter specific event
Date: Sun, 12 Apr 2026 17:02:42 +0800
Message-ID: <20260412090242.1129701-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_020255_107324_156526AE 
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

Add an event filter to filter event with specific opcode to prevent BT
stack from receiving unexpected event.

Event with opcode 0xfc5d is generated when MediaTek's Bluetooth enable
firmware logs and is not expected to be sent to userspace.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
v1 -> v2 : update commit message
v2 -> v3 : add boundary check in btmtk.c in btmtk_recv_event; keep using
           hci_recv_frame if CONFIG_BT_MTK wasn't defined in btmtk.h
---
 drivers/bluetooth/btmtk.c | 23 +++++++++++++++++++++++
 drivers/bluetooth/btmtk.h |  7 +++++++
 drivers/bluetooth/btusb.c |  2 ++
 3 files changed, 32 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 55516b4602db..78e84ecbbb91 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1503,6 +1503,29 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
+
+int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct hci_event_hdr *hdr = (void *)skb->data;
+	struct hci_ev_cmd_complete *ec;
+
+	if (hdr->evt == HCI_EV_CMD_COMPLETE &&
+	    skb->len >= HCI_EVENT_HDR_SIZE + sizeof(*ec)) {
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
index adaf385626ee..c93652508f14 100644
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
+	return hci_recv_frame(hdev, skb);
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


