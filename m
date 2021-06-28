Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E2C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 06:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1539619B6
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 06:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1539619B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldEmdVbwx9SzsmY69RSLq1Fv+EwqZ39fCULIkmBLAKI=; b=Iri0PJY7qDb/Ds
	0I2aDGzB6/cPUskhZDM5L8GpwrpQsLBbRkbhrxjQyIZ52P3yPkGGu9hUcyVhSr2seo/ex7dKX1HC2
	vmF40FfTAF3WrugWVX/eJZ/vKGfpYmZM4QY+1hC3pJeUCRDblDvyXYQjTqICmHSzNgxj1OKl/A166
	9L5M3YEji6imm6q/Kmu7OpSoFn1WvPsXAA6tVPhxaDxnxfRMuotjW7qzUqfsLWL13dok/1r3Qydyc
	r7OLeQFttbrn6hamGmYvGCgb/z43XUqBuU93Oaqnz8ZGMTtCpq4BG5cz1nTRRKLaj3+FOsqmUNKVJ
	Rt9wXNTXeRxNNpKsnrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxkfB-006yFg-JP; Mon, 28 Jun 2021 06:22:33 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxkf7-006yEf-Cm; Mon, 28 Jun 2021 06:22:32 +0000
X-UUID: 4371a7860cfd4fd7aab000378361a653-20210627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MoVeeFN8QQduQIE2H+ETIc4pO/33E9CcY+5cMgsP0BY=; 
 b=gc2ngFb968wy8cJhrv6QO0ABMdAAmlZ79R9M7Y6LD6ODZq0dj8A7ZlYUzhLZqhzcqYFMi/3J9SXkR0XxGgSSdBKExoMrnppDtKd0WboKElV8OGRveb+K40MObeoektCtceQTKqIIxP6o43VEN4TzIv4ReEYG/XGcHatHL6ul3Io=;
X-UUID: 4371a7860cfd4fd7aab000378361a653-20210627
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 965119736; Sun, 27 Jun 2021 23:22:26 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Jun 2021 23:19:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 14:19:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Jun 2021 14:19:33 +0800
Message-ID: <1147252f497e5529de8215486b184af649ac0a0e.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] kasan: Add memzero init for unaligned size under
 SLUB debug
From: Yee Lee <yee.lee@mediatek.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Mon, 28 Jun 2021 14:19:33 +0800
In-Reply-To: <CA+fCnZe0fng4-53U1=5MiYszCMi97twKut3eQNaNHgPV2HOVug@mail.gmail.com>
References: <20210624112624.31215-1-yee.lee@mediatek.com>
 <20210624112624.31215-2-yee.lee@mediatek.com>
 <CA+fCnZe0fng4-53U1=5MiYszCMi97twKut3eQNaNHgPV2HOVug@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_232229_493024_56A9F9CB 
X-CRM114-Status: GOOD (  23.58  )
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

On Fri, 2021-06-25 at 17:03 +0300, Andrey Konovalov wrote:
> On Thu, Jun 24, 2021 at 2:26 PM <yee.lee@mediatek.com> wrote:
> > 
> > From: Yee Lee <yee.lee@mediatek.com>
> > 
> > Issue: when SLUB debug is on, hwtag kasan_unpoison() would
> > overwrite
> > the redzone of object with unaligned size.
> > 
> > An additional memzero_explicit() path is added to replacing init by
> > hwtag instruction for those unaligned size at SLUB debug mode.
> > 
> > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > ---
> >  mm/kasan/kasan.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index 8f450bc28045..d1054f35838f 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -387,6 +387,12 @@ static inline void kasan_unpoison(const void
> > *addr, size_t size, bool init)
> > 
> >         if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
> >                 return;
> > +#if IS_ENABLED(CONFIG_SLUB_DEBUG)
> 
> Is this an issue only with SLUB? SLAB also uses redzones.
As I known, hw-tag kasan only works with SLUB.

> 
> > +       if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> 
> This needs a comment along the lines of:
> 
> /* Explicitly initialize the memory with the precise object size to
> avoid overwriting the SLAB redzone. This disables initialization in
> the arch code and may thus lead to performance penalty. The penalty
> is
> accepted since SLAB redzones aren't enabled in production builds. */
Sure, will work on this.
> 
> > +               init = false;
> > +               memzero_explicit((void *)addr, size);
> > +       }
> > +#endif
> >         size = round_up(size, KASAN_GRANULE_SIZE);
> > 
> >         hw_set_mem_tag_range((void *)addr, size, tag, init);
> > --
> > 2.18.0
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
