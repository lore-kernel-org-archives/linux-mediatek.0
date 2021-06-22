Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD70BC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:49:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 783EC60233
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 783EC60233
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A54ECC/yC4MZc4zxYf+VCv6DY64V0mz+UQcKUcHg/0Y=; b=z026c3ktYeByIO
	uQJD+lwhV60VdHwp/TOzyl+LWcA1fJySF92tyIxZb7rxFH/R7rju/kJlJzAf4ONiCJ0UIGyxsQzJu
	O4X7OQr496FoJQu/e6NuLWH3nj7rKnnNcroL/LrGkUhLTrzi6Dm8MJKI31P4k8Mgtt7Kr+oDebIS0
	GP/yiQINQ/3VkKyH2Lw75aybfoBW7aFZOEIyV6/ZdD5d+8Oz6+1R8d6F8aELR8AxYjPISw8waIeER
	/bCPsIRJwM1LLwTtk6w32kvbDmNyqlSi9OkBR96vpblozjTuHYJ0ZbitdomlgQxEflPBUKhhtiCvc
	cfp7X5PbIXHl+2cijM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvieL-007mv4-UC; Tue, 22 Jun 2021 15:49:17 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvie9-007msd-0O
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 15:49:06 +0000
Received: by mail-qk1-x72b.google.com with SMTP id j184so40726013qkd.6
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 08:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D08i5WTXo1+ei91JvYVmebG92e88A+VfKzRMQAIzqTM=;
 b=jgidxwU3rvWrgcqGkIz7gxsf8q34Aei30cqet0yNDoKa6Hm/JCxj6yqJiLESLRrZVA
 ll899Zhw7iQb7AeReITNvPVIMJ4IFUuR9kw/41EtBa1H0NaYNkvUG59sER6B7M/8D37g
 YyVOTgTwTFB2xwsVR4l7lukpfDyToapK0CRGmIhcJFHIp0F/AnvtyqJPTOzu7/ae/Tae
 x06TzLOotgnMYXO25mEI0JSnrFdG9v6SjquOLDWjprM/RezT7h0/pq7eKzpXLL4XgN1I
 lvf8ANIDlauF1WKmS9U29MZxvstcp1bvqEw/ILDfXRe9l4N0RVyjBJDDwLa4aq2UoIfx
 K56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D08i5WTXo1+ei91JvYVmebG92e88A+VfKzRMQAIzqTM=;
 b=LJwXejlYgDZuGOOaCNUBukNMOJ3ZOX5h1dvhUE/xd0tdJS4kKqQk6OUHUYue6dcivR
 gV6MiI0vbXH/cz4HuNY6oF+FIBAfUtWGO9zt0a6vd8dVD/iGxyAl6eTIx5BuZsWtS46X
 Y8CNAlWJpgG59xiBxWdRc42r05qzes+qkmYB8ZpFsA+YLJTHYc4AsdX7LbJo1a2Ao9uR
 AXNvCDodK0i7bSz7wMm00pcv29rEYdzdl5amR80rraLyVPufIysJsO6ViBY1EutA3vIS
 CZO/fb8/eOpmWitA0TneO30k1y9+yxyDmypSJTomCvcPxlFbfnt8KjLG2fBP518CYmi2
 YmKw==
X-Gm-Message-State: AOAM533rNHFMDjvd5r/joLDow5m4PmHUDqz8twekUSTcJLN4DfzoAlN5
 1ds53vc+clhbA/Fmrrsy1DWwHCKtCNGa8PPOdfCwWw==
X-Google-Smtp-Source: ABdhPJxlSgAQuZC1mdGJER44LnEsZkvBvVA3DgjtrCOiG9SBqYE3gDoWVFuBtbTyWDOaaDGD0gFFHk3axXToVC3sQME=
X-Received: by 2002:a25:d913:: with SMTP id q19mr5873657ybg.397.1624376943574; 
 Tue, 22 Jun 2021 08:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210617212654.1529125-1-surenb@google.com>
 <YNHr81D/fPD2Q8kM@hirez.programming.kicks-ass.net>
 <YNH8x9HRyfvF53Pl@cmpxchg.org>
In-Reply-To: <YNH8x9HRyfvF53Pl@cmpxchg.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 22 Jun 2021 08:48:52 -0700
Message-ID: <CAJuCfpEL+Sp8e7z=JqLNuu5UKZCmCnx0nPugxXnFYd0w=7qbBQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] psi: stop relying on timer_pending for poll_work
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
 linux-mediatek@lists.infradead.org, kernel-team <kernel-team@android.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_084905_080245_F83090D7 
X-CRM114-Status: GOOD (  26.78  )
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

On Tue, Jun 22, 2021 at 8:08 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Tue, Jun 22, 2021 at 03:56:03PM +0200, Peter Zijlstra wrote:
> > On Thu, Jun 17, 2021 at 02:26:54PM -0700, Suren Baghdasaryan wrote:
> > > Fixes: 461daba06bdc ("psi: eliminate kthread_worker from psi trigger scheduling mechanism")
> > > Reported-by: Kathleen Chang <yt.chang@mediatek.com>
> > > Reported-by: Wenju Xu <wenju.xu@mediatek.com>
> > > Reported-by: Jonathan Chen <jonathan.jmchen@mediatek.com>
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Johannes?
>
> Looks generally good to me, I'd just want to get to the bottom of the
> memory ordering before acking...
>
> > > -/* Schedule polling if it's not already scheduled. */
> > > -static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay)
> > > +/* Schedule polling if it's not already scheduled or forced. */
> > > +static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
> > > +                              bool force)
> > >  {
> > >     struct task_struct *task;
> > >
> > > -   /*
> > > -    * Do not reschedule if already scheduled.
> > > -    * Possible race with a timer scheduled after this check but before
> > > -    * mod_timer below can be tolerated because group->polling_next_update
> > > -    * will keep updates on schedule.
> > > -    */
> > > -   if (timer_pending(&group->poll_timer))
> > > +   /* cmpxchg should be called even when !force to set poll_scheduled */
> > > +   if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) != 0 && !force)

Will change to Peter's suggested "if
(atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)" once the
ordering question is finalized.

> >
> > Do you care about memory ordering here? Afaict the whole thing is
> > supposed to be ordered by ->trigger_lock, so you don't.
>
> It's not always held when we get here.
>
> The worker holds it when it reschedules itself, to serialize against
> userspace destroying the trigger itself. But the scheduler doesn't
> hold it when it kicks the worker on an actionable task change.
>
> That said, I think the ordering we care about there is that when the
> scheduler side sees the worker still queued, the worker must see the
> scheduler's updates to the percpu states and process them correctly.
> But that should be ensured already by the ordering implied by the
> seqcount sections around both the writer and the reader side.

Thanks Johannes! I have nothing to add here really.

>
> Is there another possible race that I'm missing?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
