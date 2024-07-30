Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA7AC3DA7E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTzGbI6bZWcO4ru+wMVPnmMyzM7wM3NVdelZQfrIxGY=; b=3FKEY39FEgLr1++urDpxxcGJQt
	5dF6u1BpNiMlsPtCPy5cA0a0NDlM00PM2x7vuEyIPLqNuY09eCrUFGs/nwh6/skC76fmyDY4O2X3f
	Kk53tOBgasdD7q3HUZAbzpYNG+tSRTZ+Xt3FpIFh05DAMvptHDIcWMk0UG9KnBxxavg+8ZaQUNCc9
	61I/MriZFfajcJVBcjsSR79ghZgPhf76fzyXhBqdLxULAGdQc+BqIJnBWbm01rzD3/aY8IbA5cj99
	qkc3ZkSsrYvUqMvRT+t7Zb4PSRJ6YoL7CfmqLaeEDfis+HU40cCsMY6Um6zE2XcvEd/t0SNTkVMeu
	kqRWpd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmGB-0000000F9Bp-17lx;
	Tue, 30 Jul 2024 12:47:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmFi-0000000F96J-40lS;
	Tue, 30 Jul 2024 12:46:56 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 658FF743;
	Tue, 30 Jul 2024 14:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722343565;
	bh=rLth2rt6HbHw+vgytlfn4FpXMSOett+WFGgp6FMxcCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blImoJAI1q7mdYLHT/paJNKgz8FHY6RfIBFI8ZdV/Lj7ZS/E/SvVfJrTx6oWvz9np
	 qtGcfuuntpybL5WOKReAzI69xrTmsqW/aDdjF7dXr1spl4FSWoyr2fbRfC8HzKMvfa
	 R8Erc9FpG5taZkQrhC4EnjSDIWBiU351qJRK6yJ0=
Date: Tue, 30 Jul 2024 15:46:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20240730124631.GL1552@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
 <ca502463-84d0-4c50-b684-f509bfe857fb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca502463-84d0-4c50-b684-f509bfe857fb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_054655_160324_3E6A3CBA 
X-CRM114-Status: GOOD (  21.59  )
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

On Mon, Jul 29, 2024 at 04:57:36PM +0200, AngeloGioacchino Del Regno wrote:
> Il 29/07/24 16:48, Julien Stephan ha scritto:
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > 
> > This adds the bindings, for the ISP3.0 camsv module embedded in
> > some Mediatek SoC, such as the mt8365
> > 
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >   .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
> >   MAINTAINERS                                        |   1 +
> >   2 files changed, 110 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> > new file mode 100644
> > index 000000000000..fdd076756459
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2023 MediaTek, BayLibre
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek CAMSV 3.0
> 
> Sorry, can we unroll the "CAMSV" acronym?
> 
> Is that CAMera Sensor V(what?) or anything similar?

If someone can tell us what CAMSV stands for, yes :-) I don't know
personally, and I don't think Julien knows either.

> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +  - Julien Stephan <jstephan@baylibre.com>
> > +  - Andy Hsieh <andy.hsieh@mediatek.com>
> > +
> > +description:
> > +  The CAMSV is a video capture device that includes a DMA engine connected to
> > +  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8365-camsv
> > +
> > +  reg:
> > +    items:
> > +      - description: camsv base
> > +      - description: img0 base
> > +      - description: tg base
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: cam clock
> > +      - description: camtg clock
> > +      - description: camsv clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: cam
> > +      - const: camtg
> > +      - const: camsv
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Connection to the SENINF output
> > +
> > +    required:
> > +      - port@0
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - iommus
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> > +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> > +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        camsv@15050000 {
> > +            compatible = "mediatek,mt8365-camsv";
> > +            reg = <0 0x15050000 0 0x0040>,
> > +                  <0 0x15050208 0 0x0020>,
> > +                  <0 0x15050400 0 0x0100>;
> > +            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> > +            clocks = <&camsys CLK_CAM>,
> > +                     <&camsys CLK_CAMTG>,
> > +                     <&camsys CLK_CAMSV0>;
> > +            clock-names = "cam", "camtg", "camsv";
> > +            iommus = <&iommu M4U_PORT_CAM_IMGO>;
> > +            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                port@0 {
> > +                    reg = <0>;
> > +                    camsv1_endpoint: endpoint {
> > +                        remote-endpoint = <&seninf_camsv1_endpoint>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6bd7df1c3e08..9ac8c08ba692 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14163,6 +14163,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >   M:	Julien Stephan <jstephan@baylibre.com>
> >   M:	Andy Hsieh <andy.hsieh@mediatek.com>
> >   S:	Supported
> > +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> >   F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> >   
> >   MEDIATEK SMI DRIVER

-- 
Regards,

Laurent Pinchart

