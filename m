Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB2E606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jHOr0dPy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=or/4GnPd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FdxODg1OMTh/8tBb7F6uXhtrvD4su2QPV2YIScAzIgc=; b=jHOr0dPytAcuje4D5rYDA7/B2U
	HNHahUrcMENAavQe/Zal8kpGsnipVN1OyynnFsB4RPMhnCmMMVG8ceElBA/Dl8P67EfiDA3ee3ctD
	H5Rs/X/3HMjE1T3CoYSfX5Z+KQe1/qOWhNEVOfGTKUVZ9wxhzrfevOQ+0KFvNTJCu+rWCDqcKxFfZ
	ARgd3AQgTbvzdEQpuMLnkfsXK53GHq1B2azHGCkcafkHonZnoBYkMXuDDuleJTIE2h3oeR5ATOgNC
	WsLP8gP5F+Npy7eedVb/T70xkQvselB1J69jSwIbzsf0ILJbHWVyXrRCc7ZydwWFmukJENAkrqn9L
	birs8Y2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJTq-000000060Lg-2KfN;
	Tue, 17 Nov 2026 13:44:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJTg-000000060Ip-2wjW;
	Tue, 17 Nov 2026 13:44:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C44046279F;
	Tue, 17 Nov 2026 13:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FAA1F000C7;
	Tue, 17 Nov 2026 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923043;
	bh=FdxODg1OMTh/8tBb7F6uXhtrvD4su2QPV2YIScAzIgc=;
	h=From:Date:Subject:To:Cc;
	b=or/4GnPdwHONLlVzympVxTs8huLooc3V1L30zxsdLm9ellfTnb7vtTDTsPjzUTikC
	 X5jvOveJ8wAmPuRs/bcdELbioSKnhKbXB5zrtD9a/ItHs/xJxTKKI/0aKXQm/zX3Lv
	 eg4k0F0GDahDkYz3xNLzlLFCVILLbZH6TlrnJe9UaeHcDmfBANA5ExfskzW6I1WOhH
	 2+W5KZ4WRPbCfOSUiYP/4suBP+1yHn1ZUiIbmQJA8W13O51RHXIaRoH8ttnIV3Pu+y
	 Pfy2fRxHK7PEcITyiHKiwEjcp4dm+7Jo7s+RJSI8RgBnb4gCW3c21HVZNpKNNUsxnR
	 de5w/M746HJ0Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 17 Nov 2026 14:43:46 +0100
Subject: [PATCH] wifi: mt76: npu: fix RX packet reassembly across NAPI
 polls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt76-npu-fixes-v1-1-11bf744747f2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBtoDBS6SrQQnWoWmWhFIN09a
 fn4/AqFs3CBUVXIfEuRIzZQp8BvLq6MEppB99oQkcX9tAZjunCRhwtysNr7gYwzDtqUMv+hPdP
 8vh+P5c51YAAAAA==
X-Change-ID: 20261117-mt76-npu-fixes-ed72cc316a6a
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Florian Maurer <fmaurer@disroot.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

mt76_npu_dequeue() builds an skb from the descriptors that make up a
single NPU RX packet. When a packet spans multiple descriptors and not
all of them are ready yet, the function frees the partially built skb
and returns NULL without advancing q->tail. The descriptors already
consumed are then processed again on the next NAPI poll, even though
their buffers have already been handed to the skb and recycled, leading
to a use-after-free/double-free and possible memory corruption.

Rework RX processing to keep the partially built skb and the number of
outstanding fragments across polls: store the skb in q->rx_head and the
remaining fragment count in the new q->pending field. The new
mt76_npu_rx_process_entry() consumes a whole packet, resuming a
previously started one if needed, and advances q->tail for every
consumed descriptor. Only fully received packets are passed up the
stack.

Release any pending skb in mt76_npu_queue_cleanup() and add the missing
DMA read barrier before accessing the descriptor length and info.

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Tested-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h |  1 +
 drivers/net/wireless/mediatek/mt76/npu.c  | 88 ++++++++++++++++++-------------
 2 files changed, 51 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 9e851dea71d9..f52a0e2246be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -249,6 +249,7 @@ struct mt76_queue {
 	int ndesc;
 	int queued;
 	int buf_size;
+	int pending;
 	bool stopped;
 	bool blocked;
 
diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index c4c7c0af6321..3ca83985376d 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -56,61 +56,81 @@ void mt76_npu_queue_cleanup(struct mt76_dev *dev, struct mt76_queue *q)
 		q->tail = (q->tail + 1) % q->ndesc;
 		q->queued--;
 	}
