Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F0EC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 06:21:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AD322DCC
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 06:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c53z3sGf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BZNOv1HI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37AD322DCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rn07HRFvM29rQzqBfhQ89Fk/usQJcJB658lTqvlCXGo=; b=c53z3sGfGGtUs8E8xUWoLhCpC
	Xd0Th4OX8BJaOteWbQBYvRIZg/lgFPZt1zAQOiq5OlkbsNqmrFWs8QjFdKF3Yv99R+NOeoWu363+i
	tRYmRT4qZAK5VOH6Mmd1u/DD/+EEN/7NKppLItyuus5JrT/F/a/0zSUylbrCYl9QY8uhRVzVl5tff
	GY3ilJDFYX5HJdnpUUdTgy98pCDY95pqdSG71uY66k0wRnqBn4gz2ZWdFp0GRCXn1cIDbcGh/Cv2m
	JX3irXABgH6BypAiUcNTc0xrViYWRPnqodQLaUTPMIAfIPwT2YziLk7ris7+nIduGIhPUW/wH+FE+
	XxOx2J36w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6pZI-0002LP-J3; Sat, 15 Aug 2020 06:21:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6pZ8-0002JG-03; Sat, 15 Aug 2020 06:21:21 +0000
X-UUID: 6d6f27d5964f4a2288d5694aded2c77c-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nO/7d3LEyww/DsobxJb7EoQeEP0stM9QgmRFbsqBnvA=; 
 b=BZNOv1HI0yeXjrpNrg7r6TQe9gZp6wA/E4muyxAOlKyisGzjruMNmd97+k8jsE8sVP1WaSBEQLA/lLLcK7qJRIMlsUjUbzfx4cC9CfFTJohZff8qFda2F/eGiwLuNaUltgxQPZmJ+WBlnSUq9xF6EF83G8WUHsUI6MAfBa9YuDY=;
X-UUID: 6d6f27d5964f4a2288d5694aded2c77c-20200814
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 81566228; Fri, 14 Aug 2020 22:21:06 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 23:21:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 15 Aug 2020 14:20:52 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 15 Aug 2020 14:20:54 +0800
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Michel Lespinasse
 <walken@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Vlastimil
 Babka" <vbabka@suse.cz>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 "Davidlohr Bueso" <dbueso@suse.de>, Chinwen Chang
 <chinwen.chang@mediatek.com>, "Alexey Dobriyan" <adobriyan@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Steven Price <steven.price@arm.com>, Song Liu
 <songliubraving@fb.com>, Jimmy Assarsson <jimmyassarsson@gmail.com>, Huang
 Ying <ying.huang@intel.com>, Daniel Kiss <daniel.kiss@arm.com>, Laurent
 Dufour <ldufour@linux.ibm.com>
Subject: [PATCH v3 2/3] mm: smaps*: extend smap_gather_stats to support
 specified beginning
Date: Sat, 15 Aug 2020 14:20:18 +0800
Message-ID: <1597472419-32314-3-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1597472419-32314-1-git-send-email-chinwen.chang@mediatek.com>
References: <1597472419-32314-1-git-send-email-chinwen.chang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0920E33D6D0ECC02A6813D53E444A733A6F2A6B877A2FAD56C7ECAA86B5046E62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_022118_250189_3993DDA9 
X-CRM114-Status: GOOD (  18.28  )
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

Extend smap_gather_stats to support indicated beginning address at
which it should start gathering. To achieve the goal, we add a new
parameter @start assigned by the caller and try to refactor it for
simplicity.

If @start is 0, it will use the range of @vma for gathering.

Change since v2:
- This is a new change to make the retry behavior of smaps_rollup
- more complete as suggested by Michel [1]

[1] https://lore.kernel.org/lkml/CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com/

Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
CC: Michel Lespinasse <walken@google.com>
CC: Steven Price <steven.price@arm.com>
---
 fs/proc/task_mmu.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index dbda449..76e623a 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -723,9 +723,21 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
 	.pte_hole		= smaps_pte_hole,
 };
 
+/*
+ * Gather mem stats from @vma with the indicated beginning
+ * address @start, and keep them in @mss.
+ *
+ * Use vm_start of @vma as the beginning address if @start is 0.
+ */
 static void smap_gather_stats(struct vm_area_struct *vma,
-			     struct mem_size_stats *mss)
+		struct mem_size_stats *mss, unsigned long start)
 {
+	const struct mm_walk_ops *ops = &smaps_walk_ops;
+
+	/* Invalid start */
+	if (start >= vma->vm_end)
+		return;
+
 #ifdef CONFIG_SHMEM
 	/* In case of smaps_rollup, reset the value from previous vma */
 	mss->check_shmem_swap = false;
@@ -742,18 +754,20 @@ static void smap_gather_stats(struct vm_area_struct *vma,
 		 */
 		unsigned long shmem_swapped = shmem_swap_usage(vma);
 
-		if (!shmem_swapped || (vma->vm_flags & VM_SHARED) ||
-					!(vma->vm_flags & VM_WRITE)) {
+		if (!start && (!shmem_swapped || (vma->vm_flags & VM_SHARED) ||
+					!(vma->vm_flags & VM_WRITE))) {
 			mss->swap += shmem_swapped;
 		} else {
 			mss->check_shmem_swap = true;
-			walk_page_vma(vma, &smaps_shmem_walk_ops, mss);
-			return;
+			ops = &smaps_shmem_walk_ops;
 		}
 	}
 #endif
 	/* mmap_lock is held in m_start */
-	walk_page_vma(vma, &smaps_walk_ops, mss);
+	if (!start)
+		walk_page_vma(vma, ops, mss);
+	else
+		walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss);
 }
 
 #define SEQ_PUT_DEC(str, val) \
@@ -805,7 +819,7 @@ static int show_smap(struct seq_file *m, void *v)
 
 	memset(&mss, 0, sizeof(mss));
 
-	smap_gather_stats(vma, &mss);
+	smap_gather_stats(vma, &mss, 0);
 
 	show_map_vma(m, vma);
 
@@ -854,7 +868,7 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 	hold_task_mempolicy(priv);
 
 	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
-		smap_gather_stats(vma, &mss);
+		smap_gather_stats(vma, &mss, 0);
 		last_vma_end = vma->vm_end;
 	}
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
