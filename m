Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD9AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 14:35:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE5C6115A
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 14:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AE5C6115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdRuzQeVmm6+/zvG9VVmHx+6uKxW9e+ZmxQCgYYDw30=; b=NmQC879Jp1+Hky
	86SDqC+vIfBVPZUR7BnUCAuypZetsnmIfCX8dN1aDyHVu26EgF4c47BHHBibNcCJ4Mx0/oxrAKXlN
	/jhKW7p4wHPcNk1j1enbc6LPcm+bjDbScp2bzW5dw5AlPt9NyUpJxSNe/8+bBaYXcWjiEfpbTRIZ9
	zCNPP78lu0nUhUvconC8TnOPdrIJhZGqaHFuac+7fUQoYfl/3JRZompioVZDwnMxTSz4RzFCGXXRH
	hFzQBV9EFdVAvyDUapp4dRs0flsJo7/Gzj57fPbSyAPJd/Y9mfVdirFDqNC2KkoxpJWLXCB3NIh72
	Tny3b+5hYkNQZFhpm6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcqD3-001YEA-Cf; Tue, 19 Oct 2021 14:35:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcqD0-001YD1-QV; Tue, 19 Oct 2021 14:35:20 +0000
X-UUID: 8f4ca49bce20494baad6894570d250c3-20211019
X-UUID: 8f4ca49bce20494baad6894570d250c3-20211019
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1113352660; Tue, 19 Oct 2021 07:35:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Oct 2021 07:33:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 19 Oct 2021 22:33:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Oct 2021 22:33:53 +0800
Message-ID: <294ac8c4fa2e7fcad8376a82193b8e2430a4032a.camel@mediatek.com>
Subject: Re: [PATCH] kasan: add kasan mode messages when kasan init
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Marco Elver <elver@google.com>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chinwen Chang
 =?UTF-8?Q?=28=E5=BC=B5=E9=8C=A6=E6=96=87=29?= <chinwen.chang@mediatek.com>,
 Yee Lee =?UTF-8?Q?=28=E6=9D=8E=E5=BB=BA=E8=AA=BC=29?= <Yee.Lee@mediatek.com>, 
 Nicholas Tang =?UTF-8?Q?=28=E9=84=AD=E7=A7=A6=E8=BC=9D=29?=
 <nicholas.tang@mediatek.com>, "kasan-dev@googlegroups.com"
 <kasan-dev@googlegroups.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Date: Tue, 19 Oct 2021 22:33:54 +0800
In-Reply-To: <CANpmjNMMQUHhFTdaqfx6HErnv0aXkCJn+eBGN-kfeznN8H+f3g@mail.gmail.com>
References: <20211019120413.20807-1-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNMMQUHhFTdaqfx6HErnv0aXkCJn+eBGN-kfeznN8H+f3g@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_073518_906367_20271CB4 
X-CRM114-Status: GOOD (  20.17  )
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

On Tue, 2021-10-19 at 22:14 +0800, Marco Elver wrote:
> On Tue, 19 Oct 2021 at 14:04, Kuan-Ying Lee <
> Kuan-Ying.Lee@mediatek.com> wrote:
> > 
> > There are multiple kasan modes. It make sense that we add some
> > messages
> > to know which kasan mode is when booting up. see [1].
> > 
> > Link: 
> > https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?id=212195__;!!CTRNKA9wMg0ARbw!374SjX0W47zTqp1xJyIg9CW0T7ggAT1rr981lIRBjQhUk2_495ltG_ZkiW6jmeVDBvu_UA$
> > $  [1]
> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> 
> Looks good, however, you need to rebase to -next because of "kasan:
> Extend KASAN mode kernel parameter"...

Thanks Marco.
I will send the v2.

> 
> > ---
> >  arch/arm64/mm/kasan_init.c | 2 +-
> >  mm/kasan/hw_tags.c         | 4 +++-
> >  mm/kasan/sw_tags.c         | 2 +-
> >  3 files changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/kasan_init.c
> > b/arch/arm64/mm/kasan_init.c
> > index 61b52a92b8b6..b4e78beac285 100644
> > --- a/arch/arm64/mm/kasan_init.c
> > +++ b/arch/arm64/mm/kasan_init.c
> > @@ -293,7 +293,7 @@ void __init kasan_init(void)
> >         kasan_init_depth();
> >  #if defined(CONFIG_KASAN_GENERIC)
> >         /* CONFIG_KASAN_SW_TAGS also requires kasan_init_sw_tags().
> > */
> > -       pr_info("KernelAddressSanitizer initialized\n");
> > +       pr_info("KernelAddressSanitizer initialized (generic)\n");
> >  #endif
> >  }
> > 
> > diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> > index 05d1e9460e2e..3e28ecbe1d8f 100644
> > --- a/mm/kasan/hw_tags.c
> > +++ b/mm/kasan/hw_tags.c
> > @@ -168,7 +168,9 @@ void __init kasan_init_hw_tags(void)
> >                 break;
> >         }
> > 
> > -       pr_info("KernelAddressSanitizer initialized\n");
> > +       pr_info("KernelAddressSanitizer initialized (hw-tags,
> > mode=%s, stacktrace=%s)\n",
> > +               kasan_flag_async ? "async" : "sync",
> 
> ... which means this will have a 3rd option "asymm".

Thanks for the reminder.

> 
> > +               kasan_stack_collection_enabled() ? "on" : "off");
> >  }
> > 
> >  void kasan_alloc_pages(struct page *page, unsigned int order,
> > gfp_t flags)
> > diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> > index bd3f540feb47..77f13f391b57 100644
> > --- a/mm/kasan/sw_tags.c
> > +++ b/mm/kasan/sw_tags.c
> > @@ -42,7 +42,7 @@ void __init kasan_init_sw_tags(void)
> >         for_each_possible_cpu(cpu)
> >                 per_cpu(prng_state, cpu) = (u32)get_cycles();
> > 
> > -       pr_info("KernelAddressSanitizer initialized\n");
> > +       pr_info("KernelAddressSanitizer initialized (sw-tags)\n");
> >  }
> > 
> >  /*
> > --
> > 2.18.0
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
