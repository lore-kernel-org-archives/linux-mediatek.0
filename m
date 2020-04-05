Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A970FC2BA16
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 03:35:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AAF5206D4
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 03:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C/cWHTBI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AAF5206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1OwOCasjQaRsYqPYtaI/TzgV61x5HrkYC1yFCP5Juow=; b=C/cWHTBIkFaeVWSROD5xGE/dN
	64OvqoU+XI6VhqaRvFYBfD0hdQw0wg1pN8eR6JM5Fp8lDmVOvzMeWpzKK3sa3aDU+oM/qxdK83Jan
	c1TNdrdSC3ITUdOES/idgM3Inv7v5vP/UAnVydDEMY/m4svT9eCWtkjwE8tzKXqPzHv3FTq0B1BLQ
	K7JHYAX458oXOdm0CkknlFwSdIEbkI65e3cqZ0oxeyNZO35AHpv6Zs8yRTQNKw6nuePW0L16EwUjr
	4GfZKPiQLPpPb1jcDcjIgqp4e/4yZM4uqHYifIu0tQ6E0VtMa6T38gL9BZ8+OGD4pLUgRR+g/iNTl
	e+f4KKJTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKw4a-0000Bl-6x; Sun, 05 Apr 2020 03:35:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKw4S-0008VX-PF; Sun, 05 Apr 2020 03:35:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 70591298001
Received: by earth.universe (Postfix, from userid 1000)
 id 8E2E43C082A; Sun,  5 Apr 2020 05:35:36 +0200 (CEST)
Date: Sun, 5 Apr 2020 05:35:36 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v8 10/10] power: supply: Fix Kconfig help text indentiation
Message-ID: <20200405033536.vp3itb3gntggxmj7@earth.universe>
References: <cover.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
 <43077ce36099b3c381817b63c20ba29eef912456.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
In-Reply-To: <43077ce36099b3c381817b63c20ba29eef912456.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_203541_073438_A1EDAF08 
X-CRM114-Status: GOOD (  18.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 "Angelo G. Del Regno" <kholk11@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 Axel Lin <axel.lin@ingics.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Markus Reichl <m.reichl@fivetechno.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, markus.laine@fi.rohmeurope.com,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, mazziesaccount@gmail.com,
 linux-arm-msm@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Baolin Wang <baolin.wang@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 patches@opensource.cirrus.com
Content-Type: multipart/mixed; boundary="===============2939964859142206124=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2939964859142206124==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ntcdkxa4od2c6fv"
Content-Disposition: inline


--6ntcdkxa4od2c6fv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 03, 2020 at 11:48:28AM +0300, Matti Vaittinen wrote:
> Indent the help text as explained in
> Documentation/process/coding-style.rst
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>=20
> No changes since v7
>=20
> I just learned the help text in Kconfigs should be indented by two
> spaces. I fixed this for BD99954 as suggested by Randy and decided
> that I could do this for few other entries as well while I was at
> it anyways.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>=20
>  drivers/power/supply/Kconfig | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index af96d7fa56b1..f606ba069e4e 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -415,7 +415,7 @@ config CHARGER_PCF50633
>  	tristate "NXP PCF50633 MBC"
>  	depends on MFD_PCF50633
>  	help
> -	 Say Y to include support for NXP PCF50633 Main Battery Charger.
> +	  Say Y to include support for NXP PCF50633 Main Battery Charger.
> =20
>  config BATTERY_RX51
>  	tristate "Nokia RX-51 (N900) battery driver"
> @@ -609,15 +609,15 @@ config CHARGER_TPS65090
>  	tristate "TPS65090 battery charger driver"
>  	depends on MFD_TPS65090
>  	help
> -	 Say Y here to enable support for battery charging with TPS65090
> -	 PMIC chips.
> +	  Say Y here to enable support for battery charging with TPS65090
> +	  PMIC chips.
> =20
>  config CHARGER_TPS65217
>  	tristate "TPS65217 battery charger driver"
>  	depends on MFD_TPS65217
>  	help
> -	 Say Y here to enable support for battery charging with TPS65217
> -	 PMIC chips.
> +	  Say Y here to enable support for battery charging with TPS65217
> +	  PMIC chips.
> =20
>  config BATTERY_GAUGE_LTC2941
>  	tristate "LTC2941/LTC2943 Battery Gauge Driver"
> @@ -671,16 +671,16 @@ config CHARGER_SC2731
>  	tristate "Spreadtrum SC2731 charger driver"
>  	depends on MFD_SC27XX_PMIC || COMPILE_TEST
>  	help
> -	 Say Y here to enable support for battery charging with SC2731
> -	 PMIC chips.
> +	  Say Y here to enable support for battery charging with SC2731
> +	  PMIC chips.
> =20
>  config FUEL_GAUGE_SC27XX
>  	tristate "Spreadtrum SC27XX fuel gauge driver"
>  	depends on MFD_SC27XX_PMIC || COMPILE_TEST
>  	depends on IIO
>  	help
> -	 Say Y here to enable support for fuel gauge with SC27XX
> -	 PMIC chips.
> +	  Say Y here to enable support for fuel gauge with SC27XX
> +	  PMIC chips.
> =20
>  config CHARGER_UCS1002
>  	tristate "Microchip UCS1002 USB Port Power Controller"
> @@ -698,9 +698,9 @@ config CHARGER_BD70528
>  	select LINEAR_RANGES
>  	default n
>  	help
> -	 Say Y here to enable support for getting battery status
> -	 information and altering charger configurations from charger
> -	 block of the ROHM BD70528 Power Management IC.
> +	  Say Y here to enable support for getting battery status
> +	  information and altering charger configurations from charger
> +	  block of the ROHM BD70528 Power Management IC.
> =20
>  config CHARGER_BD99954
>  	tristate "ROHM bd99954 charger driver"
> --=20
> 2.21.0
>=20
>=20
> --=20
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>=20
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =3D]=20

