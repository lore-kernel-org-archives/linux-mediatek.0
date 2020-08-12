Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0FDC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 08:39:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F6920781
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 08:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Exhh746i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6F6920781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0PnWhYf3sSv4jB2S8YVTv173JzFA7ZFOzN52UDusz2w=; b=Exhh746i5WHPzdHr7g/Ws+ns1
	E/zJsuBeQ0DGTmAhkIDgMEtFFb2aVFooZqicnfQr9pKZuaqC4jlfVU2FBWgcepXTuAEsuLc5tMPP6
	hvERSiqskmACUXmTKD/k6HWyejL5hUtF/DQQdj6eFBk+zEoYyfutt3C5jvujIpm87Dd4S9ELYLK/j
	J03EjfnorB7XoJAVWBLNQWcu5gTPBbvFDvxtYUhjkzUr9KunriuIkPuUepqKgGlBpjDSZfPmAYj6A
	JQOA+1oCGkn+wjRyVdy6G8mQBEdK6MZxnWIQbLagCYjCRpjUlVuIGAe8JotAmwFzr/ME5GKR45xbR
	qXhd2iP5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5mI3-0005NU-Uk; Wed, 12 Aug 2020 08:39:19 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5mHz-0005LR-6L; Wed, 12 Aug 2020 08:39:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AACB4D6E;
 Wed, 12 Aug 2020 01:39:12 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6792E3F22E;
 Wed, 12 Aug 2020 01:39:10 -0700 (PDT)
Subject: Re: [PATCH 2/2] mm: proc: smaps_rollup: do not stall write attempts
 on mmap_lock
To: Chinwen Chang <chinwen.chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Davidlohr Bueso
 <dbueso@suse.de>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Song Liu <songliubraving@fb.com>,
 Jimmy Assarsson <jimmyassarsson@gmail.com>, Huang Ying <ying.huang@intel.com>
References: <1597120955-16495-1-git-send-email-chinwen.chang@mediatek.com>
 <1597120955-16495-3-git-send-email-chinwen.chang@mediatek.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <bf40676e-b14b-44cd-75ce-419c70194783@arm.com>
Date: Wed, 12 Aug 2020 09:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597120955-16495-3-git-send-email-chinwen.chang@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_043915_343037_B0FFC928 
X-CRM114-Status: GOOD (  26.98  )
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

On 11/08/2020 05:42, Chinwen Chang wrote:
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
> Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
> ---
>   fs/proc/task_mmu.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index dbda449..4b51f25 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -856,6 +856,27 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
>   	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
>   		smap_gather_stats(vma, &mss);
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
> +			/* Check whether current vma is available */
> +			vma = find_vma(mm, last_vma_end - 1);
> +			if (vma && vma->vm_start < last_vma_end)

I may be wrong, but this looks like it could return incorrect results. 
For example if we start reading with the following VMAs:

  +------+------+-----------+
  | VMA1 | VMA2 | VMA3      |
  +------+------+-----------+
  |      |      |           |
4k     8k     16k         400k

Then after reading VMA2 we drop the lock due to contention. So:

   last_vma_end = 16k

Then if VMA2 is freed while the lock is dropped, so we have:

  +------+      +-----------+
  | VMA1 |      | VMA3      |
  +------+      +-----------+
  |      |      |           |
4k     8k     16k         400k

find_vma(mm, 16k-1) will then return VMA3 and the condition vm_start < 
last_vma_end will be false.

> +				continue;
> +
> +			/* Current vma is not available, just break */
> +			break;

Which means we break out here and report an incomplete output (the 
numbers will be much smaller than reality).

Would it be better to have a loop like:

	for (vma = priv->mm->mmap; vma;) {
		smap_gather_stats(vma, &mss);
		last_vma_end = vma->vm_end;

		if (contended) {
			/* drop/acquire lock */

			vma = find_vma(mm, last_vma_end - 1);
			if (!vma)
				break;
			if (vma->vm_start >= last_vma_end)
				continue;
		}
		vma = vma->vm_next;
	}

that way if the VMA is removed while the lock is dropped the loop can 
just continue from the next VMA.

Or perhaps I missed something obvious? I haven't actually tested 
anything above.

Steve

> +		}
>   	}
>   
>   	show_vma_header_prefix(m, priv->mm->mmap->vm_start,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
