Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C892CED63B
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHDPLEl16Ugwq6B02rj9o+d8nk15yY0zPwOk9KTdur8=; b=X9VMKFa8XU91NV+7vZMqE/l++3
	N6OPTgLdmXAIxtdWO9nhdiuxLqee3RDcV9nl41TTP6UID8ZaMbNbsg7dacxI7eDgu5l6m3Jz9SYiz
	TImdDx2vAo1TCHWY+yt6OrVTSDZrpSIqLjiSgi1aAaTEOK501yYY6QKzgfq0JspNdCVCM12AyM2mQ
	eIL4FgitnxkhUDn0y5rR5aAwR6viUqrXwM0OJ8X9mKKNLUtYqRreCSLVl4PtndJKUDJ0n3CpYMF6W
	P44GvLABm46oa0EOABokqW+ba4LgCqV2s7mFpiK5U/3GSjSn3Ec0M5I78Wbi51pTft5JmxBO5dXgQ
	ChRnrwwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLHn-00000000RrR-45vB;
	Tue, 18 Nov 2025 12:58:22 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLHl-00000000Rr1-0YgR
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 12:58:18 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-78665368a5cso52694327b3.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 04:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763470696; x=1764075496; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHDPLEl16Ugwq6B02rj9o+d8nk15yY0zPwOk9KTdur8=;
        b=Jj6j7DOTCg5DOnAqWZEvUz2lVKHk0QbcbbwK08d7I6+/miiLReVIB4djfCT/Vyexbf
         nbk955oyTIT1qI1innmlRjRC1ajk8k1YUtEmtAo7pU9gNDwuGE6jU4ACnRslY9xSxv/t
         WHiO4IgvU3vjcLbGmg3kmt3zpS9C7sL8ueZcjqE8+WWty0EUCuwHtbQ2aJvG2ifT9JIt
         2RJXmLWdSjy/6NZ2tD1qvlL+8SBDT9Q98H63X/R48h2KfanpG1ZMMxIX2SJF9ai/Jj71
         7cXlxnQyHlwmntczqKsHpNr7lgEftORtkB2SvCSusi1oAI4MYHdFhkK0z+pi9fXSjQD7
         7eMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470696; x=1764075496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHDPLEl16Ugwq6B02rj9o+d8nk15yY0zPwOk9KTdur8=;
        b=FrQCi5RyHMCp+kRyh4Ee+6YIp5qtacL9z3S8wGIA62Jw/N9Wx/KMX6LNLROqgURM1y
         p7ohDBX1pw68ivSSC1dD0XqbYCPw/voWhmnfsyfKyWiPgBnMpt3r/u3zlZLPH+IoODik
         q2fex1jHxSPAm+uAoE2Xg21HZHJ/VUlEy0bSC5f3GuwZcgXtAYZtTu4HwAoVjNgWk54x
         xGNcZK9W1egcVE0F3kIH4cvXJnp9a+qm5ZSQk0IqiMJuTf9XRfUXPVSNSNYTyEq9+R12
         pOSGrh7neq7fH8LJy778/kLyMfi5vMWcmmsR8d39m2miMXGhbkz42m9DCks6yxq4pb0J
         FANw==
X-Forwarded-Encrypted: i=1; AJvYcCU362e9SFlsZLnfv6VnJ3UT1jPQqWezZVvSC99S0Tpe5jQT1OIkAuWWWaRSDSoMB63HCpNk05UDv9rMF97Xyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4nQdaZUXXF0G4ZFfHp8TB4jT6Gl1CVRrzRxquW1ZJa2hE8UXG
	Mrc89QA8QVsmLGmDgD/+nA5vasdoxVfqKMFewTCv8wzAHHIBCYvvU7vH+EjOwQQz0ocwwx2Unj3
	e/IjwB9WERNcxc4Kz1byFgSDBoXKffFMPF+0HLyBT+w==
X-Gm-Gg: ASbGnct9rJatcOu37q3oPbewfBPy7IKIaKyAruc3puoGKkZJ3qIbwaYQfTzWVMKdZ7Z
	+HXNIc35mrPdezV2jeRstHpP1JyhyXHvSnuL1HKW+BUF39G0hMHhk8ztwMoV4zdciPV38Zk45Wl
	jmMW8RngQwzcV7c1D/q3AtNx45X7kUD1lfOPMZ2u4GPAm+9R5lkp8SMke38mlrQ0Q+H8bzIX3eu
	uEkvcAAMeesvUMqlkiQJkwfHFc7wCjC1ghNK31PqC5mhvAjS6JuKJ8swfUxFcyRI6vncMM1F1dA
	4zKW0Ss=
