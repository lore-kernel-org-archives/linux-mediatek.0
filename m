Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA05CED243
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ub6oQvlEtYLoJrlCD9mhTR7z/VHGGNL0VyAOPZ1FyWo=; b=pfj9C9tquLo/JoLY/gbRJq6iny
	n2Po8nLkGo42tjkThMxxg3zrZB+Bd7JWTFJl4g7lteiHHDFQKmmhjiBWdKsDGB2O1+3iwd5+F8TVq
	tk24tURS2dhY6h2fIr+jymueh1H3wxSKFpJ8wRwYq8KOWXL7ZRaVmbcT5IR3LRgn3kP2Kqkk8PxXb
	ltGs8ymL/gXzwuPZfZcpLL+o4KdNa5JHNchf9j6+OovCKoToMx2HxwdPcJuIzinb64/zAjgeiuJtF
	6BMGbkNVTt0IIv0kboxIAZZLi8YORWBZnMqrGHOyH2k3tzlUVRnmgFOtUifhhFJlIF2w7an7kbg8k
	9DwyViIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLL9g-00000000RRC-49Cn;
	Tue, 18 Nov 2025 12:49:56 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLL9e-00000000RQo-2LrI
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 12:49:56 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-787e7aa1631so67542407b3.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 04:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763470193; x=1764074993; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ub6oQvlEtYLoJrlCD9mhTR7z/VHGGNL0VyAOPZ1FyWo=;
        b=BeGv9B0f1LgtlCyzyhreyfL8eoJN35VB6WfW4XUtxo+KgX8ehfun8mYSgxFvmdTcdH
         YumXfxUW2pglbDsSo2ZZYOLM5ZD9rmMb5zFKWBkT8PdfjpgSZQCoZndhj8At/zXAHDuy
         1qWfITRsGCUJQfffjwa5kZmOkv9km+zJRUgtADmQx4cK0jRQviX3jWWxpxlyLcMgHqEb
         9Efw0k3zuVNG0nZh1MZRgmq39pkMTtOcbfM00M1OBDtyUVwwCRGviYu8lrLTHffAETjK
         YuVfZ8eNTdIU9ph8xrr2GTz8ZUxFkgW3VfmKujT/CBIBxZS/ZXZvCwb01z5wXrouLUXq
         QvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470193; x=1764074993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ub6oQvlEtYLoJrlCD9mhTR7z/VHGGNL0VyAOPZ1FyWo=;
        b=UMDnNnMS6B37jKGtPMoISzFqdxHONw3OWhOEYRO3lS54pkV5+yL0rw1OkcGqENg79w
         q7MScQsBogL36dakf2ANrmhg8TG1WCJ8rclyN5ihlYKygXyV8T7KhkmJ/cbEVnYFWqbm
         AEtOi6NwgwuhARFJClRO6C+7qQbmAuhrGxFO0Po9BvWmhaX6GEAUW90NqVH0qu4iFAOX
         NQhL8W5fnrEwYEaUq998QQeghZMny9bfoweCCvuBsMyWnqg+77H6j6h8I+BgdRxWoje2
         D39j2haRq/y6qEkpnkrylTgG9z/kcgBdNS2KehokP3lTQiSyTyEMClJRZiXPYVCGfomz
         FGhg==
X-Forwarded-Encrypted: i=1; AJvYcCWKuOzH2iG94OVkVXP7zRkIdIw94b/jOL8ux/CBtDJULjxMDsOKr5kygS00I7vTOn2yW209YZX2KgpyZcJbDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLkDyQOSsBeO2Tdic/CZs4eROH6Od0i4o2R5cil5pz5YOYs1Ur
	atL8YHNs4NY1PWjKgF18OegZq5p5c6cs2s3mgawaT8wikZkHuIyPHQMwOlcioJllr/DKheT4BZq
	i44ONPYywjXVFN49egH5xPAPvu3khgtetUpyuDtq2Zw==
X-Gm-Gg: ASbGncu/eMS3CgGpF6yeSBRydoS/3oXufbFf6FN0oA6xmMD9Oe91jdbFwDYhh+zmKpn
	7a0Izp6YSIZzCfhgv/3GkKCE3+jFjFD9tsLfNi3tn3mHpwM8IhxaiYMY9qtyeniDtnNcZPIzP6n
	IEPVrPv/KFV0wIrseFor36mC5nygiM4qzUxCEmC0C/mNYAKWMfWjFHIHZ1GCaYnCpjRW4t2gYNJ
	6itbxGohYhuwGZkG5Wz6ygrqtSWA7eOoI5fmq5JtPKt9oTfJE1aHnzLXyR9i65ik2NFoAmY
X-Google-Smtp-Source: AGHT+IEUrIciaZ+/GqyeOIzYQaExU4Ajz+xsT/QRuNFCliHkKGZNgLtsOhcPlVhGFuTxkS2ukXW1MwbANuONCy2vZkQ=
X-Received: by 2002:a05:690e:118e:b0:63f:a876:ae58 with SMTP id
 956f58d0204a3-6421341777cmr2485852d50.9.1763470193290; Tue, 18 Nov 2025
 04:49:53 -0800 (PST)
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <5940388.DvuYhMxLoT@rafael.j.wysocki> <119e2410ca32a0d55fa6febf93c7a3164b391db0.camel@mediatek.com>
 <12782716.O9o76ZdvQC@rafael.j.wysocki> <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
 <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com>
