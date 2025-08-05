Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B6DC87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEnVU5KAskdWYUBQ/kSGgyrV9wf/VcctSOFlUiJlPrU=; b=CaSSibp/zZOcU+rrytJPqSFH3C
	J6obW6tNU5jbAD/Zls00XDITfyC06XgeuYuvur9Ht8SA4W+O2b/kYVVP7ekctVrxKLcaAtaKUBxhT
	4KqesFuZ7+PraRgWjJfsCcJ7XzRV8zasT/5uWg9s4KIjdQTPhchGhyclA9VOua/Ss7NddqAQzQ0ez
	l3qtf/VgWre7+x7HlRhu/rJeWglKInHuh19c5OQQXIgblmFo+RGpaAjiW3BL0Y0XM1lKu0wKLBr+R
	ZuXJ+8HoyH+hVoejUmIqBiv1OqM8jHUD71RvJwVQ7kH/c/QLQ3rMKqCwRPCfBSlRbnT1z6DQsfdWF
	h5mZu6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLJK-0000000DPTd-3pG8;
	Tue, 05 Aug 2025 17:18:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKz3-0000000DMC6-2IYg
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Aug 2025 16:57:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-240718d5920so6835ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Aug 2025 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754413073; x=1755017873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEnVU5KAskdWYUBQ/kSGgyrV9wf/VcctSOFlUiJlPrU=;
        b=iHFUhNOL4/D9b76xmWPrNP09bH87ft/2CW9ILMOrw4pDvLwWtYKFcK6L5+DR4jQ5YI
         6oa1anoO5OlD7mUnSjFEHB2wEhA+hWd2WoW1qMRIMYiRFnGrj6RCOdBKb2uvwMOyiF7J
         mL67/WkNM0YyktsHp4+/ar0ShnDUieXtePe6Yex0TjEELEffV7CAzam0WYCCgkCUp4Dm
         Vuws4trRnTu/NyUysyz5989nsG9LufVNvASuOYR/04lq7Ao1i3kVTkbeWaIxqM3VjeWz
         8CftrxoHxRN4tN5zRt8cBVI2MzTGrCekqhMQ3GWphgAdZnhPPHan8U4haskKTnjGd0WU
         lcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754413073; x=1755017873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEnVU5KAskdWYUBQ/kSGgyrV9wf/VcctSOFlUiJlPrU=;
        b=jjhsNsvzuHvtqkMK0zTsmOjGajPJ7dYs7nmqz8a3T7t9fMm8mAhYui+s9VdEqTjNd5
         pCrT3nfvz+u553B/IvBGl/zdp+mBAkddb+vDlwVPn86Tq5QWfDK17Zt7cUOMWM4nJ4YX
         M0BPCD8qGcgxGx2oy+DNIUUwmBT2If2ijbUj1AzU/25yZnc7EHdXZSzfyi2BSUlaOxua
         FS4/j9CIFMqWtBxXGmrIfRTjxDtluHkDbgGjW0Mjtv+/MAJZRmicv0nFthvA1mk+3uDR
         JApYHfn2EERNBMF9x7vOwaT3Tsss6EjzfdJpz1A3a/jN3RJ2eSej66jc9Z+vUZuGfNmI
         ZA7g==
X-Forwarded-Encrypted: i=1; AJvYcCW9o/IG5BaN65wLVZaYd8ReHegP8BGxNhoLmBg4ZU3nMMvqGI3EIc44YT6nQjghx4Se3WyUnRHBwff6Coigmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgIVrWRjIw+Xq2SdVFXWcFt9f8vU4Lf/YHX6SgtOjVSjT41J09
	02ns+T2K07f1ZyQo7zu7I5c8I6l0gZydQE3VyQDXrPQqjnbf5ZzckgVU0WDs72wLOzAXjxCYfT+
	Cr95iDRrUjgEexN2+AZ1ENXlmGvW05m6ciftwp8zt
X-Gm-Gg: ASbGnctUT9uRdQbx++MnOkWY7deNDMh8YzdEL6tFXUJCj9q8sRAlz2MMiW84HarqB8Z
	loBRVZuO2qMl1Nfs3RS5aoT+SQm7KhdjCJH/tthQ4RZ3NCWGlaKOy9QfD4a7XIu0zLgcBQyPUpz
	9CVe078rgdnMX2L8mdEn4D++g5pW08smMHKsqJdGnT4FYD1wjtQg98mjJggYzt7uZmgkTjmXeG9
	noS4jJK3vpVwn03Wi3RgrDZ074lZ9uolXo8khE6
X-Google-Smtp-Source: AGHT+IFHALxRLkmhDed/lnhoMX9pMKBECdTY93R6Sdw6v3eSIKnTQjB+1XTGHNMoRl1Mtb+hpgpseJBwvLL9afKRuuU=
X-Received: by 2002:a17:903:41c9:b0:240:a4b5:fe0d with SMTP id
 d9443c01a7336-2428e9d9866mr3490245ad.6.1754413072472; Tue, 05 Aug 2025
 09:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <486c5773-c7fa-4e19-b429-90823ed2f7d5@redhat.com>
In-Reply-To: <486c5773-c7fa-4e19-b429-90823ed2f7d5@redhat.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 5 Aug 2025 09:57:39 -0700
X-Gm-Features: Ac12FXwewq6mHJ3iXKimK9YdL07pdhlid5gd2fFisX11Nn-jXdYL26T35WBbNug
Message-ID: <CAJDx_ri==3SxFcuKXHpNjrtxbp0hLyhM+zXeJ-LQX38rfbUChw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: David Hildenbrand <david@redhat.com>
Cc: akash.tyagi@mediatek.com, Andrew Morton <akpm@linux-foundation.org>, 
	angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org, 
	Brendan Jackman <jackmanb@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, wsd_upstream@mediatek.com, 
	Zi Yan <ziy@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Isaac Manjarres <isaacmanjarres@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_095753_604292_9811DA95 
X-CRM114-Status: GOOD (  41.07  )
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

On Tue, Aug 5, 2025 at 2:58=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 05.08.25 03:22, Juan Yescas wrote:
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
> > or MIGRATE_CMA. What it happens then, it is that the MIGRATE_MOVABLE
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
> Okay, so this patch here really is not suitable for the upstream kernel
> as is. It's purely targeted at the OOT Android patch.
>
Right, it is a temporary solution for the pinned MIGRATE_CMA pages.

> >
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
>
> There is the problem of CMA pages getting allocated by someone for a
> MOVABLE allocation, to then short-term pin it for DMA. Long-term
> pinnings are disallowed (we just recently fixed a bug where we
> accidentally allowed it).
>
Nice, it is great the issue got caught and fixed upstream :)

> One concern is that a steady stream of short-term pinnings can turn such
> pages unmovable. We discussed ideas on how to handle that, but there is
> no solution upstream yet.

Are there any plans to continue the discussion? Is it in the priority
list? Maybe
a topic we can discuss in LPC Japan?

Thanks
Juan

>
> --
> Cheers,
>
> David / dhildenb
>

