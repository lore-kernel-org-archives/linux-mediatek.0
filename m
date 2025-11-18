Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F056CED624
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 12:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfK0cSx43C+R1iB67ryMKJrCfa+bz3J1HNtBZusMbqo=; b=fZfyDLxgIm2lmShj4W+lc8UMcx
	p1nZOrBxFxqtPTrgo8ZxeF6/awKShinSksBg0IvhhG1G9tteJEqn640XWEBumVhhM3tNwM8P7I1ci
	vh5wMfmT9NxPoppvXC6m2+RlYJAXepmWZAowhiJWtA+vSQ2bYHRaDV3ghCgW1Xiwg/tKWMY6Dpiqu
	xIIip+BnNmGA0TuHQ9oufixes5taMPkl7yhV3oT4mnhjQrnRgvWvBOuETvLhMCYHp51a0Fn9iKQiJ
	kpIFjMBbhfRhWW61Y94Yl0qGaSIsYqg9+foQmTeW15V/Qi2PPCn8GHGmXEhXJKe6hS9K2+eQda5Sh
	vISpgLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKmv-00000000PkT-3Dcl;
	Tue, 18 Nov 2025 12:26:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKmr-00000000Pk4-2aRd
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 12:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AA7E429EE
	for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 12:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06EEC2BCAF
	for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763468780;
	bh=OQW9B/dyCzcM/bIWdIMNnuLsQU3gBUjkA6PMYVbTh7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pLVXVR+ktk+graSKuqezLkxCfktWhXD3kY37d57RK7w7amlh4ac0QZABmNq2Ni1Pz
	 JconZdrHBG/kLSstspvVS85myG1YgoNkZx6ZIwWPvNSaXb4kl4YPVgvfOogFBlJJyS
	 76mXaJgf/E4WqQxZkhcAabtDDD5t2AtqNFV+4jHQ2quxCBeyaGh8/eJJlzkTXz0Gbz
	 o3Qwfx9gzw9pyx68owa32b7Q4X7nqtn3z/4w2Xdx+OhzDijUtS9X+IOu7mgyJhNxu8
	 GBE/QbnjBwoyeSNL82274OdVfhLpkO8nE+wBf2y4/5/dJfIHXmWu1nwnCGxneWcp7c
	 j88lVWWSQ0VDw==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c701097a75so2481460a34.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 04:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUe1AI/klYRgJXqW3g2ZI+/Yh5lt/YayPbnSbC54bCGSL8MaqOxjit1Soy2pFeByeCWeE5DAcj6bvMs4yTeqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg/xIf075WTujtC+TFE+m0k9f3awFeQfE5lPBX6qw7VjjhU0Ey
	u9iDjtLZAfrdizIZmW5dXzfeK4ODwGN+Jz+Nf0mjIZgLJxn6gxcIAUTMbpIexWswYR5gRlBj9Hm
	srulAwd7ZpxEqF4Y1XSOeeYg+DN4WSn8=
X-Google-Smtp-Source: AGHT+IELTs+baIL1OrUJ6lfYKQJrx3au7tikjQ/WjvAvnLWN8GeNFk7gmzuFm25SBqt1p1LkQmGpQPESh5sh/Go6alg=
X-Received: by 2002:a05:6808:67c3:b0:43f:ee6f:3bf2 with SMTP id
 5614622812f47-450974289b6mr7187219b6e.17.1763468779141; Tue, 18 Nov 2025
 04:26:19 -0800 (PST)
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <5940388.DvuYhMxLoT@rafael.j.wysocki> <119e2410ca32a0d55fa6febf93c7a3164b391db0.camel@mediatek.com>
 <12782716.O9o76ZdvQC@rafael.j.wysocki> <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
