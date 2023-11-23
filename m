Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199FCC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPfrzEVZEEkAHa6VO/vXqtVnK2WBMU7/MnWLMDsyYik=; b=O0iU0MrPq5L1RxQoATpYWWZdfY
	uNVc4hqR9N7dSDlAiUcFi5eNrHF4CJNKcXcWa6tJ8yom5+HI6zgUpCHFgU/8YQO4RtJYiRjXJxBQG
	Zc5Qn2Nbt0cXSydhNzMDeE76rsIJZAZ1F50k37kGWuv4460xqSKqGlfYf1ctatwe4/M/5w6fExpfj
	GfjzGcoVY6pLZcUTsRQ7m6beLa9uTTshrD3E7/a8VjCiaUQcGlJ4hp1WsI3lK9UYgOzCR4Oe6Oza/
	bOjvGkxb7WHGJS1ueRWOwF5+S8TmUcxkxAlKQcjXX0KIfhDjN/KbI628Hb8XP+18B/y2z1/Zg1nxi
	bRIIhAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DYP-005Qcf-2l;
	Thu, 23 Nov 2023 17:31:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DYI-005QaH-1r;
	Thu, 23 Nov 2023 17:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77001CE2BDE;
	Thu, 23 Nov 2023 17:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AFBC433CA;
	Thu, 23 Nov 2023 17:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700760703;
	bh=x6t0DakrfOazLqCXf+qyEeqOmEgp+z5KyR3L1q47Slg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5nnDdwLpT1dfd91tmCi8xRhIdHcFHo13nexVEoEyTjk551Kz8iUnYi0a7kz/v+5C
	 pan8dcUSFxZy567tDaTjAMsbSs1Db0sNUvMgQjlajS7xRVrC7wBNH57/Pq7nmP/xju
	 um2I5AbY5d+hs9OuO1I7fpaK7AyRp0tzxh3YZuYgd3by58qEzXbEuwmnJHIZzCLEp1
	 b80S7PwMqKOmKn2l6oabIfvQtJp64+tWn6gnGnbA6TV3EDHHiN1DsZEpb6MpBHS+jO
	 iklcSTwvSUNyEjbfp+Z+JKnQsT29XOXLf7xAkaTud6/9+CW57Op8R9UVvlDHpoOslt
	 +UJKj+Owx/s2A==
Date: Thu, 23 Nov 2023 17:31:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, 10572168@qq.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yunkec@chromium.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
	andy.shevchenko@gmail.com, bingbu.cao@intel.com,
	dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Document GC08A3
 bindings
Message-ID: <20231123-magical-rupture-83251807e995@spud>
References: <20231123115104.32094-1-zhi.mao@mediatek.com>
 <20231123115104.32094-2-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="01MH2fFNhMpUwwbA"
Content-Disposition: inline
In-Reply-To: <20231123115104.32094-2-zhi.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_093146_973629_052EB971 
X-CRM114-Status: GOOD (  21.12  )
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


--01MH2fFNhMpUwwbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 07:51:03PM +0800, Zhi Mao wrote:
> Add YAML device tree binding for GC08A3 CMOS image sensor,=20
> and the relevant MAINTAINERS entries.
>=20
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>

Please test your bindings.

> ---
>  .../bindings/media/i2c/galaxycore,gc08a3.yaml | 128 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycor=
e,gc08a3.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a=
3.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> new file mode 100644
> index 000000000000..089ea321da91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc08a3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GalaxyCore gc08a3 1/4" 8M Pixel MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Zhi Mao <zhi.mao@mediatek.com>
> +
> +description: |-

The |- is not needed, you have no formatting to preserve.

> +  The gc08a3 is a raw image sensor with an MIPI CSI-2 image data
> +  interface and CCI (I2C compatible) control bus. The output format
> +  is raw Bayer.
> +
> +properties:
> +  compatible:
> +    const: GalaxyCore,gc08a3

Please remove the capitals.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Reference to the mclk clock.

Pointless, just use maxItems: 1.

> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: Reference to the GPIO connected to the RESETB pin. Acti=
ve low.
> +    maxItems: 1
> +

> +  vddio-supply:
> +    description: Definition of the regulator used for the VDDIO power su=
pply.
> +
> +  vdda-supply:
> +    description: Definition of the regulator used for the VDDA power sup=
ply.
> +
> +  vddd-supply:
> +    description: Definition of the regulator used for the VDDD power sup=
ply.

These descriptions can all be replaced with "foo-supply: true" IMO.

> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

> +  - assigned-clocks
> +  - assigned-clock-rates

Why are these required?

> +  - vddio-supply
> +  - vdda-supply
> +  - vddd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        sensor0@2 {
> +            status =3D "okay";
> +            compatible =3D "GalaxyCore,gc08a3";
> +            reg =3D <0x31>;
> +
> +            clocks =3D <&topckgen CLK_TOP_CAMTG>,
> +                <&topckgen CLK_TOP_UNIVPLL_192M_D8>;
> +            clock-names =3D "xvclk", "freq_mux";
> +            clock-frequency =3D <24000000>;
> +
> +            assigned-clocks =3D <&topckgen CLK_TOP_CAMTG>,
> +                    <&topckgen CLK_TOP_UNIVPLL_192M_D8>;
> +            assigned-clock-parents =3D <&topckgen CLK_TOP_UNIVPLL_192M_D=
8>;
> +            assigned-clock-rates =3D <0>, <24000000>;
> +
> +            enable-gpios =3D <&pio 19 GPIO_ACTIVE_HIGH>;
> +
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&camera_pins_cam0>;
> +
> +            avdd-supply =3D <&mt6359_vfe28_ldo_reg>;
> +
> +            port {
> +                sensor0_out_2: endpoint {
> +                    data-lanes =3D <1 2 3 4>;
> +                    link-frequencies =3D /bits/ 64 <336000000 207000000>;
> +                    remote-endpoint =3D <&seninf_csi_port_0_in_2>;
> +                };
> +            };
> +        };
> +
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 309b94c328c8..a0bbec0bfee2 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -502,6 +502,8 @@ patternProperties:
>      description: Fujitsu Ltd.
>    "^fxtec,.*":
>      description: FX Technology Ltd.
> +  "^GalaxyCore,.*":
> +    description: GalaxyCore Inc.
>    "^gardena,.*":
>      description: GARDENA GmbH
>    "^gateway,.*":
> --=20
> 2.25.1
>=20

--01MH2fFNhMpUwwbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+MdwAKCRB4tDGHoIJi
0nBfAQC7ikdh/7CYWD8MVt9f89SRYiuaWItKq/AI5yLxntzi+wD+JZEaDfqSeBAQ
bZZuGrDAOKC/vGwQGO7ePPmXs4tOsw0=
=zkKC
-----END PGP SIGNATURE-----

--01MH2fFNhMpUwwbA--

