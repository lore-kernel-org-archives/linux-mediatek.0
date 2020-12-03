Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5AEC64E8A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 11:30:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D80208FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 11:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D80208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pReBs9u716BpMbjCjakpGjWLZNh6jLNhcyR3y5IwU4o=; b=eLVay96SJSr6XxXXVRKZaVFsX
	Z69iUfx7AFunWr4BHbA6PUienTrxmrRUaXZV19cQxUi6CnAwAKBGEfslMD8ebzJPuZeG7lv44NOZD
	zfREKyckRQ4Iz/GnQHLwiaHedXU6FFMEJIswFp0iMk8zPPMH/SWBwhGjE9aSIZWus5MC+T/BwhJLA
	t5ZBORY1iD4xOPdmpaRdJwqiKH1Y8y0FZHR/JhgCK/LNdh4DUtpUXng9q21xDk0CFELsufl//k9KI
	ySv9HjiV9LPIp1hRijyWcUtaGqLm65DZFslBN2691ImhIKI7aTeNO2lxrvnJENpmTNI5FGHovqc/v
	wDInwbL4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkmog-0003j8-OJ; Thu, 03 Dec 2020 11:30:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkmoe-0003il-Ff
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 11:30:29 +0000
Date: Thu, 3 Dec 2020 11:30:21 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2] proc: use untagged_addr() for pagemap_read addresses
Message-ID: <20201203113020.GE2224@gaia>
References: <20201127050738.14440-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127050738.14440-1-miles.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_063028_659102_B5DD9BB0 
X-CRM114-Status: GOOD (  13.48  )
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
 wsd_upstream@mediatek.com, Andrey Konovalov <andreyknvl@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-fsdevel@vger.kernel.org,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 27, 2020 at 01:07:38PM +0800, Miles Chen wrote:
> Cc: Will Deacon <will.deacon@arm.com>

That should be will@kernel.org.

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

Does this need to be strict less-than? I think a less-than or equal
would work better.

> +		start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
> +
> +	/* Ensure the address is inside the task */
> +	if (start_vaddr > mm->task_size)
>  		start_vaddr = end_vaddr;

Otherwise the logic looks fine to me. With the above:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
