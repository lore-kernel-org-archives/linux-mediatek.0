Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D268D374A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbtD+3zFPrQp4aBWmMOpsADMGE9gUQ5G8OEfwzcTsFk=; b=jpjxaCn6OYstFa1uS+cysEzW5x
	P03QERhcEcjS6tUrfzUQ1gIsUP/3cHqcfKkGIqkT6Aj8Y+dSopjxFonXxnlw2Kdt3v/UA7B0Si5EF
	Aa6tk/zUiSxXYe5+zKQV7qwtmUXrvLBtrP5M8TWQlkfMBA6iBaSQw0GsyqDnkenoxSxCSirOuBK7J
	ZCvPYWClGinYfyl4XVBtOx5yX7siz0IlnRDWeHwJIXfr+rtwoDB1Mzsu680etLNT+WmqnhVSAhCgn
	DPEt7A5o5kQ5v1AAi2QFS1qLPuhULn7jsFEJRrulS7con1fVllS7SSU4MxWsRJ7DJ3lEPXP5Hq89F
	0zJZxgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RVY-0000000F7B6-1Qnj;
	Thu, 17 Oct 2024 14:29:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RU1-0000000F6yc-47SD;
	Thu, 17 Oct 2024 14:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EA6AA43EB3;
	Thu, 17 Oct 2024 14:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E54DC4CEC7;
	Thu, 17 Oct 2024 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729175288;
	bh=cG1ujo3dHNKa9WqVdQiAckTISmwm/fCx/SWHY+8ljuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozDrKY+xx8pM3y0YaTW/FDyLDweOtlQ19ddNuFDlkNz1Cl5bNZWmVXDpdCOs7ji4l
	 iXdT2PD4s0LoC+ptlSSi+qblh2Bz6k0cfhaKYsMkk5HHNJcN76yZSAP5Rtzl/ormwl
	 cPFPs+Mff5tgW3bbx1HyHM+4hNEvPTrsp8EThQzhhba/2HwNzMSSLvp3i1tkV5cen8
	 xyC7iAN7IM7VeOJ9GJipIMzggmx15Si3H+hnYrD1476SMa4P6iBXBtxGH/CHKO/8Xw
	 vtblIOnKuCZK8BwvDm2IUv47V5HIPjhEjEEiK8XBrSCCireYX/DbJkjsKU1h2nzudP
	 i6WQBcP1iJ9Cg==
Date: Thu, 17 Oct 2024 16:28:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v7 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
Message-ID: <ZxEe9gGd1qW4ksEo@lore-desk>
References: <20241016-en7581-pinctrl-v7-0-4ff611f263a7@kernel.org>
 <20241016-en7581-pinctrl-v7-3-4ff611f263a7@kernel.org>
 <834bfc12-4ce7-4ce1-a0c7-5bc8be3587b7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uoePblPqdHNb3UAq"
Content-Disposition: inline
In-Reply-To: <834bfc12-4ce7-4ce1-a0c7-5bc8be3587b7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_072810_170132_1584EAA5 
X-CRM114-Status: GOOD (  15.53  )
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


--uoePblPqdHNb3UAq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 16/10/24 12:07, Lorenzo Bianconi ha scritto:
> > Introduce device-tree binding documentation for Airoha EN7581 pwm
> > controller.
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml | 34 +++++++++++++=
+++++++++
> >   1 file changed, 34 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..f36387572a9781636aeacdb=
cc8947017c7ca75a0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
> > @@ -0,0 +1,34 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/airoha,en7581-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha EN7581 PWM Controller
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +allOf:
> > +  - $ref: pwm.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,en7581-pwm
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +
> > +required:
> > +  - compatible
> > +  - "#pwm-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pwm {
> > +      compatible =3D "airoha,en7581-pwm";
> > +
> > +      #pwm-cells =3D <3>;
> > +    };
> >=20
>=20
> There are undocumented properties that the driver tries to parse. Please =
fix.
>=20
> Regards,
> Angelo

ack, I will fix them.

Regards,
Lorenzo

--uoePblPqdHNb3UAq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZxEe9gAKCRA6cBh0uS2t
rDpoAQC2ELyAKCz2bRRpe2BaRF6RYKIf0qfZ6xsbD9FbUklpFAD/Yy963j4FOSpU
JxqA9L3uYDf/UeDg2nJTj3ZUokwBQQg=
=HeFD
-----END PGP SIGNATURE-----

--uoePblPqdHNb3UAq--