+	if (q->rx_head) {
+		dev_kfree_skb(q->rx_head);
+		q->rx_head = NULL;
+		q->pending = 0;
+	}
 	spin_unlock_bh(&q->lock);
 }
 
-static struct sk_buff *mt76_npu_dequeue(struct mt76_dev *dev,
-					struct mt76_queue *q,
-					u32 *info)
+static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 {
+	struct mt76_dev *dev = mt76_priv(napi->dev);
+	enum mt76_rxq_id qid = napi - dev->napi;
+	struct mt76_queue *q = &dev->q_rx[qid];
 	struct airoha_npu_rx_dma_desc *desc = (void *)q->desc;
-	int i, nframes, index = q->tail;
-	struct sk_buff *skb = NULL;
+	int nframes = q->pending;
+	u32 info = 0;
+
+	do {
+		struct mt76_queue_entry *e = &q->entry[q->tail];
+		u32 ctrl = READ_ONCE(desc[q->tail].ctrl);
+		int len;
 
-	nframes = FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, desc[index].info);
-	nframes = max_t(int, nframes, 1);
+		if (!q->queued) {
+			q->pending = nframes;
+			return -EBUSY;
+		}
 
-	for (i = 0; i < nframes; i++) {
-		struct mt76_queue_entry *e = &q->entry[index];
-		int len = FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK,
-				    desc[index].ctrl);
+		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, ctrl)) {
+			q->pending = nframes;
+			return -EBUSY;
+		}
 
-		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[index].ctrl)) {
-			dev_kfree_skb(skb);
-			return NULL;
+		dma_rmb();
+		len = FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK, ctrl);
+		info = desc[q->tail].info;
+		if (nframes == q->pending && !nframes) {
+			nframes = FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, info);
+			nframes = max_t(int, nframes, 1);
 		}
 
 		dma_sync_single_for_cpu(dev->dma_dev, e->dma_addr[0],
 					e->dma_len[0],
 					page_pool_get_dma_dir(q->page_pool));
 
-		if (!skb) {
-			skb = napi_build_skb(e->buf, q->buf_size);
-			if (!skb)
-				return NULL;
+		if (!q->rx_head) {
+			q->rx_head = napi_build_skb(e->buf, q->buf_size);
+			if (!q->rx_head)
+				return -ENOMEM;
 
-			__skb_put(skb, len);
-			skb_reset_mac_header(skb);
-			skb_mark_for_recycle(skb);
+			__skb_put(q->rx_head, len);
+			skb_reset_mac_header(q->rx_head);
+			skb_mark_for_recycle(q->rx_head);
 		} else {
-			struct skb_shared_info *shinfo = skb_shinfo(skb);
+			struct skb_shared_info *shinfo = skb_shinfo(q->rx_head);
 			struct page *page = virt_to_head_page(e->buf);
 			int nr_frags = shinfo->nr_frags;
 
 			if (nr_frags < ARRAY_SIZE(shinfo->frags))
-				skb_add_rx_frag(skb, nr_frags, page,
+				skb_add_rx_frag(q->rx_head, nr_frags, page,
 						e->buf - page_address(page),
 						len, q->buf_size);
 		}
 
-		*info = desc[index].info;
-		index = (index + 1) % q->ndesc;
-	}
-	q->tail = index;
-	q->queued -= i;
+		q->tail = (q->tail + 1) % q->ndesc;
+		q->queued--;
+	} while (--nframes > 0);
+
+	dev->drv->rx_skb(dev, qid, q->rx_head, &info);
+	mt76_rx_poll_complete(dev, qid, napi);
+	q->rx_head = NULL;
+	q->pending = 0;
+
 	Q_WRITE(q, dma_idx, q->tail);
 
-	return skb;
+	return 0;
 }
 
 void mt76_npu_check_ppe(struct mt76_dev *dev, struct sk_buff *skb,
@@ -155,18 +175,10 @@ static int mt76_npu_rx_poll(struct napi_struct *napi, int budget)
 		goto out;
 
 	while (done < budget) {
-		struct sk_buff *skb;
-		u32 info = 0;
-
-		skb = mt76_npu_dequeue(dev, &dev->q_rx[qid], &info);
-		if (!skb)
+		if (mt76_npu_rx_process_entry(napi))
 			break;
-
-		dev->drv->rx_skb(dev, qid, skb, &info);
-		mt76_rx_poll_complete(dev, qid, napi);
 		done++;
 	}
-
 	mt76_npu_fill_rx_queue(dev, &dev->q_rx[qid]);
 out:
 	if (done < budget && napi_complete(napi))

---
base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
change-id: 20261117-mt76-npu-fixes-ed72cc316a6a

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


