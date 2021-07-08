Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54059C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 14:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 156A561076
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 14:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 156A561076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2zy7m+QS0rhyNNg+IBiswOUXvoYRYs9FHFtH16RT3c=; b=BED1ODgxlWDQJ+
	SRq/Vo1QNgg51lptmFAperc+Z7iHExmvaYDI68zkiJzZmvEyD/tTc/Ha7AFxwxvdt5NFD31egDaB3
	BufniN0K39XyIUnKDqUROd75AIwbovIghkV2IB8bECGv8dO6059m0Yocj8kR+A9zaEpLbsalGI4mm
	HnhTLnm0gyl1DfPrbmtTkaVDaBDCRB6CfWSrUUapiLHmziwC/Dnitpg9daj4OOW42q7F5GNsopL0N
	Ntbb/jtJzed6tjp/+9fbsSzC//PJbaX/dh5zC/xZ0UeohNSSAGq5ZzuyLn7vntXyWnhgDqL2lyI6f
	D57O4Urwe/OxB8oqPYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1VGn-00HEBf-97; Thu, 08 Jul 2021 14:44:53 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1VGY-00HE8i-Ry
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 14:44:41 +0000
Received: by mail-qv1-xf35.google.com with SMTP id w2so539344qvh.13
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X8jsAriZ0FZ/8CoPzjOwm+7OQW7LILKmtYoMcbL8c4E=;
 b=e2XZzMPyEhkQ19tZ3n+3mWUjcOMbSnBskJjC2KQVmxqWe8ZlG3Rf1hN7hQpo3TtBjl
 gtNs3/+NfpoQOM9oeJ/5wugB4rLhj0ez1A+DICXi2h8Q2RdzB7I7yb1F+oRQ2NgtAO+N
 Ij+6c2XFfGioIkw1j+ybxeYios8j/DVRuxqqzM8XW7/1hxoH58A1Zb22g0qFJyZW+geD
 xytaK8lCAlvRnU/55X6GZsYYfKCLw1H44lgbbeh1DEqPsunXSXWdTQucFQ5qS5tXMywn
 LN6s4HDipcOdP0SSFUMGyTZ7T4Ipzy8a5cFd7G31hiARJDGTqoXnht8gKFbcyCT8SIS5
 OBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X8jsAriZ0FZ/8CoPzjOwm+7OQW7LILKmtYoMcbL8c4E=;
 b=pa3/6KEHdtYX0BnGz3uU77ZOVfMXos5/CUOxt0VM/GUjI7A6J9hptwpXxdUR4gof8m
 bXdBXPNeowTyOkJ+nZGZhD5f6yKqkHJA9HlxTdpzJb4RLmATjbH8q0B3S415EK12sjAG
 l830V+Kd+DZGtDNaOL8obhhyllaxsku+Zw58ROyGBktcf8FC2kEKzH47DPTAQLIMjT9e
 rAjcUeJ/yuSlt4V09h3sF2j8jykHQXvh8rbAfMUA0UNabZGYvEOpAJ+GxWWBfQ9XyQaQ
 5aVFzykQ1RwIgVJfTbuEwJrZqiqdwwDQhq5UvRqZmDi3LW3Z2fq2BTwOh7su7B/qywln
 B0uQ==
X-Gm-Message-State: AOAM5323YFYy2JP9KqCObL3DFgkYOAwCzcvFhLCzezL+MNEgvglCCreE
 F6dZq5IvjraNCSNwrnZvZyCQtQ==
X-Google-Smtp-Source: ABdhPJzuw8oV0eCDdQ6qh6a2I4jEoDje0ZW3Af08iwnP8+VzOgt3uIuOMDO1yv5hwgwZeFxgFSvQaQ==
X-Received: by 2002:a05:6214:21cf:: with SMTP id
 d15mr30819565qvh.12.1625755476720; 
 Thu, 08 Jul 2021 07:44:36 -0700 (PDT)
Received: from localhost (70.44.39.90.res-cmts.bus.ptd.net. [70.44.39.90])
 by smtp.gmail.com with ESMTPSA id g21sm1040748qtp.81.2021.07.08.07.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:44:35 -0700 (PDT)
Date: Thu, 8 Jul 2021 10:44:34 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Benjamin Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 matthias.bgg@gmail.com, Minchan Kim <minchan@google.com>,
 Tim Murray <timmurray@google.com>, YT Chang <yt.chang@mediatek.com>,
 Wenju Xu =?utf-8?B?KOiuuOaWh+S4vik=?= <wenju.xu@mediatek.com>,
 Jonathan JMChen =?utf-8?B?KOmZs+WutuaYjik=?= <jonathan.jmchen@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-team <kernel-team@android.com>,
 SH Chen <show-hong.chen@mediatek.com>
