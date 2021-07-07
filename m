Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6F1C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 22:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F5061CCA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 22:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5F5061CCA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KceZmhQSV5EnaEJcHPWm+QGfumZnhOoWP55uCfz/qv0=; b=Rfrjf2DK0sfRYZ
	C0xw7Y5hzGetoFjJQghAgwfuglhEZtHroaJZxNn8S+R/ZwrK6s+A1ELCdy1CMTjvzOjyuFgbGvIra
	/XLNKpVTWtpMtqv5ROpQ0WCxEc/OEZTPFOjwEuOWRqT00mtqasGWX5LRGqUMffXovEj0q1DuzrQ8r
	c+T/axMk2uhnkIO1FJVJCsJcJsmZ7bOlrRj5ILIW9IoPuVnzQaqSEXJkq1gVHr40BaGAYnjbc+4OM
	kmkymhDqfP0nmv4CygJh+rT6Mr6haAdQ30X0ceqazKqmSFyfRInEXZai00PXWxiMUTAkEv5CZzACS
	vdv6kR4Tk1GQ5r6Iyj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1GGy-00Fp2S-Dt; Wed, 07 Jul 2021 22:44:04 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1GGv-00Fp1T-2D
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 22:44:02 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id r135so5821412ybc.0
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Jul 2021 15:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzJsy1Gwb/DpffhxPKiomTMCjSp1XUEhZNn7jP3X0B8=;
 b=fuza8TZG/+wORlx+skCd5tjI1UPpjBQQUA2jFWQg/Oh7e01Dp71R2yZOxJvJLhUGAp
 IglrsozoUeOmc5G9oOAbtLOxiCVc9ofA7T9xmP1zQqUKEuI50+yIsXkqoLyFMYjfLFYu
 vm2JylA/vj+/dNWLUu/XXVy/1e6zIR4xYl48x9A9LkonYmYqw05SB8T6U3RoCfdVAOR6
 Kg4q4L4UkKszzidWs+1OUtf3oEkSWWUIpimNRSDBu8dSid7zqxDgroM7XpjFpI/jhecd
 kIJIRSU43TwvStlVOCs4j837YU79qT1l6Vxix0jq3//bNzfFucfr8h7fuJQjUERfKKD2
 hsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzJsy1Gwb/DpffhxPKiomTMCjSp1XUEhZNn7jP3X0B8=;
 b=izs8qYcKEyPt/h/IXnYBVougGgW32CEaMRFbIzBI4cZ6TjOAJy3gPHcP/uNr3JaL8O
 3d44x5Wv9PBDqP019JKfA1JEPYcL6ijQlrc+X6aRSrPprXC5/r8hZhCvGCr7vCQPdmqx
 IJhI3iXJCheaaqLxN2KH0akpkwYZdodJV0Q+SPeTH6WRSVSvruzPLp3dcVeN5Dyem6+7
 xai0tlm86HJ54K099VzBSYkcZxaEnZ8Lq8TZGjsIn/isVb83gr0dZrHngWu+K7V+Ghfd
 KX9+cTXEURniIrmth5nSH3dshseaWpzfCkfQoUdB1KSuYOJw7zeT0wt19pSPlAn/Ir8j
 dd4Q==
X-Gm-Message-State: AOAM531WAMBdXNj4VC6aTvsM+9g0q5OBz9xGtncGwJ+Uvc2J4c+DFMzq
 rJxOz6Jl6PO0/e6XlHUkDHW6kh1lfruzJC4YWQtENw==
X-Google-Smtp-Source: ABdhPJzjWRdscMuHWjaEPoeIecZQx43oo8ZD+Vf/VQroZQghr+QBugm9G0OPkAw3ywmF0ah7ilDJM/3M9Wex+Mcoki8=
X-Received: by 2002:a25:4102:: with SMTP id o2mr33355128yba.23.1625697839576; 
 Wed, 07 Jul 2021 15:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210707023933.1691149-1-surenb@google.com>
 <YOWugYxQ9Yfsqba2@cmpxchg.org>
In-Reply-To: <YOWugYxQ9Yfsqba2@cmpxchg.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 7 Jul 2021 15:43:48 -0700
Message-ID: <CAJuCfpGx22iTaDGCfOrM_pD6PYZqQrni2+u5jQy+NpNeNg7B9w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210707_154401_196983_214171B8 
X-CRM114-Status: GOOD (  30.60  )
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

