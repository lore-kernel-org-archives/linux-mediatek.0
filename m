Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F55CD5BC9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2026 23:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GgCJAEw2PrZATRMnXWI0xF7ma4Zgqhob/5XHNTbJWRk=; b=uMe7h1uCkIOiwBwnHJE2a2qGHu
	sFD4tdHD5fHv7QHhIWOwaFTpFss2pjc07Dkms+42NLeUVFTU7Aa/Ia3/i047VOVuJIkdskvRwhPq7
	YedPvnx5MD7NaT8sTvKZ7QD7na84omqY7uWibtrcDvnWpo+e0Xgcoz2Z6ivTs52PX4vN/CcWtezpR
	fxRJ81hyx8tlAV2MpMVG2dNTVxv6MrIhUEbVYBwUhkTE/Ucc/fwUd6dETfEsKARzHnrCGjGCYR163
	qbKdJudqK5b7dT0LAtTBYGWRgPLY/Cq8p9OJy/z6qQyfld0AkXpj7osh0TNhzf1uGvLymKpTd/EXh
	ZIuGwsuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRetK-00000000eCZ-1PKC;
	Mon, 25 May 2026 23:39:26 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRetI-00000000eC1-0Klo
	for linux-mediatek@lists.infradead.org;
	Mon, 25 May 2026 23:39:25 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2f68f3b075fso710722eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 May 2026 16:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779752363; x=1780357163; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgCJAEw2PrZATRMnXWI0xF7ma4Zgqhob/5XHNTbJWRk=;
        b=WHSRgawclN1swqUUv1QprK1bobnY3Zv2Sdr7ngaUNGo3EOot/Mx07OP1+nuMbqqoOu
         R6cSrPV9p3AYBvhVLcnKYxpN6UsOjqeiE+dfy9oArJQdYsFqZxDOJggMEaFlsd5rQ1CL
         LCih4poZyAx7wGRF0AmXsjCf7LXya8MKzqhPrBky1UNfDvxDTJ+HH12fjY2EiRm1QjFT
         9zzAHxw4/+pnjPwl+zFT/XvAVXrtIqdYtJ4Kdw5ko1C4qdOmVkKpQWcaQT4DsvziM7zU
         L2rgpk3pSeEySZT96o/GCOZRiUI0jecqgfp2XasBrYW4dVdGgfUp3k/3M+3NJmUM/qKQ
         JDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779752363; x=1780357163;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgCJAEw2PrZATRMnXWI0xF7ma4Zgqhob/5XHNTbJWRk=;
        b=IEyjdywW80/z16qPqju87pOdi0wrqhjxHGmh0YZMpq5zoMWfmO1HEZpvKIfFQgEwCM
         v9AVwS6yNNLiryVK+Nnv4DvtyaBsCuAMEKF0PrW8A9WeXbGIFRRvV7sOfal2GEkgs7JR
         XFv/VVObp61q9KRwSmcV6f96Mh08ErXj6tZSd5u/u5C4L+aLPbYCvSZDV0nHm0cf4u+C
         HFzrLA4Lx8/A+tN29sEW/funuZzAowvpp+LlS7rlyr/88d8eMz9NZOtZ6ppI0k1x9Apu
         nxgBFe3911tgFjvCXCK3UCF//9yCSaqB0ZVbTJdEUeCKij5Mb/854Rx/2Dm2N7aRa8Hu
         DcxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cWl8H9D7sn1TVZOI+NzHdbA9EGpFsn04Z6eUBykLsyxVdY0/qlLBMRGKQTmWNKISBKnjuB2u66xzcKWlTrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5GnMiYZRHQigEmD+ce9vNvoGeyYFcTvmoqRXiQURSU1WuGAOP
	CjioKmw4dq51U9rIPIVuMy1jBQXMEFwoaQwj1wywRtr5mClQft0U5svKhZo/wbBcAyF3Lg==
