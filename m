Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDF4D21272
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=865RVWbN8Omy8/n3vGbgx/VDPWx+vEdcaMs6klufNEk=; b=NbmEYscR+XojSMb1BqyxB94sbY
	AvJ//lYmpRt32wacYnKIAunFcfZ/PmDyiTIqRpIqYfDADuqLTgf9hXL0t4AUElELN2T7Y3oIfYL9+
	XTukqp0fs1z/+nG8/Xv6Nq3kMF2AD8AQQt0TBG0yHAxozDoVGfIdXN59D7yY2UKo9vya+RXUjN3ZG
	84H517869mmh9bPmCktRVqshVzwFDk2ng4ug0/BrCtxavibHksuYHoOkom67QncT6pkxejosgvw5M
	fr9QU6RzYJ8JdM4xi555nZAAUqvpxO+oQwro5mSrXjdYN+JK6fsQQbsjY/W7PgPZrePwyWjKgy17s
	xT10Vffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1OGX-0000000Ea3p-2CsK;
	Thu, 17 Oct 2024 11:02:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1OBh-0000000EYgk-0p20;
	Thu, 17 Oct 2024 10:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7535A4367B;
	Thu, 17 Oct 2024 10:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540DCC4CED0;
	Thu, 17 Oct 2024 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729162619;
	bh=D5RTI9FOOit5KbbEFT2DC25/vMJ92nKXQzGoJvbMPXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W496lQ2byJnSKa4PxIA6n48H3WC7Bs1q2K3W4oDOcLlweMFNQWgZ3djy/HUpd4RGG
	 A0T7QaN3+Ai6zhhKvCCCHB5m+3oObmvkLcajISB3+2RbgnJip2x37PFRlYcEINMLyt
	 2XAexB3kyQ4Re4LEFYqbRfiry8qzvDaA4swkMAyxARATSiwrsTvqCX5G1gTnt9b+Yd
	 EGElnt0+/PqR3WJYWqpNMzQka2aziGRs9yEhg/+Mm3GUyu1FJNHrkvgbn2fzGph1DC
	 x64HYV4eBCRcmFNn7w6jKe6Y5eyzasLk+s3FLjqe/cOJ1tgGU6tF+wQHfBvBVGatpL
	 mywAaKVtCPXTw==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-288661760d3so384408fac.3;
        Thu, 17 Oct 2024 03:56:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZDl4aheMJ9UlaREy0hWRHDr0+sbnXNld5vV0Sv4kpr1TRYuxpXDvxEYFg9JcVcdbDI+eHwXw9qf2URNEMlIEN@lists.infradead.org, AJvYcCWvxfLAdfhbr8R6rhcWlk1z87WzEviDAH8HmwF9Q3DAqSRQNEBpfB/kMlwSekukm4RbKy0EkThce+cgPpN2O9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9er1Y3qPSDgdmyJtTvaUrw9anBXzc3F4WtTuij71g7qvT9cXe
	hYcEuYr34LqIzWbKahHEMDhtyOc8m5cwUOM3F6xbA7VNVljtCsczyRk9ub8D6hKjSnvka1DPPiS
	uOqK6OKLJ6ms87SVw7medjEyztAw=
X-Google-Smtp-Source: AGHT+IFf3YEvrAc2/G0NQs4QVU7cxHfpnuZAN/b8kSqqUTXMoL2fKaVj+DCbNBkFcsDdYZgqgYOgXLv1o81cmRIrryA=
X-Received: by 2002:a05:6870:e0ca:b0:27c:475c:ab2c with SMTP id
 586e51a60fabf-288ee12a3e2mr6407221fac.43.1729162618602; Thu, 17 Oct 2024
 03:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20241017090503.1006068-1-wenst@chromium.org>
