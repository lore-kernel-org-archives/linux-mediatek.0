Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72706C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 19:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C2F600D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 19:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05C2F600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nED5Hi7GT9XHp0hSzkWSYuDsB2GiUfgRPvliJTPlR64=; b=YtLrvKDQ5KDTXt
	flVYLvDDEmFc6f5IuBGMFwnLoQr2f+7Eo/B8F55gMqsM80zAuONw5nXN0Xv1q0J8pplKNadmQgExg
	Z1jgPOYIOeHRv6193dHZoIDj1D0TSspPxXEB8I2Ens38knotDV6u8ZihyCuGJ8gluQQZUM52DYFIs
	9E8BGM9nHsOznp1Vzws4rID8IQLW1N2lHi/A4MCeNnBpNTHCC4cHy1KYbkGMZ7LlpHihBeRHTk3Yr
	KKQVaVeCIfaISvaYU7IGUjpb8SPdmwpjAmKHc7MFRO42CVpsvUbh4YZtbB0vYmRkv8kGkVpFUBDK+
	g7peUqy86HU1STWtvAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltbBs-007XpM-Sy; Wed, 16 Jun 2021 19:27:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltbBo-007Xol-4O
 for linux-mediatek@lists.infradead.org; Wed, 16 Jun 2021 19:27:07 +0000
X-UUID: b9c838ab4dbb4eeb935bdb2c830bf8fa-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=b5BfWiigVQxNiBzwNf0l1K8z4NPPtkSRip82I5nqkmA=; 
 b=epP1muJgpKEt6RqKXRooSgEDZmDnuxLjU59jmIvOI1nNXthZHkRneFvJ/LfHC2gJvtfKjL1SvKWYtYw5AJBFhzDOcffSjdMuwQQ8VJjm2ooOdpQQ3H5w/gBmsGZNj9XujacZ+OOINvVmICjJC1Z0vYkaZam/QeGS8m9miz+empY=;
X-UUID: b9c838ab4dbb4eeb935bdb2c830bf8fa-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 7856853; Wed, 16 Jun 2021 12:26:55 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 12:16:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 03:16:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 03:16:39 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <will-cy.lee@mediatek.com>,
 <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <shawnku@google.com>, <jemele@google.com>,
 mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH 1/1] Bluetooth: btusb: Record debug log for Mediatek Chip.
Date: Thu, 17 Jun 2021 03:15:40 +0800
Message-ID: <20210616191540.4487-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_122705_922326_672BB6FD 
X-CRM114-Status: GOOD (  12.84  )
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

Mediatek Bluetooth Controller send the fw log via EP2, this patch
create callback(data->recv_acl) for processing acl packet.

1. create callback(data->recv_acl) for processing acl packet.
2. Add btusb_recv_acl_mtk to dispatch acl packet.
3. Send mediatek debug log and coredump via hci_recv_diag channel.
4. The upper layerd can use hci_channel_minitor to receive
   these packets.

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b015dcecfb13..0a86713f496b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -569,6 +569,7 @@ struct btusb_data {
 	int suspend_count;
 
 	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
+	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
 	int (*recv_bulk)(struct btusb_data *data, void *buffer, int count);
 
 	int (*setup_on_usb)(struct hci_dev *hdev);
@@ -776,7 +777,7 @@ static int btusb_recv_bulk(struct btusb_data *data, void *buffer, int count)
 
 		if (!hci_skb_expect(skb)) {
 			/* Complete frame */
-			hci_recv_frame(data->hdev, skb);
+			data->recv_acl(data->hdev, skb);
 			skb = NULL;
 		}
 	}
@@ -3851,6 +3852,24 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 
+static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	int err;
+
+	if (skb->data[0] == 0x6f && skb->data[1] == 0xfc) {
+		usb_disable_autosuspend(data->udev);
+		err = hci_recv_diag(data->hdev, skb);
+	} else if ((skb->data[0] == 0xff || skb->data[0] == 0xfe) &&
+		   skb->data[1] == 0x05) {
+		err = hci_recv_diag(data->hdev, skb);
+	} else {
+		err = hci_recv_frame(data->hdev, skb);
+	}
+
+	return err;
+}
+
 MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
 
@@ -4542,6 +4561,7 @@ static int btusb_probe(struct usb_interface *intf,
 		data->recv_event = hci_recv_frame;
 		data->recv_bulk = btusb_recv_bulk;
 	}
+	data->recv_acl = hci_recv_frame;
 
 	hdev = hci_alloc_dev();
 	if (!hdev)
@@ -4669,6 +4689,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->setup = btusb_mtk_setup;
 		hdev->shutdown = btusb_mtk_shutdown;
 		hdev->manufacturer = 70;
+		data->recv_acl = btusb_recv_acl_mtk;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
