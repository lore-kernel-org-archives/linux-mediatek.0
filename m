Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46A9C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 04:45:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B1DA20678
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 04:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+waXGiO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="prGa8TaD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B1DA20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u8oyS2ZadeJAfwJKpe2lilaSflouf1QMporqUn66kOs=; b=T+waXGiOf5jDT4DWWxjZsMBOI
	+7uGhY9I+wzr0cUzjc3jxrb3FXKGHTDZNs+yS9o8y1oVhaKlOpaNyLVvMuN9DKtELtXR67JxON6J8
	5CMtwC+tK/xu9aMrxzgwUnM1akvUEFjgrNEOUublhkgNr0/2nNnfqYReyhWz4ILRyafniHOH3Twmo
	Tsg5dw3JCVQWAjdhj6TZSxXJzvyiN8xCrwMw9iR3C8h5M9pyPlA1za847UEtlviS/WyVn+m6N9F6w
	Jhy3PJ7DV48KWtO7aRi/Ksile5TtyVhygdwVuLhjjuQfcqUsMdkig/aeJY6R+mdyN8O3NRAC0R+lt
	zUgwm9Jug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5M9s-0004RH-4Y; Tue, 11 Aug 2020 04:45:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5M9m-0004On-5I; Tue, 11 Aug 2020 04:45:04 +0000
X-UUID: f6b51a725e9845ab962a56b4e223e427-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=34A2MTCnp24qFDlzu8bAX0BRNrZ0NdDDcDstxdaMF/0=; 
 b=prGa8TaDSMK7Uk6ygfqZ32qMG/fNrZnLkpZSolQoawCS9L3puOkkZSRExlDQ2FtDCu6ZJHeG+mO+5nwb3ADOz0czJBJsHNeGLlGXiY5qa0DRWBtEwWwtwaOPKrEdYVvU6AwKbFQGEs2Dq127FKz5WP04vzFlPSpOH2F3UpSQ5e4=;
X-UUID: f6b51a725e9845ab962a56b4e223e427-20200810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 754720708; Mon, 10 Aug 2020 20:44:56 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 21:44:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 12:44:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 11 Aug 2020 12:44:46 +0800
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
Subject: [PATCH 2/2] mm: proc: smaps_rollup: do not stall write attempts on
 mmap_lock
Date: Tue, 11 Aug 2020 12:42:35 +0800
Message-ID: <1597120955-16495-3-git-send-email-chinwen.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1597120955-16495-1-git-send-email-chinwen.chang@mediatek.com>
References: <1597120955-16495-1-git-send-email-chinwen.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_004502_408238_11D1D95B 
X-CRM114-Status: GOOD (  16.79  )
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

Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
---
 fs/proc/task_mmu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index dbda449..4b51f25 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -856,6 +856,27 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
 	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
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
+			/* Check whether current vma is available */
+			vma = find_vma(mm, last_vma_end - 1);
+			if (vma && vma->vm_start < last_vma_end)
+				continue;
+
+			/* Current vma is not available, just break */
+			break;
+		}
 	}
 
 	show_vma_header_prefix(m, priv->mm->mmap->vm_start,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
