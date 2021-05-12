Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A2AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:38:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2D06108D
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A2D06108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BEQJOQz5V6f3PRTWT7hFN1h+fyWQuKj//qMgSPB9Y4A=; b=n5X8GrFp4OgmNkME4X4GQTWId
	XuoRiJQH89rJtw215UQpW8KS1JNZ9rwDhcmvfNMLd3F7y9oOtIwNSKGX1atrx6JxegyzuEsH7UR/4
	FbM498WuwVx0VlE9dTA1f6WqU3zjOxcvGJCiO3jIVvrcpGxXyMfj0EGAruIuro9UjByWc+0Ui9nDZ
	F2OJs6JdkLD5H1AM6x0IChsKnMy7EgAmS0hwjHvfNBTrEMqEtVVMCpAlg2tHm+tQK7GwbnUztkw26
	r6nHk4bunwMcp6b+9o2+u97JBO1kpCNExsgObf0TnbGlxylV8jzQNZ32phCb9TSdk2c/9t0N5XIKQ
	uAlwf99rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lglJi-002Rv5-Ef; Wed, 12 May 2021 09:38:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lglJg-002Rus-Q8
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 09:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yyRub9Fy93DcXEg0Nwp9ayP6yVyWdQAPqp6nphJcLkk=; b=l4WReXKeeXNitUU9qW1Hlh81qE
 Yc0SkuQkohLOLa6Ka9gevUd7KiCghs9JpQ1xc7O+c3WZRWGmLWbMm/IUbKeL9MQxjrA8ylzve5Nyl
 iJtssWu47P7cHq05JcchDc6FWBPuaKSdTxRI8rLW+oP+YOP6u0kXwluk/OpI1KlQvZiHqAmf4vQEQ
 8lieb0ab7YbXQs6s1ysNqBtEp5TUrH8kVITbGummHQjMCkhD/mBJJ1d7sSKrEneIeDZap7N67TsjH
 xcXQYVrf9bYrXylaVLM4H4mQjmRSYmCnHr2TQMezhHON7+1umIDNYy5GsMiUDKeSRi50i9hQxWnTA
 XxHES3Sw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lglJe-00AFxD-1y
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 09:38:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5AC36108D;
 Wed, 12 May 2021 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620812285;
 bh=tqgKfZd5eAqp6cVMkA0XQQJMOf1WNvOS68bGJkxaR4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fOyvoamv42OGaF94Cdum5zLM86Gu2MamUxIsxkUy+Wl/h5zv792c56BsXFugzVAwm
 1a41QoJzvtSwIsbyZwFYW8gcVWwGmWnGqT2L7dKeDuuvCLGzE3Uy2yzCHyWouYczuy
 BoIiaCBCdgkge3nWLXfm3bA2o4fZuc8z8b6lvCQtToCFBaH8mK09hLqRnu7QtsKROP
 H7U+7sPABDHL/erCae0nZQyv8HJ59hAJcFTMl+IbyTMGzUmhBzyBWMiQi9P7a7TU0e
 9zQVpLR5Kv0tIDKQ6CuYmtZQh+4iJVTVUApTNtkUznBMLhI2/8FTAY8izu+drMKKId
 8b5RP7jgQ5bww==
Date: Wed, 12 May 2021 12:37:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com
Subject: Re: [PATCH] mm/sparse: fix check_usemap_section_nr warnings
Message-ID: <YJuh90iYeZ8F4Ain@kernel.org>
References: <20210511093114.15123-1-miles.chen@mediatek.com>
 <YJpbWVrgJFLRpzl3@kernel.org> <1620797600.14730.7.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620797600.14730.7.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_023806_205106_EEFCEEEA 
X-CRM114-Status: GOOD (  33.85  )
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

On Wed, May 12, 2021 at 01:33:20PM +0800, Miles Chen wrote:
> On Tue, 2021-05-11 at 13:24 +0300, Mike Rapoport wrote:
> > On Tue, May 11, 2021 at 05:31:14PM +0800, Miles Chen wrote:
> > > In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
> > > node_data is allocated by kzmalloc. If CONFIG_NEED_MULTIPLE_NODES=n,
> > > we use a global variable named "contig_page_data".
> > > 
> > > If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both kzalloc and
> > > symbol cases. But if CONFIG_DEBUG_VIRTUAL is set, we will have the
> > > "virt_to_phys used for non-linear address" warning when booting.
> > 
> > Maybe we'll just allocate pgdat for CONFIG_NEED_MULTIPLE_NODES=n (which is
> > essentially !NUMA) case in, say, free_area_init()?
> 
> 
> thanks for your comment.
> 
> I check the source tree and found that contig_page_data is used by
> crash_core.c as a symbol. I am not familiar with crash_core but I guess
> allocate pgdat may break this crash_core users.
> 
> For example: some userspace scripts want to read the address of
> contig_page_data symbol from a corefile.
> 
> kernel/crash_core.c:460:        VMCOREINFO_SYMBOL(contig_page_data);
> 
> #ifndef CONFIG_NEED_MULTIPLE_NODES
>         VMCOREINFO_SYMBOL(mem_map);
>         VMCOREINFO_SYMBOL(contig_page_data);
> #endif

