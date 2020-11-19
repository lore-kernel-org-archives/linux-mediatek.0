Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74142C63697
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 17:08:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB51A2468B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 17:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q3z0U6yd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB51A2468B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZdkYjndYqR7E3H+t0t3SY9ZUnBivTZeLLJOEEy6fWYY=; b=q3z0U6yd2adMg9F9DPXEYCyGN
	KVFDAElnq+VW5Zq1krkuwOOsS48ACKCClwUAETHEyav3XjIZRAbKlXNjW/iONrh8m/JWJXChq4ADB
	34NxoDzOxFLb8fPWzGD2S7uG8bcCnyx+B9EX5lkxjDZw2YEab3JOHQNrvA6qBxewC1rGpJPnZ/wLs
	XSP1CaE6aMfGkSkRGz/CSQfLW/axXQU+mTFzvlY5J5TbICPnZ51F6Jpfkv5i3iNXy/y4URTsVacH7
	EZ9f7jWTDY82avWlxlHWGjCLeY3XYSitTutAa/Q+4fBRwMBzpJZJcSMmoe53CwheKiWuzrF0/mlg4
	yd9yFhMgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnQ7-0000mx-HS; Thu, 19 Nov 2020 17:08:31 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfnQ2-0000jy-HE
 for linux-mediatek@lists.infradead.org; Thu, 19 Nov 2020 17:08:28 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kfnPk-0003Hr-8W; Thu, 19 Nov 2020 18:08:08 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kfnPg-0005S4-75; Thu, 19 Nov 2020 18:08:04 +0100
Date: Thu, 19 Nov 2020 18:08:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: About devm_platform_ioremap_resource [Was: Re: [PATCH 01/32]
 pwm: sun4i: convert to devm_platform_ioremap_resource]
Message-ID: <20201119170802.bup5foltlhrg5576@pengutronix.de>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
 <20201112161346.gp5nenuagx5wmwl2@pengutronix.de>
 <20201112190649.GA908613@ulmo>
 <20201112211429.kfyqzkmmchjo6pll@pengutronix.de>
 <20201113070343.lhcsbyvi5baxn3lq@pengutronix.de>
 <20201113161153.GB1408970@ulmo>
MIME-Version: 1.0
In-Reply-To: <20201113161153.GB1408970@ulmo>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_120826_685554_A636C387 
X-CRM114-Status: GOOD (  23.47  )
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
Cc: alexandre.belloni@bootlin.com, heiko@sntech.de,
 Yangtao Li <tiny.windzz@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 nicolas.ferre@microchip.com, matthias.bgg@gmail.com,
 linux-riscv@lists.infradead.org, festevam@gmail.com, f.fainelli@gmail.com,
 shc_work@mail.ru, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 khilman@baylibre.com, ludovic.desroches@microchip.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 slemieux.tyco@gmail.com, linux-pwm@vger.kernel.org, rjui@broadcom.com,
 s.hauer@pengutronix.de, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, kernel@pengutronix.de, shawnguo@kernel.org,
 claudiu.beznea@microchip.com, nsaenzjulienne@suse.de
Content-Type: multipart/mixed; boundary="===============8532472955395819771=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8532472955395819771==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mpmylxzqzkfzclys"
Content-Disposition: inline


--mpmylxzqzkfzclys
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Nov 13, 2020 at 05:11:53PM +0100, Thierry Reding wrote:
> I think function names are always a compromise between giving you the
> gist of what the implementation does and being short enough so it
> doesn't become difficult to read or use.

Right. In my eyes if you have=20

 - devm_platform_ioremap_resource
 - devm_platform_get_and_ioremap_resource
 - devm_ioremap_resource
 - devm_ioremap

(to list just a few) with the current semantics, the compromise is badly
shifted into the "short name" direction however; and that was the
motivation for this patch set. In my eyes it must be more obvious which
of these functions include devm_request_mem_region() and which don't.

And note, my patch series doesn't introduce new helpers, just renames
them to have a better name (and adds compat glue for the old names).

> One of the reasons why I dislike the addition of helpers for every
> common special case (like devm_platform_ioremap_resource()) is because
> it doesn't (always) actually make things easier for developers and/or
> maintainers. Replacing three lines of code with one is a minor
> improvement, even though there may be many callsites and therefore in
> the sum this being a fairly sizeable reduction. The flip side is that
> now we've got an extra symbol with an unwieldy name that people need
> to become familiar with, and then, like the link above shows, it doesn't
> work in all cases, so you either need to fall back to the open-coded
> version or you keep adding helpers until you've covered all cases. And
> then we end up with a bunch of helpers that you actually have to go and
> read the documentation for in order to find out which one exactly fits
> your use-case.

This is indeed a relevant point. An alternative is to make the helper
more flexible. This complicates the API, too, however, so this isn't
always gold, either.
=20
> Without the helpers it's pretty simple to write, even if a little
> repetitive:
>=20
>   1) get the resource you want to map
>   2) request the resource
>   3) map the resource
>=20
> 2) & 3) are very commonly done together, so it makes sense to have a
> generic helper for them. If you look at the implementation, the
> devm_ioremap_request() implementation does quite a bit of things in
> addition to just requesting and remapping, and that's the reason why
> that helper makes sense.
>=20
> For me personally, devm_platform_ioremap_resource() is just not adding
> enough value to justify its existence. And then we get all these other
> variants that operate on the resource name (_byname) and those which
> remap write-combined (_wc). But don't we also need a _byname_wc()
> variant for the combination? Where does it stop?

I'm on your side for the _wc stuff, looking at next-20201119:

 - devm_ioremap_resource_wc has a single user:
   devm_platform_ioremap_resource_wc
 - devm_platform_ioremap_resource_wc has a single user:
   drivers/misc/sram.c

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mpmylxzqzkfzclys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl+2pm8ACgkQwfwUeK3K
7Anx6gf/afcuCS6ctL6YtwVi/Z9EkHHcNA1X6g1BHEYgptvB5jElIwju5FwCP1Mr
dFL0pNAhpH9f0DppbH2oLUVOCNyD1ZfgQGWqGvcrFY+T/cx7wNOTgF7Meq/DMeH4
Btkjn4WlVzI342o84E+DOy1HLsqFio7btNOVl/UtRWOJXeiebIbTd8ees4f4Y89q
W9/WHyX7vHoJ3Xr+o2U+sdGrP8yZv+rZ+5LqrHCFhbPQIRXcdf37e2BINTBY5R/d
ceVKdUCv+pHJAc096R4R4t2vc42sG7OfOJzSDndG4B/duKHoL+v79d8ocfUpaO58
3CubdcFfVk/uoUX+9qYPjwKoWefCBw==
=OAoV
-----END PGP SIGNATURE-----

--mpmylxzqzkfzclys--


--===============8532472955395819771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8532472955395819771==--

