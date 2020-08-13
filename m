Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4852DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 02:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 146C420771
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 02:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="utPgW/u+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NAMziqHh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 146C420771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MfV6cY8wfkdSvKGkUvnIld6bbv5ufQ6s+/su0KaQ52Y=; b=utPgW/u+VzbTv1wA1whCWEunX
	YEdyGZN26dd9GrcLSmb9APSXYZhr9LnzijJcyqF7/MqdRcn2SA5hR6utdRyNNvsYtNQBvqRzVPu0G
	ViOyzD1K+bDdZAvJ5tEn6ze+f/WqY0I8DrJ0pB3BWs+ZmVdboA/cW/EgivR+irYClNySKHy9Sr0IZ
	xFeL/XzUSCtPpeSar+yqQt95kh0huZ0tYtO4GrLje+ZjBU3cjhemzjqyUC/Du5lTqJ6ok/Rv2HLiL
	zqRs7W+TE2aT0f9m8Iqp8XvukH9cEZIPEQ0CZzXMOBWgQuNOX52k0h+IKtWmoFuuzJ6PQ5BENphBa
	R9XiW9KXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k62kh-0003Rv-4i; Thu, 13 Aug 2020 02:13:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k62kb-0003Pp-69; Thu, 13 Aug 2020 02:13:55 +0000
X-UUID: 276e901c86f141b88a0ecbfd488ec3cc-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jA4iiVfkVcOmS+pCKVmT4iYfEjD2gJ9VLToSMN7vEIU=; 
 b=NAMziqHhb3oh7SfN1/YOElZGa1vCHvMlDe2JfhBX6nqyoytY9A7MIYHsdFMltpwtgfZlzPGmeuh2dcsErxUibCjX0iaZnjxi4y4C3vG+a2Cntx4cOwYlKUarDROrnKTQXdZgee6QCYwXzTj4K2hmBv0mn2WXhBM3zIWXAnJ+nfg=;
X-UUID: 276e901c86f141b88a0ecbfd488ec3cc-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 873377506; Wed, 12 Aug 2020 18:13:47 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 19:13:44 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 10:13:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Aug 2020 10:13:45 +0800
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Michel Lespinasse
 <walken@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Vlastimil
 Babka" <vbabka@suse.cz>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 "Davidlohr Bueso" <dbueso@suse.de>, Chinwen Chang
 <chinwen.chang@mediatek.com>, "Alexey Dobriyan" <adobriyan@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Steven Price <steven.price@arm.com>, Song Liu
 <songliubraving@fb.com>, Jimmy Assarsson <jimmyassarsson@gmail.com>, Huang
 Ying <ying.huang@intel.com>
Subject: [PATCH v2 2/2] mm: proc: smaps_rollup: do not stall write attempts on
 mmap_lock
Date: Thu, 13 Aug 2020 10:13:30 +0800
Message-ID: <1597284810-17454-3-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
References: <1597284810-17454-1-git-send-email-chinwen.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_221353_428160_CDA1ACC4 
X-CRM114-Status: GOOD (  20.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

smaps_rollup will try to grab mmap_lock and go through the whole vma
list until it finishes the iterating. When encountering large processes,
the mmap_lock will be held for a longer time, which may block other
write requests like mmap and munmap from progressing smoothly.

There are upcoming mmap_lock optimizations like range-based locks, but
the lock applied to smaps_rollup would be the coarse type, which doesn't
avoid the occurrence of unpleasant contention.

To solve aforementioned issue, we add a check which detects whether
anyone wants to grab mmap_lock for write attempts.

Change since v1:
- If current VMA is freed after dropping the lock, it will return
- incomplete result. To fix this issue, refine the code flow as
- suggested by Steve. [1]

[1] https://lore.kernel.org/lkml/bf40676e-b14b-44cd-75ce-419c70194783@arm.com/

Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
---
 fs/proc/task_mmu.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index dbda449..23b3a447 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -853,9 +853,63 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 
 	hold_task_mempolicy(priv);
 
-	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
+	for (vma = priv->mm->mmap; vma;) {
 		smap_gather_stats(vma, &mss);
 		last_vma_end = vma->vm_end;
+
+		/*
+		 * Release mmap_lock temporarily if someone wants to
+		 * access it for write request.
+		 */
+		if (mmap_lock_is_contended(mm)) {
+			mmap_read_unlock(mm);
+			ret = mmap_read_lock_killable(mm);
+			if (ret) {
+				release_task_mempolicy(priv);
+				goto out_put_mm;
+			}
+
+			/*
+			 * After dropping the lock, there are three cases to
+			 * consider. See the following example for explanation.
+			 *
+			 *   +------+------+-----------+
+			 *   | VMA1 | VMA2 | VMA3      |
+			 *   +------+------+-----------+
+			 *   |      |      |           |
+			 *  4k     8k     16k         400k
+			 *
+			 * Suppose we drop the lock after reading VMA2 due to
+			 * contention, then we get:
+			 *
+			 *	last_vma_end = 16k
+			 *
+			 * 1) VMA2 is freed, but VMA3 exists:
+			 *
+			 *    find_vma(mm, 16k - 1) will return VMA3.
+			 *    In this case, just continue from VMA3.
+			 *
+			 * 2) VMA2 still exists:
+			 *
+			 *    find_vma(mm, 16k - 1) will return VMA2.
+			 *    Iterate the loop like the original one.
+			 *
+			 * 3) No more VMAs can be found:
+			 *
+			 *    find_vma(mm, 16k - 1) will return NULL.
+			 *    No more things to do, just break.
+			 */
+			vma = find_vma(mm, last_vma_end - 1);
+			/* Case 3 above */
+			if (!vma)
+				break;
+
+			/* Case 1 above */
+			if (vma->vm_start >= last_vma_end)
+				continue;
+		}
+		/* Case 2 above */
+		vma = vma->vm_next;
 	}
 
 	show_vma_header_prefix(m, priv->mm->mmap->vm_start,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
