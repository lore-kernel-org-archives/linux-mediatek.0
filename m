Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1BDC4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 17:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2287B61026
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 17:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2287B61026
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42niKLSbLBT5CqfNKzRFwHX8Kl66LmnibtL/3XlQ2XQ=; b=VxkDRVebs2hXsL
	N/l8drjZx5qBSad0LZs2v6bDbNfgUqm+bW7L4XzMIsz6x6Mz37KPl0cdJgh0J0AAkioZ/1PH2citj
	uaiSrXQ5G5A2v27MlcuJ/yYf2CrHxDmdMfefITnDDdYfWPicHar1TEJ0ZLc6nNsiEz6QuSg4EzFO3
	s4otwNyPEBqWydHnatkS3p65lsyWAozSUhRwb8T3aNKzvf/LnNty01zXWsjelnCDmGzsd75sd8lH2
	qjiP3uzDvU92smwQnGLWrQh2tLjRXdwQkNnLxGshRPCT8sSuSEFq1wR8HUWFSYCRua81fiQ3FLzHA
	M1+mnS06k2hvOlHfGPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvO3w-004Jez-Vb; Mon, 21 Jun 2021 17:50:21 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvO3j-004Jd4-Hg
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 17:50:09 +0000
Received: by mail-qk1-x729.google.com with SMTP id q190so29986899qkd.2
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 10:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0QYGl9t3B61p3R4Pfjr060utSFzWiSQkdLXIYb/zDdU=;
 b=vQO+htf2wJiurDmp/ETx8qrS2CmegvFArWxmNRlTd53GO3BL2uXW+476bbAtRdYUFv
 fEsY6OoIVJs10HLvz23S12dlzvHszeIwF6GO551jBl8WEE+LGFCY7K4xbrULjQ/Eq0hY
 NXaMinlAkA+NgtTuTBLv5PhO6a/Bxa9YBt1PJvuzJb4dAg3K9Gyv5UU8olcIf7JWUgFl
 69/W4pCrc6556Y/QNohnlHZXxki8z5KuEdyZcgDRHWO3HZzxC+ey0bB1MM1veRGQSxth
 SMmpPWf5ouZ09Rqa4V/LpyEa23oS1ztdts+Dr9DtZhKOjLI3zoTu1ygx5Xy1VhcsT5oK
 huzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0QYGl9t3B61p3R4Pfjr060utSFzWiSQkdLXIYb/zDdU=;
 b=ix9rBPQvCPl8HwoS6h6IbL5m+CLYrHvzSEj1j6G/OTw6inQlX9Axc8O/1alGQqQIOL
 39Ay2gyX1UAZese97HKBlVBZoMA2B7Et10Su9rXXR9ry5G6OU5rnwL/co1E/aASCx7L5
 iKz+KnVR2ARKsbNDCb30jo4whRCsspuvrCTJheD4X3iJEgh9uaXFqQeUenDBznKu6fxl
 Fyysit326J6r60+X50S0MQAdCWaA8AmuQQmhz3jzEkszwYhQGkQPNyNxjsnczPCoZDke
 Goe4xczlIg3HXgRyR2etZ9XZ/Kh3tprSxb9fzYu7bdElyV/OoQRm+Zd/wZBcz6gNtFrm
 Z84w==
X-Gm-Message-State: AOAM531OUEGu7dN5o37FZsRavliBiksfay7CLAGsOhbz4t7ITfohcsX4
 P8whL6JVqhdLqjXynBzszCAqTpVtQuYa7F8XPOBDUA==
X-Google-Smtp-Source: ABdhPJxVCgsHJS4z4r6vdeC54bjfTB0TRyEX/a1svKHT+Uo7aj0C2k0zBLHPm78uBc2TVzQuxec9cJOeWBPq7YilNes=
X-Received: by 2002:a25:4181:: with SMTP id o123mr12807053yba.23.1624297802325; 
 Mon, 21 Jun 2021 10:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210617212654.1529125-1-surenb@google.com>
 <bc8128a17df82dcd0440a9d5a1a7e33135c2a2d3.camel@mediatek.com>
