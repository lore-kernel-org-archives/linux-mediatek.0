Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C733BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 22:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYkpkk5lZ6UbU8vLJDuyL389k5VSF1GIIAgVM4h0/14=; b=bdsPFqxwSlxdz8XSd+xLAE9no2
	tNJt03s1B08xPkSwa2C18x/VAQezi6Wa7RVKDpHeTWWF1VP66xAgO5VZLd8HwbG1qpNnl0V6+2b1p
	8244wlxmfkDk/K3HnjC3KjjL157vvmIxDFSy/stHu/tfWIB1NZfemE/a5/sv4P9jCQ1vuGKnadWOp
	Y0y0ab5jFi5FggmqB3e2dNf25qgFTs9v6s0yLodgS6mBH7ec7SanhRZGKXbr/CZI1FHokGbT1aU8A
	jECceFJmlW1HZzDSyTukO5lcqVXP7bOqXr+dkRwQFBa+8Bgz7OBcBHpRSv7YZAnNQIzd137JNz4ay
	kh50PPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oldzI-002G1j-LX; Thu, 20 Oct 2022 22:26:04 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oldzE-002Fz1-NA
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 22:26:02 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3690482f5dfso6998447b3.6
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 15:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lYkpkk5lZ6UbU8vLJDuyL389k5VSF1GIIAgVM4h0/14=;
        b=hsBVPwbjKrKrgBfExbAGtluOzJyrkQ/uRUoJYcAxAmlpY7/TgTVoO8LTUhQjvNxr/X
         iZC0WFeSJ6xTaIL5UJ4VHjU0VWjqo9QCm3OriDAdpXSgmJL6AW5p4cQQnTA4fWXJjlIV
         5Rc86aZI+5JzaezrOssbpeVCKRCpY90awmZST1MkeLjsJgPJnqExVP/pU8tFxTcTLXTA
         IxSVjMXmVgjlPEuMDgd9XLItX+iA32e7iFW/PhylXjKj656W1OxzqmprpPNsD/QVtboU
         ikazAfJGiD+BnSowbyVqV/B0hQj7JKHGMq8+1OwqTBouCMbSEyu5OoZ7Y3ynAdFNG7pE
         gs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYkpkk5lZ6UbU8vLJDuyL389k5VSF1GIIAgVM4h0/14=;
        b=lDOqZd/jGd2BHlsAVgwRCsXuzO44lzzkmTE7cF+ScPrIIhplG8iDW1IBJarAbn426O
         QRSEp+YjeiOXhyqS81xJw8qGbVe0ZYchpFUUhar3W7Moyo4BoTzxYP44ik0cR9shdwnS
         jsXBdBJTf2Sq9u1WaEvIPkINWHIIhTCZ4Et0HqyKI31NHo4bGZTLnt4TB0c+/NDp5CRJ
         OdBltqgmICUB1GZ78ljVymz/9t481YDFJ89qekr2Y+C/DiiQbgJ7fYjvUxxpPniHnWpk
         +6Jn2V8WTRZ5UA/B6fuPmkYrEMt0exfn/1ZZ51p0KqaWh9jjkf7bMrUJeibRExCWNUob
         rFUQ==
X-Gm-Message-State: ACrzQf15SRzEDeGOm05v3SIcnpgVcYGboV0glKJ3QVR4ocII2ASCtLX2
	bKNkwmP/xIpr8+fweeoCSdrMH69cnrb9ib18Y6kjiw==
X-Google-Smtp-Source: AMsMyM7X2xHBM6u9FmnN0WhferDVZmSwfocFQQeDg1zsd3uR3TG4kwpr+4GGxlDww7/51V1ZfDxvBTZD8XE0/bdLaYY=
X-Received: by 2002:a0d:fe47:0:b0:361:2bf:6db4 with SMTP id
 o68-20020a0dfe47000000b0036102bf6db4mr13861718ywf.438.1666304758501; Thu, 20
 Oct 2022 15:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221010225744.101629-1-surenb@google.com>
In-Reply-To: <20221010225744.101629-1-surenb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 20 Oct 2022 15:25:47 -0700
Message-ID: <CAJuCfpHeJuZBbv-q+WXjgNHwt_caMomFPL3L9rxosXOrZz3fBw@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 1/1] psi: stop relying on timer_pending for
 poll_work rescheduling
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
X-CRM114-CacheID: sfid-20221020_152600_786849_30906A30 
X-CRM114-Status: GOOD (  42.64  )
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

