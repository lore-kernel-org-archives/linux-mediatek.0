Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 13:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9261160F46
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 13:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9261160F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpWcJeExMpQ5VPpmopLAjKL0XwvJx1vKtFqz5JbGsU4=; b=Qqhv6YkRyFemRL
	ethBx6p+SWEIsigiYHZ7V18SjEqwE2s5vbbcGPVO9AX/mTOLJTxiaAKZRD4SU1RfbemIUEYpMoI5h
	CimwU3aI9p6QVv67Oive9pnXDXAFr10XGRrCHaH1b0q2ST51IT74HJc38iucl2iQ6xJ5HzR8JC7Xk
	xfoFTf+bgknIBfx57RxaUq3EUQDme+/WquBnf+xp6mf74nrulz7mIvCVmgf27pL00iHV1sFK9tUFK
	ZERwhPujlbc2StS6+ZYaj4VYauWdJTmSLyK+nCbUQek9pLnDNiaXXcfiW1edyVRV+2XX9zDK8k6b6
	qsfSh3jkMv8M/bbeBTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezuQ-00GVzc-LE; Mon, 25 Oct 2021 13:21:02 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezuE-00GVwL-2Q; Mon, 25 Oct 2021 13:20:51 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4E5B61FD66;
 Mon, 25 Oct 2021 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1635168048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9bI5P9OAmQr6ljmwmkkVDuf+cV94P12wy0mjtnQB4o=;
 b=uTdhuG4Zwy2W4PYLlf3uQNxqzcK129ny8amjR3fEaTXwAwk52YZBXqtCnlvryC2PED21Eq
 WLCt92WJvmazEuo5PAAD5Td4DuNAU/r1J4NrtM3dzV33Lq+lclqMlX+jlzmzmy9DD3d2zA
 1P5Hj5f4ybgM7N0lA/d8euNEOXNmP/Q=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2D1DFA3B81;
 Mon, 25 Oct 2021 13:20:48 +0000 (UTC)
Date: Mon, 25 Oct 2021 15:20:47 +0200
From: Petr Mladek <pmladek@suse.com>
To: "chunlei.wang" <Chunlei.wang@mediatek.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 John Ogness <john.ogness@linutronix.de>
Subject: [PATCH] printk: ringbuffer: Improve prb_next_seq() performance
Message-ID: <YXavL+XxgAPbtJQf@alley>
References: <1587709294.9792.5.camel@mbjsdccf07>
 <20200424070219.GA543@jagdpanzerIV.localdomain>
 <11f00d85b770e676cd0e06d87cc819ce82bb0beb.camel@mediatek.com>
 <YXaufehhi8QVCnds@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXaufehhi8QVCnds@alley>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_062050_290848_F31A3158 
X-CRM114-Status: GOOD (  23.92  )
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

prb_next_seq() always iterates from the first known sequence number.
In the worst case, it might loop 8k times for 256kB buffer,
15k times for 512kB buffer, and 64k times for 2MB buffer.

It was reported that pooling and reading using syslog interface
might occupy 50% of CPU.

Speedup the search by storing @id of the last finalized descriptor.

The loop is still needed because the @id is stored and read in the best
effort way. An atomic variable is used to keep the @id consistent.
But the stores and reads are not serialized against each other.
The descriptor could get reused in the meantime. The related sequence
number will be used only when it is still valid.

An invalid value should be read _only_ when there is a flood of messages
and the ringbuffer is rapidly reused. The performance is the least
problem in this case.

Reported-by: Chunlei Wang <chunlei.wang@mediatek.com>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk_ringbuffer.c | 46 ++++++++++++++++++++++++++++---
 kernel/printk/printk_ringbuffer.h |  2 ++
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 8a7b7362c0dd..7e0c11be07c8 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -474,8 +474,10 @@ static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
 	 * state has been re-checked. A memcpy() for all of @desc
 	 * cannot be used because of the atomic_t @state_var field.
 	 */
-	memcpy(&desc_out->text_blk_lpos, &desc->text_blk_lpos,
-	       sizeof(desc_out->text_blk_lpos)); /* LMM(desc_read:C) */
+	if (desc_out) {
+		memcpy(&desc_out->text_blk_lpos, &desc->text_blk_lpos,
+		       sizeof(desc_out->text_blk_lpos)); /* LMM(desc_read:C) */
+	}
 	if (seq_out)
 		*seq_out = info->seq; /* also part of desc_read:C */
 	if (caller_id_out)
