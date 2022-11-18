Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D7AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68mrRnkzj3oQa0FLrqBNiAeYRXXNrTvDWJrNGCv156I=; b=FAyKTizqGzb1aXupFIZ86k2dDB
	inm0Okr6PPb/Uw3uHLpfVVLNAH/1nKP468yyDptWA9Yxckn/y/JWzFl0xpYTcaDQttpuquWhz0iyZ
	crPtEMLF9cV57HymprZAw++ofFTRFBfs8u19AfSckPikBwl7BP0FSW3Jvf2fIn3irEqPWrKEFbmxl
	CQx1T4O7UwpXtwfQavtizn34+fi+kgMc0AXrfnWIf3qwNcawuAcPGOnfXZec6toXjrxqCyrnFje9h
	Kg692+y/aSTTLgjq7gH7yXFe2l4vWBF2JwaNFIXWQE40SeebBEZqTGEPd9rU2wNcFQPok3/+EacQZ
	EjDIxgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwgb-002lGI-4N; Fri, 18 Nov 2022 08:25:21 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwgP-002lDW-CK
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 08:25:11 +0000
Received: by mail-lj1-x230.google.com with SMTP id a15so5877871ljb.7
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 00:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68mrRnkzj3oQa0FLrqBNiAeYRXXNrTvDWJrNGCv156I=;
        b=IzqPSO7wI+mpoQperr2WdlaDIYaeVBLe62eUhSFFin+LXc/0ZY09BXeSlRIHyIBZ+n
         g7FfS09ooCDKBkJb3VzV2MqrQtdT9bRKgVdPqIa+gFSkyvXQFEs9kB5y5UFKBRJnHG2Z
         oDglrrTv6LqEzvWT6rSw9dPDyTbFvQ/oxSZp7/TSivwNybxn4DuF6MRTZwgl3hk4pbvy
         TpF+1MxxsF2PqrJX20cXYajBdp3sxjAeAqF+ZsauGTn6EuPMLk0x5m9LbUO2RYTpElZ/
         +TjEyNeqvRV6h/NlVYPBvGZo8qgERFpmdKnEHlmyzi/d8/J/IauvI8LVUL6+8juPiKI+
         HsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68mrRnkzj3oQa0FLrqBNiAeYRXXNrTvDWJrNGCv156I=;
        b=bcOf+CeFoC99hxYs/pIkRuek7kf1qwxQh3Iorg5470FWTNWfy83YuuPavPEfmcDCqw
         OspR4ZYJxoSKVDjUUQWNL0JeGtaKJP9bUxD+ar3bTPSC9RdRe4idRz72kvWJkwh1T3uf
         UiqF/XeI8obPVyclmYvcConerfov1uZmjsEoSbetajN+ML9myqIRXbBNRiEQ4cSW0DfL
         lHwxVDcN09mdZA9nDB1zNnKGAtGedN2re/T0/Se+WfuPRfP6JZlehQQLUGlbsGqFI3vZ
         GZPaN4YCGj0TWcCwdW51H6ks+GwrDG9KU69jwR2K+eU1avk/gaJ6vMDH189EI3HLBATp
         S5Ng==
X-Gm-Message-State: ANoB5pk7K10Po1Xihq8A9Q+MxnrgWMoj/Z5kVqo/lUv3/Q0nVeE4qBn/
	n9rBgdzjWp6r/6uA8mILGHlbvQ==
X-Google-Smtp-Source: AA0mqf55+6foLHfURtmaNPN8s4c1OC+wlh2VDwlT3S4wWsNp2vY9mkeDoi9EWjoIx5Sxwx9lJ0MJhg==
X-Received: by 2002:a05:651c:205d:b0:26f:b445:8c8a with SMTP id t29-20020a05651c205d00b0026fb4458c8amr2309527ljo.156.1668759906201;
        Fri, 18 Nov 2022 00:25:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o15-20020ac24c4f000000b004a44ffb1050sm565729lfk.171.2022.11.18.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:25:05 -0800 (PST)
