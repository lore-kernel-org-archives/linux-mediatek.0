Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05606C48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 19:08:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980D561059
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 19:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 980D561059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q+WQS4UauYrvh0g1g4Wclj2BZERsmF5TxPAis1yF9xE=; b=1heIURo9HUEH2t
	Gs9MkZvlPyehJZ8kvR+6MVlytfNQHVOSZeRiuLDSdxTGR/xOGbm3hxRz9IOMbqHuatEHZsvcAnpCx
	6N3kjey2METPE8EIi4zAFc5xQRkAABneNQDeeVFItfx1tf5dGD3g92nNBS1Z1qZbEqx0U1h7miHX6
	gDyXliUz5pJHoyK1yGzDVuV6mHuJ/0+jkiTV3OTsXNbX22lyyRerSC0lpjUVfRud8uho5LsYj4vuM
	BxSdN2ZwOn8g+YR0MBvMzzAmI/p45MzNBH/d1b09+mH3SAZZZCN4bUBazLiqqqcsMFXkIiWMmQrNH
	Hf+NeA1brib3KFxUS/JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr3Yf-00FfO9-Sv; Wed, 09 Jun 2021 19:08:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr3Yd-00FfN3-3p
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 19:08:08 +0000
X-UUID: 394be76d7504447f974bb07ac819b86c-20210609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4y5K9bI0/ulw7d3iXuhDNPsRb4uNTMWtAHit4bN8CoE=; 
 b=S9qpA6KDZw2v373vSBHH+q6d16YBt5aMVpbGt/RiB2Q49nPCKVj6w0QHs4wYZ9cBIUQ9gnGuLYXpRL42uZ/1AWzfbLL9kmQh1mAIIff/yv1F149oTAhiMU0aXCg9D/+eHQQYKfpkI0piwULjAY/WSihTu2fn4to8wQPa0if/A/A=;
X-UUID: 394be76d7504447f974bb07ac819b86c-20210609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1373731211; Wed, 09 Jun 2021 12:08:01 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Jun 2021 12:07:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 03:07:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Jun 2021 03:07:45 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <will-cy.lee@mediatek.com>,
 <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <shawnku@google.com>, <jemele@google.com>,
 mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH 1/2] Bluetooth: btusb: Record debug log for Mediatek Chip.
Date: Thu, 10 Jun 2021 03:07:33 +0800
Message-ID: <20210609190734.30088-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_120807_186122_55A906B1 
X-CRM114-Status: GOOD (  11.49  )
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

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

1. Add btusb_recv_bulk_mtk to receive debug log.
2. Send the debug log via hci_recv_diag channel.
3. The upper layerd use hci_channel_minitor to receive
   these packets.

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b015dcecfb13..2a55ae0a5f8c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3851,6 +3851,72 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 
+static int btusb_recv_bulk_mtk(struct btusb_data *data, void *buffer, int count)
+{
+	struct sk_buff *skb;
+	unsigned long flags;
+	int err = 0;
+
+	spin_lock_irqsave(&data->rxlock, flags);
+	skb = data->acl_skb;
+
+	while (count) {
+		int len;
+
+		if (!skb) {
+			skb = bt_skb_alloc(HCI_MAX_FRAME_SIZE, GFP_ATOMIC);
+			if (!skb) {
+				err = -ENOMEM;
+				break;
+			}
+
+			hci_skb_pkt_type(skb) = HCI_ACLDATA_PKT;
+			hci_skb_expect(skb) = HCI_ACL_HDR_SIZE;
+		}
+
+		len = min_t(uint, hci_skb_expect(skb), count);
+		skb_put_data(skb, buffer, len);
+
+		count -= len;
+		buffer += len;
+		hci_skb_expect(skb) -= len;
+
+		if (skb->len == HCI_ACL_HDR_SIZE) {
+			__le16 dlen = hci_acl_hdr(skb)->dlen;
+
+			/* Complete ACL header */
+			hci_skb_expect(skb) = __le16_to_cpu(dlen);
+
+			if (skb_tailroom(skb) < hci_skb_expect(skb)) {
+				kfree_skb(skb);
+				skb = NULL;
+
+				err = -EILSEQ;
+				break;
+			}
+		}
+
+		if (!hci_skb_expect(skb)) {
+			/* Complete frame */
+			if (skb->data[0] == 0x6f && skb->data[1] == 0xfc) {
+				usb_disable_autosuspend(data->udev);
+				hci_recv_diag(data->hdev, skb);
+			} else if ((skb->data[0] == 0xfe || skb->data[0] == 0xff) &&
+				   skb->data[1] == 0x05) {
+				hci_recv_diag(data->hdev, skb);
+			} else {
+				hci_recv_frame(data->hdev, skb);
+			}
+			skb = NULL;
+		}
+	}
+
+	data->acl_skb = skb;
+	spin_unlock_irqrestore(&data->rxlock, flags);
+
+	return err;
+}
+
 MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
 
@@ -4669,6 +4735,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->setup = btusb_mtk_setup;
 		hdev->shutdown = btusb_mtk_shutdown;
 		hdev->manufacturer = 70;
+		data->recv_bulk = btusb_recv_bulk_mtk;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
