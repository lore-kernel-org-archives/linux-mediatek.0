Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F7AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCfIAU4XMb60O7MjbbgmUxqie2tF6HVTSGKTzk1Ue+E=; b=36HT54RN6y6Lf79SXVGSjYSdZH
	KoLch5GJ/+OddpTOBV20hbQ5VivPJsNT3yNSESkVwUauYbaxlyM+DmYOgDeqeJgOWu4Wrb72LPgH0
	hW5N0az4FWKHzQOzNNPasvnGwd7V5VBDB7NZzG9XVRgFXgWwUrxe9cHrDdAMPJiZcme1QZQ00rfVI
	MBfxkt3eTOMtIPKgywkpNSbDVmkkpS/sX15E/kxGsjde4DjJrisfY7mZLLciYXzI+ZpOUWeIIgU2y
	4smS4dbtss8doOpgGFBD/2+PVCh8Splp5qegy3GrLnyahtIqLm7xI5PrzW79o3NyAPbcl9PuU/U5V
	7Bcf9AMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWW6-004k8b-Os; Thu, 06 Oct 2022 19:26:46 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWW3-004k70-Is; Thu, 06 Oct 2022 19:26:45 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-12c8312131fso3342354fac.4;
        Thu, 06 Oct 2022 12:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCfIAU4XMb60O7MjbbgmUxqie2tF6HVTSGKTzk1Ue+E=;
        b=6yxLbxp+1nRFPLtQbzCKKrMpnwvzyRuAEZaWQjvc8Rm4MTOiyToWAbF2YeGdxcIBJc
         3SLTRUVb57d0VZHwtdBXDu0nYs4i/RCZuNM2v/UI1JXjxDhcH0SJMWgnb4XCk9tBPCH/
         k5Fj5fgOAAeJiBkDiEHySmGzwXK0MkBGTOb6hI48Gmu4CL4XoUKfN0SRwpu97AGALI+O
         qH7IgBO3mC8NzXUQS5P4vX9oGecCyw1XVikt632QW5m0tlSLEN380FihbIuhZpeuJA4Z
         3VVwiX/Y7zNHkrya/uyhexIKTLVUfts0yfEs/eyIY0V3GIe+cUN8egSwMndxDPe2Ksox
         qj5w==
X-Gm-Message-State: ACrzQf291wmP7GcywIFElSHPnt5L6vqEmL0B3Xf/C8X8SW92zao9psal
	euapUkthjBNZbsUb8EmSWuRzri7Zkg==
X-Google-Smtp-Source: AMsMyM5+kBzVXKb8H9EzrAFDhADJ7Hy2DKKeEGGr/zYiwPbbTryldTxJ9M2hbxNwHxbnQldxlJq8pA==
X-Received: by 2002:a05:6870:5810:b0:127:a331:1e76 with SMTP id r16-20020a056870581000b00127a3311e76mr747672oap.292.1665084402259;
        Thu, 06 Oct 2022 12:26:42 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id 127-20020a4a1185000000b0044df311eee1sm8038ooc.33.2022.10.06.12.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:26:41 -0700 (PDT)
Received: (nullmailer pid 55788 invoked by uid 1000);
	Thu, 06 Oct 2022 19:26:39 -0000
Date: Thu, 6 Oct 2022 14:26:39 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
Message-ID: <20221006192639.GA49589-robh@kernel.org>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-7-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005174343.24240-7-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_122643_654629_E366E121 
X-CRM114-Status: GOOD (  24.86  )
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

On Wed, Oct 05, 2022 at 08:43:39PM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6795 pin controller document into MT6779 one. In the
> process, replace the current interrupts property description with
> the one from the MT6795 document since it makes more sense. Also
> amend property descriptions with more detailed information that
> was available in the MT6795 document, and replace the current
> pinmux node name patterns with ones from it since they are more
> common across mediatek pin controller bindings.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  90 +++++--
>  .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 225 ------------------
>  2 files changed, 73 insertions(+), 242 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index a2141eb0854e..64d4b6a3b5bd 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -8,6 +8,7 @@ title: Mediatek MT6779 Pin Controller
>  
>  maintainers:
>    - Andy Teng <andy.teng@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>    - Sean Wang <sean.wang@kernel.org>
>  
>  description:
> @@ -18,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt6779-pinctrl
> +      - mediatek,mt6795-pinctrl
>        - mediatek,mt6797-pinctrl
>  
>    reg:
> @@ -43,9 +45,8 @@ properties:
>    interrupt-controller: true
>  
>    interrupts:
> -    maxItems: 1

