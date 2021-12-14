Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D10BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4IseDx8hPPTdmbBBUMbwHBK+K/mSRWTkqOqf+lfl9Q=; b=MMI/Vh/CZDNo+Z
	i9aQzXssxfKwhDk9HQM0UqwpFW/VNm20LX8jK0j0bOiGsmUf5FNC/6y2dii6GOLYSI+XifW1DCnVh
	SCdbCJMPwPNEsx3b7qJVVFyM73q/bCX+PAU6sl8HoN2cWJK1DkVV+eREae/0t/Y+gewhGd6jqYPVK
	gxx6EMAMRgk5Y+KW+OX0EmRS3fkyQmQxtRWzrdWF/XXGUrsMM+3qMcTI6pX7rGeS0w7XOJ/6LK4Ke
	rpdnpmfMnrwR7Y5KrHw2EVQZ9BQNRb6BrCHvdaMB6Rl+WirFJcPBL+DufuWny7l02JBUTEDhFum/n
	l2MgsRO6GfgojC3Qf+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxApP-00Evua-Ml; Tue, 14 Dec 2021 16:38:59 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAp0-00Evmx-4N; Tue, 14 Dec 2021 16:38:36 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so21369522oto.13; 
 Tue, 14 Dec 2021 08:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QM2/tlWF4m4H0IDZNmPQ7oJ/pIe6U5NfI4L3E8LZyOo=;
 b=6s9eF7VXlDqRylfnPxTubbk6o7YJ78xuk2bSTgdZMn9dLnV4S/LG9AEmn9EGRskfWH
 BLZX98EL5su8/bVyFzYKFfSuunoXuIjWhG6zPdhvygdcZynSzR2V9iY3fi99OMJXVqN8
 mR6AFSbCVVjg0IL9R1ZJoJE1Lq1CBoHVpQ+0otKSXYBytBIkbMJE8eD0Zwyet6CGnivO
 pfs9IGK1aVxa2Cg7TWmszySJGJXtFv+OELI8GCP10FI5xsiyRLlnw2QzsB+LiaM9SOOA
 58yLIE7PJ83ly7n7D1jSCCitL1xa3IkR2pZGvJwmD+fhsMOC1cOuHR2bZkjkA6nNZ0wd
 CDwA==
X-Gm-Message-State: AOAM531q7pq0pyo+zblmbFqerRA12Vz+/ndOu7n1yvS1xAQUam/+VElx
 xXO/aGM0I5pC4IqI08Z7JQ==
X-Google-Smtp-Source: ABdhPJyPsHdUh009xZPGC2dJCH5F9i05bHswcSnmYZM9pkvZplYAs5LXDQf0IswpoCkzvH4kv7hoYg==
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr5090534oto.312.1639499911734; 
 Tue, 14 Dec 2021 08:38:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o10sm59268oom.32.2021.12.14.08.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:38:30 -0800 (PST)
Received: (nullmailer pid 3518884 invoked by uid 1000);
 Tue, 14 Dec 2021 16:38:29 -0000
Date: Tue, 14 Dec 2021 10:38:29 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com, broonie@kernel.org,
 bgolaszewski@baylibre.com, sean.wang@mediatek.com, bayi.cheng@mediatek.com,
 gch981213@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 3/4] dt-bindings: pinctrl: mt8195: add 'pins' wrapping
 node
Message-ID: <YbjIhaJgxtx9aSU6@robh.at.kernel.org>
References: <20211211204014.8014-1-tinghan.shen@mediatek.com>
 <20211211204014.8014-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211211204014.8014-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_083834_224810_1451F84E 
X-CRM114-Status: GOOD (  22.62  )
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

On Sun, Dec 12, 2021 at 04:40:13AM +0800, Tinghan Shen wrote:
> The mt8195 pinctrl driver requires a 'pins' subnode to wrap pin properties.

Why?

> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 307 +++++++++---------
>  1 file changed, 160 insertions(+), 147 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 5e2bb2bf3a55..2035bf164740 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -59,133 +59,143 @@ properties:
>  patternProperties:
>    '-pins$':
>      type: object
> -    description: |
> -      A pinctrl node should contain at least one subnodes representing the
> -      pinctrl groups available on the machine. Each subnode will list the
> -      pins it needs, and how they should be configured, with regard to muxer
> -      configuration, pullups, drive strength, input enable/disable and
> -      input schmitt.
> -      An example of using macro:
> -      pincontroller {
> -        /* GPIO0 set as multifunction GPIO0 */
> -        gpio_pin {
> -          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> -        };
> -        /* GPIO8 set as multifunction SDA0 */
> -        i2c0_pin {
> -          pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> -        };
> -      };
> -    $ref: "pinmux-node.yaml"
> -
> -    properties:
> -      pinmux:
> -        description: |
> -          Integer array, represents gpio pin number and mux setting.
> -          Supported pin number and mux varies for different SoCs, and are defined
> -          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> -
> -      drive-strength:
> -        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> -
> -      bias-pull-down:
> -        description: |
> -          For pull down type is normal, it don't need add RSEL & R1R0 define
> -          and resistance value.
> -          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> -          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> -          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> -          define in mt8195.
> -          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> -          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
> -          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> -          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> -          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> -          define in mt8195. It can also support resistance value(ohm) "75000" & "5000" in mt8195.
> -          oneOf:
> -            - enum: [100, 101, 102, 103]
> -            - description: mt8195 pull down PUPD/R0/R1 type define value.
> -            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> -            - description: mt8195 pull down RSEL type define value.
> -            - enum: [75000, 5000]
> -            - description: mt8195 pull down RSEL type si unit value(ohm).
> -
> -          An example of using RSEL define:
> -          pincontroller {
> -            i2c0_pin {
> -              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> -              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> -            };
> -          };
> -          An example of using si unit resistance value(ohm):
> -          &pio {
> -            mediatek,rsel_resistance_in_si_unit;
> -          }
> -          pincontroller {
> -            i2c0_pin {
> -              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> -              bias-pull-down = <75000>;
> -            };
> -          };
> -
> -      bias-pull-up:
> +    additionalProperties: false
> +    patternProperties:
> +      'pins':

Can we constrain this a bit more.

