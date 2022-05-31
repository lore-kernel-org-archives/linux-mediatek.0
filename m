Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779EBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IgE5+TQqe4Ko4AVhsvZfYB/ZvDRZiW5qLXMyXkug4c=; b=3AXekJIFflHzGz
	rUasweIq72YmmonjHnaLzJ44eJm+QcbglIAJQLP9UViIEPWbGTBhLHA6ULwknnMsn9feexJL0ixIC
	Fw51mXjIUvwcMQ5Ncp/o2iInA3RjNF5CG2dYaMmvf7AQ2al6cKOOiLM24IDP2NYn1lIcAMQnF8P3r
	67JaIFZ1aWG2f43ur9aFpuxQA/zzvjCt89p4jCk4zwGpqZfBlZxFcds8scsLv/8OQxaUdGKWmujFM
	FBc3xt4CDunqFTQpj6LSIECjnVjYYSHDPK/F988wuYAKqISWyVQK6MR5W9dob3A20cPbECmOHmTbQ
	tYRAzR02PlXdAa5uyZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8lC-00Ccrp-AB; Tue, 31 May 2022 20:46:38 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8kz-00Ccn7-MS
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 20:46:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id f9so29021148ejc.0
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 13:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KcvmS0RVCH7dS0drP08+taDktOji7A6kv3U7tUCF6Ik=;
        b=HTr4rtci7pN7h0V00Ch+MPN8QFo2ca3cbuR97hJFCjr/w9xXjQBq2dVHkwu2xOQxuP
         1BAcI7MDZnyoPC+UpdTeLBJPlg2PhTf6pVAwFMZWgaAMuCIAkFRoqjReMoODOOjmEMJX
         IjUtvCCX1SazMLSX9dPPH4ll/fvXY9zNkCpWYWWm6qiRiNScCJ5X+FtKaejGXadsVW5p
         Lz/guvnDDwLOuKIEGKL0cTmlihLsXks9QmOOfUl3nvKkS4hvGf3sf1rozyplnW3X71yG
         o2gtsW2bOmKqoFZiVYnKs8AIcYfZFHvPWTEsCleu1N6AOYbrFfsieqmW/d1LzaiWM6l2
         +aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KcvmS0RVCH7dS0drP08+taDktOji7A6kv3U7tUCF6Ik=;
        b=URfGAsgaLp0Q0VVOjsuRQZpXb4rt8mYpB4WRusJX5f/mB/1qYeXRHR754XTP71qK2N
         py4OEbMm1qNRM8PSRqLGMKi77D4mTzvSKo4xFCsntY+y5n8jrmzpfKPHULI7npn0d6hq
         7oAgCNzwAI9RuKCdIiqMnWKmc1luIYoCMsR3bgpLVvPfdFgZWab6i8ae1kdSQElivdk4
         QbVngVhwZXo53e6QRRKlQtevqNnMOHkhHzNAeqo7ZZCk/esVhNPgaosXauLK7t/5+t/F
         VK4xDa7qXAFDtb9oyOpY1u6eSKWeqzL4zGpjybm/4xV22qqYcoicmkwmm5CYbbTYH7lW
         0fUQ==
X-Gm-Message-State: AOAM531ip4mc7XeFA0AAOP6TsbX+P3OrQG5fL7MR1JadGOq5K1NOLbrj
	O72rLQFkXlZUR+2ig5cMuoHd7g==
X-Google-Smtp-Source: ABdhPJxKQIk0np3addOYv0X6i3FNyMcBrbHc8niPiUYWepcaSBJXVhBWS9DiYV743l/82t3zhs6jFw==
X-Received: by 2002:a17:906:685:b0:6fa:8e17:e9b5 with SMTP id u5-20020a170906068500b006fa8e17e9b5mr57334212ejb.522.1654029981975;
        Tue, 31 May 2022 13:46:21 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k2-20020a1709063e0200b006f3ef214e5bsm5182391eji.193.2022.05.31.13.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 13:46:21 -0700 (PDT)
Message-ID: <4ac3dc81-98e5-8c94-8dd4-b30ee587eb42@linaro.org>
Date: Tue, 31 May 2022 22:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 14/14] dt-bindings: mfd: Add Mediatek MT6370 binding
 documentation
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-15-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531102809.11976-15-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_134625_758734_A4C7E1B5 
X-CRM114-Status: GOOD (  21.02  )
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

On 31/05/2022 12:28, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 binding documentation.

Subject: same as previous patches.

> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/mfd/mediatek,mt6370.yaml         | 282 ++++++++++++++++++
>  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
>  include/dt-bindings/mfd/mediatek,mt6370.h     |  83 ++++++
>  3 files changed, 383 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
>  create mode 100644 include/dt-bindings/mfd/mediatek,mt6370.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> new file mode 100644
> index 000000000000..96a12dce0108
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> @@ -0,0 +1,282 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 SubPMIC
> +
> +maintainers:
> +  - ChiYuan Huang <cy_huang@richtek.com>
> +
> +description: |
> +  MT6370 is a highly-integrated smart power management IC, which includes a
> +  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
> +  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
> +  driver, a backlight WLED driver, a display bias driver and a general LDO for
> +  portable devices.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370
> +
> +  reg:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  adc:
> +    type: object
> +    description: |
> +      List the compatible configurations of MT6370 ADC.

This sentence does not make any sense. The "description" field is to
describe, explain the meaning behind given property.

> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6370-adc
> +
> +      "#io-channel-cells":
> +        const: 1
> +
> +    required:
> +      - compatible
> +      - '#io-channel-cells'
> +
> +  backlight:
> +    type: object
> +    $ref: /schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
> +
> +  charger:
> +    type: object
> +    $ref: /schemas/power/supply/mediatek,mt6370-charger.yaml#
> +
> +  tcpc:
> +    type: object
> +    $ref: /schemas/usb/mediatek,mt6370-tcpc.yaml#
> +
> +  indicator:
> +    type: object
> +    $ref: /schemas/leds/mediatek,mt6370-indicator.yaml#
> +
> +  flashlight:
> +    type: object
> +    $ref: /schemas/leds/mediatek,mt6370-flashlight.yaml#
> +
> +  regulators:
> +    type: object
> +    description: |
> +      List all supported regulators

Ditto

> +
> +    patternProperties:
> +      "^(dsvbst|vibldo)$":
> +        $ref: /schemas/regulator/regulator.yaml#
> +        type: object
> +        unevaluatedProperties: false
> +
> +      "^(dsvpos|dsvneg)$":
> +        $ref: /schemas/regulator/regulator.yaml#
> +        type: object
> +        unevaluatedProperties: false
> +
> +        properties:
> +          enable-gpio:
> +            maxItems: 1
> +            description: |
> +              Specify a valid 'enable' gpio for the regulator and it's optional

Same comment as your patch #10.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - regulators
> +  - adc
> +  - backlight
> +  - indicator
> +  - tcpc
> +  - charger
> +  - flashlight
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +    #include <dt-bindings/mfd/mediatek,mt6370.h>
> +    #include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
> +    #include <dt-bindings/usb/pd.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      mt6370@34 {

Generic node name, so "pmic".

