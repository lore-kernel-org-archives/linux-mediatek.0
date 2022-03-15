Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5B6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 11:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=53OTATw0ZOycwhGCBvM9iZ9/zZVA9bmXp1R21JvDFpw=; b=aYed2a3ENQYguK
	qLdrrh3c0BNKwf3X9OA5yxh2g8RxLyO5DeF1uvuz2Zea3HAlznKwZYnck+UwkL3xEZf3URhbMeGZB
	tSYqOhWo0PUvYMh8AWkEMKgdAbptnIefGFd1Qs97B1p3nLROCvwqOGKEYOJ2XUH9MsGGq6NkrgRkH
	nbpF9T78/JIzGtr36xZN9LqkvGn04JUo3TSMEylomoe40rXyQ1EPuCpbUzwmpzfppKL1gD92V7MDL
	S0Y8aBR4fvDvNptVZsdoZVMjR/tyvBLS7dpoyhrFDU55/w5eUH7E89WU8WtWJYnoX7fH94nBSfDgB
	wKErV6AdiTnDFayaDSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU5Jg-008sk1-B1; Tue, 15 Mar 2022 11:26:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU5JR-008shC-Ta; Tue, 15 Mar 2022 11:26:04 +0000
X-UUID: cfac055d88f7426b9e63838ca5b9286a-20220315
X-UUID: cfac055d88f7426b9e63838ca5b9286a-20220315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <cheng-jui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 915327182; Tue, 15 Mar 2022 04:25:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 04:25:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Mar 2022 19:25:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Mar 2022 19:25:52 +0800
From: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Bart Van
 Assche" <bvanassche@acm.org>, <wsd_upstream@mediatek.com>, Eason-YH Lin
 <eason-yh.lin@mediatek.com>, Kobe-CP Wu <kobe-cp.wu@mediatek.com>, "Jeff-cc
 Hsu" <jeff-cc.hsu@mediatek.com>, Cheng Jui Wang <cheng-jui.wang@mediatek.com>
Subject: [PATCH] lockdep: Zap lock classes with debug_locks == false again
Date: Tue, 15 Mar 2022 19:25:21 +0800
Message-ID: <20220315112521.29093-1-cheng-jui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_042601_989008_026172F4 
X-CRM114-Status: GOOD (  12.13  )
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

If a lock_class_key has been registered but lockdep_unregister_key() is
called with debug_locks == false. The lockdep_unregister_key() will not
unregister the key and just return without error.
Users may assume lockdep_unregister_key() always succeed and free the
lock_class_key even if it is still remained in lockdep structures.

Which lead to following crash when 'cat /proc/lockdep' after
debug_locks == false:

==================================================================
BUG: KASAN: invalid-access in string+0x50/0x10c
Read at addr f2ffff81ac61c880 by ...
Pointer tag: [f2], memory tag: [fb]
...
Call trace:
 dump_backtrace.cfi_jt+0x0/0x8
 show_stack+0x1c/0x2c
 dump_stack_lvl+0xd8/0x16c
 print_address_description+0x90/0x2e8
 __kasan_report+0x144/0x224
 kasan_report+0x50/0xa0
 __do_kernel_fault+0xf4/0x2a8
 do_bad_area+0x34/0xf8
 do_tag_check_fault+0x24/0x38
 do_mem_abort+0x68/0x168
 el1_abort+0x4c/0x74
 el1_sync_handler+0x4c/0x8c
 el1_sync+0x8c/0x140
 string+0x50/0x10c
 vsnprintf+0x468/0x69c
 seq_printf+0x8c/0xd8
 print_name+0x64/0xf4
 l_show+0x1a8/0x278
 seq_read_iter+0x3cc/0x5fc
 proc_reg_read_iter+0xdc/0x1d4
 vfs_read+0x2e0/0x354
 ksys_read+0x7c/0xec
 __arm64_sys_read+0x20/0x30
 el0_svc_common.llvm.8008154191216078041+0xd8/0x20c
 do_el0_svc+0x28/0xa0
 el0_svc+0x24/0x38
 el0_sync_handler+0x88/0xec
 el0_sync+0x1b4/0x1c0

...
==================================================================

Allow lockdep_unregister_key to zap lock classes with
debug_locks == false again.
Remove the WARN_ON_ONCE(!found) and only zap lock classes when the key
can be found.

Fixes: 8b39adbee805 ("locking/lockdep: Make lockdep_unregister_key() honor 'debug_locks' again")
Signed-off-by: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
---
 kernel/locking/lockdep.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index f8a0212189ca..90dadecb2577 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6305,8 +6305,7 @@ void lockdep_unregister_key(struct lock_class_key *key)
 		return;
 
 	raw_local_irq_save(flags);
-	if (!graph_lock())
-		goto out_irq;
+	lockdep_lock();
 
 	pf = get_pending_free();
 	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
@@ -6316,11 +6315,11 @@ void lockdep_unregister_key(struct lock_class_key *key)
 			break;
 		}
 	}
-	WARN_ON_ONCE(!found);
-	__lockdep_free_key_range(pf, key, 1);
-	call_rcu_zapped(pf);
-	graph_unlock();
-out_irq:
+	if (found) {
+		__lockdep_free_key_range(pf, key, 1);
+		call_rcu_zapped(pf);
+	}
+	lockdep_unlock();
 	raw_local_irq_restore(flags);
 
 	/* Wait until is_dynamic_key() has finished accessing k->hash_entry. */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