X-Gm-Gg: Acq92OGCUKYNe8DxkJCI0xljU5/I73n98Kpg5bALgeJFaM5RVdIavasEM7zSemGgtff
	zbzYHWJdEgkxE/ll4pIlkMAM54fvriNlHY0WOnUl5DQwY5RRJnrJUBL1Fp8fdsiO8Ag5J9Wivdb
	umDmbEQ6y+8IIai7gfDIuBO2cPrG9kzmvdi7cDN4hndZZfKIRLG51uC/4HflFtq0ULB09Tmrf8M
	CcT6ekcviExPztyT893lc9ybehz9WccfD2jlJSSu0KeQcdnWgxAb6HFlzeiySVgj6fhRi3u5OlK
	dPq34oe6V7krb26g+5tiQW1UWcjM6FoOlibzD9pzh1BdcAJZ1WwFZ23jUzPAnR9GGzOE1OC4C1M
	9Y/x0tkN6GZbPvTnsPqqaEY5J5FXQkexsXmrpsXKwAGqvaofvygLXbAPL18LZXUQuurKAdIgAO5
	oe8yA7qKDJlXbdjuOf4h1gCHe4kb3uL8Vr
X-Received: by 2002:a05:693c:2b10:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-304491415edmr8291255eec.17.1779752362366;
        Mon, 25 May 2026 16:39:22 -0700 (PDT)