> +        compatible = "mediatek,mt6370";
> +        reg = <0x34>;
> +        wakeup-source;
> +        interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        mt6370_adc: adc {
> +          compatible = "mediatek,mt6370-adc";
> +          #io-channel-cells = <1>;
> +        };
> +
> +        backlight {
> +          compatible = "mediatek,mt6370-backlight";
> +          mediatek,bled-channel-use = /bits/ 8 <15>;
> +        };
> +
> +        charger {
> +          compatible = "mediatek,mt6370-charger";
> +          interrupts = <MT6370_IRQ_ATTACH>, <MT6370_IRQ_OVPCTRL_UVP_D>,
> +                       <MT6370_IRQ_CHG_MIVR>;
> +          interrupt-names = "attach_i", "uvp_d_evt", "mivr";
> +          io-channels = <&mt6370_adc MT6370_CHAN_IBUS>;
> +
> +          mt6370_otg_vbus: usb-otg-vbus {
> +            regulator-compatible = "mt6370,otg-vbus";
> +            regulator-name = "usb-otg-vbus";
> +            regulator-min-microvolt = <4350000>;
> +            regulator-max-microvolt = <5800000>;
> +            regulator-min-microamp = <500000>;
> +            regulator-max-microamp = <3000000>;
> +          };
> +        };
> +
> +        indicator {
> +          compatible = "mediatek,mt6370-indicator";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          multi-led@0 {
> +            reg = <0>;
> +            function = LED_FUNCTION_INDICATOR;
> +            color = <LED_COLOR_ID_RGB>;
> +            led-max-microamp = <24000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            mediatek,soft-start = <3>;
> +              led@0 {

Messed up indentation.

> +                reg = <0>;
> +                color = <LED_COLOR_ID_RED>;
> +              };
> +              led@1 {
> +                reg = <1>;
> +                color = <LED_COLOR_ID_GREEN>;
> +              };
> +              led@2 {
> +                reg = <2>;
> +                color = <LED_COLOR_ID_BLUE>;
> +              };
> +            };
> +          led@3 {
> +            reg = <3>;
> +            function = LED_FUNCTION_INDICATOR;
> +            color = <LED_COLOR_ID_WHITE>;
> +            led-max-microamp = <6000>;
> +          };
> +        };
> +
> +        flashlight {
> +          compatible = "mediatek,mt6370-flashlight";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          led@0 {
> +            reg = <0>;
> +            led-sources = <0>;
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            function-enumerator = <1>;
> +            led-max-microamp = <200000>;
> +            flash-max-microamp = <500000>;
> +            flash-max-timeout-us = <1248000>;
> +          };
> +          led@1 {
> +            reg = <1>;
> +            led-sources = <1>;
> +            function = LED_FUNCTION_FLASH;
> +            color = <LED_COLOR_ID_WHITE>;
> +            function-enumerator = <2>;
> +            led-max-microamp = <200000>;
> +            flash-max-microamp = <500000>;
> +            flash-max-timeout-us = <1248000>;
> +          };
> +        };
> +
> +        tcpc {
> +          compatible = "mediatek,mt6370-tcpc";
> +          interrupts-extended = <&gpio26 4 IRQ_TYPE_LEVEL_LOW>;
> +
> +          connector {
> +            compatible = "usb-c-connector";
> +            label = "USB-C";
> +            vbus-supply = <&mt6370_otg_vbus>;
> +            data-role = "dual";
> +            power-role = "dual";
> +            try-power-role = "sink";
> +            source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
> +            sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
> +            op-sink-microwatt = <10000000>;
> +
> +            ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                reg = <0>;
> +                endpoint {
> +                  remote-endpoint = <&usb_hs>;
> +                };
> +              };
> +              port@1 {
> +                reg = <1>;
> +                endpoint {
> +                  remote-endpoint = <&usb_ss>;
> +                };
> +              };
> +              port@2 {
> +                reg = <2>;
> +                endpoint {
> +                  remote-endpoint = <&dp_aux>;
> +                };
> +              };
> +            };
> +          };
> +        };
> +
> +        regulators {
> +          dsvbst {
> +            regulator-name = "mt6370-dsv-vbst";
> +            regulator-min-microvolt = <4000000>;
> +            regulator-max-microvolt = <6200000>;
> +          };
> +          dsvpos {
> +            regulator-name = "mt6370-dsv-vpos";
> +            regulator-min-microvolt = <4000000>;
> +            regulator-max-microvolt = <6000000>;
> +            regulator-boot-on;
> +          };
> +          dsvneg {
> +            regulator-name = "mt6370-dsv-vneg";
> +            regulator-min-microvolt = <4000000>;
> +            regulator-max-microvolt = <6000000>;
> +            regulator-boot-on;
> +          };
> +          vibldo {
> +            regulator-name = "mt6370-vib-ldo";
> +            regulator-min-microvolt = <1600000>;
> +            regulator-max-microvolt = <4000000>;
> +          };
> +        };
> +      };
> +    };
> diff --git a/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h b/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> new file mode 100644
> index 000000000000..18ce2fef8f9e
> --- /dev/null
> +++ b/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Same license as bindings, please.

> +
> +#ifndef __DT_BINDINGS_MEDIATEK_MT6370_ADC_H__
> +#define __DT_BINDINGS_MEDIATEK_MT6370_ADC_H__
> +
> +/* ADC Channel Index */
> +#define MT6370_CHAN_VBUSDIV5	0
> +#define MT6370_CHAN_VBUSDIV2	1
> +#define MT6370_CHAN_VSYS	2
> +#define MT6370_CHAN_VBAT	3
> +#define MT6370_CHAN_TS_BAT	4
> +#define MT6370_CHAN_IBUS	5
> +#define MT6370_CHAN_IBAT	6
> +#define MT6370_CHAN_CHG_VDDP	7
> +#define MT6370_CHAN_TEMP_JC	8
> +#define MT6370_CHAN_MAX		9
> +
> +#endif
> diff --git a/include/dt-bindings/mfd/mediatek,mt6370.h b/include/dt-bindings/mfd/mediatek,mt6370.h
> new file mode 100644
> index 000000000000..df641e5d651f
> --- /dev/null
> +++ b/include/dt-bindings/mfd/mediatek,mt6370.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Same license as bindings, please.

> +
> +#ifndef __DT_BINDINGS_MEDIATEK_MT6370_H__
> +#define __DT_BINDINGS_MEDIATEK_MT6370_H__
> +
> +/* IRQ definitions */

> +#define MT6370_IRQ_DIRCHGON		0
> +#define MT6370_IRQ_CHG_TREG		4

These should be IDs, so numbers incremented by one. Holes are not
accepted. There is no point in encoding actual hardware numbers which
are directly passed to implementation. Just pass the number, not define.
Therefore remove entire file.

> +#define MT6370_IRQ_CHG_AICR		5
> +#define MT6370_IRQ_CHG_MIVR		6
> +#define MT6370_IRQ_PWR_RDY		7
> +#define MT6370_IRQ_FL_CHG_VINOVP	11
Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
