Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA0606A33E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hqk7b++y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDEP7fNU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CisNle0adgNt9jEGJ2fMfUGTiG/LllD/flOCUw5zy2k=; b=Hqk7b++yZvHjSWGGGF9SgV8hk9
	4bAdU4o4zm8bKGzHf47Hq0KUdW/Ly3i/g8bZdk53hQa1ElcmB0txWGOZkVWFLNmBLKOJXQOpcqKQT
	un+FhHHt7F2bLmVJirxKssnvcWY2vPlxhGv/FHWbm9gKGSay62VzGqYqcqSSWlM5hcp6RVTq8n+Bm
	z/5UhNe0SkkhExfBf+wgYaPXP5DA/wIJLRmsVZ/gdAfm8AhpXJtQ9utDGDF8hgvHvFkhdHSqGsQhN
	l4o5b6M3FkRhQyhnQLPlljfp+Ar5pyRlZpjDYRkMXmJRfib4lXY9UuY4FADAKvB2xhy1ZsDijDdEv
	SGWSJBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Uf-00000006UCb-0CZy;
	Wed, 11 Nov 2026 11:27:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Ue-00000006UCO-1TIF
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 11:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA09F44E2A;
	Wed, 11 Nov 2026 11:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B781F00A05;
	Wed, 11 Nov 2026 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794396475;
	bh=CisNle0adgNt9jEGJ2fMfUGTiG/LllD/flOCUw5zy2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cDEP7fNUn48bZ8kLQC59leIB1HUlPzXU9x0z/rVshW/4/IhNLfGz0LFz2MKWLZtjN
	 Rhaa1BTvjS0PZGC7S1aBu2zPXF4bFZ4kTkFy5YwKhNUAGlgxv47qLbbLVYuawmWSW3
	 SgYu6TaGkK05kRQlHnMl3TMNMuyUTuq9ZYzHGWU96aKggH9wcUg86GY43Z40a4yMWt
	 Z2uOBZ+3qYE3Ygkydpzp/Y4jFA5vQIGwvPdzbBxEctfRgYK6HANvJqzExjUQYpvy2e
	 y+gKSjVR87W1lenne2SB9R/VbDZe6UB0VabfdZ/TAv89evqIFAiZDAZREl01XnVR1X
	 xXesPLbn/i0rg==
Date: Wed, 11 Nov 2026 12:27:53 +0100
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
Subject: Re: [PATCH 3/7] pinctrl: airoha: make the chip SCU optional
Message-ID: <avRROTmy9oFLwJCS@lore-desk>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-4-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A3sZ98eitumN/6Hf"
Content-Disposition: inline
In-Reply-To: <20261110173941.301478-4-john@phrozen.org>
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

--A3sZ98eitumN/6Hf
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
> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f9ae4020b764..9116d3ded258 100644
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
> +	if (!data->chip_scu_compatible)
> +		return NULL;

should you move this check after the first lookup?

Regards,
Lorenzo

> +
> +	map =3D syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu"=
);
> +	if (!IS_ERR_OR_NULL(map))
> +		return map;
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

--A3sZ98eitumN/6Hf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavRROQAKCRA6cBh0uS2t
rKZKAP4hQfDss2hwRFv5+/p8aTHT0BSzjyISfuDUraz+Z6e5wQD/REqJy29vBUtC
g8T6MzxN+vmO2e/FtddtNey+mQe36wU=
=dBSt
-----END PGP SIGNATURE-----

--A3sZ98eitumN/6Hf--