My understanding is that VMCOREINFO_SYMBOL() should correspond to actual
symbol. If there is no contig_page_data symbol, there is no need for
VMCOREINFO_SYMBOL() either.
 
> Perhaps we should use current simple approach?
> 
> 
> >  
> > > To fix it, create a small function to handle both translation.
> > > 
> > > Warning message:
> > > [    0.000000] ------------[ cut here ]------------
> > > [    0.000000] virt_to_phys used for non-linear address: (____ptrval____) (contig_page_data+0x0/0x1c00)
> > > [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x58/0x68
> > > [    0.000000] Modules linked in:
> > > [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.13.0-rc1-00074-g1140ab592e2e #3
> > > [    0.000000] Hardware name: linux,dummy-virt (DT)
> > > [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
> > > [    0.000000] pc : __virt_to_phys+0x58/0x68
> > > [    0.000000] lr : __virt_to_phys+0x54/0x68
> > > [    0.000000] sp : ffff800011833e70
> > > [    0.000000] x29: ffff800011833e70 x28: 00000000418a0018 x27: 0000000000000000
> > > [    0.000000] x26: 000000000000000a x25: ffff800011b70000 x24: ffff800011b70000
> > > [    0.000000] x23: fffffc0001c00000 x22: ffff800011b70000 x21: 0000000047ffffb0
> > > [    0.000000] x20: 0000000000000008 x19: ffff800011b082c0 x18: ffffffffffffffff
> > > [    0.000000] x17: 0000000000000000 x16: ffff800011833bf9 x15: 0000000000000004
> > > [    0.000000] x14: 0000000000000fff x13: ffff80001186a548 x12: 0000000000000000
> > > [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
> > > [    0.000000] x8 : ffff8000115c9000 x7 : 737520737968705f x6 : ffff800011b62ef8
> > > [    0.000000] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
> > > [    0.000000] x2 : 0000000000000000 x1 : ffff80001159585e x0 : 0000000000000058
> > > [    0.000000] Call trace:
> > > [    0.000000]  __virt_to_phys+0x58/0x68
> > > [    0.000000]  check_usemap_section_nr+0x50/0xfc
> > > [    0.000000]  sparse_init_nid+0x1ac/0x28c
> > > [    0.000000]  sparse_init+0x1c4/0x1e0
> > > [    0.000000]  bootmem_init+0x60/0x90
> > > [    0.000000]  setup_arch+0x184/0x1f0
> > > [    0.000000]  start_kernel+0x78/0x488
> > > [    0.000000] ---[ end trace f68728a0d3053b60 ]---
> > > 
> > > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > > ---
> > >  mm/sparse.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/mm/sparse.c b/mm/sparse.c
> > > index b2ada9dc00cb..55c18aff3e42 100644
> > > --- a/mm/sparse.c
> > > +++ b/mm/sparse.c
> > > @@ -344,6 +344,15 @@ size_t mem_section_usage_size(void)
> > >  	return sizeof(struct mem_section_usage) + usemap_size();
> > >  }
> > >  
> > > +static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
> > > +{
> > > +#ifndef CONFIG_NEED_MULTIPLE_NODES
> > > +	return __pa_symbol(pgdat);
> > > +#else
> > > +	return __pa(pgdat);
> > > +#endif
> > > +}
> > > +
> > >  #ifdef CONFIG_MEMORY_HOTREMOVE
> > >  static struct mem_section_usage * __init
> > >  sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
> > > @@ -362,7 +371,7 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
> > >  	 * from the same section as the pgdat where possible to avoid
> > >  	 * this problem.
> > >  	 */
> > > -	goal = __pa(pgdat) & (PAGE_SECTION_MASK << PAGE_SHIFT);
> > > +	goal = pgdat_to_phys(pgdat) & (PAGE_SECTION_MASK << PAGE_SHIFT);
> > >  	limit = goal + (1UL << PA_SECTION_SHIFT);
> > >  	nid = early_pfn_to_nid(goal >> PAGE_SHIFT);
> > >  again:
> > > @@ -390,7 +399,7 @@ static void __init check_usemap_section_nr(int nid,
> > >  	}
> > >  
> > >  	usemap_snr = pfn_to_section_nr(__pa(usage) >> PAGE_SHIFT);
> > > -	pgdat_snr = pfn_to_section_nr(__pa(pgdat) >> PAGE_SHIFT);
> > > +	pgdat_snr = pfn_to_section_nr(pgdat_to_phys(pgdat) >> PAGE_SHIFT);
> > >  	if (usemap_snr == pgdat_snr)
> > >  		return;
> > >  
> > > -- 
> > > 2.18.0
> > 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
