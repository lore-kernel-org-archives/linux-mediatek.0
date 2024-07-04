Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1DEC30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTgqZTSYnAVOi/PCiWbuaELYwQdBtK3t7OMclccsGFM=; b=2RSQxVDvjhWXsprD2xNdBw+2WN
	lvQwu0BFmweatV5S1ZR7dZeQwiWo0IHcw/L68P9HRR7v026mzebsmSS0GlD2MaEa3/QcM/a2NKgHP
	8VmxGUOtJp+GsB4oV2Nr+ver7kiZTv9VcnNWM0QY/4w7MuQ3fRwm3yV3I3Vt8REVw4OHCYggLxRle
	sFVfU5XqlgWdR9fAAtroiHH/UZd35yjT551WGe/fLaErZ7uVgQbj03bxp3Z7L7oh/zaArR44+GE4s
	ZS8YLf4O10Q5NQCgohVDeyoLfi2cZqgoHL4VmZLFnxv+w5gasq1nWQrUn0bbvsOAnZgqRGMOXkoBZ
	/SKh9BKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPIk-0000000Dq4b-2X1C;
	Thu, 04 Jul 2024 16:27:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPPIW-0000000DpzS-2KGa;
	Thu, 04 Jul 2024 16:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B382CE38AB;
	Thu,  4 Jul 2024 16:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDFDC3277B;
	Thu,  4 Jul 2024 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720110421;
	bh=OJmz8+6ALNKIZuZiA3L7XZYVfl4eHNDpzxBW8RqwYCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrDUa8n+RnwzJxAa0YTpcTYvjdnrMog/75aNlJNG5oj0fBL9j91MXxE1+Q1mRDAb6
	 Yj8LuH/zQXwKEh3njCx7Q1x9MSPQDOGz68fSYbliJTtpC8RBC63uzqy+URgqkNaDgJ
	 8bgq+SeoubL1oGEb1DLUb1fttr8/CwKzK613L/q3R1SvZL0Fw/RCqmkGVfxD4aR2qp
	 8lXGA203OPoOdIvWqpGuiHFUtjvAOx1BbcUscY/IpQ9wB63AO+FMkFGDrD7qdzOGyo
	 Ys4HNl26qcwvstAg2XaOUhkUF+fqt+bjTIQz5UD/TqerHeehIO2Mn88M7V4F7zv1eP
	 IGeLbBQg4Xxkg==
Date: Thu, 4 Jul 2024 17:26:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240704-catcall-stubbly-9258b056e42e@spud>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-1-bfccccc5ec21@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="voVV9R7vNjAajsoC"
Content-Disposition: inline
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-1-bfccccc5ec21@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_092704_960294_D6BF48DE 
X-CRM114-Status: GOOD (  22.85  )
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


--voVV9R7vNjAajsoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 03:36:40PM +0200, Julien Stephan wrote:
> From: Louis Kuo <louis.kuo@mediatek.com>
>=20
> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> some Mediatek SoC, such as the mt8365
>=20
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> Link: https://lore.kernel.org/r/20230807094940.329165-2-jstephan@baylibre=
=2Ecom
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>

I'm really confused by the link tag here. At first glance this looked
like you were sending out something that had been applied by Laurent,
given the Link, Rb and SoB from him. Why does he have a SoB on this
patch? What did Phi-Bang Nguyen do with this patch, and should they have
a Co-developed-by tag?

> ---
>  .../bindings/media/mediatek,mt8365-seninf.yaml     | 275 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 282 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-seni=
nf.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.ya=
ml
> new file mode 100644
> index 000000000000..aeabea9f956a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> @@ -0,0 +1,275 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek, BayLibre
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Sensor Interface 3.0
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description:
> +  The ISP3.0 SENINF is the CSI-2 and parallel camera sensor interface fo=
und in
> +  multiple MediaTek SoCs. It can support up to three physical CSI-2 inpu=
t ports,
> +  configured in DPHY (2 or 4 data lanes) or CPHY depending on the SoC.
> +  On the output side, SENINF can be connected either to CAMSV instance or
> +  to the internal ISP. CAMSV is used to bypass the internal ISP processi=
ng
> +  in order to connect either an external ISP, or a sensor (RAW, YUV).
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-seninf
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Seninf camsys clock
> +      - description: Seninf top mux clock
> +
> +  clock-names:
> +    items:
> +      - const: camsys
> +      - const: top_mux
> +
> +  phys: true
> +
> +  phy-names: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI0 or CSI0A port
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI1 port
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI2 port
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI0B port
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 2
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: connection point for cam0
> +
> +      port@5:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: connection point for cam1
> +
> +      port@6:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: connection point for camsv0
> +
> +      port@7:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: connection point for camsv1
> +
> +      port@8:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: connection point for camsv2
> +
> +      port@9:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: connection point for camsv3
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@2
> +      - port@3
> +      - port@4
> +      - port@5
> +      - port@6
> +      - port@7
> +      - port@8
> +      - port@9
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mediatek,mt8365-seninf

The binding supports only a single compatible, why is this complexity
required? I don't see other devices being added in this series.

Cheers,
Conor.

> +then:
> +  properties:
> +    phys:
> +      minItems: 2
> +      maxItems: 2
> +      description:
> +        phandle to the PHYs connected to CSI0/A, CSI1, CSI0B
> +
> +    phy-names:
> +      description:
> +        list of PHYs names
> +      minItems: 2
> +      maxItems: 2
> +      items:
> +        type: string
> +        enum:
> +          - csi0
> +          - csi1
> +          - csi0b
> +      uniqueItems: true

--voVV9R7vNjAajsoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobNUAAKCRB4tDGHoIJi
0pbHAP9oyb3VVfiOce+y/RlLWtTgU60hGLandmi6ztVG/wGCjgEA7nzUqczM/a/v
53cqRK4JMbZsvZhR3V+fZ+JdSynKGgI=
=vYDF
-----END PGP SIGNATURE-----

--voVV9R7vNjAajsoC--

