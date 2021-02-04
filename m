Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EB7C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 14:56:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F216464E42
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 14:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F216464E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rilf94vC/a4ogaaFc3AxRXT6LpsWSma3Q48BBUN/WHg=; b=M9r/Nvm2n0sIK8PdO+QnAWk9/
	Tk/8bY6RbETcZMeUo40bRw0U86vaQfC9KifQkhsakLxd4/edxKhsInqFHDevgsjFtTjQxWU/uBZ3f
	+D9x/20qyvBexhSOJG8ZP3qkVpnOFgNDPZSQCgHLYJQGkkSapIcyvsNzKvZiCxybPSRXkK/jPKF5/
	uIZduOpQ/nS32mscCh/7O6iSULfI4bIAuVQUw9XONCMq55Q03asotDLPLG1WvS/wnuNzM7v0gcKGr
	xGpUFqvietDi8o5klmsreN51VTzVM31MplstUabCcjAws8tyZvD9zbSFFA4AX7g7QTGc1pj9B2qum
	BBzPqW+Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7g35-0005gp-NM; Thu, 04 Feb 2021 14:55:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7g31-0005fY-IR; Thu, 04 Feb 2021 14:55:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D40264DBA;
 Thu,  4 Feb 2021 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612450554;
 bh=gJBWS+RDASWfFxTsTMTHeqe/fRxDGgTZWYX8LP56QXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a7nY5mV5TDyeWRHBNdaAPYZGrAmUJ9OVl1GnIoM6FJSErf2tfxQMmLmQhLcWr+GP7
 yrk2646E8w5/Le8UItOJgJh5I/esEUF4+G6fbi74EYA1+lB8/t5Oc+5bTbgLLQBbol
 KzJ3vu8utyERGuJfiAPQE9ZR0h8hp2Vuat+6e+f+Io4kSlobHDOhfO5RH+VZcPGamq
 aJ9WxHEQG0b2nSmT7anK+yHenIOKCVVPuGU71Pb2/buwav1JGJbQMMEIUvnVbw0wki
 Mb7R0ePnIW7Hmf6l7rNSgyX5wNqdK6wBbl8hxI6zb24BrfV5EaCbJl65UDBpCc7GnA
 uIkvChaFE+vRg==
Date: Thu, 4 Feb 2021 14:55:48 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer@gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: kasan: abstract _text and _end to
 KERNEL_START/END
Message-ID: <20210204145547.GD20815@willie-the-truck>
References: <20210204124658.GB20468@willie-the-truck>
 <20210204145127.75856-1-lecopzer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204145127.75856-1-lecopzer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_095555_689588_7CAE0CEB 
X-CRM114-Status: GOOD (  19.39  )
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
Cc: lecopzer.chen@mediatek.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tyhicks@linux.microsoft.com,
 glider@google.com, vincenzo.frascino@arm.com, ardb@kernel.org,
 yj.chiang@mediatek.com, kasan-dev@googlegroups.com, dvyukov@google.com,
 aryabinin@virtuozzo.com, linux@roeck-us.net, andreyknvl@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 gustavoars@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 04, 2021 at 10:51:27PM +0800, Lecopzer Chen wrote:
> > On Sat, Jan 09, 2021 at 06:32:50PM +0800, Lecopzer Chen wrote:
> > > Arm64 provide defined macro for KERNEL_START and KERNEL_END,
> > > thus replace them by the abstration instead of using _text and _end.
> > > 
> > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > > ---
> > >  arch/arm64/mm/kasan_init.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > > index 39b218a64279..fa8d7ece895d 100644
> > > --- a/arch/arm64/mm/kasan_init.c
> > > +++ b/arch/arm64/mm/kasan_init.c
> > > @@ -218,8 +218,8 @@ static void __init kasan_init_shadow(void)
> > >  	phys_addr_t pa_start, pa_end;
> > >  	u64 i;
> > >  
> > > -	kimg_shadow_start = (u64)kasan_mem_to_shadow(_text) & PAGE_MASK;
> > > -	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(_end));
> > > +	kimg_shadow_start = (u64)kasan_mem_to_shadow(KERNEL_START) & PAGE_MASK;
> > > +	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(KERNEL_END));
> > >  
> > >  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
> > >  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
> > > @@ -241,7 +241,7 @@ static void __init kasan_init_shadow(void)
> > >  	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
> > >  
> > >  	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
> > > -			   early_pfn_to_nid(virt_to_pfn(lm_alias(_text))));
> > > +			   early_pfn_to_nid(virt_to_pfn(lm_alias(KERNEL_START))));
> > 
> > To be honest, I think this whole line is pointless. We should be able to
> > pass NUMA_NO_NODE now that we're not abusing the vmemmap() allocator to
> > populate the shadow.
> 
> Do we need to fix this in this series? it seems another topic.
> If not, should this patch be removed in this series?

Since you're reposting anyway, you may as well include a patch doing that.
If you don't, then I will.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
