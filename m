Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F8DD5B866
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2024 03:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwCHZzOi2IxF0273uCz1RBIIGqQ3HHsLcLh3T1vj37E=; b=yTMvSTFSMKuXk2iQMdIeKL51cj
	zl4nQU+zBQmyOWqy2+7ErwTgrdjBKUSeZgut663qQ/Qc/aMx+sh6qJI57ypJmXkmoaiyRmxK93y7v
	VNlqff0tmz+h0q/sB0+0E+K0099+OQqqSOrJGVrDKWD7m60qrUQItWGrYfHaz+z9bbLS98HsVAKlI
	FYSH58/34eq+1TYxDrKh3XFw3OxLwD7LBcZbNQpr9AGce90E28fSszN+CH8anM6rlUnSfQdWjWYoy
	Sdiqry8OFJkineVsKnBlyxSJUOndGzHryyXNto+jzPipTrdXB2BtI5BEwaCCmVocLQVmmTOJ0cKFr
	AzuCvLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5chP-0000000D46M-1H9d;
	Tue, 29 Oct 2024 03:15:15 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5chN-0000000D44w-1cGF
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Oct 2024 03:15:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e4b7409fso4779313e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 20:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730171711; x=1730776511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwCHZzOi2IxF0273uCz1RBIIGqQ3HHsLcLh3T1vj37E=;
        b=IYRhZdCQ++owusMlFx+VYsWhYvb3TiMlSL212g9o9DjDGZ3lJ0u6JKN89rDxys6Zfx
         VoY05NKAJJY5uDkpyRwdqKo2ITZPWwa34uA+71y29Mv8KDZfj8nniWRxyq6U3dJb2E7L
         feHHt+QnlM1qRcGeK2OBzfaGMGWRoa/SVSqVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730171711; x=1730776511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwCHZzOi2IxF0273uCz1RBIIGqQ3HHsLcLh3T1vj37E=;
        b=p1Z/Hc0BBV6rrxemhRYzu9Iq4o0/yuFjqh/RLLNbRTeExbq03vqRxgAPfgYzaRx5QW
         9pLkU1n3YaGYp+1xCvZ0aFoz7gYGv4JbmqzakelzCZmOXMsg4UibN0I1pQy+kKUd5QxQ
         Qf6/HajpyhLre6EDxLuUdXMkXoc0S0DS5VzTcRiQdF4xF9vhR4Vu0/V7fp9cOp+QLkkE
         dEPYF+ic63GXnS9tj3gY7WCM34Gs1Z92PdIg+WQLWvumUwUFwpMn0w8lTmeW/Bb6ZxLa
         QknhXD1hKa1YsWuNHGPL9LETXN5Mr4g1fE+nTXNYlkT7bVQFkowUf4UDIiH7YeT1tlS9
         Gahw==
X-Forwarded-Encrypted: i=1; AJvYcCUtkixO/YD6M9TopplsGmOx8VgPIfSiwy1IgA30SO/CU/qaJKU/ElnFr99FBr2voMdM+iJhtohdtfUrRSTD+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Ekno5Ty5aUcqTk+ut1LMCErU1zQMjv5vhVkIh1RT4SDeyA/6
	t6yL/KL0ZrpC1rD7dY4g7VC6hImlE6hKrUyWQAqogdmEMTGFApcZKfZr0LCKN4l/XSSCX/WuD9P
	G4Zbw4Xbt9Kw+rik164XY2UwV+d++t5wygSae
X-Google-Smtp-Source: AGHT+IE/PeX5d+WkadX6mrq9k/9kf941Iyu+kJldmFZ1nqsFjejU2v3e96UXSMIqxJKvoz+7XYik6OvMSya72Oe1z6c=
X-Received: by 2002:a05:6512:3ca4:b0:539:edc9:7400 with SMTP id
 2adb3069b0e04-53b4927d0c1mr147190e87.20.1730171711103; Mon, 28 Oct 2024
 20:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241018073139.1268995-1-wenst@chromium.org> <20241028171901.2484882-1-daniel.lezcano@linaro.org>
 <be7ad677-f7e3-4eab-8b7e-1c375eed3ef7@linaro.org>