> +        type: object
> +        additionalProperties: false
>          description: |
> -          For pull up type is normal, it don't need add RSEL & R1R0 define
> -          and resistance value.
> -          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> -          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> -          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> -          define in mt8195.
> -          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> -          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
> -          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> -          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> -          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> -          define in mt8195. It can also support resistance value(ohm)
> -          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
> -          oneOf:
> -            - enum: [100, 101, 102, 103]
> -            - description: mt8195 pull up PUPD/R0/R1 type define value.
> -            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> -            - description: mt8195 pull up RSEL type define value.
> -            - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
> -            - description: mt8195 pull up RSEL type si unit value(ohm).
> -          An example of using RSEL define:
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and
> +          input schmitt.
> +          An example of using macro:
>            pincontroller {
> -            i2c0_pin {
> -              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> -              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> +            /* GPIO0 set as multifunction GPIO0 */
> +            gpio_pin {
> +              pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
>              };
> -          };
> -          An example of using si unit resistance value(ohm):
> -          &pio {
> -            mediatek,rsel_resistance_in_si_unit;
> -          }
> -          pincontroller {
> +            /* GPIO8 set as multifunction SDA0 */
>              i2c0_pin {
>                pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> -              bias-pull-up = <1000>;
>              };
>            };
> -
> -      bias-disable: true
> -
> -      output-high: true
> -
> -      output-low: true
> -
> -      input-enable: true
> -
> -      input-disable: true
> -
> -      input-schmitt-enable: true
> -
> -      input-schmitt-disable: true
> -
> -    required:
> -      - pinmux
> -
> -    additionalProperties: false
> +        $ref: "pinmux-node.yaml"
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
> +          bias-pull-down:
> +            description: |
> +              For pull down type is normal, it don't need add RSEL & R1R0 define
> +              and resistance value.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8195.
> +              For pull down type is RSEL, it can add RSEL define & resistance
> +              value(ohm) to set different resistance by identifying property
> +              "mediatek,rsel_resistance_in_si_unit".
> +              It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
> +              & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
> +              & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8195. It can also support resistance value(ohm)
> +              "75000" & "5000" in mt8195.
> +              oneOf:
> +                - enum: [100, 101, 102, 103]
> +                - description: mt8195 pull down PUPD/R0/R1 type define value.
> +                - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                - description: mt8195 pull down RSEL type define value.
> +                - enum: [75000, 5000]
> +                - description: mt8195 pull down RSEL type si unit value(ohm).
> +
> +              An example of using RSEL define:
> +              pincontroller {
> +                i2c0_pin {
> +                  pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +                  bias-pull-down = <MTK_PULL_SET_RSEL_001>;

Isn't this now out of date?

> +                };
> +              };
> +              An example of using si unit resistance value(ohm):
> +              &pio {
> +                mediatek,rsel_resistance_in_si_unit;
> +              }
> +              pincontroller {
> +                i2c0_pin {
> +                  pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +                  bias-pull-down = <75000>;
> +                };
> +              };
> +
> +          bias-pull-up:
> +            description: |
> +              For pull up type is normal, it don't need add RSEL & R1R0 define
> +              and resistance value.
> +              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8195.
> +              For pull up type is RSEL, it can add RSEL define & resistance
> +              value(ohm) to set different resistance by identifying property
> +              "mediatek,rsel_resistance_in_si_unit".
> +              It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
> +              & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
> +              & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8195. It can also support resistance value(ohm)
> +              "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" &
> +              "75000" in mt8195.
> +              oneOf:
> +                - enum: [100, 101, 102, 103]
> +                - description: mt8195 pull up PUPD/R0/R1 type define value.
> +                - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                - description: mt8195 pull up RSEL type define value.
> +                - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
> +                - description: mt8195 pull up RSEL type si unit value(ohm).
> +              An example of using RSEL define:
> +              pincontroller {
> +                i2c0_pin {
> +                  pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +                  bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> +                };
> +              };
> +              An example of using si unit resistance value(ohm):
> +              &pio {
> +                mediatek,rsel_resistance_in_si_unit;
> +              }
> +              pincontroller {
> +                i2c0_pin {
> +                  pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +                  bias-pull-up = <1000>;
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
>  
>  required:
>    - compatible
> @@ -201,30 +211,33 @@ additionalProperties: false
>  
>  examples:
>    - |
> -            #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> -            #include <dt-bindings/interrupt-controller/arm-gic.h>
> -            pio: pinctrl@10005000 {
> -                    compatible = "mediatek,mt8195-pinctrl";
> -                    reg = <0x10005000 0x1000>,
> -                          <0x11d10000 0x1000>,
> -                          <0x11d30000 0x1000>,
> -                          <0x11d40000 0x1000>,
> -                          <0x11e20000 0x1000>,
> -                          <0x11eb0000 0x1000>,
> -                          <0x11f40000 0x1000>,
> -                          <0x1000b000 0x1000>;
> -                    reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> -                          "iocfg_br", "iocfg_lm", "iocfg_rb",
> -                          "iocfg_tl", "eint";
> -                    gpio-controller;
> -                    #gpio-cells = <2>;
> -                    gpio-ranges = <&pio 0 0 144>;
> -                    interrupt-controller;
> -                    interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
> -                    #interrupt-cells = <2>;
> -
> -                    pio-pins {
> -                      pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> -                      output-low;
> -                    };
> -            };
> +    #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #
> +    pio: pinctrl@10005000 {
> +      compatible = "mediatek,mt8195-pinctrl";
> +      reg = <0x10005000 0x1000>,
> +            <0x11d10000 0x1000>,
> +            <0x11d30000 0x1000>,
> +            <0x11d40000 0x1000>,
> +            <0x11e20000 0x1000>,
> +            <0x11eb0000 0x1000>,
> +            <0x11f40000 0x1000>,
> +            <0x1000b000 0x1000>;
> +      reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> +                  "iocfg_br", "iocfg_lm", "iocfg_rb",
> +                  "iocfg_tl", "eint";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      gpio-ranges = <&pio 0 0 144>;
> +      interrupt-controller;
> +      interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
> +      #interrupt-cells = <2>;
> +
> +      pio-pins {
> +        pins_bus {

Don't use '_' in node names.

> +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +          output-low;
> +        };
> +      };
> +    };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
