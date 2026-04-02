Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B0ED6AAF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2026 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtS1OkkhTmC+kJWduMT9+PxAc4KJJ2D34QZmfUPxalo=; b=CMUHTr6fv2ayc5oyIMhMod7Jml
	hq9Q53aswRlBYicapcCyDPq50onNFf7hKfTqxI+fdkvQWe97Gn2c8w84gMjC+B6BVjHLzqUddSUfw
	iTirFy+mcsG5jeieSC4N0/1QLgbjBnVR2iEERZe9hg7xSsrL8p8hKaTyYGhNMLsIdYDSML5khNv2L
	eBioh6Vmu8rZ/n3eG/YPc3Y1Omqq5ehPb028y999I1xdcewU+LQlxDxcB0e2yizRzEqp5zaF85rzk
	T1tR2aPRYcK42WXX82f5e91Ij9h0Pi2PFgUJpOjb1/LedV5YWP5FwaUTUAFVKwCkVZ5uAFTWyVaHB
	pRCxW3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LWJ-00000000ZoQ-0S7O;
	Thu, 02 Apr 2026 17:07:51 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LWG-00000000Zmb-31FF
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Apr 2026 17:07:49 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b24e9b4d82so22311135ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2026 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775149667; x=1775754467; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtS1OkkhTmC+kJWduMT9+PxAc4KJJ2D34QZmfUPxalo=;
        b=agpxmsfsFKjaphV8EfcDPxQqCcuy7cApC0GIP+b14BiPibR7Fg1ue2f3CS49bYSJkO
         OE+nKjv9NiqGNkDZne4OWcTWUGxS8X69AZLcqMUZj/oTsHjWAV2WDPOIwMVqALUC7vOE
         Qevy+VzM6040tQvchkkzl9f6qcRarLKaGMnUiuoxgpfQ7lt5pSZCkxFAjX9XOh9maF3t
         x49IDGHQxB0hUqa5DbjzaTR72x7f7bU3E55ASi6WhGgAWFIYac56W2WgczxFRaZGgeNt
         cWmc49iaiofpe6q4eh4q1imwUv2CFUnn/OO708NW/3235MGmsWoQe4vcupXG1PIUAPYx
         BNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149667; x=1775754467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtS1OkkhTmC+kJWduMT9+PxAc4KJJ2D34QZmfUPxalo=;
        b=JWJpP3diS+0pHjbuPBhio5VdLP0XTeUf1CF4LPqJIRK/P4Hf5so82o32jXb/U6xUWR
         CdRIWgmV5/OyAxReFX6LD98/mmsJ9WZf8aFeRww8Bblk6bVpulDKpckvLHEXiUTdirIT
         gEFps7l8xpV1X4x04/36wuG2Ow028QKX0BxceCbf1CfLVQxgyfn9L/CZe2ZwkSnFWLuL
         ol/CTD3/tAy8z6LzALGRV+dWZ4skyo0G+Cb0QSrO6T1V8cdvsYWIV6+XB76FUdctFPY5
         Y9zAWQHOVb2EYL4ctTlSSkjFAmaJa8UNqPLQEy/YAw2nSzm44pYcq3P2KSq9fQ/rC5pQ
         ADBw==
X-Forwarded-Encrypted: i=1; AJvYcCUKLdQ62EbYSessPUWSduEBWy0zZJQiVLFBjtEWQc92Wa7JGrU3o1eW8TGNh8WVY8q+Lbej/7DLad0D6V7VwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzX+f6wTw8T6usfw4JITItzB0rwSqt9eKo2ZmpqVf+uES8UYMx
	ArGJn8Vx2JTZJGNxRVXx20+DPxzKWNwverEoN04cKQCcJs5JcIlXlMb+gGoOujAXJYWcaU6mOs7
	5j/v/MSc3NnXIoV3yT0VM2eYj6g==
X-Received: from plse12.prod.google.com ([2002:a17:902:b78c:b0:2b0:537d:70cc])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e850:b0:2b2:4f43:b49a with SMTP id d9443c01a7336-2b277e52d1dmr29085885ad.22.1775149666599;
 Thu, 02 Apr 2026 10:07:46 -0700 (PDT)
