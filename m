Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C92C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JhvfwSerHJevbTjrgxZbFc36NslbyY4GFSoZTR74vE=; b=A3WV+01P9jYE+rBf2FTkCA95Rl
	yKYlvMnU9wViDZQ96JIsov0B2BqRjjbHU1NXB+LVuK3qppyb/oTTwCkwW5ZqsL0yw9Fe+66FUX/yG
	e3AviZZ0rAtT+HAiPoso7jzH4j0PxA6/GUFKRyF92NL6Tx3CsCMg5zXygAmPTFcGdWU+g4PlQkWrV
	lDB3vAXbkXq/kAOWlRvRFZx6x8ZsAx7lZcS5Rq4FrIkub680gzLh//ygyMKO9FTEudl09AnvLVbtu
	c/zQoYgno1TiyQijR3dBBYqdIZoDQSnIHVpPnVi1b+ImvQZSDfF6TBkgqoY9wbms9+nwvU1c8xoGP
	d3tfG1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRPt-00EM5L-Ab; Mon, 18 Jul 2022 14:08:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRPo-00ELza-OB
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 14:08:06 +0000
Received: by mail-lf1-x12c.google.com with SMTP id z22so5880802lfu.7
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Jul 2022 07:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1JhvfwSerHJevbTjrgxZbFc36NslbyY4GFSoZTR74vE=;
        b=KE4D7qn9+mLkdL+4PkRQfxtQE9O4A17G+yqAJMBftSCdle6r2WivRGDH0OP4jDKB6L
         pQJV/tF8SiQ8QXpTy2X2gMpKkPOLwQonvFwaIGenPNyRcGwK+3XxYayUq/FYpxpG+59c
         D4pUDJMNV8sct8Slunl3k2nn3qiIpniVArOjeOApmXFo4Z32TbZDpg+qdb6+zIftoW0t
         nCYWhUTsSCvo8+AiHmcIh1ctAKjLAyweaETE015yUGO8TYEnjV+MyS2j//vxdpJHR9nU
         G58cYD/ATYHKnEm2R+sKAMn7ttduhjJnNDkBLULFUSP6W1Vzyn7TBjWi1Ht1Kxstu1/P
         +z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1JhvfwSerHJevbTjrgxZbFc36NslbyY4GFSoZTR74vE=;
        b=AQJAyVDmxUgLpsP+VNCv9EtNtL1/dsb4OoHXLUDjnAtI91eO+/oWwmKc+Z7QBI2txf
         WTOUb+uCTUMWTiibWV+KzXSvJd9QRvctLtCQJZJmqGBvwKQrLqbega8iCGyGJ85dUGlh
         qi+F/y8AatWvnJsMfTizPgnyR7vxXPCyzlpe+8Zhhz9eh3tHktvdrpkF5gIIzUsQZTnN
         HbB5cauRILFNvo0xnKiAHrj0Gei1cPYQzdCp+SvEBROKDWuCQPTT8ZwdIcdh4g9Ads5K
         f4oxY5A+VBxab5Wx3nqF9REAj7n+3KwAGJfxomorJgUbxo4aLPHrDJ1qnroW0WELSSlF
         YG1Q==
X-Gm-Message-State: AJIora+wSLrr/7ph01Oj5N/JdeKrZJ6fmIVWoK1kjvgT7VSOVzccXeCr
	S+yBdV28gyiXTgCHbP/tSY6S4vod5HYNYJCs
X-Google-Smtp-Source: AGRyM1uA4X1ZcNACiUgMDBusnkLTOMJZhCjYj6GvRd0e8+DzhcDNpPkzzbvd/GVjQgAW+wjhDtT2yg==
X-Received: by 2002:a05:6512:4022:b0:48a:2c31:f26a with SMTP id br34-20020a056512402200b0048a2c31f26amr6529963lfb.94.1658153282930;
        Mon, 18 Jul 2022 07:08:02 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id n3-20020a05651203e300b00485e55192a3sm2404605lfq.72.2022.07.18.07.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 07:08:02 -0700 (PDT)
Message-ID: <b28dcbe5-d15f-1c4f-9b3d-650d5c39de6b@linaro.org>
Date: Mon, 18 Jul 2022 16:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: add pinctrl definition for
 mt8188
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: srv_heupstream@mediatek.com, johnson.wang@mediatek.com,
 zhiyong.tao@mediatek.com, sean.wang@mediatek.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220718113813.23787-1-hui.liu@mediatek.com>
 <20220718113813.23787-2-hui.liu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220718113813.23787-2-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_070804_855083_04509B56 
X-CRM114-Status: GOOD (  30.14  )
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

On 18/07/2022 13:38, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> This commit adds mt8188 compatible node in binding document.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8188.yaml      | 306 ++++++++++++++++++
>  1 file changed, 306 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8188.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8188.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8188.yaml
> new file mode 100644
> index 000000000000..43cc2424107f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8188.yaml