In-Reply-To: <20241017090503.1006068-1-wenst@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 17 Oct 2024 12:56:47 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hZUzubeLt2OBcG=F5QKFh-0V8yqYRoQL0iHK+y+zeZFg@mail.gmail.com>
Message-ID: <CAJZ5v0hZUzubeLt2OBcG=F5QKFh-0V8yqYRoQL0iHK+y+zeZFg@mail.gmail.com>
Subject: Re: [PATCH v3] thermal/of: support thermal zones w/o trips subnode
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20241017_035701_414281_107C26BA 
X-CRM114-Status: GOOD (  23.92  )
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

On Thu, Oct 17, 2024 at 11:05=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> From: Icenowy Zheng <uwu@icenowy.me>
>
> Although the current device tree binding of thermal zones require the
> trips subnode, the binding in kernel v5.15 does not require it, and many
> device trees shipped with the kernel, for example,
> allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, still
> comply to the old binding and contain no trips subnode.
>
> Allow the code to successfully register thermal zones w/o trips subnode
> for DT binding compatibility now.
>
> Furtherly, the inconsistency between DTs and bindings should be resolved
> by either adding empty trips subnode or dropping the trips subnode
> requirement.
>
> Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Stacked on top of Krzysztof's cleanup patches
>   - thermal: of: Use scoped memory and OF handling to simplify thermal_of=
_trips_init() [1]
> - Adjusted to account for eliminated error path
>
> [1] https://lore.kernel.org/all/20241010-b4-cleanup-h-of-node-put-thermal=
-v4-2-bfbe29ad81f4@linaro.org/
>
> Changes since v1:
> - set *ntrips at beginning of thermal_of_trips_init()
> - Keep goto out_of_node_put in of_get_child_count(trips) =3D=3D 0 branch
> - Check return value of thermal_of_trips_init(), if it is -ENXIO, print
>   warning and clear |trips| pointer
> - Drop |mask| change, as the variable was removed
>
> I kept Mark's reviewed-by since the changes are more stylish than
> functional.
> ---
>  drivers/thermal/thermal_of.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 93f7c6f8d06d..be1fa6478c21 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -99,14 +99,14 @@ static struct thermal_trip *thermal_of_trips_init(str=
uct device_node *np, int *n
>
>         struct device_node *trips __free(device_node) =3D of_get_child_by=
_name(np, "trips");
>         if (!trips) {
> -               pr_err("Failed to find 'trips' node\n");
> -               return ERR_PTR(-EINVAL);
> +               pr_debug("Failed to find 'trips' node\n");
> +               return ERR_PTR(-ENXIO);

Why not

*ntrips =3D 0;
return NULL;

>         }
>
>         count =3D of_get_child_count(trips);
>         if (!count) {
> -               pr_err("No trip point defined\n");
> -               return ERR_PTR(-EINVAL);
> +               pr_debug("No trip point defined\n");
> +               return ERR_PTR(-ENXIO);

Is this based on the current mainline code?

>         }
>
>         struct thermal_trip *tt __free(kfree) =3D kzalloc(sizeof(*tt) * c=
ount, GFP_KERNEL);
> @@ -386,9 +386,15 @@ static struct thermal_zone_device *thermal_of_zone_r=
egister(struct device_node *
>
>         trips =3D thermal_of_trips_init(np, &ntrips);
>         if (IS_ERR(trips)) {
> -               pr_err("Failed to find trip points for %pOFn id=3D%d\n", =
sensor, id);
> -               ret =3D PTR_ERR(trips);
> -               goto out_of_node_put;
> +               if (PTR_ERR(trips) !=3D -ENXIO) {
> +                       pr_err("Failed to find trip points for %pOFn id=
=3D%d\n", sensor, id);
> +                       ret =3D PTR_ERR(trips);
> +                       goto out_of_node_put;
> +               }
> +
> +               pr_warn("Failed to find trip points for %pOFn id=3D%d\n",=
 sensor, id);

Wouldn't pr_info() be sufficient for this?

> +               trips =3D NULL;
> +               ntrips =3D 0;
>         }
>
>         ret =3D thermal_of_monitor_init(np, &delay, &pdelay);
> --

