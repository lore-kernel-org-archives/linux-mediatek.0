Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBAAC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAhk3iOU9aBDJQvIXVevY2MnIL44WAuvPQJArLJz0SQ=; b=qEr73VhrqnGpxOnWXob0l7OACN
	ueHCWLbvBQQkGx3Q77WoOhytR00fO2y2weyqij/YWV9wzkY99Udc572Exhh4AZYb1ErRjVdf59liz
	dc8kl4QUtHsVav23xSFZtDv9H8Whf70psvnXTl00WGskC6RQ7C8D/LCfa16Nn/+RtDnrH5QvpT5gN
	PzM6HsbbCwedmi4WjPVfe2zKYuIGeUktwGtPu3Tub5ceKUsKrsyD5IL8swiP9jjh1mDgtJXEXqDvF
	go/kHeyllcC13+xP+efL8ePbrzXgNObEB4Zgm+SvJCqQwANVEA8Uwcb3mMxKARfoy3kKesmYQD1z1
	5sx592Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmZu-0000000HWMG-0yOL;
	Mon, 24 Jun 2024 16:30:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmZn-0000000HWKJ-1cTB;
	Mon, 24 Jun 2024 16:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6C70CE1307;
	Mon, 24 Jun 2024 16:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBFAC2BBFC;
	Mon, 24 Jun 2024 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719246591;
	bh=X/rMjN+CKsJhOirRD2eijjnLJTdEH19Dqw1djQrGiEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKfKKjQKErKRle4L4qZor2AIEwUXmTDEr/XT+Nt3HoFf/jajYbs+kP7onhqYWhHfX
	 T2BpJca6IBS5fdXH3eykDKUk4gMaVcnQs3RJGyyg+1gan81rxIfK5hFzTCHBNaf20x
	 448cE14YBNpeUpTx2Usxh/lvTFIMpSs185vMVDeH5TtpVi79pYKVjV4S+Sw9galRNg
	 OXflTR15kaxYhc99jCC9aw0wXkbpllKn9u7JyFm14UZ/nIg+jRKsFoZ5YoGTohHsbT
	 5oDFrkB8OIj3Rn5NdogLI5Tr171ZT40Ux60xjuKeVr0ruojfF2F0XRZVH+/i5qkiaH
	 hAonwZL7bW9sQ==
Date: Mon, 24 Jun 2024 17:29:45 +0100
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
Message-ID: <20240624-radiance-untracked-29369921c468@spud>
References: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
 <704f4b95-2aed-4b76-87cb-83002698471c@arinc9.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5G+CYpX+s72EcPeQ"
Content-Disposition: inline
In-Reply-To: <704f4b95-2aed-4b76-87cb-83002698471c@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_092955_873870_DA738430 
X-CRM114-Status: GOOD (  26.22  )
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


--5G+CYpX+s72EcPeQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 10:00:25AM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 24/06/2024 05.58, Chris Packham wrote:
> > Update the mt7530 binding with some minor updates that make the document
> > easier to read.
> >=20
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >=20
> > Notes:
> >      I was referring to this dt binding and found a couple of places wh=
ere
> >      the wording could be improved. I'm not exactly a techical writer b=
ut
> >      hopefully I've made things a bit better.
> >=20
> >   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.=
yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > index 1c2444121e60..6c0abb020631 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > @@ -22,16 +22,16 @@ description: |
> >     The MT7988 SoC comes with a built-in switch similar to MT7531 as we=
ll as four
> >     Gigabit Ethernet PHYs. The switch registers are directly mapped int=
o the SoC's
> > -  memory map rather than using MDIO. The switch got an internally conn=
ected 10G
> > +  memory map rather than using MDIO. The switch has an internally conn=
ected 10G
> >     CPU port and 4 user ports connected to the built-in Gigabit Etherne=
t PHYs.
> > -  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10=
/100 PHYs
> > +  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs have 10/10=
0 PHYs
>=20
> MT7530 is singular, the sentence is correct as it is.

Actually, the sentence is missing a definite article, so is not correct
as-is.

>=20
> >     and the switch registers are directly mapped into SoC's memory map =
rather than
> >     using MDIO. The DSA driver currently doesn't support MT7620 variant=
s.
> >     There is only the standalone version of MT7531.
> > -  Port 5 on MT7530 has got various ways of configuration:
> > +  Port 5 on MT7530 supports various configurations:
>=20
> This is a rewrite, not a grammar fix.

In both cases "has got" is clumsy wording, "supports" is an improvement
to readability, even if it might not qualify as a grammar fix.

--5G+CYpX+s72EcPeQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnme+QAKCRB4tDGHoIJi
0jayAP9QYPuQa14ospqghSRwh8Za6YGTODSI60an4wYfh+2zYAD/ccgLUsq74wfN
kltsgO7yuo3NMEZPJMLGAg5ZqlyWlQc=
=6noq
-----END PGP SIGNATURE-----

--5G+CYpX+s72EcPeQ--

