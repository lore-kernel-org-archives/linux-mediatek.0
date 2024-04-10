Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA09CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 11:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cfp9jVAn7ZeJksOEoDKhtdv83sClKEBJhxDRgrBHFps=; b=jF14znJUkQ9RliYSesnmuZWCN4
	xvgOz9rM+9arYP876+QSKZ1OtZDsrETLUEtDWci7ykYb/1UGOCRYjs99PA6gYAUaG2E6JMaGNXPRq
	QPpdId/DFAicxY35IVo7vWGPujJOCOG1jUv0Am/FokU2CrQG7Ta3sJIJ+N2+lRRcVPtbUO6yi2jU1
	REVghfIxSyiqWOfOsaU/6EjSfisoXTvNNpWCL3BtCJt9yMwOaZRQD9QB/e7q0vvKErI6ucAriNxrr
	dauevTZiigHbQXpLTr5I1I77KYjbfyt4u0wgQcoqa+bM5V7Llh2MuWynopaESbF3QUFFyAU0f6ZVu
	Bo/Z7f5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruW6q-00000006cbL-0TwA;
	Wed, 10 Apr 2024 11:27:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruW6m-00000006cZ5-0NP0;
	Wed, 10 Apr 2024 11:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5624661647;
	Wed, 10 Apr 2024 11:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A2AC433C7;
	Wed, 10 Apr 2024 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712748435;
	bh=FsOWXLW0PHDHZni/M6GeHDub8yyvYPEYUuELjlh26os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPLuWMgV4Ro+rz/gs08+aKeQeKpkKgHvt8o88/C0ptaAhIw4eeuP+qdoIWkzpxx60
	 QXZObbEInpnD6RbWaEzPVV6poph9LaVwAhfor2xzYdN1YVpwVaP2YBtMMh19vcmHH9
	 fr4rIsixpea2bMEUDORoIsITm0z81+/mikhb1v02Sj1Lr8jjxRcMCqO61AdGOLfYUV
	 c1aKnJ1eG117TwzfkT4+GLkkf3NPNJ3Y1dG3ftY4eIbDv4ZlTUe8s8LtN5gxMieWHA
	 NI9lyiE2T37SEoPwjmk+sUv8pE06b2EC9Km07eKUO/Wfmts7QHzEBW0qNGUUGiAkHW
	 KdHtpTM+JJAbg==
Date: Wed, 10 Apr 2024 12:27:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, yunkec@chromium.org, 10572168@qq.com
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: add Giantec GT97xx VCM
 driver
Message-ID: <20240410-rice-fringe-4ae992217a2f@spud>
References: <20240410104002.1197-1-zhi.mao@mediatek.com>
 <20240410104002.1197-2-zhi.mao@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ISZ8o4WhYZ7L06Pc"
Content-Disposition: inline
In-Reply-To: <20240410104002.1197-2-zhi.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_042716_331457_E4B8BF8B 
X-CRM114-Status: GOOD (  23.12  )
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


--ISZ8o4WhYZ7L06Pc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Apr 10, 2024 at 06:40:01PM +0800, Zhi Mao wrote:
> Add YAML device tree binding for GT97xx VCM driver,

Please don't mention drivers here, bindings are for hardware.

> and the relevant MAINTAINERS entries.
>=20
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>  .../bindings/media/i2c/giantec,gt97xx.yaml    | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,g=
t97xx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.y=
aml b/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml
> new file mode 100644
> index 000000000000..8c9f1eb4dac8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/giantec,gt97xx.yaml#

Filename patching compatible please.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Giantec Semiconductor, Crop. GT97xx Voice Coil Motor (VCM)
> +
> +maintainers:
> +  - Zhi Mao <zhi.mao@mediatek.com>
> +
> +description: |-
> +  The Giantec GT97xx is a 10-bit DAC with current sink capability.
> +  The DAC is controlled via I2C bus that operates at clock rates up to 1=
MHz.
> +  This chip integrates Advanced Actuator Control (AAC) technology
> +  and is intended for driving voice coil lens in camera modules.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - giantec,gt9768 # for GT9768 VCM
> +      - giantec,gt9769 # for GT9769 VCM

I don't think these comments are needed, they should be clear from the
compatibles, no?

> +
> +  reg:
> +    maxItems: 1
> +
> +  vin-supply: true
> +
> +  vdd-supply: true
> +
> +  giantec,aac-mode:
> +    description:
> +      Indication of AAC mode select.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 1    #  AAC2 mode(operation time# 0.48 x Tvib)
> +      - 2    #  AAC3 mode(operation time# 0.70 x Tvib)
> +      - 3    #  AAC4 mode(operation time# 0.75 x Tvib)
> +      - 5    #  AAC8 mode(operation time# 1.13 x Tvib)

I dislike these enum based properties and I would rather this either be
the values themselves (0.48, 0.70 etc).

> +    default: 2
> +
> +  giantec,aac-timing:
> +    description:
> +      Number of AAC Timing count that controlled by one 6-bit period of
> +      vibration register AACT[5:0], the unit of which is 100 us.

Then the property should be in a standard unit of time, not "random" hex
numbers that correspond to register values.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x20
> +    minimum: 0x00
> +    maximum: 0x3f
> +
> +  giantec,clock-presc:
> +    description:
> +      Indication of VCM internal clock dividing rate select, as one mult=
iple
> +      factor to calculate VCM ring periodic time Tvib.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0    #  Dividing Rate -  2
> +      - 1    #  Dividing Rate -  1
> +      - 2    #  Dividing Rate -  1/2
> +      - 3    #  Dividing Rate -  1/4
> +      - 4    #  Dividing Rate -  8
> +      - 5    #  Dividing Rate -  4

Same here, you should not need these comments explaining the values, use
an enum with meaningful values please.=20

> +    default: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vin-supply
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        vcm@c {

"vcm" is not a generic node-name, can you use one please?
Look around similar bindings or at the dt spec for generic node-names.

Thanks,
Conor.

> +            compatible =3D "giantec,gt9768";
> +            reg =3D <0x0c>;
> +
> +            vin-supply =3D <&gt97xx_vin>;
> +            vdd-supply =3D <&gt97xx_vdd>;
> +            giantec,aac-timing =3D <0x20>;
> +        };
> +    };
> +
> +...
> --=20
> 2.25.1
>=20

--ISZ8o4WhYZ7L06Pc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhZ3iwAKCRB4tDGHoIJi
0qQVAP9+OK/cYtTAIsZGXslgYKki3/Se5piJRnHXuSw9pqWl+wD/a7O+OCtP7921
6LtI+5nuhgIdoOKzNL+cFkLRYvI5nQM=
=cJO3
-----END PGP SIGNATURE-----

--ISZ8o4WhYZ7L06Pc--

