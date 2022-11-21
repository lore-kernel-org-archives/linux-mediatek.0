Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41221C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cx+vQmomLfttwCMCGOoPCvf49U4u0nGKtW5QZKjz6Qk=; b=a+vgp2CwTA942bg6C2KIceGMKd
	6+rwooZjGVsBZEzOegcA9xn36YyLOcqbM+48hFpNRZH4JYRiCheJBMP9cDa5dvNRQQcr6cp9o3/Y1
	mXjVnc5zUnS0aGFATfyzlv9CEKR6SstQGljUQHIAdFcQ8+48ar1kTDcDT7U8B2ctU4pp5ZHo938/o
	WQYaHCmKmbejmbXSsZrdl13Qfpxw4SOQrv5HD3DM3e8uYKcFAXfR6V36n51jCRWnRBF3JOMSpgErK
	pqInGGdZBYX2uosYqZWV9BZFr/EhpzHFNK4MWndJz/hy3i52nPwUzrKH8nFcQhoRSgZpDKPpy7y71
	9+eABPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6xo-00E01d-S0; Mon, 21 Nov 2022 13:35:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6xZ-00Dzp0-8U; Mon, 21 Nov 2022 13:35:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 930256600368;
	Mon, 21 Nov 2022 13:35:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669037737;
	bh=Gs/X2WIhu83N5bOMAGI/yIdhsWS+1DzAFxhJ7Imonww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EtlQXMA8hw4v7kziGXcyI20rVpLG+yABkrVF9k4LgXtqvtLqEqFb6Sy1Xsoayqs4u
	 aNCRmJkjaa2M0N9lPcd/ftJY6mWxvjefy876nx3jVNRRlivuXrR9TOB6k5x2HqU015
	 Qv8PseYbNyadmo6tx/SjQrxmFKd3vBHJKab4HUTO+Trz/t9IVwr0eE72cjaRV8q0NI
	 VBjEKlNLLOqZVs0Z+9e7vFqqWySmu/2o5sI3nZdstN+QmCJ90hp1Iw3bXdYTERiQiU
	 Wzx0wTOlYmeF2HE7aWEpDC+k5lcmJyQpmjpvaIUmOn3IBb155Zsr/sV6Aq3Di5ZqpM
	 Sh+RU+DT8mybQ==
Message-ID: <4dbf0150-3e88-d640-2b27-147accb3f120@collabora.com>
Date: Mon, 21 Nov 2022 14:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 3/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add
 MT6795
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
 <20221118113028.145348-4-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118113028.145348-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_053541_711651_E8A411F7 
X-CRM114-Status: GOOD (  26.58  )
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

Il 18/11/22 12:30, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property as well as items of
> the interrupts property for each variant since they are different
> on MT6795.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  78 +++++-
>   .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 227 ------------------
>   2 files changed, 73 insertions(+), 232 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index 9d481311cc6b..f26584af5c8c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -8,6 +8,7 @@ title: Mediatek MT6779 Pin Controller
>   
>   maintainers:
>     - Andy Teng <andy.teng@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>     - Sean Wang <sean.wang@kernel.org>
>   
>   description:
> @@ -18,6 +19,7 @@ properties:
>     compatible:
>       enum:
>         - mediatek,mt6779-pinctrl
> +      - mediatek,mt6795-pinctrl
>         - mediatek,mt6797-pinctrl
>   
>     reg:
> @@ -43,9 +45,7 @@ properties:
>     interrupt-controller: true
>   
>     interrupts:
> -    maxItems: 1
> -    description: |
> -      Specifies the summary IRQ.
> +    description: Interrupt outputs to the system interrupt controller (sysirq).
>   
>     "#interrupt-cells":
>       const: 2
> @@ -81,6 +81,48 @@ allOf:
>               - const: iocfg_lt
>               - const: iocfg_tl
>               - const: eint
> +
> +        interrupts:
> +          items:
> +            - description: EINT interrupt
> +
> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [2, 4, 8, 12, 16]
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
> +          maxItems: 2
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

On MT6795 (and many others!), event_b is optional.

minItems: 1

Regards,
Angelo