--6ntcdkxa4od2c6fv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl6JUggACgkQ2O7X88g7
+prtNg//RiaEn7gAIEag4L7geaYConQS/mTuXF8Y3xTkSzJNmwU0UwUL3j0O7QMJ
r8QXZaWFdRFe6b80bpnSfB2IUVUEL+lu+DRhjkinwl8gVL/Wd/uiHNm4p5jRb7VD
DwaxeqISchaSs4oRrrZDSdYe1le6m0C3yRQy5zxbS1nY7EVeFE7VvqQMCv1Wdd8v
UJOe6GIqpBRcnZwn8Zch5kl2e0ett+k2xqxCtVAkLQlO/5r1p5d984uB7oA3zM6U
P61IMBKrkIk0f64Xy1hf5VK0sBRK2wrra+ztqt8ttkkOeXhjykqcCz4iY8P9qSdM
m/9Q+l5wyXpNj0qLEDcOfRH0JmG4EVmdVuDA5YlHTlnyU4/1uSkJvY8LBJecEsVq
hdeCek6EdtAtzQ35wTXpa26FNvKR5b8WCVr4VbsVxXmXbN+Rmk5ryUE2/3RoK59E
V4JNFHAnZS1Flga0OhZtdB6M+2d8pOgQ6RYdng7pe1+7LevBgz+4Jw7Un/2w/vrS
KNcX2x892lnBusNiuURG9+ryZvVBf8Cv7waxv1hjYb8z4EBBNwkTKTrzKIlOEtL0
xCusRadLdVhkJvKYWRL1T5lspuaj/RLcirSwKojGw+sNsb3qXMZxFISysUGXYwWa
yXnKpBMqOtPdzLs36i0O2oLvl25Xy/2nVIQVFfDu6t0ZuEsqThc=
=TDgw
-----END PGP SIGNATURE-----

--6ntcdkxa4od2c6fv--


--===============2939964859142206124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2939964859142206124==--

