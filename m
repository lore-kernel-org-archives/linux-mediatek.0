Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B24C3064D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hp2fXz9/vpzlJ4JSKAurT4WXZkFXck9CckZw0NYMdnw=; b=pEmBk1wWtEq1OsEwlhCIH572P4
	pXaHzpDEvSdQ/oR//ThvPlhdEhtMbYiDIWgzKOIYcRKpZuK+hlCgTutPTIz7rslSO14IyP4jsVWF1
	ZxfOhklgfZ/csSQBFCa/zwLFMtdJ58JzGZpIbBPKmMj6+iwMmXkjpO64s030AHLBXjfjUJhAtWPD7
	eCJprHWIbiCpmORGApPyJZkxkoSYzCek6U3JactRHUJRFTSOKWWFk+kDiN/z2f2Oeq0Ei4UAKNOY3
	qizKL/i5XQ7qE1Dto2yeWqVapPul2xWg1pNPZvaFfGrt2teJQY7Z6ngRr8jW3KiS4NhD1A44IyA/G
	kngiFrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLn5t-000000001nf-0QrQ;
	Mon, 24 Jun 2024 17:03:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLn5m-000000001mU-3qlq;
	Mon, 24 Jun 2024 17:03:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D34B060DFD;
	Mon, 24 Jun 2024 17:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A46C32782;
	Mon, 24 Jun 2024 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719248577;
	bh=Mdg5As9UY0BgHfcSp2GV2BTdUCd+Qg/tyf8Tn9vybVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sC3OXm3wYz56odM3igvJXPm0RgohOk6iJa/QUerFrtOfbe3U+/Z1K8JQUlO369i8s
	 f6XUi+ZutZc6R8r51oiWHl3j0BOvBuic1NEq/fu3WppwxJV0mOHpMHBcf5OUBnH50P
	 D8EbGUW0XR0Po5roPSGyipnwM7h+Na3wCglsvzxsfdtK8ZAHegMB0uMddjXNptXjzt
	 gld/veNdmRyRRhSJMuRiHTE1DPONGFACNTZdnK2YRtpMrMOndbp9j8jSww0qN+wULD
	 kx0eqet4mI8FF61bzB82vFy///JqXTeUmDjf8C8QBvUyMAN4UtZgBCH3oT0fYSKBVQ
	 RlOnk4HZ5EQBw==
Date: Mon, 24 Jun 2024 18:02:51 +0100
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
Message-ID: <20240624-supernova-obedient-3a2ba2a42188@spud>
References: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
 <704f4b95-2aed-4b76-87cb-83002698471c@arinc9.com>
 <20240624-radiance-untracked-29369921c468@spud>
 <68961d4f-10d8-4769-94d3-92ce709aa00a@arinc9.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yTXZVHo95QP3ORO0"
Content-Disposition: inline
In-Reply-To: <68961d4f-10d8-4769-94d3-92ce709aa00a@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_100259_046477_671DA8D5 
X-CRM114-Status: GOOD (  17.00  )
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


--yTXZVHo95QP3ORO0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 07:59:48PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 24/06/2024 19.29, Conor Dooley wrote:
> > On Mon, Jun 24, 2024 at 10:00:25AM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wro=
te:
> > > On 24/06/2024 05.58, Chris Packham wrote:

> > > >      and the switch registers are directly mapped into SoC's memory=
 map rather than
> > > >      using MDIO. The DSA driver currently doesn't support MT7620 va=
riants.
> > > >      There is only the standalone version of MT7531.
> > > > -  Port 5 on MT7530 has got various ways of configuration:
> > > > +  Port 5 on MT7530 supports various configurations:
> > >=20
> > > This is a rewrite, not a grammar fix.
> >=20
> > In both cases "has got" is clumsy wording,
>=20
> We don't use "have/has" on the other side of the Atlantic often.

Uh, which side do you think I am from?

--yTXZVHo95QP3ORO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmmuwAKCRB4tDGHoIJi
0h9sAP41oI15yoaVudwy0Xy3OyKWadApaBz7EVKFYuiYTgA39wD+P9tSKDtm7Xq2
7tvsk70QFoUvjxOQOka8SD7x5ENzAwc=
=EIsV
-----END PGP SIGNATURE-----

--yTXZVHo95QP3ORO0--