> +
> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
>     - if:
>         properties:
>           compatible:
> @@ -99,6 +141,19 @@ allOf:
>               - const: iocfgb
>               - const: iocfgr
>               - const: iocfgt
> +
> +        interrupts:
> +          items:
> +            - description: EINT interrupt
> +
> +      patternProperties:
> +        '-pins$':
> +          patternProperties:
> +            '^pins':
> +              properties:
> +                drive-strength:
> +                  enum: [2, 4, 8, 12, 16]
> +
>     - if:
>         properties:
>           reg-names:
> @@ -169,8 +224,7 @@ patternProperties:
>   
>             input-schmitt-disable: true
>   
> -          drive-strength:
> -            enum: [2, 4, 8, 12, 16]
> +          drive-strength: true
>   
>             slew-rate:
>               enum: [0, 1]
> @@ -260,6 +314,20 @@ examples:
>                       mediatek,pull-up-adv = <0>;
>                   };
>               };
> +
> +            /* GPIO0 set as multifunction GPIO0 */
> +            gpio-pins {
> +                pins {
> +                    pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +                };
> +            };
> +
> +            /* GPIO52 set as multifunction SDA0 */
> +            i2c0-pins {
> +                pins {
> +                  pinmux = <PINMUX_GPIO52__FUNC_SDA0>;
> +                };
> +            };
>           };
>   
>           mmc0 {
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> deleted file mode 100644
> index 9399e0215526..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
> +++ /dev/null
> @@ -1,227 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/pinctrl/mediatek,pinctrl-mt6795.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Mediatek MT6795 Pin Controller
> -
> -maintainers:
> -  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> -  - Sean Wang <sean.wang@kernel.org>
> -
> -description: |
> -  The Mediatek's Pin controller is used to control SoC pins.
> -
> -properties:
> -  compatible:
> -    const: mediatek,mt6795-pinctrl
> -
> -  gpio-controller: true
> -
> -  '#gpio-cells':
> -    description: |
> -      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> -      the amount of cells must be specified as 2. See the below
> -      mentioned gpio binding representation for description of particular cells.
> -    const: 2
> -
> -  gpio-ranges:
> -    description: GPIO valid number range.
> -    maxItems: 1
> -
> -  reg:
> -    description:
> -      Physical address base for gpio base and eint registers.
> -    minItems: 2
> -
> -  reg-names:
> -    items:
> -      - const: base
> -      - const: eint
> -
> -  interrupt-controller: true
> -
> -  '#interrupt-cells':
> -    const: 2
> -
> -  interrupts:
> -    description: Interrupt outputs to the system interrupt controller (sysirq).
> -    minItems: 1
> -    items:
> -      - description: EINT interrupt
> -      - description: EINT event_b interrupt
> -
> -# PIN CONFIGURATION NODES
> -patternProperties:
> -  '-pins$':
> -    type: object
> -    additionalProperties: false
> -    patternProperties:
> -      '^pins':
> -        type: object
> -        additionalProperties: false
> -        description: |
> -          A pinctrl node should contain at least one subnodes representing the
> -          pinctrl groups available on the machine. Each subnode will list the
> -          pins it needs, and how they should be configured, with regard to muxer
> -          configuration, pullups, drive strength, input enable/disable and
> -          input schmitt.
> -          An example of using macro:
> -          pincontroller {
> -            /* GPIO0 set as multifunction GPIO0 */
> -            gpio-pins {
> -              pins {
> -                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> -              }
> -            };
> -            /* GPIO45 set as multifunction SDA0 */
> -            i2c0-pins {
> -              pins {
> -                pinmux = <PINMUX_GPIO45__FUNC_SDA0>;
> -              }
> -            };
> -          };
> -        $ref: "pinmux-node.yaml"
> -
> -        properties:
> -          pinmux:
> -            description: |
> -              Integer array, represents gpio pin number and mux setting.
> -              Supported pin number and mux varies for different SoCs, and are
> -              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h
> -              directly.
> -
> -          drive-strength:
> -            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> -
> -          bias-pull-down:
> -            oneOf:
> -              - type: boolean
> -              - enum: [100, 101, 102, 103]
> -                description: mt6795 pull down PUPD/R0/R1 type define value.
> -            description: |
> -               For normal pull down type, it is not necessary to specify R1R0
> -               values; When pull down type is PUPD/R0/R1, adding R1R0 defines
> -               will set different resistance values.
> -
> -          bias-pull-up:
> -            oneOf:
> -              - type: boolean
> -              - enum: [100, 101, 102, 103]
> -                description: mt6795 pull up PUPD/R0/R1 type define value.
> -            description: |
> -               For normal pull up type, it is not necessary to specify R1R0
> -               values; When pull up type is PUPD/R0/R1, adding R1R0 defines
> -               will set different resistance values.
> -
> -          bias-disable: true
> -
> -          output-high: true
> -
> -          output-low: true
> -
> -          input-enable: true
> -
> -          input-disable: true
> -
> -          input-schmitt-enable: true
> -
> -          input-schmitt-disable: true
> -
> -          mediatek,pull-up-adv:
> -            description: |
> -              Pull up setings for 2 pull resistors, R0 and R1. User can
> -              configure those special pins. Valid arguments are described as below:
> -              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> -              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> -              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> -              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -            enum: [0, 1, 2, 3]
> -
> -          mediatek,pull-down-adv:
> -            description: |
> -              Pull down settings for 2 pull resistors, R0 and R1. User can
> -              configure those special pins. Valid arguments are described as below:
> -              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> -              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> -              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> -              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -            enum: [0, 1, 2, 3]
> -
> -        required:
> -          - pinmux
> -
> -allOf:
> -  - $ref: "pinctrl.yaml#"
> -
> -required:
> -  - compatible
> -  - reg
> -  - reg-names
> -  - interrupts
> -  - interrupt-controller
> -  - '#interrupt-cells'
> -  - gpio-controller
> -  - '#gpio-cells'
> -  - gpio-ranges
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/interrupt-controller/irq.h>
> -    #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
> -
> -    soc {
> -        #address-cells = <2>;
> -        #size-cells = <2>;
> -
> -        pio: pinctrl@10005000 {
> -            compatible = "mediatek,mt6795-pinctrl";
> -            reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
> -            reg-names = "base", "eint";
> -            gpio-controller;
> -            #gpio-cells = <2>;
> -            gpio-ranges = <&pio 0 0 196>;
> -            interrupt-controller;
> -            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> -            #interrupt-cells = <2>;
> -
> -            i2c0-pins {
> -                pins-sda-scl {
> -                    pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
> -                             <PINMUX_GPIO46__FUNC_SCL0>;
> -                };
> -            };
> -
> -            mmc0-pins {
> -                pins-cmd-dat {
> -                    pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
> -                             <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
> -                             <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
> -                             <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
> -                             <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
> -                             <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
> -                             <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
> -                             <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
> -                             <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
> -                    input-enable;
> -                    bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> -                };
> -
> -                pins-clk {
> -                    pinmux = <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
> -                    bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> -                };
> -
> -                pins-rst {
> -                    pinmux = <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
> -                    bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
> -                };
> -            };
> -        };
> -    };




