Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A18C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 04:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3G+OVT+hP++ys+x3EBjqw7D7jl0ngZBCPSiqjU8F9Uk=; b=npeOwq3zoi6X7080PTVrcqrh9s
	BzfwDmbjK6Y7NweZ42bExvk75dJv35XYvhFyAoEJdz4s9p7WyK4JghCLSr+Jqz/CXgNRnrTEv8skk
	ftLgt6f+qYmgSMC64z66zYhDjZgGeXu49qrGa/rw+8evWbdDRjWFmsKfnaaEHwbsZOMC+GT4gQLNc
	IIFwbu0in8GDqQC2wGiTOJHcZAsCIL+exC3JaOtmoD0PZLYN155fdMWrry2QakZ7wdrenb8i79uj4
	s4Gn2CiChVc6T1lDUzLx/W9wV/j+jx4SPTw8l1+aYp0vWJgoVPAt7guKHXMriqLKlU7ARO1su0Ctx
	Ly/lu7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdMxr-0000000Gsk9-1m8z;
	Mon, 12 Aug 2024 04:47:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdMxF-0000000GsgW-23q1
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Aug 2024 04:46:51 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52efdf02d13so6564897e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 21:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723438007; x=1724042807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3G+OVT+hP++ys+x3EBjqw7D7jl0ngZBCPSiqjU8F9Uk=;
        b=Hidl0GUXSz21pC8ufaz364WoHX4NfAjWZThPWnXpd9wX4ShKkpGCkVdbxUL6vkp0Y5
         0EgJ751NxuHuDP2Q/LXrPxpp50mnxo4ParGTKd9WahiW+Jwek3nUhgf0osoCK1UK8NGc
         qqeYfZ7HxKCv01eUIVm2KZXGD6U9SwZJaxAiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723438007; x=1724042807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3G+OVT+hP++ys+x3EBjqw7D7jl0ngZBCPSiqjU8F9Uk=;
        b=vzyNKR8W6JOJcI9R+klCoI+Moxl+KCMdRbrZ9OnOKQ4RliEadzDv9NJMZqOHYzcfSt
         AtHPuZPR/ZWKFsRXjGFs0/VvJLho6gShTA+4wMEdbiRfPJhNoZrJMoPGO4voNU7h4HTZ
         OV5c/vtMzDRxGsUVu6kWXVLtmbIXLL9dRd10tvARq87GKtwCoooNVrtGH0F5TJmY75KL
         hfI3eXztYAFRKCxZFUNF5w5eTcnsIkw6KPlRic6L4JVsL6IBxeDInLKnsVTQN5zf0bCM
         KzjLVhCWomPf4c9jvcDTh0oa66K8RcdAEcu0EuNnFa3Ky7ipwIqwNUK9dOs/vF5kgYQn
         JlPg==
X-Forwarded-Encrypted: i=1; AJvYcCV06aMgt995U9H2HLXE+xGMkbWvFdK1/Azim1sZdLPotocODoFVBSOV5m0hoKRZ3Y+ijZW8vYwUpJMoH1wOHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAOQ7/KqP9ZFGQJnd24IpzWV/6gPyMne50aqd4tDzyyiWm9fpR
	XfNdIpvWLPKp82iIk6rU5E3tT7oCtqZZ+yBjXr1XilOncbe3h+m8Pj4OTNfGwHt4OAogtvluiug
	FM1FeRSS92NurWsT48HCdYB2AJuB0SEYIpIQO
X-Google-Smtp-Source: AGHT+IFnVSMXIzgUCR1aKIEo7IibT84nijwPU1DhYfZ4h5IkgDw15sl0S/evUMey6uGzCvBZZi5Hhqwz6o3olaA2hhM=
X-Received: by 2002:a05:6512:124d:b0:52e:933f:f1fa with SMTP id
 2adb3069b0e04-530eea2a4cbmr6484083e87.61.1723438006644; Sun, 11 Aug 2024
 21:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240809070822.2835371-1-wenst@chromium.org> <b00273d65dfc4b48cca474784184c62b@manjaro.org>
In-Reply-To: <b00273d65dfc4b48cca474784184c62b@manjaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Aug 2024 12:46:35 +0800
Message-ID: <CAGXv+5ERoH=jQGzo=mo2K-r3Meh2-5Kgvjf9Eh7bfNgcQYfWoA@mail.gmail.com>
Subject: Re: [PATCH v2] thermal/of: support thermal zones w/o trips subnode
To: Dragan Simic <dsimic@manjaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Icenowy Zheng <uwu@icenowy.me>, Mark Brown <broonie@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_214649_573700_34F93919 
X-CRM114-Status: GOOD (  31.78  )
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

