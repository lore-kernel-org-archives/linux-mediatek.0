Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A87C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 17:19:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4836B64EE4
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 17:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4836B64EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nEcJXYQTAaZMxWMrDuYkKBDJKDDlCKd1Z7TYH4Mx25Q=; b=ZazZnzSO8mg2IrmUda1InMznW
	8IIcx1E7JpBBSBihbIOHctUKVF2DQtF/+NKULy27LNIYlIF0APYub8tQ8QciFpQf1ZVmu7QbN8yLE
	tOgcU2UiDf5PDarvbMq/mex5qgvfcm22O/iB1dyjhhYb3Xl07AhZRynxt17wZNobT/kSNUtjNHhaM
	SUIOQ8duCiJfn36jgW9YjSg7ho2X5jeVEnMkNkXEREiHbb3JiiYJDWQr3Ydp8WUDtxzTGNTJXG/Py
	JHmtgUAYjks9jOS3P1D7IGNJWuQ3JcNFYBJNq2pxgiPXxI3yU1O4RV3eNmwfit9MXziWwhMDnFNcL
	Bg/WhhGpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l84lE-0003Ij-FA; Fri, 05 Feb 2021 17:19:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l84lA-0003I3-RC; Fri, 05 Feb 2021 17:19:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0B5C64F2A;
 Fri,  5 Feb 2021 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612545546;
 bh=GD1HJWPDL+WDon52gpUBIOF+4zUWtcYiATH9iQBxbMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fynDnKT1Ph8pNPVtE+r4TaxtbWbISD93iQOUxv4KO0WokE4jpHIDc5+QI58U3LhKQ
 6MkPrX5qwJo0QSx/TsLiTb/lH+TgHhOWLnLQ/Uu2j/mWq/bEYVX1fv6dQ8OzKo2M/9
 5VjkT5TSKuLvHR8rYH95fb6LkpdIkkPRq4/I6ns3Jsr1R/jR07PUHdr2AEgGpe5nva
 iyKGnB5Opg5bShOZX0uPaaxnqrL8msH5GOMYBCSJxP/Pl7nX2AN4ffWatBfuLs8YeR
 DDgJmOrpi+bmXnOSgM850qIknyAZ3nCr9dNnBTkNEU2Y2p/eOtRWJg1rln3MIhy19d
 3QYZ+CtsToJFg==
Date: Fri, 5 Feb 2021 17:18:59 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
Message-ID: <20210205171859.GE22665@willie-the-truck>
References: <20210204150100.GE20815@willie-the-truck>
 <20210204163721.91295-1-lecopzer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204163721.91295-1-lecopzer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_121909_057740_462B88ED 
X-CRM114-Status: GOOD (  32.48  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 05, 2021 at 12:37:21AM +0800, Lecopzer Chen wrote:
> =

> > On Thu, Feb 04, 2021 at 10:46:12PM +0800, Lecopzer Chen wrote:
> > > > On Sat, Jan 09, 2021 at 06:32:49PM +0800, Lecopzer Chen wrote:
> > > > > Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > > > > ("kasan: support backing vmalloc space with real shadow memory")
> > > > >
> > > > > Like how the MODULES_VADDR does now, just not to early populate
> > > > > the VMALLOC_START between VMALLOC_END.
> > > > > similarly, the kernel code mapping is now in the VMALLOC area and
> > > > > should keep these area populated.
> > > > >
> > > > > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > > > > ---
> > > > > =A0arch/arm64/mm/kasan_init.c | 23 ++++++++++++++++++-----
> > > > > =A01 file changed, 18 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_ini=
t.c
> > > > > index d8e66c78440e..39b218a64279 100644
> > > > > --- a/arch/arm64/mm/kasan_init.c
> > > > > +++ b/arch/arm64/mm/kasan_init.c
> > > > > @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
> > > > > =A0{
> > > > > =A0 u64 kimg_shadow_start, kimg_shadow_end;
> > > > > =A0 u64 mod_shadow_start, mod_shadow_end;
> > > > > + u64 vmalloc_shadow_start, vmalloc_shadow_end;
> > > > > =A0 phys_addr_t pa_start, pa_end;
> > > > > =A0 u64 i;
> > > > >
> > > > > @@ -223,6 +224,9 @@ static void __init kasan_init_shadow(void)
> > > > > =A0 mod_shadow_start =3D (u64)kasan_mem_to_shadow((void *)MODULES=
_VADDR);
> > > > > =A0 mod_shadow_end =3D (u64)kasan_mem_to_shadow((void *)MODULES_E=
ND);
> > > > >
> > > > > + vmalloc_shadow_start =3D (u64)kasan_mem_to_shadow((void *)VMALL=
OC_START);
> > > > > + vmalloc_shadow_end =3D (u64)kasan_mem_to_shadow((void *)VMALLOC=
_END);
> > > > > +
> > > > > =A0 /*
> > > > > =A0 =A0* We are going to perform proper setup of shadow memory.
> > > > > =A0 =A0* At first we should unmap early shadow (clear_pgds() call=
 below).
> > > > > @@ -241,12 +245,21 @@ static void __init kasan_init_shadow(void)
> > > > >
> > > > > =A0 kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_=
END),
> > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void =
*)mod_shadow_start);
> > > > > - kasan_populate_early_shadow((void *)kimg_shadow_end,
> > > > > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void *)=
KASAN_SHADOW_END);
> > > > > + if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> > > >
> > > > Do we really need yet another CONFIG option for KASAN? What's the u=
se-case
> > > > for *not* enabling this if you're already enabling one of the KASAN
> > > > backends?
> > >
> > > As I know, KASAN_VMALLOC now only supports KASAN_GENERIC and also
> > > KASAN_VMALLOC uses more memory to map real shadow memory (1/8 of vmal=
loc va).
> >
> > The shadow is allocated dynamically though, isn't it?
> =

> Yes, but It's still a cost.
> =

> > > There should be someone can enable KASAN_GENERIC but can't use VMALLOC
> > > due to memory issue.
> >
> > That doesn't sound particularly realistic to me. The reason I'm pushing=
 here
> > is because I would _really_ like to move to VMAP stack unconditionally,=
 and
> > that would effectively force KASAN_VMALLOC to be set if KASAN is in use.
> >
> > So unless there's a really good reason not to do that, please can we ma=
ke
> > this unconditional for arm64? Pretty please?
> =

> I think it's fine since we have a good reason.
> Also if someone have memory issue in KASAN_VMALLOC,
> they can use SW_TAG, right?
> =

> However the SW_TAG/HW_TAG is not supported VMALLOC yet.
> So the code would be like
> =

> 	if (IS_ENABLED(CONFIG_KASAN_GENERIC))

Just make this CONFIG_KASAN_VMALLOC, since that depends on KASAN_GENERIC.

> 		/* explain the relationship between =

> 		 * KASAN_GENERIC and KASAN_VMALLOC in arm64
> 		 * XXX: because we want VMAP stack....
> 		 */

I don't understand the relation with SW_TAGS. The VMAP_STACK dependency is:

	depends on !KASAN || KASAN_HW_TAGS || KASAN_VMALLOC

which doesn't mention SW_TAGS at all. So that seems to imply that SW_TAGS
and VMAP_STACK are mutually exclusive :(

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
