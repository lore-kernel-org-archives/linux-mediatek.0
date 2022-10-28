Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7518C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 11:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5RI7hvtRdrjlyPBkAhYLEZK5lZB+15r7QIY1WhQgGI=; b=PNPREX79bzHogRB5/FdKCBs5Es
	iQnFV85F2tADSerRHY1O4DbH14NRBajZ/P2Wh0RUjFKDq0lh8o2dQgZkXD+pfqtu6ci6c4u9At+8i
	V9UZXMbEYry9rnGz8E96k7FJ/GwSBUt0lCzCvWVEYinGIwEUQ3skLqNR/kD11R2CmLqOUkGdiFajc
	l5/JMKkOIE5zHFB/PkkqL2MBcEHpmShJyq5hH4MdrtKsKzXzovNDKfr9blZjeHgyE8M0ilmFutaoU
	YaX4o1vMLa6Y837a54Kc82yhwqzV9UOzHOOIC/g13K6hoJu0E7C8M8+bW8zA4IY/gRXAc0rFMsLAx
	oqDT2OCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooNL8-00Gtn2-Ul; Fri, 28 Oct 2022 11:15:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooM96-00GUP2-A2
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 09:59:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id g24so4436457plq.3
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5RI7hvtRdrjlyPBkAhYLEZK5lZB+15r7QIY1WhQgGI=;
        b=4L9lmgoJxArc8qtpRxjL7wWHnATEEF/SE8BBz2AmWpfIwb7rRcWkWKGkY5kUnG7uCS
         ECeSdvQtpG19Giwcg1EGpD9fcYpx/yWftHG9cRaAXta9yJHP8FDVmTHk4+J1IsWbnc4f
         jkzrXccwMr8IfLZkhFyrH8u41ZwSoTPCYl6oHIdP5fjhIA/3Qlbj4x/qieUYZGh06/0p
         D/BZMic1jT9TN/zVt7Ul0czq334YTrLN591L/sjucHmcR/Z1ZP9gc0bI+AzCdnriLYIZ
         HpTSePrCMG/SGzUd22GXwvR2sHA3ZBSUaUL9ixBK7VWvF9N4oCxlg5eHQKM/UkZt7QTH
         kS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5RI7hvtRdrjlyPBkAhYLEZK5lZB+15r7QIY1WhQgGI=;
        b=LZ7waUDXyVHZDwjmqXH6+TJHNsCs35NSxTaFczo8GBgSitWwCaNXFAPnw+F6m3n1e7
         vlTG+2/ATDFGTMgW+NdaHZLFB7sAPniTQRUBoC5HVioqfPe9k2kdfOsqq2+04Um7pzjG
         2qG/MKtw5GUh7UvEIOh4jMc3V12vLQioj1btHZtOcLSjjN4VhpezHaMoOyNwlCUpLmPh
         QzpzMzFZMzO2yXCDqyiUCz1adtt50fiKt+Q9Pz94UuXiIFnhQwavxEYOmj5qXPPAQzpS
         OCt2jw9OaDnAOI4wPvI763p4knSqT7wtdRg5ANN5DVPsYMTzkXLy9VBxoz3zmSJzwJVA
         gEjw==
X-Gm-Message-State: ACrzQf3mjUnnkPicdmrDdRs4zBHeLSZUHnS6DsTWGkbsjAFBv0fPw/4p
	HAaQfOIbM7d583ut8OrQWZ68bQ==
X-Google-Smtp-Source: AMsMyM6EFLQbV54vSm2ubj5TrDukNwaAFrBWkoeWLcXmvs40wkPSFg9Om96buqK+svzKNZSbd5mTvQ==
X-Received: by 2002:a17:902:dac4:b0:186:c372:732a with SMTP id q4-20020a170902dac400b00186c372732amr18572246plx.174.1666951160275;
        Fri, 28 Oct 2022 02:59:20 -0700 (PDT)
Received: from [10.255.236.92] ([139.177.225.252])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902ea0e00b001785fa792f4sm2677872plg.243.2022.10.28.02.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 02:59:19 -0700 (PDT)
From: Chengming Zhou <zhouchengming@bytedance.com>
X-Google-Original-From: Chengming Zhou <chengming.zhou@linux.dev>
Message-ID: <2aa48d3a-bb37-bf4b-9842-41b3c740efcd@linux.dev>
Date: Fri, 28 Oct 2022 17:59:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
Cc: peterz@infradead.org, hannes@cmpxchg.org, mingo@redhat.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, matthias.bgg@gmail.com, minchan@google.com,
 yt.chang@mediatek.com, wenju.xu@mediatek.com, jonathan.jmchen@mediatek.com,
 show-hong.chen@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-team@android.com
References: <20221026233839.1934419-1-surenb@google.com>
In-Reply-To: <20221026233839.1934419-1-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_025924_405076_4B4DAA55 
X-CRM114-Status: GOOD (  38.09  )
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

Hello,

