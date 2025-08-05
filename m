Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF60FC87FD1
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0RxCTsXFF8391IAhRwoPNmaelsxs5V8yAF1l14fxkk=; b=iovqGcuSoOlnFw3WUkIDNQVUi5
	NiIuqmC7zvr6AJqdIvo/SX/E7clg4sfDA3IEzzFMYvZyCYSxACW45Q7Qy5g10fyawng2hXSQX6Is9
	l7O/0X2Wd7nPI5L8HFXZb/jN1ll2zckKQuNkMLce7fsODGJGyOwSwp2x+OCTyJiovDfe0P7iGfDxn
	Xe+3nkOWqYPOwLt7dLwl/jnQJWjWCSh0FJ4sl471fT/Oh39iP7fjnJs6dCPKN2+g3H48HORM9OZeh
	qD6T9/ILslOFvqhJkfydAtOA5KaMa9W3+I3+rSFpft7PmD8ezMTNkS0tdTVxSsUaNHVBfdb8j4Mn7
	IvForPcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLJK-0000000DPTZ-2ZZC;
	Tue, 05 Aug 2025 17:18:50 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKoF-0000000DKwS-3L14
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Aug 2025 16:46:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-240708ba498so2575ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Aug 2025 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754412403; x=1755017203; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0RxCTsXFF8391IAhRwoPNmaelsxs5V8yAF1l14fxkk=;
        b=Fl/E54D+bBWEaaxt9+gU55NA2Rkx5UUPd9hfMiY2tlhXmIfOsS0yrmFQ6rQ8T24TRe
         p0IBfQvG/f3KO1KzsCgmjLlArUU7LHsoaADHgAWV36t21HOdTh9HQKgiFLoTH6zV6WS6
         QfonLYoaQ5VxcsW1sP1tShFFelSxXKzGPqMCUgWzHLR6OJ7eae27kLCBw3r6IhCzy8Go
         WButdJycen1YYFnUwGSV2nr6vUOPYl4zD7425acDjPhOMegRHoVw4zid4nJdrIgUnrEl
         02I21SptX1peAnOjXdGVDjx4QKTvus9iiYj6zTRv0P8qj/uY6Ar//gCzyQFMYlYu0Z3q
         lwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412403; x=1755017203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0RxCTsXFF8391IAhRwoPNmaelsxs5V8yAF1l14fxkk=;
        b=BFxiDjubBbd9yWNUVerZphEqHwabkbSUFlfHK099qhe0FwhpgZSdNKr3IRWda9bawC
         Sto7j2cRHX+4yC0iEYZA+4sIPvgLW2GS9RbJ/vZYA2qJAbbyq+6/e5CxVmRMojFKSV0o
         CHSdbPrft2P6U9izfSTu2+GHi9TcV68jdKJEEYi7nvb027jdT02mzqXkxIAeIvQoAj3S
         6lC9ub6EUmtv6fOLE4BrmlYiDhJtltQtj5SOgkwStOpWldbqZoXTEprTzf5UYhG/tGsj
         aDtfMVILrW6qONm/EUTFgVYPZTQA6QeB5EN5Zc9HAj/da+UEBcbmk22rnOVxoi3OoDB9
         QCGA==
X-Forwarded-Encrypted: i=1; AJvYcCWbGldirSQ7pjkWckq+P3I8ckbxlQ7R+MYZUOMtAeZKwCKctm+RREcvaNt3c1iK/V5SUVjFAVsJ5naokq9eHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHzQQQ8RFh9+s641WnMIw+8k57h3zLvRYQjoVhNFri3nA2WUdn
	RrVbdRAeP4Dkw3qD6fO1neZucQ86MKVor4fdKh/v3VZOdS4fuH9eNo06LCeLsERx+onsOm/H1sF
	DUUlU3zTfOgwSkYD8wKk06McTSgNO029rSzqoiqKW
X-Gm-Gg: ASbGncvLWiaPKmWhKbhgV99BF0V1pnlR/FTj6966ESXCCVd7rN4MCD4OyE2xeDpMxcY
	zdSZoAOlCTcuIy77enfnktNhP14WYxrTBFOA1+cfWRzDy+cnxC1vzzh3cEsz6EBjqehwZ5npHb9
	/sQqRwMlSDH64Utge30FtzUeuFKxJgJofCNBijXMdLHp/Ab2558nVp+jf0OY0UC47UKlsvbxBTa
	oU6NRcP7owc2Bqvn1REjYoDcJSE/ffzHJGY0NVR
