Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAB4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 12:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 212DF613D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 12:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 212DF613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOppJgPnu2Q/XYrr5cphUckHQSk3FPhPjwa1v0UOfBg=; b=yt8Qj1YULJ7+vV
	mQ8zbLww5TRJW51EWKEGhlE6cTL7+pediKXllGpJER/i2dKkggPu59Oyb71V6Q35woNUzVyD/Noym
	isXGzfjxrK5mYxXpr9TMtSNb+0wDUQyBNgk+c8/emiy9Y0wlMDB71yKMqm/ompR3nrPfst/HYRdV+
	bmR4Lk2AjscVscI3K8NRVOv1wxoytbVyYmG42cWntT6oOykNJR/Wc5uDbOwe8GFvhLwil+zIz7zON
	i0HwpD/cpAb+l8C6J55ciS8XXFKc/Op/cVApbWjLuOvn/VpDGCVEqQThaCiVXBLPYTtUEPd1nqsy1
	tYi+7OY3DjBQdE5L9hWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVYI3-00AwhI-4r; Wed, 29 Sep 2021 12:02:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVYAn-00Au8R-Lg; Wed, 29 Sep 2021 11:54:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2A456136A;
 Wed, 29 Sep 2021 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632916493;
 bh=EZ71/Hs+sFEq9J5Fv5IdbNz2X8Ij31zbmQ2wxKWDiOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F3Euc0uHxd7XebKMfcFXFKgfeD+VCo37VEbfQm/1QSkarQTeqTCKd1XGhkyiyWd/u
 utkV8LHwJsfRVKvvL9/omgl8Tq3cl0S5G4jFq0BUlCFptDvatQ2Kq51nWoUu93aRCc
 YchiKm313sbqrLCEDDSLBpqXEwH0/n5Kd/MYzEAVsdWSdN9Ln06J9M7tO6fI4VW8St
 OrRRBX2+IFfANR2SRMoSa5glpF8rjPyycAvBet1NqBD1Ob+idAlCV949ktkT2pQjJb
 KBM+f9kahwmVQ+xuxWsvg4bwE1R2f/sNPi2R2Li3M4NVxejUoCo7m9MY7RN6bLzc4+
 wvkksbgUu/uaA==
Date: Wed, 29 Sep 2021 12:54:48 +0100
From: Will Deacon <will@kernel.org>
To: yee.lee@mediatek.com
Cc: linux-kernel@vger.kernel.org, nicholas.Tang@mediatek.com,
 Kuan-Ying.lee@mediatek.com, chinwen.chang@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] scs: Release kasan vmalloc poison in scs_free process
Message-ID: <20210929115447.GA21631@willie-the-truck>
References: <20210923095316.13867-1-yee.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923095316.13867-1-yee.lee@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_045453_791114_91703128 
X-CRM114-Status: GOOD (  20.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 23, 2021 at 05:53:12PM +0800, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> Since scs allocation has been moved to vmalloc region, the
> shadow stack is protected by kasan_posion_vmalloc.
> However, the vfree_atomic operation needs to access
> its context for scs_free process and causes kasan error
> as the dump info below.
> 
> This patch Adds kasan_unpoison_vmalloc() before vfree_atomic,
> which aligns to the prior flow as using kmem_cache.
> The vmalloc region will go back posioned in the following
> vumap() operations.
> 
>  ==================================================================
>  BUG: KASAN: vmalloc-out-of-bounds in llist_add_batch+0x60/0xd4
>  Write of size 8 at addr ffff8000100b9000 by task kthreadd/2
> 
>  CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.15.0-rc2-11681-(skip)
>  Hardware name: linux,dummy-virt (DT)
>  Call trace:
>   dump_backtrace+0x0/0x43c
>   show_stack+0x1c/0x2c
>   dump_stack_lvl+0x68/0x84
>   print_address_description+0x80/0x394
>   kasan_report+0x180/0x1dc
>   __asan_report_store8_noabort+0x48/0x58
>   llist_add_batch+0x60/0xd4
>   vfree_atomic+0x60/0xe0
>   scs_free+0x1dc/0x1fc
>   scs_release+0xa4/0xd4
>   free_task+0x30/0xe4

Thanks, I can reproduce this easily with mainline. We only recently gained
vmalloc support for kasan on arm64, so that's probably why we didn't spot
this earlier.

> diff --git a/kernel/scs.c b/kernel/scs.c
> index e2a71fc82fa0..25c0d8e416e6 100644
> --- a/kernel/scs.c
> +++ b/kernel/scs.c
> @@ -68,6 +68,7 @@ void scs_free(void *s)
>  
>  	__scs_account(s, -1);
>  
> +	kasan_unpoison_vmalloc(s, SCS_SIZE);
>  	/*
>  	 * We cannot sleep as this can be called in interrupt context,
>  	 * so use this_cpu_cmpxchg to update the cache, and vfree_atomic

I don't think we should be unpoisoning the stack pages if we're putting
them back on to the local cache -- unpoisoning happens on the alloc path
in that case anyway so that we can zero them.

So how about sending a v2 with this moved a bit later (see below)? With
that change:

Acked-by: Will Deacon <will@kernel.org>
Tested-by: Will Deacon <will@kernel.org>

Thanks,

Will

--->8

diff --git a/kernel/scs.c b/kernel/scs.c
index e2a71fc82fa0..579841be8864 100644
--- a/kernel/scs.c
+++ b/kernel/scs.c
@@ -78,6 +78,7 @@ void scs_free(void *s)
                if (this_cpu_cmpxchg(scs_cache[i], 0, s) == NULL)
                        return;
 
+       kasan_unpoison_vmalloc(s, SCS_SIZE);
        vfree_atomic(s);
 }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
