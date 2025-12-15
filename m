Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4217D5B843
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e08qkOpj3WfbTFuZmyrzV5+JluhiQ0mupHHDg3KLdTw=; b=alYZzAm9qiCMng1385eKDD8XdD
	PLIpnH5CD+80lEE5J4uWabe35eUkxS6hklCNSxgnE37bDlRE2vFe5oIQI6fx5tZtTfc0TGNzyuZPX
	WkjIHT9XhI7SuBV4xoxKH9MNndxQp/6Fn5GzdgZBHwfwkgmSn/NE7+PBcXcRPmHvTCl0Lwso/y2UD
	He/e8HP+/FHa6wSQRPuFlelPDmknOObCNYGcemWtkzb0bkDOGhW61xF+LJq/reUBb+9kqhqDmK0wU
	T/dUeN7C4ZovtEN7hypsERK6qmebKmy7sxnc72YzgYFLb1k5ocjNXlgwfFht34zUzfK7n0zmcjYJx
	sIdwVsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAp5-00000003vxw-3TSk;
	Mon, 15 Dec 2025 15:49:19 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAp3-00000003vxG-3FWX
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Dec 2025 15:49:19 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6455a60c12bso2435306d50.3
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Dec 2025 07:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765813757; x=1766418557; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e08qkOpj3WfbTFuZmyrzV5+JluhiQ0mupHHDg3KLdTw=;
        b=SDuycov1ED6Ra1sSelhveOvqf+3sDOf/3dlBTZD67H61lU/W4Zlbbpu3TsiNDKsIQB
         +hRxw0jAqdmnKo/7Y6mNdG1oQSRHFvxByuz0UgxQKeKmOW9xDzQL1TPpXxfnht9Xs5jX
         mrZnpUJNWdLF8PFd9kKTf4nYfSWb0BQyDS1RmlfYgQTmAoFYwnImchavZ5z+BbdvQAi4
         uL1QPhlGDKgWzq2ws9+mE3+Chig7eFbj5oxIxGMVPoQWOlDXzmHIeZfsM8XuAlevanP/
         xjx9zn6DKDm6f+vjuqtk0fiJtgnV58bJib5he6LMcBkFqxZHrvLikI/ZhrcnfVSQ40o+
         XS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813757; x=1766418557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e08qkOpj3WfbTFuZmyrzV5+JluhiQ0mupHHDg3KLdTw=;
        b=HyyZsWTH+k5F0+96g11tUqyje8UB2xtyVEXwAIDdZvmlZbKhaZFaLgMtsXceIr5+DQ
         Jiyx+GeLjSKZwZswR42OAdLmtFxfZ8pUoL2hpr0445jeXBL77Ooajr/lmGJK2N3M80ni
         8TEJKwovH0Ez4rEgHiQ2LAyKDmst01reEYXJYsh6uGQLdxxnr9tusdJNRYth4Taytjl0
         7ZnOaaTs+X1mN4HJpJLxDEe+HoC1ZKneDm8FcGgqztFeAyuaueaOAtsy6lKm8KNoeZdW
         TMBN1AwvmhQ5spq4r51aZx5b/C0llFhfE0U2HlmFUI36MoUZ3JFwbljhKLbn7RzwEAOc
         /J9w==
X-Forwarded-Encrypted: i=1; AJvYcCUuvQMwVevE1bBem+PealCJ3LJ6nggG7TMO+8gKpSKEmuVlppzMqK/IXfvFj+pV1q7kpR/si7+W5oTM7m2Z0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzszjtSw2uaTccOFtHqngKKsS9KKCOAaBk/2+8KcXVHhbeyQs6/
	F6WFN8i/atiA+nQo25Ua8GevIl7s/+MNh6wfQ4Jfy7IJ0MEFe9ozRouBdxTHbbCq2hlDlzLqlfp
	VRrbTJbzKqEidy0SCayyIid3gesgw/7UrQbSnEUXDqw==
X-Gm-Gg: AY/fxX6tXeKXgXLjIK2VfGHvmr7AZhkZ1H9eENg3JDfdHofLQMQ5iBZN+oILAxmNBQj
	TJlnVT3D5rRbSnrFVxMReHnJqdZWASyfBp/0ZML35Wyb2H/hAGDoml3MSSHQxLWFdla8aYAHsWr
	KrjFVqc+G+T182DJs96mnTB9Ab0BgAQwGzsQ/NW7JGpO2D2dxVouPgFcS0S60/p3S6r8Y1U9nky
	BrJms/3SCuf87vm1TDTmfFUH1FmaWEhbIhDiMcl3Mm3No0l+IlegAe4TPGFSayv4fpblCkjAGYW
	tsbn3g4=
X-Google-Smtp-Source: AGHT+IG42Dlb5H8RBa3dDWJe/njq8QKAlsDYFOIdkUNzlr/ALH53QmEtN3T7DTv+XnZyzYJx5usU9tSBf+EChkTQgJU=
X-Received: by 2002:a05:690e:1244:b0:644:43f7:11aa with SMTP id
 956f58d0204a3-645555cdd52mr8764242d50.13.1765813756587; Mon, 15 Dec 2025
 07:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20251215122154.3180001-1-ed.tsai@mediatek.com> <12807571.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12807571.O9o76ZdvQC@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:48:39 +0100
