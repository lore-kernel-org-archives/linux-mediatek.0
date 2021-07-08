Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FB4C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 19:55:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 964D661874
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 19:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 964D661874
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6HO1C+CdM9H4qZ7pe3o2+Mdr8nY/DdQ0X1nnJwgkxs=; b=eSJp+47dufC852
	GMDEU1mDHT0l7J26MWr+Nh4ZSeniQZDXVi+T6Qc73Lwa6uvK5mJbpMvO+RxSkS62nebGn+b5uXoix
	4sHo1wPM0ls0Dg+voQgMLp6y5CH2i4nfeL8pZ+g19CVKpj2hH1yAJA8AQr3Pvv406vhQIDza9WYHI
	O/4qoVw125saM3bnIhsyCIHbFhggnfRzr+0r92A2ZI/ZQ98nXN5MEtbcg6Fo/7IeWyVjINmXeuRat
	2GfFuDP5IumhlyZUyxcWq3GTvOahmWXPbLTMSeZNtPYQcxhp/TKj/1jWvx1NBDoSp4zHHSbj1oYHf
	1voDGaZYgNc9kRJcZt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1a7h-000DXo-3j; Thu, 08 Jul 2021 19:55:49 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1a7S-000DUJ-Fv
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 19:55:37 +0000
Received: by mail-yb1-xb35.google.com with SMTP id a16so10855544ybt.8
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9iOwtoKh5dIem8Q7pumODGxDiYORpzZAEGyCC5iaV0=;
 b=XUR2GC0nhu7k0ndzcebonfz2/tdwPtDew+NcmbDNh5tyOaUVYoEMVeS4733HmAdo0b
 HAUFkJF8iqRIvigI+mefLb9/qCWXCkcP+ik3Pms27FP9Vc1kHf93J2kv/DwW9QLZIeLx
 4tgBdDDgmt3Udw6JJLRWmB3NIEzu4OVqSNGjBZIiSOUnGpR3mzNedPFNRbmk0CUdVAR1
 bd4tbYMJj756MPeyvNgVLkd+f19D3MZj+8p+46j0Bfz4wMxq0xFraK/TZwqf+RqEgzV7
 bUuPZiy+sv4wizOCuh0OkMVdRP+w3rZEY0nWI+RnlMytH4kLB1O+9RcDMpe1Z9KzwleR
 t25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9iOwtoKh5dIem8Q7pumODGxDiYORpzZAEGyCC5iaV0=;
 b=dKjg7PdhrldbCV0VfkrMsYSzduamMSRzUYB1m4U1ooe4PYXK6MmlLlAZ981Ii24k/K
 hIThOryr2uGy1ll0Ru//nfY+cKOljyUbWe9CT3KpYwTLUYo8n1pXzgM0CKBHK7+SPV8D
 T2zqQZOQePfuHuxS36Tkb/L3KvfNU4s4idVKl3WJ9s6J8Xby1lwparSv1PjNDKLedV3u
 WpPmdJau9E6hWpclKuIBC2grev11bDf0gHaflYSK3obPtG/Pq3bjc6XsnPIjF9KtKCRx
 Ipo8IxKHwpWMqqmWUGRy8sp1rIkwFi7HuR+0TyvzrQw0Rs5VXpklB3pIAl/WJhqeOiEy
 QZQg==
X-Gm-Message-State: AOAM533/uV/q3i52YXEJo7v9SRJQtjzjG/c83e1ETxxfGJSzts8mh3Op
 /LhQeZtd8xGzb47J0dDmbbskCNdeRGI0+s12TokgVw==
X-Google-Smtp-Source: ABdhPJxphBkJdzx//zx+e418675z33iJqy2cKWUye6RjIYyGU1cr/7kJ/jWfapwOSx49L0P0x4shlToXrYbzl5YFeYA=
X-Received: by 2002:a25:71c4:: with SMTP id
 m187mr35918036ybc.397.1625774133119; 
 Thu, 08 Jul 2021 12:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210707023933.1691149-1-surenb@google.com>
 <YOWugYxQ9Yfsqba2@cmpxchg.org>
 <CAJuCfpGx22iTaDGCfOrM_pD6PYZqQrni2+u5jQy+NpNeNg7B9w@mail.gmail.com>
 <YOcPUs97epJ5VrEf@cmpxchg.org>
 <CAJuCfpFCi6fa+Ke4bvP9hbMeC82VaT6twNWC3+ckXz6yD0qCtQ@mail.gmail.com>
 <YOdGNVFtYAKmfpiY@cmpxchg.org>
In-Reply-To: <YOdGNVFtYAKmfpiY@cmpxchg.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 Jul 2021 12:55:22 -0700
Message-ID: <CAJuCfpHccsaV46x6kTf4d8iZNjXAS-iXLXsupDb=OiNsNJ-RKw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210708_125534_607782_A9D97397 
X-CRM114-Status: GOOD (  43.15  )
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

