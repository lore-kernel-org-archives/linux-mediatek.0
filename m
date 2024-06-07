Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D3FC27C53
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjuZF9YFMCyt7vHEOY4hC4haJuA8BL1l+S1hJkJtq90=; b=k/O5ZPfQmGb6+gIv697ondrcpR
	bS2hCbHgIH70mnmLUq6wEaw7EZc+pFnAezo0+uL1HsBx8Z0/XWsyPnsqcg/bEvFhMotF/LaQy2BNg
	PeHohoYyymHqg7N7ROKzFS1RYrc31OqIA6Vk3jag1QK8X5ppz/j/8XSarelm/OwQCLJvOxJVvoVtv
	QRVdg9TM7JddELtmUw4MIVAYZ5sKNgBfYWtK1lR+2pjietlVLeTKKjjBwm2KO1Cw6IhS0UpJ+91gp
	sMO6T0oxCgWUj1jzwAYBpR+2TOdf5ZTNE46JsaNdGzySRRCZhVTgea1cIRxupOoqnwJql4u6ZXxVB
	Ktuo1TiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVLA-0000000DCpm-3tsN;
	Fri, 07 Jun 2024 08:52:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVL7-0000000DCoY-3GAG
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jun 2024 08:52:51 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso40500266b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jun 2024 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717750366; x=1718355166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjuZF9YFMCyt7vHEOY4hC4haJuA8BL1l+S1hJkJtq90=;
        b=DaXIF8Ze/o7s8kQl1HWbUFNToxpQ9SeajGlW5L47ZNWe/EA5mGeQVOu9QsGYm2QmaU
         8RV3QK+xOL2WnJ3DhZPiS3FN7tjGKP/XwzJfXkNK3d9oa9GDBs1+O2jsB6UZZg4RA878
         uEIIH1Fa5R+26Kc2OrKRaYo8Ld5GpxZov1w1UJMm9FloYJCafek+/7YHXsBLrkvLLcsN
         I/8dovrkd/Fh8Q7oPSE8MqSnuUP4n93C594pdAAeVYn7A25+wJYDh2jJslwSNqV7da0R
         s/jCx1yGYVdy9TqbAKStKUjvh8itWXHISgTUZdJZHf3CT18Kw7E+toBrIkblLOjdIYJD
         aGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717750366; x=1718355166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjuZF9YFMCyt7vHEOY4hC4haJuA8BL1l+S1hJkJtq90=;
        b=S8k0k69CGzuoFwjJUJ2pGeiYmuwwaG+0E7mqvgCbqEml2k1kZgopcfmZUbpy595ruT
         +YTzPSX1t2vJO6zGlCtZn1OpiUpSbwYZG3ogYt13TMN5RpAi2yfCVxhUgs94Nac9yglm
         JJAFz0xLBIoETQ/6X59dHa0rOkREsATavO9ejO83B+ZgM4c2a3RHiFtMoHlRtjgVgqFm
         rWznYGumqh2HN58TTiR0977MxFdJRQ+Ki9i+CYbolsnqwrOynV4FtrTxaLdq/abGiNEu
         yHZgxhTTys5SqJXHYEtr8ygsHVBMxCuNLXIpmnwsKyk3tXIkVItUDDZXwa9Dt9eauqtK
         CMng==
X-Forwarded-Encrypted: i=1; AJvYcCVdoXGwg7pTgpdO1vkwULOgVIsVA5tz8f4bOOjrAT7eZZWmohrlteVhPOj+H28maNZbmpdjdYYhtpF07355loYQLLoWR9Ym1nwVCvtE1Gf+Xebo
X-Gm-Message-State: AOJu0YwRnvi0L9ImEeWvdhIMBdFXbMNaK5EP9z/ZNejXR7FlZ7Jf7X+G
	ywTQQXYI9yM73UOxWIAmABeLQNCF5AWXilYG29PHU87f+rmbz+L3W53Ch0K+jINKUApEjragidm
	nW75eLQ7b7sr3VuGhy+AAcZh5p5tAW2qRkhAnTw==
X-Google-Smtp-Source: AGHT+IHz0oblgfs6QK84jkLY1rRZ8G4iI07a+WGgFejWKVL3U8A1X2rtzxqVz9VMl0MyJrrPsb3bywI+y5oC/oU1aTg=
X-Received: by 2002:a17:906:4090:b0:a6e:c5c0:ba42 with SMTP id
 a640c23a62f3a-a6ec5c0bb34mr26417566b.30.1717750365646; Fri, 07 Jun 2024
 01:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com> <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
