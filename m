Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5589FC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkUnXCejKXHib3L9sGsIz06VAHP8LoggBgHiJqGpZhk=; b=awD/jSMRwKrOjVLKy158C416MU
	JrKgWD7iaYJVBYK+fCgXr6BHn5lsesQ1zLFqgUg1H3uyQ2dDo9hcPQgYxBofDq2upaY1FHbJW/dKU
	xs4+F2JI8/dLgcPcRlgkUUIsi5rAPhyuECR/wgR/GzmwhrD55U/6uz1SlTnl7HCx7kTz5kJ71MyXI
	aW8z2oVlMNLXWQ2f89E0IZy0vqjP74MyUDHbDHaVFH6OvRdOIqkd3gx7RxqtnXNFSSisMNabIv5cg
	iGOCB8tIlS+0yyz7sgB5M9NTe+KDIbVPBdSK+2gsBTSdbAndpUDq1wxUXgXWwQnaqg2An4I5Gw1jx
	7sqz8l7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8qK-00000003f2R-3TLY;
	Tue, 25 Jun 2024 16:16:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8qD-00000003f0g-1lOn;
	Tue, 25 Jun 2024 16:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3555D61303;
	Tue, 25 Jun 2024 16:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925F2C32781;
	Tue, 25 Jun 2024 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719332179;
	bh=1WVXoygUO2k28Qdke15vXqnojvrYTkH/M/tMYcvDbZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MH4ljJVjO0hDppiYoO3Ajxdamtx2V5hR0j6h9kP7L3ZMFiT1oIAja7uu0eZknV8Xm
	 +nAg0KCl6DYiUKh//lTYuYyWjNGl1FKgtvL5fUlY1ALJ5hubRWHFekGQVwfV6O8zIC
	 MVt9kpIVL158Zf8Y8Q1f9gOYpKd98WSnSZAddFeeEr8byc5xDBzfITEbRO14dmWQOI
	 Gl1g86L4S0bsaMIwi5jrUkQVp4JP+2CLOkBt/yUrh0ne9tfrgzbS0N5ePb4MtO+M+q
	 k4CSz2yrqD0wm8U8h9ibgRHOCiqDitKrLFu3M+A6/f3XAmIXluMXZRcAssybE5bJ7L
	 slsk8fUTAApEA==
Date: Tue, 25 Jun 2024 17:16:13 +0100
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
Message-ID: <20240625-surfboard-massive-65f7f1f61f0d@spud>
References: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
 <704f4b95-2aed-4b76-87cb-83002698471c@arinc9.com>
 <20240624-radiance-untracked-29369921c468@spud>
 <68961d4f-10d8-4769-94d3-92ce709aa00a@arinc9.com>
 <20240624-supernova-obedient-3a2ba2a42188@spud>
 <a17f35ae-5376-458a-b7b5-9dbefd843b40@arinc9.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eBPkurhNpOKh5uH9"
Content-Disposition: inline
In-Reply-To: <a17f35ae-5376-458a-b7b5-9dbefd843b40@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_091621_705506_3A96A812 
X-CRM114-Status: GOOD (  20.32  )
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


--eBPkurhNpOKh5uH9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 08:11:10PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 24/06/2024 20.02, Conor Dooley wrote:
> > On Mon, Jun 24, 2024 at 07:59:48PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wro=
te:
> > > On 24/06/2024 19.29, Conor Dooley wrote:
> > > > On Mon, Jun 24, 2024 at 10:00:25AM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL=
 wrote:
> > > > > On 24/06/2024 05.58, Chris Packham wrote:
> >=20
> > > > > >       and the switch registers are directly mapped into SoC's m=
emory map rather than
> > > > > >       using MDIO. The DSA driver currently doesn't support MT76=
20 variants.
> > > > > >       There is only the standalone version of MT7531.
> > > > > > -  Port 5 on MT7530 has got various ways of configuration:
> > > > > > +  Port 5 on MT7530 supports various configurations:
> > > > >=20
> > > > > This is a rewrite, not a grammar fix.
> > > >=20
> > > > In both cases "has got" is clumsy wording,
> > >=20
> > > We don't use "have/has" on the other side of the Atlantic often.
> >=20
> > Uh, which side do you think I am from?
>=20
> Who would call it clumsy to use "have" and "got" together for possession.=
=2E.
> Must be an Irishman! :D

Okay, I was just making sure you weren't accusing me of being
American...

--eBPkurhNpOKh5uH9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrtTQAKCRB4tDGHoIJi
0ogdAPsGgI16OjIEcRoR3/W3g7mWhBrsC6mYOu/EK0bHwPMgaAEA1ed2WNJBKEvH
EIhgp/sU0bgFgyUSln6h4c1Gh70zUA4=
=xwkj
-----END PGP SIGNATURE-----

--eBPkurhNpOKh5uH9--