Date: Thu,  2 Apr 2026 17:06:41 +0000
In-Reply-To: <20260402170641.2082547-1-joonwonkang@google.com>
Mime-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402170641.2082547-3-joonwonkang@google.com>
Subject: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error code
 when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Joonwon Kang <joonwonkang@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_100748_756004_C8AFC451 
X-CRM114-Status: GOOD (  18.23  )
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

When the mailbox controller failed transmitting message, the error code
was only passed to the client's tx done handler and not to
mbox_send_message(). For this reason, the function could return a false
success. This commit resolves the issue by introducing the tx status and
checking it before mbox_send_message() returns.

Cc: stable@vger.kernel.org
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
 drivers/mailbox/mailbox.c          | 20 +++++++++++++++-----
 include/linux/mailbox_controller.h |  2 ++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d63386468982..ea9aec9dc947 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -21,7 +21,10 @@
 static LIST_HEAD(mbox_cons);
 static DEFINE_MUTEX(con_mutex);
 
-static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx_complete)
+static int add_to_rbuf(struct mbox_chan *chan,
+		       void *mssg,
+		       struct completion *tx_complete,
+		       int *tx_status)
 {
 	int idx;
 
@@ -34,6 +37,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx
 	idx = chan->msg_free;
 	chan->msg_data[idx].data = mssg;
 	chan->msg_data[idx].tx_complete = tx_complete;
+	chan->msg_data[idx].tx_status = tx_status;
 	chan->msg_count++;
 
 	if (idx == MBOX_TX_QUEUE_LEN - 1)
@@ -91,12 +95,13 @@ static void msg_submit(struct mbox_chan *chan)
 
 static void tx_tick(struct mbox_chan *chan, int r, int idx)
 {
-	struct mbox_message mssg = {MBOX_NO_MSG, NULL};
+	struct mbox_message mssg = {MBOX_NO_MSG, NULL, NULL};
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		if (idx >= 0 && idx != chan->active_req) {
 			chan->msg_data[idx].data = MBOX_NO_MSG;
 			chan->msg_data[idx].tx_complete = NULL;
+			chan->msg_data[idx].tx_status = NULL;
 			return;
 		}
 
@@ -116,8 +121,10 @@ static void tx_tick(struct mbox_chan *chan, int r, int idx)
 	if (chan->cl->tx_done)
 		chan->cl->tx_done(chan->cl, mssg.data, r);
 
-	if (r != -ETIME && chan->cl->tx_block)
+	if (r != -ETIME && chan->cl->tx_block) {
+		*mssg.tx_status = r;
 		complete(mssg.tx_complete);
+	}
 }
 
 static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
@@ -286,15 +293,16 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	int t;
 	int idx;
 	struct completion tx_complete;
+	int tx_status = 0;
 
 	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
 	if (chan->cl->tx_block) {
 		init_completion(&tx_complete);
-		t = add_to_rbuf(chan, mssg, &tx_complete);
+		t = add_to_rbuf(chan, mssg, &tx_complete, &tx_status);
 	} else {
-		t = add_to_rbuf(chan, mssg, NULL);
+		t = add_to_rbuf(chan, mssg, NULL, NULL);
 	}
 
 	if (t < 0) {
@@ -318,6 +326,8 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 			idx = t;
 			t = -ETIME;
 			tx_tick(chan, t, idx);
+		} else if (tx_status < 0) {
+			t = tx_status;
 		}
 	}
 
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 912499ad08ed..890da97bcb50 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -117,10 +117,12 @@ struct mbox_controller {
  * struct mbox_message - Internal representation of a mailbox message
  * @data:		Data packet
  * @tx_complete:	Pointer to the transmission completion
+ * @tx_status:		Pointer to the transmission status
  */
 struct mbox_message {
 	void *data;
 	struct completion *tx_complete;
+	int *tx_status;
 };
 
 /**
-- 
2.53.0.1185.g05d4b7b318-goog


