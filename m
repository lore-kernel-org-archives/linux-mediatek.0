Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98F4C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 19:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzDslElypG3jvVYuOsBF3AeB10Zs4LqRhhgYDVRZ+T0=; b=nfj5vli0wVy0J97LxDNIN28Eur
	+RVeUCme5OH3owrEXuY9biovQegmsY0S9pGp9++nFGy7AnRo9dfhjpWly8S+YkXjKYizv+9GSrK13
	2VPfJ+n7Y1iIwthBZmxmRoseC2OO2hVX3QtwN/hTLFjHomQ3ffdhHYw9s16+MkBvdtgEoVJ5UECH+
	F2v486Zw5LfCKHUQCRkv5rVCvRV5oDtdfRfpfZ5+2y472H2B5vzD8cVQLqQ2M4muWtS03/cf1UFsI
	1FxAM1nzoORPbvMKv00ru1/cJwdoIUcLaXlIcdEyQcaCyNhAL7MaHvr0rNim+7E6ssR4XtOr2YK4v
	e/pkOhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shD5p-0000000E2AD-2895;
	Thu, 22 Aug 2024 19:03:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shD53-0000000E22I-43Bx;
	Thu, 22 Aug 2024 19:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 29BD7CE0FE6;
	Thu, 22 Aug 2024 19:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4C2C32782;
	Thu, 22 Aug 2024 19:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724353363;
	bh=xkJxuhgb78n4FuOPdIwcmBi1eA/Yu0psL+bwoB8zMA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9bADXjhnhFV9D6FC7d7Oi2kbTHMS/q2RGBnT9miyH5POy5PnigNWky8RoFcgQAYl
	 K5IZ0zonP123H8Qt0k08l5k71aPOfRWXbAV6z0zqGi5wwmSlxq8lU5r8G7VrDgxodr
	 h9nsHwJWs1S74Z94y27or9ExB0VM5JYK8GbdacOQpPRM1gB3Pl1Q1KjzKHMCeYGI99
	 eWFleMcUDJS4IFArGb3Sn+jwUKkw/fZeL50V0mbGloBi5E/2wd9FOKOFqwFQJ0tMVu
	 09iYREQP2HP9yK/Ia34b/rdngLyAS3rVAS0r3yqYskdSHDQJEVS7bKXr/QygBECsGM
	 ciB6LN4o7mF6Q==
Date: Thu, 22 Aug 2024 21:02:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZseLT2roso_L7UG4@lore-desk>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="diazt744lIJbkc3n"
Content-Disposition: inline
In-Reply-To: <20240822-taste-deceptive-03d0ad56ae2e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_120246_377567_F332BE81 
X-CRM114-Status: GOOD (  23.35  )
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


--diazt744lIJbkc3n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 22, Conor Dooley wrote:
> On Thu, Aug 22, 2024 at 11:40:52AM +0200, Lorenzo Bianconi wrote:
> > Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> > controller.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > +  reg:
> > +    items:
> > +      - description: IOMUX base address
> > +      - description: LED IOMUX base address
> > +      - description: GPIO flash mode base address
> > +      - description: GPIO flash mode extended base address
> > +      - description: IO pin configuration base address
> > +      - description: PCIE reset open-drain base address
> > +      - description: GPIO bank0 register base address
> > +      - description: GPIO bank0 second control register base address
> > +      - description: GPIO bank1 second control register base address
> > +      - description: GPIO bank1 register base address
>=20
> > +      pinctrl@1fa20214 {
> > +        compatible =3D "airoha,en7581-pinctrl";
> > +        reg =3D <0x0 0x1fa20214 0x0 0x30>,
> > +              <0x0 0x1fa2027c 0x0 0x8>,
> > +              <0x0 0x1fbf0234 0x0 0x4>,
> > +              <0x0 0x1fbf0268 0x0 0x4>,
> > +              <0x0 0x1fa2001c 0x0 0x50>,
> > +              <0x0 0x1fa2018c 0x0 0x4>,
> > +              <0x0 0x1fbf0200 0x0 0x18>,
> > +              <0x0 0x1fbf0220 0x0 0x4>,
> > +              <0x0 0x1fbf0260 0x0 0x8>,
> > +              <0x0 0x1fbf0270 0x0 0x28>;
> > +        reg-names =3D "iomux", "led-iomux",
> > +                    "gpio-flash-mode", "gpio-flash-mode-ext",
> > +                    "ioconf", "pcie-rst-od",
> > +                    "gpio-bank0", "gpio-ctrl1",
> > +                    "gpio-ctrl2", "gpio-bank1";
>=20
> before looking at v1:
> I would really like to see an explanation for why this is a correct
> model of the hardware as part of the commit message. To me this screams
> syscon/MFD and instead of describing this as a child of a syscon and
> using regmap to access it you're doing whatever this is...
>=20
> after looking at v1:
> AFAICT the PWM driver does not currently exist in mainline, so I am now
> doubly of the opinion that this needs to be an MFD and a wee bit annoyed
> that you didn't include any rationale in your cover letter or w/e for
> not going with an MFD given there was discussion on the topic in v1.

based on the reply from Rob I was thinking it is fine to just reduce the nu=
mber
of IO mappings, sorry for that.

>=20
> Thanks,
> Conor.

clock, pinctrl and pwm controllers need to map 3 main memory areas:
- chip-scu: <0x0 0x1fa20000 0x0 0x384>
  it is used by the clock driver for fixed freq clock configuration,
  by the pinctrl driver for io-muxing (and by the future pon drivers)
- scu: <0x1fb00020 0x0 0x94c>
  it is used by the clock/rst driver
- gpio: <0x1fbf0200 0x0 0xbc>
  it is used by the pinctrl driver to implement gpio/irq controller and
  by the pwm driver.

I guess we can model chip_scu as single syscon node used by clock and pinct=
rl
while pwm can be a child of the pinctrl node. Something like:

=2E..

chip_scu: chip-scu@1fa20000 {
	compatible =3D "airoha,en7581-chip-scu", "syscon";
	reg =3D <0x0 0x1fa20000 0x0 0x384>;
};

scuclk: clock-controller@1fb00020 {
	compatible =3D "airoha,en7581-scu";
	reg =3D <0x1fb00020 0x0 0x94c>;
	airoha,chip-scu =3D <&chip_scu>;
	...
};

pio: pinctrl@1fbf0200 {
	compatible =3D "airoha,en7581-pinctrl", "simple-mfd", "syscon";
	reg =3D <0x1fbf0200 0x0 0xbc>;
	airoha,chip-scu =3D <&chip_scu>;
	....

	pwm {
		compatible =3D "airoha,en7581-pwm";
		...
	};
};

=2E..

Does it work for you?

Regards,
Lorenzo

--diazt744lIJbkc3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZseLTwAKCRA6cBh0uS2t
rGKnAQCZ+o4MIMWsRuzvGOZSrG1NdV6hktrlDyjEJQ5C2jFzYAEAu4nxBgW+EpZW
RRqyuyYxUDBvOoQ4vFB7hMODbQlKmQo=
=1h0o
-----END PGP SIGNATURE-----

--diazt744lIJbkc3n--