X-Google-Smtp-Source: AGHT+IFbtH6J0AjO4QU4T/tefsfeSE0rL1OzSJr1N/DUHjvBaYU77HeoyM1+WKB2X0d+93TslMU104SV+ZAQGFLorx8=
X-Received: by 2002:a17:902:ea02:b0:234:afcf:d9e8 with SMTP id
 d9443c01a7336-2428e9ca60bmr3484235ad.7.1754412402595; Tue, 05 Aug 2025
 09:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
In-Reply-To: <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 5 Aug 2025 09:46:30 -0700
X-Gm-Features: Ac12FXy4BT6ZbkseE6fl0wteJa2HqcPFNTVMsUS4ZZOo4qkH5jwtMaLF9Pp-ohE
Message-ID: <CAJDx_rjxGff38aS_MBwgh6LpDqp6G4zjUvg6tr73KU0HYfGvXA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, akash.tyagi@mediatek.com, 
	Andrew Morton <akpm@linux-foundation.org>, angelogioacchino.delregno@collabora.com, 
	hannes@cmpxchg.org, Brendan Jackman <jackmanb@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, wsd_upstream@mediatek.com, Zi Yan <ziy@nvidia.com>, 
	Kalesh Singh <kaleshsingh@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_094643_841281_0DFA6C52 
X-CRM114-Status: GOOD (  38.56  )
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

On Tue, Aug 5, 2025 at 2:52=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 8/5/25 3:22 AM, Juan Yescas wrote:
> > On Mon, Aug 4, 2025 at 11:50=E2=80=AFAM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 04.08.25 20:20, Juan Yescas wrote:
> >>> Hi David/Zi,
> >>>
> >>> Is there any reason why the MIGRATE_CMA pages are not in the PCP list=
s?
> >>>
> >>> There are many devices that need fast allocation of MIGRATE_CMA pages=
,
> >>> and they have to get them from the buddy allocator, which is a bit
> >>> slower in comparison to the PCP lists.
> >>>
> >>> We also have cases where the MIGRATE_CMA memory requirements are big.
> >>> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 5=
00MiBs.
> >>> These cases would benefit if we have THPs for CMAs.
> >>>
> >>> Could we add the support for MIGRATE_CMA pages on the PCP and THP lis=
ts?
> >>
> >> Remember how CMA memory is used:
> >>
> >> The owner allocates it through cma_alloc() and friends, where the CMA
> >> allocator will try allocating *specific physical memory regions* using
> >> alloc_contig_range(). It doesn't just go ahead and pick a random CMA
> >> page from the buddy (or PCP) lists. Doesn't work (just imagine having
> >> different CMA areas etc).
> >>
> >> Anybody else is free to use CMA pages for MOVABLE allocations. So we
> >> treat them as being MOVABLE on the PCP.
> >>
> >> Having a separate CMA PCP list doesn't solve or speedup anything, real=
ly.
> >>
> >
> > Thanks David for the quick overview.
> >
> >> I still have no clue what this patch here tried to solve: it doesn't
> >> make any sense.
> >>
> >
> > The story started with this out of tree patch that is part of Android.
> >
> > https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeaurora.o=
rg/T/#u
> >
> > This patch introduced the __GFP_CMA flag that allocates pages from
> > MIGRATE_MOVABLE
> > or MIGRATE_CMA.
>
> What kinds of allocations would then use __GFP_CMA? (let me try guess
> one - zswap backend?)
>
> > What it happens then, it is that the MIGRATE_MOVABLE
> > pages in the
> > PCP lists were consumed pretty fast. To solve this issue, the PCP
> > MIGRATE_CMA list was added.
> > This list is initialized by rmqueue_bulk() when it is empty. That's
> > how we end up with the PCP MIGRATE_CMA list
> > in Android. In addition to this, the THP list for MIGRATE_MOVABLE was
> > allowed to contain
> > MIGRATE_CMA pages. This is causing THP MIGRATE_CMA pages to be used
> > for THP MIGRATE_MOVABLE
> > making later allocations from THP MIGRATE_CMA to fail.
>
> If you don't want THP's to use the large (THP-sized) MIGRATE_CMA pages,
> what kind of such large allocations would be ok to use MIGRATE_CMA then?

The large THP MIGRATE_CMA allocs are used by GPUs or devices that require
large chunks of memory (have many cameras for example).


> > These workarounds are mainly because we need to solve this issue upstre=
am:
> >
> > - When devices reserve big blocks of MIGRATE_CMA pages, the
> > underutilized MIGRATE_CMA
> > can fall back to MIGRATE_MOVABLE and these pages can be pinned, so if
> > we require MIGRATE_CMA
> > pages, the allocations might fail.
> >
> > I remember that you presented the problem in LPC. Were you able to
> > make some progress on that?
> >
> > Thanks
> > Juan
> >
> >
> >
> >
> >
> >> --
> >> Cheers,
> >>
> >> David / dhildenb
> >>
>

