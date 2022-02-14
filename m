Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F42C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 03:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9i2+LeG4obvfY94vgOVVy+YgGe+7PYdeTHkMyDs+Yg=; b=Q7kdOcjXhPpy4R
	HMz+I654FwpUCZY1JvAIbcEde5EaQHNOe+pFgktfFZHfj3so92oSkSoct9XFW3sGBjCl/Tv/ndhtN
	uiKHJa8lUNGxhtF94BnVy58VXFsuMTgbss3haF4YvgkVZJDytUS+7c/z+vF8KzaOK+Z/ZycAFI2B0
	cXi5w6HU55dmVLYlxJM/PP2o8zg3PamFsfRLBTZUsoeS1+aIiuDJdrsPAfhUrBqtLt4asChaGMYfV
	Ht7wV30r0L0FMXgbH9NdojJXrX2WmkZfncNDyqBpDLwb7h17vt77+5E99Z+z8kaJZ6tdeqOIIJhYA
	6XNsUpMfEx/8/f5MFlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJRfW-00D4cF-GB; Mon, 14 Feb 2022 03:04:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJRfE-00D4Sg-IR; Mon, 14 Feb 2022 03:04:35 +0000
X-UUID: 791d16e562bd4b3cab79e570f90a69b3-20220213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zJ56dtVlqzALVrQ89QxH3cAGZeO6r23Oe+3EkboRAuw=; 
 b=NW2NLLXbfgxa9Li/dRldTREBKAW0Rb5WMfGLWSU/eiyBc4FZc7hawQdMG7jW333URAzkBxFVKXX2bbmpUYI4Jtig4w62SU9juCptMCSluv1x/PVPbM0rWgqXnvC718juQefqYlFzpGZa1d29Z+lLI6Mol57L5hzo/LppNp5mrBQ=;
X-UUID: 791d16e562bd4b3cab79e570f90a69b3-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 249377814; Sun, 13 Feb 2022 20:04:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 19:04:26 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 11:04:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 11:04:24 +0800
Message-ID: <3a13098517b4fc3bbba3960ec9d24060460b9c34.camel@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8186: add pinctrl file
 and binding document
From: Guodong Liu <guodong.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Sean Wang
 <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 14 Feb 2022 11:04:24 +0800
In-Reply-To: <YgZWg6NgiuqN4H7U@robh.at.kernel.org>
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
 <20220210062122.23974-2-guodong.liu@mediatek.com>
 <YgZWg6NgiuqN4H7U@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_190432_670442_D6BBA23D 
