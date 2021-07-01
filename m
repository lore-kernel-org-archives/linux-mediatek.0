Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F50C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 19:53:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB9ED61406
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 19:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB9ED61406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dx3yp9Iyg0klzad9I/9P7RWAcxW0l+O2OpzqGSzADRU=; b=lW5cTIHXSNIlCf
	1GcWUqGfIqnmlc+zLUV/wMGDLnSBiYKRPB5cTScD/iKwq+GXGFXlx/hGibCrrAIDYtgFXqF09bnvn
	xa8Awly77phtqgFprxyZnw9UZP8EhNGm8jOlt4YbARQnyNt1QFML/sGd9COxCSdCmn+XlSkZDuUQO
	7U61al+eTK2/RgD6wz/rF1F8HrWUQfU32Jmvzr8QQDOgB/Q1xPT0o2a44B1F05qvOP5ZzD5MX047T
	sz0h4KhNp5pkymASEh1E7nVBsAJBZUU+dd+eonV7BpBkICk07ybyAqfdu2sLNVHRk6v1momc8cxaw
	8dTYriSWHWMApE+DMAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz2kT-000vga-Rc; Thu, 01 Jul 2021 19:53:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz2kQ-000vfA-JK
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 19:53:21 +0000
X-UUID: 6715094c624d447abf9f4be7bb1173b0-20210701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QJ3jpBFH3RVeiUULOpxzKNKAA8pUuxdvPFuJi66Ow44=; 
 b=cW7JU/GR+k23lvAIBbcnMGvur0olEIeO0WaSBZ55knBpOUJt1QtTn4d87222pp44BUw3Gk1O/mpRSoR99gXw4RUdQGophXxzMdERkY7lZjbEV5syESsN9Ae8fD79+fg74BB2XQCUf92ojtzS2yqF5KZtOM3SSCqvKKpHZo3J+Go=;
X-UUID: 6715094c624d447abf9f4be7bb1173b0-20210701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1077370005; Thu, 01 Jul 2021 12:53:15 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 12:43:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 03:42:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 2 Jul 2021 03:42:59 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <will-cy.lee@mediatek.com>,
 <sean.wang@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <shawnku@google.com>, <jemele@google.com>,
 <apusaka@google.com>, mark-yw.chen <mark-yw.chen@mediatek.com>
Subject: [PATCH v4 1/2] Bluetooth: btusb: Record debug log for Mediatek Chip.
Date: Fri, 2 Jul 2021 03:42:42 +0800
Message-ID: <20210701194243.5449-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_125318_679436_6D60B10C 
X-CRM114-Status: GOOD (  16.91  )
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
2. Add btusb_recv_acl_mtk to dispatch firmware debug log and firmware
   dump, the debug log is for LMP/LL tracing and Connection quality.
3. The upper layerd can use hci_channel_minitor to receive
   these packets.

Example btmon: firmware debug log.
1. Enable firmware debug log.
< HCI Command: Vendor (0x3f|0x005d) plen 4
        00 00 02 02                                      ....
> HCI Event: Command Complete (0x0e) plen 8
      Vendor (0x3f|0x005d) ncmd 1
        Status: Success (0x00)
        00 00 02 02                                      ....
2. Diagnostic packet from controller
= Vendor Diagnostic (len 500)
          ff 05 f0 01 fd ff 02 0e 08 01 5d fc 00 00 00 02
          02 aa aa aa cb e3 f0 15 b0 0c 5f 01 00 d1 0f 33
          01 7f 00 08 57 61 0c 00 00 00 00 00 23 37 17 00
          fd ff 00 00 29 60 ff ff b1 56 e8 00 57 40 0a 40
          39 95 f2 00 47 40 43 00 fc f0 16 00 57 61 0c 00
          00 00 00 00 23 37 17 00 fd ff 00 00 29 60 ff ff
          65 95 f2 00 57 40 0a 40 ec d3 fc 00 47 40 3b 00
          2c f1 17 00 57 61 0c 00 00 00 00 00 23 37 17 00
          fd ff 00 00 29 60 ff ff 19 d4 fc 00 57 40 76 1c
          b2 61 01 01 47 40 b3 04 0b 63 18 00 fe ff 02 01
          04 05 33 8b 9e 08 00 aa aa aa aa aa 27 38 01 02
          01 00 00 00 02 e0 10 00 20 00 20 00 2a 08 40 00
          20 00 20 08 2a 08 02 00 40 00 00 01 2e 08 40 00
          01 67 b0 c2 2e 08 3e 07 ff ff ff ff 40 08 01 00
          02 00 00 00 34 08 a3 00 00 00 00 00 34 08 a3 00
          00 00 00 00 35 08 45 01 00 00 00 00 2e 08 40 00
          01 67 b0 c2 30 35 01 02 00 00 00 00 2c 31 01 00
          02 00 00 40 2d 19 03 00 00 40 00 00 fd ff 02 0f
          04 00 01 01 04 aa aa aa aa aa aa aa 57 61 0c 00
          00 00 00 00 23 46 32 00 01 00 00 00 2f 35 00 02
          00 00 00 00 29 35 ff 02 00 22 00 00 2d 31 a6 02
          02 00 00 00 31 6c 40 00 14 63 18 1b 31 6c 40 00
          14 63 18 23 51 08 53 00 12 63 18 00 2c 35 12 01
          fe 00 00 00 2b 35 fe 02 02 00 00 00 2f 31 21 00
          00 00 02 00 75 61 01 00 4c 1b 93 00 79 61 01 00
          00 00 00 00 12 e3 63 18 20 31 86 01 74 61 68 03
          00 00 04 00 a1 73 ff 00 b9 01 00 00 a1 73 04 00
          00 00 00 00 a1 73 00 00 00 00 00 00 a1 73 00 00
          02 00 00 00 31 6c 40 00 16 63 18 0c 31 6c 40 00
          16 63 18 1c 77 61 40 00 48 33 40 00 14 e3 63 18
          40 31 86 01 00 d1 02 c5 07 23 a1 34 73 61 37 02
          02 00 00 a1

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b015dcecfb13..b1249b664981 100644
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
@@ -3851,6 +3852,25 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 
+static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);
+
+	switch (handle) {
+	case 0xfc6f:		/* Firmware dump from device */
+		/* When the firmware hangs, the device can no longer
+		 * suspend and thus disable auto-suspend.
+		 */
+		usb_disable_autosuspend(data->udev);
+	case 0x05ff:		/* Firmware debug logging 1 */
+	case 0x05fe:		/* Firmware debug logging 2 */
+		return hci_recv_diag(hdev, skb);
+	}
+
+	return hci_recv_frame(hdev, skb);
+}
+
 MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
 
@@ -4543,6 +4563,8 @@ static int btusb_probe(struct usb_interface *intf,
 		data->recv_bulk = btusb_recv_bulk;
 	}
 
+	data->recv_acl = hci_recv_frame;
+
 	hdev = hci_alloc_dev();
 	if (!hdev)
 		return -ENOMEM;
@@ -4670,6 +4692,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->shutdown = btusb_mtk_shutdown;
 		hdev->manufacturer = 70;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
+		data->recv_acl = btusb_recv_acl_mtk;
 	}
 
 	if (id->driver_info & BTUSB_SWAVE) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