On Thu, Jul 8, 2021 at 11:38 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Thu, Jul 08, 2021 at 08:54:56AM -0700, Suren Baghdasaryan wrote:
> > On Thu, Jul 8, 2021 at 7:44 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > > On Wed, Jul 07, 2021 at 03:43:48PM -0700, Suren Baghdasaryan wrote:
> > > > On Wed, Jul 7, 2021 at 6:39 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > > > > This looks good to me now code wise. Just a comment on the comments:
> > > > >
> > > > > On Tue, Jul 06, 2021 at 07:39:33PM -0700, Suren Baghdasaryan wrote:
> > > > > > @@ -559,18 +560,14 @@ static u64 update_triggers(struct psi_group *group, u64 now)
> > > > > >       return now + group->poll_min_period;
> > > > > >  }
> > > > > >
> > > > > > -/* Schedule polling if it's not already scheduled. */
> > > > > > -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> > > > > > +/* Schedule polling if it's not already scheduled or forced. */
> > > > > > +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> > > > > > +                                bool force)
> > > > > >  {
> > > > > >       struct task_struct *task;
> > > > > >
> > > > > > -     /*
> > > > > > -      * Do not reschedule if already scheduled.
> > > > > > -      * Possible race with a timer scheduled after this check but before
> > > > > > -      * mod_timer below can be tolerated because group->polling_next_update
> > > > > > -      * will keep updates on schedule.
> > > > > > -      */
> > > > > > -     if (timer_pending(&group->poll_timer))
> > > > > > +     /* xchg should be called even when !force to set poll_scheduled */
> > > > > > +     if (atomic_xchg(&group->poll_scheduled, 1) && !force)
> > > > > >               return;
> > > > >
> > > > > This explains what the code does, but not why. It would be good to
> > > > > explain the ordering with poll_work, here or there. But both sides
> > > > > should mention each other.
> > > >
> > > > How about this:
> > > >
> > > > /*
> > > >  * atomic_xchg should be called even when !force to always set poll_scheduled
> > > >  * and to provide a memory barrier (see the comment inside psi_poll_work).
> > > >  */
> > >
> > > The memory barrier part makes sense, but the first part says what the
> > > code does and the message is unclear to me. Are you worried somebody
> > > might turn this around in the future and only conditionalize on
> > > poll_scheduled when !force? Essentially, I don't see the downside of
> > > dropping that. But maybe I'm missing something.
> >
> > Actually you are right. Originally I was worried that there might be a
> > case when poll_scheduled==0 and force==true and if someone flips the
> > conditions we will reschedule the timer but will not set
> > poll_scheduled back to 1.
>
> Oh I see.
>
> Right, flipping the condition doesn't make sense because we need
> poll_scheduled to be set when we go ahead - whether we're forcing or
> not. I.e. if we were in a locked section, we'd write it like this:
>
>         if (poll_scheduled)
>                 if (!force)
>                         return;
>         else
>                 poll_scheduled = 1;
>
> > However I don't think this condition is possible. We set force=true
> > only when we skipped resetting poll_schedule to 0 and on initial
> > wakeup we always reset poll_schedule. How about changing the comment
> > to this:
> >
> >  /*
> >   * atomic_xchg should be called even when !force to provide a
> >   * full memory barrier (see the comment inside psi_poll_work).
> >   */
>
> Personally, I still find this more confusing than no comment on
> !force, because when you read it it sort of raises the question what
> the alternatives would be. And the alternatives appear to be
> nonsensical code rather than legitimate options.
>
> But I won't insist if you prefer to leave it in. Your call.

I would like to keep it as a precaution, if you don't mind. In case
someone in the future thinks about "optimizing" this by flipping the
condition, hopefully the comment will give them a pause to think about
it :)

>
> > > /*
> > >  * A task change can race with the poll worker that is supposed to
> > >  * report on it. To avoid missing events, ensure ordering between
> > >  * poll_scheduled and the task state accesses, such that if the poll
> > >  * worker misses the state update, the task change is guaranteed to
> > >  * reschedule the poll worker:
> > >  *
> > >  * poll worker:
> > >  *   atomic_set(poll_scheduled, 0)
> > >  *   smp_mb()
> > >  *   LOAD states
> > >  *
> > >  * task change:
> > >  *   STORE states
> > >  *   if atomic_xchg(poll_scheduled, 1) == 0:
> > >  *     schedule poll worker
> > >  *
> > >  * The atomic_xchg() implies a full barrier.
> > >  */
> > >  smp_mb();
> > >
> > > This gives a high-level view of what's happening but it can still be
> > > mapped to the code by following the poll_scheduled variable.
> >
> > This looks really good to me.
> > If you agree on the first comment modification, should I respin the
> > next version?
>
> Yeah, sounds good to me!

Thanks! I'll post an update shortly.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
