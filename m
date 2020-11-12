Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF539C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 16:14:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 719C02085B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 16:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rz+aEjA9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 719C02085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8wSN8jCBx7LEXNNuLu34egkgOTmWdIe8BguCHe/Vx5Q=; b=Rz+aEjA9AlCGKgkFJmUtxy+DY
	6N+RVu1LQCP8bo9mnKm7A3Im18N8rkP6JD32NCfn2/LsbESL1fFu/fmneVYUX2FkI7jgyIPC6f6ol
	nozspchAVEpAPFUXzMwaT9G1Xel7B4rROH579dd2uFByCARVI9zqBrISvd+d7cOmxRy353u/6S1ZA
	xjnJF9/uYVchFjZI/6EWD/WqdueyvJYTXT9j1fAEhM1tJ4961VyfFknIyjTJS4E5qI624gPrnPKR6
	kPg6R5ZrX3hoJ3IP4m9eKSNRziofb5nnhpzr5t6PXAfVhL4HG9BSsZHRiOZPfLIXQGBQDeuVudYfs
	w2pOLI+fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdFEy-0003CP-NO; Thu, 12 Nov 2020 16:14:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdFEv-0003Ai-Ks
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 16:14:26 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kdFEO-0004TX-DA; Thu, 12 Nov 2020 17:13:52 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kdFEK-0003CG-Jf; Thu, 12 Nov 2020 17:13:48 +0100
Date: Thu, 12 Nov 2020 17:13:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <tiny.windzz@gmail.com>, thierry.reding@gmail.com
Subject: Re: [PATCH 01/32] pwm: sun4i: convert to
 devm_platform_ioremap_resource
Message-ID: <20201112161346.gp5nenuagx5wmwl2@pengutronix.de>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_111425_915547_0D7277F2 
X-CRM114-Status: GOOD (  19.96  )
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
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, linux-riscv@lists.infradead.org, festevam@gmail.com,
 f.fainelli@gmail.com, shc_work@mail.ru, khilman@baylibre.com, wens@csie.org,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 ludovic.desroches@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 linux-imx@nxp.com, slemieux.tyco@gmail.com, linux-pwm@vger.kernel.org,
 rjui@broadcom.com, s.hauer@pengutronix.de, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 nicolas.ferre@microchip.com, palmer@dabbelt.com, kernel@pengutronix.de,
 shawnguo@kernel.org, claudiu.beznea@microchip.com, nsaenzjulienne@suse.de
Content-Type: multipart/mixed; boundary="===============3373810225048118275=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3373810225048118275==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rowms2wq4q6swhwc"
Content-Disposition: inline


--rowms2wq4q6swhwc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Sun, Dec 29, 2019 at 08:05:39AM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/pwm/pwm-sun4i.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index 581d23287333..f2afd312f77c 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -344,7 +344,6 @@ MODULE_DEVICE_TABLE(of, sun4i_pwm_dt_ids);
>  static int sun4i_pwm_probe(struct platform_device *pdev)
>  {
>  	struct sun4i_pwm_chip *pwm;
> -	struct resource *res;
>  	int ret;
> =20
>  	pwm =3D devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
> @@ -355,8 +354,7 @@ static int sun4i_pwm_probe(struct platform_device *pd=
ev)
>  	if (!pwm->data)
>  		return -ENODEV;
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	pwm->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	pwm->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(pwm->base))
>  		return PTR_ERR(pwm->base);

Can you please comment why you don't apply this series?

My point of view is:

devm_platform_ioremap_resource is the designated wrapper to replace
platform_get_resource() and devm_ioremap_resource(). So I don't see a
good reason to continue open coding it.

The patch series doesn't apply to 5.10-rc1 as is. (pwm-puv3 was removed
and a simple conflict in the pwm-rockchip driver.) The overall diffstat
(of the fixed series applied on top of 5.10-rc1) is

	31 files changed, 32 insertions(+), 96 deletions(-)

and it converts all of drivers/pwm but a single instance of
platform_get_resource() + devm_ioremap_resource() (for pwm-lpss where
platform_get_resource and devm_ioremap_resource are in different
functions (different files even)) which isn't trivial to fix.

So in my eyes applying this series is the right thing to do.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rowms2wq4q6swhwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl+tXzcACgkQwfwUeK3K
7AnalAf/SZzHfPm53CAOPulFIMZojirosLfMqF/CurOTWDa4pXeZLIfqJ3XR0lAd
1A30iOU6Z6gsaXDu200KL3PWJ4aUlySBGynRmyn7mwEiHcoyNcuatCW2hIxQPptf
dIDBPh0Sz3nVjS3asUQnerG/hBoF4uOOMdH0zLLOgLIdX5sIYvN8A4UHIlcTrCXz
Am34c7Q2xtG+FheEtp4ytEFQ3TC4tZnOuam6jTUwRFRvHmXmhXQvWx6aRE/m+rz+
Sz9XQNgfwmLfEjdUiHzBzEXuhwC2bhndg5imcT3t6djVcxLqqqAL6zsd7n6myzan
2ry03AJ4yF68gU5nJbV8yuc9VDeqgg==
=2Q4E
-----END PGP SIGNATURE-----

--rowms2wq4q6swhwc--


--===============3373810225048118275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3373810225048118275==--

