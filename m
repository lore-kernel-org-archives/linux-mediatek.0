Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA35CEFC2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHt3JYUZBYz/0Fp5XNwlOF4V3R9H9TlZQyYPHiMqL64=; b=kBhJeDL47Su9V5C6eCxhaMS71m
	JQnLWwZJ6dU6eYbOhkxmNqoROK5A3geUeEyHLjOH9x0K11oPbEsHI39+FWrf9j+dyOa5Fe2SkUJxi
	nRBbGFkR3iTdsfYEOTbOlMJYz1t76jPETfoT0514m73+YRRrR7PCfMZmm4Trjla7+yrunLP+vvJQC
	7NGDcop0J1FX00/doE1mvEoCrMKSRqCMcJqnmccO3/xLt9CZ9TFYpit5TIr2B2/5CAlPp3Iu6mQcK
	FzeesX5nnNbXcUe64CiAS8e5A0vxO6pTInL+rGPj5HZpRU0I7dijwMCA3Y+xtYxD6XoZR01ZxmvZF
	5fmPvT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syD9u-00000006VaA-0AMI;
	Tue, 08 Oct 2024 16:34:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syD7H-00000006V5p-3Z6D;
	Tue, 08 Oct 2024 16:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B791D5C4F4D;
	Tue,  8 Oct 2024 16:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDD2C4CEC7;
	Tue,  8 Oct 2024 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728405078;
	bh=0lgV2rFoiw5wtsRBRpfDph44UOojRfjp31BzeyWcZYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCJ0G0KQB3IkegGfi7xpcFnytubZPjBoE9f+MGXwi81fbYaacAABX1ePDBohhRTUI
	 2owuVDaqFcWK/DcJAqQQVlqMCfMvUCAZmbzaoDGpn6Q4uSg19YsI23o/PMcP4F6xYk
	 pKDmaT1Wt3/gJDY2UjIXBtu8Ek2HKwamzbfyYq5moxFEh+/ta+TsNFPmtWabP4PgCQ
	 54ItjmfveVxPymysSocAKJ02/NMv+cTF+tuHAlHqdvI0wVGJeL6Lp5Bx90UAQXZPRN
	 lNH/E77GhvHD+ep4gJMlH1gfJOp6dnTNWlfOnw9PgLOxOMiAhgx2UQeUNsx0G/j9/H
	 +cdsvIqCUoJcQ==
Date: Tue, 8 Oct 2024 17:31:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] dt-bindings: phy: mediatek: tphy: add a property for
 power-domains
Message-ID: <20241008-disorder-slacking-d8196ceb68f7@spud>
References: <20240926101804.22471-1-macpaul.lin@mediatek.com>
 <20240926-treadmill-purr-b2e3279a14a4@spud>
 <3a970560-2458-f5f3-87c5-925079fa12a4@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="63wFwyn02Gwtymi/"
Content-Disposition: inline
In-Reply-To: <3a970560-2458-f5f3-87c5-925079fa12a4@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_093120_000585_2BCA0674 
X-CRM114-Status: GOOD (  26.46  )
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


--63wFwyn02Gwtymi/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 12:03:37PM +0800, Macpaul Lin wrote:
>=20
>=20
> On 9/27/24 00:25, Conor Dooley wrote:
> > On Thu, Sep 26, 2024 at 06:18:04PM +0800, Macpaul Lin wrote:
> > > Some platforms requires a dependency for power-domains.
> >=20
> > Some, so not all? Why isn't this restricted on a per compatible basis?
>=20
> After discussion with Chunfeng and double check tphy design in detail.
> Chunfeng commented that tphy dose not need to add mtcmos.
> It is not necessary to add it, if the power of the phy is turned off,
> it will affect other functions.
>=20
> From the current USB hardware design perspective, even if mtcmos
> is added to the phy, it is always on.

Firstly, I have no idea what "mtcmos" means, sorry. I am a dt-bindings
guy, not someone familiar with mediatek hardware.
Secondly, it sounds like this /does/ have a power domain, so it should
be in the binding. That it is turned on by something else and must
remain on doesn't mean it shouldn't be documented here. What if those
things try to turn it off while the tphy is using it?

>=20
> > > So we add property 'power-domains' and set 'maxItems: 1' in the
> > > DT Schema.
> > >=20
> > > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > > ---
> > >   Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 3 +++
> > >   1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml=
 b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > index 423b7c4e62f2..c77fe43c224a 100644
> > > --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > @@ -125,6 +125,9 @@ properties:
> > >       $ref: /schemas/types.yaml#/definitions/uint32
> > >       default: 28
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > >   # Required child node:
> > >   patternProperties:
> > >     "^(usb|pcie|sata)-phy@[0-9a-f]+$":
> > > --=20
> > > 2.45.2
> > >=20
>=20
> Please drop this patch and I'll send a new fix to mt8195.dtsi.
>=20
> Thanks
> Macpaul Lin

--63wFwyn02Gwtymi/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwVeUAAKCRB4tDGHoIJi
0qBJAP942MK2haivS9lUOXeS3zszXJHYx8a0MTJissHiNv9Y6AEAlULCD/bffod/
Ajhj7718HDTdpLU80QNMjPu2uFTR0Qg=
=MNh6
-----END PGP SIGNATURE-----

--63wFwyn02Gwtymi/--