Received: from wico-dev.wnam.ru ([23.95.253.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f3feadsm11858903eec.13.2026.05.25.16.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 16:39:21 -0700 (PDT)
Date: Tue, 26 May 2026 02:39:16 +0300
From: Ruslan Isaev <legale.legale@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: sean.wang@mediatek.com, nbd@nbd.name, lorenzo@kernel.org,
	ryder.lee@mediatek.com, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: mt76: track rx napi ownership for cleanup
Message-ID: <ahTdpNQp2va_xTVR@wico-dev.wnam.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_163924_142867_6D934FD2 
X-CRM114-Status: GOOD (  16.09  )
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


mt76_dma_cleanup() deletes rx napi instances for every allocated rx
queue. This is not symmetric with mt76_dma_init(), which skips WED_RRO
queues when adding rx napi.

Adding an unconditional napi_disable() in the cleanup path fixes the
mt7915 remove warning, but it is not safe for all other mt76 paths. mt7921 and
mt7925 can already disable rx napi in their unregister
paths before calling mt76_dma_cleanup(). On mt7996/mt7992 WED_RRO
queues may have ndesc set even though mt76 never added or enabled napi for them.

Track rx napi ownership and enabled state in struct mt76_queue so
cleanup only disables and deletes napi instances that were actually
added by mt76.

This keeps the existing reset/suspend/remove ordering intact while
avoiding double napi_disable() and avoiding napi cleanup on WED_RRO
queues without napi.

Signed-off-by: Ruslan Isaev <legale.legale@gmail.com>
---
v2:
- track mt76 rx napi state added/enabled
- avoid double napi_disable() on mt7921/mt7925 cleanup paths
- avoid napi cleanup on WED_RRO queues without napi

 drivers/net/wireless/mediatek/mt76/dma.c      |  9 +++--
 drivers/net/wireless/mediatek/mt76/mt76.h     | 40 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7603/mac.c   |  8 ++--
 .../net/wireless/mediatek/mt76/mt7615/pci.c   |  6 +--
 .../wireless/mediatek/mt76/mt7615/pci_mac.c   |  4 +-
 .../net/wireless/mediatek/mt76/mt76x0/pci.c   |  4 +-
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |  4 +-
 .../net/wireless/mediatek/mt76/mt76x2/pci.c   |  6 +--
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  8 ++--
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  8 ++--
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |  4 +-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  8 ++--
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  8 ++--
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  8 ++--
 drivers/net/wireless/mediatek/mt76/npu.c      |  3 +-
 15 files changed, 86 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f8c2fe5f2f58..5c531131a25f 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -1099,9 +1099,12 @@ static void
 mt76_dma_rx_queue_init(struct mt76_dev *dev, enum mt76_rxq_id qid,
 		       int (*poll)(struct napi_struct *napi, int budget))
 {
+	struct mt76_queue *q = &dev->q_rx[qid];
+
 	netif_napi_add(dev->napi_dev, &dev->napi[qid], poll);
-	mt76_dma_rx_fill_buf(dev, &dev->q_rx[qid], false);
-	napi_enable(&dev->napi[qid]);
+	q->napi_state = MT76_NAPI_ADDED;
+	mt76_dma_rx_fill_buf(dev, q, false);
+	mt76_rx_napi_enable(dev, qid);
 }
 
 static int
@@ -1189,7 +1192,7 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
 	mt76_for_each_q_rx(dev, i) {
 		struct mt76_queue *q = &dev->q_rx[i];
 
-		netif_napi_del(&dev->napi[i]);
+		mt76_rx_napi_del(dev, i);
 		mt76_dma_rx_cleanup(dev, q);
 
 		page_pool_destroy(q->page_pool);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 527bef97e122..3ce936bdcf88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -251,6 +251,7 @@ struct mt76_queue {
 	int buf_size;
 	bool stopped;
 	bool blocked;
+	u8 napi_state;
 
 	u8 buf_offset;
 	u16 flags;
@@ -1283,6 +1284,45 @@ static inline int mt76_wed_dma_setup(struct mt76_dev *dev, struct mt76_queue *q,
 	for (i = 0; i < ARRAY_SIZE((dev)->q_rx); i++)	\
 		if ((dev)->q_rx[i].ndesc)
 
+#define MT76_NAPI_ADDED		BIT(0)
+#define MT76_NAPI_ENABLED	BIT(1)
+
+static inline void mt76_rx_napi_enable(struct mt76_dev *dev, int qid)
+{
+	struct mt76_queue *q = &dev->q_rx[qid];
+
+	if (!(q->napi_state & MT76_NAPI_ADDED) ||
+	    (q->napi_state & MT76_NAPI_ENABLED))
+		return;
+
+	napi_enable(&dev->napi[qid]);
+	q->napi_state |= MT76_NAPI_ENABLED;
+}
+
+static inline void mt76_rx_napi_disable(struct mt76_dev *dev, int qid)
+{
+	struct mt76_queue *q = &dev->q_rx[qid];
+
+	if (!(q->napi_state & MT76_NAPI_ADDED) ||
+	    !(q->napi_state & MT76_NAPI_ENABLED))
+		return;
+
+	napi_disable(&dev->napi[qid]);
+	q->napi_state &= ~MT76_NAPI_ENABLED;
+}
+
+static inline void mt76_rx_napi_del(struct mt76_dev *dev, int qid)
+{
+	struct mt76_queue *q = &dev->q_rx[qid];
+
+	if (!(q->napi_state & MT76_NAPI_ADDED))
+		return;
+
+	mt76_rx_napi_disable(dev, qid);
+	netif_napi_del(&dev->napi[qid]);
+	q->napi_state = 0;
+}
+
 
 #define mt76_dereference(p, dev) \
 	rcu_dereference_protected(p, lockdep_is_held(&(dev)->mutex))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index d3110eeb45d7..be35ec0d31d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -1423,8 +1423,8 @@ static void mt7603_mac_watchdog_reset(struct mt7603_dev *dev)
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	tasklet_disable(&dev->mt76.pre_tbtt_tasklet);
-	napi_disable(&dev->mt76.napi[0]);
-	napi_disable(&dev->mt76.napi[1]);
+	mt76_rx_napi_disable(&dev->mt76, 0);
+	mt76_rx_napi_disable(&dev->mt76, 1);
 	napi_disable(&dev->mt76.tx_napi);
 
 	mutex_lock(&dev->mt76.mutex);
@@ -1474,8 +1474,8 @@ static void mt7603_mac_watchdog_reset(struct mt7603_dev *dev)
 	mt7603_beacon_set_timer(dev, -1, beacon_int);
 
 	napi_enable(&dev->mt76.tx_napi);
-	napi_enable(&dev->mt76.napi[0]);
-	napi_enable(&dev->mt76.napi[1]);
+	mt76_rx_napi_enable(&dev->mt76, 0);
+	mt76_rx_napi_enable(&dev->mt76, 1);
 
 	local_bh_disable();
 	napi_schedule(&dev->mt76.tx_napi);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
index f5018bfa317a..600b4f2bf1a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
@@ -92,7 +92,7 @@ static int mt7615_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	mt76_worker_disable(&mdev->tx_worker);
 
 	mt76_for_each_q_rx(mdev, i) {
-		napi_disable(&mdev->napi[i]);
+		mt76_rx_napi_disable(mdev, i);
 	}
 	tasklet_kill(&mdev->irq_tasklet);
 
@@ -127,7 +127,7 @@ static int mt7615_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 
 restore:
 	mt76_for_each_q_rx(mdev, i) {
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	}
 	napi_enable(&mdev->tx_napi);
 	if (hif_suspend)
@@ -166,7 +166,7 @@ static int mt7615_pci_resume(struct pci_dev *pdev)
 	mt76_worker_enable(&mdev->tx_worker);
 
 	mt76_for_each_q_rx(mdev, i) {
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	}
 	napi_enable(&mdev->tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
index 53cb1eed1e4f..a83589c628f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_mac.c
@@ -236,7 +236,7 @@ void mt7615_mac_reset_work(struct work_struct *work)
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	mt76_for_each_q_rx(&dev->mt76, i)
-		napi_disable(&dev->mt76.napi[i]);
+		mt76_rx_napi_disable(&dev->mt76, i);
 	napi_disable(&dev->mt76.tx_napi);
 
 	mt7615_mutex_acquire(dev);
@@ -264,7 +264,7 @@ void mt7615_mac_reset_work(struct work_struct *work)
 
 	napi_enable(&dev->mt76.tx_napi);
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_enable(&dev->mt76.napi[i]);
+		mt76_rx_napi_enable(&dev->mt76, i);
 	}
 
 	local_bh_disable();
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index f8d206a07f99..96380d016351 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -257,7 +257,7 @@ static int mt76x0e_suspend(struct pci_dev *pdev, pm_message_t state)
 	napi_disable(&mdev->tx_napi);
 
 	mt76_for_each_q_rx(mdev, i)
-		napi_disable(&mdev->napi[i]);
+		mt76_rx_napi_disable(mdev, i);
 
 	mt76x02_dma_disable(dev);
 	mt76x02_mcu_cleanup(dev);
@@ -285,7 +285,7 @@ static int mt76x0e_resume(struct pci_dev *pdev)
 
 	mt76_for_each_q_rx(mdev, i) {
 		mt76_queue_rx_reset(dev, i);
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	}
 	napi_enable(&mdev->tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index dc7c03d23123..0da4bbad5ba3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -444,7 +444,7 @@ static void mt76x02_watchdog_reset(struct mt76x02_dev *dev)
 	napi_disable(&dev->mt76.tx_napi);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_disable(&dev->mt76.napi[i]);
+		mt76_rx_napi_disable(&dev->mt76, i);
 	}
 
 	mutex_lock(&dev->mt76.mutex);
@@ -505,7 +505,7 @@ static void mt76x02_watchdog_reset(struct mt76x02_dev *dev)
 
 	napi_enable(&dev->mt76.tx_napi);
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_enable(&dev->mt76.napi[i]);
+		mt76_rx_napi_enable(&dev->mt76, i);
 	}
 
 	local_bh_disable();
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
index 491a32921a06..a23c2560e90f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
@@ -119,7 +119,7 @@ mt76x2e_suspend(struct pci_dev *pdev, pm_message_t state)
 	mt76_worker_disable(&mdev->tx_worker);
 
 	mt76_for_each_q_rx(mdev, i)
-		napi_disable(&mdev->napi[i]);
+		mt76_rx_napi_disable(mdev, i);
 
 	pci_enable_wake(pdev, pci_choose_state(pdev, state), true);
 	pci_save_state(pdev);
@@ -131,7 +131,7 @@ mt76x2e_suspend(struct pci_dev *pdev, pm_message_t state)
 
 restore:
 	mt76_for_each_q_rx(mdev, i)
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	napi_enable(&mdev->tx_napi);
 
 	return err;
@@ -153,7 +153,7 @@ mt76x2e_resume(struct pci_dev *pdev)
 	mt76_worker_enable(&mdev->tx_worker);
 
 	mt76_for_each_q_rx(mdev, i) {
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	}
 	napi_enable(&mdev->tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index cec2c4208255..354ed0b69013 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1327,7 +1327,7 @@ mt7915_mac_restart(struct mt7915_dev *dev)
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	mt76_for_each_q_rx(mdev, i) {
 		if (mdev->q_rx[i].ndesc)
-			napi_disable(&dev->mt76.napi[i]);
+			mt76_rx_napi_disable(&dev->mt76, i);
 	}
 	napi_disable(&dev->mt76.tx_napi);
 
@@ -1339,7 +1339,7 @@ mt7915_mac_restart(struct mt7915_dev *dev)
 
 	mt76_for_each_q_rx(mdev, i) {
 		if (mdev->q_rx[i].ndesc) {
-			napi_enable(&dev->mt76.napi[i]);
+			mt76_rx_napi_enable(&dev->mt76, i);
 		}
 	}
 
@@ -1527,7 +1527,7 @@ void mt7915_mac_reset_work(struct work_struct *work)
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	mt76_for_each_q_rx(&dev->mt76, i)
-		napi_disable(&dev->mt76.napi[i]);
+		mt76_rx_napi_disable(&dev->mt76, i);
 	napi_disable(&dev->mt76.tx_napi);
 
 
@@ -1558,7 +1558,7 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		clear_bit(MT76_RESET, &phy2->mt76->state);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_enable(&dev->mt76.napi[i]);
+		mt76_rx_napi_enable(&dev->mt76, i);
 	}
 
 	local_bh_disable();
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 7a790ddf43bb..c3188b344e50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -52,7 +52,7 @@ static void mt7921e_unregister_device(struct mt792x_dev *dev)
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
 	mt76_for_each_q_rx(&dev->mt76, i)
-		napi_disable(&dev->mt76.napi[i]);
+		mt76_rx_napi_disable(&dev->mt76, i);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 	cancel_work_sync(&dev->reset_work);
@@ -492,7 +492,7 @@ static int mt7921_pci_suspend(struct device *device)
 	mt76_worker_disable(&mdev->tx_worker);
 
 	mt76_for_each_q_rx(mdev, i) {
-		napi_disable(&mdev->napi[i]);
+		mt76_rx_napi_disable(mdev, i);
 	}
 
 	/* wait until dma is idle  */
@@ -518,7 +518,7 @@ static int mt7921_pci_suspend(struct device *device)
 
 restore_napi:
 	mt76_for_each_q_rx(mdev, i) {
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	}
 	napi_enable(&mdev->tx_napi);
 
@@ -564,7 +564,7 @@ static int mt7921_pci_resume(struct device *device)
 	mt76_worker_enable(&mdev->tx_worker);
 
 	mt76_for_each_q_rx(mdev, i) {
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	}
 	napi_enable(&mdev->tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index 0db7acb3a637..5d7871b8f77c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -72,7 +72,7 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_disable(&dev->mt76.napi[i]);
+		mt76_rx_napi_disable(&dev->mt76, i);
 	}
 	napi_disable(&dev->mt76.tx_napi);
 
@@ -82,7 +82,7 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
 	mt792x_wpdma_reset(dev, true);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_enable(&dev->mt76.napi[i]);
+		mt76_rx_napi_enable(&dev->mt76, i);
 	}
 
 	local_bh_disable();
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c4161754c01d..1da650ac7f4d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -40,7 +40,7 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
 	mt76_for_each_q_rx(&dev->mt76, i)
-		napi_disable(&dev->mt76.napi[i]);
+		mt76_rx_napi_disable(&dev->mt76, i);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 	cancel_work_sync(&dev->reset_work);
@@ -481,7 +481,7 @@ static int mt7925_pci_suspend(struct device *device)
 	mt76_worker_disable(&mdev->tx_worker);
 
 	mt76_for_each_q_rx(mdev, i) {
-		napi_disable(&mdev->napi[i]);
+		mt76_rx_napi_disable(mdev, i);
 	}
 
 	/* wait until dma is idle  */
@@ -509,7 +509,7 @@ static int mt7925_pci_suspend(struct device *device)
 
 restore_napi:
 	mt76_for_each_q_rx(mdev, i) {
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	}
 	napi_enable(&mdev->tx_napi);
 
@@ -559,7 +559,7 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	mt76_worker_enable(&mdev->tx_worker);
 
 	mt76_for_each_q_rx(mdev, i) {
-		napi_enable(&mdev->napi[i]);
+		mt76_rx_napi_enable(mdev, i);
 	}
 	napi_enable(&mdev->tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 3072850c2752..6bb47db8d16a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -88,11 +88,11 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
 	if (irq_map->rx.data_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MAIN]);
+		mt76_rx_napi_disable(&dev->mt76, MT_RXQ_MAIN);
 	if (irq_map->rx.wm_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MCU]);
+		mt76_rx_napi_disable(&dev->mt76, MT_RXQ_MCU);
 	if (irq_map->rx.wm2_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MCU_WA]);
+		mt76_rx_napi_disable(&dev->mt76, MT_RXQ_MCU_WA);
 	if (irq_map->tx.all_complete_mask)
 		napi_disable(&dev->mt76.tx_napi);
 
@@ -102,7 +102,7 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	mt792x_wpdma_reset(dev, true);
 
 	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_enable(&dev->mt76.napi[i]);
+		mt76_rx_napi_enable(&dev->mt76, i);
 	}
 	napi_enable(&dev->mt76.tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index e2a83da3a09c..a75238ce8807 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2262,7 +2262,7 @@ mt7996_mac_restart(struct mt7996_dev *dev)
 			continue;
 
 		if (mdev->q_rx[i].ndesc)
-			napi_disable(&dev->mt76.napi[i]);
+			mt76_rx_napi_disable(&dev->mt76, i);
 	}
 	napi_disable(&dev->mt76.tx_napi);
 
