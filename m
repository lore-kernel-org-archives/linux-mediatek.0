Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E684FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gre7dzQ6YUSg0YfdBTnAuCJFBJN5mHW21xhdUghikqI=; b=jtHHBjSWqNclOy
	Oyu1Xm9vr9AWMpjuQw/RtiheZ4eh7beah8bk+WD7h9OXkqs5B50cr+eFPwP4qpETAA0FblWXwsg52
	V34duTRx05+gBQ9TVRI2j8bednBfwJI4s7OCN/ZbSn7PJddxuZjXDSUL6EumSMRl/6nGbCSO7JlN2
	bzrMQIXhnTZj2DgBMyPu8e2ax6+d/UDK/0d6yDE/NmiY6jLLEGU1Sl5IR+BxrJx0mzfVOMxDBEc1A
	O6ioPAX29C20+s0xUxLq3BmDj/033JH4EqonvzlaklymR5ZcC0yqqWUHO1U4wKwLL8LY7nSh8Z2Jl
	E6fAr12a/cCzxaL56VWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moCUM-00Bho4-59; Fri, 19 Nov 2021 22:36:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moCUK-00Bhnh-0o
 for linux-mediatek@lists.infradead.org; Fri, 19 Nov 2021 22:36:09 +0000
X-UUID: 0cd124a5934848e295d511c63825c66a-20211119
X-UUID: 0cd124a5934848e295d511c63825c66a-20211119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1459231444; Fri, 19 Nov 2021 15:36:04 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Nov 2021 14:26:02 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 20 Nov 2021 06:25:48 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 20 Nov 2021 06:25:48 +0800
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
Subject: [PATCH 1/4] Bluetooth: btmtksdio: drop the unnecessary variable
 created
Date: Sat, 20 Nov 2021 06:25:43 +0800
Message-ID: <4176102d8bbc36e5156e348df666a3e12c5a3d75.1637360076.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_143608_092719_F24124F3 
X-CRM114-Status: GOOD (  12.63  )
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

Use the existent variable to drop the unnecessary variable created.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index ce6a6c00ff98..4f3412ad8fca 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -98,6 +98,7 @@ MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
 #define MTK_SDIO_BLOCK_SIZE	256
 
 #define BTMTKSDIO_TX_WAIT_VND_EVT	1
+#define BTMTKSDIO_HW_TX_READY		2
 
 struct mtkbtsdio_hdr {
 	__le16	len;
@@ -113,7 +114,6 @@ struct btmtksdio_dev {
 	struct work_struct txrx_work;
 	unsigned long tx_state;
 	struct sk_buff_head txq;
-	bool hw_tx_ready;
 
 	struct sk_buff *evt_skb;
 
@@ -254,7 +254,7 @@ static int btmtksdio_tx_packet(struct btmtksdio_dev *bdev,
 	sdio_hdr->reserved = cpu_to_le16(0);
 	sdio_hdr->bt_type = hci_skb_pkt_type(skb);
 
-	bdev->hw_tx_ready = false;
+	clear_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state);
 	err = sdio_writesb(bdev->func, MTK_REG_CTDR, skb->data,
 			   round_up(skb->len, MTK_SDIO_BLOCK_SIZE));
 	if (err < 0)
@@ -463,11 +463,12 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 			bt_dev_dbg(bdev->hdev, "Get fw own back");
 
 		if (int_status & TX_EMPTY)
-			bdev->hw_tx_ready = true;
+			set_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state);
+
 		else if (unlikely(int_status & TX_FIFO_OVERFLOW))
 			bt_dev_warn(bdev->hdev, "Tx fifo overflow");
 
-		if (bdev->hw_tx_ready) {
+		if (test_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state)) {
 			skb = skb_dequeue(&bdev->txq);
 			if (skb) {
 				err = btmtksdio_tx_packet(bdev, skb);
@@ -811,7 +812,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 	u32 fw_version = 0;
 
 	calltime = ktime_get();
-	bdev->hw_tx_ready = true;
+	set_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state);
 
 	switch (bdev->data->chipid) {
 	case 0x7921:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