On Mon, Oct 10, 2022 at 3:57 PM Suren Baghdasaryan <surenb@google.com> wrote:
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
> This patch somehow slipped through the cracks after being acked by Johannes in
> [1] and I didn't notice it until now because we cherry-picked it into Android
> kernel trees due to the urgency at that time. On the bright side, this change
> has been tested for about a year in the field by millions of devices.
> Resending v4 of this patch previously posted at [2], rebased on the latest
> Linus' TOT.

Hi Peter,
We missed this Ack'ed patch last year and as I described above I
didn't notice that up until now. With rc1 released, hopefully it's a
good time to ping you to ask for inclusion of this patch in your tree.
If the timing is not good, please let me know when to remind you and
I'll send another email. Just want to make sure it does not slip
again.

Just FYI, we have two other Ack'ed PSI patches for you to consider:

https://lore.kernel.org/all/20221014110551.22695-1-zhouchengming@bytedance.com/
https://lore.kernel.org/all/20220919072356.GA29069@haolee.io/

Thanks,
Suren.



>
> [1] https://lore.kernel.org/lkml/YOdwxh3487PeMHRX@cmpxchg.org/
> [2] https://lore.kernel.org/lkml/20210708203648.2399667-1-surenb@google.com/
>
>  include/linux/psi_types.h |  1 +
>  kernel/sched/psi.c        | 60 +++++++++++++++++++++++++++++++++------
>  2 files changed, 52 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
> index c7fe7c089718..3f78c9bf7bb1 100644
> --- a/include/linux/psi_types.h
> +++ b/include/linux/psi_types.h
> @@ -170,6 +170,7 @@ struct psi_group {
>         struct timer_list poll_timer;
>         wait_queue_head_t poll_wait;
>         atomic_t poll_wakeup;
> +       atomic_t poll_scheduled;
>
>         /* Protects data used by the monitor */
>         struct mutex trigger_lock;
> diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> index 7f6030091aee..2f548beeae50 100644
> --- a/kernel/sched/psi.c
> +++ b/kernel/sched/psi.c
> @@ -188,6 +188,7 @@ static void group_init(struct psi_group *group)
>         INIT_DELAYED_WORK(&group->avgs_work, psi_avgs_work);
>         mutex_init(&group->avgs_lock);
>         /* Init trigger-related members */
> +       atomic_set(&group->poll_scheduled, 0);
>         mutex_init(&group->trigger_lock);
>         INIT_LIST_HEAD(&group->triggers);
>         group->poll_min_period = U32_MAX;
> @@ -561,18 +562,17 @@ static u64 update_triggers(struct psi_group *group, u64 now)
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
> @@ -584,12 +584,15 @@ static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
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
> @@ -597,6 +600,43 @@ static void psi_poll_work(struct psi_group *group)
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
> @@ -622,7 +662,8 @@ static void psi_poll_work(struct psi_group *group)
>                 group->polling_next_update = update_triggers(group, now);
>
>         psi_schedule_poll_work(group,
> -               nsecs_to_jiffies(group->polling_next_update - now) + 1);
> +               nsecs_to_jiffies(group->polling_next_update - now) + 1,
> +               force_reschedule);
>
>  out:
>         mutex_unlock(&group->trigger_lock);
> @@ -747,7 +788,7 @@ static void psi_group_change(struct psi_group *group, int cpu,
>         write_seqcount_end(&groupc->seq);
>
>         if (state_mask & group->poll_states)
> -               psi_schedule_poll_work(group, 1);
> +               psi_schedule_poll_work(group, 1, false);
>
>         if (wake_clock && !delayed_work_pending(&group->avgs_work))
>                 schedule_delayed_work(&group->avgs_work, PSI_FREQ);
> @@ -1223,6 +1264,7 @@ void psi_trigger_destroy(struct psi_trigger *t)
>                  * can no longer be found through group->poll_task.
>                  */
>                 kthread_stop(task_to_destroy);
> +               atomic_set(&group->poll_scheduled, 0);
>         }
>         kfree(t);
>  }
> --
> 2.38.0.rc1.362.ged0d419d3c-goog
>