X-CRM114-Status: GOOD (  32.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

-----Original Message-----
From: Rob Herring <robh@kernel.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <
matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Sean Wang <
sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, 
devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8186: add pinctrl
file and binding document
Date: Fri, 11 Feb 2022 06:28:51 -0600

On Thu, Feb 10, 2022 at 02:21:20PM +0800, Guodong Liu wrote:
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8186.yaml      |  313 +++++
>  include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174
> +++++++++++++++++
>  2 files changed, 1487 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-
> mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-
> mt8186.yaml
> new file mode 100644
> index 000000000000..54c9508af922
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> @@ -0,0 +1,313 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8186.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8186 Pin Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +description: |
> +  The Mediatek's Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8186-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> binding is used,
> +      the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of
> particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    description: gpio valid number range.

Don't need generic descriptions for common properties

Hi Rob

we will update it for next version.

Thanks
Guodong

> +    maxItems: 1
> +
> +  reg:
> +    description: |
> +      Physical address base for gpio base registers. There are 8
> different GPIO
> +      physical address base in mt8186.
> +    maxItems: 8
> +
> +  reg-names:
> +    description: |
> +      Gpio base register names.
> +    items:
> +      - const: "iocfg0"
> +      - const: "iocfg_bm"
> +      - const: "iocfg_bl"
> +      - const: "iocfg_br"
> +      - const: "iocfg_lm"
> +      - const: "iocfg_rb"
> +      - const: "iocfg_tl"
> +      - const: "eint"

Don't need quotes
Hi Rob

We will update it for next version.

Thanks
Guodong
> +    maxItems: 8
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.

Drop.
Hi Rob

We will update it for next version.

Thanks
Guodong
> +    maxItems: 1
> +
> +  mediatek,rsel-resistance-in-si-unit:
> +    type: boolean
> +    description: |
> +      Identifying i2c pins pull up/down type which is RSEL. It can
> support
> +      RSEL define or si unit value(ohm) to set different resistance.
> +
> +# PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '^pins':
> +        type: object
> +        additionalProperties: false
> +        description: |
> +          A pinctrl node should contain at least one subnodes
> representing the
> +          pinctrl groups available on the machine. Each subnode will
> list the
> +          pins it needs, and how they should be configured, with
> regard to muxer
> +          configuration, pullups, drive strength, input
> enable/disable and
> +          input schmitt.
> +          An example of using macro:
> +          pincontroller {
> +            /* GPIO0 set as multifunction GPIO0 */
> +            gpio-pins {
> +              pins {
> +                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +              }
> +            };
> +            /* GPIO128 set as multifunction SDA0 */
> +            i2c0-pins {
> +              pins {
> +                pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +              }
> +            };
> +          };
> +        $ref: "pinmux-node.yaml"
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              Integer array, represents gpio pin number and mux
> setting.
> +              Supported pin number and mux varies for different
> SoCs, and are
> +              defined as macros in dt-bindings/pinctrl/<soc>-
> pinfunc.h
> +              directly.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          mediatek,drive-strength-adv:
> +            description: |
> +              Describe the specific driving setup property.
> +              For I2C pins, the existing generic driving setup can
> only support
> +              2/4/6/8/10/12/14/16mA driving. But in specific driving
> setup, they
> +              can support 0.125/0.25/0.5/1mA adjustment. If we
> enable specific
> +              driving setup, the existing generic setup will be
> disabled.
> +              The specific driving setup is controlled by E1E0EN.
> +              When E1=0/E0=0, the strength is 0.125mA.
> +              When E1=0/E0=1, the strength is 0.25mA.
> +              When E1=1/E0=0, the strength is 0.5mA.
> +              When E1=1/E0=1, the strength is 1mA.
> +              EN is used to enable or disable the specific driving
> setup.
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
> +          bias-pull-down:
> +            oneOf:
> +              - enum: [100, 101, 102, 103]
> +              - description: mt8186 pull down PUPD/R0/R1 type define
> value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +              - description: mt8186 pull down RSEL type define
> value.
> +              - enum: [75000, 5000]
> +              - description: mt8186 pull down RSEL type si unit
> value(ohm).

This should fail validation. All the description entries are True, so 
oneOf will be False. Drop the '-' on description so the enum and 
description are 1 entry.
Hi Rob

We will update it for next version.

Thanks
Guodong
> +
> +            description: |
> +              For pull down type is normal, it don't need add RSEL &
> R1R0 define
> +              and resistance value.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0
> define to
> +              set different resistance. It can support
> "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8186.
> +              For pull down type is RSEL, it can add RSEL define &
> resistance
> +              value(ohm) to set different resistance by identifying
> property
> +              "mediatek,rsel-resistance-in-si-unit".
> +              It can support "MTK_PULL_SET_RSEL_000" &
> "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
> +              & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
> +              & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8186. It can also support resistance
> value(ohm)
> +              "75000" & "5000" in mt8186.
> +              An example of using RSEL define:

Perhaps move this to the example.
Hi Rob

Typically, I2C will config this type of pins as : "bias-pull-up =
<MTK_PULL_SET_RSEL_001>;", so we just move partial "bias-pull-up"
 description info to the example, and we will update it for next
version.

Thanks
Guodong
> +              pincontroller {
> +                i2c0_pin {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +                    bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> +                  }
> +                };
> +              };
> +              An example of using si unit resistance value(ohm):
> +              &pio {
> +                mediatek,rsel-resistance-in-si-unit;
> +              }
> +              pincontroller {
> +                i2c0_pin {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +                    bias-pull-down = <75000>;
> +                  }
> +                };
> +              };
> +
> +          bias-pull-up:
> +            oneOf:
> +              - enum: [100, 101, 102, 103]
> +              - description: mt8186 pull up PUPD/R0/R1 type define
> value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +              - description: mt8186 pull up RSEL type define value.
> +              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000,
> 75000]
> +              - description: mt8186 pull up RSEL type si unit
> value(ohm).
> +
> +            description: |
> +              For pull up type is normal, it don't need add RSEL &
> R1R0 define
> +              and resistance value.
> +              For pull up type is PUPD/R0/R1 type, it can add R1R0
> define to
> +              set different resistance. It can support
> "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8186.
> +              For pull up type is RSEL, it can add RSEL define &
> resistance
> +              value(ohm) to set different resistance by identifying
> property
> +              "mediatek,rsel-resistance-in-si-unit".
> +              It can support "MTK_PULL_SET_RSEL_000" &
> "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
> +              & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
> +              & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8186. It can also support resistance
> value(ohm)
> +              "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
> "10000" &
> +              "75000" in mt8186.
> +              An example of using RSEL define:
> +              pincontroller {
> +                i2c0-pins {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +                    bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> +                  }
> +                };
> +              };
> +              An example of using si unit resistance value(ohm):
> +              &pio {
> +                mediatek,rsel-resistance-in-si-unit;
> +              }
> +              pincontroller {
> +                i2c0-pins {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +                    bias-pull-up = <1000>;
> +                  }
> +                };
> +              };
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
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/mt8186-pinfunc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pio: pinctrl@10005000 {
> +      compatible = "mediatek,mt8186-pinctrl";
> +      reg = <0x10005000 0x1000>,
> +            <0x10002000 0x0200>,
> +            <0x10002200 0x0200>,
> +            <0x10002400 0x0200>,
> +            <0x10002600 0x0200>,
> +            <0x10002A00 0x0200>,
> +            <0x10002c00 0x0200>,
> +            <0x1000b000 0x1000>;
> +      reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> +                  "iocfg_br", "iocfg_lm", "iocfg_rb",
> +                  "iocfg_tl", "eint";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      gpio-ranges = <&pio 0 0 185>;
> +      interrupt-controller;
> +      interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
> +      #interrupt-cells = <2>;
> +
> +      pio-pins {
> +        pins {
> +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +          output-low;
> +        };
> +      };
> +
> +      spi0-pins {
> +        pins-spi {
> +          pinmux = <PINMUX_GPIO0__FUNC_SPI0_CLK_B>,
> +                   <PINMUX_GPIO1__FUNC_SPI0_CSB_B>,
> +                   <PINMUX_GPIO2__FUNC_SPI0_MO_B>;
> +          bias-disable;
> +        };
> +        pins-spi-mi {
> +          pinmux = <PINMUX_GPIO3__FUNC_SPI0_MI_B>;
> +          bias-pull-down;
> +        };
> +      };
> +
> +      i2c0-pins {
> +        pins {
> +          pinmux = <PINMUX_GPIO127__FUNC_SCL0>,
> +                   <PINMUX_GPIO128__FUNC_SDA0>;
> +          bias-disable;
> +          mediatek,drive-strength-adv = <7>;
> +        };
> +      };
> +    };
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
