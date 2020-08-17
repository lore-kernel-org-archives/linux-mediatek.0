Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA2AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:08:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A6D22063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MouQC4cj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A6D22063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nzaxOZonD6dJaqlfzQ2Bo+BBajlk86Ak+L7z/sOa43w=; b=MouQC4cj7wDU/3vZ4wlDyppY1
	JSCw1IqA9KWrUPnfURqLNgaaBh7694Q9E3MxZPT8wi4KucDmBKbJftSpuO/KYQmNctu8fNiA/nAQ9
	mVjfTiWed6tjhwjpCIolg6Co21G/BkMeDZra7u4eEss2LRG+NozhI5TTFtW/x3KexJ6mrszaw0PKB
	qx6aTMAyMK0M449LI8lkVULY0ogiXb54bgK7wisEn+bYQzaN5n/gqmp89yhar3MXyQhh2PMhnA3/4
	p8fn9SsEKEmqtNo5uIyEeSEgHyO/Wd34nzl3SKjGUBQRTaurnTzMhPwjY9K1ImHR/Z8u73PeNTBbX
	yr3hvXAow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7b7Q-0007bN-QJ; Mon, 17 Aug 2020 09:07:52 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7afF-0000r2-2v; Mon, 17 Aug 2020 08:38:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4B730E;
 Mon, 17 Aug 2020 01:38:41 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8539A3F6CF;
 Mon, 17 Aug 2020 01:38:38 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] mm: smaps*: extend smap_gather_stats to support
 specified beginning
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
 <1597472419-32314-3-git-send-email-chinwen.chang@mediatek.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5f4eb892-4980-8245-b93d-5358ffa01abe@arm.com>
Date: Mon, 17 Aug 2020 09:38:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597472419-32314-3-git-send-email-chinwen.chang@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_043845_357197_9AF4C0D5 
X-CRM114-Status: GOOD (  27.98  )
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
> Extend smap_gather_stats to support indicated beginning address at
> which it should start gathering. To achieve the goal, we add a new
> parameter @start assigned by the caller and try to refactor it for
> simplicity.
> 
> If @start is 0, it will use the range of @vma for gathering.
> 
> Change since v2:
> - This is a new change to make the retry behavior of smaps_rollup
> - more complete as suggested by Michel [1]
> 
> [1] https://lore.kernel.org/lkml/CANN689FtCsC71cjAjs0GPspOhgo_HRj+diWsoU1wr98YPktgWg@mail.gmail.com/
> 
> Signed-off-by: Chinwen Chang <chinwen.chang@mediatek.com>
> CC: Michel Lespinasse <walken@google.com>
> CC: Steven Price <steven.price@arm.com>

LGTM

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

> ---
>   fs/proc/task_mmu.c | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index dbda449..76e623a 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -723,9 +723,21 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
>   	.pte_hole		= smaps_pte_hole,
>   };
>   
> +/*
> + * Gather mem stats from @vma with the indicated beginning
> + * address @start, and keep them in @mss.
> + *
> + * Use vm_start of @vma as the beginning address if @start is 0.
> + */
>   static void smap_gather_stats(struct vm_area_struct *vma,
> -			     struct mem_size_stats *mss)
> +		struct mem_size_stats *mss, unsigned long start)
>   {
> +	const struct mm_walk_ops *ops = &smaps_walk_ops;
> +
> +	/* Invalid start */
> +	if (start >= vma->vm_end)
> +		return;
> +
>   #ifdef CONFIG_SHMEM
>   	/* In case of smaps_rollup, reset the value from previous vma */
>   	mss->check_shmem_swap = false;
> @@ -742,18 +754,20 @@ static void smap_gather_stats(struct vm_area_struct *vma,
>   		 */
>   		unsigned long shmem_swapped = shmem_swap_usage(vma);
>   
> -		if (!shmem_swapped || (vma->vm_flags & VM_SHARED) ||
> -					!(vma->vm_flags & VM_WRITE)) {
> +		if (!start && (!shmem_swapped || (vma->vm_flags & VM_SHARED) ||
> +					!(vma->vm_flags & VM_WRITE))) {
>   			mss->swap += shmem_swapped;
>   		} else {
>   			mss->check_shmem_swap = true;
> -			walk_page_vma(vma, &smaps_shmem_walk_ops, mss);
> -			return;
> +			ops = &smaps_shmem_walk_ops;
>   		}
>   	}
>   #endif
>   	/* mmap_lock is held in m_start */
> -	walk_page_vma(vma, &smaps_walk_ops, mss);
> +	if (!start)
> +		walk_page_vma(vma, ops, mss);
> +	else
> +		walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss);
>   }
>   
>   #define SEQ_PUT_DEC(str, val) \
> @@ -805,7 +819,7 @@ static int show_smap(struct seq_file *m, void *v)
>   
>   	memset(&mss, 0, sizeof(mss));
>   
> -	smap_gather_stats(vma, &mss);
> +	smap_gather_stats(vma, &mss, 0);
>   
>   	show_map_vma(m, vma);
>   
> @@ -854,7 +868,7 @@ static int show_smaps_rollup(struct seq_file *m, void *v)
>   	hold_task_mempolicy(priv);
>   
>   	for (vma = priv->mm->mmap; vma; vma = vma->vm_next) {
> -		smap_gather_stats(vma, &mss);
> +		smap_gather_stats(vma, &mss, 0);
>   		last_vma_end = vma->vm_end;
>   	}
>   
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