In-Reply-To: <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 13:49:16 +0100
X-Gm-Features: AWmQ_bkPv80vLiP8Ho8RcGqH0zNC_axJ4RjcJ2X8UAbi3PlPL_ozFcNziv15WCg
Message-ID: <CAPDyKFqBB7gDXSDV-GbMqWDBbT8RMVdc-9+iDOvEdpVV5TACyw@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, Rose Wu <ya-jou.wu@mediatek.com>, 
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>, 
	linux-mediatek@lists.infradead.org, "artis. chiu" <artis.chiu@mediatek.com>, 
	"Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_044954_659355_9199DCA9 
X-CRM114-Status: GOOD (  40.31  )
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

On Tue, 18 Nov 2025 at 13:26, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tue, Nov 18, 2025 at 1:18=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Tue, 18 Nov 2025 at 12:48, Rafael J. Wysocki <rafael@kernel.org> wro=
te:
> > >
> > > On Tuesday, November 18, 2025 9:31:08 AM CET Rose Wu wrote:
> > > > Hi,
> > > >
> > > > On Mon, 2025-11-17 at 19:57 +0100, Rafael J. Wysocki wrote:
> > > > >
> > > > > Make two changes to address this problem.
> > > > >
> > > > > First, reorder device_suspend_late() to only disable runtime PM f=
or a
> > > > > device if the power.is_late_suspended flag is going to be set for=
 it.
> > > > > In all of the other cases, disabling runtime PM for the device is=
 not
> > > > > in fact necessary.
> > > > >
> > > > > Second, make device_resume_early() only enable runtime PM for the
> > > > > devices with the power.is_late_suspended flag set.
> > > > >
> > > >
> > > > My concern is with the error path in device_suspend_late().
> > > > If a device fails its dpm_run_callback(), it appears that its
> > > > power.is_late_suspended flag is not set, potentially leaving its ru=
ntime
> > > > PM disabled during the resume sequence.
> > >
> > > Right, pm_runtime_enable() is missing in the error path after calling
> > > dpm_run_callback().
> > >
> > > ---
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Runtime PM should only be enabled in device_resume_early() if it has
> > > been disabled for the given device by device_suspend_late().  Otherwi=
se,
> > > it may cause runtime PM callbacks to run prematurely in some cases
> > > which leads to further functional issues.
> > >
> > > Make two changes to address this problem.
> > >
> > > First, reorder device_suspend_late() to only disable runtime PM for a
> > > device when it is going to look for the device's callback.  In all of
> > > the other cases, disabling runtime PM for the device is not in fact
> > > necessary.  However, if the device's callback returns an error and th=
e
> > > power.is_late_suspended flag is not going to be set, enable runtime
> > > PM so it only remains disabled when power.is_late_suspended is set.
> > >
> > > Second, make device_resume_early() only enable runtime PM for the
> > > devices with the power.is_late_suspended flag set.
> > >
> > > Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchr=
onous")
> > > Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> > > Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7d=
ee7edaaffc33.camel@mediatek.com/
> > > Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > ---
> > >
> > > v1 -> v2: Add pm_runtime_enable() to device_suspend_late() error path=
 (Rose).
> > >
> > > ---
> > >  drivers/base/power/main.c |   15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > >
> > > --- a/drivers/base/power/main.c
> > > +++ b/drivers/base/power/main.c
> > > @@ -941,11 +941,11 @@ Run:
> > >
> > >  Skip:
> > >         dev->power.is_late_suspended =3D false;
> > > +       pm_runtime_enable(dev);
> > >
> > >  Out:
> > >         TRACE_RESUME(error);
> > >
> > > -       pm_runtime_enable(dev);
> > >         complete_all(&dev->power.completion);
> > >
> > >         if (error) {
> > > @@ -1630,12 +1630,6 @@ static void device_suspend_late(struct d
> > >         TRACE_DEVICE(dev);
> > >         TRACE_SUSPEND(0);
> > >
> > > -       /*
> > > -        * Disable runtime PM for the device without checking if ther=
e is a
> > > -        * pending resume request for it.
> > > -        */
> > > -       __pm_runtime_disable(dev, false);
> > > -
> > >         dpm_wait_for_subordinate(dev, async);
> > >
> > >         if (READ_ONCE(async_error))
> > > @@ -1649,6 +1643,12 @@ static void device_suspend_late(struct d
> > >         if (dev->power.syscore || dev->power.direct_complete)
> > >                 goto Complete;
> > >
> > > +       /*
> > > +        * Disable runtime PM for the device without checking if ther=
e is a
> > > +        * pending resume request for it.
> > > +        */
> > > +       __pm_runtime_disable(dev, false);
> > > +
> >
> > Moving this here means we are going to keep runtime pm enabled for
> > syscore devices during system wide suspend/resume. That's quite a
> > change in behaviour for a fix for a regression, I think. Not saying
> > that it can't work though.
>
> syscore devices can be a special case, but I thought it wouldn't be
> necessary to special-case them.
>
> Do you actually know about any of them needing special casing?

There are a couple of clocksource drivers, cpuidle-psci,
cpuidle-riscv-sbi and a usb driver that marks their devices as syscore
devices.

It *probably* works to keep runtime pm enabled for all of them, but I
am not sure.

>
> > Although, perhaps better to call __pm_runtime_disable() a few lines
> > earlier and use a separate flag to track that we need to call
> > pm_runtime_enable() in device_resume_early()?
>
> I don't think it is necessary or even useful to introduce new flags for t=
his.

Kind regards
Uffe

