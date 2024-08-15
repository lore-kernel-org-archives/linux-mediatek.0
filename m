Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10315C52D7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Aug 2024 04:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1T1veMt9WGefVzxV61hQN46s0M2ozLoU6sDsGtd5rg0=; b=yXoqglN5zO4pmqmV5lfRkpkCSm
	M+5uNm1C/MEG6urQDWbCSp9AOTaC8F/VOw5zL8Z3UhiHgz6S3ZrBo7Mx2b8lcbokwaioWrMwuhuWo
	kk87RwI01Pbj7Ne4kFHJZ0zPN0FxNvsxtYlKqBxLqG7/H2SUNrQ7+9KT/xM1ipr0XTtvajeNCalYJ
	5z1lZOLE5XZxTMY6jGr2kO6/MseHnDQFWzo2VsV7fKk5KuE+b/IDgdMemZqAJLX2rbkFfi1xsudW7
	cfmg0fMO1PUQIF7eTVe5cVBygEZ2IsDf+S9UN3hQ7J54wEhjnIEG9EcWnpe1Z8fd8v6l035nru8A0
	pmnOBnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seSN7-000000090jh-49O2;
	Thu, 15 Aug 2024 04:46:01 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seSMT-000000090ey-3IGG
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Aug 2024 04:45:23 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52f04c29588so748617e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Aug 2024 21:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723697119; x=1724301919; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1T1veMt9WGefVzxV61hQN46s0M2ozLoU6sDsGtd5rg0=;
        b=lfEmnjsuqVr6MlvI9EqJ9ZPJ2JS1aSx7h/1i7wCJpBb0srfxRbTzqpU8/OALnCnz7k
         TmJRBddGNzw6YliiheqTsW3DPQBeVeC8VpWVmVcdHfa09plMC4T4y3jmR5/kS5W46a4D
         4mzgA7cuUxYyOGXagXKZUwqPLwOZu7RxHPVKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697119; x=1724301919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1T1veMt9WGefVzxV61hQN46s0M2ozLoU6sDsGtd5rg0=;
        b=jbfOaf5ebPjLrJ87QniuuyI8ojwYBqameTXUE1eGFdyB5UYYIZUoJFg2fQJjxOBeGR
         aWHSENqnveMG97eAqCXrk4WyaobC2iySbCQzCsvevMyFIuOOv+m4/TMjGtdaxUAOfxW3
         vNIuXziHv0o9fjB/KJLmauvIJoYgdxYtg9G8JDMvz132C3JGyIZxoQNFk3/FEUAtKims
         V0lEYGvg9nC7lZyJqmqXVa7iVbR34+y7NXSvGZ6Dbshjk1OsPGFqVJswfFkaTXsoP2TI
         IlkK/ASJc2/wVaMqavslxbv66LtrtyhL3xdhWsPRW2wQalkPMCvT6QtVbUPnp/6rXvxZ
         pl9w==
X-Forwarded-Encrypted: i=1; AJvYcCVqUyIAEor9T7rCbNBbjm+b5YNI7o5hv1izGLkAV+uC+dNuCwTlLvUTeZdz+ToDkFDj9ctt6mewWum3CcMozRZCCmwslGtnCCGjhOjXMUG0LFN8
X-Gm-Message-State: AOJu0YzaCJvz7dOrmEeEiylVPZJlzP+3P9dcysCLGJF4ZfS7tL9NsIPk
	J1n3sIuaq+zukE7RUTQifoCYf0mVP5dO+QsNU5ueo+f27KPqzTkzCjE3fHekhgmyqcPfA8kMmPn
	e8d9JTRsBB9OyNh/UPhHpbSXfRELMuK57oDzl
X-Google-Smtp-Source: AGHT+IE0yv+XOrbSGJIzzzRVJje3yinlPEAf+QPJIrtQzzafv5gyr4BXZK+TLc3EfZzK62nIdXUHueYK0wWEpSky5y0=
X-Received: by 2002:a05:6512:3b2b:b0:52c:fd46:bf07 with SMTP id
 2adb3069b0e04-532edbbe468mr2990731e87.49.1723697119152; Wed, 14 Aug 2024
 21:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240809070822.2835371-1-wenst@chromium.org> <b00273d65dfc4b48cca474784184c62b@manjaro.org>
 <CAGXv+5ERoH=jQGzo=mo2K-r3Meh2-5Kgvjf9Eh7bfNgcQYfWoA@mail.gmail.com>
In-Reply-To: <CAGXv+5ERoH=jQGzo=mo2K-r3Meh2-5Kgvjf9Eh7bfNgcQYfWoA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Aug 2024 12:45:07 +0800
Message-ID: <CAGXv+5GQixa389nudKk=U3Rh2jN8VuWQGKb9rsixhvj3KGFQDg@mail.gmail.com>
Subject: Re: [PATCH v2] thermal/of: support thermal zones w/o trips subnode
To: Dragan Simic <dsimic@manjaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Icenowy Zheng <uwu@icenowy.me>, Mark Brown <broonie@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_214521_879169_BEED781F 
X-CRM114-Status: GOOD (  34.74  )
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

