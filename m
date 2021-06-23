Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F00C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:31:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66EEA611AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66EEA611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ju9nTXHdF37cTfoi5ksa2ry6JxvkRHOzGSat74m6Lw=; b=X2p7+gkGThb2K+
	HUq04x1vUWXi53EvOnCciuxHaK3QzyxoAvA8TnGuCx6YyHxXr5p3Du8F12Sh73MTPCUc6xcaYjahH
	MiOo4JWGY97zbX9XyXF58kCyh4Po8u3qGgJ2A/Y0leb9OhKudyWWbIMnPS+7oxW6+9rQngCSCN2R/
	ovsWDTykuEOv3wm1Knbyc+osh/FbRGdSU68wEP1wHBRwdAS7QwEv9X1ApuI81eQlZ3uteKhgjzBY7
	TfZ+FB8e/n1095411o3y9tW/jPFU/46c8azkcMeHsPwhB9Lfp5K4fQGa/p6JE/VzXlnNdBwcZwYuK
	bSeL8t6Rq6Oahgd+t3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxME-009keX-OM; Wed, 23 Jun 2021 07:31:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxMB-009kaU-Qv; Wed, 23 Jun 2021 07:31:33 +0000
X-UUID: f34e4a78e46a456086ced5e9b537c6f4-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WaJYFsLLz2Mjmi3C64qa1RVI/b2GIwG6q2aJoTCrFsY=; 
 b=YpZi2ZnuLQFubBx+7Zq2NLlvWAhr+eRUWKMEB2nlk8EIgXkCpefFBjHwxlBnhXEtUQpL9acsCEETIkIspg+8NNjTPkksH/DfJrHGJYtGrb7DfUYvGftjsYUvR4sKSJlo8GEYUAJqSpmKNpc5VwfzvpEvQUZkcEcbAlOdomRBnF8=;
X-UUID: f34e4a78e46a456086ced5e9b537c6f4-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1574929425; Wed, 23 Jun 2021 00:31:28 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:31:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:31:24 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:31:24 +0800
Message-ID: <c874a47557ec256664e4cf0914a5e9840a335fe2.camel@mediatek.com>
Subject: Re: [PATCH] kasan: unpoison use memset to init unaligned object size
From: Yee Lee <yee.lee@mediatek.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Marco Elver <elver@google.com>
Date: Wed, 23 Jun 2021 15:31:24 +0800
In-Reply-To: <CA+fCnZdPwKZ9GfhTYPpWGVEO7bS6sSrh8cioZmRJet2maUjSVQ@mail.gmail.com>
References: <20210621154442.18463-1-yee.lee@mediatek.com>
 <CA+fCnZdPwKZ9GfhTYPpWGVEO7bS6sSrh8cioZmRJet2maUjSVQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_003131_951402_C7C87B7A 
X-CRM114-Status: GOOD (  26.43  )
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

On Tue, 2021-06-22 at 17:03 +0300, Andrey Konovalov wrote:
> On Mon, Jun 21, 2021 at 6:45 PM <yee.lee@mediatek.com> wrote:
> > 
> > From: Yee Lee <yee.lee@mediatek.com>
> > 
> > This patch adds a memset to initialize object of unaligned size.
> > Duing to the MTE granulrity, the integrated initialization using
> > hwtag instruction will force clearing out bytes in granular size,
> > which may cause undesired effect, such as overwriting to the
> > redzone
> > of SLUB debug. In this patch, for the unaligned object size,
> > function
> > uses memset to initailize context instead of the hwtag instruction.
> > 
> > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > ---
> >  mm/kasan/kasan.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index 8f450bc28045..d8faa64614b7 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -387,8 +387,11 @@ static inline void kasan_unpoison(const void
> > *addr, size_t size, bool init)
> > 
> >         if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
> >                 return;
> > +       if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> > +               init = false;
> > +               memset((void *)addr, 0, size);
> > +       }
> 
> With this implementation, we loose the benefit of setting tags and
> initializing memory with the same instructions.
> 
> Perhaps a better implementation would be to call
> hw_set_mem_tag_range() with the size rounded down, and then
> separately
> deal with the leftover memory.

Yes, this fully takes the advantage of hw instruction. 
However, the leftover memory needs one more hw_set_mem_tag_range() for
protection as well.

If the extra path is only executed as CONFIG_SLUB_DEBUG, the
performance lost would be less concerned.

> 
> >         size = round_up(size, KASAN_GRANULE_SIZE);
> > -
> >         hw_set_mem_tag_range((void *)addr, size, tag, init);
> >  }
> > 
> > --
> > 2.18.0
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