X-Gm-Features: AQt7F2p9LaiGdJ2wDLThy2UohaIFGncIyGbhH9qnDbL_6WQ4z7c1iocSPb_Ocjg
Message-ID: <CAPDyKFpdixuO_ySig9dajFsv40J7d5ML67h6MwCkemrq3fft_Q@mail.gmail.com>
Subject: Re: [PATCH v1] PM: runtime: Do not clear needs_force_resume with
 enabled runtime PM
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ed Tsai <ed.tsai@mediatek.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, freddy.shin@mediatek.com, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074918_037064_6ACC9767 
X-CRM114-Status: GOOD (  26.51  )
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

On Mon, 15 Dec 2025 at 15:21, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Monday, December 15, 2025 1:21:42 PM CET ed.tsai@mediatek.com wrote:
> > From: Ed Tsai <ed.tsai@mediatek.com>
> >
> > needs_force_resume is a bitfield member in struct dev_pm_info and must
> > be accessed under the same lock as its bitfield group.
> >
> > A real concurrent write was observed between needs_force_resume and
> > idle_notification; stacks below:
> >
> > write needs_force_resume:
> >   pm_runtime_reinit+0x110/0x360
> >   really_probe+0xe0/0x464
> >   __driver_probe_device+0x9c/0x104
> >   driver_probe_device+0x3c/0x1a8
> >   __device_attach_driver+0x100/0x17c
> >   bus_for_each_drv+0x10c/0x168
> >   __device_attach_async_helper+0x7c/0xf4
> >   async_run_entry_fn+0x4c/0x1b4
> >   process_scheduled_works+0x1dc/0x498
> >   worker_thread+0x220/0x320
> >   kthread+0x150/0x27c
> >   ret_from_fork+0x10/0x20
> >
> > write idle_notification:
> >   rpm_idle+0x464/0x5f8
> >   __pm_runtime_idle+0x7c/0x170
> >   scsi_autopm_put_device+0x18/0x28
> >   scsi_sysfs_add_sdev+0x1a0/0x1d8
> >   scsi_probe_and_add_lun+0xbd8/0xcd0
> >   __scsi_add_device+0xb8/0x11c
> >   ufshcd_async_scan+0xb4/0x3a4
> >   async_run_entry_fn+0x4c/0x1b4
> >   process_scheduled_works+0x1dc/0x498
> >   worker_thread+0x220/0x320
> >   kthread+0x150/0x27c
> >   ret_from_fork+0x10/0x20
> >
> > Fixes: 89d9cec3b1e9 ("PM: runtime: Clear power.needs_force_resume in pm_runtime_reinit()")
> > Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
> > ---
> >  drivers/base/power/runtime.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > index 84676cc24221..3328543b1ed8 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -1879,11 +1879,22 @@ void pm_runtime_reinit(struct device *dev)
> >                               pm_runtime_put(dev->parent);
> >               }
> >       }
> > +
> >       /*
> >        * Clear power.needs_force_resume in case it has been set by
> >        * pm_runtime_force_suspend() invoked from a driver remove callback.
> >        */
> > +     if (dev->power.irq_safe)
> > +             spin_lock(&dev->power.lock);
> > +     else
> > +             spin_lock_irq(&dev->power.lock);
> > +
> >       dev->power.needs_force_resume = false;
> > +
> > +     if (dev->power.irq_safe)
> > +             spin_unlock(&dev->power.lock);
> > +     else
> > +             spin_unlock_irq(&dev->power.lock);
> >  }
> >
> >  /**
> >
>
> Thanks for the patch, but this happens because the flag is cleared when
> runtime PM is enabled which shouldn't be necessary, so I'd prefer to make
> the change below.
>
> ---
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Subject: [PATCH v1] PM: runtime: Do not clear needs_force_resume with enabled runtime PM
>
> Commit 89d9cec3b1e9 ("PM: runtime: Clear power.needs_force_resume in
> pm_runtime_reinit()") added provisional clearing of power.needs_force_resume
> to pm_runtime_reinit(), but it is done unconditionally which is a
> mistake because pm_runtime_reinit() may race with driver probing
> and removal [1].
>
> To address this, notice that power.needs_force_resume should never
> be set when runtime PM is enabled and so it only needs to be cleared
> when runtime PM is disabled, and update pm_runtime_init() to only
> clear that flag when runtime PM is disabled.
>
> Fixes: 89d9cec3b1e9 ("PM: runtime: Clear power.needs_force_resume in pm_runtime_reinit()")
> Reported-by: Ed Tsai <ed.tsai@mediatek.com>
> Closes: https://lore.kernel.org/linux-pm/20251215122154.3180001-1-ed.tsai@mediatek.com/ [1]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/base/power/runtime.c |   22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1878,16 +1878,18 @@ void pm_runtime_init(struct device *dev)
>   */
>  void pm_runtime_reinit(struct device *dev)
>  {
> -       if (!pm_runtime_enabled(dev)) {
> -               if (dev->power.runtime_status == RPM_ACTIVE)
> -                       pm_runtime_set_suspended(dev);
> -               if (dev->power.irq_safe) {
> -                       spin_lock_irq(&dev->power.lock);
> -                       dev->power.irq_safe = 0;
> -                       spin_unlock_irq(&dev->power.lock);
> -                       if (dev->parent)
> -                               pm_runtime_put(dev->parent);
> -               }
> +       if (pm_runtime_enabled(dev))
> +               return;
> +
> +       if (dev->power.runtime_status == RPM_ACTIVE)
> +               pm_runtime_set_suspended(dev);
> +
> +       if (dev->power.irq_safe) {
> +               spin_lock_irq(&dev->power.lock);
> +               dev->power.irq_safe = 0;
> +               spin_unlock_irq(&dev->power.lock);
> +               if (dev->parent)
> +                       pm_runtime_put(dev->parent);
>         }
>         /*
>          * Clear power.needs_force_resume in case it has been set by
>
>
>

