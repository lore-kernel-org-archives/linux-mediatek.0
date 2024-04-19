Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175C5C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XRyf6fGWHw8D4kdmPwDpJvOOOJXdbXKfYmpkFqH+HqI=; b=fuFTS2hwA9n27XorLM6eT7TiFf
	aUooZyIekGeUK0oxS1nYujTWTkt4+PNc44I1Jjzonz1b6IHqtTDmyHGBV2DX+QNdov8fDyFK+AUiS
	HObejWaxtFz0pfTwr7rOBRH/irC7jnWjc0VaeBV2I60IauxSzCBkvoxXNqUgx1rCJ00TL4BPpVi5X
	Z8gaFTcNUFYWaXlK2HTWWVis/Hr6rdbUR/za1qgHbdH4q8or+hIyeA0vkEmUd4kGiVwLjdWYCokcC
	vCLfzsr9zuISXNtsvgeZekYPiNbgO15PBit2J7U8kv5PTeOugnA5ax4oJd4cU9IN326ABrstQW7Kb
	N2c56Nww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxltn-00000005Mvj-0WB5;
	Fri, 19 Apr 2024 10:55:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxltj-00000005Mu1-2ZMq;
	Fri, 19 Apr 2024 10:55:17 +0000
X-UUID: 4a2a3de2fe3b11eeac1957ae9f99f617-20240419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XRyf6fGWHw8D4kdmPwDpJvOOOJXdbXKfYmpkFqH+HqI=;
	b=QCHgXGgV1RZzgkfVNI2C9ztyBD2RBiNYGtlYkE45aixZiX0V2ztqPcq2k6quYcz2lDr99ohTAaoTQymMfOU/oG0xw3glb5JXaTy97aZgtmnmA1DpqwplVWsWhipYnUjzUIcBZTuMV+0pl6dnKIEEuKeW2Lsekw2hzUGGemyHWVA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:11453c3d-b1f5-4384-811e-798038a7b9e8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:344e1dfb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4a2a3de2fe3b11eeac1957ae9f99f617-20240419
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <guoyong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1435693060; Fri, 19 Apr 2024 03:55:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Apr 2024 18:54:34 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Apr 2024 18:54:33 +0800
From: Guoyong Wang <guoyong.wang@mediatek.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, "Guoyong
 Wang" <guoyong.wang@mediatek.com>
Subject: [PATCH v2] random: Fix the issue of '_might_sleep' function running in an atomic contex
Date: Fri, 19 Apr 2024 18:54:53 +0800
Message-ID: <20240419105453.5440-1-guoyong.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.105700-8.000000
X-TMASE-MatchedRID: 5tAkVIfDYR7hfwdYxI1fuvv+//lqU1h6+Vb3woyMZbtUjspoiX02F8UW
	gOgXO5aL0s1bBGkyThx77384BTKUTx9J5bZqJbIJpFf2dGv7wxuy4iyjvVWToiz+5QCTrE/s+Vi
	hXqn9xLE8VyRVdn8owK4t1/E9bzKRkg6GA5mI8yy4jAucHcCqnTGZtPrBBPZrTUobVis5Bb/Qar
	bX+8U9GfblVnO7NB2+bkJkSezgGPCCBuHvFSrMorrbxxduc6FPNpy6NoTePCGna2UlAbZeZ8bbZ
	brNnnQMrXd9MpcOet6voC/yQrpICgQmkMsZWj5Btw+xHnsmQjOQoBr+SFneJAZbeEWcL03Vr+Zq
	965VgDSg0lULc/18FGjcG6LiTVmSkfRhdidsajMURSScn+QSXt0H8LFZNFG7hqz53n/yPnr6LJn
	pB+yIaoXaBRcWuzFn9Es4it2/Eho23AywId+lCLoOfFLgUu3n
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.105700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B0059B6C039B233AA2AFDC5A0CD747C778BD8E9B9A46D7F9C68BD0AAB961230F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_035515_673587_14F70A57 
X-CRM114-Status: GOOD (  16.66  )
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

In the case that a delay is acceptable for 'crng_set_ready', it can be
deferred to a workqueue in order to accommodate different contexts.

Signed-off-by: Guoyong Wang <guoyong.wang@mediatek.com>
---
v2: Compared to version 1, version 2 has removed the definition of
'execute_in_non_atomic_context' and always uses a workqueue to execute 
'crng_set_ready'.

  Send out the patch again for further discussion.

[1]: https://patchwork.kernel.org/patch/13595066

---
 drivers/char/random.c     | 10 +++++-----
 include/linux/workqueue.h |  1 -
 kernel/workqueue.c        | 26 --------------------------
 3 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 00be9426a6fc..2597cb43f438 100644
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
-			execute_in_non_atomic_context(crng_set_ready, &set_ready);
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
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index eb17c62d23aa..158784dd189a 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -550,7 +550,6 @@ extern void drain_workqueue(struct workqueue_struct *wq);
 extern int schedule_on_each_cpu(work_func_t func);
 
 int execute_in_process_context(work_func_t fn, struct execute_work *);
-int execute_in_non_atomic_context(work_func_t fn, struct execute_work *ew);
 
 extern bool flush_work(struct work_struct *work);
 extern bool cancel_work(struct work_struct *work);
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 8f212346da7a..bf2bdac46843 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4449,32 +4449,6 @@ int execute_in_process_context(work_func_t fn, struct execute_work *ew)
 }
 EXPORT_SYMBOL_GPL(execute_in_process_context);
 
-/**
- * execute_in_non_atomic_context - reliably execute the routine with user context
- * @fn:		the function to execute
- * @ew:		guaranteed storage for the execute work structure (must
- *		be available when the work executes)
- *
- * Schedules the function for delayed execution if atomic context is available,
- * otherwise executes the function immediately .
- *
- * Return:	0 - function was executed
- *		1 - function was scheduled for execution
- */
-int execute_in_non_atomic_context(work_func_t fn, struct execute_work *ew)
-{
-	if (!in_atomic()) {
-		fn(&ew->work);
-		return 0;
-	}
-
-	INIT_WORK(&ew->work, fn);
-	schedule_work(&ew->work);
-
-	return 1;
-}
-EXPORT_SYMBOL_GPL(execute_in_non_atomic_context);
-
 /**
  * free_workqueue_attrs - free a workqueue_attrs
  * @attrs: workqueue_attrs to free
-- 
2.18.0


