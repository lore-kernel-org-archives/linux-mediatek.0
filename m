Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6503FC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 17:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ee9QNLDgbT6alukxpgY760dSucVfpFX5vaeMFaqp7l8=; b=GRNGliRjmcdQyNi9uSYJHucJWP
	MGHqtbxd8jarT+sP8Aupe1Tis4m3lfHnYZHIuyRJ95L6shsWDTpri7p6t8fCTY75vEXSwdvRzzMM8
	qbeahvcw8I/YYLt3HHrZEot81TX/ICl0nKSr56WIxtg96yEfu8DShum51KZDO+I7hbm3YZYHVw8YM
	wdaLPxY7iKVyNggS+L/1lF7dtBh7WJgnTSNrFYgRpiNVASfXuYFrxA/IwJLvYsF+tVOVXqpzHW5eN
	66skkGMHNjQRrB4ASqyZS9lYRBwEbur7rn4gY/djWf4OTORY/PNDR8ufpUSESek4Sxlbqa0Mwi5pt
	94zzd70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xlu-0073zU-0d; Wed, 07 Dec 2022 16:59:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xli-0073qc-Im; Wed, 07 Dec 2022 16:59:40 +0000
Received: from mercury (dyndsl-091-096-059-166.ewe-ip-backbone.de [91.96.59.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F4976602BC8;
	Wed,  7 Dec 2022 16:59:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670432374;
	bh=bEvlL0mnv13cihi3HCIkl9DCfnP1k298XjhbL7LAufA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVlDFCTzOHXdtF44MPRDBp745dkSoal+m9XlgbrVk0eVveZ4SV+Bv1Rnj0ZBG6Rt3
	 iZzkYM/8F/qgm/5INpH4ZuEVZdheQuxkmKnjbF4NYwKekrccgWZ80uTQ5fVMnlVnEK
	 7sz8TmoCZwYK3OEI28mJ6n6F3xGALBFdeq22ossum96yZrYwJqiWDu1PsWPLAsHI7x
	 hRrGzEFqetXXh+ZUi+bUOEraSs2OtVyf9i/MzyAzh8Cjc9+JImlrgZ8QqwdNdYumLv
	 0XdveLAuHK+do5iCZu9zBRZS6X/efajXc1hQZdTXVcNAcNiE0Vb1uyxHCLrTy7hmA0
	 6hG/oUhpNGlZw==
Received: by mercury (Postfix, from userid 1000)
	id 119591060F43; Wed,  7 Dec 2022 17:59:32 +0100 (CET)
Date: Wed, 7 Dec 2022 17:59:32 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Gene Chen <gene_chen@richtek.com>,
	Daniel Mack <zonque@gmail.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing 'unevaluatedProperties' to
 regulator nodes
Message-ID: <20221207165932.hmgj4giz5ivei46i@mercury.elektranox.org>
References: <20221206211554.92005-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tn5la4fl5slxzyzl"
Content-Disposition: inline
In-Reply-To: <20221206211554.92005-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_085938_904063_9711A441 
X-CRM114-Status: GOOD (  20.38  )
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


--tn5la4fl5slxzyzl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 06, 2022 at 03:15:55PM -0600, Rob Herring wrote:
> Several regulator schemas are missing 'unevaluatedProperties' constraint
> which means any extra properties are allowed. Upon adding the
> constraint, there's numerous warnings from using the deprecated
> 'regulator-compatible' property. Remove the usage as examples shouldn't
> be using long since deprecated properties.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I'd suggest that Mark take this if that's okay with Lee. Or I can take=20
> it.
>=20
>  Documentation/devicetree/bindings/mfd/max77650.yaml  |  2 --
>  .../devicetree/bindings/mfd/mediatek,mt6360.yaml     |  9 ---------
>  .../bindings/power/supply/mt6360_charger.yaml        |  2 +-
>  .../bindings/regulator/max77650-regulator.yaml       |  1 +
>  .../devicetree/bindings/regulator/max8660.yaml       |  6 +-----
>  .../bindings/regulator/mt6360-regulator.yaml         | 12 +++---------
>  6 files changed, 6 insertions(+), 26 deletions(-)
>=20
> [...]
>
> diff --git a/Documentation/devicetree/bindings/power/supply/mt6360_charge=
r.yaml b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
> index b89b15a5bfa4..4c74cc78729e 100644
> --- a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
> @@ -26,6 +26,7 @@ properties:
>      type: object
>      description: OTG boost regulator.
>      $ref: /schemas/regulator/regulator.yaml#
> +    unevaluatedProperties: false
> =20
>  required:
>    - compatible
> @@ -39,7 +40,6 @@ examples:
>        richtek,vinovp-microvolt =3D <14500000>;
> =20
>        otg_vbus_regulator: usb-otg-vbus-regulator {
> -        regulator-compatible =3D "usb-otg-vbus";
>          regulator-name =3D "usb-otg-vbus";
>          regulator-min-microvolt =3D <4425000>;
>          regulator-max-microvolt =3D <5825000>;

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

> [...]

-- Sebastian

--tn5la4fl5slxzyzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmOQxmgACgkQ2O7X88g7
+pqenQ/9Ho8lsTUBjGsxEgwS8RpLC8U1AP8yglgqBuUrbdcwAuL3g0yWJMB4Cm4a
trhgJgCBr2fd4LLFbJzQH/tVrcUZtFJ957ZmvKr0E1xcVkiDgR8ujhhCCCOgB5vG
IpjFq+8lXplomNmb3hOlRKkuC+2YWYM1cXvEQyFyPOYZAThebqOpYQcETx5rxegs
VTdhV4cB6b+jG2fsR+3BVw+rJ9U3oxjbY5XuwUJ2GyA15InCnBOh0945mc6vLDvN
vNCwgsgvS8D7emYsLt666/gI3LKRLH6H+3p8Vu2yYAU58mu21gg7L6z6jswSlm+V
MsMVDTiwzLYq/EaYQbGaTazJjigroldPnUf268xI6OgG7tSqowA0PuYaT+GkKfrY
0dPGbQf1K6NbCQ4V+Fh1BO1h0kOtX6FCjkLJ0d1ZZTC7DwIMe1tLgXZux0mETsQo
aCli/01Y+oVc6vulRN9HRGvthS01OoByy5vdikomiO6cJH3l8Jwb7gNz07kVrJyF
aDzTDqorec2e7bMleqRGwncCINLYqw0z/Mh0ZLKPgbs/L2YXOI7nhGVaCj5p4wNb
44Nky3qwmg0iu12vbmydFMWjRIICBnOU3xCqfe7tDfi4jDCJqKkHcHU15JR2bPPC
LYL6vJb5f66lQGyI+SWJoXT+q5bps6L/KhDMea6xKmWTjss81gM=
=VLUI
-----END PGP SIGNATURE-----

--tn5la4fl5slxzyzl--

