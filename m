Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE08FC54E76
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zV0G02cMCrQRq81pK9v8nqhJQd4GJKQxO8IHL1w4VzI=; b=v+60wr54j2NxyCH22VsqTdsVXn
	L21DYthlrbxmvLq0ciEbONjydjjTagPzJsyZSKrUm6/QA3OGNO2LA+7YojFJG2EemIb8fYSTLi5j7
	D5OpfaN+N6pTCTB2qah5ybvStm7xWhXZGEifnVHtQ47Pkr/PABwpzDkMK9CpTmZUKJOsBSrj9z3HN
	nEPQTBUHo3tgNp/CAJ98IMMgYciGXOmpzRteKnsgVVQjQXWfWDVUAHBNE7+ZFNR4VX5/TDvanY2D7
	ZB0AK7KKLYifWTiPOq9DH4XLZJETqqxctKBpkjMW4+/ioIYs+YTPpacUdfxPAvEzBVgilDaJmdwsT
	DYfFvRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4i5h-00AFLB-1w;
	Sun, 19 Nov 2023 13:44:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4i5I-00AFGd-1h;
	Sun, 19 Nov 2023 13:43:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E755960C40;
	Sun, 19 Nov 2023 13:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21239C433C8;
	Sun, 19 Nov 2023 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700401415;
	bh=Ykhh83S0xts5mnucfZ61RXaL6imVnzM3vTSGFUWTsa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBgH0TYwUMqPo6tZdkH+jYPvQ2mIcW8dvziUL8qxKahJ6syPgFV+fv+Rglv6l7Lcg
	 S8WhxfhryWuSjM7vAWlGDZIai0LdYjdYO5g6o4q9PHSRVJmTwEL7znjOA6Vv8HVIXw
	 3Tw7/Xa9DN4R7sjcGnFM79xx9QDeJsL6W256xcQ6PNXw1wt+8aSpfzf1guZ3xj3qiL
	 wkxT9IGAsXD99aYfaterIoN5gZQAOMMK+pFXJOslpMCqhp6keXI3VbwXOYwqHvh0eZ
	 oU94WN/djsPa8DX+Lg+/i/BAU4vfYM2tuG4MCjbuJH9/a++T95txhRmYUyxoMWjN/O
	 RnipX/RgBAvqA==
Date: Sun, 19 Nov 2023 13:43:29 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add Acelink
 EW-7886CAX access point
Message-ID: <20231119-jazz-wobble-6ff4985b1bf0@spud>
References: <20231117104315.9718-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A6mvgtPE8mST9StS"
Content-Disposition: inline
In-Reply-To: <20231117104315.9718-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_054354_347352_71C9E7D2 
X-CRM114-Status: GOOD (  14.46  )
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


--A6mvgtPE8mST9StS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 11:43:14AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index a5999b3afc35..cfdd3317edda 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -84,6 +84,7 @@ properties:
>            - const: mediatek,mt7629
>        - items:
>            - enum:
> +              - acelink,ew-7886cax
>                - bananapi,bpi-r3
>                - mediatek,mt7986a-rfb
>            - const: mediatek,mt7986a
> --=20
> 2.35.3
>=20

--A6mvgtPE8mST9StS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoRAQAKCRB4tDGHoIJi
0qibAP4nkr3gB60ji3RyS1MslpWLnKXqtCKvKSqNZX/SAsFg+gD/fl+6b2xL4ByG
u6k6OrAceh9G/2CLup3rwZX0wSf+5g4=
=rrzj
-----END PGP SIGNATURE-----

--A6mvgtPE8mST9StS--