In-Reply-To: <bc8128a17df82dcd0440a9d5a1a7e33135c2a2d3.camel@mediatek.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 21 Jun 2021 10:49:51 -0700
Message-ID: <CAJuCfpGZrwj=4iDyLqzdHNQxb1UxtcQ5wzWim67V+B3BxWsT7A@mail.gmail.com>
Subject: Re: [PATCH 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
To: YT Chang <yt.chang@mediatek.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>, matthias.bgg@gmail.com, 
 Minchan Kim <minchan@google.com>, Tim Murray <timmurray@google.com>, 
 =?UTF-8?B?V2VuanUgWHUgKOiuuOaWh+S4vik=?= <wenju.xu@mediatek.com>, 
 =?UTF-8?B?Sm9uYXRoYW4gSk1DaGVuICjpmbPlrrbmmI4p?=
 <jonathan.jmchen@mediatek.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel-team <kernel-team@android.com>, 
 show-hong.chen@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_105007_644319_7F11E0B9 
X-CRM114-Status: GOOD (  42.07  )
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

On Mon, Jun 21, 2021 at 5:31 AM YT Chang <yt.chang@mediatek.com> wrote:
>
> On Thu, 2021-06-17 at 14:26 -0700, Suren Baghdasaryan wrote:
> > Psi polling mechanism is trying to minimize the number of wakeups to
> > run psi_poll_work and is currently relying on timer_pending() to
> > detect
> > when this work is already scheduled. This provides a window of
> > opportunity
> > for psi_group_change to schedule an immediate psi_poll_work after
> > poll_timer_fn got called but before psi_poll_work could reschedule
> > itself.
> > Below is the depiction of this entire window:
> >
> > poll_timer_fn
> >   wake_up_interruptible(&group->poll_wait);
> >
> > psi_poll_worker
> >   wait_event_interruptible(group->poll_wait, ...)
> >   psi_poll_work
> >     psi_schedule_poll_work
> >       if (timer_pending(&group->poll_timer)) return;
> >       ...
> >       mod_timer(&group->poll_timer, jiffies + delay);
> >
> > Prior to 461daba06bdc we used to rely on poll_scheduled atomic which
> > was
> > reset and set back inside psi_poll_work and therefore this race
> > window
> > was much smaller.
> > The larger window causes increased number of wakeups and our partners
> > report visible power regression of ~10mA after applying 461daba06bdc.
> > Bring back the poll_scheduled atomic and make this race window even
> > narrower by resetting poll_scheduled only when we reach polling
> > expiration
> > time. This does not completely eliminate the possibility of extra
> > wakeups
> > caused by a race with psi_group_change however it will limit it to
> > the
> > worst case scenario of one extra wakeup per every tracking window
> > (0.5s
> > in the worst case).
> > By tracing the number of immediate rescheduling attempts performed by
> > psi_group_change and the number of these attempts being blocked due
> > to
> > psi monitor being already active, we can assess the effects of this
> > change:
> >
> > Before the patch:
> >                                            Run#1    Run#2      Run#3
> > Immediate reschedules
> > attempted:           684365   1385156    1261240
> > Immediate reschedules
> > blocked:             682846   1381654    1258682
> > Immediate reschedules (delta):             1519     3502       2558
> > Immediate reschedules (% of attempted):    0.22%    0.25%      0.20%
> >
> > After the patch:
> >                                            Run#1    Run#2      Run#3
> > Immediate reschedules attempted:           882244   770298    426218
> > Immediate reschedules blocked:             881996   769796    426074
> > Immediate reschedules (delta):             248      502       144
> > Immediate reschedules (% of attempted):    0.03%    0.07%     0.03%
> >
> > The number of non-blocked immediate reschedules dropped from 0.22-
> > 0.25%
> > to 0.03-0.07%. The drop is attributed to the decrease in the race
> > window
> > size and the fact that we allow this race only when psi monitors
> > reach
> > polling window expiration time.
> >
>
>
> The regression power data points of Android phone in home screen idle:
> Original        :baseline
> Original+ Patch : -21.5% (-11.5mA)

Ok, so this fixes the regression and then some (original regression
was +10mA and with the patch we've got -11.5mA). This must be the
contribution of the additional logic I added to avoid resetting
poll_scheduled when we know that the polling window is not yet over
(line with  /* Polling window is not over, keep rescheduling */
comment).

> Tested-by: SH Chen <show-hong.chen@mediatek.com>

Thanks!

>
> > Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger
> > scheduling mechanism")
> > Reported-by: Kathleen Chang <yt.chang@mediatek.com>
> > Reported-by: Wenju Xu <wenju.xu@mediatek.com>
> > Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/psi_types.h |  1 +
> >  kernel/sched/psi.c        | 41 ++++++++++++++++++++++++++++---------
> > --
> >  2 files changed, 31 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
> > index 0a23300d49af..ef8bd89d065e 100644
> > --- a/include/linux/psi_types.h
> > +++ b/include/linux/psi_types.h
> > @@ -158,6 +158,7 @@ struct psi_group {
> >       struct timer_list poll_timer;
> >       wait_queue_head_t poll_wait;
> >       atomic_t poll_wakeup;
> > +     atomic_t poll_scheduled;
> >
> >       /* Protects data used by the monitor */
> >       struct mutex trigger_lock;
> > diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> > index cc25a3cff41f..fed7c9c2b276 100644
> > --- a/kernel/sched/psi.c
> > +++ b/kernel/sched/psi.c
> > @@ -193,6 +193,7 @@ static void group_init(struct psi_group *group)
> >       INIT_DELAYED_WORK(&group->avgs_work, psi_avgs_work);
> >       mutex_init(&group->avgs_lock);
> >       /* Init trigger-related members */
> > +     atomic_set(&group->poll_scheduled, 0);
> >       mutex_init(&group->trigger_lock);
> >       INIT_LIST_HEAD(&group->triggers);
> >       memset(group->nr_triggers, 0, sizeof(group->nr_triggers));
> > @@ -551,18 +552,14 @@ static u64 update_triggers(struct psi_group
> > *group, u64 now)
> >       return now + group->poll_min_period;
> >  }
> >
> > -/* Schedule polling if it's not already scheduled. */
> > -static void psi_schedule_poll_work(struct psi_group *group, unsigned
> > long delay)
> > +/* Schedule polling if it's not already scheduled or forced. */
> > +static void psi_schedule_poll_work(struct psi_group *group, unsigned
> > long delay,
> > +                                bool force)
> >  {
> >       struct task_struct *task;
> >
> > -     /*
> > -      * Do not reschedule if already scheduled.
> > -      * Possible race with a timer scheduled after this check but
> > before
> > -      * mod_timer below can be tolerated because group-
> > >polling_next_update
> > -      * will keep updates on schedule.
> > -      */
> > -     if (timer_pending(&group->poll_timer))
> > +     /* cmpxchg should be called even when !force to set
> > poll_scheduled */
> > +     if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) != 0 &&
> > !force)
> >               return;
> >
> >       rcu_read_lock();
> > @@ -574,12 +571,15 @@ static void psi_schedule_poll_work(struct
> > psi_group *group, unsigned long delay)
> >        */
> >       if (likely(task))
> >               mod_timer(&group->poll_timer, jiffies + delay);
> > +     else
> > +             atomic_set(&group->poll_scheduled, 0);
> >
> >       rcu_read_unlock();
> >  }
> >
> >  static void psi_poll_work(struct psi_group *group)
> >  {
> > +     bool force_reschedule = false;
> >       u32 changed_states;
> >       u64 now;
> >
> > @@ -587,6 +587,23 @@ static void psi_poll_work(struct psi_group
> > *group)
> >
> >       now = sched_clock();
> >
> > +     if (now > group->polling_until) {
> > +             /*
> > +              * We are either about to start or might stop polling
> > if no
> > +              * state change was recorded. Resetting poll_scheduled
> > leaves
> > +              * a small window for psi_group_change to sneak in and
> > schedule
> > +              * an immegiate poll_work before we get to
> > rescheduling. One
> > +              * potential extra wakeup at the end of the polling
> > window
> > +              * should be negligible and polling_next_update still
> > keeps
> > +              * updates correctly on schedule.
> > +              */
> > +             atomic_set(&group->poll_scheduled, 0);
> > +     } else {
> > +             /* Polling window is not over, keep rescheduling */
> > +             force_reschedule = true;
> > +     }
> > +
> > +
> >       collect_percpu_times(group, PSI_POLL, &changed_states);
> >
> >       if (changed_states & group->poll_states) {
> > @@ -612,7 +629,8 @@ static void psi_poll_work(struct psi_group
> > *group)
> >               group->polling_next_update = update_triggers(group,
> > now);
> >
> >       psi_schedule_poll_work(group,
> > -             nsecs_to_jiffies(group->polling_next_update - now) +
> > 1);
> > +             nsecs_to_jiffies(group->polling_next_update - now) + 1,
> > +             force_reschedule);
> >
> >  out:
> >       mutex_unlock(&group->trigger_lock);
> > @@ -736,7 +754,7 @@ static void psi_group_change(struct psi_group
> > *group, int cpu,
> >       write_seqcount_end(&groupc->seq);
> >
> >       if (state_mask & group->poll_states)
> > -             psi_schedule_poll_work(group, 1);
> > +             psi_schedule_poll_work(group, 1, false);
> >
> >       if (wake_clock && !delayed_work_pending(&group->avgs_work))
> >               schedule_delayed_work(&group->avgs_work, PSI_FREQ);
> > @@ -1235,6 +1253,7 @@ static void psi_trigger_destroy(struct kref
> > *ref)
> >                */
> >               del_timer_sync(&group->poll_timer);
> >               kthread_stop(task_to_destroy);
> > +             atomic_set(&group->poll_scheduled, 0);
> >       }
> >       kfree(t);
> >  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
