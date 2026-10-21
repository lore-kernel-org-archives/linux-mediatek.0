Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B851606A319
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UIfniCcX;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=aREz7uPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n3FwEyIo7Vcx9zYzOnFYxTxgem53y0HAqqjNwh7AJmY=; b=UIfniCcXUArbu4tJ17ExJbORay
	WP3q0+T+nqA8T19ktGIxLJd9MAe+4pkVNuO5MRgNeZa+0DYt3PiiYycRjIC8Ey2w3PzuI2jpM+JIB
	MlZIv7rAcDwP9Q6hTtFC43WBHj4uYj1kfe4jqfRKIFowbBXn/7wRVwdDYBvWQ0MxrQIWq72bq+S7e
	nkpXav0wesrcq56Js6nIYmkprJtsjQwySn8MA1jEE8zAGpS8/PjNy6VHl71xNX5T15OW1TWLMrEym
	xNMnEWTn6qpEfvOKNKe/x4XbEp6ltpTDi20C+qsNe/w9X6tnZWgs29IM+3jnyFRYmJs4OisWOZBvJ
	H54UVGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfuM-0000000D31W-0cai;
	Wed, 21 Oct 2026 23:39:46 +0000
Received: from out-52.mta1.migadu.com ([2001:41d0:203:375::34] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJfuI-0000000D30J-3sPu
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 23:39:44 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5zjnmuNAR3yi/aRKcjj0i+hbo2YtZAeBwV7FRZWUe1w=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792625978; v=1; x=1793230778;
 b=aREz7uPsIag05BPJdaDaphz1Z7/CapPnwqP4GxzIMN07adHxvNUIJTTGfp+v/IcJ78DdzDsx
 z4d+iGUEGOmaDuWyUeqSRa+5EBzNjqUm+iirlEvxon/uE+psrz//yXnoKB1CFmH/9yW44HEMN6L
 z2/jXg7wAlMoU4B1Kl11a2Ugah8lYs26bjVBNJyz83wNusR1RrCXqs9LAs9vu5sTnwyN22U41kC
 H1AvfKT/7N21zeOd2btnvjRcEWIlh+o1+73bVRM0oJvGNXKxdE7az4VUtfgVQqe++b3AthNrAFa
 DCOlc4LmPS2MyKHsY3O583uJaTqvNxuQDnQghazy/1Yjg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0b20f29eccbdc5bf;
	Wed, 21 Oct 2026 23:39:38 +0000
X-Mizu-Trace-ID: 0b20f29eccbdc5bf
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Viktor Pashaiev <w.paszajew@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] wifi: mt76: usb: keep the tx worker parked through a reset or teardown
Date: Wed, 21 Oct 2026 16:39:35 -0700
Message-ID: <20261021233935.748017-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_163943_298323_849A655E 
X-CRM114-Status: GOOD (  12.75  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mt792x USB reset and disconnect paths park the tx worker and then
stop tx. If frames are still queued when the wait runs out, stopping tx
parks the worker a second time, which warns. It then unparks the worker,
which runs again during the chip reset or the teardown:

  WARNING: kernel/kthread.c:710 at kthread_park+0x8c/0xc0, CPU#2: kworker/u16:1/100
  Workqueue: mt76 mt7925_mac_reset_work [mt7925_common]
  Call Trace:
   mt7925u_mac_reset.part.0+0x73/0x1e0 [mt7925u]
   mt7925u_mac_reset+0x3c/0x50 [mt7925u]
   mt7925_mac_reset_work+0xb5/0x1f0 [mt7925_common]

Remember that a worker is disabled, and leave the worker to the caller
that parked it.

Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Fixes: 7910bd565d8b ("wifi: mt76: mt792x: quiesce USB paths on disconnect")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Making the disable call skip an already parked worker is not enough on
its own: stopping tx would still unpark the worker at its end.

Viktor Pashaiev's mt792x USB hardening patch avoided the same warning on
disconnect by not parking the worker there:
https://lore.kernel.org/linux-wireless/20260927180415.1498019-1-w.paszajew@gmail.com/
This keeps the park and fixes the stop path, which also covers the reset.

 drivers/net/wireless/mediatek/mt76/usb.c  | 10 ++++++++--
 drivers/net/wireless/mediatek/mt76/util.h |  9 ++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index be48a88a3ad0..47106ed6bb94 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -1068,6 +1068,7 @@ void mt76u_stop_tx(struct mt76_dev *dev)
 	ret = wait_event_timeout(dev->tx_wait, !mt76_has_tx_pending(&dev->phy),
 				 HZ / 5);
 	if (!ret) {
+		bool parked = mt76_worker_disabled(&dev->tx_worker);
 		struct mt76_queue_entry entry;
 		struct mt76_queue *q;
 		int i, j;
@@ -1083,7 +1084,11 @@ void mt76u_stop_tx(struct mt76_dev *dev)
 				usb_kill_urb(q->entry[j].urb);
 		}
 
-		mt76_worker_disable(&dev->tx_worker);
+		/* The mt792x disconnect and reset paths park the worker
+		 * before they get here. Leave it parked for them.
+		 */
+		if (!parked)
+			mt76_worker_disable(&dev->tx_worker);
 
 		/* On device removal we maight queue skb's, but mt76u_tx_kick()
 		 * will fail to submit urb, cleanup those skb's manually.
@@ -1100,7 +1105,8 @@ void mt76u_stop_tx(struct mt76_dev *dev)
 			}
 		}
 
-		mt76_worker_enable(&dev->tx_worker);
+		if (!parked)
+			mt76_worker_enable(&dev->tx_worker);
 	}
 
 	cancel_work_sync(&dev->usb.stat_work);
diff --git a/drivers/net/wireless/mediatek/mt76/util.h b/drivers/net/wireless/mediatek/mt76/util.h
index 617966e8de76..71f3aa42bb82 100644
--- a/drivers/net/wireless/mediatek/mt76/util.h
+++ b/drivers/net/wireless/mediatek/mt76/util.h
@@ -21,6 +21,7 @@ struct mt76_worker
 enum {
 	MT76_WORKER_SCHEDULED,
 	MT76_WORKER_RUNNING,
+	MT76_WORKER_DISABLED,
 };
 
 #define MT76_INCR(_var, _size) \
@@ -91,7 +92,7 @@ static inline void mt76_worker_disable(struct mt76_worker *w)
 		return;
 
 	kthread_park(w->task);
-	WRITE_ONCE(w->state, 0);
+	WRITE_ONCE(w->state, BIT(MT76_WORKER_DISABLED));
 }
 
 static inline void mt76_worker_enable(struct mt76_worker *w)
@@ -99,10 +100,16 @@ static inline void mt76_worker_enable(struct mt76_worker *w)
 	if (!w->task)
 		return;
 
+	clear_bit(MT76_WORKER_DISABLED, &w->state);
 	kthread_unpark(w->task);
 	mt76_worker_schedule(w);
 }
 
+static inline bool mt76_worker_disabled(struct mt76_worker *w)
+{
+	return test_bit(MT76_WORKER_DISABLED, &w->state);
+}
+
 static inline void mt76_worker_teardown(struct mt76_worker *w)
 {
 	if (!w->task)
-- 
2.56.0


