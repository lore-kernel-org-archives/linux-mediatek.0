Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FA7C63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:04:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA0920B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o1yG4BMT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCA0920B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8vEfGaY1NSikFi7IzqJ54O3FukVFK/8tIeCECbDg42Y=; b=o1yG4BMT3Au3e2kBNn70Tj19s
	IywsgVRL7AriVDfn3EFeYIxUZyrRjc6Zy1uTRTAoBTV6ui5QDE6EshqhWhHhjJ3GpQeU+pSShLoU6
	Cp3C3Y8Zt5a3S2HOSMzu3sVCSFgK0McSr4CZv6Aj9g2vmaYUh2wIazxp1y/vcmWiK12PFslT7KAGH
	hmpUaFpS0aaRH8USS/pKUulnd9VHbA7QBNISl0PPJNZ5aWxCBsFItWUd4lVTK1hzpc45+G6P3oGqu
	NVbF4ZigRRwv3SpMgDnMTWoQ2sjgIdD9WhMHrwLpriYpZ/JWs4hxJSbi8Qj3j0pI4+QU73numyfaw
	bNtJntv0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdT86-0002ia-Fp; Fri, 13 Nov 2020 07:04:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdT7v-0002bg-Eh
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 07:04:09 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kdT7e-0002r8-3x; Fri, 13 Nov 2020 08:03:50 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kdT7Z-0004f0-FQ; Fri, 13 Nov 2020 08:03:45 +0100
Date: Fri, 13 Nov 2020 08:03:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: About devm_platform_ioremap_resource [Was: Re: [PATCH 01/32] pwm:
 sun4i: convert to devm_platform_ioremap_resource]
Message-ID: <20201113070343.lhcsbyvi5baxn3lq@pengutronix.de>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
 <20201112161346.gp5nenuagx5wmwl2@pengutronix.de>
 <20201112190649.GA908613@ulmo>
 <20201112211429.kfyqzkmmchjo6pll@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20201112211429.kfyqzkmmchjo6pll@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_020407_696108_81D6060C 
X-CRM114-Status: GOOD (  18.74  )
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
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, festevam@gmail.com, f.fainelli@gmail.com,
 shc_work@mail.ru, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 khilman@baylibre.com, wens@csie.org, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 slemieux.tyco@gmail.com, linux-pwm@vger.kernel.org, rjui@broadcom.com,
 s.hauer@pengutronix.de, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nicolas.ferre@microchip.com,
 palmer@dabbelt.com, kernel@pengutronix.de, shawnguo@kernel.org,
 claudiu.beznea@microchip.com, nsaenzjulienne@suse.de
Content-Type: multipart/mixed; boundary="===============5496615259728014817=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5496615259728014817==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bfm7upvbg2x7q3rm"
Content-Disposition: inline


--bfm7upvbg2x7q3rm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Added lkml and the people involved in commit 7945f929f1a7
("drivers: provide devm_platform_ioremap_resource()") to Cc:. For the
new readers: This is about patches making use of
devm_platform_ioremap_resource() instead of open coding it. Full context
at https://lore.kernel.org/r/20201112190649.GA908613@ulmo]

On Thu, Nov 12, 2020 at 10:14:29PM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Nov 12, 2020 at 08:06:49PM +0100, Thierry Reding wrote:
> > I also think that it's overly narrow is scope, so you can't actually
> > "blindly" use this helper and I've seen quite a few cases where this was
> > unknowingly used for cases where it shouldn't have been used and then
> > broke things (because some drivers must not do the request_mem_region()
> > for example).
>=20
> You have a link to such an accident?

I got a hint in private here: https://lore.kernel.org/r/1555670144-24220-1-=
git-send-email-aisheng.dong@nxp.com

devm_platform_ioremap_resource() is platform_get_resource() +
devm_ioremap_resource() and here it was used to replace
platform_get_resource() + devm_ioremap().

IMHO the unlucky thing in this situation is that devm_ioremap_resource()
and devm_ioremap() are different by more than just how they get the area
to remap. (i.e. devm_ioremap_resource() also does
devm_request_mem_region().)

So the problem is not the added wrapper, but unclear semantics in the
functions it uses. In my eyes devm_ioremap() and
devm_platform_ioremap_resource() should better be named
devm_request_ioremap() and devm_platform_request_ioremap_resource()
respectively. Is it worth to rename these for clearity?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bfm7upvbg2x7q3rm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl+uL8wACgkQwfwUeK3K
7AmhFQf/UMY3Z/O4ajFXsCh5aeqAW1EKy0wv+YtVLmLASYlkvBQ5OpoaFH6U7oZY
a1BVjZ2I3q3pi1zMs+2dPAkylNi0VEIERvwncqHOfYN4FjdNsI85rKbxu4DNsWHJ
wlaQxLwmUmDXDESpJ4RN8JqF/V/nPZfj/4V52ANK31PZ+i4fYnIlW6TU0cJwoJ9s
aGSM2QwTb27uaRg5hqZqfOyIkt3wwkDJIF65H/vi64r0Gtm3c+0iKbEmlXr2XZCh
APhFgQQDGFOMXdSBZeFxTtuLCzuG/RA3Fxb+7okleZUL6GrSwq7xWHJGorO136kq
mo88jw2ceYf/qJA9E4atasOfbQUtlg==
=gJ1m
-----END PGP SIGNATURE-----

--bfm7upvbg2x7q3rm--


--===============5496615259728014817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5496615259728014817==--

