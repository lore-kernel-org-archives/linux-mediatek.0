Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23526C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 15:55:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D72BE61874
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 15:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D72BE61874
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pG2ExzuPy/A/tL6JwAE8UzaNPa3ZLB3DP4YNIWJt6RM=; b=TDFc36Bqji1GEr
	2xGNvbmF7jdQXOXJtI2er3Jw+HR16by7ed+RrLMCik/th1+59KSikHIJIVYwO/HcgBb7mnDrB7IeZ
	FYGDjO7wnGGBnqpzn4rFMQ/C3c8mSdj992qfGzv1UMNXQcAzVhhvl/0iYfs8ww43Th3pLiGaOToK/
	7HNWQjFKPGogE9Kd/WUoFqRZxtYKabzpEnkxd3yvMvJ5AzB7vt4IwyDMlbeTF91ejfHTe5upmjk6f
	KW4PLzF6b+aEmRfKAgT2Tk56mvguZxOKzutOMD3oIT757QdShNQhcAxhrXlB44oHuCz0krwAt5Esk
	e/RtpmRwSnFUPSnOUMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1WMq-00HKzo-5Z; Thu, 08 Jul 2021 15:55:12 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1WMn-00HKyQ-LA
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 15:55:11 +0000
Received: by mail-yb1-xb30.google.com with SMTP id k184so9669076ybf.12
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UdkOmJakgL6063lK1x5OJ+9bILb67jEBJSct2Tiyn8=;
 b=eaPCqjssketnN5rcQLUSWjDvRGpF6oO3dJ1xJVgD8FabxO6oIBvzFsHhHN9dnJw6Uv
 4Jka7MrqpRDLVfQKWAntEr2fjDPnojnKDY83XlsUDZlPkTDd0qndi+tmpqQraYDImEvn
 pDQpdBr5WznvEabCqJ8SI9LR5EvC7TmVpWhwzW6t0+/28xIcmn+M4wT1EcbnzwKkGZep
 XEdJtmQl28GDBAAyVym9Wa725bjHP+NEZ6bqbIVkX6E5+PJRLapypmvkE2Z6gGpGaRoJ
 D+E6jFvDSp0Bv3faEEKpZNJrjlbtiQHQg1EqbUTNvReu3qzuiPxT1KnGErgeCL72dVkM
 uRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UdkOmJakgL6063lK1x5OJ+9bILb67jEBJSct2Tiyn8=;
 b=stEAFnIUKf1RMG+IUoKB7YLTN1BlIqQPxLacCk8nxxKTDgm9l3SOybRY8z3ERS8Ktm
 s7+Pm/IEYwrEii8++SjmAgcirjFvbwZIJa3OxAzVExkF+n5OQPVRdQofj9iPrnd1/Zgh
 Va9iPLRFtZydyhx78Syc29B7Eqr3xvdfEsA9OkOgx5/B1bB4QsAFXWjCnohYvXxnCKkf
 /t9l3rFsPXxqOH38/uBvCY6qvDHWnbPQA92pcR4UeejcR5iTqSn8qkhYvAMa3sFS4p3V
 f/jZqUWUzFxNrgwJjyngBVFPkEKnFo/0aQVNF5PlEnxk9sxCXqKzYM5r8rtmk5N3Auzd
 pzEQ==
X-Gm-Message-State: AOAM532tUgkQ/GLpJn44C5XVSM7bfA3tLLZlkT9BlE2KOXCv/ieLYKCR
 2yBvEj0/ZOyQiHOWrbRv1E0GwKkkJTKnUe5B1/mdmA==
X-Google-Smtp-Source: ABdhPJwwYOeIjOxVMM4ucNHcKJaI3EruSvnu73J6ySxh3Gu3vHUzq8ZicQy+g1ddtn1UGOnk8q/XGE31GxROTVekW+A=
X-Received: by 2002:a25:4102:: with SMTP id o2mr38235336yba.23.1625759707575; 
 Thu, 08 Jul 2021 08:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210707023933.1691149-1-surenb@google.com>
 <YOWugYxQ9Yfsqba2@cmpxchg.org>
 <CAJuCfpGx22iTaDGCfOrM_pD6PYZqQrni2+u5jQy+NpNeNg7B9w@mail.gmail.com>
 <YOcPUs97epJ5VrEf@cmpxchg.org>