@@ -1449,6 +1451,9 @@ static void desc_make_final(struct prb_desc_ring *desc_ring, unsigned long id)
 
 	atomic_long_cmpxchg_relaxed(&d->state_var, prev_state_val,
 			DESC_SV(id, desc_finalized)); /* LMM(desc_make_final:A) */
+
+	/* Best effort to remember the last finalized @id. */
+	atomic_long_set(&desc_ring->last_finalized_id, id);
 }
 
 /**
@@ -1657,7 +1662,12 @@ void prb_commit(struct prb_reserved_entry *e)
  */
 void prb_final_commit(struct prb_reserved_entry *e)
 {
+	struct prb_desc_ring *desc_ring = &e->rb->desc_ring;
+
 	_prb_commit(e, desc_finalized);
+
+	/* Best effort to remember the last finalized @id. */
+	atomic_long_set(&desc_ring->last_finalized_id, e->id);
 }
 
 /*
@@ -1988,6 +1998,30 @@ u64 prb_first_valid_seq(struct printk_ringbuffer *rb)
 	return seq;
 }
 
+/* Try to read seq from the last known location. */
+static u64 prb_last_finalized_seq(struct printk_ringbuffer *rb)
+{
+	struct prb_desc_ring *desc_ring = &rb->desc_ring;
+	enum desc_state d_state;
+	unsigned long id;
+	u64 seq = 0;
+
+	/* Check if the cached @id still points to a valid @seq. */
+	id = atomic_long_read(&desc_ring->last_finalized_id);
+	d_state = desc_read(desc_ring, id, NULL, &seq, NULL);
+
+	if (d_state == desc_finalized || d_state == desc_reusable)
+		return seq;
+
+	/*
+	 * The information about the last finalized sequence number
+	 * has gone. It should happen only when there is a flood of
+	 * new messages and the ringbuffer is rapidly recycled.
+	 * Give up and start from the beginning.
+	 */
+	return 0;
+}
+
 /**
  * prb_next_seq() - Get the sequence number after the last available record.
  *
@@ -2005,9 +2039,12 @@ u64 prb_first_valid_seq(struct printk_ringbuffer *rb)
  */
 u64 prb_next_seq(struct printk_ringbuffer *rb)
 {
-	u64 seq = 0;
+	u64 seq = prb_last_finalized_seq(rb);
 
-	/* Search forward from the oldest descriptor. */
+	/*
+	 * The information about the last finalized @seq might be inaccurate.
+	 * Search forward to find the current one.
+	 */
 	while (_prb_read_valid(rb, &seq, NULL, NULL))
 		seq++;
 
@@ -2044,6 +2081,7 @@ void prb_init(struct printk_ringbuffer *rb,
 	rb->desc_ring.infos = infos;
 	atomic_long_set(&rb->desc_ring.head_id, DESC0_ID(descbits));
 	atomic_long_set(&rb->desc_ring.tail_id, DESC0_ID(descbits));
+	atomic_long_set(&rb->desc_ring.last_finalized_id, DESC0_ID(descbits));
 
 	rb->text_data_ring.size_bits = textbits;
 	rb->text_data_ring.data = text_buf;
diff --git a/kernel/printk/printk_ringbuffer.h b/kernel/printk/printk_ringbuffer.h
index 73cc80e01cef..18cd25e489b8 100644
--- a/kernel/printk/printk_ringbuffer.h
+++ b/kernel/printk/printk_ringbuffer.h
@@ -75,6 +75,7 @@ struct prb_desc_ring {
 	struct printk_info	*infos;
 	atomic_long_t		head_id;
 	atomic_long_t		tail_id;
+	atomic_long_t		last_finalized_id;
 };
 
 /*
@@ -258,6 +259,7 @@ static struct printk_ringbuffer name = {							\
 		.infos		= &_##name##_infos[0],						\
 		.head_id	= ATOMIC_INIT(DESC0_ID(descbits)),				\
 		.tail_id	= ATOMIC_INIT(DESC0_ID(descbits)),				\
+		.last_finalized_id = ATOMIC_INIT(DESC0_ID(descbits)),				\
 	},											\
 	.text_data_ring = {									\
 		.size_bits	= (avgtextbits) + (descbits),					\
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
