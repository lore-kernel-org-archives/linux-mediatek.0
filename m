Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63864C44507
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4mKCxrkd3qReLHiYbaRIiZoCsE0Mlk7ZVDcZrPTBQU=; b=nFug15AmpQAW7iQaJLg9nCZxHv
	t5EwOb+Xw+uHf+s+fBnUgZx2VNEwNnIETb0E3jfANGk9zAoZwnenVu09EsZuBxPuTtonGoKgKA8P1
	nUxa6BR0tdt5Kt/AF/lJAZwA28KPoyVvdeO5E7952ZqNBiJcCYvX7GVfVtsyoTfhjipFbOdP5JOR/
	QnlaKPRWKEkTCkhCqCruBF0e3TP0iA0M7F3A6+08lewuDwqY6BIIA8FgtEYy6PtqV8mYDUAR6IjXj
	DNT5EDiWIVX0IiZLFw0why82vex2lmpeYg7PM1Lkq46CayGCMTtwqRvLzmiiS1RUg+erFWyLR9aYa
	EJ2m2Ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke6p-00000001hQO-2C0x;
	Fri, 17 Jul 2026 08:39:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke6k-00000001hNg-1ScF
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 08:39:50 +0000
X-UUID: 0d15475c81bb11f1afed4741b24580c9-20260717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=q4mKCxrkd3qReLHiYbaRIiZoCsE0Mlk7ZVDcZrPTBQU=;
	b=uWMaz7omqMtfPUMGLDPZw++n0VOQiRK5ccCUny7xz1vGZ5dlWnqUN63dyWaPJeTuvyMx9gL3ZbKkJux6W7aAQOzFvgqR033idTzAqXOZTextkj5XlRuZYzHB3Swn3SfWi1esQMCpHuO/AOX6VGOcT6Y7XXwEABY1cF1gqdKCkPU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:20509a08-f53d-4c1f-8f60-0b5ba34fe309,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:c6c2965f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0d15475c81bb11f1afed4741b24580c9-20260717
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 470401094; Fri, 17 Jul 2026 01:39:40 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Jul 2026 16:39:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Jul 2026 16:39:37 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>,
	Sashiko <sashiko-review@kernel.org>
Subject: [PATCH v16 1/7] Bluetooth: btmtksdio: Fix SKB handling issues in TX path
Date: Fri, 17 Jul 2026 16:39:30 +0800
Message-ID: <20260717083936.2923891-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260717083936.2923891-1-chris.lu@mediatek.com>
References: <20260717083936.2923891-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013947_830777_7BE0486D 
X-CRM114-Status: GOOD (  19.86  )
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

Fix two SKB handling issues in btmtksdio_tx_packet():

1. DMA out-of-bounds read: The driver aligns transfer size to 256 bytes
   using round_up(), but does not ensure the skb buffer has sufficient
   tailroom, causing DMA to read beyond the buffer. Fix by expanding skb
   tailroom if needed and zero-filling the padding.

