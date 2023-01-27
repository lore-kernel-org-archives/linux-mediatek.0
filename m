Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2938DC38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 22:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idUqpMNtTKGKBzaSIni6XsWBLVfQJXf3RNZPZAEYBhY=; b=0ORYmLKEUfy6S31y6vSO3pBzhu
	LEYbkdFBhtPqmLjHkkU2Xw5cvPeS+B1JkXIVA/ZdRyGUzrPt4XJho2twMRbxOERtc9rqgPiT1uBnv
	IlIrpWKo/AlyeYz+UGW7rwjNOhnlsa2FnHPaBq6jlHnXpPDwK3YyTGFsPQYpfh9rpKhmYmEDfaYHx
	UD//5jWeEf10EjfPMK3xcG25je5RGVjqK5KZtVFvtaBcs1NzHmuojtx21KiE1eMm/lWjVdTU6bNaj
	rKnUVgaofccau9oHVPFWwQUl+FbBizl/igpclg91zqCIX7zAEixwM6ZYMd0Oi9PbwJEq3EjTO/Krb
	JOVeXNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWvz-00GfIY-Sh; Fri, 27 Jan 2023 22:10:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWvq-00GfGh-5P
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 22:10:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id l8so4410563wms.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 14:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idUqpMNtTKGKBzaSIni6XsWBLVfQJXf3RNZPZAEYBhY=;
        b=T+1Xoirx35CarTbZn/QmvccPCvLMX840tpf0yczBXlAWlyqzyTd31ZJy7EL1JzuBot
         MMvKlI8Lmg3Uxplorrz1/KPq4NQ0C7WOxLRRRpDrs/jx7XSAXT82ujSaXdOKosXAjcyl
         Ctv94KdNaK27hQGF6LK//ptWWXDbioBJvVSWjCvO/B2PiIBC4KlsWtTJVv4pQdmhCGdn
         y99CPCdfoBzHqPF3UWNuvXHXjKDkLGD6qRpkkfHhutRVvlM1OHjOnFsEHuEpZ+x7+/mX
         zJo2I3xvwhIyKR3WD69iyIK8b8D2J4XY3ThHEH9abilLTBdrbkb7fGcV64P7StoBr3dD
         aRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idUqpMNtTKGKBzaSIni6XsWBLVfQJXf3RNZPZAEYBhY=;
        b=zhO3BfWTwhayTM/zX5WMk7jD6HwdJ3ORuQzpiBNLeXBfz8UwYQMu/w8ad/0D5pqW1T
         sEGOorP9q6L8YYXYh2GzCHgHPzmYdtYRfHGf4aluNTnRqG8ythbIO2Tiz1K9u6bCoY8J
         sZdDtoOM3peqyzrYz1kSMmOeJC5kmBBto179c7ceZCfJuWmpBVJ/AYmInID6uG164dSv
         NI9LvIKJ3yUihVRRvLG3B09WaIk5xWmWVY9czUn4ZvgJYDby+m0RfsUhYj24P9iqK4WR
         XqX7JyVLA5dAvkcOLQyLi4Qn04JHZppNYKgwqjnJZPEL+LkFXL23b/0wx0jvf+kpWtny
         XSFw==
X-Gm-Message-State: AFqh2krfJXTgBezF99y3A3GIq00rjRqY5BZUxsfXZa2aP1nAc5Qm6U3H
	hOiOGQsBSAb7Lb8J7/GLHtsiJA==
X-Google-Smtp-Source: AMrXdXvzVxJFfhXedNSvA1alMBr7vxuLM/4Pb6ufanVh0GnvsBzODZIGkDDFJez7USS5+SGSr2E5xg==
X-Received: by 2002:a05:600c:a13:b0:3db:1de2:af31 with SMTP id z19-20020a05600c0a1300b003db1de2af31mr33565874wmp.37.1674857446342;
        Fri, 27 Jan 2023 14:10:46 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g11-20020a5d488b000000b002be5bdbe40csm5740301wrq.27.2023.01.27.14.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 14:10:45 -0800 (PST)
Message-ID: <2ce57abd-203f-04b9-f0de-8e524d6afaae@linaro.org>
Date: Fri, 27 Jan 2023 23:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
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
References: <20230124131717.128660-3-bchihi@baylibre.com>
 <20230126161048.94089-1-bchihi@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230126161048.94089-1-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_141050_234995_13B6AE35 
X-CRM114-Status: GOOD (  22.23  )
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


Hi Rob,

I think Balsam took into account your comments. Is it fine for you ?


On 26/01/2023 17:10, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controllers dt-binding definition for mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
> Changelog:
>    v12:
>       - Fixed subject prefix
>       - Fixed licences GPL-2.0+ to GPL-2.0
>       - Added dual licenses
>    v11:
>       - Rebase on top of "thermal/linux-next" :
>         base=0d568e144ead70189e7f16066dcb155b78ff9266
>       - Remove unsupported SoC (mt8192) from dt-binding definition
>    v10:
>       - Rebase on top of "thermal/linux-next" : thermal-v6.3-rc1
>    v9:
>       - Rebase on top of 6.0.0-rc1
>       - Update dt-bindings :
>         - Add "allOf:if:then:"
>         - Use mt8192 as example (instead of mt8195)
>         - Fix dt-binding errors
>         - Fix DTS errors
>    v8:
>       - Fix coding style issues
>       - Rebase on top of next-20220803
>       - Add multi-instance support :
>         - Rewrite DT-binding and DTS :
>           - Add DT-binding and DTS for LVTS_v4 (MT8192 and MT8195)
>             - One LVTS node for each HW Domain (AP and MCU)
>           - One SW Instance for each HW Domain
>    v7:
>       - Fix coding style issues
>       - Rewrite dt bindings
>         - was not accurate
>         - Use mt8195 for example (instead of mt8192)
>         - Rename mt6873 to mt8192
>         - Remove clock name
> ---
> ---
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
> index 000000000000..902d5b1e4f43
> --- /dev/null
> +++ b/include/dt-bindings/thermal/mediatek-lvts.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
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


