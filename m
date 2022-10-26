Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF7FC38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAlVcangjllWE4d/TKwBzq5t2wvRwgrX82tWmkgivY8=; b=0d2cPvwz9ls3jBOxefnzxGNTpN
	z/8y7HVniutDhiSmiYDPUeNh44euePePvNi0TAD17I3pWoCdcty9VlCQLWhtpErds4iDSwTpDmhvA
	Onxn4lkoL39pCxm2vd3obP4s4WUaiFk1l1SIQiaNl3BzA85t5kw2vqQW64lwcCRhKgvBXE4YpcqhM
	qTsUrEhe7tAx8agZ8TcZwCjzD7SORUKk+j7Eqgso5UsqJI2juCuYTzZBOm9HrzpjUaUIA553sMvof
	JvMcfg1ZWH1/XV3BTxc/pQ5GJZ5Takr+NKLRRNTnBgeRxYmU9vhvKWc7ZlbpC4UONseKbcDCbPtqh
	ej21OQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onqAM-00BKpQ-Oz; Wed, 26 Oct 2022 23:50:34 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onqAA-00BKnY-Rm
	for linux-mediatek@lists.infradead.org; Wed, 26 Oct 2022 23:50:26 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id t186so21094384yba.12
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Oct 2022 16:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CAlVcangjllWE4d/TKwBzq5t2wvRwgrX82tWmkgivY8=;
        b=LP32NRkC6Hss/3NIEHMZ+M93o8oVa93//jhRrkZ8NJcHBVGrGpbDBS9Ejq/W8mHhdR
         wqctEN6vFfZ/GbE2u1s6IzS9VWuxMsT0EaCdSP6RTwd9/eBfJ3lAKCwh7UhGugqF7l+q
         6mUjjr9Q7cj0HssPcvA6kqS/n0CaMz8TDkXEQFzHH8VSoaCURhFWrbubbI9RUa/vbCXX
         gK6pDBeNkxD5IXl4TIkDbklprADGB8mR8qfywdbRkvELXyKrOh5Qi+0+8tb/b79XNrzZ
         lT7/T5i9CccO94gI4VMdV6TrbrvXwtrHZA+/cAGI8HPc5JB0qfcZXX8iSw4YLagAuwSO
         8wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAlVcangjllWE4d/TKwBzq5t2wvRwgrX82tWmkgivY8=;
        b=fch3szENuXoh9iQ5g5FxWgEDveNZwFH3ciX8Rrem1hRAY/Sk7/XNAb4+K2maiFluwT
         LoNSylfoQWueIio8uLI9khyfE6Nx89OOe+g3XyuNa8wMltnYTIIt0odt+HN5kVP3b/ht
         FP8vF84ynxXVv6mfuhQMjqqGyv/NMQw4wYeON0q19xvuxWSj+LFyBcnv4xP1X2C9E3W3
         NfYgsN22YtizKIi8qJFPCUr58iBT3DyWS1Y/9daftXNrtrSLL4DpZcWqd2RXgqdHkArr
         FGDcEBg18PhZCqIvW/UvoPZqHNSIo3kPHcQaMTx2nofJ+G9nte9NkCkmC8OgdckMzMC6
         Qnow==
X-Gm-Message-State: ACrzQf2EpgEz/feK8FiDjfOIMF+TcIQxpZR95aWMNu2IBFui1hxtj+dd
	RtrYae299OZegyIUXuGApxE1c3KcvdeNxEKvvPD20w==
X-Google-Smtp-Source: AMsMyM4czU6uYwVoNp6dsLDT0v7+1AaaSrOFTSC8XL2axVl5nfOHLcJW7UhxUB5s/qGWg8vf3exHj0FkEqsakZ39W8k=
X-Received: by 2002:a25:3812:0:b0:6cb:446b:69fd with SMTP id
 f18-20020a253812000000b006cb446b69fdmr13916888yba.59.1666828221080; Wed, 26
 Oct 2022 16:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221026233839.1934419-1-surenb@google.com>
In-Reply-To: <20221026233839.1934419-1-surenb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 26 Oct 2022 16:50:10 -0700
Message-ID: <CAJuCfpHqEuGSOZptb1-F1kx72Zu+3Rpnqp0qvW0b4SCdyBqeLw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] psi: stop relying on timer_pending for poll_work rescheduling
To: peterz@infradead.org
Cc: hannes@cmpxchg.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	matthias.bgg@gmail.com, minchan@google.com, yt.chang@mediatek.com, 
	wenju.xu@mediatek.com, jonathan.jmchen@mediatek.com, 
	show-hong.chen@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_165022_960052_91A7C8C2 
X-CRM114-Status: GOOD (  40.92  )
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

