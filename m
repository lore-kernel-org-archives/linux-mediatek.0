Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CC1C04A6A
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffQwIT8DtQciacgmcGYmh0gcVi8vW0sLMlcRipYUMb0=; b=JgN/vuBI+fyv/yV9C9oXgQzGrE
	o+hoxufHJY4BTmMYTRVji6NEg1Ckhncw8bBbGA2onO0sDm/Ywe+LCKou2nrS1J4edb8xKaTbLjSwh
	Wt5dxPZse1DUjMi5cgbTzcprmZaf0ojSXFzYN0iIg6ueMCjTzNqP/BvS7NlgzKmifujgzcM9CMcIL
	L7l4nU1S70oLU/TC11e+zYhQ6+35uJe3mosId7krFmk0CBFwsh0utF7oqmTiy1PsuMfJI4/E8BIgH
	RwU6Buf2MwIKDvyn+15MzsQqQA8pu/wzpw/PEGYLVdbUGAvo4XG9tgf+m6MP3MP2u6KQ4O+BfHLNH
	r/k8sgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV94T-00F0zz-0p;
	Sun, 13 Aug 2023 11:15:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV94P-00F0zH-31;
	Sun, 13 Aug 2023 11:15:43 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-997c4107d62so454709666b.0;
        Sun, 13 Aug 2023 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691925339; x=1692530139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ffQwIT8DtQciacgmcGYmh0gcVi8vW0sLMlcRipYUMb0=;
        b=lv+4s+abJJwmmA2QoTwzpHZqaGoE2Yx5q0hKU0hCe8ogbB3gAwMna3KPgse6NS2xb1
         eZ0Tt/z1tA9YMmPcqp1Sc7BGWBE7v9XIbBMcmQ7LIV3rZKZL7YObIo3IHn083S0G3Y5e
         zwOyOpUABJ+N48A1Utcrk7xpfR+QTjN/A6T6tC1U2v+Ardn3F6ZwxUZBSmby2PJcmYSh
         Ba3TxtfAEuD76QhCda2K/l49ES8jyAZ2+Mf0K/GGe1sdFDaSFrGRgKQs3dLyTp+sWgSs
         pZJrFyQYLwxxqB9bHolzDjAnQ2uRDf3HnYmqSGdhRqbd9mF713kBohK/zye1L0D57yKC
         Xmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691925339; x=1692530139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffQwIT8DtQciacgmcGYmh0gcVi8vW0sLMlcRipYUMb0=;
        b=QDGpogMJJEM4rnv//49F3RGyNsdsSMThLjStxkTcxWi8q52jpFOO6FEgOr+Rn6JF29
         bkVYLGRbOFYk6p4iXSMjwz/Q7EYBCun/rkHxpzqvHCO35cYiUM+OpSWp7z7EpyG65YDV
         ejdArToPz8yS4c5FU6mxH5cphf5JcQYvGZD/ZexYkC7sABnGtbyGikJ0MhUPf4qiaKnE
         G63UNjUKCU9D5E+OiuiaqdYHVQ76Vf6zHVROouHBKR61xIyCN3eQGZfVbzsRKdQU++tA
         HDpFrW7e1/AueFYtEl2Uw9/2wZ6+XUcGuQfnRP50ryFHQBVzpgzRuhPSqddgnDNG7mqn
         80+Q==
X-Gm-Message-State: AOJu0YwbRuE4FN1WvmIGLNTSyaBjS2YJhlhXIrt9tL+qxPwqK+vp8JQ8
	znJMM8/3EabS/uFzp9EHSLg=
X-Google-Smtp-Source: AGHT+IHbnnUzjq58IVRQ5OmTqhgJH3jrLO72zDiXsRXFG194sdp3hZNNtscLtOLq+nFZ5yAA6LXkOQ==
X-Received: by 2002:a17:907:7886:b0:994:54af:e282 with SMTP id ku6-20020a170907788600b0099454afe282mr6411319ejc.10.1691925339304;
        Sun, 13 Aug 2023 04:15:39 -0700 (PDT)
