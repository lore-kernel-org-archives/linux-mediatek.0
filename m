Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D66C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 08:07:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 843E4608FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 08:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 843E4608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fs08ILZha5RnxePDyh0Rmm9SafIJtRjwxUuKLzk5A8c=; b=1M0dnJfjbMmo47
	QxTPBTj8rlmsM7gpnXucWR0gAPAdQbYY3bMEu5aUsB43cp3D963kDIC/EFJwmdirbaS2aZe8MZz27
	zf+QPsmzVsmPzOJFQau8k8qAJlDOl/zf6fBKyvKjwA0G95YpW5DAvH08xhXxFy4YOr/Fh9sYAl3KB
	Z5aGOnlSH2hcc7RFpn5KPNlpW1/og8td0QEenvULr9YVNr/FTc76WGkXsah2Q2uP864j11eptp4hi
	wynJcKrBrYVOXRQmLJYgJA8yJvaDT8THOwhRa+EJ8PR0vjxijxnMWK5XBg1Qf16eE3m9k2UImFHva
	XKyJ1e/BJ8OYftZ8xzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md6JQ-003hyh-Po; Wed, 20 Oct 2021 07:47:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md6JN-003hxJ-GA; Wed, 20 Oct 2021 07:46:59 +0000
X-UUID: ab7d06ff4c2a4e91b5625756ad4b8e90-20211020
X-UUID: ab7d06ff4c2a4e91b5625756ad4b8e90-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 951724190; Wed, 20 Oct 2021 00:46:55 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 00:46:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Oct 2021 15:46:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Oct 2021 15:46:40 +0800
Message-ID: <c0d7c2aa14cc569d5ad95dc750bb6cc1727a042c.camel@mediatek.com>
Subject: Re: [PATCH v2] kasan: add kasan mode messages when kasan init
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
Date: Wed, 20 Oct 2021 15:46:40 +0800
In-Reply-To: <CANpmjNNxQRM5rSxcdxNOicpOvwQ=vsutQO3j1hUmGAfS9+pQDA@mail.gmail.com>
References: <20211020061248.13270-1-Kuan-Ying.Lee@mediatek.com>
 <CANpmjNNxQRM5rSxcdxNOicpOvwQ=vsutQO3j1hUmGAfS9+pQDA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_004657_594673_842DA127 
X-CRM114-Status: GOOD (  28.10  )
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

On Wed, 2021-10-20 at 15:23 +0800, Marco Elver wrote:
> On Wed, 20 Oct 2021 at 08:13, Kuan-Ying Lee <
> Kuan-Ying.Lee@mediatek.com> wrote:
> > 
> > There are multiple kasan modes. It makes sense that we add some
> > messages
> > to know which kasan mode is when booting up. see [1].
> > 
> > Link: 
> > https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?id=212195__;!!CTRNKA9wMg0ARbw!yylpqk8mnd0N8w6pn4Mn4sIeu-GGlKXcA4I4yXlmstFsuqmpkhaM2V_uu2c6oPMFpZRqoQ$
> > $  [1]
> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> > ---
> > change since v2:
> >  - Rebase to linux-next
> >  - HW-tags based mode need to consider asymm mode
> >  - Thanks for Marco's suggestion
> > 
> >  arch/arm64/mm/kasan_init.c |  2 +-
> >  mm/kasan/hw_tags.c         |  4 +++-
> >  mm/kasan/kasan.h           | 10 ++++++++++
> >  mm/kasan/sw_tags.c         |  2 +-
> >  4 files changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/kasan_init.c
> > b/arch/arm64/mm/kasan_init.c
> > index 5b996ca4d996..6f5a6fe8edd7 100644
> > --- a/arch/arm64/mm/kasan_init.c
> > +++ b/arch/arm64/mm/kasan_init.c
> > @@ -309,7 +309,7 @@ void __init kasan_init(void)
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
> > index dc892119e88f..1d5c89c7cdfe 100644
> > --- a/mm/kasan/hw_tags.c
> > +++ b/mm/kasan/hw_tags.c
> > @@ -177,7 +177,9 @@ void __init kasan_init_hw_tags(void)
> >                 break;
> >         }
> > 
> > -       pr_info("KernelAddressSanitizer initialized\n");
> > +       pr_info("KernelAddressSanitizer initialized (hw-tags,
> > mode=%s, stacktrace=%s)\n",
> > +               kasan_mode_info(),
> > +               kasan_stack_collection_enabled() ? "on" : "off");
> >  }
> > 
> >  void kasan_alloc_pages(struct page *page, unsigned int order,
> > gfp_t flags)
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index aebd8df86a1f..387ed7b6de37 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -36,6 +36,16 @@ static inline bool
> > kasan_sync_fault_possible(void)
> >  {
> >         return kasan_mode == KASAN_MODE_SYNC || kasan_mode ==
> > KASAN_MODE_ASYMM;
> >  }
> > +
> > +static inline const char *kasan_mode_info(void)
> > +{
> > +       if (kasan_mode == KASAN_MODE_ASYNC)
> > +               return "async";
> > +       else if (kasan_mode == KASAN_MODE_ASYMM)
> > +               return "asymm";
> > +       else
> > +               return "sync";
> > +}
> 
> This creates an inconsistency, because for
> kasan_stack_collection_enabled(), kasan_async_fault_possible(), and
> kasan_sync_fault_possible() there are !KASAN_HW_TAGS stubs.
> 
> A stub for kasan_mode_info() if !KASAN_HW_TAGS appears useless
> though,
> and I wouldn't know what its return value should be.
> 
> Do you expect this helper to be used outside hw_tags.c? If not,
> perhaps just move it into hw_tags.c.

The helper will be used only in hw_tags.c.
I will move it into hw_tags.c in v3.

Thanks.

> 
> Thanks,
> -- Marco


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
