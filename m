Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B05DC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9IWiYKgNZR/aQl9O1DLXAZQre3/tpLkUqFnPmg1KyA=; b=1XiaOpaRldCQ3YDVYKEiSVOTGT
	Aq2oieFXd1q0sxZQwWAAr9Q3JWKJwHOYs2fT4x4E/pgsF6QyieXIUfdQT7Ib8s6ntsMBatCD1JyED
	RiAGSZAvhcPKqVWFKeUjbERJ7h+aEGV5Pw/nr6aTEdqig3/6pElFCXzIp+uwU3VuNy/jriGdp9sVN
	m3sQeyYi7vmLTbquBCBAH+6o+SzzOIZVQBpbHVISUwD0R9mdwGvVSRq/9dU5TLNmNmiTN6iKmjbtS
	WOeUAFsbnK3f8V2Mlv6ORbz6kTgolhWauAuvIRW0yEN0UEpuVQmgVwkTVwHGrL5NyvNxWDVTd36DV
	Sfx1109A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7B1h-003OPY-LC; Fri, 01 Jul 2022 07:25:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7B1Y-003OMB-2G
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 07:25:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7B1S-0004u3-9I; Fri, 01 Jul 2022 09:25:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7B1N-003k2e-R9; Fri, 01 Jul 2022 09:25:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7B1Q-002H6l-Cf; Fri, 01 Jul 2022 09:25:00 +0200
Date: Fri, 1 Jul 2022 09:25:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8195: add pwm node
Message-ID: <20220701072500.3rgvscnulhjmjhb6@pengutronix.de>
References: <20220531114544.144785-1-fparent@baylibre.com>
 <20220531114544.144785-2-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7jpbomglvpzfusz7"
Content-Disposition: inline
In-Reply-To: <20220531114544.144785-2-fparent@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_002508_174747_A464C518 
X-CRM114-Status: GOOD (  17.27  )
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


--7jpbomglvpzfusz7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 31, 2022 at 01:45:44PM +0200, Fabien Parent wrote:
> MT8195's PWM IP has 4 PWM blocks.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index d076a376bdcc..366543f27a99 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -367,6 +367,21 @@ pwrap: pwrap@10024000 {
>  			assigned-clock-parents =3D <&topckgen CLK_TOP_ULPOSC1_D10>;
>  		};
> =20
> +		pwm0: pwm@10048000 {
> +			compatible =3D "mediatek,mt8195-pwm",
> +				     "mediatek,mt8183-pwm";
> +			reg =3D <0 0x10048000 0 0x1000>;
> +			#pwm-cells =3D <2>;
> +			clocks =3D <&infracfg_ao CLK_INFRA_AO_PWM_H>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM1>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM2>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM3>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM4>;
> +			clock-names =3D "top", "main", "pwm1", "pwm2", "pwm3",
> +				      "pwm4";
> +		};
> +

I wonder why will pick up this patch? Will patch 1 then go the same
path, or is that one supposed to go via the pwm tree?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7jpbomglvpzfusz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK+oUkACgkQwfwUeK3K
7Ang2gf+Kl9JecJpvkoirnmDAmLOLjFtUVPIXpmZTrlJ1C07oaQ3+h6VzBQ84sJT
BbROJc039OnAHAKkscpVcssNm2nFpm+t05wBMuDO4wipvehakAzbHL4m4o4xEOTT
wkRjbHcNEmPLB/yhJBx9U32vPNctKWygGYEG+eIYc2rNnaseHdlK73k2Ks9VH1Vg
0gt7tSg6IA6um6QTDMwB7anVI0wWX3S6kk5Shozd65S/egyIsDFZsKwoTzgPX+qa
W6gEhUfx9NkbHxBH3nN3rBN1TPLHNHB5QYLEm9jHWmeaupZtl2Gf14AQET+haWjT
4YX6PFmjZMynfmh/2KKAQv1N+EhLJg==
=hTm4
-----END PGP SIGNATURE-----

--7jpbomglvpzfusz7--

