Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ED3C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt+D3jOponHMxc+QxjPF+MS0ElxubCEeMFryJ+h28PU=; b=B6k5P+6b6DggbDYAcllEC8Km8r
	AB7sfNtGqzbix0S8FvLx7sGJlm3U3/SH/JjZw71I8lcTzgxg3pzqAy73RyYiqYVHE2Q2UqWSLP1p5
	J6hO/VpwraX9yzbua/7YmQZCpx5lK2l16B3m9djfiKPPo4NS7yn/RZq6JMDLh0SFrUgGH/JyRF/ki
	gBGvdc2gYMLmqx4SLBCXSD+j0/7aMWpRM4a0pF1Ol3SzuLWMoFb3rKXi3m2OyjA7wxCnd9Sa97P3B
	8taKgkA3VMbqOK1GV97TULsS1QQMoi+6VvIE5vmC2vJQ+XjcnJnG8TIHtbjAD/5s7XIz1hNM/wacO
	OUX6VN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHF2-00000002Hk0-04uo;
	Mon, 27 Jul 2026 09:03:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHF0-00000002HjF-24p3
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:03:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EE5F60A79;
	Mon, 27 Jul 2026 09:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0D61F000E9;
	Mon, 27 Jul 2026 09:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785142997;
	bh=Lt+D3jOponHMxc+QxjPF+MS0ElxubCEeMFryJ+h28PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QKrxVyYCcqMPn+/sdpSnvw3uaupXNzT4aR5c9GBbsOEktJpmfEpZ7JgZYA7zy2BgW
	 +kak4u1N73VijUMwueFJe29gCR0aKyYjPbuTlc/OKUFPB14aVJr8svGoaNZ//mgHM3
	 giYsx3J3NAYBfc/UXAQPDN1KQVepoWQkVdk9sj7hXAMue3d1x1myckXtvRGHcOQCFX
	 Qyeaku4s3HRm+MvwkdQfAJRgV+O7u+7ULZucD3nHz2FOJ6tKImlKvrVGo9sWwjvD7K
	 DdK7t0S6hkxDGlTr5iUA3TGKd1vxU18FXBNpR/ugTIKsYw1q9ff5tmFz7KkCG505i9
	 5oGtmDh8GUUpA==
Date: Mon, 27 Jul 2026 11:03:15 +0200
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
Subject: Re: [PATCH v7 18/34] pinctrl: airoha: remove not needed irq_type[]
 array
Message-ID: <amce04npPwd9NnIZ@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-19-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mCMKngf9XLb2rGIH"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-19-mikhail.kshevetskiy@iopsys.eu>
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

--mCMKngf9XLb2rGIH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> irq_type[] array inside airoha_pinctrl_gpiochip structure is not
> actually necessary. Use trigger type from 'struct irq_data' instead.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index df3a1d7c7b571..65447d7e5965a 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -382,8 +382,6 @@ struct airoha_pinctrl_gpiochip {
>  	const u32 *status;
>  	const u32 *level;
>  	const u32 *edge;
> -
> -	u32 irq_type[AIROHA_NUM_PINS];
>  };
> =20
>  struct airoha_pinctrl_confs_info {
> @@ -2577,11 +2575,11 @@ static void airoha_irq_unmask(struct irq_data *da=
ta)
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
>  	u32 val =3D BIT(2 * offset);
> =20
> -	if (WARN_ON_ONCE(data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type)))
> +	if (WARN_ON_ONCE(data->hwirq >=3D AIROHA_NUM_PINS))
>  		return;
> =20
>  	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
> -	switch (gpiochip->irq_type[data->hwirq]) {
> +	switch (irqd_get_trigger_type(data)) {
>  	case IRQ_TYPE_LEVEL_LOW:
>  		val =3D val << 1;
>  		fallthrough;
> @@ -2613,7 +2611,7 @@ static void airoha_irq_mask(struct irq_data *data)
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> =20
> -	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +	if (data->hwirq >=3D AIROHA_NUM_PINS)
>  		return;
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
> @@ -2629,7 +2627,7 @@ static void airoha_irq_ack(struct irq_data *data)
>  	u8 offset =3D data->hwirq % AIROHA_PIN_BANK_SIZE;
>  	u8 index =3D data->hwirq / AIROHA_PIN_BANK_SIZE;
> =20
> -	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +	if (data->hwirq >=3D AIROHA_NUM_PINS)
>  		return;
> =20
>  	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
> @@ -2637,28 +2635,24 @@ static void airoha_irq_ack(struct irq_data *data)
> =20
>  static int airoha_irq_type(struct irq_data *data, unsigned int type)
>  {
> -	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> -	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> -	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
> -
> -	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +	if (data->hwirq >=3D AIROHA_NUM_PINS)
>  		return -EINVAL;
> =20
>  	if (type =3D=3D IRQ_TYPE_NONE) {
> -		gpiochip->irq_type[data->hwirq] =3D IRQ_TYPE_NONE;
> +		irqd_set_trigger_type(data, type);
>  		irq_set_handler_locked(data, handle_bad_irq);
> =20
>  		return 0;
>  	}
> =20
>  	if (type =3D=3D IRQ_TYPE_PROBE) {
> -		if (gpiochip->irq_type[data->hwirq])
> +		if (irqd_get_trigger_type(data))
>  			return 0;
> =20
>  		type =3D IRQ_TYPE_EDGE_BOTH;
>  	}
> =20
> -	gpiochip->irq_type[data->hwirq] =3D type & IRQ_TYPE_SENSE_MASK;
> +	irqd_set_trigger_type(data, type);
>  	if (type & IRQ_TYPE_EDGE_BOTH)
>  		irq_set_handler_locked(data, handle_edge_irq);
>  	else
> --=20
> 2.53.0
>=20

--mCMKngf9XLb2rGIH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamce0wAKCRA6cBh0uS2t
rHi8AQDuWJL6OKqaU8zGTbHq1aGEBgqHQG/038T+Yt27PNWRGwD/Z8ntJnHdGjMn
eDYpRqHRrOqrzeAWzsTqsJS6S31Q9Aw=
=GUUI
-----END PGP SIGNATURE-----

--mCMKngf9XLb2rGIH--

