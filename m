Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4028C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 19:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPJHgfBnslwV1mVCKLOTWuESaJcDmsTtCFwlUyiNwpE=; b=Q587KA3Ib8A/ILS/LQrzv2TOOk
	rGY3yqAx3SkxyTM/BI7mNFO2Xe2KfC7xw+LHOIWOvq3vBTbXfXIy421aNRMSysCO9Szckv6KkhVa4
	il17LowpTj0icDUmGjQKivvKezFdbM5nPDnVR3SuT303VzoU6d1S8GzD4FHkAZiZqNn/AvOqFtm26
	p7qCDKVgqrIUxZbYafvE25rqLoKRckDEuEeDcZly+XwyamwtRmAgRxVtqHSdN4v1gnpFWZRKBh6eI
	CdYO4bqpcT9+CeH/9NU0vCY543l7ysv6xeeeWVkcph1FE4cZTHYozSGTAn6z0gbQi67rGF08H2Ghm
	YPsV9ySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVMP-00218r-J0; Fri, 28 Oct 2022 19:49:45 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVM6-0020yi-7u
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 19:49:31 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-369426664f9so56291687b3.12
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yPJHgfBnslwV1mVCKLOTWuESaJcDmsTtCFwlUyiNwpE=;
        b=IHUMPqvAaCuE3qYMyQKADaIXO7iVB3UPpMBNZZTw/8rMq8CYVXb5uGTY51hcuC7uM3
         yHtY6g7FCLbFx1iOACg/8gWTIoemNqzjkqDLjqr1taD6kMC/8fVXtfaUJa6vLVFLVrlu
         N2efq7AwvH6JnAStn/ZandwuvN2uZs8WiSF3SUSjXlg9/RXvl6U0ulvKEI/BiULwnenm
         j0YwxZk1sj66SdTCwZ13CXRyG1vpWT80lKN9p/NWfa3Ehfrju4M4uvl2opQg4Z43J3y8
         CyQHj23mMcLEFbPuwZ21Av9ReLYmCE+40tUvj0C4pV07TKoYopB4RmYDclhIBACWZR7b
         Oitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPJHgfBnslwV1mVCKLOTWuESaJcDmsTtCFwlUyiNwpE=;
        b=Gv4phGMTpkIZ4ODCXBKtG83xtd5BCMj+unPOuz4iBaPFh2rHoEo3wotAWVPQyeQ/Q1
         CDNgx8tkx1Q3ua1qZy8WQO4OZpeOApjFREPgKe1yNJdVEUkcVfPVBke78el767qHbMtn
         oKKiZgfOyewkn/4JuTVNJz1gKMkvxbn9nBtBX+dn56yILV6dUEXSjqt22p1AiRNaadDX
         7duZEj+yu439siY6gBeqSZcvxw/Z7FCs3W0K1qEklSjiODqPC4IjZAUv9Nof9i4PY3Jg
         VKJuDZEEpVzbZHEVGuzKlqcSzPYTXWvrRwigrNET1CT4gjDb6A2ikWeaS61Dap5xmphd
         d+4A==
X-Gm-Message-State: ACrzQf1XQLzK2aqyaYdTpvIkfZwuBPWNcrSFlp78KfwypQGYh1LMjhqu
	KP/8AT6xf+4sg/IeNpRVCGhGbX/3Z57/W4i5kzZrsA==
X-Google-Smtp-Source: AMsMyM6hVjREAqRoS6vjtZnrE86TSMe58drGlTaeXlTB4z3EFnr7q+3KeeH/FfQ8IqDdIhwasBUjkko73mQmRV2UoEk=
X-Received: by 2002:a81:8a81:0:b0:36a:4785:ab9f with SMTP id
 a123-20020a818a81000000b0036a4785ab9fmr1052874ywg.218.1666986558042; Fri, 28
 Oct 2022 12:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221026233839.1934419-1-surenb@google.com> <2aa48d3a-bb37-bf4b-9842-41b3c740efcd@linux.dev>
 <CAJuCfpGnXKBVJRsVYXtEA=O72viV-qSXjjVhjFnCQZm7G2vxoQ@mail.gmail.com>