2. Cloned SKB corruption: The driver modifies SKB header (via skb_push)
   and tail (via skb_put_zero) without checking if the SKB is cloned.
   If the Bluetooth core passes a cloned SKB (e.g., from L2CAP
   retransmission queues), the driver corrupts the shared data buffer.

   Fix by calling skb_unshare() at function entry to ensure we have a
   private copy. Use double-pointer parameter (struct sk_buff **pskb)
   to properly update the caller's SKB pointer when skb_unshare()
   allocates a new SKB, preventing use-after-free when the caller
   requeues the SKB on error.

   On error paths, do not free the SKB - leave it valid for the caller
   to requeue, avoiding use-after-free in btmtksdio_txrx_work().

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Reported-by: Sashiko <sashiko-review@kernel.org>
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Assisted-by: Claude:Sonnet-4.5
---
 drivers/bluetooth/btmtksdio.c | 65 +++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e90..aea7d07b49ad 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -269,17 +269,32 @@ static int mtk_hci_wmt_sync(struct hci_dev *hdev,
 }
 
 static int btmtksdio_tx_packet(struct btmtksdio_dev *bdev,
-			       struct sk_buff *skb)
+			       struct sk_buff **pskb)
 {
+	struct sk_buff *skb = *pskb;
 	struct mtkbtsdio_hdr *sdio_hdr;
+	unsigned int padded_len, pad_len;
 	int err;
 
-	/* Make sure that there are enough rooms for SDIO header */
+	/* Ensure SKB is not cloned before any modification.
+	 * If cloned (e.g., L2CAP retransmission queues), create a
+	 * private copy to avoid corrupting shared data buffer.
+	 */
+	skb = skb_unshare(skb, GFP_ATOMIC);
+	if (!skb) {
+		*pskb = NULL;
+		return -ENOMEM;
+	}
+	*pskb = skb;
+
+	/* Make sure that there are enough rooms for SDIO header.
+	 * After skb_unshare(), we have exclusive ownership of the buffer.
+	 */
 	if (unlikely(skb_headroom(skb) < sizeof(*sdio_hdr))) {
 		err = pskb_expand_head(skb, sizeof(*sdio_hdr), 0,
 				       GFP_ATOMIC);
 		if (err < 0)
-			return err;
+			goto err_free_skb;
 	}
 
 	/* Prepend MediaTek SDIO Specific Header */
@@ -290,21 +305,50 @@ static int btmtksdio_tx_packet(struct btmtksdio_dev *bdev,
 	sdio_hdr->reserved = cpu_to_le16(0);
 	sdio_hdr->bt_type = hci_skb_pkt_type(skb);
 
+	/* Calculate padded length for block-aligned DMA transfer.
+	 * SDIO requires transfers to be block-aligned (MTK_SDIO_BLOCK_SIZE).
+	 * Pad with zeros to prevent DMA from reading beyond skb buffer.
+	 */
+	padded_len = round_up(skb->len, MTK_SDIO_BLOCK_SIZE);
+	pad_len = padded_len - skb->len;
+
+	if (pad_len > 0) {
+		/* Ensure sufficient tailroom for padding */
+		if (unlikely(skb_tailroom(skb) < pad_len)) {
+			err = pskb_expand_head(skb, 0, pad_len, GFP_ATOMIC);
+			if (err < 0)
+				goto err_skb_pull;
+			/* Reassign sdio_hdr after buffer reallocation */
+			sdio_hdr = (void *)skb->data;
+		}
+
+		/* Zero-fill padding to prevent information disclosure */
+		skb_put_zero(skb, pad_len);
+	}
+
 	clear_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state);
-	err = sdio_writesb(bdev->func, MTK_REG_CTDR, skb->data,
-			   round_up(skb->len, MTK_SDIO_BLOCK_SIZE));
+	err = sdio_writesb(bdev->func, MTK_REG_CTDR, skb->data, padded_len);
 	if (err < 0)
-		goto err_skb_pull;
+		goto err_skb_trim;
 
-	bdev->hdev->stat.byte_tx += skb->len;
+	/* Record actual transmitted data (excluding padding) */
+	bdev->hdev->stat.byte_tx += le16_to_cpu(sdio_hdr->len);
 
 	kfree_skb(skb);
+	*pskb = NULL;
 
 	return 0;
 
+err_skb_trim:
+	if (pad_len > 0)
+		skb_trim(skb, skb->len - pad_len);
 err_skb_pull:
 	skb_pull(skb, sizeof(*sdio_hdr));
-
+err_free_skb:
+	/* On error, keep skb valid for caller to requeue.
+	 * Do NOT free skb here - let caller handle it.
+	 */
+	*pskb = skb;
 	return err;
 }
 
@@ -606,10 +650,11 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 		if (test_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state)) {
 			skb = skb_dequeue(&bdev->txq);
 			if (skb) {
-				err = btmtksdio_tx_packet(bdev, skb);
+				err = btmtksdio_tx_packet(bdev, &skb);
 				if (err < 0) {
 					bdev->hdev->stat.err_tx++;
-					skb_queue_head(&bdev->txq, skb);
+					if (skb)
+						skb_queue_head(&bdev->txq, skb);
 				}
 			}
 		}
-- 
2.45.2