In-Reply-To: <YOcPUs97epJ5VrEf@cmpxchg.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 Jul 2021 08:54:56 -0700
Message-ID: <CAJuCfpFCi6fa+Ke4bvP9hbMeC82VaT6twNWC3+ckXz6yD0qCtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
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
X-CRM114-CacheID: sfid-20210708_085509_772380_2C0C7F08 
X-CRM114-Status: GOOD (  48.92  )
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

 t

On Thu, Jul 8, 2021 at 7:44 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Wed, Jul 07, 2021 at 03:43:48PM -0700, Suren Baghdasaryan wrote:
> > On Wed, Jul 7, 2021 at 6:39 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > >
> > > This looks good to me now code wise. Just a comment on the comments:
> > >
> > > On Tue, Jul 06, 2021 at 07:39:33PM -0700, Suren Baghdasaryan wrote:
> > > > @@ -559,18 +560,14 @@ static u64 update_triggers(struct psi_group *group, u64 now)
> > > >       return now + group->poll_min_period;
> > > >  }
> > > >
> > > > -/* Schedule polling if it's not already scheduled. */
> > > > -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> > > > +/* Schedule polling if it's not already scheduled or forced. */
> > > > +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> > > > +                                bool force)
> > > >  {
> > > >       struct task_struct *task;
> > > >
> > > > -     /*
> > > > -      * Do not reschedule if already scheduled.
> > > > -      * Possible race with a timer scheduled after this check but before
> > > > -      * mod_timer below can be tolerated because group->polling_next_update
> > > > -      * will keep updates on schedule.
> > > > -      */
> > > > -     if (timer_pending(&group->poll_timer))
> > > > +     /* xchg should be called even when !force to set poll_scheduled */
> > > > +     if (atomic_xchg(&group->poll_scheduled, 1) && !force)
> > > >               return;
> > >
> > > This explains what the code does, but not why. It would be good to
> > > explain the ordering with poll_work, here or there. But both sides
> > > should mention each other.
> >
> > How about this:
> >
> > /*
> >  * atomic_xchg should be called even when !force to always set poll_scheduled
> >  * and to provide a memory barrier (see the comment inside psi_poll_work).
> >  */
>
> The memory barrier part makes sense, but the first part says what the
> code does and the message is unclear to me. Are you worried somebody
> might turn this around in the future and only conditionalize on
> poll_scheduled when !force? Essentially, I don't see the downside of
> dropping that. But maybe I'm missing something.

Actually you are right. Originally I was worried that there might be a
case when poll_scheduled==0 and force==true and if someone flips the
conditions we will reschedule the timer but will not set
poll_scheduled back to 1. However I don't think this condition is
possible. We set force=true only when we skipped resetting
poll_schedule to 0 and on initial wakeup we always reset
poll_schedule. How about changing the comment to this:

 /*
  * atomic_xchg should be called even when !force to provide a
  * full memory barrier (see the comment inside psi_poll_work).
  */

>         /*
>          * The xchg implies a full barrier that matches the one
>          * in psi_poll_work() (see corresponding comment there).
>          */
>
> > > > @@ -595,6 +595,28 @@ static void psi_poll_work(struct psi_group *group)
> > > >
> > > >       now = sched_clock();
> > > >
> > > > +     if (now > group->polling_until) {
> > > > +             /*
> > > > +              * We are either about to start or might stop polling if no
> > > > +              * state change was recorded. Resetting poll_scheduled leaves
> > > > +              * a small window for psi_group_change to sneak in and schedule
> > > > +              * an immegiate poll_work before we get to rescheduling. One
> > > > +              * potential extra wakeup at the end of the polling window
> > > > +              * should be negligible and polling_next_update still keeps
> > > > +              * updates correctly on schedule.
> > > > +              */
> > > > +             atomic_set(&group->poll_scheduled, 0);
> > > > +             /*
> > > > +              * Ensure that operations of clearing group->poll_scheduled and
> > > > +              * obtaining changed_states are not reordered.
> > > > +              */
> > > > +             smp_mb();
> > >
> > > Same here, it would be good to explain that this is ordering the
> > > scheduler with the timer such that no events are missed. Feel free to
> > > reuse my race diagram from the other thread - those are better at
> > > conveying the situation than freeform text.
> >
> > I tried to make your diagram a bit less abstract by using the actual
> > names. How about this?
> >
> > /*
> >  * We need to enforce ordering between poll_scheduled and psi_group_cpu.times
> >  * reads and writes in psi_poll_work and psi_group_change functions.
> > Otherwise we
> >  * might fail to reschedule the timer when monitored states change:
> >  *
> >  * psi_poll_work:
> >  *     poll_scheduled = 0
> >  *     smp_mb()
> >  *     changed_states = collect_percpu_times()
> >  *     if changed_states && xchg(poll_scheduled, 1) == 0
> >  *         mod_timer()
>
> Those last two lines aren't relevant for the race, right? I'd leave
> those out to not distract from it.

They did help me illustrate the two failure cases but yeah, someone
who can read the code can derive the rest :)

>
> >  * psi_group_change:
> >  *     record_times()
> >  *     smp_mb()
> >  *     if xchg(poll_scheduled, 1) == 0
> >  *         mod_timer()
>
> The reason I tend to keep these more abstract is because 1) the names
> of the functions change (I had already sent out patches to rename half
> the variable and function names in this diagram), while the
> architecture (task change vs poll worker) likely won't, and 2) because
> it's easy to drown out what the reads, writes, and thus the race
> condition is with code details and function call indirections.

Got it.

>
> How about a compromise?
>
> /*
>  * A task change can race with the poll worker that is supposed to
>  * report on it. To avoid missing events, ensure ordering between
>  * poll_scheduled and the task state accesses, such that if the poll
>  * worker misses the state update, the task change is guaranteed to
>  * reschedule the poll worker:
>  *
>  * poll worker:
>  *   atomic_set(poll_scheduled, 0)
>  *   smp_mb()
>  *   LOAD states
>  *
>  * task change:
>  *   STORE states
>  *   if atomic_xchg(poll_scheduled, 1) == 0:
>  *     schedule poll worker
>  *
>  * The atomic_xchg() implies a full barrier.
>  */
>  smp_mb();
>
> This gives a high-level view of what's happening but it can still be
> mapped to the code by following the poll_scheduled variable.

This looks really good to me.
If you agree on the first comment modification, should I respin the
next version?

>
> > If we remove smp_mb barriers then there are the following possible
> > reordering cases:
> >
> > Case1: reordering in psi_poll_work
> > psi_poll_work                    psi_group_change
> >   changed_states = collect_percpu_times()
> >                                               record_times()
> >                                               if xchg(poll_scheduled,
> > 1) == 0 <-- false
> >                                                   mod_timer()
> >   poll_scheduled = 0
> >   if changed_states && xchg(poll_scheduled, 1) == 0 <-- changed_states is false
> >       mod_timer()
> >
> > Case2: reordering in psi_group_change
> > psi_poll_work                    psi_group_change
> >                                               if xchg(poll_scheduled,
> > 1) == 0 <-- false
> >                                                   mod_timer()
> >   poll_scheduled = 0
> >   changed_states = collect_percpu_times()
> >                                                   record_times()
> >   if changed_states && xchg(poll_scheduled, 1) == 0 <-- changed_states is false
> >       mod_timer()
> >
> > In both cases mod_timer() is not called, poll update is missed. But
> > describing this all in the comments would be an overkill IMHO.
> > WDYT?
>
> Yeah, I also think that's overkill. The failure cases can be derived
> from the concurrency diagram and explanation.
>
> Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
