Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8986CC531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ymQ69O58SmJxjBh9J1WtzowD3z4z2UMVP2Lc1OmFgM=; b=5Ccu4VO0Kh37dgTmDQB6JZzype
	xEaVfy67+jQtk8vpaes6qyeFXER8I65hGqtG1ny1b2pprP3qBSjw5AztLWtRkzc3RrXH/dYvQNKyU
	1DKraNf0PbHVwP+ZPKxkyxGw3t/GyAjMWB7ygxAsQfZ2x2rAoDVT+FmHLOnAgZCmp8bzfdTCgcQTo
	x7q/MFhnwT3bOenZ+D1ITNFi2c92SheRAYpGt5Zc+QkNmb7GAivvVnCZvAXFbD/66qWkxMRH1VP8I
	FGrEYtHw/hVb3a8RSTFKXzzanq0qi7U8t/RaUyh+WhRcgqiacR+anryr+vlXGlZaoqvNP16jFcmgH
	dFu+B9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGpm-00000002FRV-0iFS;
	Mon, 27 Jul 2026 08:37:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGpk-00000002FRD-0zlc
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 08:37:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6199A60A59;
	Mon, 27 Jul 2026 08:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894BE1F000E9;
	Mon, 27 Jul 2026 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141431;
	bh=2ymQ69O58SmJxjBh9J1WtzowD3z4z2UMVP2Lc1OmFgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k5tW9RBoshz389tVyBaXpXv+kl3+U/hYfpzdIG1n61TfM76XDpxuaywmU0+MkreLW
	 nnhvZ/2f6HguyzQOHRnT+wMPgNwiiu+IIsb2GjNnD7xAdnuYEgxdIB/GkT2djlIED6
	 NLJ4/wyugxC7xQpcgjqF5OBNkdkgXMpLyTZdqfATC5e2c9sZG208CxdrJBY6qQyxap
	 sd+xIU27dfM9EaNIHhC517PCnt2jm8cUhCrZXDM5nDrWVTuIsSrDsUrqOnQvf9rUxu
	 CrS45cC8GthF6nTLkdZnBvkZPA9jKwmlD6NRBo2teg8nDDi1pLNPMSFWgVc5uSudf1
	 C6jrWj38QrU/g==
Date: Mon, 27 Jul 2026 10:37:08 +0200
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
Subject: Re: [PATCH v7 15/34] pinctrl: airoha: fix IRQ mask/unmask code
Message-ID: <amcYtIpIjyYclv4r@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-16-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mtbYkPphZS9xxI2V"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-16-mikhail.kshevetskiy@iopsys.eu>
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

--mtbYkPphZS9xxI2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
> gpiochip_enable_irq() and airoha_irq_mask() must call
> gpiochip_disable_irq(). Without these calls, gpiolib never sets the
> GPIOD_FLAG_IRQ_IS_ENABLED bit. Because this bit is missing,
> gpiod_direction_output() will not realize the pin is actively used
> as an interrupt.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 6cf4ed5976fb0..f85941ccea560 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2580,6 +2580,7 @@ static void airoha_irq_unmask(struct irq_data *data)
>  	if (WARN_ON_ONCE(data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type)))
>  		return;
> =20
> +	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
>  	switch (gpiochip->irq_type[data->hwirq]) {
>  	case IRQ_TYPE_LEVEL_LOW:
>  		val =3D val << 1;
> @@ -2614,6 +2615,7 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
> +	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }
> =20
>  static int airoha_irq_type(struct irq_data *data, unsigned int type)
> --=20
> 2.53.0
>=20

--mtbYkPphZS9xxI2V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcYtAAKCRA6cBh0uS2t
rDh8AQDf2K0ZyIVFOfiaFcb2upEDJTym5mn75+5yfuBUwIbDwQEAy6+xBXdeFA9a
ODNHJGawn7QD/t8bsT580S0tfTCaUAE=
=Yt6b
-----END PGP SIGNATURE-----

--mtbYkPphZS9xxI2V--

