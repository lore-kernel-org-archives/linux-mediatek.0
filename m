Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E28C27C53
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Lu22uaIM6tuLyEZn0JeQI5Ra8rc/jfabfCSvCXYE/A=; b=iFGsecagEqaCX9DHkPOTn82bh8
	f+N4RIRdlqTUXGgpPGH9Jzo9ldquh8Vzu3+ZfCvm99hEVfgmPal4nL86qHCyjJKtwOSOGXmmKbfd8
	PSPYIMrfNNjjFRKj6cP8xKKc929/Fa8UUpemlsk54fc86pksGo8clSKZNHi5sEqcxVkg4G3ilH/Ut
	RRgf+u/RxXaDRw0asQRG3kyquCeOaTJO2hd9sF28YcSBa1Ur/W5ynxDyotT1rta6YQFTcrtt8MCpN
	o61mmnhaGqT1G6e+AX/EzTm+AzIQIf8JgLokNBHtO23ogqZS19gOJJz5bxvoLvNfqoAOeclpIOw/0
	mKHVKxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFanU-0000000ETwa-0Yvo;
	Fri, 07 Jun 2024 14:42:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFanO-0000000ETs0-1gOJ;
	Fri, 07 Jun 2024 14:42:25 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0410C720;
	Fri,  7 Jun 2024 16:42:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717771324;
	bh=TXfIcxfKZ+HO9/x3g0vX/xX24/WbzhKt8eJbqKRPiYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhiYA8rHBz74Da65hnnjBv6TmnLse8pBYPca66L+wnUmaI1rJTsMeWX2PkE9FFd2y
	 2PmAfTk8/Z3/MYjvi6yklgkJ5exQ2LPdUf992QxJ7RhE8rbQ0Wv6AwzYK0ZbMaop5E
	 D2DpiIgJDKc8PxDE3VdHzpu1nDbpq+iMmUx4j7r4=
Date: Fri, 7 Jun 2024 17:41:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240607144154.GD18479@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_074222_627486_2AD8333D 
X-CRM114-Status: GOOD (  20.83  )
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

Hi Krzysztof,

On Fri, Jun 07, 2024 at 10:52:33AM +0200, Julien Stephan wrote:
> Le ven. 12 janv. 2024 à 08:32, Krzysztof Kozlowski a écrit :
> > On 10/01/2024 15:14, Julien Stephan wrote:
> > > From: Louis Kuo <louis.kuo@mediatek.com>
> > >
> > > This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> > > some Mediatek SoC, such as the mt8365
> > >
> >
> > ...
> >
> > > +  clock-names:
> > > +    items:
> > > +      - const: camsys
> > > +      - const: top_mux
> > > +
> > > +  phys:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +    description:
> > > +      phandle to the PHYs connected to CSI0/A, CSI1, CSI2 and CSI0B
> > > +
> > > +  phy-names:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: csi0
> > > +      - const: csi1
> > > +      - const: csi2
> > > +      - const: csi0b
> >
> > Why one hardware has flexible number of phys?
> 
> Hi Krzysztof,
> 
> seninf can have multiple port depending on the soc, each requiring its own phy
> 
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: CSI0 or CSI0A port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: CSI1 port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +
> > > +      port@2:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: CSI2 port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +
> > > +      port@3:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: CSI0B port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 2
> > > +
> > > +      port@4:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for cam0
> > > +
> > > +      port@5:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for cam1
> > > +
> > > +      port@6:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for camsv0
> > > +
> > > +      port@7:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for camsv1
> > > +
> > > +      port@8:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for camsv2
> > > +
> > > +      port@9:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: connection point for camsv3
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +      - port@2
> > > +      - port@3
> > > +      - port@4
> > > +      - port@5
> > > +      - port@6
> > > +      - port@7
> > > +      - port@8
> > > +      - port@9
> > > +
> > > +required:
> > > +  - compatible
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/phy/phy.h>
> > > +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> > > +
> > > +    soc {
> > > +          #address-cells = <2>;
> > > +          #size-cells = <2>;
> >
> > Use 4 spaces for example indentation.
> >
> > > +
> > > +          seninf: seninf@15040000 {
> >
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

The seninf is (mostly) a set of MIPI CSI-2 receivers. Would you prefer
'csi', 'mipi-csi', 'csi-2' or any other name ?

There's also the camsv IP in the same series that needs a generic name.
I really don't know what to propose for it. Could you recommend
something that would make you happy ?

On a side note, that document lacks appropriate generic names for lots
of building blocks found in recent SoCs, it would be nice to get it
updated. You will eventually get better quality DT patches then :-)

> > > +                compatible = "mediatek,mt8365-seninf";
> > > +                reg = <0 0x15040000 0 0x6000>;
> > > +                interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> > > +                clocks = <&camsys CLK_CAM_SENIF>,
> > > +                         <&topckgen CLK_TOP_SENIF_SEL>;
> > > +                clock-names = "camsys", "top_mux";
> > > +
> > > +                power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> > > +
> > > +                phys = <&mipi_csi0 PHY_TYPE_DPHY>;
> > > +                phy-names = "csi0";
> > > +
> > > +                ports {
> > > +                      #address-cells = <1>;
> > > +                      #size-cells = <0>;
> > > +
> > > +                      port@0 {
> > > +                            reg = <0>;
> > > +                            seninf_in1: endpoint {
> > > +                              clock-lanes = <2>;
> > > +                              data-lanes = <1 3 0 4>;
> > > +                              remote-endpoint = <&isp1_out>;
> > > +                            };
> > > +                      };
> > > +
> > > +                      port@1 {
> > > +                          reg = <1>;
> > > +                      };
> > > +
> > > +                      port@2 {
> > > +                            reg = <2>;
> > > +                      };
> > > +
> > > +                      port@3 {
> > > +                            reg = <3>;
> > > +                      };
> > > +
> > > +                      port@4 {
> > > +                            reg = <4>;
> > > +                            seninf_camsv1_endpoint: endpoint {
> > > +                                remote-endpoint = <&camsv1_endpoint>;
> > > +                            };
> > > +                      };
> > > +
> > > +                      port@5 {
> > > +                            reg = <5>;
> > > +                      };
> > > +
> > > +                      port@6 {
> > > +                            reg = <6>;
> > > +                      };
> > > +
> > > +                      port@7 {
> > > +                            reg = <7>;
> > > +                      };
> > > +
> > > +                      port@8 {
> > > +                            reg = <8>;
> > > +                      };
> > > +
> > > +                      port@9 {
> > > +                            reg = <9>;
> > > +                      };
> > > +
> >
> > Stray blank line
> >
> > > +                };

-- 
Regards,

Laurent Pinchart

