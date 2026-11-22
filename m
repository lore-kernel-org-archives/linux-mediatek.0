Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38720606A320
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2026 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eCLtgV+D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIFn8aYN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hDiLfLkVi2BJOFHCEI42KT0ixsZ7jOa65OfeACjeJko=; b=eCLtgV+DyzofNM
	SUPxn7BWg2FHcxxV9TVJOuUh+1pyjPJFQSLE+kQtzRVsWYrz/IXnp2VXpkkjHUh+RUR4iyj5gsMuI
	T0Lp+W9gLrvHOCu7wDUdB/qnGtqRnxt/ASAxvEqUFkhF+X7+BcVJm91OTQB6T1IgY9PzWeOw9dfvw
	XGBACC+5I5ct2sM6fmjuxkkH3aVsUkh0yb6ZiwMZ4VOLSh04fvC0Cs/YM3o7jTIFxx4l207YGDGKB
	dHnV1BcoKWZjRs2y3zzjSbJW9Y8z1HHtKEsw32v4mvhtd1JN8Jt4rc7gmYVmpIOjGyrPRei0YDRN0
	MGhLG4DKq/pw8CHl+6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5SB-000000010QV-3xCO;
	Sun, 22 Nov 2026 11:09:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5S5-000000010OV-2Il9;
	Sun, 22 Nov 2026 11:09:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5066944E18;
	Sun, 22 Nov 2026 11:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADD31F000C4;
	Sun, 22 Nov 2026 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345785;
	bh=hDiLfLkVi2BJOFHCEI42KT0ixsZ7jOa65OfeACjeJko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LIFn8aYN/dt9xjsGkVCkqHecP4zc9h6t8cujdyOlgUUnvI1ycb6xa4ipu7SP2vxiX
	 e4iWqp22cF1CoIh9n0U880rxW4wsSCZCU1nyPBC8uemrl676AaPYC5fXi2RRStkuPg
	 VkLnYNFvMShcWoAA3jdDrh0temXrQgSaESHCnVpw18j+N58KWToQ7VVnWXJIRd/E3Q
	 mqZ2OjrxlJNzn8js3hUEOQO+4BEp0Pg0F4bIuwZgipKgjQ31L9C+0JHPIn1pD4gMyC
	 MROL4ADcwCWj0ZvSiQSteCnUDrYwbp2J0YF4OnhzZcHHN5a1vYEJwFBOcb7KxN08oa
	 GF4ot9kFJNDBQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 22 Nov 2026 12:09:14 +0100
Subject: [PATCH 1/2] wifi: mt76: npu: acquire queue lock running npu napi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-mt76-npu-fixes-v1-1-8d8876b91970@kernel.org>
References: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
In-Reply-To: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NPU RX NAPI path updates the ring indices (head/tail/queued) and the
pending reassembly state in mt76_npu_fill_rx_queue() and
mt76_npu_rx_process_entry() without taking q->lock, while the cleanup and
reset paths do. A NAPI poll racing with a queue reset/cleanup can
therefore corrupt the ring. Protect the ring bookkeeping with q->lock in
both helpers, and drop the lock before calling rx_skb() and
mt76_rx_poll_complete() since those can sleep.

Move the dma_idx update out of mt76_npu_rx_process_entry() into
mt76_npu_fill_rx_queue(), after the ring has been refilled, so slots are
handed back to the NPU only once they point to new buffers. Updating
dma_idx as soon as a frame is dequeued lets the NPU DMA into descriptors
that still reference buffers already passed up the stack (or still owned
by a partially reassembled frame), leading to memory corruption under RX
load. Add the missing write barrier before the dma_idx update so the new
descriptor addresses are visible to the NPU before it may reuse the
slots.

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 37 +++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index 3ca83985376d..fbefc86001ff 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -18,6 +18,8 @@ int mt76_npu_fill_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 {
 	int nframes = 0;
 
+	spin_lock_bh(&q->lock);
+
 	while (q->queued < q->ndesc - 1) {
 		struct airoha_npu_rx_dma_desc *desc = (void *)q->desc;
 		struct mt76_queue_entry *e = &q->entry[q->head];
@@ -40,6 +42,11 @@ int mt76_npu_fill_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		nframes++;
 	}
 
+	wmb();
+	Q_WRITE(q, dma_idx, q->tail);
+
+	spin_unlock_bh(&q->lock);
+
 	return nframes;
 }
 
@@ -70,9 +77,13 @@ static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 	enum mt76_rxq_id qid = napi - dev->napi;
 	struct mt76_queue *q = &dev->q_rx[qid];
 	struct airoha_npu_rx_dma_desc *desc = (void *)q->desc;
-	int nframes = q->pending;
+	int nframes, ret = 0;
+	struct sk_buff *skb;
 	u32 info = 0;
 
+	spin_lock_bh(&q->lock);
+
+	nframes = q->pending;
 	do {
 		struct mt76_queue_entry *e = &q->entry[q->tail];
 		u32 ctrl = READ_ONCE(desc[q->tail].ctrl);
@@ -80,12 +91,14 @@ static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 
 		if (!q->queued) {
 			q->pending = nframes;
-			return -EBUSY;
+			ret = -EBUSY;
+			goto error_unlock;
 		}
 
 		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, ctrl)) {
 			q->pending = nframes;
-			return -EBUSY;
+			ret = -EBUSY;
+			goto error_unlock;
 		}
 
 		dma_rmb();
@@ -102,8 +115,10 @@ static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 
 		if (!q->rx_head) {
 			q->rx_head = napi_build_skb(e->buf, q->buf_size);
-			if (!q->rx_head)
-				return -ENOMEM;
+			if (!q->rx_head) {
+				ret = -ENOMEM;
+				goto error_unlock;
+			}
 
 			__skb_put(q->rx_head, len);
 			skb_reset_mac_header(q->rx_head);
@@ -123,14 +138,20 @@ static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 		q->queued--;
 	} while (--nframes > 0);
 
-	dev->drv->rx_skb(dev, qid, q->rx_head, &info);
-	mt76_rx_poll_complete(dev, qid, napi);
+	skb = q->rx_head;
 	q->rx_head = NULL;
 	q->pending = 0;
 
-	Q_WRITE(q, dma_idx, q->tail);
+	spin_unlock_bh(&q->lock);
+
+	dev->drv->rx_skb(dev, qid, skb, &info);
+	mt76_rx_poll_complete(dev, qid, napi);
 
 	return 0;
+
+error_unlock:
+	spin_unlock_bh(&q->lock);
+	return ret;
 }
 
 void mt76_npu_check_ppe(struct mt76_dev *dev, struct sk_buff *skb,

-- 
2.56.1


