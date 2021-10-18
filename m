Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 21:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE286113E
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 21:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBE286113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g92m4eq1I17CY4r3Hdcw3uXnmB6q6ryK1F5km1yaDo4=; b=vK/9VgAM75NtUb
	bw3aSRCr0uhjZz72DBjEWSJj55dsIsb14c/t1gzzfw5SVTErm0e6k5mncVAwJfIffZgN4aOmTLKan
	+f0QZNDn1wjeHmjGXVAIUQ6Z55ht65zk9x4YTWMF8Qd9eefXQsgm0NYk6MdOj6ZIsG/vZ3LpvXEzz
	ityGEbvtH8RgdGfugPbAn2PgPMRq0nt2hI2m0Dk9RABwvwNP51tChXp14gX+7I3ilRYaLqbgiA0WC
	VpiTE1cA/5bNnPQMDgq0iHISnJI+096AjFsBhGHuXOQ4bfTlhYEk1zYe1ejVtx1lA7G/nWcGGtQrL
	7tWVDBBYkBQKBRjCqtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcaNG-00HLNh-HI; Mon, 18 Oct 2021 21:40:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcaND-00HLMm-DW
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 21:40:48 +0000
X-UUID: ee7443074e9046e59073396c53b536a0-20211018
X-UUID: ee7443074e9046e59073396c53b536a0-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 549885064; Mon, 18 Oct 2021 14:40:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 14:30:51 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Oct 2021 05:30:50 +0800
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
 <linux-kernel@vger.kernel.org>, Mark-yw Chen <mark-yw.chen@mediatek.com>
Subject: [PATCH v2 08/10] Bluetooth: btmtksdio: transmit packet according to
 status TX_EMPTY
Date: Tue, 19 Oct 2021 05:30:19 +0800
Message-ID: <3dccea770a3f656dffbae573b6d2b577af0ca324.1634592181.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1634592181.git.objelf@gmail.com>
References: <cover.1634592181.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_144047_494677_A3637A96 
X-CRM114-Status: GOOD (  15.25  )
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

From: Mark-yw Chen <mark-yw.chen@mediatek.com>

Each packet should be sent out until the device emits the TX_EMPTY signal
to the host, that is firmware people suggested to add to meet the actual
firmware behavior and that is compatible among all the devices.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index f816a7cb0a74..3266c5d83cae 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -103,6 +103,7 @@ struct btmtksdio_dev {
 	struct work_struct txrx_work;
 	unsigned long tx_state;
 	struct sk_buff_head txq;
+	bool hw_tx_ready;
 
 	struct sk_buff *evt_skb;
 
@@ -229,6 +230,7 @@ static int btmtksdio_tx_packet(struct btmtksdio_dev *bdev,
 	sdio_hdr->reserved = cpu_to_le16(0);
 	sdio_hdr->bt_type = hci_skb_pkt_type(skb);
 
+	bdev->hw_tx_ready = false;
 	err = sdio_writesb(bdev->func, MTK_REG_CTDR, skb->data,
 			   round_up(skb->len, MTK_SDIO_BLOCK_SIZE));
 	if (err < 0)
@@ -417,15 +419,6 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	/* Disable interrupt */
 	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, 0);
 
-	while ((skb = skb_dequeue(&bdev->txq))) {
-		err = btmtksdio_tx_packet(bdev, skb);
-		if (err < 0) {
-			bdev->hdev->stat.err_tx++;
-			skb_queue_head(&bdev->txq, skb);
-			break;
-		}
-	}
-
 	txrx_timeout = jiffies + 5 * HZ;
 
 	do {
@@ -446,10 +439,21 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 			bt_dev_dbg(bdev->hdev, "Get fw own back");
 
 		if (int_status & TX_EMPTY)
-			schedule_work(&bdev->txrx_work);
+			bdev->hw_tx_ready = true;
 		else if (unlikely(int_status & TX_FIFO_OVERFLOW))
 			bt_dev_warn(bdev->hdev, "Tx fifo overflow");
 
+		if (bdev->hw_tx_ready) {
+			skb = skb_dequeue(&bdev->txq);
+			if (skb) {
+				err = btmtksdio_tx_packet(bdev, skb);
+				if (err < 0) {
+					bdev->hdev->stat.err_tx++;
+					skb_queue_head(&bdev->txq, skb);
+				}
+			}
+		}
+
 		if (int_status & RX_DONE_INT) {
 			rx_size = sdio_readl(bdev->func, MTK_REG_CRPLR, NULL);
 			rx_size = (rx_size & RX_PKT_LEN) >> 16;
@@ -642,6 +646,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 	u8 param = 0x1;
 
 	calltime = ktime_get();
+	bdev->hw_tx_ready = true;
 
 	/* Query whether the firmware is already download */
 	wmt_params.op = BTMTK_WMT_SEMAPHORE;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
