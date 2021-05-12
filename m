Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CDCC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 05:44:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27ABD611CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 05:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27ABD611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vl0tv5V57IdDf8HWr1dLdG/H0hKOUJZhFG4iZRbwxfA=; b=UUrnAu6ajZe6dzB6Dzaq1/nz9
	9f653+h1FRsFCqOwxx+meKvKeK2KTcxMhVpaUa+hRLPteCXzMyKKleyc/i8WvigvatPsaeuR9JLIC
	KZTNTAcAOJrhdZMt7MB4dVcZd7FsXO60f694uuFWKfOPZeIRTejBZBLJhk12Kj2R1dGRzmVGMTsva
	/qLy7agHRbBENPlg89vaT6cnOK/yeBorzA712LvCPoPfi4EptGXgSSfuVD3HCpKBjyand4LKdry3/
	wEIgikJbZ01n+HtzYrFsqSYC9J6M0YtgKvvGN0+6dry2B9AnbnIjCdaZF+EOb6loTGPOUW6L6n+uN
	DOCyaRi4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgheo-0026E6-UG; Wed, 12 May 2021 05:43:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lghen-0026Dx-5W
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 05:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=1Hig6ufK3upmffi3QW656W1WbomkrJd5dyZdBbMqwVw=; b=IvirB2fYLrcvzjPO+pVxyVF8ei
 mAo1DRP0We4UDGhJqULqjZ8vb9No1q1HCErs8IKMgvKy9Up/XMp/MzTeamDzEWClsdkj1cgEB7YLA
 WvK1ex1FFzmD3eQ1q6Fjel10defNE8BHn0kj1nDksKiElNsaDAE+q4/d9u7H5j2J6U1HBfjCj4GCg
 a1kL48c3Qrfv3ghDnd7m0FrpQgiCLXQPCW0fbKHyXeJholUaEywf8THJRM5Iu4KhXMFdhE4DDZ2bm
 2dGv17CEgBIulNB3XhZJFz+uuz2EA0tvmhnPKMO8q4IEUrfboEWj64C4pTVzYZ4IijMJTKyuv2eMZ
 CqLeMonA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgheh-00A7tu-Vv
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 05:43:39 +0000
X-UUID: 0a529efe739242fab36264443d0b71c5-20210511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1Hig6ufK3upmffi3QW656W1WbomkrJd5dyZdBbMqwVw=; 
 b=BSE5Y2r0ghMJwbL/rAcEdfCIBDqrcRnixuB/KATPf742dyLtWetXWUe7goYoRsfz2/LecHpSYryN80CrTPsAhsrN6ORbV4cy4dVdvUNBOvGM+B02Q6aj1wNKIUYXQetgxYkRLqUkIzPp8dBWGuaSI6NhZw4mqNJp1MX1BGZS5Z0=;
X-UUID: 0a529efe739242fab36264443d0b71c5-20210511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 860014773; Tue, 11 May 2021 22:43:31 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 22:33:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 May 2021 13:33:20 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 May 2021 13:33:20 +0800
Message-ID: <1620797600.14730.7.camel@mtkswgap22>
Subject: Re: [PATCH] mm/sparse: fix check_usemap_section_nr warnings
From: Miles Chen <miles.chen@mediatek.com>
To: Mike Rapoport <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <wsd_upstream@mediatek.com>
Date: Wed, 12 May 2021 13:33:20 +0800
In-Reply-To: <YJpbWVrgJFLRpzl3@kernel.org>
References: <20210511093114.15123-1-miles.chen@mediatek.com>
 <YJpbWVrgJFLRpzl3@kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0075D64FEC39526C3973E4FE3D00DD596B03BFF770B42BCC6A67117FD9B851EC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_224337_471139_654F412F 
X-CRM114-Status: GOOD (  30.99  )
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

On Tue, 2021-05-11 at 13:24 +0300, Mike Rapoport wrote:
> On Tue, May 11, 2021 at 05:31:14PM +0800, Miles Chen wrote:
> > In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
> > node_data is allocated by kzmalloc. If CONFIG_NEED_MULTIPLE_NODES=n,
> > we use a global variable named "contig_page_data".
> > 
> > If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both kzalloc and
> > symbol cases. But if CONFIG_DEBUG_VIRTUAL is set, we will have the
> > "virt_to_phys used for non-linear address" warning when booting.
> 
> Maybe we'll just allocate pgdat for CONFIG_NEED_MULTIPLE_NODES=n (which is
> essentially !NUMA) case in, say, free_area_init()?


thanks for your comment.

