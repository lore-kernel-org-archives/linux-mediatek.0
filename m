Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4014DC55174
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+lFjplQUImCFc3yxBvZxiknpiJ+7Q6rhfLRxBfmbEQ=; b=0EX+6xdxm80DO/R88BKVowGTnZ
	DzsHvKytkzZZ0Sganinrn7OUZ2Mm2obtbHiDgtZrs80j12Y5RkO21MEf00iNmk6AKlgpvWQ6FrfIu
	T6Z6jeqdGxeEccyl2UAhfzXAxsnA06GnHICl94gbBmBJdv2TX0pRYoZQ3M+Hij5gK7jheoQaL9+6L
	tcXSiCqjB2IWiwJWx3pydnWOdpTJ5SroaUs5qeFk15Bf4FTJvUX5vEC66XH3Nwu5BZ3qrBvC+56ux
	fcTTEKSWsWG8slYt4suOD0RjfA3m7od1JURbQbXfJ6wgSn2wyoXNjiueQP0S0OjGe+62MJeGCGfCb
	R53Z71zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraUn-00000003sQx-0FA2;
	Wed, 05 Aug 2026 12:13:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraUl-00000003sQP-2xkk
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 12:13:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B351401BA;
	Wed,  5 Aug 2026 12:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765811F00A3A;
	Wed,  5 Aug 2026 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785931995;
	bh=C+lFjplQUImCFc3yxBvZxiknpiJ+7Q6rhfLRxBfmbEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AGGkVtuHzgL2hdh8PJ1tGbhQo+wMTEV2VX1SswjVSEgXVGaOrYCzXuSbsYnZZkjZ/
	 +Q9c6pJntK9p6CL/6zWzvG7BQM5a0dgnzSgQTrbPf9WqMXHwblkL2wUSOpc5oAN2zo
	 ISlNEoPn91aae39J9Z85aicmxgZU4LlR6fIXLC56DwRAr/0b/hSCGcfQoI766JD2Cy
	 gHd1rAElSRn37q4yaySBthFUOyHX/9hxawdpCn4WR6Qerf73LmC+T68MY8tnoRMRuC
	 pSo8ws5bODPsEja6yQ3A9FV72Lr3fjJ2DKbJEwpcMQhqDmkWssS2J3y+wPrQl5DQlu
	 9qFXYX4SPt3WQ==
Date: Wed, 5 Aug 2026 14:13:12 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong value for PCIe reset pin
Message-ID: <anMo2J5vNucxUQ7X@lore-desk>
References: <20260805084143.3901-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cALPqJiXqOVi57wI"
Content-Disposition: inline
In-Reply-To: <20260805084143.3901-1-ansuelsmth@gmail.com>
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

--cALPqJiXqOVi57wI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The PCIe reset pin actually require the bit to be set as 0 to work as PCIe
> reset pin. When the bit is set as 1, then the PCIe reset pin act as a GPIO
> for GPIO44, GPIO45 and GPIO46.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 04b4424c688b..6409572c0a4b 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -1412,7 +1412,7 @@ static const struct airoha_pinctrl_func_group pcie_=
reset_func_group[] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_PON_MODE,
>  			GPIO_PCIE_RESET0_MASK,
> -			GPIO_PCIE_RESET0_MASK
> +			0
>  		},
>  		.regmap_size =3D 1,
>  	}, {
> @@ -1421,7 +1421,7 @@ static const struct airoha_pinctrl_func_group pcie_=
reset_func_group[] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_PON_MODE,
>  			GPIO_PCIE_RESET1_MASK,
> -			GPIO_PCIE_RESET1_MASK
> +			0
>  		},
>  		.regmap_size =3D 1,
>  	}, {
> @@ -1430,7 +1430,7 @@ static const struct airoha_pinctrl_func_group pcie_=
reset_func_group[] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_PON_MODE,
>  			GPIO_PCIE_RESET2_MASK,
> -			GPIO_PCIE_RESET2_MASK
> +			0
>  		},
>  		.regmap_size =3D 1,
>  	},
> --=20
> 2.53.0
>=20

--cALPqJiXqOVi57wI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCanMo2AAKCRA6cBh0uS2t
rBdvAP4nq6dzH7iLyJf2CZPFcV/zjU6EL+Hp7Uvjl04IAZKvIAEA/4h2d+AyfD+z
lFKjbycUQMhImimRpwNHPASCGbQO2Qo=
=lvz5
-----END PGP SIGNATURE-----

--cALPqJiXqOVi57wI--

