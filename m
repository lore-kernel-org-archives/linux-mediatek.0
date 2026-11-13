Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3B1606A88A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=39iOTNWO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ms6yiLRJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QTwJUCLQ4QDDRVCFkenEQUWSKSxI4hDWzNhWkpHZXDo=; b=39iOTNWOOrCJJMy/ONKkgWd/RC
	LJy3ppu2+CdxaXKbkMGQZeOmbot7AO374A5keMlkgb1Veb7zCmozHL3Z3XghAfwAXQpLAkYiIIDXn
	sJbHXBk246AuK/+rRHYhgzFq/NTvTx5+9xD+mRrRYbjF6aV49CS6wSZAQ/32eAVOzmcfd1e11zE9i
	PqtHnJL6HaHcF9PDhg7waXHq1aaTEJPsPcVxJ2/RIvXyHaWtlH3tOSfcfM0LSWidjWW9k6pfg1OSO
	rhvvoHrivahGRBFwY6TQVHsJV04uPPz5fjUreKBk7jcGKOPVenzcYaOCdSzi71q3mJVDdnbIudYER
	Lmo7LrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmOy-0000000Bzsr-3EWq;
	Fri, 13 Nov 2026 08:12:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmOx-0000000Bzsb-2NYZ
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 08:12:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0970544819;
	Fri, 13 Nov 2026 08:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A431F000C4;
	Fri, 13 Nov 2026 08:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794557570;
	bh=QTwJUCLQ4QDDRVCFkenEQUWSKSxI4hDWzNhWkpHZXDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ms6yiLRJV1A7ao0qEyOiSOl6jWnqQL077X6wZ/VPW/ltZ+LN5MQWkirGEzXoQ9g6P
	 gMRfxTHd/R1Sb7AInWpUEFHWO0OYcTCnmVEVbwCJrqzLq4hyGY3O0cUrYM1Fo42cYT
	 SlR4Ny8xWLw32tMYSenUTkJjj7y/vDGrBzbi8VNroWMzPoMOfC+sHK7Ys44XHQWZoh
	 xA4qs3LkjgzB7X3dTqAdcP8hNJ2dSoXXn1a7yCFweZjZocx6xEKTkgRnS6y0IqjV92
	 L13JlnXQqmewix+cA2tLDchmcskFjL/I9hXzb3iWnA0vg5qwpEIMd9qAQmEqofp2m3
	 M1dZMtrrjTfsA==
Date: Fri, 13 Nov 2026 09:12:48 +0100
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
Subject: Re: [PATCH v2 3/7] pinctrl: airoha: make the chip SCU optional
Message-ID: <avbGgANYSs_0mXSB@lore-desk>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-4-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="POY+md8lzvHs8Old"
Content-Disposition: inline
In-Reply-To: <20261112185941.1316112-4-john@phrozen.org>
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

--POY+md8lzvHs8Old
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> A SoC that muxes every pin through the IOMUX block and describes no
> pin configuration has no use for the chip SCU. Skip the lookup when
> the match data names no chip SCU compatible, instead of handing a
> NULL compatible to syscon_regmap_lookup_by_compatible().
>=20
> No functional change for the existing SoCs, which all name one.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> Changes in v2:
> - Look up the airoha,chip-scu phandle before the check for a chip
>   SCU compatible (Lorenzo).
>=20
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f9ae4020b764..5ae0c49e491a 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -833,6 +833,22 @@ static const struct pinctrl_ops airoha_pctlops =3D {
>  	.dt_free_map =3D pinconf_generic_dt_free_map,
>  };
> =20
> +static struct regmap *
> +airoha_pinctrl_chip_scu(struct device *dev,
> +			const struct airoha_pinctrl_match_data *data)
> +{
> +	struct regmap *map;
> +
> +	map =3D syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu"=
);
> +	if (!IS_ERR_OR_NULL(map))
> +		return map;
> +
> +	if (!data->chip_scu_compatible)
> +		return NULL;
> +
> +	return syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> +}
> +
>  int airoha_pinctrl_probe(struct platform_device *pdev)
>  {
>  	const struct airoha_pinctrl_match_data *data;
> @@ -853,12 +869,9 @@ int airoha_pinctrl_probe(struct platform_device *pde=
v)
>  	if (IS_ERR(pinctrl->regmap))
>  		return PTR_ERR(pinctrl->regmap);
> =20
> -	map =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip=
-scu");
> -	if (IS_ERR_OR_NULL(map)) {
> -		map =3D syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
> -		if (IS_ERR(map))
> -			return PTR_ERR(map);
> -	}
> +	map =3D airoha_pinctrl_chip_scu(dev, data);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> =20
>  	pinctrl->chip_scu =3D map;
> =20
> --=20
> 2.34.1
>=20

--POY+md8lzvHs8Old
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavbGgAAKCRA6cBh0uS2t
rMagAP9vIckwK7ZzT4XVKJo4N/vp6QFYcjb5yeECo6nkS7d/wQD+MyIrZ6oDZE9i
KO3RZTRO2FQ4p3pdodUIrZlYuIOKyQg=
=hiZg
-----END PGP SIGNATURE-----

--POY+md8lzvHs8Old--

