Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68E1D3C551
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZPCNCSETXt2syd1J4HTXcd16+mHxXzHdYO5ObT5uNg=; b=Z81umNeUwtW07zggi3GsaqPi50
	v+UVvaxG6Fil5Ifd55G59oowykrQIt0LbH/6K3wEAjTIipDyVQ5mkkBq3UM5BXQjkDbctE1z5pBpE
	GpFhOtcVmunkBso5IxQH3LnFW0ME7fO1EUYBERXDKHmkyKVBVdinHkXWK17X7BqzuR/F7zNzdneJ2
	LoavkVguI5TGi4GiNI04SeBiXI1GYe0R1I2Y2BO+ZBHGeDhCMqQSAkXFI6/aTrC1odM62C1CXWAWH
	QlJh9kRztv8w4hrHSMpJk1LSViM1fEaimpxRTgV0xESeoCoAwMDwjLQ30kWvkcTZSbjaws4YYYPvH
	Yl44e6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hCM-0000000HIin-2u0b;
	Fri, 18 Oct 2024 07:14:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hA7-0000000HI8Y-3Nwh
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 07:12:41 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539983beb19so1990680e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 00:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729235558; x=1729840358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZPCNCSETXt2syd1J4HTXcd16+mHxXzHdYO5ObT5uNg=;
        b=IsC7dGW+lPyxL+EMx9rA5TemXOGv2F1VTQDqlouxRDsBp0BBUk4l4oRDWXsU1EFGR+
         lCXkWOomf80kJFH19v8I3edNCZlrc9+bOgvRrDzZLHqoX24k0LU3JCQtxCZuzZ4xV+xD
         3J/JLew/mfy5mFFlSpg7WoLsPZXwMePmz7s2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729235558; x=1729840358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZPCNCSETXt2syd1J4HTXcd16+mHxXzHdYO5ObT5uNg=;
        b=QqSc6ldkzYaf/rn8K7mQ3EPIQZLc6YFGYdb9O+y/3Yr9i8UvpjOLTY/zgXZ72p1cRI
         fcmYAAJ/GYzOQnKnDjvPu+nsKuY9/Gv6mIGoc9+0y75K8fW3V2k6EwejihLSQqNijNNU
         61ACSykkpyMILzbY/jxtppV1oOu3Dn/SbwK2MZMyrrfAcnPZXd+EtHUcj7CSfiSzKx3u
         FTPe2yXtnb3ExhcqvvCKFo0emJXwgCoKG1knArcV0zxm26KROr2ScspLYoKUGKBNafbE
         PrJNizjQx9zjlFXzLgFEJYMtWvEqGUzc7bpveE1hMkOcEAdXrYBURCkCXYcmOscoaEdn
         cmJw==
X-Forwarded-Encrypted: i=1; AJvYcCU//PbIxHQ4Pl+BvtmDb4SwYH1S2U/Z0dwflsSEOS4Q5Sw3l81IcnuOHKlSXLoxj1HQEi4rkh2F8RzRBZBV9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWk493dekscRNr3/aRWQy1N/4z2JHTV9afFc5ApLAbbj0CYH0n
	lN+WKWAbT8VVEAVUjq5ZID2tmLXi3LkPxG6TLdHUWHG5vAwbajrLa7tUgJOUOkH1z7XMc8ofHHq
	TakqImGAFUSnYRzObI1VUgc//RvmbRBuAiJNN
X-Google-Smtp-Source: AGHT+IE6eZ6vMbHdaGPEnNj70kEPv6a2gjgjR2D+6CB2n0l4ygZ/aDv/gJaSaUaHq3xqXN2ItXKkaL5FM7pHHECf99U=
X-Received: by 2002:a05:6512:691:b0:53a:bb7:ed77 with SMTP id
 2adb3069b0e04-53a1545339amr791354e87.14.1729235557654; Fri, 18 Oct 2024
 00:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241017090503.1006068-1-wenst@chromium.org> <CAJZ5v0hZUzubeLt2OBcG=F5QKFh-0V8yqYRoQL0iHK+y+zeZFg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hZUzubeLt2OBcG=F5QKFh-0V8yqYRoQL0iHK+y+zeZFg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 18 Oct 2024 15:12:26 +0800
