Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAA3C07E96
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 02:43:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4FBE61CB8
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 02:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4FBE61CB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FI+qPPlSoGR9/CB0CA10HGA2/d48AEP9MN2hcm5QXBE=; b=mfifnJazojv+9g
	Urapd+2ifXvHf8hdAiHAifTkzVKaQilh5pnemd2lZeWuLfuyE6/ilOyCUIjhVdl55mzQzJySK1RuZ
	1H4N6XEKiYv1FENqzW79Cri1zYwa6JnoErBgM0zndyzXBNkXvjtEqA0M5vBt/E04lxpS+obmEZyGZ
	0O/ehph2SNBYtKhByAvUC3GyExmPNR5bcBuPm81zU1VkVzk9KqPuiIBpzv4BtsupA0rKEYBTjjK29
	sW6Ft0DWy1ZfqdCJPy8EkvmxwIGJFBmrDOaxYAvab4vappNOYmiLJYeo2Pop0yS7IXUOtCIbnY1d8
	xKWBzoXkVEUZz2zCMKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0xWj-00DDql-5Y; Wed, 07 Jul 2021 02:43:05 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0xWV-00DDo1-6q
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 02:42:52 +0000
Received: by mail-yb1-xb36.google.com with SMTP id a16so813146ybt.8
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 19:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u4Yuded0Kw88JMGw8sa798WPvDJHLb/pzmUTCTo2A3w=;
 b=a6MEnYH9x2ODwMVBkGbhVVIIM/+36glvaFrVGSV2bwRkix+hmKqRW0m1TQKUw9C+c/
 cXCJ6wbYyAttOu+xTCroLVhwFL2Wn1J0fSCp0u4Ock1Lp18wYm28mZ863YKafjdXGXhy
 vQ/Fs1OK5DB8IcTRsZq/PlEbtfRhKD2H6jYkp2C1RhT2AMFT+rFIT2yZwCc5odDJB4wS
 D4JrXp2WFLPLSEAgN/MXH1GDhQnvofMrKhmE/kuS5NiU+PXJyj35LTW1adx/FHE69WsV
 mt2r5axHqNgPctRlnmKU2kSpOq99/DqPOYYwobJWv9lcNSCWTbhrKY5DALA8Mq5/ZgWX
 avww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u4Yuded0Kw88JMGw8sa798WPvDJHLb/pzmUTCTo2A3w=;
 b=K7BXUAcgrbJDsMPUQmJM88JNKG4/a0eH2AXx5sQP0GOXKSn7awnPxKuF2acBWxjET7
 SozVslIL53TuAK8/OKbe3rkPHz07gswevbjuL2d9/olG/Al8sCqasRsKHVbgh6LzW7J3
 jepKhmOr5/vzlogGp1AarYagzGe+ONgkz5gy1F06BswmB49yEad7MFrojSETm3CWashY
 /sJ7pHY24vp41ccu+5aoMG67G4GpsClewL6FyEss1CYWoBoZhqhsavbnsC1PXDjm508S
 53dtQKEmXgtH/d5gMIcRjwmAbRBM360NwlGxjiOSRqgoZb8psvgrjPCVv/ym9UNPoz7X
 0K4A==
X-Gm-Message-State: AOAM5323KpOVnp60h0YmuzTTHtJ2l/Xj+JAsfe0r3HZorilviX8tQMwi
 7oFUXrFEEtaMPIEq6ee+Ii4iRpnmUDwhfLsonsatkg==
X-Google-Smtp-Source: ABdhPJxXK+QpQy2by1tDpQkrIdLehrUiWBvobGwHKyJsUnEYIPDA9XRU5GHPFc1J2rclYBq66Nu1YgBiWjIDtbLX7OM=
X-Received: by 2002:a25:83ca:: with SMTP id v10mr29809951ybm.84.1625625768387; 
 Tue, 06 Jul 2021 19:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210630205151.137001-1-surenb@google.com>
 <YN2DsLlE+WtxK6K9@hirez.programming.kicks-ass.net>
 <CAJuCfpF=Ty4ruiKQQweVoF6Ojx8P8LxvUBxp1TmMFo2W1xNWfg@mail.gmail.com>
 <YN3pUNgpBjn42f8s@hirez.programming.kicks-ass.net>
 <CAJuCfpFKDhcgjU=MGsz+JuetrWvYCe0EL3FMp91zopH+8T=mMQ@mail.gmail.com>
 <YN7cJZOZzjYJFClR@hirez.programming.kicks-ass.net>
 <CAJuCfpHbZ2ShG02OfXzBfm7vvzCUTeP1qoTzgicGOrPh9W+5Gg@mail.gmail.com>
