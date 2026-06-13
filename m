Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E03CD8CA8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dvt+/gI/3HJJNOdlepGPAqH24aZUV8l0eiSTSZ6kD30=; b=hkfPixSqHHuxXr1YIAispagGqs
	DJ4kZDHBhxodOA7f4M7++WSr2OOoxCTjLyZtS0mY+xY5JQeXx6v4tZP0NhtJs/jsRGaSSg4kWe/zj
	QvdZlDo8MUbm4IIjuGOPeaRUTZ/2OFrwfgcZfyaoF85pgUi9/9qoGiygwTH+gb8WpLu/MojKSvhlV
	9hAMUPO4k1BTUMjJPD2mH9fl64hknKQ2CQaIRKrGsBQMOOu7YbYodncdXUAwPabsvdAgZ7ENJr2QQ
	+nQlElqR9wkrv8ekgkpcb4kBy/x9tslu/Znd3UiFsY0C7aKhJ6/ME48n+QIF+JKLp9WGZ2kyaO/by
	L+ghHbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8G-0000000CaKO-1W9C;
	Sat, 13 Jun 2026 22:47:16 +0000
Received: from mail-dl1-f46.google.com ([74.125.82.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8D-0000000CaJU-2CSz
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:47:14 +0000
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1390f75d8bbso1725007c88.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390833; x=1781995633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dvt+/gI/3HJJNOdlepGPAqH24aZUV8l0eiSTSZ6kD30=;
        b=PAiC1AxrOtIEYODk6yIsrYY73gdQGlvjKQCKPLdQxM9JM1aJmrVfMmgmPZQCW8QQhc
         Juel/WG6MR3hqjec483RHtT9Kn/84l/tw3TfTTcJikN6kGQ1VzQqNZeYn+wU54B3B/IH
         dyi9G2rEbzmKnRgNEFhBiOZXfQNBZQGxS/KG9obnX6Ai2Bpq9srbafG7fG5uKY0qf3mW
         lHfukpdIf3TesjT22+06oic1i+TtHvT0dUQ2IbyLrysZUEZzT72+YlAw9AMH5ve2mm99
         c0uj+juNAj6kB7Yh5Tr8zTrNvx6CLsiTdPk3PEPz1ne5QcNWi4RMw+ZADbr3BwiPAMd8
         874A==
X-Forwarded-Encrypted: i=1; AFNElJ/tQLhI4Cb6Y1o3apFzVPI+Zy3WVo16Oj7speYV92366d/TUU5tH7ZHKv2px2bB+XgumDIsDBYRnyilW+ElhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL1eDk4UtQiPXKXGzDx4xf3JSi3FBlbu7Fjo2hPEpFQn7I44ty
	/dCdearRKsk8cz+0WB0GoFYQcfX/yWUzAsWpuBoepPpoaWDrBvE5IVOqqo5ky++9
X-Gm-Gg: Acq92OGC4tkGeKwj2kkRs8r9S9iz/9eGog9b3DfW6NpaJXBOEfWSy5gvbGn2EJJQ7zh
	bdrBseNUHcpztBjilUqfTsIriAjC9MebuPNmF11V3iPQCnvmiY6hs52a04qHgej7pC/ijPS77c6
	Pf7SWkfwMMT3r8Ug1lPtflvZog9dIGYhM18rxQeobK1Rv34pk5tp4QHrAPDu/LwXrAUA6Lqlv/U
	Z83W2I+gkGNFS6SHZZu3XRMyEGsNg1kWgL13O6e0kY4CdXdDGRtSTamhsm46FQ95CcYbUaltXI+
	SCkIbE7RGxsaLhvnXIMsdnaUDi8A8p37AyqFZ7lidhAJ4ZEznYcbovGnApdpEZqulZ0VfcBmxAq
	hNbo11xWbxqBFLtxHPKz4TBIr/dFy9WaR5S0DYDb7QGTo/oqAAX3X7un/72k4/TLVMDNjFJjkWe
	R9N6Da6qguqAWnStN1zfNvomt1npTOPaNl3KHkksXsmO/ziNTu+lCItcrQ6ZIC3+POx0ITBeqL2
	ce4KAN3kFrDYVVanpmVS43ZZwJTWb1ughiq1SMSIkUJJ4m0QNE=
X-Received: by 2002:a05:7022:4a4:b0:138:4023:8c1 with SMTP id a92af1059eb24-1384bb34465mr3561333c88.11.1781390832584;
        Sat, 13 Jun 2026 15:47:12 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97bf09sm6345380c88.14.2026.06.13.15.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:47:12 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/5] wifi: mt76: usb: support out-of-order RX URB completion
Date: Sat, 13 Jun 2026 17:46:52 -0500
Message-ID: <20260613224655.2405686-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224655.2405686-1-sean.wang@kernel.org>
References: <20260613224655.2405686-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154713_567653_BFCA2874 
X-CRM114-Status: GOOD (  16.69  )
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

From: Sean Wang <sean.wang@mediatek.com>

Keep per-URB RX queue context and complete entries by their real queue
position instead of assuming the completed URB is always at q->head.

USB RX URBs can complete out of order, and advancing q->head too early
can corrupt RX queue accounting and process buffers in the wrong order.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h |  5 ++
 drivers/net/wireless/mediatek/mt76/usb.c  | 77 ++++++++++++++++-------
 2 files changed, 61 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 122e77a5f2f4..81740aa7df71 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -655,6 +655,11 @@ struct mt76_mcu {
 	wait_queue_head_t wait;
 };
 
+struct mt76u_rx_entry {
+	struct mt76_queue_entry *e;
+	struct mt76_queue *q;
+};
+
 #define MT_TX_SG_MAX_SIZE	8
 #define MT_RX_SG_MAX_SIZE	4
 #define MT_NUM_TX_ENTRIES	256
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index ce68e1d0c786..cab36630c978 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -397,11 +397,25 @@ mt76u_urb_alloc(struct mt76_dev *dev, struct mt76_queue_entry *e,
 	return 0;
 }
 
+static void mt76u_urb_free(struct urb *urb)
+{
+	int i;
+
+	for (i = 0; i < urb->num_sgs; i++)
+		mt76_put_page_pool_buf(sg_virt(&urb->sg[i]), false);
+
+	if (urb->transfer_buffer)
+		mt76_put_page_pool_buf(urb->transfer_buffer, false);
+
+	usb_free_urb(urb);
+}
+
 static int
 mt76u_rx_urb_alloc(struct mt76_dev *dev, struct mt76_queue *q,
 		   struct mt76_queue_entry *e)
 {
 	enum mt76_rxq_id qid = q - &dev->q_rx[MT_RXQ_MAIN];
+	struct mt76u_rx_entry *rxe;
 	int err, sg_size;
 
 	sg_size = qid == MT_RXQ_MAIN ? MT_RX_SG_MAX_SIZE : 0;
@@ -409,20 +423,25 @@ mt76u_rx_urb_alloc(struct mt76_dev *dev, struct mt76_queue *q,
 	if (err)
 		return err;
 
-	return mt76u_refill_rx(dev, q, e->urb, sg_size);
-}
-
-static void mt76u_urb_free(struct urb *urb)
-{
-	int i;
+	rxe = kzalloc_obj(*rxe, GFP_KERNEL);
+	if (!rxe) {
+		usb_free_urb(e->urb);
+		e->urb = NULL;
+		return -ENOMEM;
+	}
 
-	for (i = 0; i < urb->num_sgs; i++)
-		mt76_put_page_pool_buf(sg_virt(&urb->sg[i]), false);
+	rxe->e = e;
+	rxe->q = q;
+	e->urb->context = rxe;
 
-	if (urb->transfer_buffer)
-		mt76_put_page_pool_buf(urb->transfer_buffer, false);
+	err = mt76u_refill_rx(dev, q, e->urb, sg_size);
+	if (err) {
+		kfree(rxe);
+		mt76u_urb_free(e->urb);
+		e->urb = NULL;
+	}
 
-	usb_free_urb(urb);
+	return err;
 }
 
 static void
@@ -566,8 +585,12 @@ mt76u_process_rx_entry(struct mt76_dev *dev, struct urb *urb,
 static void mt76u_complete_rx(struct urb *urb)
 {
 	struct mt76_dev *dev = dev_get_drvdata(&urb->dev->dev);
-	struct mt76_queue *q = urb->context;
+	struct mt76u_rx_entry *rxe = urb->context;
+	struct mt76_queue_entry *e = rxe->e;
+	unsigned int idx, pending, pos;
+	struct mt76_queue *q = rxe->q;
 	unsigned long flags;
+	bool wake = false;
 
 	trace_rx_urb(dev, urb);
 
@@ -586,18 +609,28 @@ static void mt76u_complete_rx(struct urb *urb)
 	}
 
 	spin_lock_irqsave(&q->lock, flags);
-	if (WARN_ONCE(q->entry[q->head].urb != urb, "rx urb mismatch"))
+	idx = e - q->entry;
+	pending = q->ndesc - q->queued;
+	pos = (idx + q->ndesc - q->head) % q->ndesc;
+	if (WARN_ONCE(idx >= q->ndesc || pos >= pending, "rx urb mismatch"))
 		goto out;
 
-	q->head = (q->head + 1) % q->ndesc;
-	q->queued++;
-
-	if (q == &dev->q_rx[MT_RXQ_MAIN])
-		napi_schedule(&dev->napi[MT_RXQ_MAIN]);
-	else
-		mt76_worker_schedule(&dev->usb.rx_worker);
+	e->done = true;
+	while (q->entry[q->head].done) {
+		q->entry[q->head].done = false;
+		q->head = (q->head + 1) % q->ndesc;
+		q->queued++;
+		wake = true;
+	}
 out:
 	spin_unlock_irqrestore(&q->lock, flags);
+
+	if (wake) {
+		if (q == &dev->q_rx[MT_RXQ_MAIN])
+			napi_schedule(&dev->napi[MT_RXQ_MAIN]);
+		else
+			mt76_worker_schedule(&dev->usb.rx_worker);
+	}
 }
 
 static int
@@ -607,7 +640,7 @@ mt76u_submit_rx_buf(struct mt76_dev *dev, enum mt76_rxq_id qid,
 	int ep = qid == MT_RXQ_MAIN ? MT_EP_IN_PKT_RX : MT_EP_IN_CMD_RESP;
 
 	mt76u_fill_bulk_urb(dev, USB_DIR_IN, ep, urb,
-			    mt76u_complete_rx, &dev->q_rx[qid]);
+			    mt76u_complete_rx, urb->context);
 	trace_submit_urb(dev, urb);
 
 	return usb_submit_urb(urb, GFP_ATOMIC);
@@ -678,6 +711,7 @@ mt76u_submit_rx_buffers(struct mt76_dev *dev, enum mt76_rxq_id qid)
 
 	spin_lock_irqsave(&q->lock, flags);
 	for (i = 0; i < q->ndesc; i++) {
+		q->entry[i].done = false;
 		err = mt76u_submit_rx_buf(dev, qid, q->entry[i].urb);
 		if (err < 0)
 			break;
@@ -733,6 +767,7 @@ mt76u_free_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		if (!q->entry[i].urb)
 			continue;
 
+		kfree(q->entry[i].urb->context);
 		mt76u_urb_free(q->entry[i].urb);
 		q->entry[i].urb = NULL;
 	}
-- 
2.43.0


