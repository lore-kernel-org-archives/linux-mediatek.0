Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA9DC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOcafZZ2bNDBnSN55zxffY+66GOe6JPJyKtCcl7mVH8=; b=KViyvEbVQqERufL3GAStCiwTib
	qyZzkBkotTHv1EMXWFTRZCNkwObsQ7W1KT1ORPXUrFC4XSt9I0mj31brFhOU5utZCcnwiONfe6W10
	eN1gychRqVrZ9AO0iIioFq+904qh/KXjP7hfxwwK6shJ0h8o9i+fwUYPph9wHHJiqPxffnoxLeZIS
	9NEHOYhF8SXAk51N8o0eML8PAvG+eJ7VZ6Waf4ORkKKrAoBIL7mSvkRJoEvZqgIwNK+wC3If1AGqe
	b/4GRDQMfzOWoora8B3CKRA60SKyPI6LlbZMtiPQyH8G5EvEgE0WHlvmyHGQZRSK0beNuHPdB6nkW
	5DhW9TUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmTZ-008j0l-06; Wed, 25 Jan 2023 20:34:33 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmTO-008iz1-De; Wed, 25 Jan 2023 20:34:24 +0000
Received: by mail-oi1-f170.google.com with SMTP id v17so17343709oie.5;
        Wed, 25 Jan 2023 12:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOcafZZ2bNDBnSN55zxffY+66GOe6JPJyKtCcl7mVH8=;
        b=XXGdetRk9xfU8MJ+xIp5URx330glprTSSfcmFAEFEvTPqxBekLfhE2qVEJvqv7X5ag
         WbLuSQ7ABdg2TYo22o53rN///28vr+KcwumVVrlvv10rmq9sg+ZoASwLNVT0IYbPmJKg
         qMRuyPfpCiCKZooF+E+10VT0Uma98mygSCd+HG8l3Nn3HJXQYh4vDvviI1Z2jHdCW01m
         t1dnYy6IXYf34YWj34ewmyDmfLYfa3jwP5zj7dbYC7ZLwmagZ9/BY06HBWZgJT3F+Dqa
         CC+6qBChNl6RZFnKo08w5wuqMd8oCMSSiRqak38oR7EcvTaCk0dsVqT1S5XB4uKWLGlY
         xAQA==
X-Gm-Message-State: AFqh2kr5oK6qHKCGehcmM39Q1XyeG9Y8jbSTZnA1Jgktf8LvrROy9GBv
	nNdackuqM8/GcD1UqS2v7Q==
X-Google-Smtp-Source: AMrXdXv11PXpUvs16Apm69AhG2d6CUyv5OzvYWyumqjCYnSFYzVuZx0nUO5YfFq6F5/A5lcuQOTfEA==
X-Received: by 2002:aca:6206:0:b0:35e:63f8:88c2 with SMTP id w6-20020aca6206000000b0035e63f888c2mr17489951oib.16.1674678861642;
        Wed, 25 Jan 2023 12:34:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j2-20020a056808034200b003648b84a2b5sm2689170oie.33.2023.01.25.12.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:34:21 -0800 (PST)
Received: (nullmailer pid 2860162 invoked by uid 1000);
	Wed, 25 Jan 2023 20:34:20 -0000
Date: Wed, 25 Jan 2023 14:34:20 -0600
From: Rob Herring <robh@kernel.org>
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Subject: Re: [PATCH v11 2/6] dt-bindings/thermal/mediatek: Add LVTS thermal
 controllers dt-binding definition
Message-ID: <20230125203420.GA2855708-robh@kernel.org>
References: <20230124131717.128660-1-bchihi@baylibre.com>
 <20230124131717.128660-3-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124131717.128660-3-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_123422_504132_F5D32D19 
X-CRM114-Status: GOOD (  20.12  )
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

On Tue, Jan 24, 2023 at 02:17:13PM +0100, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
>

dt-bindings: thermal: ... for the subject
 
> Add LVTS thermal controllers dt-binding definition for mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 107 ++++++++++++++++++
>  include/dt-bindings/thermal/mediatek-lvts.h   |  19 ++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>  create mode 100644 include/dt-bindings/thermal/mediatek-lvts.h
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> new file mode 100644
> index 000000000000..12bfbdd8ff89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC Low Voltage Thermal Sensor (LVTS)
> +
> +maintainers:
> +  - Balsam CHIHI <bchihi@baylibre.com>
> +
> +description: |
> +  LVTS is a thermal management architecture composed of three subsystems,
> +  a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
> +  a Converter - Low Voltage Thermal Sensor converter (LVTS), and
> +  a Digital controller (LVTS_CTRL).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-lvts-ap
> +      - mediatek,mt8195-lvts-mcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +    description: LVTS reset for clearing temporary data on AP/MCU.
> +
> +  nvmem-cells:
> +    minItems: 1
> +    items:
> +      - description: Calibration eFuse data 1 for LVTS
> +      - description: Calibration eFuse data 2 for LVTS
> +
> +  nvmem-cell-names:
> +    minItems: 1
> +    items:
> +      - const: lvts-calib-data-1
> +      - const: lvts-calib-data-2
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +  - nvmem-cells
> +  - nvmem-cell-names
> +  - "#thermal-sensor-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/reset/mt8195-resets.h>
> +    #include <dt-bindings/thermal/mediatek-lvts.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      lvts_mcu: thermal-sensor@11278000 {
> +        compatible = "mediatek,mt8195-lvts-mcu";
> +        reg = <0 0x11278000 0 0x1000>;
> +        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +        resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> +        nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
> +        nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
> +        #thermal-sensor-cells = <1>;
> +      };
> +    };
> +
> +    thermal_zones: thermal-zones {
> +      cpu0-thermal {
> +        polling-delay = <1000>;
> +        polling-delay-passive = <250>;
> +        thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU0>;
> +
> +        trips {
> +          cpu0_alert: trip-alert {
> +            temperature = <85000>;
> +            hysteresis = <2000>;
> +            type = "passive";
> +          };
> +
> +          cpu0_crit: trip-crit {
> +            temperature = <100000>;
> +            hysteresis = <2000>;
> +            type = "critical";
> +          };
> +        };
> +      };
> +    };
> diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
> new file mode 100644
> index 000000000000..428a95c18509
> --- /dev/null
> +++ b/include/dt-bindings/thermal/mediatek-lvts.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Okay with GPL 4? GPL-2.0-only

Dual license please. Consistent with your .dts files.

> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + * Author: Balsam CHIHI <bchihi@baylibre.com>
> + */
> +
> +#ifndef __MEDIATEK_LVTS_DT_H
> +#define __MEDIATEK_LVTS_DT_H
> +
> +#define MT8195_MCU_BIG_CPU0	0
> +#define MT8195_MCU_BIG_CPU1	1
> +#define MT8195_MCU_BIG_CPU2	2
> +#define MT8195_MCU_BIG_CPU3	3
> +#define MT8195_MCU_LITTLE_CPU0	4
> +#define MT8195_MCU_LITTLE_CPU1	5
> +#define MT8195_MCU_LITTLE_CPU2	6
> +#define MT8195_MCU_LITTLE_CPU3	7
> +
> +#endif /* __MEDIATEK_LVTS_DT_H */
> -- 
> 2.34.1
> 

