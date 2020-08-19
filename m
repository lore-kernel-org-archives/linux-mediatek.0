Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF17C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 07:37:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F2D8206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 07:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bW9StDOW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F2D8206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FyYs5jqa58DkONJauAPvOBdDtJ4FEGqG5TOtV0gxZAg=; b=bW9StDOWOYoBfuOHcTwsG7ciy
	sDaUvmwevlWORyUoL9cEKswvcxkz9JorBT5sXN4A+p50AVkyFwPfOHVj67qm1jHdw/ZXhaCVsOYxA
	bo7cX0dDiaQFm11atF4XNucOBmb9eErXnMuPR2epnRUjWoJZVY18FhI2SWNGrS9LTFdtRM5VC/1Yg
	QTv+AbfCBlJ/jFADc5dIm/5kpqxXN+lLvT6e2OrqEz9G1gENMgepo6YK0PvWWPsn0Nn2/i2GMIZDt
	O14t4j85irvJ/lQBqto3pBUzGBDHr+pPcgwi1ARJ7QJ18sKb9Vx3+UeJFyTcaW6lkj3lxpkzF3fph
	pdVhIoDvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8IfI-0002pY-K7; Wed, 19 Aug 2020 07:37:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8IfE-0002nf-LV; Wed, 19 Aug 2020 07:37:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E98591FB;
 Wed, 19 Aug 2020 00:37:35 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 676763F6CF;
 Wed, 19 Aug 2020 00:37:33 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] mm: proc: smaps_rollup: do not stall write
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
References: <1597715898-3854-1-git-send-email-chinwen.chang@mediatek.com>
 <1597715898-3854-4-git-send-email-chinwen.chang@mediatek.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <66d5de29-933d-347b-8922-3238b62bc7f5@arm.com>
Date: Wed, 19 Aug 2020 08:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597715898-3854-4-git-send-email-chinwen.chang@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_033740_877799_643C14C4 
X-CRM114-Status: GOOD (  31.56  )
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

On 18/08/2020 02:58, Chinwen Chang wrote:
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
> Change since v3:
> - last_stopped is easily confused with last_vma_end. Replace it with
> - a direct call to smap_gather_stats(vma, &mss, last_vma_end) as
> - suggested by Steve. [3]
> 
> [1] https://lore.kernel.org/lkml/bf40676e-b14b-44cd-75ce-419c70194783@arm.com/
> [2] https://lore.kernel.org/lkml/CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/db0d40e2-72f3-09d5-c162-9c49218f128f@arm.com/
> 
> Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
> CC: Steven Price <steven.price@arm.com>
> CC: Michel Lespinasse <walken@google.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   fs/proc/task_mmu.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 76e623a..1a80624 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -867,9 +867,73 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
>   
>   	hold_task_mempolicy(priv);
>   
> -	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
> +	for (vma = priv->mm->mmap; vma;) {
>   		smap_gather_stats(vma, &mss, 0);
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
> +			if (vma->vm_end > last_vma_end)
> +				smap_gather_stats(vma, &mss, last_vma_end);
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