On Mon, Aug 12, 2024 at 9:22=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Chen-Yu,
>
> Thanks for the patch.  Please see one comment below.
>
> On 2024-08-09 09:08, Chen-Yu Tsai wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >
> > Although the current device tree binding of thermal zones require the
> > trips subnode, the binding in kernel v5.15 does not require it, and
> > many
> > device trees shipped with the kernel, for example,
> > allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64,
> > still
> > comply to the old binding and contain no trips subnode.
> >
> > Allow the code to successfully register thermal zones w/o trips subnode
> > for DT binding compatibility now.
> >
> > Furtherly, the inconsistency between DTs and bindings should be
> > resolved
> > by either adding empty trips subnode or dropping the trips subnode
> > requirement.
> >
> > Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Resurrecting this patch specifically for MediaTek MT8183 Kukui devices.
> >
> > Changes since v1:
> > - set *ntrips at beginning of thermal_of_trips_init()
> > - Keep goto out_of_node_put in of_get_child_count(trips) =3D=3D 0 branc=
h
> > - Check return value of thermal_of_trips_init(), if it is -ENXIO, print
> >   warning and clear |trips| pointer
> > - Drop |mask| change, as the variable was removed
> >
> > I kept Mark's reviewed-by since the changes are more stylish than
> > functional.
> > ---
> >  drivers/thermal/thermal_of.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/thermal/thermal_of.c
> > b/drivers/thermal/thermal_of.c
> > index aa34b6e82e26..f237e74c92fc 100644
> > --- a/drivers/thermal/thermal_of.c
> > +++ b/drivers/thermal/thermal_of.c
> > @@ -128,16 +128,17 @@ static struct thermal_trip
> > *thermal_of_trips_init(struct device_node *np, int *n
> >       struct device_node *trips, *trip;
> >       int ret, count;
> >
> > +     *ntrips =3D 0;
> >       trips =3D of_get_child_by_name(np, "trips");
> >       if (!trips) {
> > -             pr_err("Failed to find 'trips' node\n");
> > -             return ERR_PTR(-EINVAL);
> > +             pr_debug("Failed to find 'trips' node\n");
> > +             return ERR_PTR(-ENXIO);
> >       }
> >
> >       count =3D of_get_child_count(trips);
> >       if (!count) {
> > -             pr_err("No trip point defined\n");
> > -             ret =3D -EINVAL;
> > +             pr_debug("No trip point defined\n");
> > +             ret =3D -ENXIO;
> >               goto out_of_node_put;
> >       }
> >
> > @@ -162,7 +163,6 @@ static struct thermal_trip
> > *thermal_of_trips_init(struct device_node *np, int *n
> >
> >  out_kfree:
> >       kfree(tt);
> > -     *ntrips =3D 0;
> >  out_of_node_put:
> >       of_node_put(trips);
>
> It might be a bit cleaner to keep the "*ntrips =3D 0" assignment
> in the error handling path(s) only, with the positions of the goto
> labels adjusted a bit, and then assign -ENXIO to "ret" and jump
> to the right label when of_get_child_by_name(np, "trips") fails,
> instead of returning from there.
>
> If it's unclear what I'm talking about, please let me know and
> I'll send back the proposed hunk.

I think I understand: move "*ntrips =3D 0" to after of_node_put() in the
error path, and have the "!trips" branch jump to "out_of_node_put" as
well. That works since of_node_put() checks the pointer first.

I'll wait a bit and see if there are any more comments.

ChenYu

> > @@ -490,8 +490,13 @@ static struct thermal_zone_device
> > *thermal_of_zone_register(struct device_node *
> >
> >       trips =3D thermal_of_trips_init(np, &ntrips);
> >       if (IS_ERR(trips)) {
> > -             pr_err("Failed to find trip points for %pOFn id=3D%d\n", =
sensor, id);
> > -             return ERR_CAST(trips);
> > +             if (PTR_ERR(trips) !=3D -ENXIO) {
> > +                     pr_err("Failed to find trip points for %pOFn id=
=3D%d\n", sensor, id);
> > +                     return ERR_CAST(trips);
> > +             }
> > +
> > +             pr_warn("Failed to find trip points for %pOFn id=3D%d\n",=
 sensor, id);
> > +             trips =3D NULL;
> >       }
> >
> >       ret =3D thermal_of_monitor_init(np, &delay, &pdelay);

