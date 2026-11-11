Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C574606A334
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LSJp54XX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zr3nySW5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nB1flizO6uB7iFQMRV+Ko/XwuLe+88pnNTnOA5soo+4=; b=LSJp54XX8ZLN9ichSIzsf1QrpT
	rT0gYtGXAHaruCHJEMKt0hXEMamldV6qgy3jUiEI2up+001nlBnju4wRtHe2YIY3KIW0Qd6GAw2hI
	lhd0FYARhRn5rO51qaug0NNjiyyiy3iqukpiCYJhpcKLS9uiZ6/ZhTqJqr2SA6SnjoI7rxik97G48
	Q1IHgEf2D9CCm7NN5K+SOnbpRIBQ56Y/I+XtX57h6+DnGU1a8xkk9qOG9Nz5tiGkLp7MdjQcIoCUf
	v51z1tNP3pndrF6EH5KHhXPnaWN67KTzckZ877k5wyOUj+ZOQ4cYgBMRGJ0aty+TVdLWs+E+8cfj0
	AimMTT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6WK-00000006UN5-0x6b;
	Wed, 11 Nov 2026 11:29:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6WJ-00000006UMt-1JGE
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 11:29:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CBDFB42352;
	Wed, 11 Nov 2026 11:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368781F00A05;
	Wed, 11 Nov 2026 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794396578;
	bh=nB1flizO6uB7iFQMRV+Ko/XwuLe+88pnNTnOA5soo+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zr3nySW59a+Dg0cCtBbxm31VtBek5LH8Au8VdWiweBNt9mLGGDAyMwFVhClskAM2s
	 N8DyNG8L3N944lERbZsuts/GfyxZxjydKVa1O33ORPvSwo2VJiYjKzwbDIq7P/MzXH
	 4tNvSiQvS+jlXPMt+vepqCAiBt/sz8vZKHDmBFs+KrBGH3lx8o38PbIPYmlaoyuFS/
	 BwEFPBgGzkvhjoKXG+zI7VpnBGM+8LahX5XbYTf3r2XREjbNYo7fao0igHRR6p87Yg
	 58buqCkC7qy962NY7yKUT4KpI5U93yWBc1pWvWt6HEa6uAn+WlB3djrKHXN4xTBS+q
	 oSmryLscNI30g==
Date: Wed, 11 Nov 2026 12:29:36 +0100
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
Subject: Re: [PATCH 6/7] pinctrl: airoha: move the GPIO register offsets to
 the common header
Message-ID: <avRRoCRYZnhx1dnk@lore-desk>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-7-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EoDU/m3tfAAmliEx"
Content-Disposition: inline
In-Reply-To: <20261110173941.301478-7-john@phrozen.org>
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

--EoDU/m3tfAAmliEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The GPIO register offsets are private to pinctrl-airoha.c, which builds
> the shared 64 pin register table from them. A SoC with more GPIO banks
> needs its own table, built from the same offsets and its own for the
> extra banks.
>=20
> Move the offsets to airoha-common.h so the SoC drivers can use them.
>=20
> No functional change.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/pinctrl/airoha/airoha-common.h  | 20 ++++++++++++++++++++
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 20 --------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/air=
oha/airoha-common.h
> index adfce89493f0..dc9b897ea77c 100644
> --- a/drivers/pinctrl/airoha/airoha-common.h
> +++ b/drivers/pinctrl/airoha/airoha-common.h
> @@ -34,6 +34,26 @@
>  #include "../pinconf.h"
>  #include "../pinmux.h"
> =20
> +/* GPIOs */
> +#define REG_GPIO_CTRL				0x0000
> +#define REG_GPIO_DATA				0x0004
> +#define REG_GPIO_INT				0x0008
> +#define REG_GPIO_INT_EDGE			0x000c
> +#define REG_GPIO_INT_LEVEL			0x0010
> +#define REG_GPIO_OE				0x0014
> +#define REG_GPIO_CTRL1				0x0020
> +#define REG_GPIO_CTRL2				0x0060
> +#define REG_GPIO_CTRL3				0x0064
> +#define REG_GPIO_DATA1				0x0070
> +#define REG_GPIO_OE1				0x0078
> +#define REG_GPIO_INT1				0x007c
> +#define REG_GPIO_INT_EDGE1			0x0080
> +#define REG_GPIO_INT_EDGE2			0x0084
> +#define REG_GPIO_INT_EDGE3			0x0088
> +#define REG_GPIO_INT_LEVEL1			0x008c
> +#define REG_GPIO_INT_LEVEL2			0x0090
> +#define REG_GPIO_INT_LEVEL3			0x0094
> +
>  #define AIROHA_NUM_PINS				64
>  #define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
>  #define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index a805f542bc7b..8f901f251c00 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -7,26 +7,6 @@
> =20
>  #include "airoha-common.h"
> =20
> -/* GPIOs */
> -#define REG_GPIO_CTRL				0x0000
> -#define REG_GPIO_DATA				0x0004
> -#define REG_GPIO_INT				0x0008
> -#define REG_GPIO_INT_EDGE			0x000c
> -#define REG_GPIO_INT_LEVEL			0x0010
> -#define REG_GPIO_OE				0x0014
> -#define REG_GPIO_CTRL1				0x0020
> -#define REG_GPIO_CTRL2				0x0060
> -#define REG_GPIO_CTRL3				0x0064
> -#define REG_GPIO_DATA1				0x0070
> -#define REG_GPIO_OE1				0x0078
> -#define REG_GPIO_INT1				0x007c
> -#define REG_GPIO_INT_EDGE1			0x0080
> -#define REG_GPIO_INT_EDGE2			0x0084
> -#define REG_GPIO_INT_EDGE3			0x0088
> -#define REG_GPIO_INT_LEVEL1			0x008c
> -#define REG_GPIO_INT_LEVEL2			0x0090
> -#define REG_GPIO_INT_LEVEL3			0x0094
> -
>  #define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
>  	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
>  				(pin), (val))
> --=20
> 2.34.1
>=20

--EoDU/m3tfAAmliEx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavRRoAAKCRA6cBh0uS2t
rNtIAP9YA+4HYdVSVijK5Kt60x1yVJSHf4hv44tps1dOQDZXmwD/eewSFReRqe8v
dLDBFNkJ2t1DiU6CZEhLsdPNd4eK7w8=
=gyZ2
-----END PGP SIGNATURE-----

--EoDU/m3tfAAmliEx--

