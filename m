Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2BBC11F67
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 19:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC7F661D3E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 19:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC7F661D3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y9x+q7FrAWkyHveQ7Paz7Ib/8Dyp844EqQ/N6dUQRXs=; b=O1qvqdQbVMVZFD
	Aq4ETmDOR38Vb5TdZTEcPoVRa0xVakajjAp15bmRKQ1fY5x5rrrV2N0ZVOOicagc169yZjaJkWdPr
	7aCk/6mQuj2gOTF/Viy4dzcSRNX2oPWBLOLd5S6x8tUekvPvb5OUoOuoLLtfmXXe+AH1+1BSay2tZ
	tHdZV3byxQEhlhZ6Yf+aIOcVZbQNhpzxnFxNpf3r0fdswk+xKrEKGQ9McdGPxaHdCLCML35JxHkNt
	2d/HWPkqQqb1rgcJenWEV+Jx25t/z6tQE2hE7Z2QzMy+I6o5WABnAoi7ywhyRtuwMbjhoBDezfSV4
	wq3OdFsY018r1qmX0i7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyJ7n-00Buip-DT; Tue, 29 Jun 2021 19:10:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyJ7j-00BuhZ-9Y
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 19:10:22 +0000
X-UUID: 19fa2f5f2d574203b6032e1aaa6462e6-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=r1IhH9KfYPioxui/K5wmzaPrDCezU69SOCGPl+WsMPU=; 
 b=MdEipKKfxkjy2T78LF84rk3rJFjvNd2aHreixWnwpw6aQm6izDpzdTwDj6EkBdVXX1qjnSsBmIMW8K/N+VJN+0cKKVIhv9H4lesvMAXhUAeD6IUFRfY0j1BIDQ+MaS+JvryvVDacXuOsmjH2GoENipV3lEsqIo5NXHRu1P23WHI=;
X-UUID: 19fa2f5f2d574203b6032e1aaa6462e6-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 34602027; Tue, 29 Jun 2021 12:10:12 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 12:10:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 03:09:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Jun 2021 03:09:56 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <will-cy.lee@mediatek.com>,
 <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <shawnku@google.com>, <jemele@google.com>,
 <apusaka@google.com>, mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH v3 1/1] Bluetooth: btusb: Record debug log for Mediatek Chip.
Date: Wed, 30 Jun 2021 03:09:34 +0800
Message-ID: <20210629190934.11710-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_121020_790550_AEBD453A 
X-CRM114-Status: GOOD (  14.41  )
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
 drivers/bluetooth/btusb.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b015dcecfb13..cabf6eba2d95 100644
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
@@ -3075,6 +3076,10 @@ static int btusb_shutdown_intel_new(struct hci_dev *hdev)
 	return 0;
 }
 
+#define MTK_FW_DUMP	0xfc6f
+#define MTK_FW_LOG_1	0x05ff
+#define MTK_FW_LOG_2	0x05fe
+
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 
@@ -3851,6 +3856,33 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 
+static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	int err;
+	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);
+
+	switch (handle) {
+	case MTK_FW_DUMP:
+		/* It's MediaTek firmware dump from device. When the firmware
+		 * hang, the device can't be suspend successfully.
+		 */
+		usb_disable_autosuspend(data->udev);
+		err = hci_recv_diag(data->hdev, skb);
+		break;
+	case MTK_FW_LOG_1:
+	case MTK_FW_LOG_2:
+		/* It's MediaTek fw debug log */
+		err = hci_recv_diag(data->hdev, skb);
+		break;
+	default:
+		err = hci_recv_frame(data->hdev, skb);
+		break;
+	}
+
+	return err;
+}
+
 MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
 
@@ -4543,6 +4575,8 @@ static int btusb_probe(struct usb_interface *intf,
 		data->recv_bulk = btusb_recv_bulk;
 	}
 
+	data->recv_acl = hci_recv_frame;
+
 	hdev = hci_alloc_dev();
 	if (!hdev)
 		return -ENOMEM;
@@ -4669,6 +4703,7 @@ static int btusb_probe(struct usb_interface *intf,
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
