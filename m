Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D299C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp5idYoo5HKNzHclYuJOpAZglxJbH2EMsHoo2Uhpc0U=; b=CaFmf9lEd8kmlfC1+RtJpt3mK6
	gECaPhS4zMZsdZRQpXgL9Wgox7NzfOsaXiajxirBT55LsPsnRqr0HQLTPFng/wNiOG4s/JM9Zv6Bv
	MI3/JVCwY3Hq/Et9C46mHGwzskknoEId9G+PljccjIJ7xicUUS3/BjYr5UGV7GX4FXKyNkd8dKxx3
	3buLm8ee1X3hrGipTJbFkgoo4KsGxKRb1IrRO+r4PLBEQWYpcy8rV+9oapydj3TWpBdUEB0o2EBJH
	qRR1OEWgGfuChD9+pEMY7FeSRJgqn1nESPcRIjvkiPX155Zu6NgLoiskFHGehc4Crvwvx6XwPgO+C
	1GDdoVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGmt-00000002F8f-3upz;
	Mon, 27 Jul 2026 08:34:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGms-00000002F8Z-2ROY
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 08:34:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1877243832;
	Mon, 27 Jul 2026 08:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7031F1F000E9;
	Mon, 27 Jul 2026 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141254;
	bh=Lp5idYoo5HKNzHclYuJOpAZglxJbH2EMsHoo2Uhpc0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1pm4pcjgTIKnC77MPF/SNbyyCQLcjkPLUxTvSoWyDV89caDhgo0+xc1MyD1/z/SP
	 H/5iUi/qA7hWFjt4bqEwbDfuf1h8CDJeDab4qs/7lugrHfAk9NK4iT8c4oGxYGM8rD
	 lMoEbgYbtY1jrMQ9l0N3+kuC6CLwqwCTElXqxsvKjWSCpSIG4sHXY7vENygcyk1cx3
	 EJ8zZR0ealaf70YDCzsaRtu+2I4OeuH8WLnzh+kDFx7NvXu39y7dAQdTsS0aX9S8fl
	 l0sreFhk1AvyTnTYoTMQNoep6Uljh/ehIAIsD647bj2ejQ8S1sV/LU0P62N1sXXD3l
	 h+j2LKv0Q4/AA==
Date: Mon, 27 Jul 2026 10:34:11 +0200
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
Subject: Re: [PATCH v7 16/34] pinctrl: airoha: add missed IRQ resource helpers
Message-ID: <amcYA-tt4BziTjfW@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-17-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UFrN0mJLqKNpHxUR"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-17-mikhail.kshevetskiy@iopsys.eu>
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

--UFrN0mJLqKNpHxUR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Without hooking .irq_request_resources, gpiolib cannot set
> GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
> userspace or another driver to reconfigure an active IRQ pin as an output
>=20
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/airoha/pinctrl-airoha.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index f85941ccea560..d218a1f01648b 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2676,6 +2676,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  	.irq_mask_ack =3D airoha_irq_mask,
>  	.irq_set_type =3D airoha_irq_type,
>  	.flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
> =20
>  static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
> --=20
> 2.53.0
>=20

--UFrN0mJLqKNpHxUR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcYAwAKCRA6cBh0uS2t
rPaEAP4p1fD3RPtbM1JEPT32QqUOEtELuFm/RjAredm8P4rzUwEAq7d2OKZgqxWm
k44l5LoEQqxt7PUXpQCB40sgQUkeGw4=
=dlSW
-----END PGP SIGNATURE-----

--UFrN0mJLqKNpHxUR--

