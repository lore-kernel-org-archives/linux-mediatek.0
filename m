Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2587DC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvBNTbGSHEgvra+SQFvlKAP4OAGjXsLNrTDLXafEW+E=; b=jH5yf2U47AdiQ1Z/OI+nschlc3
	hSOsbWgGkbUKaGlmJ2ctUGiXlmkqOFctlkD9ZGkYD4GStQg6T7ymx1zbsJXIJ10qsE7urpkWjWazD
	zy49J7/76AlTvHrQlqIxGlwgNcPZ4m8bzeXIVsE3hScaBv3p/4zc2e6dszuOjFG/hou4Y4C5Z7rhF
	tkUVJgPr8vRoI/DwjmuQ6pO7liPOOx+EK0FxRa4AmcB4QJDF9siXzs+yAXo6gtLSoxdqEu0a4e7Tx
	v7MygE8xfEJ9U1+77si8PDxc2GT4nXgs5uOQt3coe/73gDvsC1uIjj0OAAIqfff80unDa9Sr/oPXi
	AENuNh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLn8R-000000002F3-2kHF;
	Mon, 24 Jun 2024 17:05:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLn8K-000000002Di-2WUM;
	Mon, 24 Jun 2024 17:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 71BA9CE1307;
	Mon, 24 Jun 2024 17:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245ACC2BBFC;
	Mon, 24 Jun 2024 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719248733;
	bh=hluDMmNHYy/31BF0jtrB4YwFGOBufdjYalZYHdQHg6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzZD5H5bE9b1+6J4DTJZ2nVQNgmvcELEIZ9S36BDXLNgWP9nmp61OvsfgK4qwLNv/
	 aRXeYfl9TVdrrtRBfVqHYdki2HFXD9OVRux+m10O7yAYQSTQe2nacQokh9mfYaf34E
	 tBu4lfUllOlYBcIPCAkRjpRQkSsAgFrym+RCsIXsTgYoF/TWSNUCm/fLl3YZ/N5+K6
	 Ssdd0k1ypEJ1P2tL/Qe/QwXJFxqZhNr4aOScZZl0M/7V71vMepusL4i3yqFU1UVDLa
	 sAR1Gd5n8tNvsUqWXnKikr8Pp3Rh/zyMh8LhXSGzC+u/Hw6NDy5awjO/1qCebjv+x8
	 qO8c9hfWm4WGA==
Date: Mon, 24 Jun 2024 18:05:27 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch,
	f.fainelli@gmail.com, olteanv@gmail.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: Minor grammar
 fixes
Message-ID: <20240624-erratic-monoxide-c32da937048d@spud>
References: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
 <704f4b95-2aed-4b76-87cb-83002698471c@arinc9.com>
 <20240624-radiance-untracked-29369921c468@spud>
 <68961d4f-10d8-4769-94d3-92ce709aa00a@arinc9.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v0BnrTxic9uZfq14"
Content-Disposition: inline
In-Reply-To: <68961d4f-10d8-4769-94d3-92ce709aa00a@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_100537_816869_7BE98EFB 
X-CRM114-Status: GOOD (  26.48  )
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


--v0BnrTxic9uZfq14
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 07:59:48PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 24/06/2024 19.29, Conor Dooley wrote:
> > On Mon, Jun 24, 2024 at 10:00:25AM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wro=
te:
> > > On 24/06/2024 05.58, Chris Packham wrote:
> > > > Update the mt7530 binding with some minor updates that make the doc=
ument
> > > > easier to read.
> > > >=20
> > > > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > > ---
> > > >=20
> > > > Notes:
> > > >       I was referring to this dt binding and found a couple of plac=
es where
> > > >       the wording could be improved. I'm not exactly a techical wri=
ter but
> > > >       hopefully I've made things a bit better.
> > > >=20
> > > >    .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 =
+++---
> > > >    1 file changed, 3 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7=
530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > > > index 1c2444121e60..6c0abb020631 100644
> > > > --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > > > @@ -22,16 +22,16 @@ description: |
> > > >      The MT7988 SoC comes with a built-in switch similar to MT7531 =
as well as four
> > > >      Gigabit Ethernet PHYs. The switch registers are directly mappe=
d into the SoC's
> > > > -  memory map rather than using MDIO. The switch got an internally =
connected 10G
> > > > +  memory map rather than using MDIO. The switch has an internally =
connected 10G
> > > >      CPU port and 4 user ports connected to the built-in Gigabit Et=
hernet PHYs.
> > > > -  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has go=
t 10/100 PHYs
> > > > +  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs have 1=
0/100 PHYs
> > >=20
> > > MT7530 is singular, the sentence is correct as it is.
> >=20
> > Actually, the sentence is missing a definite article, so is not correct
> > as-is.
>=20
> The definite article is omitted for the sake of brevity. I don't believe
> omitting the definite article renders the sentence incorrect.

I figured if we were gonna nitpick wording, we should nitpick it
properly :)

--v0BnrTxic9uZfq14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmnVgAKCRB4tDGHoIJi
0taJAP9HVBBJpTuZ+D8xH36TsRm8Pn+cA8UNRO8+Z0hdJuy+hwD/VFYEu91AsBId
VyK+YAk3vdfcKAyrqwo2gXLJb7SrywQ=
=oTWe
-----END PGP SIGNATURE-----

--v0BnrTxic9uZfq14--