Received: from skbuf ([188.27.184.148])
        by smtp.gmail.com with ESMTPSA id f16-20020a170906561000b00992076f4a01sm4474034ejq.190.2023.08.13.04.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:15:38 -0700 (PDT)
Date: Sun, 13 Aug 2023 14:15:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230813111536.xzmxytghjzxhzmq7@skbuf>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230812091708.34665-3-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_041541_980552_9DF4CF85 
X-CRM114-Status: GOOD (  17.71  )
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

On Sat, Aug 12, 2023 at 12:17:06PM +0300, Arınç ÜNAL wrote:
> Add the schema to document the internal MDIO bus. Adjust realtek.yaml
> accordingly.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/net/dsa/dsa.yaml      | 18 +++++
>  .../devicetree/bindings/net/dsa/realtek.yaml  | 66 +++++++++----------
>  2 files changed, 50 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> index ec74a660beda..03ccedbc49dc 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -31,6 +31,24 @@ properties:
>        (single device hanging off a CPU port) must not specify this property
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>  
> +  mdio:
> +    description: The internal MDIO bus of the switch
> +    $ref: /schemas/net/mdio.yaml#
> +
> +if:
> +  required: [ mdio ]
> +then:
> +  patternProperties:
> +    "^(ethernet-)?ports$":
> +      patternProperties:
> +        "^(ethernet-)?port@[0-9]+$":
> +          if:
> +            not:
> +              required: [ ethernet ]

To match only on user ports, this must also exclude DSA ports ("required: [ link ]").

> +          then:
> +            required:
> +              - phy-handle

No. The only thing permitted by the slave_mii_bus is to do something meaningful
when phylink bindings ("phy-handle", "fixed-link" or "managed") are absent. But
the presence of slave_mii_bus does not imply that user ports have a required
phy-handle. They might be SerDes ports or xMII ports. So they might use "managed"
or "fixed-link". The only thing that you can enforce is that, if the slave_mii_bus
has an OF presence, then user ports must have phylink bindings.

> +
>  additionalProperties: true
>  
>  $defs:
> diff --git a/Documentation/devicetree/bindings/net/dsa/realtek.yaml b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> index cfd69c2604ea..ea7db0890abc 100644
> --- a/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> @@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Realtek switches for unmanaged switches
>  
> -allOf:
> -  - $ref: dsa.yaml#/$defs/ethernet-ports
> -
>  maintainers:
>    - Linus Walleij <linus.walleij@linaro.org>
>  
> @@ -95,37 +92,38 @@ properties:
>        - '#address-cells'
>        - '#interrupt-cells'
>  
> -  mdio:
> -    $ref: /schemas/net/mdio.yaml#
> -    unevaluatedProperties: false
> -
> -    properties:
> -      compatible:
> -        const: realtek,smi-mdio
> -
> -if:
> -  required:
> -    - reg
> -
> -then:
> -  $ref: /schemas/spi/spi-peripheral-props.yaml#
> -  not:
> -    required:
> -      - mdc-gpios
> -      - mdio-gpios
> -      - mdio
> -
> -  properties:
> -    mdc-gpios: false
> -    mdio-gpios: false
> -    mdio: false
> -
> -else:
> -  required:
> -    - mdc-gpios
> -    - mdio-gpios
> -    - mdio
> -    - reset-gpios
> +allOf:
> +  - $ref: dsa.yaml#/$defs/ethernet-ports
> +  - if:
> +      required: [ mdio ]
> +    then:
> +      properties:
> +        mdio:
> +          properties:
> +            compatible:
> +              const: realtek,smi-mdio
> +
> +  - if:
> +      required:
> +        - reg
> +    then:
> +      $ref: /schemas/spi/spi-peripheral-props.yaml#
> +      not:
> +        required:
> +          - mdc-gpios
> +          - mdio-gpios
> +          - mdio
> +
> +      properties:
> +        mdc-gpios: false
> +        mdio-gpios: false
> +        mdio: false
> +    else:
> +      required:
> +        - mdc-gpios
> +        - mdio-gpios
> +        - mdio
> +        - reset-gpios
>  
>  required:
>    - compatible
> -- 
> 2.39.2
> 


