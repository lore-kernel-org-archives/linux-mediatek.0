Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILqOXTbm47CzhpsV2BM2EQEnPYavg7Nbn7fRWiUuw2I=; b=WMNPHcCS5FjgYo
	OPqgHRZYnFQh/7sR9rBBwpL051aed5yLuVLf/PZg9F1jtN+/eemo1fO2ISwe3yIxyrA6lvGmpjmU/
	YfmMIe9mm2uq4hCVvXtMVslmsTKQYpgkgg7hf64mmJKqH78f+DXC1DUpHHIdBUN4421ifAC52DGCv
	8gSPZUB1wEkLdlb+G0WgFLjmf0285g3y+f/thQibTA2k+8o1yKpOiS+rzvKszHgyqYltziRI9fP3e
	9YYS+lXN1GBRm/awFddqaWSPW6ojep3vFuGPRw9CVPh1nBgM+B5AHTtob03D47rohFwfj26EA2fTu
	O9B7JB5Fm3ROt7bPlsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgpe-007QBD-5P; Mon, 30 May 2022 14:57:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgpQ-007Q6t-Qt; Mon, 30 May 2022 14:57:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 20933B80DB4;
	Mon, 30 May 2022 14:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30034C385B8;
	Mon, 30 May 2022 14:57:03 +0000 (UTC)
Date: Mon, 30 May 2022 15:56:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Patrick Wang <patrick.wang.shcn@gmail.com>
Cc: Yee Lee <yee.lee@mediatek.com>, linux-kernel@vger.kernel.org,
	Kuan-Ying.lee@mediatek.com, Andrew.Yang@mediatek.com,
	Sunny.Kao@mediatek.com, chinwen.chang@mediatek.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Ariel Marcovitch <arielmarcovitch@gmail.com>
Subject: Re: [PATCH] mm: kmemleak: Skip check in kmemleak_*_phys when pfn
 bound is not ready
Message-ID: <YpTbO/z1n0UYswBf@arm.com>
References: <20220527032504.30341-1-yee.lee@mediatek.com>
 <CAGcnep9B+z8QG4f4kkW8NF+fM1Kgj=NOV=YRhLK4yK74jbqpAw@mail.gmail.com>
 <05cfaf936a0c5f37f2e7ba779a8a1b0a6252be96.camel@mediatek.com>
 <64281aab-0301-7237-d72c-b7ab41bf50e4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64281aab-0301-7237-d72c-b7ab41bf50e4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_075709_206908_3DDFB197 
X-CRM114-Status: GOOD (  35.08  )
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

Hi Patrick,

On Mon, May 30, 2022 at 09:32:18PM +0800, Patrick Wang wrote:
> On 2022/5/30 10:27, Yee Lee wrote:
> > On Fri, 2022-05-27 at 21:39 +0800, patrick wang wrote:
> > > On Fri, May 27, 2022 at 11:25 AM <yee.lee@mediatek.com> wrote:
> > > > From: Yee Lee <yee.lee@mediatek.com>
> > > > 
> > > > In some archs (arm64), memblock allocates memory in boot time when
> > > > the pfn boundary (max_pfn/min_pfn) is not ready. The lowmen checks in
> > > > kmemleak_*_phys() drop those blocks and cause some false leak alarms
> > > > on common kernel objects.
> > > > 
> > > > Kmemleak output: (Qemu/arm64)
> > > > unreferenced object 0xffff0000c0170a00 (size 128):
> > > >    comm "swapper/0", pid 1, jiffies 4294892404 (age 126.208s)
> > > >    hex dump (first 32 bytes):
> > > >      62 61 73 65 00 00 00 00 00 00 00 00 00 00 00 00  base............
> > > >      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> > > >    backtrace:
> > > >      [<(____ptrval____)>] __kmalloc_track_caller+0x1b0/0x2e4
> > > >      [<(____ptrval____)>] kstrdup_const+0x8c/0xc4
> > > >      [<(____ptrval____)>] kvasprintf_const+0xbc/0xec
> > > >      [<(____ptrval____)>] kobject_set_name_vargs+0x58/0xe4
> > > >      [<(____ptrval____)>] kobject_add+0x84/0x100
> > > >      [<(____ptrval____)>] __of_attach_node_sysfs+0x78/0xec
> > > >      [<(____ptrval____)>] of_core_init+0x68/0x104
> > > >      [<(____ptrval____)>] driver_init+0x28/0x48
> > > >      [<(____ptrval____)>] do_basic_setup+0x14/0x28
> > > >      [<(____ptrval____)>] kernel_init_freeable+0x110/0x178
> > > >      [<(____ptrval____)>] kernel_init+0x20/0x1a0
> > > >      [<(____ptrval____)>] ret_from_fork+0x10/0x20
> > > > 
> > > > This patch relaxs the boundary checking in kmemleak_*_phys api
> > > > if max_low_pfn is uninitialzed.
> > > > 
> > > > Fixes: 23c2d4 (mm: kmemleak: take a full lowmem check in kmemleak_*_phy)

BTW, please use at least 12 characters for the git sha1, the above is
ambiguous.

> > > > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > > > ---
> > > >   mm/kmemleak.c | 8 ++++----
> > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> > > > index a182f5ddaf68..6b2af544aa0f 100644
> > > > --- a/mm/kmemleak.c
> > > > +++ b/mm/kmemleak.c
> > > > @@ -1132,7 +1132,7 @@ EXPORT_SYMBOL(kmemleak_no_scan);
> > > >   void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
> > > >                                 gfp_t gfp)
> > > >   {
> > > > -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
> > > > +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn))
> > > 
> > > Just skip checking will bring the crash possibility back. Seems
> > > it's beyond these interfaces' handle scope for this situation,
> > > since "min_low_pfn" and "max_low_pfn" are depending on arches.
> > 
> > Yes, for the cases beyond the pfn guard, users have to take care the
> > boundary by themselves.
> 
> Could we record these early calling and deal with them when it's
> ready? Is this appropriate?
> 
> I have an implementation based on this approach. Could you please
> help to have a test on your machine as well? And someone to take
> a look or review?

We had something similar until 5.4, removed by commit c5665868183f ("mm:
kmemleak: use the memory pool for early allocations"). It was a bit
painful as we never had the right buffer, so I'm not keen on adding it
back.

> From 82cae75dfaa78f414faf85bb49133e95159c041a Mon Sep 17 00:00:00 2001
> From: Patrick Wang <patrick.wang.shcn@gmail.com>
> Date: Mon, 30 May 2022 18:38:23 +0800
> Subject: [PATCH] mm: kmemleak: record early operations and handle later
> 
> The kmemleak_*_phys() interface uses "min_low_pfn" and
> "max_low_pfn" to check address. But on some architectures,
> kmemleak_*_phys() is called before those two variables
> initialized. Record these early operations and handle them
> when kmemleak_*_phys() are ready.

Could we instead record everything (no checks) but later avoid scanning
if below min or above max_low_pfn? We can add an OBJECT_PHYS flag to all
objects allocated via kmemleak_*_phys() and always check the
virt_to_phys() boundaries at scan time. It may actually help with this
problem as well:

https://lore.kernel.org/r/9dd08bb5-f39e-53d8-f88d-bec598a08c93@gmail.com

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
