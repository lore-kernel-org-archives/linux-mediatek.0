Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545D6C53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMjqfnoPcf75IQ0mcpIkSvvJOXEWmCyEkKL3C5tZLHo=; b=lfZeQ3f27gYTJVd0eCkYpzhK8j
	R9i9q4jjiQvd3PIA0Dyhc0UL3l6otSB69WGyjwjOXbdVT6l6u66nZTPu8pFnPiohxXfoI5f0olkYE
	XWIVOGaiObd0xZHi5UbPOrQodDXRkNI256WlCR1JlTYmrj/6W7euyOGqllIcyb2q2VBBJIEiMJmRK
	zUDjgcw7Oj08RkdQBWpZ9h+8Fd2tYgaIq/DiYNwpN8i3jStJVjGgY0ngNnuxH4jlC1ro6ZS9lGK8B
	MNSK30KWryniNw71T+acMm7Fpe3kKbhc2EsimJnwjZeFJDEPOX9Rv0ELXBAionEmbY8ll5qZtmmT2
	Y2iBIG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG6E-00000002BP7-11g3;
	Mon, 27 Jul 2026 07:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG6C-00000002BOy-2E1m
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:50:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B26B42DEB;
	Mon, 27 Jul 2026 07:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BC11F000E9;
	Mon, 27 Jul 2026 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138608;
	bh=AMjqfnoPcf75IQ0mcpIkSvvJOXEWmCyEkKL3C5tZLHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MpCEi2V9bcWUzi4aGR9FZlqTmkAd+LRbJz+STOVqTCpZ4DRt/IPVpTQW8cEv2lWQ5
	 D/2FTtg/71Y8EKsAl9ZYVz+VzhIxR6eep0NawkexAf3LpwnP/Go8Kko0GR4XbEkWNJ
	 qnj/OAG9UuwaC1r6iFkIY1Mon8lqQO8gxgI3dmqxLtzMsc9e14NNgriWg43LivqsU3
	 9Th9KspphKz6eWXMuOFv1/Cv1uS5gEgXTlHrzJSb43W3ZqxXMkFi1AD6RpzMVWTKNT
	 39pALpQJpZbezOs/PKa/mE0K4Yo37SYJOe3I9OL13bwcAE0k4SocdrXPOg+bBD8dVo
	 Tk34uanyxrdVg==
Date: Mon, 27 Jul 2026 09:50:05 +0200
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
Subject: Re: [PATCH v7 04/34] pinctrl: airoha: an7581: fix misprint in
 bitfield name
Message-ID: <amcNrSeVi2oiOQUp@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-5-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xni9vt5h7PN3iW9a"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-5-mikhail.kshevetskiy@iopsys.eu>
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

--Xni9vt5h7PN3iW9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Fix misprint in bitfield name of GPIO_2ND_I2C_MODE register
>=20
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

I guess you can fix GPIO_I2C_MASTER_MODE_MODE too.

Regards,
Lorenzo

> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index abfb018f207e5..a3cfee6ace778 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -49,7 +49,7 @@
> =20
>  /* MUX */
>  #define REG_GPIO_2ND_I2C_MODE			0x0214
> -#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
> +#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
>  #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
>  #define GPIO_I2S_MODE_MASK			BIT(12)
>  #define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
> @@ -1026,8 +1026,8 @@ static const struct airoha_pinctrl_func_group mdio_=
func_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_2ND_I2C_MODE,
> -			GPIO_MDC_IO_MASTER_MODE_MODE,
> -			GPIO_MDC_IO_MASTER_MODE_MODE
> +			GPIO_MDC_IO_MASTER_MODE_MASK,
> +			GPIO_MDC_IO_MASTER_MODE_MASK
>  		},
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
> @@ -1051,8 +1051,8 @@ static const struct airoha_pinctrl_func_group an758=
3_mdio_func_group[] =3D {
>  		.regmap[1] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_SPI_CS1_MODE,
> -			GPIO_MDC_IO_MASTER_MODE_MODE,
> -			GPIO_MDC_IO_MASTER_MODE_MODE
> +			GPIO_MDC_IO_MASTER_MODE_MASK,
> +			GPIO_MDC_IO_MASTER_MODE_MASK
>  		},
>  		.regmap_size =3D 2,
>  	},
> --=20
> 2.53.0
>=20

--Xni9vt5h7PN3iW9a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcNrQAKCRA6cBh0uS2t
rBUpAP9NVeQoqX1obrWad58aOK2MAb6Ni7VTWYq6c5L9azHCMAEAztx97agV+lsZ
iEI1NU5G8HzeXnVSthu3pVqrNS36Eg0=
=A+h4
-----END PGP SIGNATURE-----

--Xni9vt5h7PN3iW9a--

