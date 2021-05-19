Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41916C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:49:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5BC160698
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5BC160698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+xLOdUAJQ3ZG1W7P8Bd80GlbxVcLQXXlHpGzTBw08nk=; b=Wt7tuljwWd8zwOpmakBENekRG
	8v+VBtEY3ihphDbGF7h0n7JgpjTtseXm4iWF0JM2bOLd2zHMuwvRI5rEeHKCGWzX1Awz9wD2nffh8
	r7xz0PsBrbYoKXv2oZHlm7HkbbZpYM8Ob6k/PU1dptTIcc1LXnuTsNEz4l4jg74a8CLfd7RB5iWhP
	XsYSnnFyahqYrhu7GQfAL1T9QWBZeoA+eyrRTnikotoHoGKtHDpWpmHGeQWsoDT1cv6EYknKi9/jy
	0EkImimRAzDoUd7HbtJbIi2NVJidBuwNY8QzcKRYQm7hT0O+NzH4FpZCfPOz1d1F655ITpjRyZJQA
	M0Fybdxjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljDD4-002dT5-Gp; Wed, 19 May 2021 03:49:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDCp-002dRW-SG; Wed, 19 May 2021 03:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QKZQ1+SeHjDQOcCb9ZZoZGeNsXj6SQFEcTib4EreA1Q=; b=MMFhrGF5Ox6ZV1Tn09ZjC0ZpKL
 pyhWn1k/EMXwgd41Mnf1zi2F0ByyiuedB4nj2kQtE4Po295OpWQxZvAsXNUE14bVdbDzqjk10OTJM
 WW8jTsS3irT3ICrmTsCzW1o/AQbjVKQsLnEN4tnlnRRkRCwtaZ8yyvlkX84v/bQXkZnUqfk9D7xRG
 KG9X1AnLbraxZ0FZJNlIbxt7nGagC8wOVu9zEKTBZm+W30yS+FWOUs2nLMsQW/usF7W2uo07C6Zj2
 Lid1NzK2I7y4LSQwDpt7Lp1NS6fAZVf6aY3vaCHwRIvMykVgMiOwVEvH45jAT5zYdej+Vbt22Upx2
 KG6T+LBQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljDCm-00F6Nk-Pg; Wed, 19 May 2021 03:49:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7945C60698;
 Wed, 19 May 2021 03:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621396148;
 bh=szJ3NX+yHVQpb/7H98ib4HuC8uRgZ7nHYDGYCubOeY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVZVIumdcmHqmcUyvF/hN9qHNtM7Vv+HV2INDM2o+28+26uJJXy9+hRscH7MtzmzA
 q9mF8yMs+3MebWQ3YaHmtzrCVPEfg+EpaxBDHSonhumlBJW3af2HWWg8JMZymEUP0w
 g9K7GIHAtBY6U70V5GYa8I3+Wo75bWAU4PN6XYq8eSf9B+yeAtbIjYp5g5NzlYaarD
 EcBMBNzd304Bl2nVu7wltWWvju4cvH/0MZmgKu40E5ImtPAoUdENNjOp4oO63oLLRz
 o3IJ4D7xOTrTBgoVfss8JeBNyXS8azIbN4+2TMcCf5qq9RZ5fVpKpec9omaDHOfJrZ
 5SRQ6CIW/7Hcg==
Date: Wed, 19 May 2021 06:48:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/2] mm: unify the allocation of pglist_data instances
Message-ID: <YKSKq68E9Ompn0vE@kernel.org>
References: <20210518092446.16382-1-miles.chen@mediatek.com>
 <YKPmxEu6YFDXRyTg@kernel.org> <1621383126.12301.4.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621383126.12301.4.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_204908_898348_D5AC9313 
X-CRM114-Status: GOOD (  29.46  )
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

On Wed, May 19, 2021 at 08:12:06AM +0800, Miles Chen wrote:
> On Tue, 2021-05-18 at 19:09 +0300, Mike Rapoport wrote:
> > Hello Miles,
> > 
> > On Tue, May 18, 2021 at 05:24:44PM +0800, Miles Chen wrote:
> > > This patches is created to fix the __pa() warning messages when
> > > CONFIG_DEBUG_VIRTUAL=y by unifying the allocation of pglist_data
> > > instances.
> > > 
> > > In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
> > > pglist_data is allocated by a memblock API. If CONFIG_NEED_MULTIPLE_NODES=n,
> > > we use a global variable named "contig_page_data".
> > > 
> > > If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both
> > > allocation and symbol cases. But if CONFIG_DEBUG_VIRTUAL is set,
> > > we will have the "virt_to_phys used for non-linear address" warning
> > > when booting.
> > > 
> > > To fix the warning, always allocate pglist_data by memblock APIs and
> > > remove the usage of contig_page_data.
> > 
> > Somehow I was sure that we can allocate pglist_data before it is accessed
> > in sparse_init() somewhere outside mm/sparse.c. It's really not the case
> > and having two places that may allocated this structure is surely worth
> > than your previous suggestion.
> > 
> > Sorry about that.
> 
> Do you mean taht to call allocation function arch/*, somewhere after
> paging_init() (so we can access pglist_data) and before sparse_init()
> and free_area_init()?

No, I meant that your original patch is better than adding allocation of
NODE_DATA(0) in two places.
 
> Miles
> 
> >  
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
> > > [1] https://urldefense.com/v3/__https://lore.kernel.org/patchwork/patch/1425110/__;!!CTRNKA9wMg0ARbw!x-wGFEC1wLzXho2kI1CrC2fjXNaQm5f-n0ADQyJDckCOKZHAP_q055DCSWYcQ7Zdcw$ 
> > > 
> > > Change since v1:
> > > - use memblock_alloc() to create pglist_data when CONFIG_NUMA=n
> > > 
> > > Miles Chen (2):
> > >   mm: introduce prepare_node_data
> > >   mm: replace contig_page_data with node_data
> > > 
> > >  Documentation/admin-guide/kdump/vmcoreinfo.rst | 13 -------------
> > >  arch/powerpc/kexec/core.c                      |  5 -----
> > >  include/linux/gfp.h                            |  3 ---
> > >  include/linux/mm.h                             |  2 ++
> > >  include/linux/mmzone.h                         |  4 ++--
> > >  kernel/crash_core.c                            |  1 -
> > >  mm/memblock.c                                  |  3 +--
> > >  mm/page_alloc.c                                | 16 ++++++++++++++++
> > >  mm/sparse.c                                    |  2 ++
> > >  9 files changed, 23 insertions(+), 26 deletions(-)
> > > 
> > > 
> > > base-commit: 8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
> > > -- 
> > > 2.18.0
> > > 
> > 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
