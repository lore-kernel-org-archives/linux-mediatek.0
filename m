Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F48C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 19:05:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F087C23AC8
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 19:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F087C23AC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RnKdibvgPk/iLKjkeG2gseCgycBR0jcA0S11lPTQ5EY=; b=ug6dff+HJhsCHeF2KOQ51alOj
	61MgPv3gJ3vCNIKaI+KfcKzO4FIrIvA/QeN9vds6/6QCR9XHq7x3JhNSB+Hk//O7wNRhcwCCiwx2z
	kcplmoySVQEXN8AUW/6pM3S0xJEOsw2NrR6kQjKSPvJW/Am9dgrmBPP1Rrdqu3LFzXmLn4MSEuqCq
	I4ImN/ejgrRKQ89nwXrwZGdtpd/gAtOMPcm4Rg80Vqn99Uqo5YaGZ8CMqx0VJ2xeYLDZQshjO9qyd
	b7R3oa4Czq+YYLRIyjwd6hOPY0NbK2bdzxSvLbLJGhuZADEzgx/GeQ0j/UZxmQl2/cqj5701hMUep
	lVNEngyLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l31kA-0006kp-EU; Fri, 22 Jan 2021 19:05:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l31k5-0006j0-Bh; Fri, 22 Jan 2021 19:05:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCB2023AC1;
 Fri, 22 Jan 2021 19:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611342308;
 bh=+qH3gg6Meer9DE4CWsvTMl0NEy6N7sOI6C6cFplb2Ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UAhzpczDkGt+4Q3wMOMG4ZZXBOvrjUmqZqNB6yHgubCMaaFUJ6/FOXNv20BtOGbEL
 y+0kx3bop4iL/FKIG8N8x6obiAHhfyoeT2tZwJkqqiMHoV3Ll5eanEyHXSq61pADAo
 KuCY+6gOu7i7M+fEjba1vK0mXIcdQFNTowLMDJ2h3KdJDBgGUZAyd0pY8nUG9Iaota
 bsOyCWRnhpVW/I2fYed0GkkovQdB2bQ5IzATRdp2a8isQwbRqwA50nvq+AtGfCzZ4g
 gCHP89gVZ0e6MmQ0GnM4WiYyK3n6kurG0uNXOXYFvnWOjXbiNt/EOJg3yhrdYXOZgU
 Vko9JDUN8/sgA==
Date: Fri, 22 Jan 2021 19:05:01 +0000
From: Will Deacon <will@kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
Message-ID: <20210122190501.GA25471@willie-the-truck>
References: <20210109103252.812517-1-lecopzer@gmail.com>
 <CAAeHK+z3oYx4WqX7Xor7gD=eqYkzW0UBS4h4is00HnfNnNkpDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+z3oYx4WqX7Xor7gD=eqYkzW0UBS4h4is00HnfNnNkpDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_140509_522221_E038A720 
X-CRM114-Status: GOOD (  19.35  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, tyhicks@linux.microsoft.com,
 Alexander Potapenko <glider@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, yj.chiang@mediatek.com,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Guenter Roeck <linux@roeck-us.net>,
 Lecopzer Chen <lecopzer@gmail.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, Dmitry Vyukov <dvyukov@google.com>,
 gustavoars@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 21, 2021 at 06:44:14PM +0100, Andrey Konovalov wrote:
> On Sat, Jan 9, 2021 at 11:33 AM Lecopzer Chen <lecopzer@gmail.com> wrote:
> >
> > Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > ("kasan: support backing vmalloc space with real shadow memory")
> >
> > Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> > but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> > by not to populate the vmalloc area except for kimg address.
> >
> > Test environment:
> >     4G and 8G Qemu virt,
> >     39-bit VA + 4k PAGE_SIZE with 3-level page table,
> >     test by lib/test_kasan.ko and lib/test_kasan_module.ko
> >
> > It also works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL
> > and randomize module region inside vmalloc area.
> >
> >
> > [1]: commit 0609ae011deb41c ("x86/kasan: support KASAN_VMALLOC")
> >
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > Acked-by: Andrey Konovalov <andreyknvl@google.com>
> > Tested-by: Andrey Konovalov <andreyknvl@google.com>
> >
> >
> > v2 -> v1
> >         1. kasan_init.c tweak indent
> >         2. change Kconfig depends only on HAVE_ARCH_KASAN
> >         3. support randomized module region.
> >
> > v1:
> > https://lore.kernel.org/lkml/20210103171137.153834-1-lecopzer@gmail.com/
> >
> > Lecopzer Chen (4):
> >   arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC
> >   arm64: kasan: abstract _text and _end to KERNEL_START/END
> >   arm64: Kconfig: support CONFIG_KASAN_VMALLOC
> >   arm64: kaslr: support randomized module area with KASAN_VMALLOC
> >
> >  arch/arm64/Kconfig         |  1 +
> >  arch/arm64/kernel/kaslr.c  | 18 ++++++++++--------
> >  arch/arm64/kernel/module.c | 16 +++++++++-------
> >  arch/arm64/mm/kasan_init.c | 29 +++++++++++++++++++++--------
> >  4 files changed, 41 insertions(+), 23 deletions(-)
> >
> > --
> > 2.25.1
> >
> 
> Hi Will,
> 
> Could you PTAL at the arm64 changes?

Sorry, wanted to get to this today but I ran out of time in the end. On the
list for next week!

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
