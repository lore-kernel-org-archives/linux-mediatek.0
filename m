Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B9CFF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R0RDApUvTDSQuO7JvFyT884tiIpjJP6ULN7AmzTd54M=; b=KaDdSd1d3yP+xIKvag9khL1X9X
	q1CpqxIw917e0Y8G2VYRMo59HXfk5pyuob3fkS6R4v6OaDA2X8B3GIsiDbBJ1nZUncGoMqk9bf+Jz
	WxYF2Gxrugqdz39z9JZ/duhovQtxQaIOx9g4Fln20EWzhpzpqhPImaFzTMEX1LShJj5L0cwLC0B8S
	zDx8LCI1w9Dby2xsJhqy3ndXsdO2u2Wev/PjxsJcgyg9wL/l4F09did3ShXxWfMOF95NUwW6dJQiM
	ZXYLlVHYMR2YQ+Wo6QRwnK/Q7lLNaBYvU3VnaJhRrpQ3KrBeGvZohtxY7kz5qeM/7hmHT7XnAr12o
	3yni0Wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaa8-0000000EMZN-3lkE;
	Sat, 25 Apr 2026 10:49:52 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaa6-0000000EMYb-1Kkq
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 10:49:51 +0000
Received: from monolith (unknown [193.138.7.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4g2mmn3GqjzyWV;
	Sat, 25 Apr 2026 13:49:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1777114186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R0RDApUvTDSQuO7JvFyT884tiIpjJP6ULN7AmzTd54M=;
	b=oOk5CuEh2p11ar3Hj96LElgYwPOO+nOZp8pGkvUQ1bKLAE0HUCpEyrHyacZleyDBcyj5/b
	z++sURvlNrEAouFD8oIqXMsrJZKyyztOyyYZmmL6NRFFBhU/UHKlBEUVHFkICRCfoFz5Ed
	z/WVFuPR8+cLKkE5Bb/t3ZSSwIZVyl8=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1777114186;
	b=JCFxzYzOxuy0+oes+EdVVODvdTy4kxdVGjZsfcV/NRUav8D+3sSTl1zqM3tkt5QTW/0f9D
	U0Ytqk1vwsEdmnBl3gpr74t9uVW12W2AjTVE1XoEZZJScXTZrxDVRejiPtKuRqHNGodxsu
	PtNT6IK+aEVsZ+lN2WgrqKIC/BYn2Qc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1777114186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R0RDApUvTDSQuO7JvFyT884tiIpjJP6ULN7AmzTd54M=;
	b=Zghijovk9HiOuly/GCfsCHI2dDpdM6veVsFO3AJQOngrYgjtNSUcfbJP/7fUYf4p7cYUqT
	kMSYliTqxqTQv+yZGpv7lZa28IBsubHlWUw/WzIjLTnDKFbh5dngw8mNMaSoULRoqLo15x
	YNtcgHALAl4leyfBRWLnzfBRkuP4Xag=
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-mediatek@lists.infradead.org,
	chris.lu@mediatek.com
Subject: [PATCH] Bluetooth: btmtk: don't generate bogus ISO packets from zero padding
Date: Sat, 25 Apr 2026 13:49:13 +0300
Message-ID: <8f988c1ccaaddf60c259890a2ca636830f7e4578.1777113390.git.pav@iki.fi>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_034950_539784_77B5AEE5 
X-CRM114-Status: GOOD (  14.51  )
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

With MT7925, received URBs for ISO have urb->actual_length of
MTK_ISO_THRESHOLD (264) and contain ISO packet data followed by zero
padding.

btmtk driver ISO handling added in commit ceac1cb0259d ("Bluetooth:
btusb: mediatek: add ISO data transmission functions") assumes the data
contains only payload, and generates bogus packets to hci_core from the
padding, resulting to printk errors "Bluetooth: hci0: ISO packet for
unknown connection handle 0"

Add check in btmtk that a new packet is not started if we have only
trailing zeros left in the URB. If so, skip them and emit an error once
per hdev, since this doesn't seem to be the intended behavior. This
reduces spam to user logs.

Signed-off-by: Pauli Virtanen <pav@iki.fi>
---

Notes:
    If there's confirmation from Mediatek the zero padding instead of short
    USB read is intentional, the warning is not needed.

 drivers/bluetooth/btmtk.c | 26 ++++++++++++++++++++++++++
 drivers/bluetooth/btmtk.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index ab34f1dd42bc..397caacbe9fd 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1088,11 +1088,34 @@ struct urb *alloc_mtk_intr_urb(struct hci_dev *hdev, struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(alloc_mtk_intr_urb);
 
+static bool check_isopkt(struct hci_dev *hdev, void *buffer, int count,
+			 int pktsize)
+{
+	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
+
+	/* With MT7925 we receive URBs that have size MTK_ISO_THRESHOLD, with
+	 * zero padding following the ISO packet data. This appears not
+	 * intentional, so flag an error, and skip rest of the URB to not
+	 * generate ISO packets from the padding.
+	 */
+	if (pktsize == MTK_ISO_THRESHOLD && count < pktsize &&
+	    mem_is_zero(buffer, count)) {
+		if (!btmtk_data->isopkt_padding_seen) {
+			btmtk_data->isopkt_padding_seen = true;
+			bt_dev_err(hdev, "Zero ISO data (only first reported)");
+		}
+		return false;
+	}
+
+	return true;
+}
+
 static int btmtk_recv_isopkt(struct hci_dev *hdev, void *buffer, int count)
 {
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 	struct sk_buff *skb;
 	unsigned long flags;
+	int pktsize = count;
 	int err = 0;
 
 	spin_lock_irqsave(&btmtk_data->isorxlock, flags);
@@ -1102,6 +1125,9 @@ static int btmtk_recv_isopkt(struct hci_dev *hdev, void *buffer, int count)
 		int len;
 
 		if (!skb) {
+			if (!check_isopkt(hdev, buffer, count, pktsize))
+				break;
+
 			skb = bt_skb_alloc(HCI_MAX_ISO_SIZE, GFP_ATOMIC);
 			if (!skb) {
 				err = -ENOMEM;
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index c83c24897c95..46fbdb98a716 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -177,6 +177,7 @@ struct btmtk_data {
 	struct usb_interface *isopkt_intf;
 	struct usb_anchor isopkt_anchor;
 	struct sk_buff *isopkt_skb;
+	bool isopkt_padding_seen;
 
 	/* spinlock for ISO data transmission */
 	spinlock_t isorxlock;
-- 
2.53.0


