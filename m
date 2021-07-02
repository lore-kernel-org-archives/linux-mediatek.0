Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1CBC11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 15:50:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3B0613F7
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 15:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3B0613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfmLg7Bw9B0EH/WxILNN+bKMdp+gJXggfUnLcjf6XHY=; b=UKS9UESJrn6aRj
	3BJJHJnHSya87K/h47kUK/mAvhdZCaEccnEXK7WTg1flxtsV7xS4r35k2VtVLXSagY0CsAxQ129cG
	1WuZ7EeWV/yaLqKxvahDy6opnPSDUkmG+wHw9U6DVTGEJKESB+I4d+sdJb804ik9Yu1cI+RBAWQh3
	OfjvJlzs8NSk96++OW7+qUryokXOkCWJ9k9KeV1VAFbWEr0XWfXd6cL7yQ4jEWZ8qoowTFLqrbvrA
	k7G1UFNhukJKJwnW4cSucewI8Nqk5CiPTBIQl8RPw7mlEkC2GCwnCdXmtXkUs6AE/0MXJHWLpiBW9
	8SGAh180OwwamAW31I0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzLQm-003SaQ-Eg; Fri, 02 Jul 2021 15:50:16 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzLQj-003SZD-3v
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 15:50:14 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id i18so17024012yba.13
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qA8VgGLlkFB/PkXrTcenc5nCOSnabAFGt5bfyGsdlu8=;
 b=UHAD63/yXxCyyYZYt5IZFX/NsDNvW4cR5o2wVYjbiQ6AjisFxLh0wGLMLupHuV/4D5
 IAj2LSmJORVGCrv6nvGAm5hxHadjS/g5q/u2P3kWtvT9gzSVbRGv3yauLrPRgpLtpI4X
 pJU+c3BTU0sTEKQeCJschfl9lvMknix5kF8vs6qQzDbGuJOdjOdje2+5zZuMNzdjOEVP
 URrVCOhgrExl+pan77E/WpJISnX9HqoCif8YCk7mr7ffpKNqp1KbOH/S2I0ugooD5nAY
 TTCOLEVjWW9odiUGCiVUrWX703n52/KvH5gii53SyXcJDJ0T6m4bunAjJVQe03Zu8E+c
 OFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qA8VgGLlkFB/PkXrTcenc5nCOSnabAFGt5bfyGsdlu8=;
 b=bcJR0TOxuUifIy+umxjYKpqTJjWfwa+1SX9KXpOr24l3C+urROpEAdnI296wnLKNM+
 e9pAP2gNRk8AcJrWZHhMIoTHlqbQdaY4FMjuWnLtXBWN/Wm2MR3ok+SlcWCzz5C7srD3
 P0Zc+HX6xZkjl1VkBVqbwfCXBXPuhkqF8UZMA4kZzMesoGunldf3PcBHHPtT+PLSsG64
 HdoHFDQ/+/gr2DbqkXs8lLltVHxuX2P8Kkbzr0kl06MZs7KXFdVswT05DG5JYN2XMSaj
 W+F0tzfMurZ0XApkNAazxNp1QpTR30hCUgD+D3MIYjbgebZqkTLwo+uit8/wyDVivNcp
 iApw==
X-Gm-Message-State: AOAM533CSZBgrH0UbWJV7bqOz+gFKcchOnMR9toSsUWA/Z7XGxccQ2cF
 5C/PwW+Alf50NJuDn6DYbTJNsJtT814ZRaTxPuDLfQ==
X-Google-Smtp-Source: ABdhPJyHntmDdthDS54GlrPzHQ5DU3ubq3o9deXw/J4JZCB+oThlJ84A/mgRALRtY9H9RW2IUIiTvRopgvhh63Oji0U=
X-Received: by 2002:a25:9945:: with SMTP id n5mr77710ybo.294.1625241010145;
 Fri, 02 Jul 2021 08:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210630205151.137001-1-surenb@google.com>
 <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
 <CAJuCfpF=Ty4ruiKQQweVoF6Ojx8P8LxvUBxp1TmMFo2W1xNWfg@mail.gmail.com>
 <YN3pUNgpBjn42f8s@hirez.programming.kicks-ass.net>
 <CAJuCfpFKDhcgjU=MGsz+JuetrWvYCe0EL3FMp91zopH+8T=mMQ@mail.gmail.com>
 <YN7cJZOZzjYJFClR@hirez.programming.kicks-ass.net>
