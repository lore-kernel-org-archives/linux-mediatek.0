Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB4BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4CYjCg4EpCON1/LuBG16x3oPeVsBHgi6hGr4R9GSJo=; b=h3qGNeODH+l6+N
	Y5ivBST8oMewGQ6npgtyhf+wkyYePMSwQM5V+v4z5hND0pTFlNFNr/HZZzOGG9ZEfvHrz4M1iG3l7
	Q9vTrNgK6ccEuuvdkf0cwKkhQw9TagIIiCUJ25c4/CMHGRxXgO54A9QwSoliRV1BlLOLxKD7Coqq9
	/y8deA0YjYMpCJkYoExKh0ciHZYRs9+aR0dS50XgTc1d6gXyHIUVOoQuHK5yW5dKil9FHv7AZJat2
	XdCY38Zn9NttOyBpUszxQcODaFNcJRhV/KCa3b6o99AKH3WiIjPewZ9fkCdMmxujY/+BDI8JkVKgw
	pO4hm57IV3hJuBHel77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHV49-00FDUC-2h; Tue, 08 Feb 2022 18:18:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHV44-00FDTT-JR
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 18:18:11 +0000
X-UUID: ee3c45ba3a4a4a74a6d6ce9dd2ab0f4a-20220208
X-UUID: ee3c45ba3a4a4a74a6d6ce9dd2ab0f4a-20220208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 891437433; Tue, 08 Feb 2022 11:18:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 10:18:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Feb 2022 02:18:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Feb 2022 02:18:01 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] Bluetooth: mediatek: fix the conflict between mtk and
 msft vendor event
Date: Wed, 9 Feb 2022 02:17:41 +0800
Message-ID: <5f5f1e801432af9318bc604c54a6c15dcd8ab036.1644342794.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <d328920a9abaaaedafc8c4922cdeb5935f6d64c3.1644342794.git.objelf@gmail.com>
References: <d328920a9abaaaedafc8c4922cdeb5935f6d64c3.1644342794.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_101808_673562_5EBA3220 
X-CRM114-Status: GOOD (  19.23  )
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

From: Sean Wang <sean.wang@mediatek.com>

There is a conflict between MediaTek wmt event and msft vendor extension
logic in the core layer since 145373cb1b1f ("Bluetooth: Add framework for
Microsoft vendor extension") was introduced because we changed the type of
mediatek wmt event to the type of msft vendor event in the driver.

But the purpose we reported mediatek event to the core layer is for the
diagnostic purpose with that we are able to see the full packet trace via
monitoring socket with btmon. Thus, it is harmless we keep the original
type of mediatek vendor event here to avoid breaking the msft extension
function especially they can be supported by Mediatek chipset like MT7921
, MT7922 devices and future devices.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: fix the warning: variable 'hdr' set but not used
---
 drivers/bluetooth/btmtk.h     | 1 +
 drivers/bluetooth/btmtksdio.c | 9 +--------
 drivers/bluetooth/btusb.c     | 8 --------
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 8960a5f89d48..013850fd2055 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -5,6 +5,7 @@
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 
+#define HCI_EV_WMT 0xe4
 #define HCI_WMT_MAX_EVENT_SIZE		64
 
 #define BTMTK_WMT_REG_WRITE 0x1
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 8e200e80d2f6..cbb09e1b823d 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -381,13 +381,6 @@ static int btmtksdio_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	struct hci_event_hdr *hdr = (void *)skb->data;
 	int err;
 
-	/* Fix up the vendor event id with 0xff for vendor specific instead
-	 * of 0xe4 so that event send via monitoring socket can be parsed
-	 * properly.
-	 */
-	if (hdr->evt == 0xe4)
-		hdr->evt = HCI_EV_VENDOR;
-
 	/* When someone waits for the WMT event, the skb is being cloned
 	 * and being processed the events from there then.
 	 */
@@ -403,7 +396,7 @@ static int btmtksdio_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	if (err < 0)
 		goto err_free_skb;
 
-	if (hdr->evt == HCI_EV_VENDOR) {
+	if (hdr->evt == HCI_EV_WMT) {
 		if (test_and_clear_bit(BTMTKSDIO_TX_WAIT_VND_EVT,
 				       &bdev->tx_state)) {
 			/* Barrier to sync with other CPUs */
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e03dfbd92fcc..9f10c5e256ec 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2251,7 +2251,6 @@ static void btusb_mtk_wmt_recv(struct urb *urb)
 {
 	struct hci_dev *hdev = urb->context;
 	struct btusb_data *data = hci_get_drvdata(hdev);
-	struct hci_event_hdr *hdr;
 	struct sk_buff *skb;
 	int err;
 
@@ -2271,13 +2270,6 @@ static void btusb_mtk_wmt_recv(struct urb *urb)
 		hci_skb_pkt_type(skb) = HCI_EVENT_PKT;
 		skb_put_data(skb, urb->transfer_buffer, urb->actual_length);
 
-		hdr = (void *)skb->data;
-		/* Fix up the vendor event id with 0xff for vendor specific
-		 * instead of 0xe4 so that event send via monitoring socket can
-		 * be parsed properly.
-		 */
-		hdr->evt = 0xff;
-
 		/* When someone waits for the WMT event, the skb is being cloned
 		 * and being processed the events from there then.
 		 */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