In-Reply-To: <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 7 Jun 2024 10:52:33 +0200
Message-ID: <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor interface
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Florian Sylvestre <fsylvestre@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_015249_845188_E4098DDC 
X-CRM114-Status: GOOD (  15.44  )
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

Le ven. 12 janv. 2024 =C3=A0 08:32, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 10/01/2024 15:14, Julien Stephan wrote:
> > From: Louis Kuo <louis.kuo@mediatek.com>
> >
> > This adds the bindings, for the mediatek ISP3.0 SENINF module embedded =
in
> > some Mediatek SoC, such as the mt8365
> >
>
> ...
>
> > +  clock-names:
> > +    items:
> > +      - const: camsys
> > +      - const: top_mux
> > +
> > +  phys:
> > +    minItems: 1
> > +    maxItems: 4
> > +    description:
> > +      phandle to the PHYs connected to CSI0/A, CSI1, CSI2 and CSI0B
> > +
> > +  phy-names:
> > +    minItems: 1
> > +    items:
> > +      - const: csi0
> > +      - const: csi1
> > +      - const: csi2
> > +      - const: csi0b
>
> Why one hardware has flexible number of phys?

Hi Krzysztof,

seninf can have multiple port depending on the soc, each requiring its own =
phy

>
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI0 or CSI0A port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI1 port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI2 port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI0B port
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 2
> > +
> > +      port@4:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for cam0
> > +
> > +      port@5:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for cam1
> > +
> > +      port@6:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv0
> > +
> > +      port@7:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv1
> > +
> > +      port@8:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv2
> > +
> > +      port@9:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: connection point for camsv3
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +      - port@2
> > +      - port@3
> > +      - port@4
> > +      - port@5
> > +      - port@6
> > +      - port@7
> > +      - port@8
> > +      - port@9
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> > +
> > +    soc {
> > +          #address-cells =3D <2>;
> > +          #size-cells =3D <2>;
>
> Use 4 spaces for example indentation.
>
> > +
> > +          seninf: seninf@15040000 {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
>
>
> > +                compatible =3D "mediatek,mt8365-seninf";
> > +                reg =3D <0 0x15040000 0 0x6000>;
> > +                interrupts =3D <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> > +                clocks =3D <&camsys CLK_CAM_SENIF>,
> > +                         <&topckgen CLK_TOP_SENIF_SEL>;
> > +                clock-names =3D "camsys", "top_mux";
> > +
> > +                power-domains =3D <&spm MT8365_POWER_DOMAIN_CAM>;
> > +
> > +                phys =3D <&mipi_csi0 PHY_TYPE_DPHY>;
> > +                phy-names =3D "csi0";
> > +
> > +                ports {
> > +                      #address-cells =3D <1>;
> > +                      #size-cells =3D <0>;
> > +
> > +                      port@0 {
> > +                            reg =3D <0>;
> > +                            seninf_in1: endpoint {
> > +                              clock-lanes =3D <2>;
> > +                              data-lanes =3D <1 3 0 4>;
> > +                              remote-endpoint =3D <&isp1_out>;
> > +                            };
> > +                      };
> > +
> > +                      port@1 {
> > +                          reg =3D <1>;
> > +                      };
> > +
> > +                      port@2 {
> > +                            reg =3D <2>;
> > +                      };
> > +
> > +                      port@3 {
> > +                            reg =3D <3>;
> > +                      };
> > +
> > +                      port@4 {
> > +                            reg =3D <4>;
> > +                            seninf_camsv1_endpoint: endpoint {
> > +                                remote-endpoint =3D <&camsv1_endpoint>=
;
> > +                            };
> > +                      };
> > +
> > +                      port@5 {
> > +                            reg =3D <5>;
> > +                      };
> > +
> > +                      port@6 {
> > +                            reg =3D <6>;
> > +                      };
> > +
> > +                      port@7 {
> > +                            reg =3D <7>;
> > +                      };
> > +
> > +                      port@8 {
> > +                            reg =3D <8>;
> > +                      };
> > +
> > +                      port@9 {
> > +                            reg =3D <9>;
> > +                      };
> > +
>
> Stray blank line
>
> > +                };
>
>
>
> Best regards,
> Krzysztof
>