@@ -2278,7 +2278,7 @@ mt7996_mac_restart(struct mt7996_dev *dev)
 			continue;
 
 		if (mdev->q_rx[i].ndesc) {
-			napi_enable(&dev->mt76.napi[i]);
+			mt76_rx_napi_enable(&dev->mt76, i);
 			local_bh_disable();
 			napi_schedule(&dev->mt76.napi[i]);
 			local_bh_enable();
@@ -2534,7 +2534,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
 		if (mt76_queue_is_npu_txfree(&dev->mt76.q_rx[i]))
 			continue;
 
-		napi_disable(&dev->mt76.napi[i]);
+		mt76_rx_napi_disable(&dev->mt76, i);
 	}
 	napi_disable(&dev->mt76.tx_napi);
 
@@ -2596,7 +2596,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
 		if (mt76_queue_is_npu_txfree(&dev->mt76.q_rx[i]))
 			continue;
 
-		napi_enable(&dev->mt76.napi[i]);
+		mt76_rx_napi_enable(&dev->mt76, i);
 		local_bh_disable();
 		napi_schedule(&dev->mt76.napi[i]);
 		local_bh_enable();
diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index c4c7c0af6321..fb4ba5bdbf48 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -291,8 +291,9 @@ int mt76_npu_rx_queue_init(struct mt76_dev *dev, struct mt76_queue *q)
 		goto out;
 
 	netif_napi_add(dev->napi_dev, &dev->napi[qid], mt76_npu_rx_poll);
+	q->napi_state = MT76_NAPI_ADDED;
 	mt76_npu_fill_rx_queue(dev, q);
-	napi_enable(&dev->napi[qid]);
+	mt76_rx_napi_enable(dev, qid);
 out:
 	mutex_unlock(&dev->mutex);
 
-- 
2.39.5


