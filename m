Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF742C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 07:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uto9EobkP0WojhVEjYvx1l88xfjdKMI1uMfZ8YaCROA=; b=2KiAOirWU3x0LSBYhoqviopTAT
	LVq+5KLFnHKTTDgxgnciFWABB0hzbcf0ZFhB2EidZozA8lNhUhgvXHpyT9ESOwPuZ3K75dYrWbgVH
	+6BlK3lrFP8kgvSiATq2bIJuchVZePRgEq01hnjwBsumbCU5GDRR45VXYg9TAtFupMu8lPJaQUTb3
	OJdOsWCmuBkVz0J6YYaoDjsiZUDokbRbrQHqE2ZdvEWrw8t0lgGMZ0l1B0WONGrJFF65xoNaOYfRa
	jEiBkCldIz9Bx2yx227aPGcpnirrZHweeAgZ5YzwrgYCfpwPbp/m/aoZv4a2AoJzJwhkn/JSwN+3P
	64zxoEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65c6-004wsI-4r; Tue, 28 Jun 2022 07:26:22 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65c3-004wpx-7l
	for linux-mediatek@lists.infradead.org; Tue, 28 Jun 2022 07:26:21 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id r3so20752603ybr.6
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jun 2022 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uto9EobkP0WojhVEjYvx1l88xfjdKMI1uMfZ8YaCROA=;
        b=Zz5NixJh4HJgTIb06YIHJ94O3w+bu9++8ykqNoJ7fswmaU/CogyoQemUpL4HQKbb+T
         OjCOIAz+3l61bxJ8zkx+mJy6EMi5jYAZBRKouXO+BOaVx8WI3bfDtV/swlON6xZv3KZ/
         Ca9+015+kkJZet6dOzqR5WKm8DlC+YRoxXM0+wUiFg8/WL6qY66oR7vtgflo6KcNqVKy
         DQUUBLXDPBoe7+xd7Z9s/J2f7wMYzeugSjDgEN+8EQX1nPKQ3GXQPB147XgA4aw6EBVV
         IOJVgDbdIJa5R+XxWlyqMoJwJkSrMcFOXfOSiFtfdR5nygSGOn8iSl7+E4/y2LFaikdG
         fl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uto9EobkP0WojhVEjYvx1l88xfjdKMI1uMfZ8YaCROA=;
        b=fo9xBEvrUp2t1ZqAAcUUor+v3sLbUfB7WQkPIcJu92DYl/dfDKmIpNIllqGkd5cokM
         BdJqpEVBGdjTDCcEQG96VYjU2kAEnCB/KSiewcUFcEHxf0LA5a2P56UWA0B1O6cq0bOt
         /KdEnL4bsWJ3L/cGmq4Vj0wAbYAh9RYqyXvQRObB87mv2p6bxKTOFHYG64NNQHNxy084
         cIM4fgPJiUL7sVlWNH+Ytg5jP9IOu7aM2XbAk/Bx2tDfuMTgfgx9sAEgbkD+hj+ybjVd
         fHYjUM6iUrGOM6d5Cfw0TNa0LN+nbnPAG/iqKNjfmZQdVpjcoBOG0wUaMwVxNUvV2lRN
         CncQ==
X-Gm-Message-State: AJIora8uLzvdf85zFI6FVaIN4Bc88JyFYfZVAdSHepbSR/uunP7LyE9h
	9LitdA8sO8EhSVpNDsNffki2kEnh8UY09vIT2Fp+tw==
X-Google-Smtp-Source: AGRyM1tZja++4yw/IpQxXTZiryi9L5L9Yt0HSZ5XaTnNZlRVpDGyOYTD7gaikjK7+HID7PVRqz/St568tOu+kmjg+pQ=
X-Received: by 2002:a25:3497:0:b0:66c:c013:4bea with SMTP id
 b145-20020a253497000000b0066cc0134beamr10903346yba.625.1656401173876; Tue, 28
 Jun 2022 00:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220623111937.6491-1-yee.lee@mediatek.com> <20220623111937.6491-2-yee.lee@mediatek.com>
 <CANpmjNN-jsZoVmJWD2Dz6O3_YVjy0av6e0iD-+OYXpik1LbLvg@mail.gmail.com>
 <bdfd039fbde06113071f773ae6d5635ff4664e2c.camel@mediatek.com>
 <CANpmjNPfkFjUteMCDzUSPmTKbpnSfjmWqp9ft8vb-v=B8eeRKw@mail.gmail.com> <9c6fcb1c178a923f2406466a3f9f2345e4e7a1c1.camel@mediatek.com>