On Wed, Jul 7, 2021 at 6:39 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> This looks good to me now code wise. Just a comment on the comments:
>
> On Tue, Jul 06, 2021 at 07:39:33PM -0700, Suren Baghdasaryan wrote:
> > @@ -559,18 +560,14 @@ static u64 update_triggers(struct psi_group *group, u64 now)
> >       return now + group->poll_min_period;
> >  }
> >
> > -/* Schedule polling if it's not already scheduled. */
> > -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> > +/* Schedule polling if it's not already scheduled or forced. */
> > +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> > +                                bool force)
> >  {
> >       struct task_struct *task;
> >
> > -     /*
> > -      * Do not reschedule if already scheduled.
> > -      * Possible race with a timer scheduled after this check but before
> > -      * mod_timer below can be tolerated because group->polling_next_update
> > -      * will keep updates on schedule.
> > -      */
> > -     if (timer_pending(&group->poll_timer))
> > +     /* xchg should be called even when !force to set poll_scheduled */
> > +     if (atomic_xchg(&group->poll_scheduled, 1) && !force)
> >               return;
>
> This explains what the code does, but not why. It would be good to
> explain the ordering with poll_work, here or there. But both sides
> should mention each other.

How about this:

/*
 * atomic_xchg should be called even when !force to always set poll_scheduled
 * and to provide a memory barrier (see the comment inside psi_poll_work).
 */

>
> > @@ -595,6 +595,28 @@ static void psi_poll_work(struct psi_group *group)
> >
> >       now = sched_clock();
> >
> > +     if (now > group->polling_until) {
> > +             /*
> > +              * We are either about to start or might stop polling if no
> > +              * state change was recorded. Resetting poll_scheduled leaves
> > +              * a small window for psi_group_change to sneak in and schedule
> > +              * an immegiate poll_work before we get to rescheduling. One
> > +              * potential extra wakeup at the end of the polling window
> > +              * should be negligible and polling_next_update still keeps
> > +              * updates correctly on schedule.
> > +              */
> > +             atomic_set(&group->poll_scheduled, 0);
> > +             /*
> > +              * Ensure that operations of clearing group->poll_scheduled and
> > +              * obtaining changed_states are not reordered.
> > +              */
> > +             smp_mb();
>
> Same here, it would be good to explain that this is ordering the
> scheduler with the timer such that no events are missed. Feel free to
> reuse my race diagram from the other thread - those are better at
> conveying the situation than freeform text.

I tried to make your diagram a bit less abstract by using the actual
names. How about this?

/*
 * We need to enforce ordering between poll_scheduled and psi_group_cpu.times
 * reads and writes in psi_poll_work and psi_group_change functions.
Otherwise we
 * might fail to reschedule the timer when monitored states change:
 *
 * psi_poll_work:
 *     poll_scheduled = 0
 *     smp_mb()
 *     changed_states = collect_percpu_times()
 *     if changed_states && xchg(poll_scheduled, 1) == 0
 *         mod_timer()
 *
 * psi_group_change:
 *     record_times()
 *     smp_mb()
 *     if xchg(poll_scheduled, 1) == 0
 *         mod_timer()
 *
 * atomic_xchg in psi_schedule_poll_work implements an implicit memory
barrier but
 * we need an explicit one here.
 */

If we remove smp_mb barriers then there are the following possible
reordering cases:

Case1: reordering in psi_poll_work
psi_poll_work                    psi_group_change
  changed_states = collect_percpu_times()
                                              record_times()
                                              if xchg(poll_scheduled,
1) == 0 <-- false
                                                  mod_timer()
  poll_scheduled = 0
  if changed_states && xchg(poll_scheduled, 1) == 0 <-- changed_states is false
      mod_timer()

Case2: reordering in psi_group_change
psi_poll_work                    psi_group_change
                                              if xchg(poll_scheduled,
1) == 0 <-- false
                                                  mod_timer()
  poll_scheduled = 0
  changed_states = collect_percpu_times()
                                                  record_times()
  if changed_states && xchg(poll_scheduled, 1) == 0 <-- changed_states is false
      mod_timer()

In both cases mod_timer() is not called, poll update is missed. But
describing this all in the comments would be an overkill IMHO.
WDYT?

>
> Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