Message-ID: <CAGXv+5GToNr=6D_j3A-HzmCQJNx-fm+A=KgxhqhtSES1CRMvJQ@mail.gmail.com>
Subject: Re: [PATCH v3] thermal/of: support thermal zones w/o trips subnode
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
X-CRM114-CacheID: sfid-20241018_001240_391338_74ABE370 
X-CRM114-Status: GOOD (  27.58  )
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

On Thu, Oct 17, 2024 at 6:57=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Thu, Oct 17, 2024 at 11:05=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
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
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Stacked on top of Krzysztof's cleanup patches
> >   - thermal: of: Use scoped memory and OF handling to simplify thermal_=
of_trips_init() [1]
> > - Adjusted to account for eliminated error path
> >
> > [1] https://lore.kernel.org/all/20241010-b4-cleanup-h-of-node-put-therm=
al-v4-2-bfbe29ad81f4@linaro.org/
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
> >  drivers/thermal/thermal_of.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.=
c
> > index 93f7c6f8d06d..be1fa6478c21 100644
> > --- a/drivers/thermal/thermal_of.c
> > +++ b/drivers/thermal/thermal_of.c
> > @@ -99,14 +99,14 @@ static struct thermal_trip *thermal_of_trips_init(s=
truct device_node *np, int *n
> >
> >         struct device_node *trips __free(device_node) =3D of_get_child_=
by_name(np, "trips");
> >         if (!trips) {
> > -               pr_err("Failed to find 'trips' node\n");
> > -               return ERR_PTR(-EINVAL);
> > +               pr_debug("Failed to find 'trips' node\n");
> > +               return ERR_PTR(-ENXIO);
>
> Why not
>
> *ntrips =3D 0;
> return NULL;

That indeed seems cleaner.

> >         }
> >
> >         count =3D of_get_child_count(trips);
> >         if (!count) {
> > -               pr_err("No trip point defined\n");
> > -               return ERR_PTR(-EINVAL);
> > +               pr_debug("No trip point defined\n");
> > +               return ERR_PTR(-ENXIO);
>
> Is this based on the current mainline code?

This is based on Krzysztof's scoped memory patch:

  thermal: of: Use scoped memory and OF handling to simplify
thermal_of_trips_init()
  https://lore.kernel.org/all/20241010-b4-cleanup-h-of-node-put-thermal-v4-=
2-bfbe29ad81f4@linaro.org/

I should have made it more obvious in the footer.

> >         }
> >
> >         struct thermal_trip *tt __free(kfree) =3D kzalloc(sizeof(*tt) *=
 count, GFP_KERNEL);
> > @@ -386,9 +386,15 @@ static struct thermal_zone_device *thermal_of_zone=
_register(struct device_node *
> >
> >         trips =3D thermal_of_trips_init(np, &ntrips);
> >         if (IS_ERR(trips)) {
> > -               pr_err("Failed to find trip points for %pOFn id=3D%d\n"=
, sensor, id);
> > -               ret =3D PTR_ERR(trips);
> > -               goto out_of_node_put;
> > +               if (PTR_ERR(trips) !=3D -ENXIO) {
> > +                       pr_err("Failed to find trip points for %pOFn id=
=3D%d\n", sensor, id);
> > +                       ret =3D PTR_ERR(trips);
> > +                       goto out_of_node_put;
> > +               }
> > +
> > +               pr_warn("Failed to find trip points for %pOFn id=3D%d\n=
", sensor, id);
>
> Wouldn't pr_info() be sufficient for this?

Works for me. I should also reword this and the existing error message
to be less confusing.


Thanks
ChenYu


> > +               trips =3D NULL;
> > +               ntrips =3D 0;
> >         }
> >
> >         ret =3D thermal_of_monitor_init(np, &delay, &pdelay);
> > --