In-Reply-To: <be7ad677-f7e3-4eab-8b7e-1c375eed3ef7@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 29 Oct 2024 11:14:59 +0800
Message-ID: <CAGXv+5F8Ga8DF-G4-RtkpQA4b34QtYn8z1WGkSeMtfUkVApNpg@mail.gmail.com>
Subject: Re: [PATCH] thermal/of: support thermal zones w/o trips subnode
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, Icenowy Zheng <uwu@icenowy.me>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_201513_470759_82F111B5 
X-CRM114-Status: GOOD (  24.86  )
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

On Tue, Oct 29, 2024 at 1:23=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 28/10/2024 18:19, Daniel Lezcano wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >
> > Although the current device tree binding of thermal zones require the
> > trips subnode, the binding in kernel v5.15 does not require it, and man=
y
> > device trees shipped with the kernel, for example,
> > allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, stil=
l
> > comply to the old binding and contain no trips subnode.
> >
> > Allow the code to successfully register thermal zones w/o trips subnode
> > for DT binding compatibility now.
> >
> > Furtherly, the inconsistency between DTs and bindings should be resolve=
d
> > by either adding empty trips subnode or dropping the trips subnode
> > requirement.
> >
> > Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > [wenst@chromium.org: Reworked logic and kernel log messages]
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
> > Link: https://lore.kernel.org/r/20241018073139.1268995-1-wenst@chromium=
.org
> > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>
> In order to fix a conflict when merging this patch I did the following
> changes. Let me know if you [dis]agree with the changes

Looks fine to me.

Thanks
ChenYu

> This change will go through the 'fixes' branch, so for v6.12
>
> Thanks
>
> > ---
> >   drivers/thermal/thermal_of.c | 21 ++++++++++-----------
> >   1 file changed, 10 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.=
c
> > index a4caf7899f8e..07e09897165f 100644
> > --- a/drivers/thermal/thermal_of.c
> > +++ b/drivers/thermal/thermal_of.c
> > @@ -99,18 +99,15 @@ static struct thermal_trip *thermal_of_trips_init(s=
truct device_node *np, int *n
> >       struct device_node *trips;
> >       int ret, count;
> >
> > +     *ntrips =3D 0;
> > +
> >       trips =3D of_get_child_by_name(np, "trips");
> > -     if (!trips) {
> > -             pr_err("Failed to find 'trips' node\n");
> > -             return ERR_PTR(-EINVAL);
> > -     }
> > +     if (!trips)
> > +             return NULL;
> >
> >       count =3D of_get_child_count(trips);
> > -     if (!count) {
> > -             pr_err("No trip point defined\n");
> > -             ret =3D -EINVAL;
> > -             goto out_of_node_put;
> > -     }
> > +     if (!count)
> > +             return NULL;
> >
> >       tt =3D kzalloc(sizeof(*tt) * count, GFP_KERNEL);
> >       if (!tt) {
> > @@ -133,7 +130,6 @@ static struct thermal_trip *thermal_of_trips_init(s=
truct device_node *np, int *n
> >
> >   out_kfree:
> >       kfree(tt);
> > -     *ntrips =3D 0;
> >   out_of_node_put:
> >       of_node_put(trips);
> >
> > @@ -401,11 +397,14 @@ static struct thermal_zone_device *thermal_of_zon=
e_register(struct device_node *
> >
> >       trips =3D thermal_of_trips_init(np, &ntrips);
> >       if (IS_ERR(trips)) {
> > -             pr_err("Failed to find trip points for %pOFn id=3D%d\n", =
sensor, id);
> > +             pr_err("Failed to parse trip points for %pOFn id=3D%d\n",=
 sensor, id);
> >               ret =3D PTR_ERR(trips);
> >               goto out_of_node_put;
> >       }
> >
> > +     if (!trips)
> > +             pr_info("No trip points found for %pOFn id=3D%d\n", senso=
r, id);
> > +
> >       ret =3D thermal_of_monitor_init(np, &delay, &pdelay);
> >       if (ret) {
> >               pr_err("Failed to initialize monitoring delays from %pOFn=
\n", np);
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

