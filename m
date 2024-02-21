Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAB1C48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9T6yin2cQSen82iTGuySMqCNthl64H3KmcD937eh61k=; b=aJ+HM9TAjBHo779aSttJZDPRTD
	xAQHU6+uWps2WbIr1XIR/uoBbysCUPMRoK20aJwNVIBoklEAdH9sBLI5M8/kHVHj12y3Hi7c88gtD
	bJIXl1pW//FEvk/N/9SadKczp+4iTqFd7/f+m73y9xEr8brn8zHBf6qy39H2u0h1WoF+8gSWoJOLg
	/8c0JeeBdkegHBu2GlzgYUub7IHCmlh4Ok2q3BOKo7McfbPnf7atLdpI1+FjRwWX6Hk/2NpRq9R2o
	0s+q6Cf789mUryilYnEmtkCSMbungxNgktC9OlPi/uSZIYRrUdb1a/BG64zBqQTzKZXS0qo1/B/ap
	331C+n4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcs38-00000002Ekk-1lJt;
	Wed, 21 Feb 2024 19:14:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcs2F-00000002Ef0-1yu6;
	Wed, 21 Feb 2024 19:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CB0E1CE11C4;
	Wed, 21 Feb 2024 19:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE581C43390;
	Wed, 21 Feb 2024 19:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708542817;
	bh=QaruHLDI79GZ001Bdc61NjMdRzFiiC4zCa5MLuC+OhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJb4n2U2eZHX1cSTemhY3vzSZ8HoBtnsojjEptGF8wbso+P5TE9uhTBpMpkeL1GvI
	 Yaiyai1CRkyAo1EQ/5Pi4YpBzfy5miGL98ylum1jL/ytB5iJF5/eFlTbZ/Eq4XrcCj
	 8KfunBY3QTsx99wqY3IDBZcyOeanxitmA9sqA0me9tPOVe9k7BYwnlHha/16b7jUm/
	 oZZMlTlZa0aqrjI3LUoDtY7JAlJmj/zTfRYTOTLY5uL/UKoVpATo20M9AyHDDC3xs5
	 Ek1wiqJij6Wl8TVjb58XQdL5/rvVv01OWBcEN5miN57ilxuC66mNK8h0Gx89dLIZoN
	 6Du0hDSya4FIQ==
Date: Wed, 21 Feb 2024 19:13:28 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: mt76: allow all 4 interrupts
 for MT7981
Message-ID: <20240221-sanction-bunt-c109f5b590ad@spud>
References: <20240221081238.24775-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bhWJY3qBE52/XE2r"
Content-Disposition: inline
In-Reply-To: <20240221081238.24775-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_111342_456117_F6B3F2D8 
X-CRM114-Status: GOOD (  13.99  )
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


--bhWJY3qBE52/XE2r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 09:12:38AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> MT7981 (Filogic 820) is a low cost version of MT7986 (Filogic 830) with
> a similar wireless controller that also supports four interrupts.
>=20
> Cc: Peter Chiu <chui-hao.chiu@mediatek.com>
> Cc: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76=
=2Eyaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index 0c6835db397f..eabceb849537 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -226,6 +226,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - mediatek,mt7981-wmac
>                - mediatek,mt7986-wmac
>      then:
>        properties:
> --=20
> 2.35.3
>=20

--bhWJY3qBE52/XE2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdZLWAAKCRB4tDGHoIJi
0kONAQDqsYPyk+Xh1pFriAlkVoN7c20zpvx6Y29oSQlblZCUeAEAxoXzl21csZ6Z
PWCKlnugWhjOIi8PNZCuB7zz8zEZSQ4=
=2GfW
-----END PGP SIGNATURE-----

--bhWJY3qBE52/XE2r--