In-Reply-To: <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 18 Nov 2025 13:26:06 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com>
X-Gm-Features: AWmQ_bnH3KX730tRoTnlZ4-5nfP9SwaRCiL1Njlm18RCobVNepyDg9y7Z_8Zzf8
Message-ID: <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	Rose Wu <ya-jou.wu@mediatek.com>, rafael.j.wysocki@intel.com, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	wsd_upstream <wsd_upstream@mediatek.com>, linux-mediatek@lists.infradead.org, 
	"artis. chiu" <artis.chiu@mediatek.com>, "Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_042621_698506_2B18753F 
X-CRM114-Status: GOOD (  39.07  )
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

On Tue, Nov 18, 2025 at 1:18=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Tue, 18 Nov 2025 at 12:48, Rafael J. Wysocki <rafael@kernel.org> wrote=
:
> >
> > On Tuesday, November 18, 2025 9:31:08 AM CET Rose Wu wrote:
> > > Hi,
> > >
> > > On Mon, 2025-11-17 at 19:57 +0100, Rafael J. Wysocki wrote:
> > > >
> > > > Make two changes to address this problem.
> > > >
> > > > First, reorder device_suspend_late() to only disable runtime PM for=
 a
> > > > device if the power.is_late_suspended flag is going to be set for i=
t.
> > > > In all of the other cases, disabling runtime PM for the device is n=
ot
> > > > in fact necessary.
> > > >
> > > > Second, make device_resume_early() only enable runtime PM for the
> > > > devices with the power.is_late_suspended flag set.
> > > >
> > >
> > > My concern is with the error path in device_suspend_late().
> > > If a device fails its dpm_run_callback(), it appears that its
> > > power.is_late_suspended flag is not set, potentially leaving its runt=
ime
> > > PM disabled during the resume sequence.
> >
> > Right, pm_runtime_enable() is missing in the error path after calling
> > dpm_run_callback().
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
> > device when it is going to look for the device's callback.  In all of
> > the other cases, disabling runtime PM for the device is not in fact
> > necessary.  However, if the device's callback returns an error and the
> > power.is_late_suspended flag is not going to be set, enable runtime
> > PM so it only remains disabled when power.is_late_suspended is set.
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
> > v1 -> v2: Add pm_runtime_enable() to device_suspend_late() error path (=
Rose).
> >
> > ---
> >  drivers/base/power/main.c |   15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -941,11 +941,11 @@ Run:
> >
> >  Skip:
> >         dev->power.is_late_suspended =3D false;
> > +       pm_runtime_enable(dev);
> >
> >  Out:
> >         TRACE_RESUME(error);
> >
> > -       pm_runtime_enable(dev);
> >         complete_all(&dev->power.completion);
> >
> >         if (error) {
> > @@ -1630,12 +1630,6 @@ static void device_suspend_late(struct d
> >         TRACE_DEVICE(dev);
> >         TRACE_SUSPEND(0);
> >
> > -       /*
> > -        * Disable runtime PM for the device without checking if there =
is a
> > -        * pending resume request for it.
> > -        */
> > -       __pm_runtime_disable(dev, false);
> > -
> >         dpm_wait_for_subordinate(dev, async);
> >
> >         if (READ_ONCE(async_error))
> > @@ -1649,6 +1643,12 @@ static void device_suspend_late(struct d
> >         if (dev->power.syscore || dev->power.direct_complete)
> >                 goto Complete;
> >
> > +       /*
> > +        * Disable runtime PM for the device without checking if there =
is a
> > +        * pending resume request for it.
> > +        */
> > +       __pm_runtime_disable(dev, false);
> > +
>
> Moving this here means we are going to keep runtime pm enabled for
> syscore devices during system wide suspend/resume. That's quite a
> change in behaviour for a fix for a regression, I think. Not saying
> that it can't work though.

syscore devices can be a special case, but I thought it wouldn't be
necessary to special-case them.

Do you actually know about any of them needing special casing?

> Although, perhaps better to call __pm_runtime_disable() a few lines
> earlier and use a separate flag to track that we need to call
> pm_runtime_enable() in device_resume_early()?

I don't think it is necessary or even useful to introduce new flags for thi=
s.

