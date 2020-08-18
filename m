Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665DFC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 02:02:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2013B2076D
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 02:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lvyxATFp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qaYTkohX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2013B2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cxq/mzjMCQsSsVXgC4+DUDMAmgXDfWA7QiBuQze1964=; b=lvyxATFprF3Iwtx99hYO0CPAS
	p3Uw9y/4VKstRyR8xFa5/UznjIH1QhkXpUe0ERirOO9WmxYo04qvdMfeyrZIKyN/gNYgEdGVtXv2p
	vXihcYkb3Gy8K/NmzhQ54vLsuZvAX+pda8VifXJO6QKJXdxO4lPCXIXP8KM/e4SAlOHL6LZD+MZUX
	hAXBYasqLH+7wYsILX9qFfOfna4gnDOwRO5jHhmi/YRymnA9P0s8BgznQNA1da5GcXN6w9urQovdG
	4oCif0sBCz4/YP/db6LXIS7LSyg5OsJ93TMVphm8CMj9jNQbCI+nbxA8EkCiUvq5GN7xA71K9oMMC
	b2JPW/4XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7qx7-0000Wb-Dr; Tue, 18 Aug 2020 02:02:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7qwu-0000RU-0h; Tue, 18 Aug 2020 02:02:05 +0000
X-UUID: a1f474355c784cb88d5778106bac4352-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ujc7Lbua+IslYXDihEh6fsVR2uDX9I8FrwlUNgCM1+Y=; 
 b=qaYTkohXWBe5fogc1mbxyHoxwHUH3PqNJpI2qWN+TdNPi8XeAU9KTL+5a8FuQ+5ro1iX8/vV3IDgE9AcaHa3ckL0gFjLSCTzJL3FP/e5mJYqA7Xz9fqyiGkdZXnbl/M3BZn0XBqVnj+ltLjl5pnaC+Qtk45V8LT8/xK1GhzKarA=;
X-UUID: a1f474355c784cb88d5778106bac4352-20200817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 876161776; Mon, 17 Aug 2020 17:58:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 18:58:47 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 09:58:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Aug 2020 09:58:44 +0800
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
Subject: [PATCH v4 2/3] mm: smaps*: extend smap_gather_stats to support
 specified beginning
Date: Tue, 18 Aug 2020 09:58:17 +0800
Message-ID: <1597715898-3854-3-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1597715898-3854-1-git-send-email-chinwen.chang@mediatek.com>
References: <1597715898-3854-1-git-send-email-chinwen.chang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9DCA33C3D616333C44B385622478D55A61FB68BA92421FE14445A37B4A995B9C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_220204_240444_5B460F77 
X-CRM114-Status: GOOD (  18.64  )
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
Reviewed-by: Steven Price <steven.price@arm.com>
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