Message-ID: <06e916b7-f8f2-6de5-f86e-7b020c052451@linaro.org>
Date: Fri, 18 Nov 2022 09:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogiocchino.delregno@collabora.com
References: <20221117210356.3178578-1-bero@baylibre.com>
 <20221117210356.3178578-5-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117210356.3178578-5-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_002509_450444_2213CA55 
X-CRM114-Status: GOOD (  20.71  )
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

On 17/11/2022 22:03, Bernhard Rosenkränzer wrote:
> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Thank you for your patch. There is something to discuss/improve.

> +
> +  pins-are-numbered:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Specify the subnodes are using numbered pinmux to specify pins.

Why would you name pins differently per board? And why this different
naming of the same pins is a property of hardware?

This looks like something to drop.

> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> +      binding is used, the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +patternProperties:

patternProperties go before "required:" block.

> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      'pins':

How about anchoring it to either prefix or suffix? ^pins or pins$.

> +        type: object
> +        additionalProperties: false
> +        description: |
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"

Drop quotes.

> +
> +        properties:
> +          pinmux:
> +            description:
> +              integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in <soc>-pinfunc.h directly.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            description: |
> +              Besides generic pinconfig options, it can be used as the pull up
> +              settings for 2 pull resistors, R0 and R1. User can configure those
> +              special pins.
> +
> +          bias-pull-down: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          output-low: true
> +
> +          output-high: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          mediatek,drive-strength-adv:
> +            description: |
> +              Describe the specific driving setup property.
> +              For I2C pins, the existing generic driving setup can only support
> +              2/4/6/8/10/12/14/16mA driving. But in specific driving setup, they
> +              can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> +              driving setup, the existing generic setup will be disabled.
> +              The specific driving setup is controlled by E1E0EN.
> +              When E1=0/E0=0, the strength is 0.125mA.
> +              When E1=0/E0=1, the strength is 0.25mA.
> +              When E1=1/E0=0, the strength is 0.5mA.
> +              When E1=1/E0=1, the strength is 1mA.
> +              EN is used to enable or disable the specific driving setup.
> +              Valid arguments are described as below:
> +              0: (E1, E0, EN) = (0, 0, 0)
> +              1: (E1, E0, EN) = (0, 0, 1)
> +              2: (E1, E0, EN) = (0, 1, 0)
> +              3: (E1, E0, EN) = (0, 1, 1)
> +              4: (E1, E0, EN) = (1, 0, 0)
> +              5: (E1, E0, EN) = (1, 0, 1)
> +              6: (E1, E0, EN) = (1, 1, 0)
> +              7: (E1, E0, EN) = (1, 1, 1)
> +              So the valid arguments are from 0 to 7.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
> +          mediatek,pull-up-adv:
> +            description: |
> +              Pull up setings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are described as below:
> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          mediatek,pull-down-adv:
> +            description: |
> +              Pull down settings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are described as below:
> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          mediatek,tdsel:
> +            description: |
> +              An integer describing the steps for output level shifter duty
> +              cycle when asserted (high pulse width adjustment). Valid arguments
> +              are from 0 to 15.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          mediatek,rdsel:
> +            description: |
> +              An integer describing the steps for input level shifter duty cycle
> +              when asserted (high pulse width adjustment). Valid arguments are
> +              from 0 to 63.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +        required:
> +          - pinmux
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pio: pinctrl@1000b000 {
> +          compatible = "mediatek,mt8365-pinctrl";
> +          reg = <0 0x1000b000 0 0x1000>;
> +          mediatek,pctl-regmap = <&syscfg_pctl>;
> +          pins-are-numbered;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          interrupt-controller;
> +          #interrupt-cells = <2>;
> +          interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;

Blank line

> +          pio-pins {
> +            pins {
> +              pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>, <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
> +              mediatek,pull-up-adv = <3>;
> +              mediatek,drive-strength-adv = <00>;
> +              bias-pull-up;
> +            };
> +          };
> +        };
> +    };

Best regards,
Krzysztof


