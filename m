Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C812C433E3
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 06:31:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D298422DD3
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 06:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="17KZpZ7m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HbC9t6u6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D298422DD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GUXaEGyKNbvx2Nexz3AA0lZo4DteZhX4sLf7gJmu0lQ=; b=17KZpZ7mkSXo58PK097AG0+6h
	ChxEP1htnkLYF61PNlkiRGjDYrjAiARQbRt3E3HpjMT5KJ4qD8nWBy8CJqZZ7rO5Dehi02FHdxxyJ
	Y/R8pOtzPwr4k06B5aLCs4QCADb7tMy6sN7CRiaSG19HIpibT7bsSbpr5h3dT8vy/Jx1ADCxHwAaH
	PnLfx8HIzO5MwJ5UU1NWlc06STbLly6dX/XPwqNWm6BIgpU/qb98p4H1wPrXykOxDB1EXFYIp7G82
	WdGWYYn7OF32o/42yUciZgbX58/9JsYYXiYFMi3Ta1h1Ug1NkEc0wXgB15wtdo6hPakeb6Xan9wfA
	8YFwUoaIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6pin-0002zI-4P; Sat, 15 Aug 2020 06:31:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6pif-0002wR-V1; Sat, 15 Aug 2020 06:31:11 +0000
X-UUID: 32a23ffd1d6d41f99f759f7dfda6e6ce-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+xqa9UEJkEmmE6uCB5h1bOQifNwquSyXPo3G3a6IEMs=; 
 b=HbC9t6u6ePlGy1Xl7JOLyFx5PUoziU1ilMgOC7fFM5iCjkOrtSAjFfpNJPuq2DNJKfleBaT4fMUyk9sj/SQoJqHwkKRi3J19j2RSnGrFM8tWH+lOF97SKefG/YhylrC9fUaSeTUYFI/HeM827seLFDcIuFGoMzchBVQK545Iiwg=;
X-UUID: 32a23ffd1d6d41f99f759f7dfda6e6ce-20200814
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1153257306; Fri, 14 Aug 2020 22:31:06 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 23:21:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v3 3/3] mm: proc: smaps_rollup: do not stall write attempts on
 mmap_lock
Date: Sat, 15 Aug 2020 14:20:19 +0800
Message-ID: <1597472419-32314-4-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1597472419-32314-1-git-send-email-chinwen.chang@mediatek.com>
References: <1597472419-32314-1-git-send-email-chinwen.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_023110_162803_865272DE 
X-CRM114-Status: GOOD (  21.13  )
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

Change since v2:
- When getting back the mmap lock, the address where you stopped last
- time could now be in the middle of a vma. Add one more check to handle
- this case as suggested by Michel. [2]

[1] https://lore.kernel.org/lkml/bf40676e-b14b-44cd-75ce-419c70194783@arm.com/
[2] https://lore.kernel.org/lkml/CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com/

Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
CC: Steven Price <steven.price@arm.com>
CC: Michel Lespinasse <walken@google.com>
---
 fs/proc/task_mmu.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 76e623a..945904e 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -846,7 +846,7 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 	struct mem_size_stats mss;
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
-	unsigned long last_vma_end = 0;
+	unsigned long last_vma_end = 0, last_stopped = 0;
 	int ret = 0;
 
 	priv->task = get_proc_task(priv->inode);
@@ -867,9 +867,76 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 
 	hold_task_mempolicy(priv);
 
-	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
-		smap_gather_stats(vma, &mss, 0);
+	for (vma = priv->mm->mmap; vma;) {
+		smap_gather_stats(vma, &mss, last_stopped);
+		last_stopped = 0;
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
+			 * After dropping the lock, there are four cases to
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
+			 *
+			 * 4) (last_vma_end - 1) is the middle of a vma (VMA'):
+			 *
+			 *    find_vma(mm, 16k - 1) will return VMA' whose range
+			 *    contains last_vma_end.
+			 *    Iterate VMA' from last_vma_end.
+			 */
+			vma = find_vma(mm, last_vma_end - 1);
+			/* Case 3 above */
+			if (!vma)
+				break;
+
+			/* Case 1 above */
+			if (vma->vm_start >= last_vma_end)
+				continue;
+
+			/* Case 4 above */
+			if (vma->vm_end > last_vma_end) {
+				last_stopped = last_vma_end;
+				continue;
+			}
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
