Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6596DC47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 10:39:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30513206F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 10:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c812aNSj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="mqCzMPdN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30513206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdkD6jqAxvV6l1KXL3JSqa4P0D+iOZ4K2hX12bLGtz8=; b=c812aNSjUZGGgy
	RbxeLXHYL5daLQFLEOrHnOUwKZ2I6tNNJQHSd7iiD+Tj/skM7iG6LtA6+pBFnm89huSOHDRc3Y70E
	LpxEFgoz55t/EEtrY20zeNgDJlX54WOBYjLLq7mJN3K3/KBoIMSez/BfXau5Hjb/s902fqEGBMj6i
	tw4Zmd9QMHwXSuJNJY2ZwWgpI02GEF29m9RQnOXMaO9vQBrJYqC3mGHIugVP2aBDkuaJYDj7zSlNF
	3b9k5kR4+tCNdozWEjqogAqcO24IgTc73nna/fYGTux+R2tHxovhrUkvdSInQnTZOoTuJbEAbJj7i
	qyMS/0JHdNLHb3iFwaKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY5pm-0006vp-IE; Mon, 11 May 2020 10:38:54 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY5pe-0006nW-6G
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 10:38:47 +0000
Received: by mail-qt1-x841.google.com with SMTP id z90so7442486qtd.10
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 03:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uf04Bplo4VLk4LrjpEdz9FsKxhkP+ZdN12Hn8z8gR3k=;
 b=mqCzMPdN1teGg+bTUJ01IQPzCKWAyY17rXaBqjFXSPbHfTK6eVvfpfhpRGaGtPu+so
 iv6Jd3DU9G0rPUCR44eqM9VMiVhXQIUY4PSxySOMunDn7pPZiNpTE8QVn0gklug4tYtL
 HhxyJGVKSCzbVbUBfSexUl29cX/iFDCHXNBoyFYW1CsI18YThM3pKlwl72PNt3AjZolH
 /avPwS+NyEJL+Kshm6XR1HRSQDQ5ObnJ37DttPS1Bh+ugYOMsAJGHM8M8aUCU/iGQ611
 B2GlRrMt09krd7851/RYyF3ez8kweAYOugm5MtHHlGE2cFq18qlesvNwgwhgIwZ7MF18
 notg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uf04Bplo4VLk4LrjpEdz9FsKxhkP+ZdN12Hn8z8gR3k=;
 b=NVqTUGGQ7afluTYGD1PvR5Xx+GLOgIo++pXR76IR9w8hGkUnLNuyGVX7BgapTAj7X1
 aSvHZabgvDcGl+oqNOwMr+rq1tCI7Km0CHs4uuos4+ffFPflsF9KX7uqJtzqXmPI+uKc
 W9fdoOV23TDWhz6ADLeZM8Zwcilc1iVxySKWNrAEqbsvVMF4XVGXcdYnfMSslLEA9sh2
 bcNkfkozR/b8jNGmHFOz3fchbwJ50al5QgCENUDp43k6IxHAQl0jT4QImuXhJ0NC+SWc
 jeWfc3w4ifwsDgDeLgK2/FLDU2QNoz+VSkyGiFX/UMR30Pw89WwXQKXkmoF1PQbUfpKb
 gz9A==
X-Gm-Message-State: AGi0PuY9y3wHdDjKdPZMTCXgJZ8iI7Ej5eB3k81CLO4FJIRigpE844eq
 cF2F/BAvxBSPuO+Q41wPXAyKjPUrYoyKhiwNrrIaHA==
X-Google-Smtp-Source: APiQypKA80aT7+91W0G/UAG3ToBMU16CEkrdAIjzMcXXPQQBDIf2vVmju/g34hV4WYzwqrhQjb6qWRfjMFJ+BMKUNlw=
X-Received: by 2002:ac8:6c24:: with SMTP id k4mr15495561qtu.257.1589193524519; 
 Mon, 11 May 2020 03:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200511022359.15063-1-walter-zh.wu@mediatek.com>
 <CACT4Y+aC4i8cAVFu2-s82RczWCjYMpPVJLwS0OBLELR9qF8SYg@mail.gmail.com>
 <1589193126.2930.2.camel@mtksdccf07>
