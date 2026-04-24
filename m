Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4D6FED3FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2026 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z2JwxZHRZZ47+Q7xu0MnZnncauMbRZyb5ayzW2pSkK8=; b=NBLmPN59LEndf+3pQ8qf0CtxdR
	dfoQdCzlGGEf3bLoFCodoMNmcS3D2qeEGUOAMYUy2SxDwStm/+vTN6gFmnUc/slAAl2yuHPq191IA
	0OaQJ4qCdBmX6w9gWmAyJiThU2E6Np4dBOmcrqTQsZ9pSB4ncLtBvRybEA1HoCjFQ5Lf2yS4HtN97
	Gr33LbxYzOv0Yju0NAB/WVefsFnqffxKMzzREN9eg1ommbH582ArUk6lMTx9J3tPlvqxqC1rGsh6o
	xF9yjd5EK3COEVgK2U/QsB6UYfgGpvdzqYAz6uj5ZSpeJFD9rF3c2RsVw3rqnPxcjtFj6bXH50JMQ
	4YbKRDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMK3-0000000DhyP-14bv;
	Fri, 24 Apr 2026 19:36:19 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMK0-0000000Dhy5-0wdU
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Apr 2026 19:36:18 +0000
Received: from monolith (unknown [193.138.7.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4g2NVj6T1tzySf;
	Fri, 24 Apr 2026 22:36:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1777059374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z2JwxZHRZZ47+Q7xu0MnZnncauMbRZyb5ayzW2pSkK8=;
	b=OM/Dnt4GXvwYV5HVE2jKOMo2q4gxQmiDvCTQQg7LRPj5bX/BZeMIvMhdB3qqjb5d7zTk1A
	yY+vM4gqijvjG58d0Zcd4sAIMX2srd58zFwf7cJiLMsoI+HL1nnv3SgzyJP36n1lwCjy+W
	FEJ3NCtIRs8Uv5zVhhYNS1WGn715GUw=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1777059374;
	b=yypGwgt2AmF9dMSuOC+e3doW6W2Qn1hb7JLNC9A5hPr7GVHdqG2oZzHHCiW/P6mqQRz/to
	pxXXaVoFJdK1vBda/yaBw01HhRFC9aej4UU7prXmOhKFia8QZAOZ5xI9t0/LmYKK593NsU
	arWn9wUz3Bm9WFZaHgETwim+leP1M7k=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1777059374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z2JwxZHRZZ47+Q7xu0MnZnncauMbRZyb5ayzW2pSkK8=;
	b=LK2J3GcdTKajl6RTZyFhus69pr/DWTOCZj0xfRvx6+M2MUlx9HmEFZtgu+8l8SRj32bZKB
	aj4zGyk7BAhaM08YUas0wM1jygxtKm6w1z2TgLCOIcXDvFuNpQe1+GhpOii53+M8bdjFCU
	2NZuEG6LbJn31HRlQ/M5kKn2AyWscBQ=
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btusb: deal with MT7925 invalid ISO RX packets
Date: Fri, 24 Apr 2026 22:35:40 +0300
Message-ID: <d5d33658e20fc0ad4cfe80df185d31fecad66fcf.1777059145.git.pav@iki.fi>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_123616_590403_C664E284 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

MT7925 produces empty ISO packets for Handle 0 when RX is active:

  > ISO Data RX: Handle 0 SN 36734 flags 0x00 dlen 0 slen 58  #851 [hci0]
  > ISO Data RX: Handle 0 SN 36734 flags 0x00 dlen 0 slen 58  #852 [hci0]

The driver should filter these out before passing to hci_core, otherwise
it will printk "Bluetooth: hci0: ISO packet for unknown connection
handle 0" errors.

Filter out by adding hdev->classify_pkt_type

Signed-off-by: Pauli Virtanen <pav@iki.fi>
---
 drivers/bluetooth/btmtk.c | 13 +++++++++++++
 drivers/bluetooth/btmtk.h |  8 ++++++++
 drivers/bluetooth/btusb.c |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index ab34f1dd42bc..9ba58cc9720a 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1568,6 +1568,19 @@ int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	return hci_recv_frame(hdev, skb);
 }
 EXPORT_SYMBOL_GPL(btmtk_recv_event);
+
+u8 btmtk_classify_pkt_type(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	/* MT7925 spams invalid ISO packets during ISO RX */
+	if (hci_skb_pkt_type(skb) == HCI_ISODATA_PKT &&
+	    skb->len == sizeof(struct hci_iso_hdr) &&
+	    hci_iso_hdr(skb)->handle == 0 &&
+	    hci_iso_hdr(skb)->dlen == 0)
+		return HCI_DIAG_PKT;
+
+	return hci_skb_pkt_type(skb);
+}
+EXPORT_SYMBOL_GPL(btmtk_classify_pkt_type);
 #endif
 
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index c83c24897c95..e573b21cecf7 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -222,6 +222,8 @@ int btmtk_usb_setup(struct hci_dev *hdev);
 int btmtk_usb_shutdown(struct hci_dev *hdev);
 
 int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb);
+
+u8 btmtk_classify_pkt_type(struct hci_dev *hdev, struct sk_buff *skb);
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -306,4 +308,10 @@ static inline int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	return hci_recv_frame(hdev, skb);
 }
+
+static inline u8 btmtk_classify_pkt_type(struct hci_dev *hdev,
+					 struct sk_buff *skb)
+{
+	return hci_skb_pkt_type(skb);
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a0a7da498466..7479928eec4b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4245,6 +4245,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->reset = btmtk_reset_sync;
 		hdev->set_bdaddr = btmtk_set_bdaddr;
 		hdev->send = btusb_send_frame_mtk;
+		hdev->classify_pkt_type = btmtk_classify_pkt_type;
 		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN);
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		data->recv_acl = btmtk_usb_recv_acl;
-- 
2.53.0


