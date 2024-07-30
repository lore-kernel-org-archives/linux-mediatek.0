Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1849CC3DA7E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 12:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDaziH1MtSLYGRXtWwMyPiOVsZ+g1J1qRmL2O9uk/7I=; b=cMSYsJaBLw6i5Jx40aZ0++I+d2
	2qHRNCM3lr+QXBPBrxLHsIQ/GH2iB4XvT6g1pakpdigQhoWZVP1fPwVjhybv3E+N09ZzbYpwx/ZLz
	VwVyBIE5RV8qpF5FuplgichBbZ9mRCOlscqE2RkOe3ciIpjht3pNFcTTWUVXdgtZCNrDUx3+vk/qO
	TSSVbPnk5ZcP6aOlMcWCXM7vSkMaW/kCC/axPcinj/MN6H9zYvC3oCUGoMifgnQfNEjVcAafzYxC8
	gMkfaqxSQ60xkT2pcRVZA2ZTdgOJzWvBUbLM0bN4yda/oeF0nO4lXY0TCHkSbyZ7p1xHrTHQcVsYT
	hIX2DOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmC1-0000000F8GQ-2y3w;
	Tue, 30 Jul 2024 12:43:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmBY-0000000F88S-3DJO;
	Tue, 30 Jul 2024 12:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83507CE1000;
	Tue, 30 Jul 2024 12:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5372CC32782;
	Tue, 30 Jul 2024 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722343351;
	bh=bYnUpP7Mmu+3DjXN8Jp/cEq686gvZ7Y4PhqtstpNYYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHQw2keqogAbOhnbmPpqTqC3S6Uuj+59BEz1Cw6n6nEZd0uhhcl964PrjxPbj3Iia
	 vYuYUmvIbKbV/6u4yOe538iK9x6oaln80arKlUP2StxknSvZC91qlboQs1X9SFJdEf
	 6kBN0hHIjZzjkhMrRUD5pJnaZew/pBYCuE5NgjC3iivc4sKiS84A6uxEcAvc8TVxM2
	 b3crpyA/5E6KcjD9UXkJJSvLxPMrvy27NBU6fD7A8vrChiMAxIxG8QQl1zlyOn1xft
	 ydLW6FXls1JjAONqwikdnchXgfqhOfctK33mqEuKCh/LEno3WgYGxhwGr0BJ7yp5re
	 mFZYWjD60B9NA==
Date: Tue, 30 Jul 2024 14:42:28 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
	sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: Add
 airoha,en7581-switch
Message-ID: <ZqjftJJZpSa4_atg@lore-desk>
References: <cover.1722325265.git.lorenzo@kernel.org>
 <63f5d56a0d8c81d70f720c9ad2ca3861c7ce85e8.1722325265.git.lorenzo@kernel.org>
 <3d0e39a3-02e9-42b4-ad49-7c1778bfa874@arinc9.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rmJ3g8aJy3cwZr9o"
Content-Disposition: inline
In-Reply-To: <3d0e39a3-02e9-42b4-ad49-7c1778bfa874@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_054237_388192_3803F6FD 
X-CRM114-Status: GOOD (  17.54  )
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


--rmJ3g8aJy3cwZr9o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 30/07/2024 10:46, Lorenzo Bianconi wrote:
> > Add documentation for the built-in switch which can be found in the
> > Airoha EN7581 SoC.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml     | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.=
yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > index 7e405ad96eb2..aa89bc89eb45 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > @@ -92,6 +92,10 @@ properties:
> >             Built-in switch of the MT7988 SoC
> >           const: mediatek,mt7988-switch
> > +      - description:
> > +          Built-in switch of the Airoha EN7581 SoC
> > +        const: airoha,en7581-switch
> > +
> >     reg:
> >       maxItems: 1
> > @@ -284,7 +288,10 @@ allOf:
> >     - if:
> >         properties:
> >           compatible:
> > -          const: mediatek,mt7988-switch
> > +          contains:
> > +            enum:
> > +              - mediatek,mt7988-switch
> > +              - airoha,en7581-switch
>=20
> The compatible string won't be more than one item. So this would be a
> better description:
>=20
> compatible:
>   oneOf:
>     - const: mediatek,mt7988-switch
>     - const: airoha,en7581-switch
>=20
> Ar=C4=B1n=C3=A7

ack, I will fix it in v2.

Regards,
Lorenzo

--rmJ3g8aJy3cwZr9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZqjftAAKCRA6cBh0uS2t
rH5cAP93Dtt6PHl6bZl3bXLMM7y0eddjamO6oouR/zhyZJeRzwD5AfitMaRnL09b
PkLA9hXs4iAvS/UrWXjPkrQKBLxH1wY=
=b1Gg
-----END PGP SIGNATURE-----

--rmJ3g8aJy3cwZr9o--

