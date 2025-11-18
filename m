Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F65CED243
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PPzPx5OlPni6aJtrpr5gUmefIow/ATiQL8H+rAsAbs=; b=4FWUJTkk0kSSX7+v0kYBuxIGVR
	kFa3H85qeFfsjvBR0w9QxpugVzJ9MqCyRD+P7C43oOCqizvTm/n/NqpOIaVnuXgBIUZi9urS1p6J0
	013tPvcFUyY9SiJV7wE+AJdt8g4ik/B7M6TKuCPZ0625rLGNIDeCks1Z+fVnWknAZc+NmlszyzaV7
	AqzZ+235i+/0fofXFCvT0kmwgWrNDICEO9NqvrXduYma1O0frJtcWFfjrL+BlC6jN8uP5E7MRS02f
	sfro2nJpp1hx/5L8TL6r0LVWLn7UEQMhnQTWtmUS+qQIpYfNjEnIofr5/SiwosCd9qIPSCw6ViFur
	6u20B6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLLL-00000000S1a-3MTF;
	Tue, 18 Nov 2025 13:01:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLLK-00000000S1Q-30HL
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 13:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA6416062D
	for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 13:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0B3C2BCB8
	for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763470917;
	bh=YjtLQBMeP0xt7VJYYWG7rgttKkl7y8Fqq8/Sa5rW9P4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lcs5v27CClV1Go2UPLHo88yPz7NGv3PSgEl2eFxDIWKwQcHN8XJt8lrwxNUF7UDT1
	 /u57fJtKDCyMuBVc+bm5BT0is56bZcm04mv+4FUYYJI/Gvdr0jsifp4sSvF/jqB7dO
	 3LTqHteacvXrOkhmSkRYv3cuuEC33Kk7TKJpLpwdoTHHUcKLa1AgP1dIdb4TBcKveR
	 q8okvFYnK5yuhE9rifUPhRfoeEmsMRqxgkA1sGGLzs2PqnTi+tk0EZ34jGbtLuPGXl
	 ENf0hto/cak6qDcyivKJ6X/WBlpXi6nblEP3l2nZXVSqi5sYoJOffztDhXErO+OIMQ
	 iXbqWX9HhYuqg==
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c7533dbd87so2013800a34.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 05:01:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWe3C0WVtE6c8LhpXmiVEdUS1V7lmWPbO7x4YeiFAdzq3FIM0f3Y/OYJ3wt1MQs2BpFWc0ZIc3uDzj6pQDRRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUc5r2kZMy2P09Ceh+paPRtgSwBUV2uYJSK0B/k/s89eJ0vDlE
	ypUawEkfJLfR8jBSO9Gj4CmnklpYA1bkzRZ2mg0o8XB1aweERgGg9tIlK+Fg+lZsPFabxKxB7aW
	QjukQFWCFZPaQxHZ2URuOcmPaR2xR1BM=
X-Google-Smtp-Source: AGHT+IHXS37uQTmeIx0p25jXSTTQG/CVFr3Vmtg9OyQqsn0MkmXDXyyv1d6qJBfWbiQozCzHQk/UEuxEZE8AqR27gL4=
X-Received: by 2002:a05:6830:4389:b0:7c7:5d72:567b with SMTP id
 46e09a7af769-7c75d7272b4mr5643963a34.23.1763470914397; Tue, 18 Nov 2025
 05:01:54 -0800 (PST)
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
 <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com>
 <5941318.DvuYhMxLoT@rafael.j.wysocki> <CAPDyKFq9boy3xTZ0Zy55QMgNu9MFH50FQeJp8buu4q7WowgFLg@mail.gmail.com>
