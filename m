Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDDAC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 20:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9B261607
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 20:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9B261607
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKUwdKd1xxUbps7+fLnGX6jyTCVuGcWtrBFnvEMi2Oo=; b=Lw3Rb9G9j2dx9k
	F9t2PlDWI0tVU3JS7sG6hdlffk91fauwKRMbRozyv4AsIHSzHz3h21d069JOIQgqUfKMyN5eajpMS
	UK0xeQ1ISXQ8wzCOkehx/vmT2JL4+LFsbvZUjgIdfqQn8cIShR9tZIt1t+y/BhzUeMYZx/5pYy823
	On/Ws2K52LnegcE7qjzwC3YwOi1FPsSIdyPvoD1f17ze1LaNn22RW4G44F+tmxSyCgHJ9fjI3o/uV
	gjrHNYE6qa7F4ZyG44LIapPR48XeD5x//T9NcccRKlFBVL97rM2n74q3bhdaAjaOy5YegP5GLrqlW
	gadvLzjfRgmFO5CGgxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1amS-000FUh-KB; Thu, 08 Jul 2021 20:37:56 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1amP-000FTT-3f
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 20:37:54 +0000
Received: by mail-yb1-xb34.google.com with SMTP id g19so11038974ybe.11
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 13:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=quNkVFERBfqRsQdRUvNNLim7z/eBis9fHeSRZyqbuMY=;
 b=L4CmWEzq1HtHgDkp1bstSyQk/Yiv/b6rcPVzbCc4+9OJGa+BNDQ+mtyTzgZ+RdOnvz
 P1jOvcAOm+7Tz/iNxmVpuLa/bgx5cuU1YHHu0Mze6Sfkjigb+ZAO8dqnQyiwuZxSPxd7
 CFv0lbgX+v3MeUdjraiiXSC1kSe6Nntqkxv5M2rIFFjyREmcwvZS5youBX3FW0sQZgoK
 xvtwN5aOGwnwtbRNRdVCYjqfJLHMSIcr4c6uNZBLmFKKoS3TFL5YKbYvYZeZ277QEdmp
 tTsblN32Ghp5uxWNd0ZiI63GSseD9wckJ6Fx/yGbWWaXwBvpM9mAwryapBNcGM8M299L
 1pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=quNkVFERBfqRsQdRUvNNLim7z/eBis9fHeSRZyqbuMY=;
 b=ON6500CdqHXYQb1vfvucdtJdWnsqGh6vYA/Ar+7P7oVdWhaX85VmdFvvPdAtYaRqSc
 +s+XliDtmhi/+cBqqbdhzDCJgVk/pKv/4PvuDlNtPp6XxpX3xNtR6prgiBHyD+R9EXAR
 ppMBKiHY1b1sjEa8m57SUqroz22FPBzl47MtsLF0ZAtVsh+znuvZzm0G3nHb32OGPmg6
 2mERsukJmDmGiZKdoNmI4Yc7tWXojs0OoWFQeSKbN3e06AS6/WGqwlomDivkrQNDJnXb
 WfgtpFjjqF0d1WiNS36cOGkUPVbGJRd1fjOQMd6tTTyjFeDTOtUjznKLp1NuBrcvgPmb
 bfcQ==
X-Gm-Message-State: AOAM5314liWbEonUXsnhKWApaorio28uItTXdqLkN/lErx/PGpa9kgBW
 h5bEWxDoBJ9gLnDMZFRa+CEGGVZYPOT5mKmCiefc8g==
X-Google-Smtp-Source: ABdhPJwNXNjgLwOlAVBIUh8VD1TMzbwe17rKlYiI1+JtsRU7d5b+smDmOQNgt8CPoUHkSIea9WaEPu5EkGjtCThsKoM=
X-Received: by 2002:a25:2341:: with SMTP id j62mr43330071ybj.190.1625776672101; 
 Thu, 08 Jul 2021 13:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210707023933.1691149-1-surenb@google.com>
 <YOWugYxQ9Yfsqba2@cmpxchg.org>
 <CAJuCfpGx22iTaDGCfOrM_pD6PYZqQrni2+u5jQy+NpNeNg7B9w@mail.gmail.com>
 <YOcPUs97epJ5VrEf@cmpxchg.org>
 <CAJuCfpFCi6fa+Ke4bvP9hbMeC82VaT6twNWC3+ckXz6yD0qCtQ@mail.gmail.com>
 <YOdGNVFtYAKmfpiY@cmpxchg.org>
 <CAJuCfpHccsaV46x6kTf4d8iZNjXAS-iXLXsupDb=OiNsNJ-RKw@mail.gmail.com>
In-Reply-To: <CAJuCfpHccsaV46x6kTf4d8iZNjXAS-iXLXsupDb=OiNsNJ-RKw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 Jul 2021 13:37:40 -0700
Message-ID: <CAJuCfpGZ8GrxW8-qYgtLykUzZmOo=-ge88vnLgXwLRkzgU-gTA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210708_133753_225544_37EBA6C9 
X-CRM114-Status: GOOD (  45.23  )
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

