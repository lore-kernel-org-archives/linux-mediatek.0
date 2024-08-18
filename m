Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CFBC5320E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AThE0SLDGkQvLlSlHQo1h7WbaqnTOZL8rXuJvU321U=; b=ZnAcH3Rg8A69Y2FnzK+kA/4H3C
	L/06hd3Nmfy7VhCi5GxPi2OdrOnuexDfHhZS/fa7KRtEs7sxm3sE9xtBTbff0a+7hYyiTSCju0Cbj
	5JFNvjbYbWqijwkiKcbEr+HTaFnNCcfbdL9Mp3kZqH5MlDd3752Mo5b2zTu03DzdLLPib5AwRrP+N
	BnltmRJ5twlxJ1rpIMD2k93b1RntUYLzYzozRVkA8/01zJZSM5OeE7Aif2Jw+zh/qEF5G3XqaEYo6
	Pp0+9NI1+i1bmMq5HKGD18jigNaZ/1W3wovx8Z+BGH1vNsWUd5Bpz7ikNJ/EtTNBOQ9XfE5jv5GDg
	h9XChUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfiZZ-0000000Go7N-3fM3;
	Sun, 18 Aug 2024 16:16:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfiYs-0000000Go5o-463n;
	Sun, 18 Aug 2024 16:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6765CE02C4;
	Sun, 18 Aug 2024 16:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54975C32786;
	Sun, 18 Aug 2024 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723997719;
	bh=VaBQwb9qR9sQO1ub1AxgD10xLLE6+nsUX8RQUgYGtwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJ87jq3QfH2iZQMNlJeQN6m1IbKHc921iGXlSLS5iVteQgeTGN0ssu+wbKTGdgqQe
	 iPymZCd2P/8jwSdTexD7e+gScdBPvQ1iNGyWuluKn7Pf5XQL406RMapzPDpv6f3fsm
	 WVuzuTFN1XLwmzyCPvD+Y98xkBzKrd+5dLRpAPFX7nGeVQqiv6O6v2t9A7bl/pqoRs
	 3ahr/xZpzlcJdyO2D16X1JogoIMIX/9bLNU9vu1jDc1ySktJUci1GxyySqX/Os6kT1
	 ZaheY1aiRbf37oblab6I//uRdrueMwY9lakzTHXvx9hsyiNBSkee8VIWENbyZL0K/F
	 eL4qxOtac/0Cw==
Date: Sun, 18 Aug 2024 18:15:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZsIeEitpV9MehqVh@lore-rh-laptop>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
 <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KIOrQBlvqenJie0W"
Content-Disposition: inline
In-Reply-To: <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_091523_388767_6ECE34B6 
X-CRM114-Status: GOOD (  26.95  )
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


--KIOrQBlvqenJie0W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 18, Andrew Lunn wrote:
> On Sun, Aug 18, 2024 at 02:48:05PM +0200, Benjamin Larsson wrote:
> > On 17/08/2024 23:39, Andrew Lunn wrote:
> > > How messy are the GPIO and PWM registers? Are there N blocks of
> > > independent GPIO registers? and M blocks of independent PWM registers?
> > > By that, does one block of GPIO registers contain all you need for one
> > > GPIO controller? One block of PWM registers give you all you need for
> > > one PWM controller? Or are the registers for one GPIO controller
> > > scattered all over the place?
> > >=20
> > > Could you point at a public datasheet?
> > >=20
> > >        Andrew
> > >=20
> > Hi, per my understanding there is no public datasheet/register reference
> > manual.
> >=20
> > But here is the division of regions of the registers in the gpio block =
and
> > how it is currently divided between the drivers (according to my current
> > understanding).
> >=20
> > 1FBF0200, gpio/pinctrl
> > 1FBF0204, gpio/pinctrl
> > 1FBF0208, gpio/pinctrl
> > 1FBF020C, gpio/pinctrl
> > 1FBF0210, gpio/pinctrl
> > 1FBF0214, gpio/pinctrl
>=20
> A typical SoC has multiple instances of a GPIO controller. Each GPIO
> controller typically has 4 or 5 registers: In, Out, Direction,
> Interrupt Enable, Interrupt Status. If these 4 or 5 registers are
> contiguous, you could have one DT node per controller, rather than one
> node for all GPIO controllers.

it is the same for en7581 pinctrl too. I think we can squash most of the
gpio/irq registers into "bigger" io-regions (just keeping a couple of holes
for pwm and leds). It is just a matter of moving the logic from the dts to
the driver. I am currently working on it. I will post v2 soon.

>=20
> If the hardware designer has really messed up and fully interleaved
> GPIO and PWM, it might be better to have an MFD. The MFD node has a
> single reg covering the entire range. The MFD would then map the whole
> range, and provide accessors to the child devices. Hard code the
> knowledge of what registers are where. Given how badly the hardware is
> designed, it is unlikely it will get reused in the future, so there is
> no point putting lots of stuff into DT. Hard code it.

I am not sure it is possible/feasible to implement a MFD device here since
the mapped region is huge and sparse.

Regards,
Lorenzo

>=20
> 	Andrew

--KIOrQBlvqenJie0W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsIeDwAKCRA6cBh0uS2t
rG8WAQCOM9FfsuIqInox4vNa4pce4vCRLHiG1gGyr+t084DqmQD/WAORMouBNGcP
YxNJu753I5NPJOvDkIQck7p8t+PNKQE=
=cvb3
-----END PGP SIGNATURE-----

--KIOrQBlvqenJie0W--

