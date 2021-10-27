Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 14:09:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 439A560EFE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 14:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 439A560EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=82Stfn2ubC4aZ1+EfyqOm3T5+9+SNvrNSx6YtfgQYAI=; b=KPcPQOqtJxwHDM
	01pPyD57uGUGu1XCgkEsR05Fu0pvDt1TH5y8xhC/iH6JGznOoPiVrUMdGpFTUMAqtgGBQNPsonLFB
	o9HP4wUFOdBSLK6zQT3jc31wR4M3U4Jc0idPrbXoK7tfxt7rpi3m8nLtSMW3Z/7RjnJ/pped4mfKG
	9HDwKOab9BP6eHZ5CeMmq0w4jRd0CCbkbsHZ2y4Fss0iyEuligdwmn3XaJKkvQ4gfBdo2ywo80zTZ
	ygs6oYuHo3rrZSCo5mKQtjC3aIfnafwUvoq0fLFWA9W3S5nD7dZI4WCQWA8jRqpDVhy61XI+vY6OC
	eHF/FPgMUPKdMDKEpDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfjc4-00548c-FY; Wed, 27 Oct 2021 14:09:08 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfjbr-00546m-TR; Wed, 27 Oct 2021 14:08:57 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 90D1C212C3;
 Wed, 27 Oct 2021 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1635343732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=vTEZK4Z28044YwpJME/9KvLWOyf6J+iw93DBKB2ic7M=;
 b=pB7PpGxy3Rc2ONHyE2vZPLcGexhgvL5KrSKMha1io13/p9FUfXJrrIHMF4YEY4euHAZ6KG
 yyiH0SrEQsWjy+V0KvJE958Z0kS/rpra4DEK8szQwS6tLvJQGRA7HwbK5Rs5pa3udFUrln
 FnO2X2GK9PHxpRqF6wSX2O05+/KytfM=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4A68CA3B88;
 Wed, 27 Oct 2021 14:08:52 +0000 (UTC)
Date: Wed, 27 Oct 2021 16:08:52 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: "chunlei.wang" <Chunlei.wang@mediatek.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] printk: ringbuffer: Improve prb_next_seq() performance
Message-ID: <YXlddJxLh77DKfIO@alley>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_070856_142856_EE1BD78D 
X-CRM114-Status: GOOD (  24.83  )
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
Changes against v1:

  + Read @seq by the last finalized @id directly in prb_next_seq() (John)

 kernel/printk/printk_ringbuffer.c | 49 ++++++++++++++++++++++++++++---
 kernel/printk/printk_ringbuffer.h |  2 ++
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 8a7b7362c0dd..24f47fbefbb5 100644
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
@@ -2005,9 +2015,39 @@ u64 prb_first_valid_seq(struct printk_ringbuffer *rb)
  */
 u64 prb_next_seq(struct printk_ringbuffer *rb)
 {
-	u64 seq = 0;
+	struct prb_desc_ring *desc_ring = &rb->desc_ring;
+	enum desc_state d_state;
+	unsigned long id;
+	u64 seq;
+
+	/* Check if the cached @id still points to a valid @seq. */
+	id = atomic_long_read(&desc_ring->last_finalized_id);
+	d_state = desc_read(desc_ring, id, NULL, &seq, NULL);
 
-	/* Search forward from the oldest descriptor. */
+	if (d_state == desc_finalized || d_state == desc_reusable) {
+		/*
+		 * Begin searching after the last finalized record.
+		 *
+		 * On 0, the search must begin at 0 because of hack#2
+		 * of the bootstrapping phase it is not known if a
+		 * record at index 0 exists.
+		 */
+		if (seq != 0)
+			seq++;
+	} else {
+		/*
+		 * The information about the last finalized sequence number
+		 * has gone. It should happen only when there is a flood of
+		 * new messages and the ringbuffer is rapidly recycled.
+		 * Give up and start from the beginning.
+		 */
+		seq = 0;
+	}
+
+	/*
+	 * The information about the last finalized @seq might be inaccurate.
+	 * Search forward to find the current one.
+	 */
 	while (_prb_read_valid(rb, &seq, NULL, NULL))
 		seq++;
 
@@ -2044,6 +2084,7 @@ void prb_init(struct printk_ringbuffer *rb,
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