minItems: 1
maxItems: 2

>      description: |
> -      Specifies the summary IRQ.
> +      The interrupt output to sysirq.
>  
>    "#interrupt-cells":
>      const: 2
> @@ -81,6 +82,28 @@ allOf:
>              - const: iocfg_lt
>              - const: iocfg_tl
>              - const: eint
> +
> +        interrupts:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6795-pinctrl
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +
> +        reg-names:
> +          items:
> +            - const: base
> +            - const: eint
> +
> +        interrupts:
> +          minItems: 2
> +          maxItems: 2

Just 'minItems: 2'

>    - if:
>        properties:
>          compatible:
> @@ -111,32 +134,65 @@ allOf:
>          - "#interrupt-cells"
>  
>  patternProperties:
> -  '-[0-9]*$':
> +  '-pins$':
>      type: object
>      additionalProperties: false
>  
>      patternProperties:
> -      '-pins*$':
> +      '^pins':

Seems like these 2 changes would break a bunch of cases.

>          type: object
>          description: |
>            A pinctrl node should contain at least one subnodes representing the
>            pinctrl groups available on the machine. Each subnode will list the
>            pins it needs, and how they should be configured, with regard to muxer
> -          configuration, pullups, drive strength, input enable/disable and input schmitt.
> -        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +          configuration, pullups, drive strength, input enable/disable and
> +          input schmitt.
> +          An example of using macro:
> +          pincontroller {
> +            /* GPIO0 set as multifunction GPIO0 */
> +            gpio-pins {
> +              pins {
> +                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +              }
> +            };
> +            /* GPIO45 set as multifunction SDA0 */
> +            i2c0-pins {
> +              pins {
> +                pinmux = <PINMUX_GPIO45__FUNC_SDA0>;
> +              }
> +            };
> +          };

Just put this in the actual example.

> +        $ref: "pinmux-node.yaml"
>  
>          properties:
>            pinmux:
>              description:
> -              integer array, represents gpio pin number and mux setting.
> -              Supported pin number and mux varies for different SoCs, and are defined
> -              as macros in boot/dts/<soc>-pinfunc.h directly.
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
> +              directly.
>  
>            bias-disable: true
>  
> -          bias-pull-up: true
> -
> -          bias-pull-down: true
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: Pull up PUPD/R0/R1 type define value.
> +            description: |
> +               For normal pull up type, it is not necessary to specify R1R0
> +               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
> +               will set different resistance values.
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: Pull down PUPD/R0/R1 type define value.
> +            description: |
> +               For normal pull down type, it is not necessary to specify R1R0
> +               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
> +               will set different resistance values.
>  
>            input-enable: true
>  
> @@ -151,7 +207,7 @@ patternProperties:
>            input-schmitt-disable: true
>  
>            drive-strength:
> -            enum: [2, 4, 8, 12, 16]
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
>  
>            slew-rate:
>              enum: [0, 1]
> @@ -218,8 +274,8 @@ examples:
>              #interrupt-cells = <2>;
>              interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
>  
> -            mmc0_pins_default: mmc0-0 {
> -                cmd-dat-pins {
> +            mmc0_pins_default: mmc0-pins {
> +                pins-cmd-dat {
>                      pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
>                          <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
>                          <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
> @@ -232,11 +288,11 @@ examples:
>                      input-enable;
>                      mediatek,pull-up-adv = <1>;
>                  };
> -                clk-pins {
> +                pins-clk {
>                      pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
>                      mediatek,pull-down-adv = <2>;
>                  };
> -                rst-pins {
> +                pins-rst {
>                      pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
>                      mediatek,pull-up-adv = <0>;
>                  };

