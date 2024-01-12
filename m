Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1732C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQ25iz9gUvraFf4qWlKe5Ahhb532UrANEy9/0VMuoSA=; b=hKu4uTdA12DgLsGOTwfYCNm7c3
	E4v+Jr43i+/xX62Rw1rHnlvn3S+KkbzubDAcgXOubjT4V5Ha2FFobqHsim4TUSXoR94I+N+iQJH+/
	KZx0Uez6TxVaSzzoFFWly1dXV5re6eqMbQU9BDckQpewR9Eg9wtJPY0omPyBNTZrzYi3Ge/0b8zka
	VdDMugPYGQfcs/i269Bdx/bAgdGkQCe0P7OzhzhcscD8D1ayDNQnBFjV6m9MQiXNORbeIDa1oHK0V
	IGHECNfdtrfVdgGukqIHrkmYhOnqvqJRF2DXjMwX5KtegbUFE7brO9ELTgfSf+iGxC/sQ1OJqXHfC
	gvy+b8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCAh-0026zQ-2r;
	Fri, 12 Jan 2024 07:41:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCAe-0026xt-0q;
	Fri, 12 Jan 2024 07:41:42 +0000
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F96BC67;
	Fri, 12 Jan 2024 08:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705045229;
	bh=MO4/NjAx26u9xJe2adlZSy9KUvlbrcggy/xFbm+XEuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6UnVRegzaVTm42OrnsGkNMEHYm4Rn5PJNsaKSnU37eepdVp/Tv2BLSt+t19UZdic
	 kfh6h1Pa8LGdVl/KzIiIgWMtwZ47KwhnlMj0rZi1PQhA66Bbr5qkzGsg3f9+wLTZ/N
	 4ewFUQryZb+sEPuJLkQDvHj39Gp9QBPBk5Rnq+W4=
Date: Fri, 12 Jan 2024 09:41:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20240112074141.GA21256@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-3-jstephan@baylibre.com>
 <feb4e04f-8282-4b52-b785-07bf15008e06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <feb4e04f-8282-4b52-b785-07bf15008e06@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_234140_460569_7303D4B2 
X-CRM114-Status: GOOD (  26.09  )
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

On Fri, Jan 12, 2024 at 08:34:45AM +0100, Krzysztof Kozlowski wrote:
> On 10/01/2024 15:14, Julien Stephan wrote:
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > 
> > This adds the bindings, for the ISP3.0 camsv module embedded in
> > some Mediatek SoC, such as the mt8365
> > 
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre.com
> > ---
> >  .../bindings/media/mediatek,mt8365-camsv.yaml | 109 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> > new file mode 100644
> > index 000000000000..097b1ab6bc72
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
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +  - Julien Stephan <jstephan@baylibre.com>
> > +  - Andy Hsieh <andy.hsieh@mediatek.com>
> > +
> > +description:
> > +  The CAMSV is a set of DMA engines connected to the SENINF CSI-2
> > +  receivers. The number of CAMSVs depend on the SoC model.
> 
> DMA should not go to media, but to dma

They're not generic DMA engines. The CAMSV is a video capture device
that includes a DMA engine, much like pretty much all the other video
capture devices.

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
> > +        description: connection point for camsv0
> 
> This explains me nothing. What type of connection point? How does it fit
> the pipeline going to the display?

The description seems wrong, it should state

        description: Connection to the SENINF output

or something similar.

> It seems you represented DMA as some other device to make your drivers
> easier... That's not how it works.
> 
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
> > +        camsv1: camsv@15050000 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

-- 
Regards,

Laurent Pinchart

