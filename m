Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CCDC11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC2CF61002
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC2CF61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRXYK1RBdyeDfErFcmckOnkH0J4htx+dDLEU1yEDotk=; b=K4yH1xaE+nj/b5
	G9ghm2Q3Oj990UcGn/eH6TUQbz0CSRD+y66bdc1oS6ynk5DDT/7Y66odHuGgXvYHXu49OTiLklRPU
	gqj9yqHU9C4LHr3UCVOcCgrg6Ah0sPGHD72TANyIYpnq7s3SzGQoel2OODvP+ZBG0BOoeSgTy+muu
	l4KFQReQv8TBwMfrmgphkbxB9r9ruBQ4htLxREGvI/adVv6qGK+B5ZbTwmJyis39GOjBUF6DSEXyS
	qTNGCY63gLwT4/8byOlG0CFqPYoX5jdUms8nku2jGSOSUsT/zww2Q6Ezy+3WKbGXhs8nhQ2DcV/th
	b4d+6ZhhQIgz2HMH53+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyzYE-000Qrf-Et; Thu, 01 Jul 2021 16:28:30 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyzY1-000QmY-0B
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 16:28:19 +0000
Received: by mail-yb1-xb31.google.com with SMTP id i4so11817915ybe.2
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jW9usmzYUneRtmPUUy8bPkIeD350ID0dCtIjd2wQbSQ=;
 b=nga6WacM6U52NLeH8VpfecsBjtdk02B2lXY37A1ANhERVcUSRWNPMz6NXXu3ZdKE2t
 xVdbc72ukqInAh1x/3KFXIMHUYfoIQKKBdL5KGYy0xhPAcebSQShwob41BY4D1Y+cTke
 5j+IUh/1pu6ZaG5EcbEY0GNJ1EzcNVHbGBcKsftVHSHci4uVb1b+eHBeodvZP7Y9DF1+
 5lIgo6o4dzQFlw/x0ArhoVmeEtpr69uDijMGs04kDukeJ9JE1CrWJ+giAqa3DLFGsNA0
 e04uxDISEgnhuWQN7/fF6LoZ7Y7vhbH4HdHYWrTH3RkJLs0GWQvkbimBCcGOqeVPdFOL
 JZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jW9usmzYUneRtmPUUy8bPkIeD350ID0dCtIjd2wQbSQ=;
 b=RpzfOJW7qSeoYjKBGUeP8bZvo0LiL1Ciy9UQNvxMTZmCNJjBz8CKm0c5BAHBaN9fe5
 xwXlEqXzgRweQ5AgtiyUfS0U6WhRU8WGgmdYuI+lUa6IAGR76Rckf7MkPxKKWyHW+h8X
 HfLavT5/BEE8MiDzBuZoVOvjRKX6rq6omI7N+zGShjNPNwEqBHKcC4V6n1q/VFXR380q
 JdgnRb+z8CjZD6jQyvU4GX+rQvkwtT4o1d4am0dSDiMi4Ip2RCP34TgjnoACqxIhevam
 mi/phzOa6nFJvz7rgrmhjApvrdir1FK8jNXvrUkEHi37ajsbdyrinjwJjY3fpfNJnNRO
 f1jQ==
X-Gm-Message-State: AOAM530MlimxI1Zp1tZquk8J4h+4Cj2rHyrtfUco82RxCQMHjeQT9bBy
 BolcWAA1hSn5wgZBXiQMgQTqd4L5jcjhJhPAd2VYQg==
X-Google-Smtp-Source: ABdhPJxJ105tQZtXJ2g6qDlXmogBaYsJLcJDXxQ5kncWGkCRYNQNcvRP9rBXNCvVZ0sAPG97Vogi4w7B9zdX140PCKE=
X-Received: by 2002:a25:2e49:: with SMTP id b9mr836477ybn.250.1625156895472;
 Thu, 01 Jul 2021 09:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210630205151.137001-1-surenb@google.com>
 <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
 <CAJuCfpF=Ty4ruiKQQweVoF6Ojx8P8LxvUBxp1TmMFo2W1xNWfg@mail.gmail.com>
 <YN3pUNgpBjn42f8s@hirez.programming.kicks-ass.net>
In-Reply-To: <YN3pUNgpBjn42f8s@hirez.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Jul 2021 09:28:04 -0700
Message-ID: <CAJuCfpFKDhcgjU=MGsz+JuetrWvYCe0EL3FMp91zopH+8T=mMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] psi: stop relying on timer_pending for poll_work
 rescheduling
To: Peter Zijlstra <peterz@infradead.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Ingo Molnar <mingo@redhat.com>, 
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
X-CRM114-CacheID: sfid-20210701_092817_104993_1CE04056 
X-CRM114-Status: GOOD (  17.60  )
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

On Thu, Jul 1, 2021 at 9:12 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jul 01, 2021 at 09:09:25AM -0700, Suren Baghdasaryan wrote:
> > On Thu, Jul 1, 2021 at 1:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> > > > +     /* cmpxchg should be called even when !force to set poll_scheduled */
> > > > +     if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
> > > >               return;
> > >
> > > Why is that a cmpxchg() ?
> >
> > We want to set poll_scheduled and proceed with rescheduling the timer
> > unless it's already scheduled, so cmpxchg helps us to make that
> > decision atomically. Or did I misunderstand your question?
>
> What's wrong with: atomic_xchg(&group->poll_scheduled, 1) ?

Yes, since poll_scheduled can be only 0 or 1 atomic_xchg should work
fine here. Functionally equivalent but I assume atomic_xchg() is more
efficient due to no comparison.
Will respin v3 if the rest looks ok.

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
