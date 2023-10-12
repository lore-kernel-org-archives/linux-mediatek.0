Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0933CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQ+0aHw6sQMmsRhISm2t/oJY7lh7N5E9AbFnFFga21k=; b=XzovISLBGMirBeBu/dwjvtLHd/
	Y9vUi3I+0kS7zlGwN2qucEQO8fESRmUxhppGFR+PwkA32mR/Y9h2dzZl7vleP/lRqFCg6j8FFef8y
	IyXnSKPhV0v8jtJoEAFlur2cYT/ZCk1n7EqTkRuOgBXWgKF4US541WXicJ1gUvB53Lx9oxetf45z8
	R0HtWuBXONVkB9Vu4QuA0WJMEFnHsChTD9tG6Z3kOd2IC/PTSWBg6pnM66uVPqxAJ2XV005UypL4b
	HU5jJ86qVaMBEC/qbFq1t0CEeWU0/EJoXMs7eImfRr7lgT+McxGRheo27mIBJafbhXIOO7pxmleE6
	0LxxDZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqz69-001TeD-3C;
	Thu, 12 Oct 2023 17:03:45 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqz65-001Td8-2R;
	Thu, 12 Oct 2023 17:03:43 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a707bc2397so177743b6e.0;
        Thu, 12 Oct 2023 10:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697130220; x=1697735020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ+0aHw6sQMmsRhISm2t/oJY7lh7N5E9AbFnFFga21k=;
        b=RB4Khy5mE0ILwquxHYfbAm6MaB0DVRl4fKz1m/AOTpFWkc3nAy41RELXp0OL1BMnmg
         56pHZNeMPmC+qx55j9BKuuf1QfATh8aFU0deMItTJ4ysgub+T4PHNJjAPrf8/+gw+bKM
         A8zD2JKu4BinXH+xvaElNG/jnYksrSyKsDZSbXS2ql/NtiHyBTRrG+yUCTDjziZavwgy
         X36X+qD6MOk41djOMcuYWWuTnz9SilR5HmL5AWj+8+xX6jdpaUJ5kObYukzUy2q/3sQi
         AzzqBVWLZR/PjFnNouEMqpFuJiD83OnYP0VTQ0LoTrfNVOEZxmzioVozT0gAc+fUKIbX
         sJHw==
X-Gm-Message-State: AOJu0YwexKtYjCr9qev42PslKLvN3s3m3N4ccBDTUAV2mEKuIz1IIQXq
	yJ1m408klirL8b8xntVBXtmwHAskBlAcSv/GYl8=
X-Google-Smtp-Source: AGHT+IGBZDKyJD0i4Rb6WrCw/7nCmvRCRZiPDHCjEHSYH2ay0b2U53TEfTm6dOdP4vl4qt1PTdMgxQtx16k2IVf+oXk=
X-Received: by 2002:a4a:df07:0:b0:57b:73f6:6f80 with SMTP id
 i7-20020a4adf07000000b0057b73f66f80mr24752122oou.0.1697130220076; Thu, 12 Oct
 2023 10:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230916113327.85693-1-bo.ye@mediatek.com> <a3255da4-b2af-4403-af68-3067a5fd49bf@linaro.org>
In-Reply-To: <a3255da4-b2af-4403-af68-3067a5fd49bf@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 12 Oct 2023 19:03:28 +0200
Message-ID: <CAJZ5v0i0Yk+juOQthy2dh89L9RdOBRHcSk43KLEGMeJszTXBVQ@mail.gmail.com>
Subject: Re: [PATCH] Subject: thermal: Fix potential race condition in suspend/resume
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bo Ye <bo.ye@mediatek.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yugang.wang@mediatek.com, 
	yongdong.zhang@mediatek.com, browse.zhang@mediatek.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_100341_793265_7EDC14D4 
X-CRM114-Status: GOOD (  25.74  )
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

On Thu, Oct 12, 2023 at 5:39=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 16/09/2023 13:33, Bo Ye wrote:
> > From: "yugang.wang" <yugang.wang@mediatek.com>
> >
> > Body:
> > This patch fixes a race condition during system resume. It occurs if
> > the system is exiting a suspend state and a user is trying to
> > register/unregister a thermal zone concurrently. The root cause is
> > that both actions access the `thermal_tz_list`.
>
> I'm not sure the tasks are already thawed during POST_RESTORE, so no
> user can unload a driver and then reaching the race window.

Yes, they are.

> Is that an observed issue?

Good question, but the patch looks correct to me.

> > In detail:
> >
> > 1. At PM_POST_SUSPEND during the resume, the system reads all thermal
> >     zones in `thermal_tz_list`, then resets and updates their
> >     temperatures.
> > 2. When registering/unregistering a thermal zone, the
> >     `thermal_tz_list` gets manipulated.
> >
> > These two actions might occur concurrently, causing a race condition.
> > To solve this issue, we introduce a mutex lock to protect
> > `thermal_tz_list` from being modified while it's being read and
> > updated during the resume from suspend.
> >
> > Kernel oops excerpt related to this fix:
> >
> > [ 5201.869845] [T316822] pc: [0xffffffeb7d4876f0] mutex_lock+0x34/0x170
> > [ 5201.869856] [T316822] lr: [0xffffffeb7ca98a84] thermal_pm_notify+0xd=
4/0x26c
> > [... cut for brevity ...]
> > [ 5201.871061] [T316822]  suspend_prepare+0x150/0x470
> > [ 5201.871067] [T316822]  enter_state+0x84/0x6f4
> > [ 5201.871076] [T316822]  state_store+0x15c/0x1e8
> >
> > Change-Id: Ifdbdecba17093f91eab7e36ce04b46d311ca6568
> > Signed-off-by: yugang.wang <yugang.wang@mediatek.com>
> > Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> > ---
> >   drivers/thermal/thermal_core.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_c=
ore.c
> > index 8717a3343512..a7a18ed57b6d 100644
> > --- a/drivers/thermal/thermal_core.c
> > +++ b/drivers/thermal/thermal_core.c
> > @@ -1529,12 +1529,14 @@ static int thermal_pm_notify(struct notifier_bl=
ock *nb,
> >       case PM_POST_HIBERNATION:
> >       case PM_POST_RESTORE:
> >       case PM_POST_SUSPEND:
> > +             mutex_lock(&thermal_list_lock);
> >               atomic_set(&in_suspend, 0);
> >               list_for_each_entry(tz, &thermal_tz_list, node) {
> >                       thermal_zone_device_init(tz);
> >                       thermal_zone_device_update(tz,
> >                                                  THERMAL_EVENT_UNSPECIF=
IED);
> >               }
> > +             mutex_unlock(&thermal_list_lock);
> >               break;
> >       default:
> >               break;
>
> --