In-Reply-To: <YN7cJZOZzjYJFClR@hirez.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 2 Jul 2021 08:49:59 -0700
Message-ID: <CAJuCfpHbZ2ShG02OfXzBfm7vvzCUTeP1qoTzgicGOrPh9W+5Gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
To: Peter Zijlstra <peterz@infradead.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Ingo Molnar <mingo@redhat.com>, 
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Benjamin Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>, matthias.bgg@gmail.com, 
 Minchan Kim <minchan@google.com>, Tim Murray <timmurray@google.com>, 
 YT Chang <yt.chang@mediatek.com>,
 =?UTF-8?B?V2VuanUgWHUgKOiuuOaWh+S4vik=?= <wenju.xu@mediatek.com>, 
 =?UTF-8?B?Sm9uYXRoYW4gSk1DaGVuICjpmbPlrrbmmI4p?=
 <jonathan.jmchen@mediatek.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel-team <kernel-team@android.com>, 
 SH Chen <show-hong.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_085013_230074_E836A787 
X-CRM114-Status: GOOD (  25.10  )
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

On Fri, Jul 2, 2021 at 2:28 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jul 01, 2021 at 09:28:04AM -0700, Suren Baghdasaryan wrote:
> > On Thu, Jul 1, 2021 at 9:12 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Thu, Jul 01, 2021 at 09:09:25AM -0700, Suren Baghdasaryan wrote:
> > > > On Thu, Jul 1, 2021 at 1:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > > >
> > > > > On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> > > > > > +     /* cmpxchg should be called even when !force to set poll_scheduled */
> > > > > > +     if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
> > > > > >               return;
> > > > >
> > > > > Why is that a cmpxchg() ?
> > > >
> > > > We want to set poll_scheduled and proceed with rescheduling the timer
> > > > unless it's already scheduled, so cmpxchg helps us to make that
> > > > decision atomically. Or did I misunderstand your question?
> > >
> > > What's wrong with: atomic_xchg(&group->poll_scheduled, 1) ?
> >
> > Yes, since poll_scheduled can be only 0 or 1 atomic_xchg should work
> > fine here. Functionally equivalent but I assume atomic_xchg() is more
> > efficient due to no comparison.
>
> Mostly conceptually simpler; the cmpxchg-on-0 makes that you have to
> check if there's ever any state outside of {0,1}. The xchg() thing is
> the classical test-and-set pattern.
>
> On top of all that, the cmpxchg() can fail, which brings ordering
> issues.

Oh, I see. That was my mistake. I was wrongly assuming that all RMW
atomic operations are fully ordered but indeed, documentation states
that:
```
- RMW operations that have a return value are fully ordered;
- RMW operations that are conditional are unordered on FAILURE,
   otherwise the above rules apply.
```
So that's the actual functional difference here. Thanks for catching
this and educating me!

>
> Typically, I think, you want to ensure that everything that happens
> before psi_schedule_poll_work() is visible to the work when it runs
> (also see Johannes' email).

Correct and I think I understand now the concern Johannes expressed.

> In case poll_scheduled is already 1, the
> cmpxchg will fail and *NOT* provide that ordering. Meaning the work
> might not observe the latest changes. xchg() doesn't have this subtlety.

Got it.
So I think the modifications needed to this patch is:
1. replacing atomic_cmpxchg(&group->poll_scheduled, 0, 1) with
atomic_chg(&group->poll_scheduled, 1)
2. an explicit smp_mb() barrier right after
atomic_set(&group->poll_scheduled, 0) in psi_poll_work().

I think that should ensure the correct ordering here.
If you folks agree I'll respin v3 with these changes (or maybe I
should respin and we continue discussion with that version?).

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