Subject: Re: [PATCH v3 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Message-ID: <YOcPUs97epJ5VrEf@cmpxchg.org>
References: <20210707023933.1691149-1-surenb@google.com>
 <YOWugYxQ9Yfsqba2@cmpxchg.org>
 <CAJuCfpGx22iTaDGCfOrM_pD6PYZqQrni2+u5jQy+NpNeNg7B9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpGx22iTaDGCfOrM_pD6PYZqQrni2+u5jQy+NpNeNg7B9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_074438_978714_BED2CD2D 
X-CRM114-Status: GOOD (  40.48  )
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

On Wed, Jul 07, 2021 at 03:43:48PM -0700, Suren Baghdasaryan wrote:
> On Wed, Jul 7, 2021 at 6:39 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > This looks good to me now code wise. Just a comment on the comments:
> >
> > On Tue, Jul 06, 2021 at 07:39:33PM -0700, Suren Baghdasaryan wrote:
> > > @@ -559,18 +560,14 @@ static u64 update_triggers(struct psi_group *group, u64 now)
> > >       return now + group->poll_min_period;
> > >  }
> > >
> > > -/* Schedule polling if it's not already scheduled. */
> > > -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> > > +/* Schedule polling if it's not already scheduled or forced. */
> > > +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> > > +                                bool force)
> > >  {
> > >       struct task_struct *task;
> > >
> > > -     /*
> > > -      * Do not reschedule if already scheduled.
> > > -      * Possible race with a timer scheduled after this check but before
> > > -      * mod_timer below can be tolerated because group->polling_next_update
> > > -      * will keep updates on schedule.
> > > -      */
> > > -     if (timer_pending(&group->poll_timer))
> > > +     /* xchg should be called even when !force to set poll_scheduled */
> > > +     if (atomic_xchg(&group->poll_scheduled, 1) && !force)
> > >               return;
> >
> > This explains what the code does, but not why. It would be good to
> > explain the ordering with poll_work, here or there. But both sides
> > should mention each other.
> 
> How about this:
> 
> /*
>  * atomic_xchg should be called even when !force to always set poll_scheduled
>  * and to provide a memory barrier (see the comment inside psi_poll_work).
>  */

The memory barrier part makes sense, but the first part says what the
code does and the message is unclear to me. Are you worried somebody
might turn this around in the future and only conditionalize on
poll_scheduled when !force? Essentially, I don't see the downside of
dropping that. But maybe I'm missing something.

	/*
	 * The xchg implies a full barrier that matches the one
	 * in psi_poll_work() (see corresponding comment there).
	 */

> > > @@ -595,6 +595,28 @@ static void psi_poll_work(struct psi_group *group)
> > >
> > >       now = sched_clock();
> > >
> > > +     if (now > group->polling_until) {
> > > +             /*
> > > +              * We are either about to start or might stop polling if no
> > > +              * state change was recorded. Resetting poll_scheduled leaves
> > > +              * a small window for psi_group_change to sneak in and schedule
> > > +              * an immegiate poll_work before we get to rescheduling. One
> > > +              * potential extra wakeup at the end of the polling window
> > > +              * should be negligible and polling_next_update still keeps
> > > +              * updates correctly on schedule.
> > > +              */
> > > +             atomic_set(&group->poll_scheduled, 0);
> > > +             /*
> > > +              * Ensure that operations of clearing group->poll_scheduled and
> > > +              * obtaining changed_states are not reordered.
> > > +              */
> > > +             smp_mb();
> >
> > Same here, it would be good to explain that this is ordering the
> > scheduler with the timer such that no events are missed. Feel free to
> > reuse my race diagram from the other thread - those are better at
> > conveying the situation than freeform text.
> 
> I tried to make your diagram a bit less abstract by using the actual
> names. How about this?
> 
> /*
>  * We need to enforce ordering between poll_scheduled and psi_group_cpu.times
>  * reads and writes in psi_poll_work and psi_group_change functions.
> Otherwise we
>  * might fail to reschedule the timer when monitored states change:
>  *
>  * psi_poll_work:
>  *     poll_scheduled = 0
>  *     smp_mb()
>  *     changed_states = collect_percpu_times()
>  *     if changed_states && xchg(poll_scheduled, 1) == 0
>  *         mod_timer()

Those last two lines aren't relevant for the race, right? I'd leave
those out to not distract from it.

>  * psi_group_change:
>  *     record_times()
>  *     smp_mb()
>  *     if xchg(poll_scheduled, 1) == 0
>  *         mod_timer()

The reason I tend to keep these more abstract is because 1) the names
of the functions change (I had already sent out patches to rename half
the variable and function names in this diagram), while the
architecture (task change vs poll worker) likely won't, and 2) because
it's easy to drown out what the reads, writes, and thus the race
condition is with code details and function call indirections.

How about a compromise?

/*
 * A task change can race with the poll worker that is supposed to
 * report on it. To avoid missing events, ensure ordering between
 * poll_scheduled and the task state accesses, such that if the poll
 * worker misses the state update, the task change is guaranteed to
 * reschedule the poll worker:
 *
 * poll worker:
 *   atomic_set(poll_scheduled, 0)
 *   smp_mb()
 *   LOAD states
 *
 * task change:
 *   STORE states
 *   if atomic_xchg(poll_scheduled, 1) == 0:
 *     schedule poll worker
 *
 * The atomic_xchg() implies a full barrier.
 */
 smp_mb();

This gives a high-level view of what's happening but it can still be
mapped to the code by following the poll_scheduled variable.

> If we remove smp_mb barriers then there are the following possible
> reordering cases:
> 
> Case1: reordering in psi_poll_work
> psi_poll_work                    psi_group_change
>   changed_states = collect_percpu_times()
>                                               record_times()
>                                               if xchg(poll_scheduled,
> 1) == 0 <-- false
>                                                   mod_timer()
>   poll_scheduled = 0
>   if changed_states && xchg(poll_scheduled, 1) == 0 <-- changed_states is false
>       mod_timer()
> 
> Case2: reordering in psi_group_change
> psi_poll_work                    psi_group_change
>                                               if xchg(poll_scheduled,
> 1) == 0 <-- false
>                                                   mod_timer()
>   poll_scheduled = 0
>   changed_states = collect_percpu_times()
>                                                   record_times()
>   if changed_states && xchg(poll_scheduled, 1) == 0 <-- changed_states is false
>       mod_timer()
> 
> In both cases mod_timer() is not called, poll update is missed. But
> describing this all in the comments would be an overkill IMHO.
> WDYT?

Yeah, I also think that's overkill. The failure cases can be derived
from the concurrency diagram and explanation.

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
