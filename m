Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3390BC71156
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 11:42:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B8E20758
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 11:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5B8E20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iePCGdbtKEbsa4/3//N+rJdrJjw2ZwCvA79uXyemKl8=; b=gy8OWcuhxQ7xXLwRf9WEAu6ph
	Wlw/IlnM6N/UadhZhkhcLmC8Lf5QLQ1M2anIIKZX9AN/Xmvn5CnE3PaT8KQDSZVoo9pH4jYtmuC59
	3M4zmmhW07d5yggIA5udDswO6GvSPvJ0gE6birrchIecF10IYkO4PPRDzQRbOTaR0dzm809qRbVCs
	QePXsi3bTzxhvxTYX5U67+0qv//mrQ3Iyzzh86THbO9UrGrQiYfxrUZxXLtH31/VSv/Ad4zOdXTzj
	qKnTX53FxfeZkjg+lpPTfF81QBhF/qdj1Gg0w7oJOS/iHP6+JwTdHCgaRAVSCvEO7oTWYLthTB5mk
	eYyKeIO+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkn0a-0004w7-3l; Thu, 03 Dec 2020 11:42:48 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkn0X-0004vX-5v
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 11:42:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D325113E;
 Thu,  3 Dec 2020 03:42:44 -0800 (PST)
Received: from [10.37.8.53] (unknown [10.37.8.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CC8E3F66B;
 Thu,  3 Dec 2020 03:42:40 -0800 (PST)
Subject: Re: [PATCH v2] proc: use untagged_addr() for pagemap_read addresses
To: Miles Chen <miles.chen@mediatek.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20201127050738.14440-1-miles.chen@mediatek.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <d836c2d2-321f-3931-568b-430d73c60c2c@arm.com>
Date: Thu, 3 Dec 2020 11:45:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201127050738.14440-1-miles.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_064245_362908_AFC6C546 
X-CRM114-Status: GOOD (  28.67  )
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
Cc: Song Bao Hua <song.bao.hua@hisilicon.com>, Marco Elver <elver@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, wsd_upstream@mediatek.com,
 Andrey Konovalov <andreyknvl@google.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Alexander Potapenko <glider@google.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-fsdevel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Miles,

On 11/27/20 5:07 AM, Miles Chen wrote:
> When we try to visit the pagemap of a tagged userspace pointer, we find
> that the start_vaddr is not correct because of the tag.
> To fix it, we should untag the usespace pointers in pagemap_read().
> 

Nit: s/usespace/userspace/ (please search and replace all occurrences :) )

> I tested with 5.10-rc4 and the issue remains.
> 
> Explaination from Catalin in [1]:
>

Nit: s/Explaination/Explanation/ (please search and replace all occurrences :) )

> "
> Arguably, that's a user-space bug since tagged file offsets were never
> supported. In this case it's not even a tag at bit 56 as per the arm64
> tagged address ABI but rather down to bit 47. You could say that the
> problem is caused by the C library (malloc()) or whoever created the
> tagged vaddr and passed it to this function. It's not a kernel
> regression as we've never supported it.
> 
> Now, pagemap is a special case where the offset is usually not generated
> as a classic file offset but rather derived by shifting a user virtual
> address. I guess we can make a concession for pagemap (only) and allow
> such offset with the tag at bit (56 - PAGE_SHIFT + 3).
> "
> 
> My test code is baed on [2]:

Nit: s/baed/based/ (please search and replace all occurrences :) )

[...]

> ---
>  fs/proc/task_mmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 217aa2705d5d..92b277388f05 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1599,11 +1599,15 @@ static ssize_t pagemap_read(struct file *file, char __user *buf,
>  
>  	src = *ppos;
>  	svpfn = src / PM_ENTRY_BYTES;
> -	start_vaddr = svpfn << PAGE_SHIFT;
>  	end_vaddr = mm->task_size;
>  
>  	/* watch out for wraparound */
> -	if (svpfn > mm->task_size >> PAGE_SHIFT)
> +	start_vaddr = end_vaddr;
> +	if (svpfn < (ULONG_MAX >> PAGE_SHIFT))

It seems that 'svpfn' should be less-then-equal (<=) '(ULONG_MAX >>
PAGE_SHIFT)'. Is there any specific reason why this is not the case?

> +		start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
> +
> +	/* Ensure the address is inside the task */
> +	if (start_vaddr > mm->task_size)
>  		start_vaddr = end_vaddr;
>  
>  	/*
> 

Otherwise:

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

-- 
Regards,
Vincenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
