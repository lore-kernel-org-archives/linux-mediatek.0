Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA294C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odSCtf43g66m4iDOcahuiv+23dWqctEIwhRpyIp7LRM=; b=xlAVC98bJ+VDtxs50XxuGjZJpt
	ZervfcYzKW56yqWy/tIf3RaOKz9rohmH/ncNQENTGaEL8AuoOhiabLX2ZhlFSdy+/OAjiukxZj3ek
	OERMTgvDiFb+VuIK8qBMIzXds4CgS6NozwuFonx1lOZ/PQN36bhjJxIY+egBWzB1Uak3FDtdFQu4p
	72TmuzhwNFMPmE3P3q/ozbwqlZvK6rVjO40hMaqNx7wmTN6Gxv1g5I5GmAZfR81Yrooi2IXizsrZa
	1tt7sytUSdgw7xwDNHCJUYjcqoM5ZNoFHUcJ0CM4ElkbLGH4froHFDJocQc1xrx8VdMnmMPU6Cgkc
	zzIfjYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqwI-000atL-5E; Mon, 10 Oct 2022 11:27:18 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqwE-000as6-W0
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 11:27:16 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id de14so6936618qvb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Oct 2022 04:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odSCtf43g66m4iDOcahuiv+23dWqctEIwhRpyIp7LRM=;
        b=vVwRl2+cxrmVghzaCBVUULCU9KLvC31/LWln8VhhDZMNw3L7RaI4QOyk/CNZfvEiDk
         K3SFX0lHUdIfSRxiuNZ86uDcoVfWW32Uxsu0V0R5+v0zHNOpIPJXcp/IVX8j0vhwDSYj
         sFrinDihgKoIbwWecHFGqf29GNIWLZ4TlnhErhjurg4wyRB1PLPmEbvHC+mlMaRy/+Vr
         zXBQnBUhwNOe+pZlc3BaH9eeEf5Ggf0U6mTyTMcdd/d0beIo8t+ZXo1b8OAJRmw6zkCX
         VzfoZWRMy5rmuvN5xjlP4Uxk4CSheZyGUVFEoRtvNED0rJ9FjEEynQzJOmsBYF58PLn+
         NO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odSCtf43g66m4iDOcahuiv+23dWqctEIwhRpyIp7LRM=;
        b=U3OFtbcJq/MuZRccSzq+CNaJg0N7JSmwwbzuwoBqajYU3+wQsb59VG1T/7MjiStN6b
         tgeQE3xXYhhDtk20KxGwIIUvhv6cqpl1CTMI12/4v/g50q0nEsl8VwII87PP7L0tb9zp
         LyAT2sGi8sgdY8Cs+GOVXzddtkr5qHoCsrD2zrx153hjb9baWigG9yxFYv8ojvrOZ+Ya
         EwaOHi48w/etg+RuqND3mlgxPbgW0J+G2jyQthVI3882MOJhfjh9tKkAnDJoXrnxg4Cg
         ppuSxaEX6Fvj8XUVhI9A8NSdQOlcp5kOoX2XIV/BpqVbixq36YDmN+QctJvFBSrbwBZZ
         YeOQ==
X-Gm-Message-State: ACrzQf0bO/Y2HzTIIPkbK3g5AjsFYhgYBgy74PRIcTLviTi1Y+3FvFhJ
	m58cyGMuwfJ7AWQwQJp/X3PQsQ==
X-Google-Smtp-Source: AMsMyM4yb53ZqK0THwHxH5mjARAZ1MjhYrO0IFD3HwvWL7rGl1jjhLngIhfmBWjjPyclz+YTHKodiA==
X-Received: by 2002:a05:6214:766:b0:4b3:e83b:6e8a with SMTP id f6-20020a056214076600b004b3e83b6e8amr7403207qvz.53.1665401232727;
        Mon, 10 Oct 2022 04:27:12 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id de14-20020a05620a370e00b006e07228ed53sm5969368qkb.18.2022.10.10.04.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:27:11 -0700 (PDT)
Message-ID: <0f078a85-056a-c11e-377b-27764a34485d@linaro.org>
Date: Mon, 10 Oct 2022 07:24:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 06/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-7-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007125904.55371-7-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_042715_071357_E588D54B 
X-CRM114-Status: GOOD (  26.70  )
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

On 07/10/2022 08:59, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6795 pin controller document into MT6779 one. In the
> process, replace the current interrupts property description with
> the one from the MT6795 document since it makes more sense. Also
> amend property descriptions and examples with more detailed
> information that was available in the MT6795 document, and replace
> the current pinmux node name patterns with ones from it since they
> are more common across mediatek pin controller bindings.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  94 ++++++--
>  .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 227 ------------------
>  2 files changed, 77 insertions(+), 244 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index a2141eb0854e..cada3530dd0a 100644
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
> @@ -43,9 +45,10 @@ properties:
>    interrupt-controller: true
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>      description: |
> -      Specifies the summary IRQ.
> +      The interrupt outputs to sysirq.

I am not sure if description is relevant now for all variants... what is
the sysirq? You have two interrupts so both go to one sysirq?

>  
>    "#interrupt-cells":
>      const: 2
> @@ -81,6 +84,30 @@ allOf:
>              - const: iocfg_lt
>              - const: iocfg_tl
>              - const: eint
> +
> +        interrupts:
> +          items:
> +            - description: EINT interrupt
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

What's the maxItems? You declared reg and reg-names in top-level
properties as accepting anything, therefore you cannot have loose
constraints here.


> +
> +        reg-names:
> +          items:
> +            - const: base
> +            - const: eint
> +
> +        interrupts:
> +          items:
> +            - description: EINT interrupt
> +            - description: EINT event_b interrupt

Blank line

>    - if:
>        properties:
>          compatible:
> @@ -111,32 +138,50 @@ allOf:
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
>          type: object
>          description: |
>            A pinctrl node should contain at least one subnodes representing the
>            pinctrl groups available on the machine. Each subnode will list the
>            pins it needs, and how they should be configured, with regard to muxer
> -          configuration, pullups, drive strength, input enable/disable and input schmitt.
> -        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +          configuration, pullups, drive strength, input enable/disable and
> +          input schmitt.
> +        $ref: "pinmux-node.yaml"

Drop quotes

Why this one is not pincfg-node anymore? All your properties are not
valid then? You mix here so many changes it is a bit difficult to
understand the concept.

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

Missing ref

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

Missing ref

> +                description: Pull down PUPD/R0/R1 type define value.
> +            description: |
> +               For normal pull down type, it is not necessary to specify R1R0
> +               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
> +               will set different resistance values.
>  
>            input-enable: true
>  
> @@ -151,7 +196,7 @@ patternProperties:
>            input-schmitt-disable: true
>  
>            drive-strength:
> -            enum: [2, 4, 8, 12, 16]
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]

Now you are missing ref - you do not have a type now, because you
removed pincfg-node. Split the merging of different pinctrl bindings and
reorganization.

The drive strengths are also not valid for the other variant...

>  
>            slew-rate:
>              enum: [0, 1]
> @@ -218,8 +263,9 @@ examples:
>              #interrupt-cells = <2>;
>              interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
>  
> -            mmc0_pins_default: mmc0-0 {
> -                cmd-dat-pins {
> +            /* GPIOs 167-174, 176-178 set as multifunction MSDC0 */
> +            mmc0_pins_default: mmc0-pins {
> +                pins-cmd-dat {
>                      pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
>                          <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
>                          <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
> @@ -232,15 +278,29 @@ examples:
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

Best regards,
Krzysztof


