Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D819FC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:48:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABFBC2053B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KFIsysNl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJcAU9P+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABFBC2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gF10E0Yy5cKmhx8XeGp4yDsduVa0WFqvFJ0KRDoZN6U=; b=KFIsysNl/jiokEDPrIGFFOp7G
	nLNCKNJIATs2pwRVuZ6pJ5vMxGSqlu+HyLFgMnzyzb41Qvagf0vAALeyB9QgnfbUt8zF+RHTRoQLB
	byfkLe6c12rarkq8cveuoRmW1m16dsXN7C4GFT4azPW33Ddqnut4vSwiyIyXZGH8nlNG7qSV0U9Bz
	I/NVs8mZ9AQWqBExVD60EFTBJqN6ZCsZ4yJUc0ALGfpfMAnn5JVt1V/PWnD5+pMy9nLHwcl7Nvs6V
	6rcadVeysMML8fZaozm30MjnOHXY0Pimz9eyUrYfnF6huBtgKUapgG5acuYA8niyqWZKZ2vt2Zlrw
	UEVmAEzKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic2v1-0001jj-MF; Tue, 03 Dec 2019 07:48:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic2ti-0000a3-Px; Tue, 03 Dec 2019 07:47:04 +0000
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F4CE2053B;
 Tue,  3 Dec 2019 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575359222;
 bh=zBfUPG4hr6cz9CjSTGXeqEKcIeEi2W+pTBEFRrNagxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FJcAU9P+z4a0TjRbXzmJTn5pxxrG++bII3OcgV8W3lHBCpgWqkSBw6j/9MG/nKgUn
 CA+ACwvDPHjLylSA0jGJ+T6BB+MgOW1qltCFkpOqY85/AeM8kpbMy2a7KNdtprE8Yh
 gRZBIBlwAFpGvYXVoPw3Rq/30T5g2LIP5yFDY9Ag=
Date: Tue, 3 Dec 2019 08:46:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Message-ID: <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20191202193230.21310-8-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_234702_900066_5A411F74 
X-CRM114-Status: GOOD (  21.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-mediatek@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: multipart/mixed; boundary="===============8726903977711787778=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8726903977711787778==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mbec6vlpl4zotrv3"
Content-Disposition: inline


--mbec6vlpl4zotrv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Dec 02, 2019 at 08:32:11PM +0100, Sam Ravnborg wrote:
> There was no users - so remove it.
> The callback was implemented in two drivers - deleted.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 18 ------------------
>  drivers/gpu/drm/panel/panel-simple.c        | 18 ------------------
>  include/drm/drm_panel.h                     |  9 ---------
>  3 files changed, 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> index b878930b17e4..3bcba64235c4 100644
> --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> @@ -217,30 +217,12 @@ static int seiko_panel_get_modes(struct drm_panel *panel,
>  	return seiko_panel_get_fixed_modes(p, connector);
>  }
>
> -static int seiko_panel_get_timings(struct drm_panel *panel,
> -				    unsigned int num_timings,
> -				    struct display_timing *timings)
> -{
> -	struct seiko_panel *p = to_seiko_panel(panel);
> -	unsigned int i;
> -
> -	if (p->desc->num_timings < num_timings)
> -		num_timings = p->desc->num_timings;
> -
> -	if (timings)
> -		for (i = 0; i < num_timings; i++)
> -			timings[i] = p->desc->timings[i];
> -
> -	return p->desc->num_timings;
> -}
> -
>  static const struct drm_panel_funcs seiko_panel_funcs = {
>  	.disable = seiko_panel_disable,
>  	.unprepare = seiko_panel_unprepare,
>  	.prepare = seiko_panel_prepare,
>  	.enable = seiko_panel_enable,
>  	.get_modes = seiko_panel_get_modes,
> -	.get_timings = seiko_panel_get_timings,
>  };

If anything, I think we should grow the usage of timings and / or make
it usable by everyone.

Using only the mode as we do currently has a bunch of shortcomings as
almost no encoder will be able to provide the typical pixel clock, and
that situation leads to multiple things:

  - If someone working on one encoder wants to upstream a panel they
    have tested, chances are this will not be the typical pixel clock
    / timings being used but rather the one that will match what that
    SoC is capable of. Trouble comes when a second user comes in with
    a different encoder and different capabilities, and then we have a
    maintainance fight over which timing is the true timing (with a
    significant chance that none of them are).

  - If we can't match the pixel clock, we currently have no easy way
    to make the usual measures of reducing / growing the porches and
    blankings areas to match the pixel clock we can provide, since we
    don't have an easy way to get the tolerance on those timings for a
    given panel. There's some ad hoc solutions on some drivers (I
    think vc4 has that?) to ignore the panel and just play around with
    the timings, but I think this should be generalised.

Timings solves the first case since we have the operating range now
and not a single set of timings, and it solves the second since we can
use that range to take those measures instead of taking a shot in the
dark.

I appreciate that it's pretty far from where we are today, but
removing the get_timings means that all the timings already defined in
the panel drivers are becoming useless too, and that eventually it
will get removed.

Maxime

--mbec6vlpl4zotrv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXeYS8wAKCRDj7w1vZxhR
xeBxAP9ee3FFwY4sVlAfBJhuRT34erKIih4z1areuTzVSIN+dQD/fzdVxhMZTPAY
gvh8rpUVFlo152hrZ+11FZmcFestiwc=
=ElRy
-----END PGP SIGNATURE-----

--mbec6vlpl4zotrv3--


--===============8726903977711787778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8726903977711787778==--

