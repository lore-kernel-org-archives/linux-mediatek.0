Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15304C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KyohXZ8ljUyt8/Z31TAd35lQorK+NyLlcSiynv+o4vk=; b=kfscATmPKxcLbF
	fmtWCeZQxtc+45KH6lP6v967LlMvTDjNk0o4PeCIGzknLKBvLeqaDzXDGYf1RAzCYRbrXBVpSd1in
	jxFZmgDSEebgZDFa6phWyl86NabDrVH3MU4GP5rbuPoOu+XX6srnlpQ9riKLOtA7nu9xN1gyhZg8c
	l2dqj1kblAe9CTPwT91wLPpRjUOBp7O4o/bwgHsrQWzHLBnlJARTswpYxEP15+FD9CPL7TwGvHYTD
	HypcFqj0e8NIwevO4vs6Zf2KzZcRRoHg7t0RHacNi24tx+fu0muaSKnELa9uW3tZTNP64lmHpi9vy
	rMbKvQMO9VpavUSlahnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI72M-003VOf-5O; Thu, 10 Feb 2022 10:50:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI729-003VMA-KA; Thu, 10 Feb 2022 10:50:44 +0000
X-UUID: e0ffb0d18b654331b4c4adb86ac46708-20220210
X-UUID: e0ffb0d18b654331b4c4adb86ac46708-20220210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <cheng-jui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 157158252; Thu, 10 Feb 2022 03:50:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 02:50:35 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 10 Feb 2022 18:50:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Feb 2022 18:50:33 +0800
From: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
CC: Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <stable@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, Eason-YH Lin <eason-yh.lin@mediatek.com>,
 Kobe-CP Wu <kobe-cp.wu@mediatek.com>, Jeff-CC Hsu <jeff-cc.hsu@mediatek.com>, 
 Cheng Jui Wang <cheng-jui.wang@mediatek.com>
Subject: [PATCH] lockdep: Correct lock_classes index mapping
Date: Thu, 10 Feb 2022 18:50:11 +0800
Message-ID: <20220210105011.21712-1-cheng-jui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_025041_686502_634F3F20 
X-CRM114-Status: GOOD (  14.46  )
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

A kernel exception was hit when trying to dump /proc/lockdep_chains after
lockdep report "BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!":

Unable to handle kernel paging request at virtual address 00054005450e05c3
...
00054005450e05c3] address between user and kernel address ranges
...
pc : [0xffffffece769b3a8] string+0x50/0x10c
lr : [0xffffffece769ac88] vsnprintf+0x468/0x69c
...
 Call trace:
  string+0x50/0x10c
  vsnprintf+0x468/0x69c
  seq_printf+0x8c/0xd8
  print_name+0x64/0xf4
  lc_show+0xb8/0x128
  seq_read_iter+0x3cc/0x5fc
  proc_reg_read_iter+0xdc/0x1d4

The cause of the problem is the function lock_chain_get_class() will
shift lock_classes index by 1, but the index don't need to be shifted
anymore since commit 01bb6f0af992 ("locking/lockdep: Change the range of
class_idx in held_lock struct") already change the index to start from
0.

The lock_classes[-1] located at chain_hlocks array. When printing
lock_classes[-1] after the chain_hlocks entries are modified, the
exception happened.

The output of lockdep_chains are incorrect due to this problem too.

Fixes: f611e8cf98ec ("lockdep: Take read/write status in consideration when generate chainkey")

Signed-off-by: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
---
 kernel/locking/lockdep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 4a882f83aeb9..f8a0212189ca 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3462,7 +3462,7 @@ struct lock_class *lock_chain_get_class(struct lock_chain *chain, int i)
 	u16 chain_hlock = chain_hlocks[chain->base + i];
 	unsigned int class_idx = chain_hlock_class_idx(chain_hlock);
 
-	return lock_classes + class_idx - 1;
+	return lock_classes + class_idx;
 }
 
 /*
@@ -3530,7 +3530,7 @@ static void print_chain_keys_chain(struct lock_chain *chain)
 		hlock_id = chain_hlocks[chain->base + i];
 		chain_key = print_chain_key_iteration(hlock_id, chain_key);
 
-		print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id) - 1);
+		print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id));
 		printk("\n");
 	}
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