vendor,soc-ip
so:
mediatek,mt8188-pinctrl.yaml

> @@ -0,0 +1,306 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8188.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8188 Pin Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +description: |
> +  The MediaTek's Pin controller is used to control SoC pins.

Too generic description. Just drop it or make it useful.

> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.

Comment does not make sense.

> +    const: 2
> +
> +  gpio-ranges:
> +    description: gpio valid number range.

Redundant description, skip it.

> +    maxItems: 1
> +
> +  reg:
> +    description: |
> +      Physical address base for gpio base registers. There are 8 GPIO
> +      physical address base in mt8188.

Redundant description, skip it. You should list the instead and describe
each of it.

> +    maxItems: 8
> +
> +  reg-names:
> +    description: |
> +      Gpio base register names.

Redundant description, skip it.

> +    maxItems: 8

You need to list the items instead.

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.
> +    maxItems: 1
> +
> +  mediatek,rsel_resistance_in_si_unit:

No underscores in property names.

> +    type: boolean
> +    description: |
> +      Identifying i2c pins pull up/down type which is RSEL. It can support
> +      RSEL define or si unit value(ohm) to set different resistance.

I cannot understand this description.

> +
> +# PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false

Blank line. Missing ref to proper generic pinctrl schema.

> +    patternProperties:
> +      '^pins':
> +        type: object
> +        additionalProperties: false

Blank line. Missing ref to proper generic pinctrl schema.


> +        description: |
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and
> +          input schmitt.
> +          An example of using macro:
> +          pincontroller {
> +            /* GPIO0 set as multifunction GPIO0 */
> +            gpio-pins {
> +              pins {
> +                pinmux = <PINMUX_GPIO0__FUNC_B_GPIO0>;
> +              }
> +            };
> +            /* GPIO56 set as multifunction SDA0 */
> +            i2c0-pins {
> +              pins {
> +                pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>;
> +              }
> +            };

Drop the code from here. Put it in example.

> +          };
> +        $ref: "pinmux-node.yaml"

Oh, why it's here. This should be just after type.

> +
> +        properties:
> +          pinmux:
> +            description: |
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
> +              directly.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
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

No. Use logical units instead, so this should be either mA, no register
hard-coding in the bindings.

> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8188 pull down PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8188 pull down RSEL type define value.
> +              - enum: [75000, 5000]
> +                description: mt8188 pull down RSEL type si unit value(ohm).
> +            description: |
> +              For pull down type is normal, it don't need add RSEL & R1R0 define
> +              and resistance value.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8188.
> +              For pull down type is RSEL, it can add RSEL define & resistance
> +              value(ohm) to set different resistance by identifying property
> +              "mediatek,rsel_resistance_in_si_unit".
> +              It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
> +              & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
> +              & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8188. It can also support resistance value(ohm)
> +              "75000" & "5000" in mt8188.
> +
> +              An example of using RSEL define:
> +              pincontroller {
> +                i2c0_pin {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>;
> +                    bias-pull-updown = <MTK_PULL_SET_RSEL_001>;
> +                  }
> +                };
> +              };
> +              An example of using si unit resistance value(ohm):
> +              &pio {
> +                mediatek,rsel_resistance_in_si_unit;
> +              }
> +              pincontroller {
> +                i2c0_pin {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>;
> +                    bias-pull-down = <75000>;
> +                  }
> +                };
> +              };

To the example.

> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8188 pull up PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8188 pull up RSEL type define value.
> +              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
> +                description: mt8188 pull up RSEL type si unit value(ohm).
> +            description: |
> +              For pull up type is normal, it don't need add RSEL & R1R0 define
> +              and resistance value.
> +              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8188.
> +              For pull up type is RSEL, it can add RSEL define & resistance
> +              value(ohm) to set different resistance by identifying property
> +              "mediatek,rsel_resistance_in_si_unit".
> +              It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
> +              & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
> +              & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8188. It can also support resistance value(ohm)
> +              "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" &
> +              "75000" in mt8188.
> +              An example of using RSEL define:
> +              pincontroller {
> +                i2c0-pins {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>;
> +                    bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> +                  }
> +                };
> +              };
> +              An example of using si unit resistance value(ohm):
> +              &pio {
> +                mediatek,rsel_resistance_in_si_unit;
> +              }
> +              pincontroller {
> +                i2c0-pins {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>;
> +                    bias-pull-up = <1000>;
> +                  }
> +                };
> +              };

The same.

> +
> +          bias-disable: true
> +
> +          output-high: true
> +
> +          output-low: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +        required:
> +          - pinmux
> +
> +allOf:
> +  - $ref: "pinctrl.yaml#"

No need for quotes, especially that you use different here " than in
other places '.



Best regards,
Krzysztof

