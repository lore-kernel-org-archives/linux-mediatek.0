Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F52606A330
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=416KFXqO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5iahbXV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q3uvYkOZjdrvPs2HRdExTdIgvGA4FrRTNjbjAdqeYns=; b=416KFXqODB3WEld8KQFRZOu8Cj
	GIE7SQAwyVS74xVZyUPhWuVj/1gp2l0ddz2544CAm9ypygqZ5jrTzZNjA1RCSRuvLQigJy4kc1DcD
	efX3sBb3ep/rrwxW9ubbSjBuXD62sbIbfLPk04SBsTaDJZJ9pD2BziZqbxToEAhx6sC2fkDAFh7Y3
	d9tFg3j1+lszC7hzbkxECmE9gLeXdC9zUVJBrsV68vx3gO0N13ABKUeQUqmvDJYmr2oVGWlkzGLxq
	3FuOdP7EYa8V4VeeU96ZIvoPrIZ4xeLYCLIEJgZ1kDfZn/aFWtCPjV9k0YkWwa6+cO4No4usRYQCm
	uIFXPoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6P6-00000006TUS-1cix;
	Wed, 11 Nov 2026 11:22:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6P5-00000006TUC-3MnY
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 11:22:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6397F45B2C;
	Wed, 11 Nov 2026 11:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF76F1F00A05;
	Wed, 11 Nov 2026 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794396131;
	bh=q3uvYkOZjdrvPs2HRdExTdIgvGA4FrRTNjbjAdqeYns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l5iahbXVODhXP5BYaVz3lVdaFKAxPbIAV3hq96sXjhxKI9HOoR2/3E6F8yc6p2lnn
	 WYOV4BO44d1ftIV1pYZaZ3P7x+X/K2hOfbck3hrxOLF7+DjUwkP1dkVZwOTp5bdgG/
	 0sA2Mynj4aVVQBX02rcqTENjrjW6h1cFMupMrd/VGuNMR4fGbbJcQi3AXAHtjHVf1/
	 R1xIHOd1CRUUf0iqhEH6Io8GPTn2iXxZ6MYFs44afGFgnuAJUfVFUAkbbw8wWdoxMh
	 HWHJFOAMcvVoy7TPU9c2M72++kukupwo9oRI6P9ZjxkO/HHrCoWN2dajaitGrzKiKw
	 BW28RKsWw6/CQ==
