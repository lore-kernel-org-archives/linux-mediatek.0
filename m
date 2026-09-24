Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BC7C98318
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HS6m04rT3dOvoL5x89+MtBS0pBgWi1yvccw8gpPQtuk=; b=DU7oReLG/4R10Mm6ytwBp7Ia0P
	xvcpDHUjUbOxbk27Hh3oA0vtbG0/ytOPNAsRvUPrpw5HzbdabXDCLjIPv+WlNmJ3vgNHwWfrcahnU
	fGlFn3bYs5XIhmMArT7QtdVkxARGrF50lq9+QbKKj+whddwxmMar4RpZkApJ8k/dkJ7eKQZNFWmWO
	afwV2qX/WtY4DJt/Kfv0uWdAaXvgngstqNriU7NN53MgZh/JjIwbLP2zV4CjhDSwljVgjLTb+7cw6
	CNQqeea6kEz9nGEJfzbnby00OB55G7Tdyg0dJjZBDNKex/2fkdPNfniZGwg8hQiYdSvi3OtCLGsem
	1X4H0Q0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nFj-0000000BjdZ-01X9;
	Thu, 24 Sep 2026 17:28:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nFg-0000000Bjcv-2oPE;
	Thu, 24 Sep 2026 17:28:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0411601DE;
	Thu, 24 Sep 2026 17:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3321F000FF;
	Thu, 24 Sep 2026 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790270935;
	bh=HS6m04rT3dOvoL5x89+MtBS0pBgWi1yvccw8gpPQtuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BGx005GdlIlQyudQ3+InR44vBRLyWtMrFpW0ok1xe5xh0z41MLv6BY/xnAsCvAdx9
	 CaCM5KZpJGUK9g5ASRub06TkGcCGuXz2emECuei+BOaeeQIdQgHuJi9OyP5BxJGOOu
	 l9lSWMxrYVNufHoRn61XaIGels3P6tGxDaY4zjq3VybLW3uUm+2Vmr2pDKP1FJ8qYe
	 /ENyDmcR2m8tS8Yz8b94LIU2f1g1yV+kZt82K6NrRq+NAcVm44+MnfF4SnRu+iBP9o
	 xs/x7lgGEKcci/p5PwP1o+IibSeUiQPssyXzbyTYTMP+G3z6h6oXuGoHvOXSMlIhEY
	 7+L0HWA1fzntw==
Date: Thu, 24 Sep 2026 18:28:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Tim Kuo <Tim.Kuo@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	Sky Huang <Skylake.Huang@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: mediatek: add mediatek,spi-ipm-v59
 compatible
Message-ID: <20260924-patriot-stipend-764fd2d3593a@spud>
References: <20260924031211.2199921-1-Tim.Kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DO88kflOB9JUgeoi"
Content-Disposition: inline
In-Reply-To: <20260924031211.2199921-1-Tim.Kuo@mediatek.com>
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

--DO88kflOB9JUgeoi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:12:10AM +0800, Tim Kuo wrote:
> The IPM v59 SPI IP differs from earlier IPM designs, most visibly in the
> tick delay field of SPI_CMD_REG, so it needs its own fallback compatible
> rather than reusing "mediatek,spi-ipm".
>=20
> Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.ya=
ml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 3bf3eb1f8728..08a3497b03dc 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -39,6 +39,10 @@ properties:
>                - mediatek,mt7988-spi-single
>                - mediatek,mt8188-spi-ipm
>            - const: mediatek,spi-ipm
> +      - items:
> +          - enum:
> +              - mediatek,mtxxxx-spi

NAK to anything like this with wildcards. Put a real device here please.
pw-bot: changes-requested

> +          - const: mediatek,spi-ipm-v59
>        - items:
>            - enum:
>                - mediatek,mt8196-spi
> @@ -55,7 +59,6 @@ properties:
>                - mediatek,mt8135-spi
>                - mediatek,mt8173-spi
>                - mediatek,mt8183-spi
> -
>    reg:
>      maxItems: 1
> =20
> --=20
> 2.45.2
>=20

--DO88kflOB9JUgeoi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVd0gAKCRB4tDGHoIJi
0lbXAP99qejd5aXdHbNXFotyiWbXU2pBSVj475K+swxGScOm2QD6AoVaFfs7Dugz
8SX/SSAPox6qrQZkU8IyXBtgE0Eoogk=
=NBrN
-----END PGP SIGNATURE-----

--DO88kflOB9JUgeoi--