X-Google-Smtp-Source: AGHT+IGUaVRogYY/RbWrwXu+vM8fj7R/fzWaN5dRzy1h60AIkHce0jX3fDgAQ37xwlVsCyGyuiMFRFdo1Yn/mBaE2Zc=
X-Received: by 2002:a05:690c:9218:10b0:787:fa8f:beac with SMTP id
 00721157ae682-78929f151d1mr120389357b3.46.1763470695975; Tue, 18 Nov 2025
 04:58:15 -0800 (PST)
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
 <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com> <5941318.DvuYhMxLoT@rafael.j.wysocki>
In-Reply-To: <5941318.DvuYhMxLoT@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 13:57:40 +0100
X-Gm-Features: AWmQ_bkALcTZ8SHotDoSduUQ_Xd_gA_888BZ3hciQvrrXdUj5aqrgjY-IgODggE
Message-ID: <CAPDyKFq9boy3xTZ0Zy55QMgNu9MFH50FQeJp8buu4q7WowgFLg@mail.gmail.com>
Subject: Re: [PATCH v3] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rose Wu <ya-jou.wu@mediatek.com>, linux-pm@vger.kernel.org, 
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>, 
	linux-mediatek@lists.infradead.org, "artis. chiu" <artis.chiu@mediatek.com>, 
	"Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_045817_201017_69AC0EC2 
X-CRM114-Status: GOOD (  42.49  )
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

On Tue, 18 Nov 2025 at 13:45, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tuesday, November 18, 2025 1:26:06 PM CET Rafael J. Wysocki wrote:
> > On Tue, Nov 18, 2025 at 1:18=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro=
.org> wrote:
> > >
> > > On Tue, 18 Nov 2025 at 12:48, Rafael J. Wysocki <rafael@kernel.org> w=
rote:
> > > >
> > > > On Tuesday, November 18, 2025 9:31:08 AM CET Rose Wu wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, 2025-11-17 at 19:57 +0100, Rafael J. Wysocki wrote:
> > > > > >
> > > > > > Make two changes to address this problem.
> > > > > >
> > > > > > First, reorder device_suspend_late() to only disable runtime PM=
 for a
> > > > > > device if the power.is_late_suspended flag is going to be set f=
or it.
> > > > > > In all of the other cases, disabling runtime PM for the device =
is not
> > > > > > in fact necessary.
> > > > > >
> > > > > > Second, make device_resume_early() only enable runtime PM for t=
he
> > > > > > devices with the power.is_late_suspended flag set.
> > > > > >
> > > > >
> > > > > My concern is with the error path in device_suspend_late().
> > > > > If a device fails its dpm_run_callback(), it appears that its
> > > > > power.is_late_suspended flag is not set, potentially leaving its =
runtime
> > > > > PM disabled during the resume sequence.
> > > >
> > > > Right, pm_runtime_enable() is missing in the error path after calli=
ng
> > > > dpm_run_callback().
> > > >
> > > > ---
> > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >
> > > > Runtime PM should only be enabled in device_resume_early() if it ha=
s
> > > > been disabled for the given device by device_suspend_late().  Other=
wise,
> > > > it may cause runtime PM callbacks to run prematurely in some cases
> > > > which leads to further functional issues.
> > > >
> > > > Make two changes to address this problem.
> > > >
> > > > First, reorder device_suspend_late() to only disable runtime PM for=
 a
