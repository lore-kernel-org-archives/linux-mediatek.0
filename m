Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218D5C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADMVvJ6tYjJ/l+5CJQ/3ram1FhkVHFeUTiIqd9RqeZ0=; b=rURrg24cphfaSJ1bUAuTkIJFND
	ZVUlhb4ElqDyXvOkYJ5YGl84EwAqKkJxPFrBxO0kzcOPeqB45sj03vTyxLh3HIWRAhP6/pRvLonhT
	dmHrQvaijVWReNAheaZmXLdmV/CkU+vXUR9X0NaAKgpFjlJg40x01tTB+kbEsRxiN7FDUIOw1y0s4
	iSwr6ACiMKJhFBKVVoaejdRXPivGaALhtEeM62JmjZF0QWvkycjWOtjPG+HJtblzPETLPC/qS/YdM
	3GtLyR842VLg5Ir3+SNXkkD1eb9GdLZ+XtcdlnVBL27PjGE2JM6BTr89YTdJXGkKFAOA1Q16qNf3F
	qWpWsfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdjU-0076HN-7E; Wed, 25 Jan 2023 11:14:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdjR-0076En-EH
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 11:14:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1038075wmq.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 03:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADMVvJ6tYjJ/l+5CJQ/3ram1FhkVHFeUTiIqd9RqeZ0=;
        b=lplwJ6LFnFBslMpFQXK7Qj2RgFsm0apBVis1zFeIol2oCAQXp/4alqJaEMkR/lmFZO
         8kQvtlnZTylENe0xGYPRKWvACND4L2JQDBcxhQMrsh/Jj6DR3kDSHSiBVfjSKoNQMiV1
         B6/VJAFMiydkCIJh5WIp4G0rzay5CsZuye8ETdAz3jCtejU94gnF9aQ5Nb1L1X5SMLHr
         6NetafPWZdj5DIxvErmbr5RqJGFbEq7zsCjVFED4BvIUOIgHV/+fdDqZjc5xDmQXhFPb
         iSHePyyX1Oq4Ny49EcE+fBCMQ3F9paO1ro+w1ZUzP2IBjSLPN1X4REQCScHc6DEGSMBY
         HSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADMVvJ6tYjJ/l+5CJQ/3ram1FhkVHFeUTiIqd9RqeZ0=;
        b=u3Td5PlXH9hsnKT8u44b10dAPhgfaXPcUrplwVo6Np+E5a2BP9RKmJ7sFe5e76R1E8
         rHdL2Lg3nwvIoarPfRT5s5cj05mshHwCPLOry6VFXW+vKRujtRrjJQFDRjQehI10La0O
         Kxfx9lyk64uZtQyFz//+9Mfwwhl5RZkoFS/lH+JrdE4qIgeMYy2CkyfN0JA9KwyeVdBw
         XmbZwnXxJMzX53jCgxIAyxajFknCVkny5YEqByvs8DTnZysifNFvHoYZWioBoKEFWNjh
         z3qawGTnxuqRpDrZ92cWQWNL7wQO4TjK1GUe4rSRZn8VFqTMNe2d7hgGqpqRSAJ55pAC
         LWoQ==
X-Gm-Message-State: AO0yUKUCmrCYVaM0pOPu6kImR2fmxs+yM366hAE0/yWaRXmWmOvLOhyr
	zuj5bFrFrk3wwrjBuuW07YPzvg==
X-Google-Smtp-Source: AK7set8zfpH3GItcQG4IPh/bHvQ8qSxPfw03c6ev7WteTb0dpmAuSL72AIoK56QbNyIG4pkh7B+zAA==
X-Received: by 2002:a05:600c:444a:b0:3dc:16d3:8c95 with SMTP id v10-20020a05600c444a00b003dc16d38c95mr5026808wmn.30.1674645259511;
        Wed, 25 Jan 2023 03:14:19 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e26-20020a05600c4b9a00b003d9780466b0sm1467568wmp.31.2023.01.25.03.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:14:19 -0800 (PST)
Message-ID: <2471a5de-b7a6-fea7-152f-4fe25063abf9@linaro.org>
Date: Wed, 25 Jan 2023 12:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v11 2/6] dt-bindings/thermal/mediatek: Add LVTS thermal
 controllers dt-binding definition
Content-Language: en-US
To: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-1-bchihi@baylibre.com>
 <20230124131717.128660-3-bchihi@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230124131717.128660-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_031421_508426_5E90D912 
X-CRM114-Status: GOOD (  18.75  )
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

On 24/01/2023 14:17, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controllers dt-binding definition for mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---

Krzysztof, Rob,

are you ok with these changes ?


>   .../thermal/mediatek,lvts-thermal.yaml        | 107 ++++++++++++++++++
>   include/dt-bindings/thermal/mediatek-lvts.h   |  19 ++++
>   2 files changed, 126 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>   create mode 100644 include/dt-bindings/thermal/mediatek-lvts.h
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

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