In-Reply-To: <1589193126.2930.2.camel@mtksdccf07>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 11 May 2020 12:38:32 +0200
Message-ID: <CACT4Y+b16+-R=nQs-x1iDBZwBZKgJWf22Q=o1MvqkGP+8ybzmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kasan: memorize and print call_rcu stack
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_033846_259527_F2EDA0E0 
X-CRM114-Status: GOOD (  25.01  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2020 at 12:32 PM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> On Mon, 2020-05-11 at 12:01 +0200, 'Dmitry Vyukov' via kasan-dev wrote:
> > On Mon, May 11, 2020 at 4:24 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> > >
> > > This patchset improves KASAN reports by making them to have
> > > call_rcu() call stack information. It is useful for programmers
> > > to solve use-after-free or double-free memory issue.
> >
> > Hi Walter,
> >
> > I am looking at this now.
> >
> > I've upload the change to gerrit [1]
> > https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2458
> >
> > I am not capable enough to meaningfully review such changes in this format...
> >
> > [1] https://linux.googlesource.com/Documentation
> >
>
> Hi Dmitry,
>
> I don't fully understand your meaning, our patchset's format has
> problem? or?

No, it does not have any problems. Your patch format is standard for kernel.

It's just complex patches in the standard kernel format that are hard
to review for me.


> > > The KASAN report was as follows(cleaned up slightly):
> > >
> > > BUG: KASAN: use-after-free in kasan_rcu_reclaim+0x58/0x60
> > >
> > > Freed by task 0:
> > >  save_stack+0x24/0x50
> > >  __kasan_slab_free+0x110/0x178
> > >  kasan_slab_free+0x10/0x18
> > >  kfree+0x98/0x270
> > >  kasan_rcu_reclaim+0x1c/0x60
> > >  rcu_core+0x8b4/0x10f8
> > >  rcu_core_si+0xc/0x18
> > >  efi_header_end+0x238/0xa6c
> > >
> > > First call_rcu() call stack:
> > >  save_stack+0x24/0x50
> > >  kasan_record_callrcu+0xc8/0xd8
> > >  call_rcu+0x190/0x580
> > >  kasan_rcu_uaf+0x1d8/0x278
> > >
> > > Last call_rcu() call stack:
> > > (stack is not available)
> > >
> > > Generic KASAN will record first and last call_rcu() call stack
> > > and print two call_rcu() call stack in KASAN report.
> > >
> > > This feature doesn't increase the cost of memory consumption. It is
> > > only suitable for generic KASAN.
> > >
> > > [1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
> > > [2]https://groups.google.com/forum/#!searchin/kasan-dev/better$20stack$20traces$20for$20rcu%7Csort:date/kasan-dev/KQsjT_88hDE/7rNUZprRBgAJ
> > >
> > > Changes since v2:
> > > - remove new config option, default enable it in generic KASAN
> > > - test this feature in SLAB/SLUB, it is pass.
> > > - modify macro to be more clearly
> > > - modify documentation
> > >
> > > Walter Wu (3):
> > > rcu/kasan: record and print call_rcu() call stack
> > > kasan: record and print the free track
> > > kasan: update documentation for generic kasan
> > >
> > > Documentation/dev-tools/kasan.rst |  6 ++++++
> > > include/linux/kasan.h             |  2 ++
> > > kernel/rcu/tree.c                 |  4 ++++
> > > lib/Kconfig.kasan                 |  2 ++
> > > mm/kasan/common.c                 | 26 ++++----------------------
> > > mm/kasan/generic.c                | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
> > > mm/kasan/kasan.h                  | 23 +++++++++++++++++++++++
> > > mm/kasan/report.c                 | 47 +++++++++++++++++++++--------------------------
> > > mm/kasan/tags.c                   | 37 +++++++++++++++++++++++++++++++++++++
> > > 9 files changed, 149 insertions(+), 48 deletions(-)
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200511022359.15063-1-walter-zh.wu%40mediatek.com.
> >
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1589193126.2930.2.camel%40mtksdccf07.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