On Mon, Aug 12, 2024 at 12:46=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Mon, Aug 12, 2024 at 9:22=E2=80=AFAM Dragan Simic <dsimic@manjaro.org>=
 wrote:
> >
> > Hello Chen-Yu,
> >
> > Thanks for the patch.  Please see one comment below.
> >
> > On 2024-08-09 09:08, Chen-Yu Tsai wrote:
> > > From: Icenowy Zheng <uwu@icenowy.me>
> > >
> > > Although the current device tree binding of thermal zones require the
> > > trips subnode, the binding in kernel v5.15 does not require it, and
> > > many
> > > device trees shipped with the kernel, for example,
> > > allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64,
> > > still
> > > comply to the old binding and contain no trips subnode.
> > >
> > > Allow the code to successfully register thermal zones w/o trips subno=
de
> > > for DT binding compatibility now.
> > >
> > > Furtherly, the inconsistency between DTs and bindings should be
> > > resolved
> > > by either adding empty trips subnode or dropping the trips subnode
> > > requirement.
> > >
> > > Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > Resurrecting this patch specifically for MediaTek MT8183 Kukui device=
s.
> > >
> > > Changes since v1:
> > > - set *ntrips at beginning of thermal_of_trips_init()
> > > - Keep goto out_of_node_put in of_get_child_count(trips) =3D=3D 0 bra=
nch
> > > - Check return value of thermal_of_trips_init(), if it is -ENXIO, pri=
nt
> > >   warning and clear |trips| pointer
> > > - Drop |mask| change, as the variable was removed
> > >
> > > I kept Mark's reviewed-by since the changes are more stylish than
> > > functional.
> > > ---
> > >  drivers/thermal/thermal_of.c | 19 ++++++++++++-------
> > >  1 file changed, 12 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/thermal/thermal_of.c
> > > b/drivers/thermal/thermal_of.c
> > > index aa34b6e82e26..f237e74c92fc 100644
> > > --- a/drivers/thermal/thermal_of.c
> > > +++ b/drivers/thermal/thermal_of.c
> > > @@ -128,16 +128,17 @@ static struct thermal_trip
> > > *thermal_of_trips_init(struct device_node *np, int *n
> > >       struct device_node *trips, *trip;
> > >       int ret, count;
> > >
> > > +     *ntrips =3D 0;
> > >       trips =3D of_get_child_by_name(np, "trips");
> > >       if (!trips) {
> > > -             pr_err("Failed to find 'trips' node\n");
> > > -             return ERR_PTR(-EINVAL);
> > > +             pr_debug("Failed to find 'trips' node\n");
> > > +             return ERR_PTR(-ENXIO);
> > >       }
> > >
> > >       count =3D of_get_child_count(trips);
> > >       if (!count) {
> > > -             pr_err("No trip point defined\n");
> > > -             ret =3D -EINVAL;
> > > +             pr_debug("No trip point defined\n");
> > > +             ret =3D -ENXIO;
> > >               goto out_of_node_put;
> > >       }
> > >
> > > @@ -162,7 +163,6 @@ static struct thermal_trip
> > > *thermal_of_trips_init(struct device_node *np, int *n
> > >
> > >  out_kfree:
> > >       kfree(tt);
> > > -     *ntrips =3D 0;
> > >  out_of_node_put:
> > >       of_node_put(trips);
> >
> > It might be a bit cleaner to keep the "*ntrips =3D 0" assignment
> > in the error handling path(s) only, with the positions of the goto
> > labels adjusted a bit, and then assign -ENXIO to "ret" and jump
> > to the right label when of_get_child_by_name(np, "trips") fails,
> > instead of returning from there.
> >
> > If it's unclear what I'm talking about, please let me know and
> > I'll send back the proposed hunk.
>
> I think I understand: move "*ntrips =3D 0" to after of_node_put() in the
> error path, and have the "!trips" branch jump to "out_of_node_put" as
> well. That works since of_node_put() checks the pointer first.
>
> I'll wait a bit and see if there are any more comments.

Actually, Krzysztof (+CC) is cleaning up this function using scoped
variables. So it might actually make more sense to move "*ntrips =3D 0"
to the top once the error path is completely removed.

ChenYu

> ChenYu
>
> > > @@ -490,8 +490,13 @@ static struct thermal_zone_device
> > > *thermal_of_zone_register(struct device_node *
> > >
> > >       trips =3D thermal_of_trips_init(np, &ntrips);
> > >       if (IS_ERR(trips)) {
> > > -             pr_err("Failed to find trip points for %pOFn id=3D%d\n"=
, sensor, id);
> > > -             return ERR_CAST(trips);
> > > +             if (PTR_ERR(trips) !=3D -ENXIO) {
> > > +                     pr_err("Failed to find trip points for %pOFn id=
=3D%d\n", sensor, id);
> > > +                     return ERR_CAST(trips);
> > > +             }
> > > +
> > > +             pr_warn("Failed to find trip points for %pOFn id=3D%d\n=
", sensor, id);
> > > +             trips =3D NULL;
> > >       }
> > >
> > >       ret =3D thermal_of_monitor_init(np, &delay, &pdelay);

