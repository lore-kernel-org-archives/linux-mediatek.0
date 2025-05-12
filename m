Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA42C3ABCB
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 May 2025 21:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZZilhhfR6UIIAZr6pdD8yvOdyyQhH84LHh22Ppz/fk=; b=4Pd6kc235NG+VFpOw9MmZg0APD
	yEszZZtm3EuydygE9tEkZvCprNHPAI4zwrnig8aowZveQeayGVkTkVdTOBEO+N0aJNcCVUdq+iBjI
	fltmNfqDj2ig1liQtnRRt11u53hI/sSYj52UzrjzTVjxramnuqSzMycy9y/fri5Zssl7WpS76Q/Qq
	PPvfOvP1vxrVwnT1AHmTUc7t0c9kdiOmIZoWDYa8ZuzMRTe2ua0alT4eLfd/L1KZpWUeoeB7Y7GCV
	xtt3oJNQqzRxxBZ+583fRjhnoVWjUNhkC0z4qK0XgAPx+76YM2XXbqiNWWpfs5jIr/hCdHY8DiypR
	EyFBaByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaJ3-0000000Ah0i-0Ni2;
	Mon, 12 May 2025 21:03:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaH0-0000000AgmM-0WHe;
	Mon, 12 May 2025 21:01:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B6C4A4AFE3;
	Mon, 12 May 2025 21:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D88C4CEE7;
	Mon, 12 May 2025 21:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747083676;
	bh=LKLLONeCVjQVAaNx8UdwNrH4MsosiV3gnDGhpSa48kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnnkW34rYr5Yyflxu0il8Q6hxkNKCrMwwjOkRS9FklhqXnePrp6HXUjGqvpL4XveL
	 0TQtB92rfaDcCOH9e1pk1D4ic/agrs6hwpXMPFHudeKeZfQv6yDSJqQ/pKThu+ODJl
	 +ZLPwdtj02aYTXg3oHIzEKxV4sVVl8qKceifsWcIwomKVeXCId61MWxQOtp6u4lRVv
	 CgKLLVTRCdXXttrvq7J0fBw19etyehXiK43NerTW3Pka1615TKQTSJ1dvAKD0XCPLK
	 Z5sSDHt4VOVGJ821FN9XRSa6rlwy8iN4fBlbq+MKhSamPyjSZ1KDZxsM+b72sDA1k6
	 U3GTEQA7oIZDA==
Date: Mon, 12 May 2025 22:01:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 01/14] dt-bindings: net: mediatek,net: update for
 mt7988
Message-ID: <20250512-spooky-overbuilt-abc946ba1f55@spud>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-2-linux@fw-web.de>
 <20250512-nibble-freemason-69e0279f2f99@spud>
 <05760B5E-955E-4E0E-9B69-E762783CC37B@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ihom2EqWEYhuIF8/"
Content-Disposition: inline
In-Reply-To: <05760B5E-955E-4E0E-9B69-E762783CC37B@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_140118_300004_A04AB0A7 
X-CRM114-Status: GOOD (  21.13  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--ihom2EqWEYhuIF8/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 07:33:22PM +0200, Frank Wunderlich wrote:
> Am 12. Mai 2025 18:21:45 MESZ schrieb Conor Dooley <conor@kernel.org>:
> >On Sun, May 11, 2025 at 04:19:17PM +0200, Frank Wunderlich wrote:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >>=20
> >> Update binding for mt7988 which has 3 gmac and 2 reg items.
> >>=20
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >> ---
> >>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b=
/Documentation/devicetree/bindings/net/mediatek,net.yaml
> >> index 9e02fd80af83..5d249da02c3a 100644
> >> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> >> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> >> @@ -28,7 +28,8 @@ properties:
> >>        - ralink,rt5350-eth
> >> =20
> >>    reg:
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    maxItems: 2
> >
> >This should become an items list, with an explanation of what each of
> >the reg items represents.
>=20
> I would change to this
>=20
>   reg:
>     items:
>       - description: Register for accessing the MACs.
>       - description: SoC internal SRAM used for DMA operations.
>     minItems: 1
>=20
> Would this be OK this way?

Ye, that looks good.

>=20
> >> =20
> >>    clocks:
> >>      minItems: 2
> >> @@ -381,8 +382,12 @@ allOf:
> >>              - const: xgp2
> >>              - const: xgp3
> >> =20
> >> +        reg:
> >> +          minItems: 2
> >> +          maxItems: 2

You also shouldn't need to set maxItems here, since the list has 2 items
total.

> >> +
> >>  patternProperties:
> >> -  "^mac@[0-1]$":
> >> +  "^mac@[0-2]$":
> >>      type: object
> >>      unevaluatedProperties: false
> >>      allOf:
> >> --=20
> >> 2.43.0
> >>=20
>=20
> Hi Conor
>=20
> Thank you for review.
> regards Frank

--ihom2EqWEYhuIF8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCJhlgAKCRB4tDGHoIJi
0np2AP9tRdqvR8H53faGqXax224YS7YArSQXFuynwo25eICEhgEAntebUayynsz/
+miUO3kJllRjEAYIKIHnvI4YCHk0Wws=
=8MP/
-----END PGP SIGNATURE-----

--ihom2EqWEYhuIF8/--

