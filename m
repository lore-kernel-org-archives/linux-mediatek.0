Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D654BC43219
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctpPkpQ0/RsPbjHnRj8V7ZTJopaMSOGe2Muev4DBRoU=; b=4m19azX1goTY7e
	AdT84L+y0bsulIPrEk/lipAw6F+oDN3ZlNB6KisfjwuEIJKOuH/7FUjyN3ufKLw8KlZJZwK3HSokV
	nMZe7pb22q+sAddSKGPsqOs5BKp3Ojf9BTKCJPbTdARq3nkqoLf9n4WYxfPfL9VMWka0NerML88ow
	54MXhw99Cq8S9Q54a91+N2tWKMI+SZE6AYRxQMgdmwh3rByxGWy+T65bvjh2Fk8hcx2X0eu9AArDJ
	/IPMwAr1d67Q6rp8AGoZqmduf96dI0kCWoldnE5v076uE//+/54ACE9FVtWbCwkM9JSHrL/L0YJHr
	Gmjah1YTziA6GNZfUiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIL3-0064Q7-JM; Fri, 01 Apr 2022 14:33:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naIJK-0063FO-6I; Fri, 01 Apr 2022 14:31:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9534B82500;
 Fri,  1 Apr 2022 14:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266DBC340EE;
 Fri,  1 Apr 2022 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823491;
 bh=qwb1WY2jHtNY5Hm+ktnqHKmRUzT0l4+oqODn1UVDDVM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=avi4Sa8x0tBd9rdhYG3kwbuFxLs8fYqC3bQ7e2RYIj6PGtddKx8CewLyCS+x72Xd6
 4WR206OXivkTZ/Z7BAxyATRBWzAmL9ChUWImdtveLAw85uNtdK/qiG4jcA2H70PJXy
 /A5bGldjD0IDZERcWWYboZRm9YKpFHscvJVJ7Qg9nTEW4faupXSCmH989PS/yswTO/
 tJpayP5K63nbu6yOZ4H7sVER4UdzuuQcqPIzsCe5ZiGa52EkaJyIVD6+ZH7q5SEDeB
 WjC1ffeYAbcBj6IcKRT1BC4zTOuHC/hexqEnm77haOv9SDSZXlkK/E3uQLvsnAvSzC
 7aUjmznOXpm+g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
 Sasha Levin <sashal@kernel.org>, johan.hedberg@gmail.com,
 luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.17 116/149] Bluetooth: mediatek: fix the conflict
 between mtk and msft vendor event
Date: Fri,  1 Apr 2022 10:25:03 -0400
Message-Id: <20220401142536.1948161-116-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_073134_576350_59C63000 
X-CRM114-Status: GOOD (  20.33  )
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

[ Upstream commit e4412654e260842e1a94ffe0d4026e8a6fd34246 ]

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
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btmtk.h     | 1 +
 drivers/bluetooth/btmtksdio.c | 9 +--------
 drivers/bluetooth/btusb.c     | 8 --------
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 6e7b0c7567c0..0defa68bc2ce 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -5,6 +5,7 @@
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 
+#define HCI_EV_WMT 0xe4
 #define HCI_WMT_MAX_EVENT_SIZE		64
 
 #define BTMTK_WMT_REG_READ 0x2
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b5ea8d3bffaa..a295a9389892 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -284,13 +284,6 @@ static int btmtksdio_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
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
@@ -306,7 +299,7 @@ static int btmtksdio_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	if (err < 0)
 		goto err_free_skb;
 
-	if (hdr->evt == HCI_EV_VENDOR) {
+	if (hdr->evt == HCI_EV_WMT) {
 		if (test_and_clear_bit(BTMTKSDIO_TX_WAIT_VND_EVT,
 				       &bdev->tx_state)) {
 			/* Barrier to sync with other CPUs */
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index c30d131da784..0959d10a6b84 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2245,7 +2245,6 @@ static void btusb_mtk_wmt_recv(struct urb *urb)
 {
 	struct hci_dev *hdev = urb->context;
 	struct btusb_data *data = hci_get_drvdata(hdev);
-	struct hci_event_hdr *hdr;
 	struct sk_buff *skb;
 	int err;
 
@@ -2265,13 +2264,6 @@ static void btusb_mtk_wmt_recv(struct urb *urb)
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
