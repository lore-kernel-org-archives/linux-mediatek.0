Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B74C87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbqWwHu/MN3vqLicN/YCVD8yPLwHYccLVOVJvse0Ql4=; b=Ngl3Inx1sG6UUqumV8RpIdCuao
	FjzUmKvp7o7pS0bsue/u06hdTgH/xnzWorlFJOc+o0WbuANHi68G5DYCkccJavvk+oArZINqOolzZ
	kuE5Y759rShJNtsf3mhJbWGRIRbEmaAWQGBoxAAlxduIrxKp94dBqpyreVQ2HzB6xyfQH0ADgEIJj
	WS2fjgZzPlxXj4DSXCsNnMSSWTp3Zr8MY+g4gN05j8gsi9qOjJhXGT54TpRmWozkEB4jOwmnRZRhk
	jikWtIyv6Ln60Md6Xcxbpf6TWfLrW1qqj+GkVkUNhhBacTHOGChNM4e5lZPF1fywsAm/eFiZtE3cB
	zk0LqC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLj9-0000000DSbG-0RLT;
	Tue, 05 Aug 2025 17:45:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLDU-0000000DOZt-1GHu
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Aug 2025 17:12:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-240718d5920so11575ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Aug 2025 10:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754413967; x=1755018767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbqWwHu/MN3vqLicN/YCVD8yPLwHYccLVOVJvse0Ql4=;
        b=gvVUTyL6XfZsrru5RCq6920AlXU/iTeX2Zqwv2IDXcaphmLv1i8RLIWwK/TleDAmFh
         +LWCDN+fev7BYQ0tpqr2tgJvZvrlw4g37Q0OLtgdeYZljzMCcgYIoWzY9XzRZZOFWkFj
         qAKBJPB8B+WMoHaTTGt6JxjvZaLAnFpyF5poTw5OPGrWskMpaJRkWU8r5fC83JbuCpm0
         AUMCvSnqgw5Y0/S8zNI558mImPHY+QI2GdUiD86y8mpJhiyr/nNLIcyyLwLFRHxP6WeQ
         YGq+0igv5mlaqvG1PfNFLav2yYAIsrwxhObfYJsDmq+TK5CbwzhH9bOXQVl8anY+jUgd
         VbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754413967; x=1755018767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbqWwHu/MN3vqLicN/YCVD8yPLwHYccLVOVJvse0Ql4=;
        b=LjX6HzeL9GaJhfa2AJ+k9xE+RqHI/DqOQ2eCYaXiZEnbniCLZtN+b2411WokiLCQec
         9JHlSzlEKE7H4oXete9Eie0uJm7hBXTIk21IgqpQ7WaetKqDutuEUDEFqBpUJpL/sXyf
         yWxdreYHihAFYkajgeOgbxi2g8PEfruW4yJNBq8ReDZd5NGP6e9o4ysMCLrBgOrF8mPD
         G2n+43pU4u+lN3g9Ysk6E7DwPBDOUkBulnhsSUPTGSKbzepHv0fC0EJPpIEt+3ypWqiY
         Y6zR/7glNzuYtjUg4zouJUJLu5D2SMda2zMs0STukz1c+URjUqw5oEMVqwXoGBjR9KeM
         4nqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZy9VNpd/JziG43yBCktFhzSetWg9UmvlJZ94xZpcsJ40fChLBq8Eif4hx5PV0XQSL43ZYS0tKKmcNB90Beg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXYzhjqagyyhaXeTlT96FI9TDsNG20AGnvkh233XfF6aLRFixV
	vFeydWy/xSLrp2vSbVkBm11u5nv3qTQBujjvza41hEZdiHfFlJv9U0R6S2TzZagBW1qa+T7MPdY
	lks/62H0LNV2HCYDTSfnuCfyWjpEvunGW2SDn2mCH
X-Gm-Gg: ASbGnct6w6dcgVDkujmpTN3beVASxgPH+ITftnyJ3loIjUJt9C5PzSi9Li/zaQy7Qvc
	wUXV0bhFIa7VKFsXl7D4JUk8WFLdot1mjl4XBU47RyB8Wt1U4F3oXXzWfsdJRD6q8T69rewxQMM
	pZcFHI+9EGSYkZE8RiumKJCkmrEjI6kT1EgXNO6mQxYzi08VTrfx9wULZP82QsNVeaxWSvvLMHP
	MQQPDvZZf9jGiFy+OMqn5iuMDxsfk2lI2hhfj7K
X-Google-Smtp-Source: AGHT+IFqLQ/GSA1XGpDzG6V9bPnbhZrv/PKGEBMGpW4YJVcfW/eWUxu6GeLWbRSsDGK01TuGGZ4dXbAcwThguioGfg0=
X-Received: by 2002:a17:902:fa08:b0:23f:df2c:9f0d with SMTP id
 d9443c01a7336-2428eaf87a8mr2475625ad.21.1754413967127; Tue, 05 Aug 2025
 10:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
In-Reply-To: <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 5 Aug 2025 10:12:34 -0700
X-Gm-Features: Ac12FXx118qPMOpTYedhO-FDr1Ci1_iGrsVIoyffTe-jrpJNkQjp-q60_k-xYAk
Message-ID: <CAJDx_rjvYdjPYHbBDKvkaWV=-OPJG=oRdSAugaOyJAXaOVu-9w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250805_101248_349212_30A6FCE6 
X-CRM114-Status: GOOD (  38.58  )
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
> What kinds of allocations would then use __GFP_CMA?

The __GFP_CMA allocations are used to allocate userspace anonymous memory. =
This
was done initially in the alloc_zeroed_user_highpage_movable()
function, now it is done
in vma_alloc_zeroed_movable_folio().

> (let me try guess
> one - zswap backend?)

Yep, the __GFP_CMA pages are also used in zram block driver.

Thanks
Juan

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

