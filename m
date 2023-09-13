Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DA9EDEC69
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiKtFd1DEgBHmf+gbOWd0NK9kcYiJm99R9uXUfWVKBs=; b=oKaanMtRNsNdYybs7jg9xnizI5
	XiQrQ8TMcHOKGhKscjATFhUZEjthebGNoLCH1O8+aX7ttvC1nz3EXBzaE3Sz9/0q4twZyvlWFIuO3
	0416jYmwECC/7DD6j1iRFFzxUHjfMnuDOlNuljKgU1V/z1mtVt7NtPcxlmK2jtnR8FZ9WkaADRvqu
	34NwCqcBIIXPnW/ZaqK3y+mG3gTdeCtByHI8U863URgkCGyTUggXdo5uH7WTPNUoF2H0HNdLPEYht
	Hx27mH3Rzw3O3ugINfCDeXyHKwRCY5KOK5Ij1P1LiVjbQTYepLg2VJdokUAg8Yi7K735a3L2wtsvU
	CoLhqkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQyx-0067sv-08;
	Wed, 13 Sep 2023 14:36:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQys-0067rt-0v;
	Wed, 13 Sep 2023 14:36:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B82AE6198E;
	Wed, 13 Sep 2023 14:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACA5C433C7;
	Wed, 13 Sep 2023 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694615797;
	bh=l/HLN/NV+mFI79hNIP6t/1/MsWeZvJq9VBZFuP7L0SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aI/4Xcwr+/SuDZ5RkIVFKe9vn9OzdOumSxTas1jMNhT+/73O1+a0lXXTJBML0z3LU
	 StRAQNvoVbDofRUBdveADi1CI+u4Yy9CSzbWb7bJHILn3duxC5skYh7TAWTQMg6JuZ
	 CKVkcDM0YAIIEGVFsll5G9mqeKOl+gfSnuNjVqhGg9vN7LMEvGTOJEGCOLRPSv/Y6x
	 IQ0arNn2a3ROxugi/vYgxqg/vJ88kF8HvkMdLzawcLJ21Vmn+1E5gKwIYuTz8jFmMu
	 PpnrwSAE6hT8PmjI3unD7rnKGBRJGpqX4WAyZZFNtLoWCSzCtloCa7roZmHcudeAMN
	 JleoCQvuhV7Nw==
Date: Wed, 13 Sep 2023 15:36:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8390-evk
 board
Message-ID: <20230913-scoop-agnostic-66e65d426134@spud>
References: <20230913040449.29560-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iUv/m+HGu/hljI90"
Content-Disposition: inline
In-Reply-To: <20230913040449.29560-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_073638_568546_F60DFB5A 
X-CRM114-Status: GOOD (  21.65  )
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


--iUv/m+HGu/hljI90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

For $subject, the "dts: " can be dropped.

On Wed, Sep 13, 2023 at 12:04:48PM +0800, Macpaul Lin wrote:
> 1. Add compatible for MT8390.
> 2. Add bindings for the MediaTek mt8390-evk board, also known
> as the "Genio 700-EVK".
>=20
> The MT8390 and MT8188 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.
>=20
> The booting process and configurations are managed by boot
> loaders, firmware, and TF-A. Consequently, the part numbers
> and procurement channels vary.
>=20
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> dependencies for v1:
>  - This patch should be applied after the following patch set
>   - mt8365's bindings
>    - https://lore.kernel.org/linux-arm-kernel/20230912092444.31635-1-macp=
aul.lin@mediatek.com/T/
>   - mt8395's bindings: v6
>    - https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@medi=
atek.com/T/
>   - mt8188's bindings
>    - https://lore.kernel.org/lkml/a4e1a80ebd19896410f50b0297e05dce06fb47c=
c.camel@mediatek.com/T/
>=20
> Changess for v2:
>  - drop description for multiple boards
>  - update dependencies with the following patch sets
>   - mt8395's bindings: v7
>    - https://lore.kernel.org/linux-arm-kernel/20230913032057.3197-1-macpa=
ul.lin@mediatek.com/T/ =20
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 0248bb458180..3968d5934fa2 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -252,6 +252,11 @@ properties:
>            - enum:
>                - mediatek,mt8365-evk
>            - const: mediatek,mt8365
> +      - items:
> +          - enum:
> +              - mediatek,mt8390-evk
> +          - const: mediatek,mt8390
> +          - const: mediatek,mt8188

This is prob a little unusual (at least I don't think I've seen a patch
doing this so far), but the mediatek maintainers can do as they wish
here I think.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>        - items:
>            - enum:
>                - mediatek,mt8395-evk
> --=20
> 2.18.0
>=20

--iUv/m+HGu/hljI90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQHI7wAKCRB4tDGHoIJi
0ll7AQDZ+UG2u+qicKq6nOFt/uOuzVVJA4Fv1p7iu8KWnBvSIwD7B0k3SXfuHDhe
2TnPbFUp4xoHPLJaJt4Oe/zhg3/Y/Ak=
=ky4l
-----END PGP SIGNATURE-----

--iUv/m+HGu/hljI90--

