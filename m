Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E45FC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:08:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02B052063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bymftP0d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02B052063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2I3GEEQRiP7R7yHN6TutNWNGTZjIVxcOmgJoyDoVBMs=; b=bymftP0dau3+yVHpmrlibArOY
	+gNA9bB8bp7r4NNximdvEcjqUP2+9Ae/jLQp9uIsn7puWR09DBdYREnfSBoFjZGUmWSRuGGmf9+tf
	h+6m95VjdVYO8PNcSwrtS9Ybtg6nKvkHbJSs2Wu547SLZoWMx0QfYeRm69OyVdcanxln8uc5+yQYr
	Cj2i7H4/chdUD2lPgvZrphHAGWkYroJCux+XOOeC6Cu7wlvjQDC7jybkeNAkZvHxADK4VJeejzQsX
	nt+1IODDmk6uKZpvtV9kl6GxM7k7mZ/+B+Gq9CKlkwi2JAT2jv/dgI2/TaMDrpxkbEtlEQcpgvIYU
	ig1LAsL7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7b7Z-0007hR-JL; Mon, 17 Aug 2020 09:08:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7afI-0000uT-SY; Mon, 17 Aug 2020 08:38:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94C251045;
 Mon, 17 Aug 2020 01:38:47 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03EEC3F6CF;
 Mon, 17 Aug 2020 01:38:44 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] mm: proc: smaps_rollup: do not stall write
 attempts on mmap_lock
To: Chinwen Chang <chinwen.chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Davidlohr Bueso
 <dbueso@suse.de>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Song Liu <songliubraving@fb.com>,
 Jimmy Assarsson <jimmyassarsson@gmail.com>, Huang Ying
 <ying.huang@intel.com>, Daniel Kiss <daniel.kiss@arm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>
References: <1597472419-32314-1-git-send-email-chinwen.chang@mediatek.com>
 <1597472419-32314-4-git-send-email-chinwen.chang@mediatek.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <db0d40e2-72f3-09d5-c162-9c49218f128f@arm.com>
Date: Mon, 17 Aug 2020 09:38:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597472419-32314-4-git-send-email-chinwen.chang@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_043849_635756_E96F430F 
X-CRM114-Status: GOOD (  33.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15/08/2020 07:20, Chinwen Chang wrote:
> smaps_rollup will try to grab mmap_lock and go through the whole vma
> list until it finishes the iterating. When encountering large processes,
> the mmap_lock will be held for a longer time, which may block other
> write requests like mmap and munmap from progressing smoothly.
> 
> There are upcoming mmap_lock optimizations like range-based locks, but
> the lock applied to smaps_rollup would be the coarse type, which doesn't
> avoid the occurrence of unpleasant contention.
> 
> To solve aforementioned issue, we add a check which detects whether
> anyone wants to grab mmap_lock for write attempts.
> 
> Change since v1:
> - If current VMA is freed after dropping the lock, it will return
> - incomplete result. To fix this issue, refine the code flow as
> - suggested by Steve. [1]
> 
> Change since v2:
> - When getting back the mmap lock, the address where you stopped last
> - time could now be in the middle of a vma. Add one more check to handle
> - this case as suggested by Michel. [2]
> 
> [1] https://lore.kernel.org/lkml/bf40676e-b14b-44cd-75ce-419c70194783@arm.com/
> [2] https://lore.kernel.org/lkml/CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com/
> 
> Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
> CC: Steven Price <steven.price@arm.com>
> CC: Michel Lespinasse <walken@google.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   fs/proc/task_mmu.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 76e623a..945904e 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -846,7 +846,7 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
>   	struct mem_size_stats mss;
>   	struct mm_struct *mm;
>   	struct vm_area_struct *vma;
> -	unsigned long last_vma_end = 0;
> +	unsigned long last_vma_end = 0, last_stopped = 0;
>   	int ret = 0;
>   
>   	priv->task = get_proc_task(priv->inode);
> @@ -867,9 +867,76 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
>   
>   	hold_task_mempolicy(priv);
>   
> -	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
> -		smap_gather_stats(vma, &mss, 0);
> +	for (vma = priv->mm->mmap; vma;) {
> +		smap_gather_stats(vma, &mss, last_stopped);
> +		last_stopped = 0;
>   		last_vma_end = vma->vm_end;
> +
> +		/*
> +		 * Release mmap_lock temporarily if someone wants to
> +		 * access it for write request.
> +		 */
> +		if (mmap_lock_is_contended(mm)) {
> +			mmap_read_unlock(mm);
> +			ret = mmap_read_lock_killable(mm);
> +			if (ret) {
> +				release_task_mempolicy(priv);
> +				goto out_put_mm;
> +			}
> +
> +			/*
> +			 * After dropping the lock, there are four cases to
> +			 * consider. See the following example for explanation.
> +			 *
> +			 *   +------+------+-----------+
> +			 *   | VMA1 | VMA2 | VMA3      |
> +			 *   +------+------+-----------+
> +			 *   |      |      |           |
> +			 *  4k     8k     16k         400k
> +			 *
> +			 * Suppose we drop the lock after reading VMA2 due to
> +			 * contention, then we get:
> +			 *
> +			 *	last_vma_end = 16k
> +			 *
> +			 * 1) VMA2 is freed, but VMA3 exists:
> +			 *
> +			 *    find_vma(mm, 16k - 1) will return VMA3.
> +			 *    In this case, just continue from VMA3.
> +			 *
> +			 * 2) VMA2 still exists:
> +			 *
> +			 *    find_vma(mm, 16k - 1) will return VMA2.
> +			 *    Iterate the loop like the original one.
> +			 *
> +			 * 3) No more VMAs can be found:
> +			 *
> +			 *    find_vma(mm, 16k - 1) will return NULL.
> +			 *    No more things to do, just break.
> +			 *
> +			 * 4) (last_vma_end - 1) is the middle of a vma (VMA'):
> +			 *
> +			 *    find_vma(mm, 16k - 1) will return VMA' whose range
> +			 *    contains last_vma_end.
> +			 *    Iterate VMA' from last_vma_end.
> +			 */
> +			vma = find_vma(mm, last_vma_end - 1);
> +			/* Case 3 above */
> +			if (!vma)
> +				break;
> +
> +			/* Case 1 above */
> +			if (vma->vm_start >= last_vma_end)
> +				continue;
> +
> +			/* Case 4 above */
> +			if (vma->vm_end > last_vma_end) {
> +				last_stopped = last_vma_end;
> +				continue;

Note that instead of having last_stopped, you could replace the above 
with a direct call:

   smap_gather_stats(vma, &mss, last_vma_end);

I'm not sure which is cleaner though. last_stopped is a bit messy (it's 
easily confused with last_vma_end), but having just the one call site 
for smap_gather_stats() is nice too.

Steve

> +			}
> +		}
> +		/* Case 2 above */
> +		vma = vma->vm_next;
>   	}
>   
>   	show_vma_header_prefix(m, priv->mm->mmap->vm_start,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
