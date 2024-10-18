Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623D0D374BF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 16:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5e/JvhJqKlCVYQa+Omsxw8MYAu5fhQVMZnj7/8Zte/A=; b=W/mQKhmfP+Y+fQylvWGmEoo/+g
	T89GgBMhKX1F6AmOXHKbnYiBjxnn2OxuBoCcdoBlUmUORYn3+FLIi1p/nJVWK2zvL3egGnSy37vHR
	dLINKhnPeKqNkhfHqgdLalpBLvWmd2X3dVaJaql89zKYuo//G7bmlXmOIc5NAH5VplonXKiCpFCN4
	DBmJZKA51q/jhDvCkzQuzD8tW7NBl7sLn2rrFFunio0ORrI4Y0d0Pn0tfwAdEESSB4bZiwFb247gf
	9kF6BxOR1udQyx5NBreVPVrcc23TSeYVOXPU4OaQB75GgHhZPf+ruGQTu9eO5F43VkK/QZhZ8ylPf
	eomhhZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1pzR-00000001NOL-1Mr0;
	Fri, 18 Oct 2024 16:38:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1pxx-00000001NDA-2nBd;
	Fri, 18 Oct 2024 16:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0DF7EA44753;
	Fri, 18 Oct 2024 16:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60A1C4CED5;
	Fri, 18 Oct 2024 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729269398;
	bh=jq7Y7/frNkQWdKn6/pE62Zi+RO0e0r/Z5zuFlEysqj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I54s75ab423OKHdT4qZEmxInLP1Stn4BTpeGesyteaCQGb+0Mrh2gTD9v6Pt4ola/
	 1jYN1BWEIkKK5Mpz3DTgh110hZhUOV8+pX3dfWMnvDIDWi9t5+7apjfj0RhsyDRfou
	 6yHdojYXAfQEgpxrK2pJGCEfZxNjdj/OSAgAPPA4UesViFH/E/vrWW3ZDudcqn1jH/
	 C70gufEGp4Z42suCNypxF3BSecmzI1l6KTY55ZJh/ZYzWOR2754uRAy6waivDq1dgG
	 z6WF0yV730QReLMl4yiXY4PFjM+DkwilEFpmXxl8Ehdge1ZeXO5gAL1nmuZe08BmuA
	 KWy6dRoIb4Pow==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2884e7fadb8so1190455fac.2;
        Fri, 18 Oct 2024 09:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8LdGZrfOQzrUfQ0XVNzAdqApm1AwcYYnrAdezOmOrdInAoRuekVi3WC0/t98nZ5UX9R319v2pUT2O0nN1gxE=@lists.infradead.org, AJvYcCVISS3BFfXb7BzoX3F/mapD0+jeKXD8/MVjpeBB1F702fdDwNlEp7TMKQuveGNRpjvspckkENAtfeBI1bSG1wwx@lists.infradead.org
X-Gm-Message-State: AOJu0YyFmS0bOeOEYPZ45W5gITwdXrT0WlzWVll6aVSvVRhRlTYksGbo
	8Wf442ScLyawMild3RagEvqTRlk6atU2u0hV1g2U4/iDKYWhNmQhJhal1UtDEpW+slGwzEGIaK3
	gZNbFpPcr1ZjqJOpWdfOszI9O++E=
X-Google-Smtp-Source: AGHT+IF/9GJqtgMfEJw36ojuns+DX+VC12ggt1IRZE7FcP/Z+sN2K2q6OqZVUcCj0lDRDIR1nrTiGTo2/XYmlcO1fzI=
X-Received: by 2002:a05:6870:c0ce:b0:260:e3fa:ab8d with SMTP id
 586e51a60fabf-2892c562e82mr2714739fac.37.1729269398081; Fri, 18 Oct 2024
 09:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241018073139.1268995-1-wenst@chromium.org>
In-Reply-To: <20241018073139.1268995-1-wenst@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 18 Oct 2024 18:36:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g5B_h0BudqnHKRD0GL5-xpiwp21=Hx+dH-FaRXD6yu8g@mail.gmail.com>
Message-ID: <CAJZ5v0g5B_h0BudqnHKRD0GL5-xpiwp21=Hx+dH-FaRXD6yu8g@mail.gmail.com>
Subject: Re: [PATCH v4] thermal/of: support thermal zones w/o trips subnode
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Icenowy Zheng <uwu@icenowy.me>, Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_093641_861704_5C53FF6E 
X-CRM114-Status: GOOD (  26.54  )
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

On Fri, Oct 18, 2024 at 9:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
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
> [wenst@chromium.org: Reworked logic and kernel log messages]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
> This patch is based on Krzysztof's cleanup patches
>   - thermal: of: Use scoped memory and OF handling to simplify thermal_of=
_trips_init() [1]
>
> Changes since v3:
>   - Set *ntrips =3D 0 and return NULL from thermal_of_trips_init() if
>     no trip points are found in the device tree (Rafael)
>   - Dropped log level of "no trip points found" message to INFO
>   - Reworded new "failed to find trip points" message to "no trip points
>     found"
>   - Reworded existing "failed to find trip points" message to "failed to
>     parse trip points"
>
> I dropped Mark's reviewed-by because of the new changes.
>
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
> ---
>  drivers/thermal/thermal_of.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 93f7c6f8d06d..abafce22c91f 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -99,14 +99,16 @@ static struct thermal_trip *thermal_of_trips_init(str=
uct device_node *np, int *n
>
>         struct device_node *trips __free(device_node) =3D of_get_child_by=
_name(np, "trips");
>         if (!trips) {
> -               pr_err("Failed to find 'trips' node\n");
> -               return ERR_PTR(-EINVAL);
> +               pr_debug("Failed to find 'trips' node\n");
> +               *ntrips =3D 0;
> +               return NULL;
>         }
>
>         count =3D of_get_child_count(trips);
>         if (!count) {
> -               pr_err("No trip point defined\n");
> -               return ERR_PTR(-EINVAL);
> +               pr_debug("No trip point defined\n");
> +               *ntrips =3D 0;
> +               return NULL;
>         }
>
>         struct thermal_trip *tt __free(kfree) =3D kzalloc(sizeof(*tt) * c=
ount, GFP_KERNEL);
> @@ -386,11 +388,14 @@ static struct thermal_zone_device *thermal_of_zone_=
register(struct device_node *
>
>         trips =3D thermal_of_trips_init(np, &ntrips);
>         if (IS_ERR(trips)) {
> -               pr_err("Failed to find trip points for %pOFn id=3D%d\n", =
sensor, id);
> +               pr_err("Failed to parse trip points for %pOFn id=3D%d\n",=
 sensor, id);
>                 ret =3D PTR_ERR(trips);
>                 goto out_of_node_put;
>         }
>
> +       if (!trips)
> +               pr_info("No trip points found for %pOFn id=3D%d\n", senso=
r, id);
> +
>         ret =3D thermal_of_monitor_init(np, &delay, &pdelay);
>         if (ret) {
>                 pr_err("Failed to initialize monitoring delays from %pOFn=
\n", np);
> --

