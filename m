Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CB5C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JK6hcDea904zCAzfOvHH+R87EzL8G+f8U4g5JCbElmE=; b=Nj5EfO26V7H0di8la5Bzyk3cmk
	m10hxH/wxvVvw2EL6KVJxq6OsgvhbTJ2oVCCUhLeRvj2rW7k3PT064oI2AZRNMp/l9PibDSz/H+Mr
	zjV8wryCLf6JT0a4BtvUgcBaxnOMTPwMKFe+8ZiiglSfXNBYQz8hoYTxqw/e0CJjbGRhL76Gcr7pq
	f9zwwUaEkL1MM9gzxYKvhJ9TJ08joDvZDGmfGXUvXHCpNMUIy+UwtM3KSL/V6I+2shY/8Sjl0ed0N
	smX1x9Ax3Yq5MLYZxNXXOVuXwi869kmxlm7F/N+h0p+md0ZjWUTaanisUmpXrnSPXgIzpxnn/OM5t
	9c8q0f9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGKW-00000002CIe-48G8;
	Mon, 27 Jul 2026 08:04:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGKV-00000002CIY-1wEI
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 08:04:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77E20601EC;
	Mon, 27 Jul 2026 08:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C891F00A3A;
	Mon, 27 Jul 2026 08:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139494;
	bh=JK6hcDea904zCAzfOvHH+R87EzL8G+f8U4g5JCbElmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gMbZzfhzqqKrI8a4N/3DQKK14ELe3f3F4eTw9FPTBuBArbUoYGylXrxEive+RR6RH
	 GlYSU9K8DsvzHDJP8/xAtx+5H2HOPVoyea/c/nVukkEueBKPeGyDeABbf3bM888M5c
	 u3K6nGqXfl/AlxYU/7RD6GoDoIDDdBNXa4Okjyb7vsYev9FrLySXgvC3ha4B/CCT2g
	 iuDlvR7iDiJpNWH2MnkbXQNY5rcQ8kGn2y2QngfKkJsswpALxmxo4FcsPjcgcr2ci0
	 mfQHRw98XVjgI6HO3PLvwXD5+0Zfzcg1e4PJFLjrqV6i7Njsoucgn97ec33Ar5A4Jx
	 mfiNlfk98yQeg==
Date: Mon, 27 Jul 2026 10:04:51 +0200
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
Subject: Re: [PATCH v7 12/34] pinctrl: airoha: add missed get_direction()
 function for gpio_chip
Message-ID: <amcRI3c0-1iWWX5M@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-13-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8iQlrEnRGnlj5Pyn"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-13-mikhail.kshevetskiy@iopsys.eu>
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

--8iQlrEnRGnlj5Pyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This patch adds missed get_direction() function for gpio_chip.
> Also it reimplements pinconf's get_direction() function using
> newly defined function.
>=20
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 41 ++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 820b7b0443851..b52eb39c55ff3 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2502,6 +2502,27 @@ static int airoha_gpio_get(struct gpio_chip *chip,=
 unsigned int gpio)
>  	return err ? err : !!(val & BIT(pin));
>  }
> =20
> +static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned in=
t gpio)
> +{
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);
> +	u32 mask, index, val;
> +	int err, field_shift;
> +
> +	field_shift =3D 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
> +	mask =3D GENMASK(field_shift + 1, field_shift);

before we where checking just BIT(field_shift) as mask, while now we are
checking two bits.

> +	index =3D gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
> +
> +	err =3D regmap_read(pinctrl->regmap,
> +			  pinctrl->gpiochip.dir[index], &val);
> +	if (err)
> +		return err;
> +
> +	if ((val & mask) > BIT(field_shift))
> +		return -EINVAL;
> +
> +	return (val & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;

nit: unnecessary brackets.

> +}
> +
>  static int airoha_gpio_direction_output(struct gpio_chip *chip,
>  					unsigned int gpio, int value)
>  {
> @@ -2648,6 +2669,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoh=
a_pinctrl *pinctrl,
>  	gc->free =3D gpiochip_generic_free;
>  	gc->direction_input =3D pinctrl_gpio_direction_input;
>  	gc->direction_output =3D airoha_gpio_direction_output;
> +	gc->get_direction =3D airoha_gpio_get_direction;
>  	gc->set =3D airoha_gpio_set;
>  	gc->get =3D airoha_gpio_get;
>  	gc->base =3D -1;
> @@ -2855,21 +2877,18 @@ static int airoha_pinctrl_set_conf(struct airoha_=
pinctrl *pinctrl,
>  static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u=
32 p)
>  {
>  	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
> -	u32 val, mask;
> -	int err, pin;
> -	u8 index;
> +	int err, gpio;
> =20
> -	pin =3D airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
> -	if (pin < 0)
> -		return pin;
> +	gpio =3D airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);

if you do not rename pin in gpio here the patch will be simpler.

Regards,
Lorenzo

> +	if (gpio < 0)
> +		return gpio;
> =20
> -	index =3D pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
> -	err =3D regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val=
);
> -	if (err)
> +	err =3D airoha_gpio_get_direction(&pinctrl->gpiochip.chip, gpio);
> +	if (err < 0)
>  		return err;
> =20
> -	mask =3D BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
> -	return val & mask ? PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
> +	return err =3D=3D GPIO_LINE_DIRECTION_OUT ?
> +	       PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
>  }
> =20
>  static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
> --=20
> 2.53.0
>=20

--8iQlrEnRGnlj5Pyn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcRIwAKCRA6cBh0uS2t
rIvRAP46t3ynpmSaQbfS9FRiJxVVb8IPe3lJTpXHNUdJ6JKXKwEAitJivdnbmcKb
13q9RT2W9cpPRTQIRuoQiYljaIyMjw4=
=wRoE
-----END PGP SIGNATURE-----

--8iQlrEnRGnlj5Pyn--

