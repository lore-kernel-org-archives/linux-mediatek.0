Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D819CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsEhwdLdNfwHR9LCxaWkzLk9jCaKVkk47P3wBYbLRH0=; b=H4oxaooo9mDwYTGU2zqkmwXbUP
	PcQ75vV/Mtat7Jz55kj+C5GqxIoDYDN5/r/lMNzu87zdYLw/nYEaZueXiLe7U1pMAh41fvUEuDtzc
	CQm7Bea9jdH0B58FrSqddPGUOWijE0RUgblX4qLk5cu2FGxhX7vfM+ZZQsI/Gd39D2m3oy9/UL//c
	+Xwee1+PKcHJzlkMMQmREhGo7oEgDbY5FcjpUymqXJeitRTqDjvIUZ2rgjg1LM9J18i3l4Zqk1TxE
	aHXVhDaR+oEafTjY5y8ZjOgfKileJBiZxlt2P9T2Sso+pR3g7Nz1C+iLDa5dDMOSn7Dfga54xI1Oq
	ZQuwLb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCmlI-0003a7-Ap; Sat, 16 Jul 2022 18:43:32 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCml6-0003Wt-O5; Sat, 16 Jul 2022 18:43:22 +0000
Received: by mail-qk1-f181.google.com with SMTP id n2so4559864qkk.8;
        Sat, 16 Jul 2022 11:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WsEhwdLdNfwHR9LCxaWkzLk9jCaKVkk47P3wBYbLRH0=;
        b=J3YymaQf8A98DwFKMqYswOieUnrcuQLAfu7cHI11PKaBkWXWZnKQCCv1fABwEV8Ows
         NbC+JakAW9D6svxhctVVAyggzTuj0ZCBcfIn1d/3x/lpNwL8czmAa5efZp+8/SLz8wek
         PwABSlMTVm6w+TZU1Ak6u6DehNVknbd0YbNdXbXqhSJYnmbZJMJYTZcBuHX4BbPKD9sA
         iucCV2KQw7JicBWE9yBzP9fvpA2DCVDoD64aEvhX3r8MSiR9Bw/XXUjyUL/6u/VpCgOZ
         nCE5nlpNzHKG4IW3rXmTWvlQveT3Sl43qtbH0UiDSmOEeRQJz02zZNOZLGWlCpGHTRKY
         4bTw==
X-Gm-Message-State: AJIora8Mfer7FOnfFmDbGZTmhoGk+j1js83YG8/l2QOxu7fUhr3+VLWd
	syzRM4RuUYzjK1EOvdFxwaIPy1qzQmeGMg==
X-Google-Smtp-Source: AGRyM1ttGL+pFkx155HaEIG6leoMRil9zt2J8vqAhSO3ebkaIPJ4g+OmWj08KO9/GhiacoAyRqbkGg==
X-Received: by 2002:a05:620a:4050:b0:6b5:d2bf:f570 with SMTP id i16-20020a05620a405000b006b5d2bff570mr4611783qko.421.1657996998485;
        Sat, 16 Jul 2022 11:43:18 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id dm1-20020a05620a1d4100b006b5c87e9eb1sm6456786qkb.102.2022.07.16.11.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Jul 2022 11:43:18 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id r3so13903294ybr.6;
        Sat, 16 Jul 2022 11:43:18 -0700 (PDT)
X-Received: by 2002:a05:6902:1246:b0:66e:ea31:8d05 with SMTP id
 t6-20020a056902124600b0066eea318d05mr20988380ybu.89.1657996997798; Sat, 16
 Jul 2022 11:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220628113714.7792-1-yee.lee@mediatek.com> <20220628113714.7792-2-yee.lee@mediatek.com>
 <CAMuHMdX=MTsmo5ZVa8ya3xmr4Mx7f0PB3gvFF42pdaTYB6-u5A@mail.gmail.com> <20220715163305.e70c8542d5e7d96c5fd87185@linux-foundation.org>
In-Reply-To: <20220715163305.e70c8542d5e7d96c5fd87185@linux-foundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 16 Jul 2022 20:43:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
Message-ID: <CAMuHMdWSsibmL=LauLm+OTn0SByLA4tGsbhbMsnvSRdb381RTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early
 allocated pool
To: Andrew Morton <akpm@linux-foundation.org>
Cc: yee.lee@mediatek.com, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:KFENCE" <kasan-dev@googlegroups.com>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_114320_801975_30CF5444 
X-CRM114-Status: GOOD (  32.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Sat, Jul 16, 2022 at 1:33 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> On Fri, 15 Jul 2022 10:17:43 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jun 28, 2022 at 1:42 PM <yee.lee@mediatek.com> wrote:
> > > From: Yee Lee <yee.lee@mediatek.com>
> > >
> > > This patch solves two issues.
> > >
> > > (1) The pool allocated by memblock needs to unregister from
> > > kmemleak scanning. Apply kmemleak_ignore_phys to replace the
> > > original kmemleak_free as its address now is stored in the phys tree.
> > >
> > > (2) The pool late allocated by page-alloc doesn't need to unregister.
> > > Move out the freeing operation from its call path.
> > >
> > > Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> > > Suggested-by: Marco Elver <elver@google.com>
> > > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> >
> > Thank you, this fixes the storm of
> >
> >     BUG: KFENCE: invalid read in scan_block+0x78/0x130
> >     BUG: KFENCE: use-after-free read in scan_block+0x78/0x130
> >     BUG: KFENCE: out-of-bounds read in scan_block+0x78/0x130
> >
> > messages I was seeing on arm64.
>
> Thanks, but...
>
> - It would be great if we could identify a Fixes: for this.

IIRC, I started seeing the issue with "[PATCH v4 3/4] mm:
kmemleak: add rbtree and store physical address for objects
allocated with PA" (i.e. commit 0c24e061196c21d5 ("mm: kmemleak:
add rbtree and store physical address for objects allocated
with PA")) of series "[PATCH v4 0/4] mm: kmemleak: store objects
allocated with physical address separately and check when scan"
(https://lore.kernel.org/all/20220611035551.1823303-1-patrick.wang.shcn@gmail.com),
in an arm64 config that had enabled kfence.
So I think this patch is sort of a dependency for that series.

I had cherry-picked that series after bisecting a regression to
commit 23c2d497de21f258 ("mm: kmemleak: take a full lowmem check in
kmemleak_*_phys()") in v5.18-rc3, and having a look around.

> - This patch has been accused of crashing the kernel:
>
>         https://lkml.kernel.org/r/YsFeUHkrFTQ7T51Q@xsang-OptiPlex-9020
>
>   Do we think that report is bogus?

I think all of this is highly architecture-specific...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

