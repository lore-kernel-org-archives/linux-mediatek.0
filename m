Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6898CDE008
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6omZRqgAqUpHC3conHznQH5P9FFR7CNJZumHJQ4dp2g=; b=pQX6bLL9tb5arL+i9R3qhGnrG5
	I+j4VNk3JrZl5XZdZR6KiQfyP5A5tAj7Lnb7OmIjQtgb8DKhp7dKFJNcSgTnDYmPhwk6nfkB0XEnD
	AZj60QAmyV1WeLNKNWjfxRMKLOE5pKJBHu+5F7KrL//mXTqNQxT1669GxxJEv2054JP+KrvNl8NZh
	2kgzEc06gxBYy9UpPp6jhG0pKq6QOdEIgiNqu9nETOj84OVJ5H6IhQVXpOddGSK0FDj/Pm0bTtu6x
	o2IAtR+7Ysp1K0BGKXLDnEefJUhhlUYnl4l6QCu9C/PIngW1uPASusxMlgJ4it6joPzE55z3RnfJ/
	hlGhiYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd207-0000000As8h-2Rp8;
	Fri, 26 Jun 2026 08:33:27 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd204-0000000As8H-3kSV
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 08:33:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EDBF620045F;
	Fri, 26 Jun 2026 10:33:20 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wd200-004iw9-2r;
	Fri, 26 Jun 2026 10:33:20 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wd200-000000006aE-3MSM;
	Fri, 26 Jun 2026 10:33:20 +0200
Message-ID: <4ac862d82690a850eeaa997f041f22ee61233ed7.camel@pengutronix.de>
Subject: Re: [PATCH v1 1/2] Documentation: dt: reset: add
 mediatek,syscon-reset binding
From: Philipp Zabel <p.zabel@pengutronix.de>
To: peter.wang@mediatek.com, linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-devicetree@vger.kernel.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
Date: Fri, 26 Jun 2026 10:33:20 +0200
In-Reply-To: <20260626074820.2537772-2-peter.wang@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
	 <20260626074820.2537772-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_013325_155480_AD861DDC 
X-CRM114-Status: GOOD (  25.87  )
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

On Fr, 2026-06-26 at 15:46 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Add Device Tree binding documentation for the MediaTek SYSCON reset
> controller (mediatek,syscon-reset). This binding describes a reset
> controller that is part of a MediaTek SYSCON MFD block and manages
> multiple reset lines within that block.
>=20
> The reset lines are defined via the 'mediatek,reset-bits' property,
> where each entry is a five-cell tuple specifying the register offsets
> and bit positions for asserting and deasserting a reset line:
>=20
>   <set_offset set_bit clear_offset clear_bit delay_us>
>=20
> Consumers reference individual reset lines by index into this list
> using the standard '#reset-cells =3D <1>' scheme.
>=20
> An example is provided showing a UFS subsystem use case, where the
> reset controller is instantiated as a child node of the UFS syscon
> MFD node.
>=20
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>  .../bindings/reset/mediatek,syscon-reset.yaml | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/mediatek,sysc=
on-reset.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/reset/mediatek,syscon-rese=
t.yaml b/Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml
> new file mode 100644
> index 000000000000..45520ae6f090
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SYSCON Reset Controller
> +
> +maintainers:
> +  - Peter Wang <peter.wang@mediatek.com>
> +
> +description: |
> +  This describes a reset controller which is part of a MediaTek SYSCON b=
lock
> +  and is designed to manage multiple reset lines within that block.
> +
> +  The node should be a child of a syscon MFD node; it uses the parent's
> +  regmap and therefore does not require its own 'reg' property.
> +
> +  The reset specifier for consumers is an index into the 'mediatek,reset=
-bits'
> +  list. For example, to reference the second reset line:
> +
> +    resets =3D <&ufs0cfgao_rst 1>;
> +    reset-names =3D "hci_rst";
> +
> +properties:
> +  compatible:
> +    const: mediatek,syscon-reset
> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      The cell should contain the index into the 'mediatek,reset-bits'
> +      property to select the specific reset line.
> +
> +  mediatek,reset-bits:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    minItems: 1
> +    maxItems: 64
> +    description: |
> +      A list of reset bit definitions. Each reset line is defined by a
> +      five-cell entry: <set_offset set_bit clear_offset clear_bit delay_=
us>.
> +      The reset specifier in the consumer driver will be an index into
> +      this list. Up to 64 reset lines are supported per controller insta=
nce.
> +    items:
> +      items:
> +        - description: >
> +            Register offset from the parent syscon base for asserting
> +            the reset. Must be 4-byte aligned.
> +          minimum: 0
> +          multipleOf: 4
> +        - description: >
> +            Bit index (0-based) within the register for asserting reset.
> +          minimum: 0
> +          maximum: 31
> +        - description: >
> +            Register offset from the parent syscon base for deasserting
> +            the reset. Must be 4-byte aligned.
> +          minimum: 0
> +          multipleOf: 4
> +        - description: >
> +            Bit index (0-based) within the register for deasserting rese=
t.
> +          minimum: 0
> +          maximum: 31
> +        - description: >
> +            Minimum delay in microseconds between assertion and deassert=
ion
> +            during a full reset cycle. Use 0 if no delay is required.
> +          minimum: 0
> +          maximum: 1000000
> +
> +required:
> +  - compatible
> +  - '#reset-cells'
> +  - mediatek,reset-bits
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ufs0cfg_ao: syscon@16840000 {
> +        compatible =3D "mediatek,mt8183-ufs0cfg_ao", "syscon", "simple-m=
fd";

Where is the binding doc for mediatek,mt8183-ufs0cfg_ao? Is this
simple-mfd just to load the reset driver?

> +        reg =3D <0x16840000 0x1000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        ufs0cfgao_rst: reset-controller {
> +            compatible =3D "mediatek,syscon-reset";

It looks to me like this is just two registers inside ufs0cfg_ao, not a
separate device. Why don't you just add #reset-cells to the parent
node?

> +            #reset-cells =3D <1>;
> +            mediatek,reset-bits =3D
> +                <0x48  3  0x4c  3  100>,
> +                <0x148 0  0x14c 0  100>,
> +                <0x148 1  0x14c 1  100>,
> +                <0x148 2  0x14c 2  0>;
> +        };

Why is this in DT? This should be a table in the reset driver.

regards
Philipp

