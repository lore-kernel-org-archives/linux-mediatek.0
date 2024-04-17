Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C633AC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqUxpmUqpZwb93aWIdk8nK8jsHAciW5UzOnZrGBCZHY=; b=IBY3zhAZHogiWEE8B6X9d9DX0s
	krDyGU2LfMTgItAYewhBouw1SnmWOb8NIFAicDYKBdB6jp7nbHyfF81At/32Li9tzvW2MCB+2yBQO
	KtwF1EwWmLR15U4Axp9O5wJQUPfsnm8hM6/ZJIJxzykbHRh79VGm7+G1+LrZyh8mFQViezRjqAJU7
	o0eOEwDFHaERReDzEk8gT4GJ5NCw5Ws2K6V+sHBAlYhnSIlXy04h4Ouf/D9ivyAkav20l/VGYAYel
	VbpIBtAUbP+kwDLA2aspwfK1si0Swgu0svbuhpsL4TTEdO8oJUxsla7lhfaiTPgYPOCiGNFy5V/7r
	vH2JrUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx40i-0000000Frzz-1U1u;
	Wed, 17 Apr 2024 12:03:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx40a-0000000Frxt-2DLz;
	Wed, 17 Apr 2024 12:03:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D457614B8;
	Wed, 17 Apr 2024 12:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E73C072AA;
	Wed, 17 Apr 2024 12:03:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OHlXNPsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1713355399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JqUxpmUqpZwb93aWIdk8nK8jsHAciW5UzOnZrGBCZHY=;
	b=OHlXNPsxgNeFaA7jrH1Br0FTvd5MlBsolxUqxkTmXnoRRp4LoCKRSh9Wpaa1uSsBNth0bj
	NruZAmbZY/cwQCmnCYruRcp03ibKhQDImJPVkfT8APA8oexA++D+sa6nAU9aQHKv1vzp5C
	7tlfLqobpdk11Z41U8yny4pUzFmyWTg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c1243d44 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 17 Apr 2024 12:03:17 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: guoyong.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wsd_upstream@mediatek.com,
	Theodore Ts'o <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	stable@vger.kernel.org
Subject: [PATCH] random: handle creditable entropy from atomic process context
Date: Wed, 17 Apr 2024 14:01:11 +0200
Message-ID: <20240417120217.3814215-2-Jason@zx2c4.com>
In-Reply-To: <20240402081214.2723-1-guoyong.wang@mediatek.com>
References: <20240402081214.2723-1-guoyong.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_050324_781980_BD6C738F 
X-CRM114-Status: GOOD (  22.06  )
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

The entropy accounting changes a static key when the RNG has
initialized, since it only ever initializes once. Static key changes,
however, cannot be made from atomic context, so depending on where the
last creditable entropy comes from, the static key change might need to
be deferred to a worker.

Previously the code used the execute_in_process_context() helper
function, which accounts for whether or not the caller is
in_interrupt(). However, that doesn't account for the case where the
caller is actually in process context but is holding a spinlock.

This turned out to be the case with input_handle_event() in
drivers/input/input.c contributing entropy:

  [<ffffffd613025ba0>] die+0xa8/0x2fc
  [<ffffffd613027428>] bug_handler+0x44/0xec
  [<ffffffd613016964>] brk_handler+0x90/0x144
  [<ffffffd613041e58>] do_debug_exception+0xa0/0x148
  [<ffffffd61400c208>] el1_dbg+0x60/0x7c
  [<ffffffd61400c000>] el1h_64_sync_handler+0x38/0x90
  [<ffffffd613011294>] el1h_64_sync+0x64/0x6c
  [<ffffffd613102d88>] __might_resched+0x1fc/0x2e8
  [<ffffffd613102b54>] __might_sleep+0x44/0x7c
  [<ffffffd6130b6eac>] cpus_read_lock+0x1c/0xec
  [<ffffffd6132c2820>] static_key_enable+0x14/0x38
  [<ffffffd61400ac08>] crng_set_ready+0x14/0x28
  [<ffffffd6130df4dc>] execute_in_process_context+0xb8/0xf8
  [<ffffffd61400ab30>] _credit_init_bits+0x118/0x1dc
  [<ffffffd6138580c8>] add_timer_randomness+0x264/0x270
  [<ffffffd613857e54>] add_input_randomness+0x38/0x48
  [<ffffffd613a80f94>] input_handle_event+0x2b8/0x490
  [<ffffffd613a81310>] input_event+0x6c/0x98

According to Guoyong, it's not really possible to refactor the various
drivers to never hold a spinlock there. And in_atomic() isn't reliable.

So, rather than trying to be too fancy, just punt the change in the
static key to a workqueue always. There's basically no drawback of doing
this, as the code already needed to account for the static key not
changing immediately, and given that it's just an optimization, there's
not exactly a hurry to change the static key right away, so deferal is
fine.

Reported-by: Guoyong Wang <guoyong.wang@mediatek.com>
Cc: stable@vger.kernel.org
Fixes: f5bda35fba61 ("random: use static branch for crng_ready()")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Guoyong- can you test this and tell me whether it fixes the problem you
were seeing? If so, I'll try to get this sent up for 6.9. -Jason

 drivers/char/random.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 456be28ba67c..2597cb43f438 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -702,7 +702,7 @@ static void extract_entropy(void *buf, size_t len)
 
 static void __cold _credit_init_bits(size_t bits)
 {
-	static struct execute_work set_ready;
+	static DECLARE_WORK(set_ready, crng_set_ready);
 	unsigned int new, orig, add;
 	unsigned long flags;
 
@@ -718,8 +718,8 @@ static void __cold _credit_init_bits(size_t bits)
 
 	if (orig < POOL_READY_BITS && new >= POOL_READY_BITS) {
 		crng_reseed(NULL); /* Sets crng_init to CRNG_READY under base_crng.lock. */
-		if (static_key_initialized)
-			execute_in_process_context(crng_set_ready, &set_ready);
+		if (static_key_initialized && system_unbound_wq)
+			queue_work(system_unbound_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
@@ -890,8 +890,8 @@ void __init random_init(void)
 
 	/*
 	 * If we were initialized by the cpu or bootloader before jump labels
-	 * are initialized, then we should enable the static branch here, where
-	 * it's guaranteed that jump labels have been initialized.
+	 * or workqueues are initialized, then we should enable the static
+	 * branch here, where it's guaranteed that these have been initialized.
 	 */
 	if (!static_branch_likely(&crng_is_ready) && crng_init >= CRNG_READY)
 		crng_set_ready(NULL);
-- 
2.44.0


