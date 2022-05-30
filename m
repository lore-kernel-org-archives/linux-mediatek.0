Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2232C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc95eAtqZ/dWF/q53dXl0HN16HZ8MiDT25ykItpdlsg=; b=pX+SPzA9Q2FTNT
	i8RwO+YWWd5tBpQ1EDEXrT9QbMHQi4n6KqIodc9YDLpX7FjXETkzEBZNIeYXu8GyVGZJw35ZN9QJP
	dC7K3P2vBMwGotrrYSuhBjF926CmIwqFV+DFZAnqExZkFTrkvdXsU/1qCC9JCPI79uE7EfZ8gzOZJ
	oEGC9QAsEQQfs5QCagG6+8T0UROh48MLxlT32ywIBl8a3VzycmnrZy8TyfqJ06iTz/IdpsvdWuoEI
	MJ128SOvZnIYDeviq2sRBuZjkiyucTiN8W+3aMj3+lYP+SAzaC5sWpDYN3KECYTVDwU2uLjUsv2Dg
	7+tJaWtxSQ/vwMKJikAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvVEv-005AFz-FU; Mon, 30 May 2022 02:34:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvVEs-005AFY-8X; Mon, 30 May 2022 02:34:40 +0000
X-UUID: dac2d87cb3644156988e0203b7f054ad-20220529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:4cca58c9-1abc-4d13-bff7-33d5cc9f494b,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:3aaeee47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: dac2d87cb3644156988e0203b7f054ad-20220529
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yee.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1404339986; Sun, 29 May 2022 19:34:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 29 May 2022 19:27:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 10:27:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 30 May 2022 10:27:10 +0800
Message-ID: <05cfaf936a0c5f37f2e7ba779a8a1b0a6252be96.camel@mediatek.com>
Subject: Re: [PATCH] mm: kmemleak: Skip check in kmemleak_*_phys when pfn
 bound is not ready
From: Yee Lee <yee.lee@mediatek.com>
To: patrick wang <patrick.wang.shcn@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <Kuan-Ying.lee@mediatek.com>,
	<Andrew.Yang@mediatek.com>, <Sunny.Kao@mediatek.com>,
	<chinwen.chang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Mon, 30 May 2022 10:27:10 +0800
In-Reply-To: <CAGcnep9B+z8QG4f4kkW8NF+fM1Kgj=NOV=YRhLK4yK74jbqpAw@mail.gmail.com>
References: <20220527032504.30341-1-yee.lee@mediatek.com>
	 <CAGcnep9B+z8QG4f4kkW8NF+fM1Kgj=NOV=YRhLK4yK74jbqpAw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_193438_359630_2136599B 
X-CRM114-Status: GOOD (  23.32  )
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

On Fri, 2022-05-27 at 21:39 +0800, patrick wang wrote:
> On Fri, May 27, 2022 at 11:25 AM <yee.lee@mediatek.com> wrote:
> > 
> > From: Yee Lee <yee.lee@mediatek.com>
> > 
> > In some archs (arm64), memblock allocates memory in boot time when
> > the pfn boundary (max_pfn/min_pfn) is not ready. The lowmen checks
> > in
> > kmemleak_*_phys() drop those blocks and cause some false leak
> > alarms
> > on common kernel objects.
> > 
> > Kmemleak output: (Qemu/arm64)
> > unreferenced object 0xffff0000c0170a00 (size 128):
> >   comm "swapper/0", pid 1, jiffies 4294892404 (age 126.208s)
> >   hex dump (first 32 bytes):
> >     62 61 73 65 00 00 00 00 00 00 00 00 00 00 00
> > 00  base............
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 00  ................
> >   backtrace:
> >     [<(____ptrval____)>] __kmalloc_track_caller+0x1b0/0x2e4
> >     [<(____ptrval____)>] kstrdup_const+0x8c/0xc4
> >     [<(____ptrval____)>] kvasprintf_const+0xbc/0xec
> >     [<(____ptrval____)>] kobject_set_name_vargs+0x58/0xe4
> >     [<(____ptrval____)>] kobject_add+0x84/0x100
> >     [<(____ptrval____)>] __of_attach_node_sysfs+0x78/0xec
> >     [<(____ptrval____)>] of_core_init+0x68/0x104
> >     [<(____ptrval____)>] driver_init+0x28/0x48
> >     [<(____ptrval____)>] do_basic_setup+0x14/0x28
> >     [<(____ptrval____)>] kernel_init_freeable+0x110/0x178
> >     [<(____ptrval____)>] kernel_init+0x20/0x1a0
> >     [<(____ptrval____)>] ret_from_fork+0x10/0x20
> > 
> > This patch relaxs the boundary checking in kmemleak_*_phys api
> > if max_low_pfn is uninitialzed.
> > 
> > Fixes: 23c2d4 (mm: kmemleak: take a full lowmem check in
> > kmemleak_*_phy)
> > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > ---
> >  mm/kmemleak.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> > index a182f5ddaf68..6b2af544aa0f 100644
> > --- a/mm/kmemleak.c
> > +++ b/mm/kmemleak.c
> > @@ -1132,7 +1132,7 @@ EXPORT_SYMBOL(kmemleak_no_scan);
> >  void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int
> > min_count,
> >                                gfp_t gfp)
> >  {
> > -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) <
> > max_low_pfn)
> > +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn &&
> > PHYS_PFN(phys) < max_low_pfn))
> 
> Just skip checking will bring the crash possibility back. Seems it's
> beyond
> these interfaces' handle scope for this situation, since
> "min_low_pfn" and
> "max_low_pfn" are depending on arches.
> 
Yes, for the cases beyond the pfn guard, users have to take care the
boundary by themselves. 

> >                 kmemleak_alloc(__va(phys), size, min_count, gfp);
> >  }
> >  EXPORT_SYMBOL(kmemleak_alloc_phys);
> > @@ -1146,7 +1146,7 @@ EXPORT_SYMBOL(kmemleak_alloc_phys);
> >   */
> >  void __ref kmemleak_free_part_phys(phys_addr_t phys, size_t size)
> >  {
> > -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) <
> > max_low_pfn)
> > +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn &&
> > PHYS_PFN(phys) < max_low_pfn))
> >                 kmemleak_free_part(__va(phys), size);
> >  }
> >  EXPORT_SYMBOL(kmemleak_free_part_phys);
> > @@ -1158,7 +1158,7 @@ EXPORT_SYMBOL(kmemleak_free_part_phys);
> >   */
> >  void __ref kmemleak_not_leak_phys(phys_addr_t phys)
> >  {
> > -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) <
> > max_low_pfn)
> > +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn &&
> > PHYS_PFN(phys) < max_low_pfn))
> >                 kmemleak_not_leak(__va(phys));
> >  }
> >  EXPORT_SYMBOL(kmemleak_not_leak_phys);
> > @@ -1170,7 +1170,7 @@ EXPORT_SYMBOL(kmemleak_not_leak_phys);
> >   */
> >  void __ref kmemleak_ignore_phys(phys_addr_t phys)
> >  {
> > -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) <
> > max_low_pfn)
> > +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn &&
> > PHYS_PFN(phys) < max_low_pfn))
> >                 kmemleak_ignore(__va(phys));
> >  }
> >  EXPORT_SYMBOL(kmemleak_ignore_phys);
> > --
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
