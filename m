Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7647C53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVg/uNJQsxF6h7YI8btP6po5t0wmQcAYffBBfRoy1Y0=; b=meJO28jRrOue3oim5vhHltoVV7
	BNKhCC7ot4SkdR+PSTPS5yN2hXUVKf+Ns7NHRLiPga1v9EkoWZtejPEpmr+IeiKCShme57aeOMLZ7
	TD9aVSnxKAna1uk5hgx3PBt6XoQZx4IzKb9Iyspl0et8mRnQNagduEohpiRkWVFLkyGEMcC4j6JbT
	h5Nd5km/KkI6pv7bAYx4GC5I7Zhzs2Y3Sw2Q3uMeJfXoQf4zzDf3KSiLVCRawMJLd1zW5xhbek2QR
	Z7MNZ/UXcV4z2hTxQ3lFLv+k/9qnuJD8Hm1cEyDoCngKWnFXu+61eMMT/Ask8EbGsEa/Ia8vTJMgj
	V3/StfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGju-00000002EsL-28eW;
	Mon, 27 Jul 2026 08:31:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGjt-00000002Ert-1KxK
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 08:31:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D5D340230;
	Mon, 27 Jul 2026 08:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752251F000E9;
	Mon, 27 Jul 2026 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141068;
	bh=eVg/uNJQsxF6h7YI8btP6po5t0wmQcAYffBBfRoy1Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DLmBl6Yq19mcpqVYviyuM/vYGjGwqY761oW6rfnxLsG65toy5Nnw6tnNtM5tWoafE
	 L6Ye/hV0yAWGbJ/cVDnRt6HL95FUTEAg6Njw2cPdk2rb/0QZg2EmjMf5/6kWoeOAME
	 6WYoGiQ2TpjI15kBrfLqK09IGK++0uo8fokEqB0Xzw7Ik2/831C2bCeH2KUVc7q3RM
	 KwhABP8d1Qd1WEHpKmvIwyuTmXQ2iBTmJwd9Fq/T2xxo3ZRJyWINApqVkYFPQKtASA
	 Vd0GyYm6C1BDPg4Tk1wMU2RP/Bfv8bE3ExOsXmmq+HpUC2kLUwOzUj1AW6UFNxEw0K
	 /QmCcFgZTM3PA==
Date: Mon, 27 Jul 2026 10:31:05 +0200
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
Subject: Re: [PATCH v7 14/34] pinctrl: airoha: fix potential kenel panic in
 IRQ handling code
Message-ID: <amcXSQ4pfRCJjihI@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-15-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQr/HXH9SxXcZv6z"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-15-mikhail.kshevetskiy@iopsys.eu>
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

--qQr/HXH9SxXcZv6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> airoha_irq_unmask(), airoha_irq_mask(), airoha_irq_type() functions
> gets invalid pointers when initialize gpiochip and pinctrl variables.
> Generally this should lead to kernel panic.
>=20
> Details:
>=20
>     gpiochip =3D irq_data_get_irq_chip_data(data);
>=20
> will initialize gpiochip variable with data->chip_data value. This value
> initialized inside gpiochip_irq_map() function
>=20
>     static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
> 			        irq_hw_number_t hwirq)
>     {
> 	struct gpio_chip *gc =3D d->host_data;
>         ...
> 	irq_set_chip_data(irq, gc);
> 	...
>     }
>=20
> Thus gpiochip variable of 'struct airoha_pinctrl_gpiochip *' type will be
> initialized with a pointer to unrelated variable of 'struct gpio_chip'
> type.
>=20
> pinctrl pointer derived from the gpiochip variable
>=20
>     pinctrl =3D container_of(gpiochip, struct airoha_pinctrl, gpiochip);
>=20
> thus it will get wrong value as well.
>=20
> So any access to the data pointed by gpiochip and pinctrl variables is
> extremelly dangerous.
>=20
> This patch implements correct logic of getting gpiochip and pinctrl
> pointers.
>=20
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index faad5d3ada31c..6cf4ed5976fb0 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2569,18 +2569,17 @@ static int airoha_gpio_direction_output(struct gp=
io_chip *chip,
>  /* irq callbacks */
>  static void airoha_irq_unmask(struct irq_data *data)
>  {
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> +	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
>  	u8 offset =3D data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> -	struct airoha_pinctrl_gpiochip *gpiochip;
> -	struct airoha_pinctrl *pinctrl;
>  	u32 val =3D BIT(2 * offset);
> =20
> -	gpiochip =3D irq_data_get_irq_chip_data(data);

I agree the proposed approach is more standard and I am fine with it, but c=
an
you please provide more details about how it can panic?

gpio_chip is the first element of airoha_pinctrl_gpiochip so it is fine to =
cast
irq_data_get_irq_chip_data() return value to airoha_pinctrl_gpiochip, right?

Regards,
Lorenzo

>  	if (WARN_ON_ONCE(data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type)))
>  		return;
> =20
> -	pinctrl =3D container_of(gpiochip, struct airoha_pinctrl, gpiochip);
>  	switch (gpiochip->irq_type[data->hwirq]) {
>  	case IRQ_TYPE_LEVEL_LOW:
>  		val =3D val << 1;
> @@ -2606,14 +2605,12 @@ static void airoha_irq_unmask(struct irq_data *da=
ta)
> =20
>  static void airoha_irq_mask(struct irq_data *data)
>  {
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> +	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
>  	u8 offset =3D data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> -	struct airoha_pinctrl_gpiochip *gpiochip;
> -	struct airoha_pinctrl *pinctrl;
> -
> -	gpiochip =3D irq_data_get_irq_chip_data(data);
> -	pinctrl =3D container_of(gpiochip, struct airoha_pinctrl, gpiochip);
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
> @@ -2621,9 +2618,10 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  static int airoha_irq_type(struct irq_data *data, unsigned int type)
>  {
> -	struct airoha_pinctrl_gpiochip *gpiochip;
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> +	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
> =20
> -	gpiochip =3D irq_data_get_irq_chip_data(data);
>  	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
>  		return -EINVAL;
> =20
> --=20
> 2.53.0
>=20

--qQr/HXH9SxXcZv6z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcXSQAKCRA6cBh0uS2t
rEwWAQD8cGSZk5/1aiOE+u0M8M5puuqsxZZlYElphkINBPmXQAEA1B/nj4I1WqTL
VLynXQafTFU6141XSGtT8s4S4sZmzAE=
=Wwkr
-----END PGP SIGNATURE-----

--qQr/HXH9SxXcZv6z--