I check the source tree and found that contig_page_data is used by
crash_core.c as a symbol. I am not familiar with crash_core but I guess
allocate pgdat may break this crash_core users.

For example: some userspace scripts want to read the address of
contig_page_data symbol from a corefile.

kernel/crash_core.c:460:        VMCOREINFO_SYMBOL(contig_page_data);

#ifndef CONFIG_NEED_MULTIPLE_NODES
        VMCOREINFO_SYMBOL(mem_map);
        VMCOREINFO_SYMBOL(contig_page_data);
#endif


Perhaps we should use current simple approach?


>  
> > To fix it, create a small function to handle both translation.
> > 
> > Warning message:
> > [    0.000000] ------------[ cut here ]------------
> > [    0.000000] virt_to_phys used for non-linear address: (____ptrval____) (contig_page_data+0x0/0x1c00)
> > [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x58/0x68
> > [    0.000000] Modules linked in:
> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.13.0-rc1-00074-g1140ab592e2e #3
> > [    0.000000] Hardware name: linux,dummy-virt (DT)
> > [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
> > [    0.000000] pc : __virt_to_phys+0x58/0x68
> > [    0.000000] lr : __virt_to_phys+0x54/0x68
> > [    0.000000] sp : ffff800011833e70
> > [    0.000000] x29: ffff800011833e70 x28: 00000000418a0018 x27: 0000000000000000
> > [    0.000000] x26: 000000000000000a x25: ffff800011b70000 x24: ffff800011b70000
> > [    0.000000] x23: fffffc0001c00000 x22: ffff800011b70000 x21: 0000000047ffffb0
> > [    0.000000] x20: 0000000000000008 x19: ffff800011b082c0 x18: ffffffffffffffff
> > [    0.000000] x17: 0000000000000000 x16: ffff800011833bf9 x15: 0000000000000004
> > [    0.000000] x14: 0000000000000fff x13: ffff80001186a548 x12: 0000000000000000
> > [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
> > [    0.000000] x8 : ffff8000115c9000 x7 : 737520737968705f x6 : ffff800011b62ef8
> > [    0.000000] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
> > [    0.000000] x2 : 0000000000000000 x1 : ffff80001159585e x0 : 0000000000000058
> > [    0.000000] Call trace:
> > [    0.000000]  __virt_to_phys+0x58/0x68
> > [    0.000000]  check_usemap_section_nr+0x50/0xfc
> > [    0.000000]  sparse_init_nid+0x1ac/0x28c
> > [    0.000000]  sparse_init+0x1c4/0x1e0
> > [    0.000000]  bootmem_init+0x60/0x90
> > [    0.000000]  setup_arch+0x184/0x1f0
> > [    0.000000]  start_kernel+0x78/0x488
> > [    0.000000] ---[ end trace f68728a0d3053b60 ]---
> > 
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  mm/sparse.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/sparse.c b/mm/sparse.c
> > index b2ada9dc00cb..55c18aff3e42 100644
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -344,6 +344,15 @@ size_t mem_section_usage_size(void)
> >  	return sizeof(struct mem_section_usage) + usemap_size();
> >  }
> >  
> > +static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
> > +{
> > +#ifndef CONFIG_NEED_MULTIPLE_NODES
> > +	return __pa_symbol(pgdat);
> > +#else
> > +	return __pa(pgdat);
> > +#endif
> > +}
> > +
> >  #ifdef CONFIG_MEMORY_HOTREMOVE
> >  static struct mem_section_usage * __init
> >  sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
> > @@ -362,7 +371,7 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
> >  	 * from the same section as the pgdat where possible to avoid
> >  	 * this problem.
> >  	 */
> > -	goal = __pa(pgdat) & (PAGE_SECTION_MASK << PAGE_SHIFT);
> > +	goal = pgdat_to_phys(pgdat) & (PAGE_SECTION_MASK << PAGE_SHIFT);
> >  	limit = goal + (1UL << PA_SECTION_SHIFT);
> >  	nid = early_pfn_to_nid(goal >> PAGE_SHIFT);
> >  again:
> > @@ -390,7 +399,7 @@ static void __init check_usemap_section_nr(int nid,
> >  	}
> >  
> >  	usemap_snr = pfn_to_section_nr(__pa(usage) >> PAGE_SHIFT);
> > -	pgdat_snr = pfn_to_section_nr(__pa(pgdat) >> PAGE_SHIFT);
> > +	pgdat_snr = pfn_to_section_nr(pgdat_to_phys(pgdat) >> PAGE_SHIFT);
> >  	if (usemap_snr == pgdat_snr)
> >  		return;
> >  
> > -- 
> > 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