In-Reply-To: <CAPDyKFq9boy3xTZ0Zy55QMgNu9MFH50FQeJp8buu4q7WowgFLg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 18 Nov 2025 14:01:43 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gMEjBfsLse4FmG_XeXE3Yd4wktq57OwqcytQN4h1+t5w@mail.gmail.com>
X-Gm-Features: AWmQ_bnsDSjSopji_sFnDz22MaQHn5-fmwPMCMp2aNM-hUEOI8CJfT9twykNx5g
Message-ID: <CAJZ5v0gMEjBfsLse4FmG_XeXE3Yd4wktq57OwqcytQN4h1+t5w@mail.gmail.com>
Subject: Re: [PATCH v3] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rose Wu <ya-jou.wu@mediatek.com>, linux-pm@vger.kernel.org, 
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>, 
	linux-mediatek@lists.infradead.org, "artis. chiu" <artis.chiu@mediatek.com>, 
	"Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Nov 18, 2025 at 1:58=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Tue, 18 Nov 2025 at 13:45, Rafael J. Wysocki <rafael@kernel.org> wrote=
:
> >
> > On Tuesday, November 18, 2025 1:26:06 PM CET Rafael J. Wysocki wrote:
> > > On Tue, Nov 18, 2025 at 1:18=E2=80=AFPM Ulf Hansson <ulf.hansson@lina=
ro.org> wrote:
> > > >
> > > > On Tue, 18 Nov 2025 at 12:48, Rafael J. Wysocki <rafael@kernel.org>=
 wrote:
> > > > >
> > > > > On Tuesday, November 18, 2025 9:31:08 AM CET Rose Wu wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, 2025-11-17 at 19:57 +0100, Rafael J. Wysocki wrote:
> > > > > > >
> > > > > > > Make two changes to address this problem.
> > > > > > >
> > > > > > > First, reorder device_suspend_late() to only disable runtime =
PM for a
> > > > > > > device if the power.is_late_suspended flag is going to be set=
 for it.
> > > > > > > In all of the other cases, disabling runtime PM for the devic=
e is not
> > > > > > > in fact necessary.
> > > > > > >
> > > > > > > Second, make device_resume_early() only enable runtime PM for=
 the
