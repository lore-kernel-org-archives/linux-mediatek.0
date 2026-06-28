Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EFEC43458
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jun 2026 19:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxvgHWh0eQuIndRLsQaT1KKb6oiwdrh7l2i05NrIeJM=; b=sgcU7w7HYLW77mY61AjxLYztzr
	X9iIReKrASjqs9su7LYZG+H2fy7UWMxoN9ZHwkaMe1S/AoRSe72H4pYEJE0XLPebmzRcR5pDXXGT1
	ZLVBPB9ZwkZ/FdeTgBjWmTO5IO6WksbzX1mYxtHS+IaXfu7BBxdpnEc+jDtMq130pIgc1+Q/FLI/i
	YLbNEIUNZueAHVLAy0T73lkG980VO9DfgF02+W1KXQaRaV4/1y2zOd5/z40hFm1no1MMyM7h7dEcb
	SUXVXSQ5MyJTZ0oLpjblI4L71XFxzJUWtENhqrFbbAg2u1KCD8cRmEmQTC5C4FwDSeKg9Qp8hjXsk
	nr2wEx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduyZ-0000000DJYX-45up;
	Sun, 28 Jun 2026 19:15:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduyY-0000000DJYR-3eB0
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jun 2026 19:15:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38FC841397;
	Sun, 28 Jun 2026 19:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504BB1F000E9;
	Sun, 28 Jun 2026 19:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782674130;
	bh=XxvgHWh0eQuIndRLsQaT1KKb6oiwdrh7l2i05NrIeJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iIzqZVXQIcHzIves2M+OO318TWw//MONsNcnEmnJN2AUPvn1LUAGO5cyOcZJDuZ2u
	 mwSi4uQPIVvUcJuTxcC4RVerKXEC4gd+CpxiE7HOHPJ1MTXCb1tHeyZO8iGgNGdlFR
	 Eq8t7QtzoXOjBFgab7OHQvWv0WoiMmXRyu0/oDEanbFvgzr5aVZfZMGAC5vL+Nmvnl
	 T4hb9/OWG1zkbrtK2nwv37pLchSkS9OtqE7zp8iXLUEXOR8UFISrRwHbp4ACihKlHX
	 HlWzrmvGFgDOZL/oGwNfiAyec7Q0kfZWxYsiNbv6Pr0Gs4q6GmofsovHXEdy84Ts+D
	 UUuLbsyx5R/gg==
Date: Sun, 28 Jun 2026 20:15:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 01/17] dt-bindings: pinctrl: airoha: update/fix device
 tree binding schemas
Message-ID: <20260628-pronto-stash-ea7ff79bd0d3@spud>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lPGuEethiyCynXtY"
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-2-mikhail.kshevetskiy@iopsys.eu>
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

--lPGuEethiyCynXtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 05:37:17PM +0300, Mikhail Kshevetskiy wrote:
> This patch fix several misprints and sync device tree binding schemas
> with actual driver code.

Please split this up and provide some explanation for why each thing is
incorrect.

pw-bot: changes-requested

>=20

Missing a Fixes: tag.

Thanks,
Conor.

> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7583-pinctrl.yaml        | 37 +++++++------------
>  .../pinctrl/airoha,en7581-pinctrl.yaml        |  4 +-
>  2 files changed, 16 insertions(+), 25 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml
> index 79910214d9b5..f52802a3ad79 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -61,7 +61,7 @@ patternProperties:
>              description:
>                A string containing the name of the function to mux to the=
 group.
>              enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> -                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
> +                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
>                     phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
>                     phy3_led1, phy4_led1]
> =20
> @@ -159,17 +159,8 @@ patternProperties:
>                properties:
>                  groups:
>                    items:
> -                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs=
1,
> -                           pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
> -                  maxItems: 7
> -          - if:
> -              properties:
> -                function:
> -                  const: i2c
> -            then:
> -              properties:
> -                groups:
> -                  enum: [i2s]
> +                    enum: [pcm_spi, pcm_spi_rst, pcm_spi_cs1]
> +                  maxItems: 3
>            - if:
>                properties:
>                  function:
> @@ -207,7 +198,8 @@ patternProperties:
>                           gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
>                           gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
>                           gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> -                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> +                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
> +                         gpio48]
>            - if:
>                properties:
>                  function:
> @@ -288,17 +280,16 @@ patternProperties:
>              description:
>                An array of strings. Each string contains the name of a pi=
n.
>              items:
> -              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, sp=
i_clk,
> -                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpi=
o4,
> -                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, =
gpio12,
> -                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpi=
o19,
> -                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpi=
o26,
> -                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpi=
o33,
> -                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpi=
o40,
> -                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
> -                     pcie_reset0, pcie_reset1, pcie_reset2]
> +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gp=
io7,
> +                     gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio1=
4,
> +                     gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpi=
o21,
> +                     gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gpi=
o28,
> +                     gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gpi=
o35,
> +                     gpio36, gpio37, gpio38, i2c0_scl, i2c0_sda, i2c1_sc=
l,
> +                     i2c1_sda, spi_clk, spi_cs, spi_mosi, spi_miso, uart=
_txd,
> +                     uart_rxd, pcie_reset0, pcie_reset1, mdc_0, mdio_0]
>              minItems: 1
> -            maxItems: 58
> +            maxItems: 53
> =20
>            bias-disable: true
> =20
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.=
yaml
> index 21fd4f1ba78b..12dd85b5b410 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -166,7 +166,7 @@ patternProperties:
>            - if:
>                properties:
>                  function:
> -                  const: i2c
> +                  const: i2s
>              then:
>                properties:
>                  groups:
> @@ -208,7 +208,7 @@ patternProperties:
>                           gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
>                           gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
>                           gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> -                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> +                         gpio42, gpio43, gpio44, gpio45, gpio46]
>            - if:
>                properties:
>                  function:
> --=20
> 2.53.0
>=20

--lPGuEethiyCynXtY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakFyxgAKCRB4tDGHoIJi
0g6dAQD9tb4JAvk+3o+T9mnLzjVVmU+dF8yfrer/nFDzCEl+KgD/fvB+Le8z8O7A
aGEIjdyyNk8gIeUK6sG087pH7fwRLAg=
=Qf7e
-----END PGP SIGNATURE-----

--lPGuEethiyCynXtY--