On 2022/10/27 07:38, Suren Baghdasaryan wrote:
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
>  	struct timer_list poll_timer;
>  	wait_queue_head_t poll_wait;
>  	atomic_t poll_wakeup;
> +	atomic_t poll_scheduled;
>  
>  	/* Protects data used by the monitor */
>  	struct mutex trigger_lock;
> diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> index dbaeac915895..19d05b5c8a55 100644
> --- a/kernel/sched/psi.c
> +++ b/kernel/sched/psi.c
> @@ -189,6 +189,7 @@ static void group_init(struct psi_group *group)
>  	INIT_DELAYED_WORK(&group->avgs_work, psi_avgs_work);
>  	mutex_init(&group->avgs_lock);
>  	/* Init trigger-related members */
> +	atomic_set(&group->poll_scheduled, 0);
>  	mutex_init(&group->trigger_lock);
>  	INIT_LIST_HEAD(&group->triggers);
>  	group->poll_min_period = U32_MAX;
> @@ -580,18 +581,17 @@ static u64 update_triggers(struct psi_group *group, u64 now)
>  	return now + group->poll_min_period;
>  }
>  
> -/* Schedule polling if it's not already scheduled. */
> -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> +/* Schedule polling if it's not already scheduled or forced. */
> +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> +				   bool force)
>  {
>  	struct task_struct *task;
>  
>  	/*
> -	 * Do not reschedule if already scheduled.
> -	 * Possible race with a timer scheduled after this check but before
> -	 * mod_timer below can be tolerated because group->polling_next_update
> -	 * will keep updates on schedule.
> +	 * atomic_xchg should be called even when !force to provide a
> +	 * full memory barrier (see the comment inside psi_poll_work).
>  	 */
> -	if (timer_pending(&group->poll_timer))
> +	if (atomic_xchg(&group->poll_scheduled, 1) && !force)
>  		return;
>  
>  	rcu_read_lock();
> @@ -603,12 +603,15 @@ static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
>  	 */
>  	if (likely(task))
>  		mod_timer(&group->poll_timer, jiffies + delay);
> +	else
> +		atomic_set(&group->poll_scheduled, 0);
>  
>  	rcu_read_unlock();
>  }
>  
>  static void psi_poll_work(struct psi_group *group)
>  {
> +	bool force_reschedule = false;
>  	u32 changed_states;
>  	u64 now;
>  
> @@ -616,6 +619,43 @@ static void psi_poll_work(struct psi_group *group)
>  
>  	now = sched_clock();
>  
> +	if (now > group->polling_until) {
> +		/*
> +		 * We are either about to start or might stop polling if no
> +		 * state change was recorded. Resetting poll_scheduled leaves
> +		 * a small window for psi_group_change to sneak in and schedule
> +		 * an immegiate poll_work before we get to rescheduling. One

"immegiate" should be "immediate"?


> +		 * potential extra wakeup at the end of the polling window
> +		 * should be negligible and polling_next_update still keeps
> +		 * updates correctly on schedule.
> +		 */
> +		atomic_set(&group->poll_scheduled, 0);
> +		/*
> +		 * A task change can race with the poll worker that is supposed to
> +		 * report on it. To avoid missing events, ensure ordering between
> +		 * poll_scheduled and the task state accesses, such that if the poll
> +		 * worker misses the state update, the task change is guaranteed to
> +		 * reschedule the poll worker:
> +		 *
> +		 * poll worker:
> +		 *   atomic_set(poll_scheduled, 0)
> +		 *   smp_mb()
> +		 *   LOAD states
> +		 *
> +		 * task change:
> +		 *   STORE states
> +		 *   if atomic_xchg(poll_scheduled, 1) == 0:
> +		 *     schedule poll worker
> +		 *
> +		 * The atomic_xchg() implies a full barrier.
> +		 */
> +		smp_mb();
> +	} else {
> +		/* Polling window is not over, keep rescheduling */
> +		force_reschedule = true;
> +	}

Maybe we don't need force_reschedule special case? If this poller
need to reschedule and see force_reschedule set by task change,
then it doesn't re-arm poll_timer.

Or if we want this poller to override the timeout value of poll_timer,
we can always use force==true here?

Thanks.

> +
> +
>  	collect_percpu_times(group, PSI_POLL, &changed_states);
>  
>  	if (changed_states & group->poll_states) {
> @@ -641,7 +681,8 @@ static void psi_poll_work(struct psi_group *group)
>  		group->polling_next_update = update_triggers(group, now);
>  
>  	psi_schedule_poll_work(group,
> -		nsecs_to_jiffies(group->polling_next_update - now) + 1);
> +		nsecs_to_jiffies(group->polling_next_update - now) + 1,
> +		force_reschedule);
>  
>  out:
>  	mutex_unlock(&group->trigger_lock);
> @@ -802,7 +843,7 @@ static void psi_group_change(struct psi_group *group, int cpu,
>  	write_seqcount_end(&groupc->seq);
>  
>  	if (state_mask & group->poll_states)
> -		psi_schedule_poll_work(group, 1);
> +		psi_schedule_poll_work(group, 1, false);
>  
>  	if (wake_clock && !delayed_work_pending(&group->avgs_work))
>  		schedule_delayed_work(&group->avgs_work, PSI_FREQ);
> @@ -956,7 +997,7 @@ void psi_account_irqtime(struct task_struct *task, u32 delta)
>  		write_seqcount_end(&groupc->seq);
>  
>  		if (group->poll_states & (1 << PSI_IRQ_FULL))
> -			psi_schedule_poll_work(group, 1);
> +			psi_schedule_poll_work(group, 1, false);
>  	} while ((group = group->parent));
>  }
>  #endif
> @@ -1342,6 +1383,7 @@ void psi_trigger_destroy(struct psi_trigger *t)
>  		 * can no longer be found through group->poll_task.
>  		 */
>  		kthread_stop(task_to_destroy);
> +		atomic_set(&group->poll_scheduled, 0);
>  	}
>  	kfree(t);
>  }

