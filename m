Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A09C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IxRovoq9XtBcShXWzQQeNdxeVmm7PUQrI7CzJo6AvI=; b=N8l0NaosbgqBS7VKzRqbvyineb
	XuoN6mZWsGmhErIIf40Nu89o/If1Z3Brf43gFxXHRIknBlw1haDPdhd+ao9xJDLtbAm4G+oAyPKhL
	c5twhi8MU096Y3HpvrOOGfNN1ZIgi9X7nLeSjoIr3SPfh6dVFOllGo9lFFW6fTapOMqxrdn2dr5cD
	c8wwaA1MN44yn4E+1096dnCBZZOQBXbtzFbz9eGszzEbZGKqJspMx/K9zEcIF7JVIxMonyd9JjT0P
	i6Pkb/NW7E2kwWlhfjO3ksh9x67JWOVmItF6h2USj9phYdxAQl3/mDdvlCSmfreENit5ReOjKiydi
	ItGQp57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG7t-00000002BYf-2K5d;
	Mon, 27 Jul 2026 07:51:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG7r-00000002BYL-3guJ
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:51:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C680601DE;
	Mon, 27 Jul 2026 07:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371541F000E9;
	Mon, 27 Jul 2026 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138710;
	bh=+IxRovoq9XtBcShXWzQQeNdxeVmm7PUQrI7CzJo6AvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JeXGQOndaGtZtfRsO98QQAdmabnizC20VUXNi/trbR3OmAiplUt34RJWHamm24VsZ
	 5c310sgJUKTqBOwac57TBBAYzccEcfAivtEEvouOJwCCQqeViGlvGouGWUwQ4vGGGn
	 AWUdq82T+P85BI7hWE+8KmesJmWSKGuLWSTX617c0+F49oCMHS/m34M49oXaczGj0H
	 C/r8yMRnjz2CYl8tht2zLUcXn3TfG5N7/jQ4w8PY3bgHEqHfLb5YdGGdup7k0iAmUq
	 BNFgvDk6tSbYiOv4IfrTYxr6g6a1nmGk7zC6hp+BTEoioUt7A27NkIan1HnMXaI3mq
	 muSUrXC8wDVjg==
Date: Mon, 27 Jul 2026 09:51:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v7 07/34] dt-bindings: pinctrl: airoha: an7583: remove
 i2c pin function
Message-ID: <amcOFF1SC7ZLsfTu@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-8-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="07ipRKdS5zCt5UWQ"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-8-mikhail.kshevetskiy@iopsys.eu>
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

--07ipRKdS5zCt5UWQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In the AN7583 case there are no mux bits to enable i2c buses, so remove i=
2c
> pin function from device tree binding schema.

missing Fixes tag.

Regards,
Lorenzo

>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml
> index f52802a3ad79d..8d8ec6adb97d1 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -60,7 +60,7 @@ patternProperties:
>            function:
>              description:
>                A string containing the name of the function to mux to the=
 group.
> -            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> +            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
>                     pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
>                     phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
>                     phy3_led1, phy4_led1]
> @@ -117,14 +117,6 @@ patternProperties:
>                      enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
>                             uart4, uart5]
>                    maxItems: 2
> -          - if:
> -              properties:
> -                function:
> -                  const: i2c
> -            then:
> -              properties:
> -                groups:
> -                  enum: [i2c1]
>            - if:
>                properties:
>                  function:
> --=20
> 2.53.0
>=20

--07ipRKdS5zCt5UWQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcOFAAKCRA6cBh0uS2t
rBj/AQC/aEM3dF5r71ZSTacRwitCCucAqnr9FQPMRIw1iXwS9QD/RKdIaGDpezBF
xfWzoz8y+EXxL4L/vG7+5EJdx8jiEA8=
=+2wr
-----END PGP SIGNATURE-----

--07ipRKdS5zCt5UWQ--