Date: Wed, 11 Nov 2026 12:22:08 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH 1/7] pinctrl: airoha: make gpio register layout per SoC
Message-ID: <avRP4MTHKRkP00oh@lore-desk>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-2-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WqyvA75ADRGpy4XY"
Content-Disposition: inline
In-Reply-To: <20261110173941.301478-2-john@phrozen.org>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--WqyvA75ADRGpy4XY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The GPIO register layout is fixed to 64 pins in two 32 pin banks and
> four 16 pin direction banks. Every SoC uses the single static
> airoha_gpiochip_regs and the compile time AIROHA_NUM_PINS.
>=20
> Move the layout into the match data. The gpiochip register table
> carries its own pin count, and the five existing SoCs point at the
> shared 64 pin table.
>=20
> No functional change for the existing SoCs.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/airoha/airoha-common.h  |  6 +++++-
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 14 ++++++++------
>  drivers/pinctrl/airoha/pinctrl-an7563.c |  1 +
>  drivers/pinctrl/airoha/pinctrl-an7581.c |  1 +
>  drivers/pinctrl/airoha/pinctrl-an7583.c |  1 +
>  drivers/pinctrl/airoha/pinctrl-en7523.c |  1 +
>  drivers/pinctrl/airoha/pinctrl-en7528.c |  1 +
>  7 files changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/air=
oha/airoha-common.h
> index 16f7abcdfb83..850e733db15a 100644
> --- a/drivers/pinctrl/airoha/airoha-common.h
> +++ b/drivers/pinctrl/airoha/airoha-common.h
> @@ -89,6 +89,7 @@ struct airoha_pinctrl_conf {
>  };
> =20
>  struct airoha_gpiochip_regs {
> +	unsigned int ngpio;
>  	/* gpio */
>  	const u32 *data;
>  	const u32 *dir;
> @@ -99,6 +100,8 @@ struct airoha_gpiochip_regs {
>  	const u32 *edge;
>  };
> =20
> +extern const struct airoha_gpiochip_regs airoha_gpiochip_regs_64;
> +
>  struct airoha_pinctrl_confs_info {
>  	const struct airoha_pinctrl_conf *confs;
>  	unsigned int num_confs;
> @@ -126,7 +129,7 @@ struct airoha_pinctrl {
>  	struct regmap *regmap;
> =20
>  	struct gpio_chip gpiochip;
> -	struct airoha_gpiochip_regs *gpio_regs;
> +	const struct airoha_gpiochip_regs *gpio_regs;
>  	unsigned int num_irq_pins;
>  };
> =20
> @@ -134,6 +137,7 @@ struct airoha_pinctrl_match_data {
>  	const char *chip_scu_compatible;
>  	const char *pinctrl_name;
>  	struct module *pinctrl_owner;
> +	const struct airoha_gpiochip_regs *gpio_regs;
>  	const struct pinctrl_pin_desc *pins;
>  	const unsigned int num_pins;
>  	const struct pingroup *grps;
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 52a768c859b7..b50108826d8d 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -94,7 +94,8 @@ static const u32 irq_edge_regs[] =3D {
>  	REG_GPIO_INT_EDGE3
>  };
> =20
> -static struct airoha_gpiochip_regs airoha_gpiochip_regs =3D {
> +const struct airoha_gpiochip_regs airoha_gpiochip_regs_64 =3D {
> +	.ngpio =3D AIROHA_NUM_PINS,
>  	.data =3D gpio_data_regs,
>  	.dir =3D gpio_dir_regs,
>  	.out =3D gpio_out_regs,
> @@ -102,6 +103,7 @@ static struct airoha_gpiochip_regs airoha_gpiochip_re=
gs =3D {
>  	.level =3D irq_level_regs,
>  	.edge =3D irq_edge_regs,
>  };
> +EXPORT_SYMBOL_GPL(airoha_gpiochip_regs_64);
> =20
>  static int airoha_convert_pin_to_reg_offset(struct pinctrl_dev *pctrl_de=
v,
>  					    struct pinctrl_gpio_range *range,
> @@ -207,7 +209,7 @@ static void airoha_irq_unmask(struct irq_data *data)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
>  	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> -	struct airoha_gpiochip_regs *gpio_regs =3D pinctrl->gpio_regs;
> +	const struct airoha_gpiochip_regs *gpio_regs =3D pinctrl->gpio_regs;
>  	u8 offset =3D data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> @@ -244,7 +246,7 @@ static void airoha_irq_mask(struct irq_data *data)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
>  	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> -	struct airoha_gpiochip_regs *gpio_regs =3D pinctrl->gpio_regs;
> +	const struct airoha_gpiochip_regs *gpio_regs =3D pinctrl->gpio_regs;
>  	u8 offset =3D data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> @@ -261,7 +263,7 @@ static void airoha_irq_ack(struct irq_data *data)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
>  	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> -	struct airoha_gpiochip_regs *gpio_regs =3D pinctrl->gpio_regs;
> +	const struct airoha_gpiochip_regs *gpio_regs =3D pinctrl->gpio_regs;
>  	u8 offset =3D data->hwirq % AIROHA_PIN_BANK_SIZE;
>  	u8 index =3D data->hwirq / AIROHA_PIN_BANK_SIZE;
> =20
> @@ -379,7 +381,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_=
pinctrl *pinctrl,
>  	gc->set =3D airoha_gpio_set;
>  	gc->get =3D airoha_gpio_get;
>  	gc->base =3D -1;
> -	gc->ngpio =3D AIROHA_NUM_PINS;
> +	gc->ngpio =3D pinctrl->gpio_regs->ngpio;
> =20
>  	girq->default_type =3D IRQ_TYPE_NONE;
>  	girq->handler =3D handle_bad_irq;
> @@ -831,7 +833,7 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
>  	pinctrl->desc.pins =3D data->pins;
>  	pinctrl->desc.npins =3D data->num_pins;
> =20
> -	pinctrl->gpio_regs =3D &airoha_gpiochip_regs;
> +	pinctrl->gpio_regs =3D data->gpio_regs;
> =20
>  	err =3D devm_pinctrl_register_and_init(dev, &pinctrl->desc,
>  					     pinctrl, &pinctrl->ctrl);
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/ai=
roha/pinctrl-an7563.c
> index f011c6c9ccce..6a2a307807e3 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7563.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
> @@ -1063,6 +1063,7 @@ static const struct airoha_pinctrl_match_data pinct=
rl_match_data =3D {
>  	.chip_scu_compatible =3D "airoha,en7581-chip-scu",
>  	.pinctrl_name =3D KBUILD_MODNAME,
>  	.pinctrl_owner =3D THIS_MODULE,
> +	.gpio_regs =3D &airoha_gpiochip_regs_64,
>  	.pins =3D pinctrl_pins,
>  	.num_pins =3D ARRAY_SIZE(pinctrl_pins),
>  	.grps =3D pinctrl_groups,
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/ai=
roha/pinctrl-an7581.c
> index bfb777594811..6bec1d44b8a0 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7581.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
> @@ -1435,6 +1435,7 @@ static const struct airoha_pinctrl_match_data pinct=
rl_match_data =3D {
>  	.chip_scu_compatible =3D "airoha,en7581-chip-scu",
>  	.pinctrl_name =3D KBUILD_MODNAME,
>  	.pinctrl_owner =3D THIS_MODULE,
> +	.gpio_regs =3D &airoha_gpiochip_regs_64,
>  	.pins =3D pinctrl_pins,
>  	.num_pins =3D ARRAY_SIZE(pinctrl_pins),
>  	.grps =3D pinctrl_groups,
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index 1cd0f442ddc1..2689bbd9ebba 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
> @@ -1465,6 +1465,7 @@ static const struct airoha_pinctrl_match_data pinct=
rl_match_data =3D {
>  	.chip_scu_compatible =3D "airoha,en7581-chip-scu",
>  	.pinctrl_name =3D KBUILD_MODNAME,
>  	.pinctrl_owner =3D THIS_MODULE,
> +	.gpio_regs =3D &airoha_gpiochip_regs_64,
>  	.pins =3D pinctrl_pins,
>  	.num_pins =3D ARRAY_SIZE(pinctrl_pins),
>  	.grps =3D pinctrl_groups,
> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/ai=
roha/pinctrl-en7523.c
> index b0c5e60f0aeb..1589acef683f 100644
> --- a/drivers/pinctrl/airoha/pinctrl-en7523.c
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
> @@ -1107,6 +1107,7 @@ static const struct airoha_pinctrl_match_data pinct=
rl_match_data =3D {
>  	.chip_scu_compatible =3D "airoha,en7523-chip-scu",
>  	.pinctrl_name =3D KBUILD_MODNAME,
>  	.pinctrl_owner =3D THIS_MODULE,
> +	.gpio_regs =3D &airoha_gpiochip_regs_64,
>  	.pins =3D pinctrl_pins,
>  	.num_pins =3D ARRAY_SIZE(pinctrl_pins),
>  	.grps =3D pinctrl_groups,
> diff --git a/drivers/pinctrl/airoha/pinctrl-en7528.c b/drivers/pinctrl/ai=
roha/pinctrl-en7528.c
> index f6c8f834421f..9854e9530219 100644
> --- a/drivers/pinctrl/airoha/pinctrl-en7528.c
> +++ b/drivers/pinctrl/airoha/pinctrl-en7528.c
> @@ -1155,6 +1155,7 @@ static const struct airoha_pinctrl_match_data pinct=
rl_match_data =3D {
>  	.chip_scu_compatible =3D "econet,en7528-chip-scu",
>  	.pinctrl_name =3D KBUILD_MODNAME,
>  	.pinctrl_owner =3D THIS_MODULE,
> +	.gpio_regs =3D &airoha_gpiochip_regs_64,
>  	.pins =3D pinctrl_pins,
>  	.num_pins =3D ARRAY_SIZE(pinctrl_pins),
>  	.grps =3D pinctrl_groups,
> --=20
> 2.34.1
>=20

--WqyvA75ADRGpy4XY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavRP4AAKCRA6cBh0uS2t
rDPBAPwN08fBuOv0LvZ5GSpm3nNQBDO/6ajcZnEG7ZqY1ifYrAEAz42H7L6jUwuY
Lj4bMSvEqOwOxZTxPFWF6i03FlMFWwE=
=7ilg
-----END PGP SIGNATURE-----

--WqyvA75ADRGpy4XY--