> > > > > > > devices with the power.is_late_suspended flag set.
> > > > > > >
> > > > > >
> > > > > > My concern is with the error path in device_suspend_late().
> > > > > > If a device fails its dpm_run_callback(), it appears that its
> > > > > > power.is_late_suspended flag is not set, potentially leaving it=
s runtime
> > > > > > PM disabled during the resume sequence.
> > > > >
> > > > > Right, pm_runtime_enable() is missing in the error path after cal=
ling
> > > > > dpm_run_callback().
> > > > >
> > > > > ---
> > > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > >
> > > > > Runtime PM should only be enabled in device_resume_early() if it =
has
> > > > > been disabled for the given device by device_suspend_late().  Oth=
erwise,
> > > > > it may cause runtime PM callbacks to run prematurely in some case=
s
> > > > > which leads to further functional issues.
> > > > >
> > > > > Make two changes to address this problem.
> > > > >
> > > > > First, reorder device_suspend_late() to only disable runtime PM f=
or a
> > > > > device when it is going to look for the device's callback.  In al=
l of
> > > > > the other cases, disabling runtime PM for the device is not in fa=
ct
> > > > > necessary.  However, if the device's callback returns an error an=
d the
> > > > > power.is_late_suspended flag is not going to be set, enable runti=
me
> > > > > PM so it only remains disabled when power.is_late_suspended is se=
t.
> > > > >
> > > > > Second, make device_resume_early() only enable runtime PM for the
> > > > > devices with the power.is_late_suspended flag set.
> > > > >
> > > > > Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asy=
nchronous")
> > > > > Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> > > > > Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f=
4a7dee7edaaffc33.camel@mediatek.com/
> > > > > Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> > > > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > > ---
> > > > >
> > > > > v1 -> v2: Add pm_runtime_enable() to device_suspend_late() error =
path (Rose).
> > > > >
> > > > > ---
> > > > >  drivers/base/power/main.c |   15 ++++++++-------
> > > > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > > > >
> > > > > --- a/drivers/base/power/main.c
> > > > > +++ b/drivers/base/power/main.c
> > > > > @@ -941,11 +941,11 @@ Run:
> > > > >
> > > > >  Skip:
> > > > >         dev->power.is_late_suspended =3D false;
> > > > > +       pm_runtime_enable(dev);
> > > > >
> > > > >  Out:
> > > > >         TRACE_RESUME(error);
> > > > >
> > > > > -       pm_runtime_enable(dev);
> > > > >         complete_all(&dev->power.completion);
> > > > >
> > > > >         if (error) {
> > > > > @@ -1630,12 +1630,6 @@ static void device_suspend_late(struct d
> > > > >         TRACE_DEVICE(dev);
> > > > >         TRACE_SUSPEND(0);
> > > > >
> > > > > -       /*
> > > > > -        * Disable runtime PM for the device without checking if =
there is a
> > > > > -        * pending resume request for it.
> > > > > -        */
> > > > > -       __pm_runtime_disable(dev, false);
> > > > > -
> > > > >         dpm_wait_for_subordinate(dev, async);
> > > > >
> > > > >         if (READ_ONCE(async_error))
> > > > > @@ -1649,6 +1643,12 @@ static void device_suspend_late(struct d
> > > > >         if (dev->power.syscore || dev->power.direct_complete)
> > > > >                 goto Complete;
> > > > >
> > > > > +       /*
> > > > > +        * Disable runtime PM for the device without checking if =
there is a
> > > > > +        * pending resume request for it.
> > > > > +        */
> > > > > +       __pm_runtime_disable(dev, false);
> > > > > +
> > > >
> > > > Moving this here means we are going to keep runtime pm enabled for
> > > > syscore devices during system wide suspend/resume. That's quite a
> > > > change in behaviour for a fix for a regression, I think. Not saying
> > > > that it can't work though.
> > >
> > > syscore devices can be a special case, but I thought it wouldn't be
> > > necessary to special-case them.
> > >
> > > Do you actually know about any of them needing special casing?
> >
> > In any case, below is a v3 that special-cases syscore devices.  Fortuna=
tely,
> > it is not much more complicated than the v2.
> >
> > Thanks!
> >
> > ---
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > Runtime PM should only be enabled in device_resume_early() if it has
> > been disabled for the given device by device_suspend_late().  Otherwise=
,
> > it may cause runtime PM callbacks to run prematurely in some cases
> > which leads to further functional issues.
> >
> > Make two changes to address this problem.
> >
> > First, reorder device_suspend_late() to only disable runtime PM for a
> > device when it is going to look for the device's callback or if the
> > device is a "syscore" one.  In all of the other cases, disabling runtim=
e
> > PM for the device is not in fact necessary.  However, if the device's
> > callback returns an error and the power.is_late_suspended flag is not
> > going to be set, enable runtime PM so it only remains disabled when
> > power.is_late_suspended is set.
> >
> > Second, make device_resume_early() only enable runtime PM for the
> > devices with the power.is_late_suspended flag set.
> >
> > Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchron=
ous")
> > Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> > Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7dee=
7edaaffc33.camel@mediatek.com/
> > Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >
> > v2 -> v1:
> >    * Also set is_late_suspended for syscore devices to avoid skipping r=
untime PM
> >      disabling for them (Ulf).
> >    * Update the changelog to reflect the above.
> >
> > v1 -> v2:
> >    * Add pm_runtime_enable() to device_suspend_late() error path (Rose)=
.
> >    * Update the changelog to reflect the above.
> >
> > ---
> >  drivers/base/power/main.c |   25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> >
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -903,7 +903,10 @@ static void device_resume_early(struct d
> >         TRACE_DEVICE(dev);
> >         TRACE_RESUME(0);
> >
> > -       if (dev->power.syscore || dev->power.direct_complete)
> > +       if (dev->power.syscore)
> > +               goto Skip;
>
> This will enable runtime PM for a syscore device, even if it wasn't
> disabled when device_suspend_late() wasn't called for it.

Yeah, I need to reorder this after the power.is_late_suspended check.

I'll send a v4 later today.

Thanks!