In-Reply-To: <9c6fcb1c178a923f2406466a3f9f2345e4e7a1c1.camel@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 28 Jun 2022 09:25:37 +0200
Message-ID: <CANpmjNOADG3UqC+6aGEmfh5kzaiaqjGTFieUonC=_XwOophJ+g@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: kfence: skip kmemleak alloc in kfence_pool
To: Yee Lee <yee.lee@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:KFENCE" <kasan-dev@googlegroups.com>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_002619_317881_1A1430D5 
X-CRM114-Status: GOOD (  32.37  )
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

On Tue, 28 Jun 2022 at 08:41, Yee Lee <yee.lee@mediatek.com> wrote:
>
> On Fri, 2022-06-24 at 10:28 +0200, Marco Elver wrote:
>
> On Fri, 24 Jun 2022 at 10:20, 'Yee Lee' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
>
>
> On Thu, 2022-06-23 at 13:59 +0200, Marco Elver wrote:
>
> On Thu, 23 Jun 2022 at 13:20, yee.lee via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
>
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> Use MEMBLOCK_ALLOC_NOLEAKTRACE to skip kmemleak registration when
> the kfence pool is allocated from memblock. And the kmemleak_free
> later can be removed too.
>
>
> Is this purely meant to be a cleanup and non-functional change?
>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
>
> ---
>  mm/kfence/core.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 4e7cd4c8e687..0d33d83f5244 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -600,14 +600,6 @@ static unsigned long kfence_init_pool(void)
>                 addr += 2 * PAGE_SIZE;
>         }
>
> -       /*
> -        * The pool is live and will never be deallocated from this
> point on.
> -        * Remove the pool object from the kmemleak object tree, as
> it would
> -        * otherwise overlap with allocations returned by
> kfence_alloc(), which
> -        * are registered with kmemleak through the slab post-alloc
> hook.
> -        */
> -       kmemleak_free(__kfence_pool);
>
>
> This appears to only be a non-functional change if the pool is
> allocated early. If the pool is allocated late using page-alloc, then
> there'll not be a kmemleak_free() on that memory and we'll have the
> same problem.
>
>
> Do you mean the kzalloc(slab_is_available) in memblock_allc()? That
> implies that MEMBLOCK_ALLOC_NOLEAKTRACE has no guarantee skipping
> kmemleak_alloc from this. (Maybe add it?)
>
>
> No, if KFENCE is initialized through kfence_init_late() ->
> kfence_init_pool_late() -> kfence_init_pool().
>
> Thanks for the information.
>
> But as I known, page-alloc does not request kmemleak areas.
> So the current kfence_pool_init_late() would cause another kmemleak warning on unknown freeing.
>
> Reproducing test: (kfence late enable + kmemleak debug on)
>
> / # echo 500 > /sys/module/kfence/parameters/sample_interval
> [  153.433518] kmemleak: Freeing unknown object at 0xffff0000c0600000
> [  153.433804] CPU: 0 PID: 100 Comm: sh Not tainted 5.19.0-rc3-74069-gde5c208d533a-dirty #1
> [  153.434027] Hardware name: linux,dummy-virt (DT)
> [  153.434265] Call trace:
> [  153.434331]  dump_backtrace+0xdc/0xfc
> [  153.434962]  show_stack+0x18/0x24
> [  153.435106]  dump_stack_lvl+0x64/0x7c
> [  153.435232]  dump_stack+0x18/0x38
> [  153.435347]  kmemleak_free+0x184/0x1c8
> [  153.435462]  kfence_init_pool+0x16c/0x194
> [  153.435587]  param_set_sample_interval+0xe0/0x1c4
> [  153.435694]  param_attr_store+0x98/0xf4
> [  153.435804]  module_attr_store+0x24/0x3c
> [  153.435910]  sysfs_kf_write+0x3c/0x50
> ...(skip)
> [  153.444496] kfence: initialized - using 524288 bytes for 63 objects at 0x00000000a3236b01-0x00000000901655d3
> / #
>
> Hence, now there are two issues to solve.
> (1) (The original)To prevent the undesired kmemleak scanning on the kfence pool. As Cataline's suggestion, we can just apply kmemleak_ignore_phys instead of free it at all.
> ref: https://lore.kernel.org/linux-mm/YrWPg3xIHbm9bFxP@arm.com/
>
> (2) The late-allocated kfence pool doesn't need to go through kmemleak_free. We can relocate the opeartion to kfence_init_pool_early() to seperate them.
> That is, kfence_init_pool_early(memblock) has it and kfence_init_pool_late(page alloc) does not.
>
> The draft is like the following.

Looks reasonable - feel free to send v2.

Thanks,
-- Marco