On Thu, Jul 8, 2021 at 12:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Thu, Jul 8, 2021 at 11:38 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Thu, Jul 08, 2021 at 08:54:56AM -0700, Suren Baghdasaryan wrote:
> > > On Thu, Jul 8, 2021 at 7:44 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > > > On Wed, Jul 07, 2021 at 03:43:48PM -0700, Suren Baghdasaryan wrote:
> > > > > On Wed, Jul 7, 2021 at 6:39 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > > > > > This looks good to me now code wise. Just a comment on the comments:
> > > > > >
> > > > > > On Tue, Jul 06, 2021 at 07:39:33PM -0700, Suren Baghdasaryan wrote:
> > > > > > > @@ -559,18 +560,14 @@ static u64 update_triggers(struct psi_group *group, u64 now)
> > > > > > >       return now + group->poll_min_period;
> > > > > > >  }
> > > > > > >
> > > > > > > -/* Schedule polling if it's not already scheduled. */
> > > > > > > -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> > > > > > > +/* Schedule polling if it's not already scheduled or forced. */
> > > > > > > +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> > > > > > > +                                bool force)
> > > > > > >  {
> > > > > > >       struct task_struct *task;
> > > > > > >
> > > > > > > -     /*
> > > > > > > -      * Do not reschedule if already scheduled.
> > > > > > > -      * Possible race with a timer scheduled after this check but before
> > > > > > > -      * mod_timer below can be tolerated because group->polling_next_update
> > > > > > > -      * will keep updates on schedule.
> > > > > > > -      */
> > > > > > > -     if (timer_pending(&group->poll_timer))
> > > > > > > +     /* xchg should be called even when !force to set poll_scheduled */
> > > > > > > +     if (atomic_xchg(&group->poll_scheduled, 1) && !force)
> > > > > > >               return;
> > > > > >
> > > > > > This explains what the code does, but not why. It would be good to
> > > > > > explain the ordering with poll_work, here or there. But both sides
> > > > > > should mention each other.
> > > > >
> > > > > How about this:
> > > > >
> > > > > /*
> > > > >  * atomic_xchg should be called even when !force to always set poll_scheduled
> > > > >  * and to provide a memory barrier (see the comment inside psi_poll_work).
> > > > >  */
> > > >
> > > > The memory barrier part makes sense, but the first part says what the
> > > > code does and the message is unclear to me. Are you worried somebody
> > > > might turn this around in the future and only conditionalize on
> > > > poll_scheduled when !force? Essentially, I don't see the downside of
> > > > dropping that. But maybe I'm missing something.
> > >
> > > Actually you are right. Originally I was worried that there might be a
> > > case when poll_scheduled==0 and force==true and if someone flips the
> > > conditions we will reschedule the timer but will not set
> > > poll_scheduled back to 1.
> >
> > Oh I see.
> >
> > Right, flipping the condition doesn't make sense because we need
> > poll_scheduled to be set when we go ahead - whether we're forcing or
> > not. I.e. if we were in a locked section, we'd write it like this:
> >
> >         if (poll_scheduled)
> >                 if (!force)
> >                         return;
> >         else
> >                 poll_scheduled = 1;
> >
> > > However I don't think this condition is possible. We set force=true
> > > only when we skipped resetting poll_schedule to 0 and on initial
> > > wakeup we always reset poll_schedule. How about changing the comment
> > > to this:
> > >
> > >  /*
> > >   * atomic_xchg should be called even when !force to provide a
> > >   * full memory barrier (see the comment inside psi_poll_work).
> > >   */
> >
> > Personally, I still find this more confusing than no comment on
> > !force, because when you read it it sort of raises the question what
> > the alternatives would be. And the alternatives appear to be
> > nonsensical code rather than legitimate options.
> >
> > But I won't insist if you prefer to leave it in. Your call.
>
> I would like to keep it as a precaution, if you don't mind. In case
> someone in the future thinks about "optimizing" this by flipping the
> condition, hopefully the comment will give them a pause to think about
> it :)
>
> >
> > > > /*
> > > >  * A task change can race with the poll worker that is supposed to
> > > >  * report on it. To avoid missing events, ensure ordering between
> > > >  * poll_scheduled and the task state accesses, such that if the poll
> > > >  * worker misses the state update, the task change is guaranteed to
> > > >  * reschedule the poll worker:
> > > >  *
> > > >  * poll worker:
> > > >  *   atomic_set(poll_scheduled, 0)
> > > >  *   smp_mb()
> > > >  *   LOAD states
> > > >  *
> > > >  * task change:
> > > >  *   STORE states
> > > >  *   if atomic_xchg(poll_scheduled, 1) == 0:
> > > >  *     schedule poll worker
> > > >  *
> > > >  * The atomic_xchg() implies a full barrier.
> > > >  */
> > > >  smp_mb();
> > > >
> > > > This gives a high-level view of what's happening but it can still be
> > > > mapped to the code by following the poll_scheduled variable.
> > >
> > > This looks really good to me.
> > > If you agree on the first comment modification, should I respin the
> > > next version?
> >
> > Yeah, sounds good to me!
>
> Thanks! I'll post an update shortly.

v4 is posted at https://lore.kernel.org/patchwork/patch/1455172/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
