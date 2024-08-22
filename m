Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABD6C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+ylB1g2uSkLLHcJdlxztR35Si4TDIglWdtbljocQ8Y=; b=kZSzF5tECTUjDjoN4vXYsvK1SZ
	49zdgtO7kepgWaFIXILsZ3bXZ2P7jsMdSLLbHbnTDZC9h9JeAmae+P87AiA1SFzGtTHHaWjfH2mX7
	Bx2fUo6lgZsMkOdfz5B1U4GZzyBFVALZzD0sRv0Q8mU0SlLZzYFrb4OKq6Pc89d5tZfgXKjhtp+sw
	pjY4vbcbzdD0OpUz1/gc0Mqg8frlUtMP5b5fr4RPO8zo2GwXOUJbVwy88cwwR0rE2DCMj/MNR68T2
	l4g0lLBwpo2npoDMLCqvoaC1V28vNCC/Mrrwzqx7XcG3Bjl4CizRnk6t3tci7XVhlJe0Gw3n+AMAx
	vC3cfjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAMv-0000000DWR6-2J8n;
	Thu, 22 Aug 2024 16:09:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAKo-0000000DVuH-1dGA;
	Thu, 22 Aug 2024 16:06:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABFA4A40B28;
	Thu, 22 Aug 2024 16:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27058C4AF0B;
	Thu, 22 Aug 2024 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724342809;
	bh=JKSc2pCJPHiBPYG6O9itMsD/N2edGQ/08PARRYFbmoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCLoBA6wK8HES0FLgfc3r7p3Ru9S+uWShWHV6U2bduADrNBxYRHYMnkOnIHGsttl9
	 sjbtOtDejqqhu0hiMg+FQSmBCotX5JNMyTPMxXIBixGBQAMwV93LEwSHP1HRNeKjzi
	 BvkKOjlYiKSlqujAelZfBsUYKMtsHrhj6NeeRo6TIZet+iOdvxVbh+twWZ0I109THi
	 CtOfdiu6gWyo4mqB0C8iTN/fj88Il4RTdbsNVZxoLgJ9/qB8ShBoJAhpLkXaxjrtJ1
	 rFtIroybZd3RB/4hjrnHEdpt3MxtHWV4LytV1fNDJE1MjjjpqG9og5qGovqU2ghEqp
	 PoGwLrdks5XAw==
Date: Thu, 22 Aug 2024 17:06:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
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
Message-ID: <20240822-taste-deceptive-03d0ad56ae2e@spud>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Keq2bc7KVkSdMDBF"
Content-Disposition: inline
In-Reply-To: <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_090650_575772_72481744 
X-CRM114-Status: GOOD (  13.94  )
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


--Keq2bc7KVkSdMDBF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:40:52AM +0200, Lorenzo Bianconi wrote:
> Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> controller.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> +  reg:
> +    items:
> +      - description: IOMUX base address
> +      - description: LED IOMUX base address
> +      - description: GPIO flash mode base address
> +      - description: GPIO flash mode extended base address
> +      - description: IO pin configuration base address
> +      - description: PCIE reset open-drain base address
> +      - description: GPIO bank0 register base address
> +      - description: GPIO bank0 second control register base address
> +      - description: GPIO bank1 second control register base address
> +      - description: GPIO bank1 register base address

> +      pinctrl@1fa20214 {
> +        compatible =3D "airoha,en7581-pinctrl";
> +        reg =3D <0x0 0x1fa20214 0x0 0x30>,
> +              <0x0 0x1fa2027c 0x0 0x8>,
> +              <0x0 0x1fbf0234 0x0 0x4>,
> +              <0x0 0x1fbf0268 0x0 0x4>,
> +              <0x0 0x1fa2001c 0x0 0x50>,
> +              <0x0 0x1fa2018c 0x0 0x4>,
> +              <0x0 0x1fbf0200 0x0 0x18>,
> +              <0x0 0x1fbf0220 0x0 0x4>,
> +              <0x0 0x1fbf0260 0x0 0x8>,
> +              <0x0 0x1fbf0270 0x0 0x28>;
> +        reg-names =3D "iomux", "led-iomux",
> +                    "gpio-flash-mode", "gpio-flash-mode-ext",
> +                    "ioconf", "pcie-rst-od",
> +                    "gpio-bank0", "gpio-ctrl1",
> +                    "gpio-ctrl2", "gpio-bank1";

before looking at v1:
I would really like to see an explanation for why this is a correct
model of the hardware as part of the commit message. To me this screams
syscon/MFD and instead of describing this as a child of a syscon and
using regmap to access it you're doing whatever this is...

after looking at v1:
AFAICT the PWM driver does not currently exist in mainline, so I am now
doubly of the opinion that this needs to be an MFD and a wee bit annoyed
that you didn't include any rationale in your cover letter or w/e for
not going with an MFD given there was discussion on the topic in v1.

Thanks,
Conor.

--Keq2bc7KVkSdMDBF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsdiEwAKCRB4tDGHoIJi
0uKZAQDj5+09ic83KcLDIq5zWWJ09DULVEuilCvZB8SXAroqgAD+Jui9Hf6JNAuM
9ieVzZOf+irfrtrGnPCFLrkKqBC7hAQ=
=dqn2
-----END PGP SIGNATURE-----

--Keq2bc7KVkSdMDBF--

