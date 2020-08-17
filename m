Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B06AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:38:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B80C207DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xrWQQXXg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aKjw4hec";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E4V2pVkz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B80C207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1zM8UqkUyMZf+QCJbQVfUbssJEWxTjQAsZYg2UX0TsE=; b=xrWQQXXgYmaKdbqRJqiCi7UHL
	HtkTDF5TfbS3cDo3RvQRSvFUTMVMvTAkrwjOAh3WTh4LKP1MdiayhAt0t6Sp6sZHA4bNX2DGrNevg
	PF+bo1EogQ9dkNwh544PAzd/6g6JlyNOgReM+DvPpGsCdmsv2QOUxNqjYfmlUsJ/BH4g+nFpsXyj/
	MD9Qv0tlqIRkpAI8gDMeMt2GHT2IyzX7/AthKYQI7MRuhzuBBKd1S95bOVsu9KcXQCCgxNVtvrUYJ
	mvUZCNGwba6xZ3NCyV+edrXoK9KChZwfohWWc/dJbN6pozIY/hhlbrFo2rLaqjHwfCxHQ/FumDuan
	XWOoPlrZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7bau-0005xy-GM; Mon, 17 Aug 2020 09:38:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7bae-0005r1-QY; Mon, 17 Aug 2020 09:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=8fSjUccvg56HN6Kcthxgsp48fEjfxGm/EiyJrkfm+Pg=; b=aKjw4heci7Li6PbGkfjGSjmta5
 3TtKnqsyLSCd/oizRT4wJmj2IqyYYHi3iDH9jWfXmBcV27L8aL8vzsvBKsVM642QiFYb9XBnGBhPt
 t3n6VMpls72gTbXyr5SznNr1FgIwjkHLLo6QbzAwu0uD15gBiiYZV2UgA5rioXrHi752sGhhZFkRL
 yytb9rONxhza3jrKPdAK7+R9wJlrSwh3hplyzgTWMh0/spzkO8yRaCEnD122dilxXGc3y80L/gJcj
 csf4bh+BNkY6Gwc0LAyZM9qvq3mcmYsuKrjYO/SUgk6jEXIiKLeafx435enYhp0uMkZepfV9VjQsF
 0ufK65Ig==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7bM7-0002Qq-2Q; Mon, 17 Aug 2020 09:23:25 +0000
X-UUID: c4ce68b5b1f2484ca132952f7431c5c8-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8fSjUccvg56HN6Kcthxgsp48fEjfxGm/EiyJrkfm+Pg=; 
 b=E4V2pVkzekPzhZNAAGJlq7nn1mdmFuhTYv/UmQazAdpkFvgCgDG4QUPqtQy0PCrPVDx8Ji1lZPmqM+J2OqkLMSMn49vlCIQ6gmNAkvya+cZAw4D735cBl3eCvGrhk2ZCtTc+fPHo/+cpw15CbSLKBsrqWDqx/yoZGQRvMjw2qes=;
X-UUID: c4ce68b5b1f2484ca132952f7431c5c8-20200817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2047376652; Mon, 17 Aug 2020 01:15:18 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 02:15:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 17:15:06 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 17:15:06 +0800
Message-ID: <1597655708.32469.62.camel@mtkswgap22>
Subject: Re: [PATCH v3 3/3] mm: proc: smaps_rollup: do not stall write
 attempts on mmap_lock
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Steven Price <steven.price@arm.com>
Date: Mon, 17 Aug 2020 17:15:08 +0800
In-Reply-To: <db0d40e2-72f3-09d5-c162-9c49218f128f@arm.com>
References: <1597472419-32314-1-git-send-email-chinwen.chang@mediatek.com>
 <1597472419-32314-4-git-send-email-chinwen.chang@mediatek.com>
 <db0d40e2-72f3-09d5-c162-9c49218f128f@arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_102312_714536_F870F8C4 
X-CRM114-Status: GOOD (  41.57  )
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
Cc: linux-arm-kernel@lists.infradead.org, Song Liu <songliubraving@fb.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, wsd_upstream@mediatek.com,
 Davidlohr Bueso <dbueso@suse.de>, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-mediatek@lists.infradead.org, Jimmy Assarsson <jimmyassarsson@gmail.com>,
 Huang Ying <ying.huang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Daniel Kiss <daniel.kiss@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-17 at 09:38 +0100, Steven Price wrote:
> On 15/08/2020 07:20, Chinwen Chang wrote:
> > smaps_rollup will try to grab mmap_lock and go through the whole vma
> > list until it finishes the iterating. When encountering large processes,
> > the mmap_lock will be held for a longer time, which may block other
> > write requests like mmap and munmap from progressing smoothly.
> > 
> > There are upcoming mmap_lock optimizations like range-based locks, but
> > the lock applied to smaps_rollup would be the coarse type, which doesn't
> > avoid the occurrence of unpleasant contention.
> > 
> > To solve aforementioned issue, we add a check which detects whether
> > anyone wants to grab mmap_lock for write attempts.
> > 
> > Change since v1:
> > - If current VMA is freed after dropping the lock, it will return
> > - incomplete result. To fix this issue, refine the code flow as
> > - suggested by Steve. [1]
> > 
> > Change since v2:
> > - When getting back the mmap lock, the address where you stopped last
> > - time could now be in the middle of a vma. Add one more check to handle
> > - this case as suggested by Michel. [2]
> > 
> > [1] https://lore.kernel.org/lkml/bf40676e-b14b-44cd-75ce-419c70194783@arm.com/
> > [2] https://lore.kernel.org/lkml/CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com/
> > 
> > Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
> > CC: Steven Price <steven.price@arm.com>
> > CC: Michel Lespinasse <walken@google.com>
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> > ---
> >   fs/proc/task_mmu.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++---
> >   1 file changed, 70 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 76e623a..945904e 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -846,7 +846,7 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
> >   	struct mem_size_stats mss;
> >   	struct mm_struct *mm;
> >   	struct vm_area_struct *vma;
> > -	unsigned long last_vma_end = 0;
> > +	unsigned long last_vma_end = 0, last_stopped = 0;
> >   	int ret = 0;
> >   
> >   	priv->task = get_proc_task(priv->inode);
> > @@ -867,9 +867,76 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
> >   
> >   	hold_task_mempolicy(priv);
> >   
> > -	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
> > -		smap_gather_stats(vma, &mss, 0);
> > +	for (vma = priv->mm->mmap; vma;) {
> > +		smap_gather_stats(vma, &mss, last_stopped);
> > +		last_stopped = 0;
> >   		last_vma_end = vma->vm_end;
> > +
> > +		/*
> > +		 * Release mmap_lock temporarily if someone wants to
> > +		 * access it for write request.
> > +		 */
> > +		if (mmap_lock_is_contended(mm)) {
> > +			mmap_read_unlock(mm);
> > +			ret = mmap_read_lock_killable(mm);
> > +			if (ret) {
> > +				release_task_mempolicy(priv);
> > +				goto out_put_mm;
> > +			}
> > +
> > +			/*
> > +			 * After dropping the lock, there are four cases to
> > +			 * consider. See the following example for explanation.
> > +			 *
> > +			 *   +------+------+-----------+
> > +			 *   | VMA1 | VMA2 | VMA3      |
> > +			 *   +------+------+-----------+
> > +			 *   |      |      |           |
> > +			 *  4k     8k     16k         400k
> > +			 *
> > +			 * Suppose we drop the lock after reading VMA2 due to
> > +			 * contention, then we get:
> > +			 *
> > +			 *	last_vma_end = 16k
> > +			 *
> > +			 * 1) VMA2 is freed, but VMA3 exists:
> > +			 *
> > +			 *    find_vma(mm, 16k - 1) will return VMA3.
> > +			 *    In this case, just continue from VMA3.
> > +			 *
> > +			 * 2) VMA2 still exists:
> > +			 *
> > +			 *    find_vma(mm, 16k - 1) will return VMA2.
> > +			 *    Iterate the loop like the original one.
> > +			 *
> > +			 * 3) No more VMAs can be found:
> > +			 *
> > +			 *    find_vma(mm, 16k - 1) will return NULL.
> > +			 *    No more things to do, just break.
> > +			 *
> > +			 * 4) (last_vma_end - 1) is the middle of a vma (VMA'):
> > +			 *
> > +			 *    find_vma(mm, 16k - 1) will return VMA' whose range
> > +			 *    contains last_vma_end.
> > +			 *    Iterate VMA' from last_vma_end.
> > +			 */
> > +			vma = find_vma(mm, last_vma_end - 1);
> > +			/* Case 3 above */
> > +			if (!vma)
> > +				break;
> > +
> > +			/* Case 1 above */
> > +			if (vma->vm_start >= last_vma_end)
> > +				continue;
> > +
> > +			/* Case 4 above */
> > +			if (vma->vm_end > last_vma_end) {
> > +				last_stopped = last_vma_end;
> > +				continue;
> 
> Note that instead of having last_stopped, you could replace the above 
> with a direct call:
> 
>    smap_gather_stats(vma, &mss, last_vma_end);
> 
> I'm not sure which is cleaner though. last_stopped is a bit messy (it's 
> easily confused with last_vma_end), but having just the one call site 
> for smap_gather_stats() is nice too.
> 
> Steve
> 

Hi Steve,

I think your idea is better. Let me try refactoring for further reviews.
Thanks for your kind suggestion:)

Chinwen
> > +			}
> > +		}
> > +		/* Case 2 above */
> > +		vma = vma->vm_next;
> >   	}
> >   
> >   	show_vma_header_prefix(m, priv->mm->mmap->vm_start,
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