In-Reply-To: <CAJuCfpHbZ2ShG02OfXzBfm7vvzCUTeP1qoTzgicGOrPh9W+5Gg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 6 Jul 2021 19:42:37 -0700
Message-ID: <CAJuCfpHKmspg6apXSnQR_9m9ZVypw3Bg7Z4NgYQJ0Lg6akKZ+A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210706_194251_323034_56090F35 
X-CRM114-Status: GOOD (  30.21  )
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

On Fri, Jul 2, 2021 at 8:49 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Fri, Jul 2, 2021 at 2:28 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Jul 01, 2021 at 09:28:04AM -0700, Suren Baghdasaryan wrote:
> > > On Thu, Jul 1, 2021 at 9:12 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > On Thu, Jul 01, 2021 at 09:09:25AM -0700, Suren Baghdasaryan wrote:
> > > > > On Thu, Jul 1, 2021 at 1:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > > > >
> > > > > > On Wed, Jun 30, 2021 at 01:51:51PM -0700, Suren Baghdasaryan wrote:
> > > > > > > +     /* cmpxchg should be called even when !force to set poll_scheduled */
> > > > > > > +     if (atomic_cmpxchg(&group->poll_scheduled, 0, 1) && !force)
> > > > > > >               return;
> > > > > >
> > > > > > Why is that a cmpxchg() ?
> > > > >
> > > > > We want to set poll_scheduled and proceed with rescheduling the timer
> > > > > unless it's already scheduled, so cmpxchg helps us to make that
> > > > > decision atomically. Or did I misunderstand your question?
> > > >
> > > > What's wrong with: atomic_xchg(&group->poll_scheduled, 1) ?
> > >
> > > Yes, since poll_scheduled can be only 0 or 1 atomic_xchg should work
> > > fine here. Functionally equivalent but I assume atomic_xchg() is more
> > > efficient due to no comparison.
> >
> > Mostly conceptually simpler; the cmpxchg-on-0 makes that you have to
> > check if there's ever any state outside of {0,1}. The xchg() thing is
> > the classical test-and-set pattern.
> >
> > On top of all that, the cmpxchg() can fail, which brings ordering
> > issues.
>
> Oh, I see. That was my mistake. I was wrongly assuming that all RMW
> atomic operations are fully ordered but indeed, documentation states
> that:
> ```
> - RMW operations that have a return value are fully ordered;
> - RMW operations that are conditional are unordered on FAILURE,
>    otherwise the above rules apply.
> ```
> So that's the actual functional difference here. Thanks for catching
> this and educating me!
>
> >
> > Typically, I think, you want to ensure that everything that happens
> > before psi_schedule_poll_work() is visible to the work when it runs
> > (also see Johannes' email).
>
> Correct and I think I understand now the concern Johannes expressed.
>
> > In case poll_scheduled is already 1, the
> > cmpxchg will fail and *NOT* provide that ordering. Meaning the work
> > might not observe the latest changes. xchg() doesn't have this subtlety.
>
> Got it.
> So I think the modifications needed to this patch is:
> 1. replacing atomic_cmpxchg(&group->poll_scheduled, 0, 1) with
> atomic_chg(&group->poll_scheduled, 1)
> 2. an explicit smp_mb() barrier right after
> atomic_set(&group->poll_scheduled, 0) in psi_poll_work().
>
> I think that should ensure the correct ordering here.
> If you folks agree I'll respin v3 with these changes (or maybe I
> should respin and we continue discussion with that version?).

To keep things moving I posted v3
(https://lore.kernel.org/patchwork/patch/1454547) with the changes I
mentioned above. Let's keep discussing it there. Thanks!

>
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