On Wed, Oct 26, 2022 at 4:38 PM Suren Baghdasaryan <surenb@google.com> wrote:
>
> Psi polling mechanism is trying to minimize the number of wakeups to
> run psi_poll_work and is currently relying on timer_pending() to detect
> when this work is already scheduled. This provides a window of opportunity
> for psi_group_change to schedule an immediate psi_poll_work after
> poll_timer_fn got called but before psi_poll_work could reschedule itself.
> Below is the depiction of this entire window:
>
> poll_timer_fn
>   wake_up_interruptible(&group->poll_wait);
>
> psi_poll_worker
>   wait_event_interruptible(group->poll_wait, ...)
>   psi_poll_work
>     psi_schedule_poll_work
>       if (timer_pending(&group->poll_timer)) return;
>       ...
>       mod_timer(&group->poll_timer, jiffies + delay);
>
> Prior to 461daba06bdc we used to rely on poll_scheduled atomic which was
> reset and set back inside psi_poll_work and therefore this race window
> was much smaller.
> The larger window causes increased number of wakeups and our partners
> report visible power regression of ~10mA after applying 461daba06bdc.
> Bring back the poll_scheduled atomic and make this race window even
> narrower by resetting poll_scheduled only when we reach polling expiration
> time. This does not completely eliminate the possibility of extra wakeups
> caused by a race with psi_group_change however it will limit it to the
> worst case scenario of one extra wakeup per every tracking window (0.5s
> in the worst case).
> This patch also ensures correct ordering between clearing poll_scheduled
> flag and obtaining changed_states using memory barrier. Correct ordering
> between updating changed_states and setting poll_scheduled is ensured by
> atomic_xchg operation.
> By tracing the number of immediate rescheduling attempts performed by
> psi_group_change and the number of these attempts being blocked due to
> psi monitor being already active, we can assess the effects of this change:
>
> Before the patch:
>                                            Run#1    Run#2      Run#3
> Immediate reschedules attempted:           684365   1385156    1261240
> Immediate reschedules blocked:             682846   1381654    1258682
> Immediate reschedules (delta):             1519     3502       2558
> Immediate reschedules (% of attempted):    0.22%    0.25%      0.20%
>
> After the patch:
>                                            Run#1    Run#2      Run#3
> Immediate reschedules attempted:           882244   770298    426218
> Immediate reschedules blocked:             881996   769796    426074
> Immediate reschedules (delta):             248      502       144
> Immediate reschedules (% of attempted):    0.03%    0.07%     0.03%
>
> The number of non-blocked immediate reschedules dropped from 0.22-0.25%
> to 0.03-0.07%. The drop is attributed to the decrease in the race window
> size and the fact that we allow this race only when psi monitors reach
> polling window expiration time.
>
> Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
> Reported-by: Kathleen Chang <yt.chang@mediatek.com>
> Reported-by: Wenju Xu <wenju.xu@mediatek.com>
> Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Tested-by: SH Chen <show-hong.chen@mediatek.com>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
> Changes since v4 posted at
> https://lore.kernel.org/all/20221010225744.101629-1-surenb@google.com/
> - Added missing parameter in psi_schedule_poll_work() call used only when
> CONFIG_IRQ_TIME_ACCOUNTING is enabled, reported by kernel test robot.
>
>  include/linux/psi_types.h |  1 +
>  kernel/sched/psi.c        | 62 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 53 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
> index 6e4372735068..14a1ebb74e11 100644
> --- a/include/linux/psi_types.h
> +++ b/include/linux/psi_types.h
> @@ -177,6 +177,7 @@ struct psi_group {
>         struct timer_list poll_timer;
>         wait_queue_head_t poll_wait;
>         atomic_t poll_wakeup;
> +       atomic_t poll_scheduled;
>
>         /* Protects data used by the monitor */
>         struct mutex trigger_lock;
> diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> index dbaeac915895..19d05b5c8a55 100644
> --- a/kernel/sched/psi.c
> +++ b/kernel/sched/psi.c
> @@ -189,6 +189,7 @@ static void group_init(struct psi_group *group)
>         INIT_DELAYED_WORK(&group->avgs_work, psi_avgs_work);
>         mutex_init(&group->avgs_lock);
>         /* Init trigger-related members */
> +       atomic_set(&group->poll_scheduled, 0);
>         mutex_init(&group->trigger_lock);
>         INIT_LIST_HEAD(&group->triggers);
>         group->poll_min_period = U32_MAX;
> @@ -580,18 +581,17 @@ static u64 update_triggers(struct psi_group *group, u64 now)
>         return now + group->poll_min_period;
>  }
>
> -/* Schedule polling if it's not already scheduled. */
> -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> +/* Schedule polling if it's not already scheduled or forced. */
> +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> +                                  bool force)
>  {
>         struct task_struct *task;
>
>         /*
> -        * Do not reschedule if already scheduled.
> -        * Possible race with a timer scheduled after this check but before
> -        * mod_timer below can be tolerated because group->polling_next_update
> -        * will keep updates on schedule.
> +        * atomic_xchg should be called even when !force to provide a
> +        * full memory barrier (see the comment inside psi_poll_work).
>          */
> -       if (timer_pending(&group->poll_timer))
> +       if (atomic_xchg(&group->poll_scheduled, 1) && !force)
>                 return;
>
>         rcu_read_lock();
> @@ -603,12 +603,15 @@ static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
>          */
>         if (likely(task))
>                 mod_timer(&group->poll_timer, jiffies + delay);
> +       else
> +               atomic_set(&group->poll_scheduled, 0);
>
>         rcu_read_unlock();
>  }
>
>  static void psi_poll_work(struct psi_group *group)
>  {
> +       bool force_reschedule = false;
>         u32 changed_states;
>         u64 now;
>
> @@ -616,6 +619,43 @@ static void psi_poll_work(struct psi_group *group)
>
>         now = sched_clock();
>
> +       if (now > group->polling_until) {
> +               /*
> +                * We are either about to start or might stop polling if no
> +                * state change was recorded. Resetting poll_scheduled leaves
> +                * a small window for psi_group_change to sneak in and schedule
> +                * an immegiate poll_work before we get to rescheduling. One
> +                * potential extra wakeup at the end of the polling window
> +                * should be negligible and polling_next_update still keeps
> +                * updates correctly on schedule.
> +                */
> +               atomic_set(&group->poll_scheduled, 0);
> +               /*
> +                * A task change can race with the poll worker that is supposed to
> +                * report on it. To avoid missing events, ensure ordering between
> +                * poll_scheduled and the task state accesses, such that if the poll
> +                * worker misses the state update, the task change is guaranteed to
> +                * reschedule the poll worker:
> +                *
> +                * poll worker:
> +                *   atomic_set(poll_scheduled, 0)
> +                *   smp_mb()
> +                *   LOAD states
> +                *
> +                * task change:
> +                *   STORE states
> +                *   if atomic_xchg(poll_scheduled, 1) == 0:
> +                *     schedule poll worker
> +                *
> +                * The atomic_xchg() implies a full barrier.
> +                */
> +               smp_mb();
> +       } else {
> +               /* Polling window is not over, keep rescheduling */
> +               force_reschedule = true;
> +       }
> +
> +
>         collect_percpu_times(group, PSI_POLL, &changed_states);
>
>         if (changed_states & group->poll_states) {
> @@ -641,7 +681,8 @@ static void psi_poll_work(struct psi_group *group)
>                 group->polling_next_update = update_triggers(group, now);
>
>         psi_schedule_poll_work(group,
> -               nsecs_to_jiffies(group->polling_next_update - now) + 1);
> +               nsecs_to_jiffies(group->polling_next_update - now) + 1,
> +               force_reschedule);
>
>  out:
>         mutex_unlock(&group->trigger_lock);
> @@ -802,7 +843,7 @@ static void psi_group_change(struct psi_group *group, int cpu,
>         write_seqcount_end(&groupc->seq);
>
>         if (state_mask & group->poll_states)
> -               psi_schedule_poll_work(group, 1);
> +               psi_schedule_poll_work(group, 1, false);
>
>         if (wake_clock && !delayed_work_pending(&group->avgs_work))
>                 schedule_delayed_work(&group->avgs_work, PSI_FREQ);
> @@ -956,7 +997,7 @@ void psi_account_irqtime(struct task_struct *task, u32 delta)
>                 write_seqcount_end(&groupc->seq);
>
>                 if (group->poll_states & (1 << PSI_IRQ_FULL))
> -                       psi_schedule_poll_work(group, 1);
> +                       psi_schedule_poll_work(group, 1, false);

Previous patch was missing the above one-line change. I missed that
because I didn't test CONFIG_IRQ_TIME_ACCOUNTING=y configuration. The
older version of this patch didn't have it because this function
invocation code is relatively new (added on 08/25/22 by 52b1364ba0b1
"sched/psi: Add PSI_IRQ to track IRQ/SOFTIRQ pressure").
Peter, please try picking up this one. Hopefully I didn't miss
anything else this time...

>         } while ((group = group->parent));
>  }
>  #endif
> @@ -1342,6 +1383,7 @@ void psi_trigger_destroy(struct psi_trigger *t)
>                  * can no longer be found through group->poll_task.
>                  */
>                 kthread_stop(task_to_destroy);
> +               atomic_set(&group->poll_scheduled, 0);
>         }
>         kfree(t);
>  }
> --
> 2.38.1.273.g43a17bfeac-goog
>

