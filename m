Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jO9abpAxeJqTmnkUJNy/Hid+Omp1O7a9Q0EVhTsrXYQ=; b=m6ESEI1LRc0o8CnMZvGhtS37N8
	5xYxP6UgfaceJvO5mBlV6kW+QxkmVmL5Gih5KMw6xcRDb2eu1IXrNiAmb1GhlUK8MJM8izsbnSmpf
	q1lzj9iPQlMHMwzJ/J6LflaN+RyJU6Yp+iZFfNwEPxAf0+ByOHSdtiOMxHe2oXLc9WMwpyIdcM7am
	M22ZtCfaD1YPSDOLtlunm76R920+DeBj9hgOJBJLs1xI8EgOLEAufssDbAVZaQMLYLmEI/Z8CmHog
	UZChMbG50TQj0Xsgt0MQt9ZPDt/9mtmLFxRykJFYq3576+UnGAQlrzo8GDfMF5kguuvcaDCfNlVm9
	40FRv1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7AzR-003Nuq-RC; Fri, 01 Jul 2022 07:22:57 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7AzI-003Nrn-0i
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 07:22:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7Az7-0004jb-J9; Fri, 01 Jul 2022 09:22:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7Az3-003k2H-1v; Fri, 01 Jul 2022 09:22:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7Az5-002H6Z-MU; Fri, 01 Jul 2022 09:22:35 +0200
Date: Fri, 1 Jul 2022 09:22:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabien Parent <fparent@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek: add pwm binding for
 MT8195
Message-ID: <20220701072235.4wqfj2qppmbkr26l@pengutronix.de>
References: <20220531114544.144785-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d7dh7oelr2g3r7ba"
Content-Disposition: inline
In-Reply-To: <20220531114544.144785-1-fparent@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_002248_083398_BACB8691 
X-CRM114-Status: GOOD (  18.38  )
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


--d7dh7oelr2g3r7ba
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 01:45:43PM +0200, Fabien Parent wrote:
> MT8195's PWM IP is compatible with the MT8183 PWM IP.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Doc=
umentation/devicetree/bindings/pwm/pwm-mediatek.txt
> index 25ed214473d7..7b53355470d6 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> @@ -8,6 +8,7 @@ Required properties:
>     - "mediatek,mt7628-pwm": found on mt7628 SoC.
>     - "mediatek,mt7629-pwm": found on mt7629 SoC.
>     - "mediatek,mt8183-pwm": found on mt8183 SoC.
> +   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
>     - "mediatek,mt8516-pwm": found on mt8516 SoC.
>   - reg: physical base address and length of the controller's registers.
>   - #pwm-cells: must be 2. See pwm.yaml in this directory for a descripti=
on of

Looks good to me:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--d7dh7oelr2g3r7ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK+oLgACgkQwfwUeK3K
7AkQOAf+KLZFeD8NGYTvgY5FAw/+xzbfBXG5d/IunUjr4TZeAWP259lNTBY1V0wm
wIMn/wxDSYV80tBEwuxBpv1j0FuoS+c4J8dIW210iOYUj9aNf5vEUehiUSrjoAiV
LJa3WVaNw3c4lV3bAJ9YGq10DW7GKhlfWfg/EO2hWSKe+JC1xV+GFAX3/uif1Ol4
knS+JAdiTlCHC68BwGVA7OWtD5idBC3nGVMFrHih6k5sn60yG+EIYlDQ3fvaPrJW
AcSQl4/OmIjyogY4njYx8mYWF72fjLDpk79KPBxyOV9yqWcis24Ermod0iFgp6md
RB5wQxuo1lT22FNXRJ/ytmA9+QuCeA==
=bWDX
-----END PGP SIGNATURE-----

--d7dh7oelr2g3r7ba--