In-Reply-To: <CAJuCfpGnXKBVJRsVYXtEA=O72viV-qSXjjVhjFnCQZm7G2vxoQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 28 Oct 2022 12:49:06 -0700
Message-ID: <CAJuCfpHejT41KDzB4ie1rLuVU1Hnc+TUvijLbE2nUGnCuFEqTw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] psi: stop relying on timer_pending for poll_work rescheduling
To: Chengming Zhou <zhouchengming@bytedance.com>
Cc: peterz@infradead.org, hannes@cmpxchg.org, mingo@redhat.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	matthias.bgg@gmail.com, minchan@google.com, yt.chang@mediatek.com, 
	wenju.xu@mediatek.com, jonathan.jmchen@mediatek.com, 
	show-hong.chen@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_124926_324945_0AB5C40F 
X-CRM114-Status: GOOD (  48.71  )
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

On Fri, Oct 28, 2022 at 9:44 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Fri, Oct 28, 2022 at 2:59 AM Chengming Zhou
> <zhouchengming@bytedance.com> wrote:
> >
> > Hello,
> >
> > On 2022/10/27 07:38, Suren Baghdasaryan wrote:
> > > Psi polling mechanism is trying to minimize the number of wakeups to
> > > run psi_poll_work and is currently relying on timer_pending() to detect
> > > when this work is already scheduled. This provides a window of opportunity
> > > for psi_group_change to schedule an immediate psi_poll_work after
> > > poll_timer_fn got called but before psi_poll_work could reschedule itself.
> > > Below is the depiction of this entire window:
> > >
> > > poll_timer_fn
> > >   wake_up_interruptible(&group->poll_wait);
> > >
> > > psi_poll_worker
> > >   wait_event_interruptible(group->poll_wait, ...)
> > >   psi_poll_work
> > >     psi_schedule_poll_work
> > >       if (timer_pending(&group->poll_timer)) return;
> > >       ...
> > >       mod_timer(&group->poll_timer, jiffies + delay);
> > >
> > > Prior to 461daba06bdc we used to rely on poll_scheduled atomic which was
> > > reset and set back inside psi_poll_work and therefore this race window
> > > was much smaller.
> > > The larger window causes increased number of wakeups and our partners
> > > report visible power regression of ~10mA after applying 461daba06bdc.
> > > Bring back the poll_scheduled atomic and make this race window even
> > > narrower by resetting poll_scheduled only when we reach polling expiration
> > > time. This does not completely eliminate the possibility of extra wakeups
> > > caused by a race with psi_group_change however it will limit it to the
> > > worst case scenario of one extra wakeup per every tracking window (0.5s
> > > in the worst case).
> > > This patch also ensures correct ordering between clearing poll_scheduled
> > > flag and obtaining changed_states using memory barrier. Correct ordering
> > > between updating changed_states and setting poll_scheduled is ensured by
> > > atomic_xchg operation.
> > > By tracing the number of immediate rescheduling attempts performed by
> > > psi_group_change and the number of these attempts being blocked due to
> > > psi monitor being already active, we can assess the effects of this change:
> > >
> > > Before the patch:
> > >                                            Run#1    Run#2      Run#3
> > > Immediate reschedules attempted:           684365   1385156    1261240
> > > Immediate reschedules blocked:             682846   1381654    1258682
> > > Immediate reschedules (delta):             1519     3502       2558
> > > Immediate reschedules (% of attempted):    0.22%    0.25%      0.20%
> > >
> > > After the patch:
> > >                                            Run#1    Run#2      Run#3
> > > Immediate reschedules attempted:           882244   770298    426218
> > > Immediate reschedules blocked:             881996   769796    426074
> > > Immediate reschedules (delta):             248      502       144
> > > Immediate reschedules (% of attempted):    0.03%    0.07%     0.03%
> > >
> > > The number of non-blocked immediate reschedules dropped from 0.22-0.25%
> > > to 0.03-0.07%. The drop is attributed to the decrease in the race window
> > > size and the fact that we allow this race only when psi monitors reach
> > > polling window expiration time.
> > >
> > > Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
> > > Reported-by: Kathleen Chang <yt.chang@mediatek.com>
> > > Reported-by: Wenju Xu <wenju.xu@mediatek.com>
> > > Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Tested-by: SH Chen <show-hong.chen@mediatek.com>
> > > Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> > > ---
> > > Changes since v4 posted at
> > > https://lore.kernel.org/all/20221010225744.101629-1-surenb@google.com/
> > > - Added missing parameter in psi_schedule_poll_work() call used only when
> > > CONFIG_IRQ_TIME_ACCOUNTING is enabled, reported by kernel test robot.
> > >
> > >  include/linux/psi_types.h |  1 +
> > >  kernel/sched/psi.c        | 62 ++++++++++++++++++++++++++++++++-------
> > >  2 files changed, 53 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
> > > index 6e4372735068..14a1ebb74e11 100644
> > > --- a/include/linux/psi_types.h
> > > +++ b/include/linux/psi_types.h
> > > @@ -177,6 +177,7 @@ struct psi_group {
> > >       struct timer_list poll_timer;
> > >       wait_queue_head_t poll_wait;
> > >       atomic_t poll_wakeup;
> > > +     atomic_t poll_scheduled;
> > >
> > >       /* Protects data used by the monitor */
> > >       struct mutex trigger_lock;
> > > diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> > > index dbaeac915895..19d05b5c8a55 100644
> > > --- a/kernel/sched/psi.c
> > > +++ b/kernel/sched/psi.c
> > > @@ -189,6 +189,7 @@ static void group_init(struct psi_group *group)
> > >       INIT_DELAYED_WORK(&group->avgs_work, psi_avgs_work);
> > >       mutex_init(&group->avgs_lock);
> > >       /* Init trigger-related members */
> > > +     atomic_set(&group->poll_scheduled, 0);
> > >       mutex_init(&group->trigger_lock);
> > >       INIT_LIST_HEAD(&group->triggers);
> > >       group->poll_min_period = U32_MAX;
> > > @@ -580,18 +581,17 @@ static u64 update_triggers(struct psi_group *group, u64 now)
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
> > >       /*
> > > -      * Do not reschedule if already scheduled.
> > > -      * Possible race with a timer scheduled after this check but before
> > > -      * mod_timer below can be tolerated because group->polling_next_update
> > > -      * will keep updates on schedule.
> > > +      * atomic_xchg should be called even when !force to provide a
> > > +      * full memory barrier (see the comment inside psi_poll_work).
> > >        */
> > > -     if (timer_pending(&group->poll_timer))
> > > +     if (atomic_xchg(&group->poll_scheduled, 1) && !force)
> > >               return;
> > >
> > >       rcu_read_lock();
> > > @@ -603,12 +603,15 @@ static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> > >        */
> > >       if (likely(task))
> > >               mod_timer(&group->poll_timer, jiffies + delay);
> > > +     else
> > > +             atomic_set(&group->poll_scheduled, 0);
> > >
> > >       rcu_read_unlock();
> > >  }
> > >
> > >  static void psi_poll_work(struct psi_group *group)
> > >  {
> > > +     bool force_reschedule = false;
> > >       u32 changed_states;
> > >       u64 now;
> > >
> > > @@ -616,6 +619,43 @@ static void psi_poll_work(struct psi_group *group)
> > >
> > >       now = sched_clock();
> > >
> > > +     if (now > group->polling_until) {
> > > +             /*
> > > +              * We are either about to start or might stop polling if no
> > > +              * state change was recorded. Resetting poll_scheduled leaves
> > > +              * a small window for psi_group_change to sneak in and schedule
> > > +              * an immegiate poll_work before we get to rescheduling. One
> >
> > "immegiate" should be "immediate"?
>
> Ack. I'll post a new version with this fix.

Fixed version is posted as v6 at:
https://lore.kernel.org/all/20221028194541.813985-1-surenb@google.com/
Thanks,
Suren.

>
> >
> >
> > > +              * potential extra wakeup at the end of the polling window
> > > +              * should be negligible and polling_next_update still keeps
> > > +              * updates correctly on schedule.
> > > +              */
> > > +             atomic_set(&group->poll_scheduled, 0);
> > > +             /*
> > > +              * A task change can race with the poll worker that is supposed to
> > > +              * report on it. To avoid missing events, ensure ordering between
> > > +              * poll_scheduled and the task state accesses, such that if the poll
> > > +              * worker misses the state update, the task change is guaranteed to
> > > +              * reschedule the poll worker:
> > > +              *
> > > +              * poll worker:
> > > +              *   atomic_set(poll_scheduled, 0)
> > > +              *   smp_mb()
> > > +              *   LOAD states
> > > +              *
> > > +              * task change:
> > > +              *   STORE states
> > > +              *   if atomic_xchg(poll_scheduled, 1) == 0:
> > > +              *     schedule poll worker
> > > +              *
> > > +              * The atomic_xchg() implies a full barrier.
> > > +              */
> > > +             smp_mb();
> > > +     } else {
> > > +             /* Polling window is not over, keep rescheduling */
> > > +             force_reschedule = true;
> > > +     }
> >
> > Maybe we don't need force_reschedule special case? If this poller
> > need to reschedule and see force_reschedule set by task change,
> > then it doesn't re-arm poll_timer.
>
> IIRC (it has been a year since we discussed this patch),
> force_reschedule is used to skip extra operations (resetting
> poll_scheduled atomic + the memory barrier) when we know beforehand
> that we need to reschedule the work regardless of the `changed_states`
> result. We need to reschedule unconditionally because we are still
> within the polling window.
> Thanks,
> Suren.
>
> >
> > Or if we want this poller to override the timeout value of poll_timer,
> > we can always use force==true here?
> >
> > Thanks.
> >
> > > +
> > > +
> > >       collect_percpu_times(group, PSI_POLL, &changed_states);
> > >
> > >       if (changed_states & group->poll_states) {
> > > @@ -641,7 +681,8 @@ static void psi_poll_work(struct psi_group *group)
> > >               group->polling_next_update = update_triggers(group, now);
> > >
> > >       psi_schedule_poll_work(group,
> > > -             nsecs_to_jiffies(group->polling_next_update - now) + 1);
> > > +             nsecs_to_jiffies(group->polling_next_update - now) + 1,
> > > +             force_reschedule);
> > >
> > >  out:
> > >       mutex_unlock(&group->trigger_lock);
> > > @@ -802,7 +843,7 @@ static void psi_group_change(struct psi_group *group, int cpu,
> > >       write_seqcount_end(&groupc->seq);
> > >
> > >       if (state_mask & group->poll_states)
> > > -             psi_schedule_poll_work(group, 1);
> > > +             psi_schedule_poll_work(group, 1, false);
> > >
> > >       if (wake_clock && !delayed_work_pending(&group->avgs_work))
> > >               schedule_delayed_work(&group->avgs_work, PSI_FREQ);
> > > @@ -956,7 +997,7 @@ void psi_account_irqtime(struct task_struct *task, u32 delta)
> > >               write_seqcount_end(&groupc->seq);
> > >
> > >               if (group->poll_states & (1 << PSI_IRQ_FULL))
> > > -                     psi_schedule_poll_work(group, 1);
> > > +                     psi_schedule_poll_work(group, 1, false);
> > >       } while ((group = group->parent));
> > >  }
> > >  #endif
> > > @@ -1342,6 +1383,7 @@ void psi_trigger_destroy(struct psi_trigger *t)
> > >                * can no longer be found through group->poll_task.
> > >                */
> > >               kthread_stop(task_to_destroy);
> > > +             atomic_set(&group->poll_scheduled, 0);
> > >       }
> > >       kfree(t);
> > >  }