> > > > device when it is going to look for the device's callback.  In all =
of
> > > > the other cases, disabling runtime PM for the device is not in fact
> > > > necessary.  However, if the device's callback returns an error and =
the
> > > > power.is_late_suspended flag is not going to be set, enable runtime
> > > > PM so it only remains disabled when power.is_late_suspended is set.
> > > >
> > > > Second, make device_resume_early() only enable runtime PM for the
> > > > devices with the power.is_late_suspended flag set.
> > > >
> > > > Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more async=
hronous")
> > > > Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> > > > Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a=
7dee7edaaffc33.camel@mediatek.com/
> > > > Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> > > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > > >
> > > > v1 -> v2: Add pm_runtime_enable() to device_suspend_late() error pa=
th (Rose).
> > > >
> > > > ---
> > > >  drivers/base/power/main.c |   15 ++++++++-------
> > > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > > >
> > > > --- a/drivers/base/power/main.c
> > > > +++ b/drivers/base/power/main.c
> > > > @@ -941,11 +941,11 @@ Run:
> > > >
> > > >  Skip:
> > > >         dev->power.is_late_suspended =3D false;
> > > > +       pm_runtime_enable(dev);
> > > >
> > > >  Out:
> > > >         TRACE_RESUME(error);
> > > >
> > > > -       pm_runtime_enable(dev);
> > > >         complete_all(&dev->power.completion);
> > > >
> > > >         if (error) {
> > > > @@ -1630,12 +1630,6 @@ static void device_suspend_late(struct d
> > > >         TRACE_DEVICE(dev);
> > > >         TRACE_SUSPEND(0);
> > > >
> > > > -       /*
> > > > -        * Disable runtime PM for the device without checking if th=
ere is a
> > > > -        * pending resume request for it.
> > > > -        */
> > > > -       __pm_runtime_disable(dev, false);
> > > > -
> > > >         dpm_wait_for_subordinate(dev, async);
> > > >
> > > >         if (READ_ONCE(async_error))
> > > > @@ -1649,6 +1643,12 @@ static void device_suspend_late(struct d
> > > >         if (dev->power.syscore || dev->power.direct_complete)
> > > >                 goto Complete;
> > > >
> > > > +       /*
> > > > +        * Disable runtime PM for the device without checking if th=
ere is a
> > > > +        * pending resume request for it.
> > > > +        */
> > > > +       __pm_runtime_disable(dev, false);
> > > > +
> > >
> > > Moving this here means we are going to keep runtime pm enabled for
> > > syscore devices during system wide suspend/resume. That's quite a
> > > change in behaviour for a fix for a regression, I think. Not saying
> > > that it can't work though.
> >
> > syscore devices can be a special case, but I thought it wouldn't be
> > necessary to special-case them.
> >
> > Do you actually know about any of them needing special casing?
>
> In any case, below is a v3 that special-cases syscore devices.  Fortunate=
ly,
> it is not much more complicated than the v2.
>
> Thanks!
>
> ---
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Runtime PM should only be enabled in device_resume_early() if it has
> been disabled for the given device by device_suspend_late().  Otherwise,
> it may cause runtime PM callbacks to run prematurely in some cases
> which leads to further functional issues.
>
> Make two changes to address this problem.
>
> First, reorder device_suspend_late() to only disable runtime PM for a
> device when it is going to look for the device's callback or if the
> device is a "syscore" one.  In all of the other cases, disabling runtime
> PM for the device is not in fact necessary.  However, if the device's
> callback returns an error and the power.is_late_suspended flag is not
> going to be set, enable runtime PM so it only remains disabled when
> power.is_late_suspended is set.
>
> Second, make device_resume_early() only enable runtime PM for the
> devices with the power.is_late_suspended flag set.
>
> Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchronou=
s")
> Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7dee7e=
daaffc33.camel@mediatek.com/
> Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>
> v2 -> v1:
>    * Also set is_late_suspended for syscore devices to avoid skipping run=
time PM
>      disabling for them (Ulf).
>    * Update the changelog to reflect the above.
>
> v1 -> v2:
>    * Add pm_runtime_enable() to device_suspend_late() error path (Rose).
>    * Update the changelog to reflect the above.
>
> ---
>  drivers/base/power/main.c |   25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -903,7 +903,10 @@ static void device_resume_early(struct d
>         TRACE_DEVICE(dev);
>         TRACE_RESUME(0);
>
> -       if (dev->power.syscore || dev->power.direct_complete)
> +       if (dev->power.syscore)
> +               goto Skip;

This will enable runtime PM for a syscore device, even if it wasn't
disabled when device_suspend_late() wasn't called for it.

> +
> +       if (dev->power.direct_complete)
>                 goto Out;
>
>         if (!dev->power.is_late_suspended)
> @@ -941,11 +944,11 @@ Run:
>
>  Skip:
>         dev->power.is_late_suspended =3D false;
> +       pm_runtime_enable(dev);
>
>  Out:
>         TRACE_RESUME(error);
>
> -       pm_runtime_enable(dev);
>         complete_all(&dev->power.completion);
>
>         if (error) {
> @@ -1630,12 +1633,6 @@ static void device_suspend_late(struct d
>         TRACE_DEVICE(dev);
>         TRACE_SUSPEND(0);
>
> -       /*
> -        * Disable runtime PM for the device without checking if there is=
 a
> -        * pending resume request for it.
> -        */
> -       __pm_runtime_disable(dev, false);
> -
>         dpm_wait_for_subordinate(dev, async);
>
>         if (READ_ONCE(async_error))
> @@ -1646,9 +1643,18 @@ static void device_suspend_late(struct d
>                 goto Complete;
>         }
>
> -       if (dev->power.syscore || dev->power.direct_complete)
> +       if (dev->power.direct_complete)
>                 goto Complete;
>
> +       /*
> +        * Disable runtime PM for the device without checking if there is=
 a
> +        * pending resume request for it.
> +        */
> +       __pm_runtime_disable(dev, false);
> +
> +       if (dev->power.syscore)
> +               goto Skip;
> +
>         if (dev->pm_domain) {
>                 info =3D "late power domain ";
>                 callback =3D pm_late_early_op(&dev->pm_domain->ops, state=
);
> @@ -1679,6 +1685,7 @@ Run:
>                 WRITE_ONCE(async_error, error);
>                 dpm_save_failed_dev(dev_name(dev));
>                 pm_dev_err(dev, state, async ? " async late" : " late", e=
rror);
> +               pm_runtime_enable(dev);
>                 goto Complete;
>         }
>         dpm_propagate_wakeup_to_parent(dev);
>
>
>

Kind regards
Uffe

