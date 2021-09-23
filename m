Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DFFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 09:54:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D764C61268
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 09:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D764C61268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qy8xSPAEVbYTxS6MObFBuo6eqKICc8yYq3CJ4yPSOAI=; b=1jKY+HQnlsUVXc
	QPi4StVUBSPCTt4ZnfyutI5ahgZ90aY8rGN4YgY/GSmBOub8VqQrN+sKAopj9y9LRXmoOAtNW2dDP
	poUYeBAQPZkyBJpIUKhB5w4VkdE+ZbwFSWdxaPzLZSSn+8VryJguVXYRmHLDJDg+TaqboVhU7UTv5
	OITaV4KUqBVPyGmg9cRGFThkkFjI7vT/z2DH5vJD7g9tAiPix73vkpv4Wl4H0wDFt61yeu0CHcQ8w
	9MshhWYmQK99NHAGE08pzYCsaQHN8VrkqNLqTXxVJy5MAEhYJNSapsrOeSYQMgMSoj3XvkZDv+1p7
	uUMLqW3lavhBEkUR2m9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTLQj-00Aqgz-Tn; Thu, 23 Sep 2021 09:54:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTLQV-00AqfW-PK; Thu, 23 Sep 2021 09:54:02 +0000
X-UUID: aff8d886b3b5498890154487b89e1c1b-20210923
X-UUID: aff8d886b3b5498890154487b89e1c1b-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 978753050; Thu, 23 Sep 2021 02:53:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 02:53:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 23 Sep 2021 17:53:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Sep 2021 17:53:52 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, "Sami
 Tolvanen" <samitolvanen@google.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH] scs: Release kasan vmalloc poison in scs_free process
Date: Thu, 23 Sep 2021 17:53:12 +0800
Message-ID: <20210923095316.13867-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_025359_871957_5AC43C71 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

From: Yee Lee <yee.lee@mediatek.com>

Since scs allocation has been moved to vmalloc region, the
shadow stack is protected by kasan_posion_vmalloc.
However, the vfree_atomic operation needs to access
its context for scs_free process and causes kasan error
as the dump info below.

This patch Adds kasan_unpoison_vmalloc() before vfree_atomic,
which aligns to the prior flow as using kmem_cache.
The vmalloc region will go back posioned in the following
vumap() operations.

 ==================================================================
 BUG: KASAN: vmalloc-out-of-bounds in llist_add_batch+0x60/0xd4
 Write of size 8 at addr ffff8000100b9000 by task kthreadd/2

 CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.15.0-rc2-11681-(skip)
 Hardware name: linux,dummy-virt (DT)
 Call trace:
  dump_backtrace+0x0/0x43c
  show_stack+0x1c/0x2c
  dump_stack_lvl+0x68/0x84
  print_address_description+0x80/0x394
  kasan_report+0x180/0x1dc
  __asan_report_store8_noabort+0x48/0x58
  llist_add_batch+0x60/0xd4
  vfree_atomic+0x60/0xe0
  scs_free+0x1dc/0x1fc
  scs_release+0xa4/0xd4
  free_task+0x30/0xe4
  __put_task_struct+0x1ec/0x2e0
  delayed_put_task_struct+0x5c/0xa0
  rcu_do_batch+0x62c/0x8a0
  rcu_core+0x60c/0xc14
  rcu_core_si+0x14/0x24
  __do_softirq+0x19c/0x68c
  irq_exit+0x118/0x2dc
  handle_domain_irq+0xcc/0x134
  gic_handle_irq+0x7c/0x1bc
  call_on_irq_stack+0x40/0x70
  do_interrupt_handler+0x78/0x9c
  el1_interrupt+0x34/0x60
  el1h_64_irq_handler+0x1c/0x2c
  el1h_64_irq+0x78/0x7c
  _raw_spin_unlock_irqrestore+0x40/0xcc
  sched_fork+0x4f0/0xb00
  copy_process+0xacc/0x3648
  kernel_clone+0x168/0x534
  kernel_thread+0x13c/0x1b0
  kthreadd+0x2bc/0x400
  ret_from_fork+0x10/0x20

 Memory state around the buggy address:
  ffff8000100b8f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
  ffff8000100b8f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 >ffff8000100b9000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                    ^
  ffff8000100b9080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
  ffff8000100b9100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ==================================================================

CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Will Deacon <will@kernel.org>
CC: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 kernel/scs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/scs.c b/kernel/scs.c
index e2a71fc82fa0..25c0d8e416e6 100644
--- a/kernel/scs.c
+++ b/kernel/scs.c
@@ -68,6 +68,7 @@ void scs_free(void *s)
 
 	__scs_account(s, -1);
 
+	kasan_unpoison_vmalloc(s, SCS_SIZE);
 	/*
 	 * We cannot sleep as this can be called in interrupt context,
 	 * so use this_cpu_cmpxchg to update the cache, and vfree_atomic
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
