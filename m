Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C697BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 02:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOV3tqJwuvgxTqdfVy9B0wF4mLMLIstioYx3dk9YYyg=; b=Z6qyWGNPEuL95H
	pDR55Kbw74sNKkcYyi7CRqbRIj6QzrAUeACL0kN02O9xV98jl75yxGAPWrsAkiM4Rr+v0gDeSyoPI
	NO/EfefUjEOpsYdzIcXYXLCntpfjXr5Z/pIoaCAbiDsw3PoDeCWw2V6BELAGlHaou8w04oN5554ID
	lU5J0LbO/l9cD+JvallRmfWhllYbMp2W/MOzKkgo0IN7LYt23JRZ2UWQn8j4jKpDcUj6Gjmku3vZ/
	EV6O+sg07+aytI+manU5SFQwnGEHgDzx2O7wtwq570cfaIfFRkrBTiDCL3uYMqnrGyrWpnzm/9tSZ
	yzAPEqOylzWICPxJhY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2sk-00DI11-0g; Thu, 26 May 2022 02:05:46 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2sX-00DHyT-I9; Thu, 26 May 2022 02:05:35 +0000
Received: by mail-oi1-f177.google.com with SMTP id e189so660071oia.8;
        Wed, 25 May 2022 19:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ChisiLO0bsSW3mWXz6BoXIcubu0hhX1WwidCN2NJ5Xs=;
        b=vB2cvhy1mhj8vLYyxdfzkve62MB9S4wfE7PuIKNI7nrK1nP7Twgfz8UUbN+nk51RCk
         2RhyCcE2Ff5mZ1+3JrhCdKtRWvzEh0nDNqLsR7VTRNOOpyx9ZL9MrtS5ojz1jftjWQgn
         6hcRfOvL4LxJ54YgvDBbkbyJ/RdtxLuthw226aMMO8WYQED0kpu4clsBvUSAgeLel9JH
         wb9Uc0UTKBfnrCfrB8DHYQd4N2qqO7QGsdpxFZlqJpTUhwZX+PzYsC3lRRXrD41N/Ht8
         GNQMVAO0O95s+I9eVbtzTXCGlR+EozSlYJpwzwaQhEHGuv2hGoK/02k8P+UJXjn3qUH5
         81/w==
X-Gm-Message-State: AOAM533na2QOPHnIDqQT9Xy5eeAxDWcLA/v8dm5A3OmhNi06DTDHb2jI
	750IJSCd5wFnt163QADmow==
X-Google-Smtp-Source: ABdhPJw+s4ts1U0RT6Kz+SuPmsS63MroSVk4RpangHXlIlCPwlPCRe4u5Bf1C8W6qkMcBU9s4R3QzQ==
X-Received: by 2002:a05:6808:199b:b0:329:92c:4a1e with SMTP id bj27-20020a056808199b00b00329092c4a1emr33497oib.214.1653530731400;
        Wed, 25 May 2022 19:05:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bj39-20020a05680819a700b0032b7b588f3asm195674oib.46.2022.05.25.19.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 19:05:30 -0700 (PDT)
Received: (nullmailer pid 2907659 invoked by uid 1000);
	Thu, 26 May 2022 02:05:29 -0000
Date: Wed, 25 May 2022 21:05:29 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, mka@chromium.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, james.lo@mediatek.com, fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com
Subject: Re: [PATCH v7 2/6] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
Message-ID: <20220526020529.GA2901912-robh@kernel.org>
References: <20220524152552.246193-1-abailon@baylibre.com>
 <20220524152552.246193-3-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524152552.246193-3-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_190533_643152_134C4682 
X-CRM114-Status: GOOD (  19.08  )
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

On Tue, May 24, 2022 at 05:25:49PM +0200, Alexandre Bailon wrote:
> This patch adds binding document for mt8192 and mt8195 thermal
> controllers.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../thermal/mediatek,mt8192-lvts.yaml         | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
> new file mode 100644
> index 000000000000..914c877d1f2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek,mt8192-lvts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC LVTS thermal controller
> +
> +maintainers:
> +  - Yu-Chia Chang <ethan.chang@mediatek.com>
> +  - Ben Tseng <ben.tseng@mediatek.com>
> +
> +allOf:
> +  - $ref: thermal-sensor.yaml#
> +  - $ref: /nvmem/nvmem-consumer.yaml#

Besides having an error, there is no need to reference this. It is 
applied to all nodes and you still have to list the properties here to 
define how many entries and what they are.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8192-lvts
> +      - mediatek,mt8195-lvts
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 4
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +  nvmem-cells:
> +    maxItems: 2
> +    description: Calibration data for thermal sensors

Need to define what each entry is.

> +
> +  nvmem-cell-names:
> +    items:
> +      - const: e_data1
> +      - const: e_data2

Wow, those are useful names.

> +
> +  resets:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type. Need to define how many entries and what each one is 
(if more than 1).

> +
> +
> +required:
> +  - '#thermal-sensor-cells'
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - nvmem-cells
> +  - nvmem-cell-names
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/thermal/thermal.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/reset/mt8195-resets.h>
> +
> +    lvts: lvts@1100b000 {

Drop unused label.

thermal-sensor@...

> +        compatible = "mediatek,mt8195-lvts";
> +        #thermal-sensor-cells = <1>;
> +        reg = <0 0x1100b000 0 0x1000>,
> +              <0 0x11278000 0 0x1000>;
> +        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +        resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>,
> +                 <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> +        nvmem-cells = <&lvts_e_data1 &lvts_e_data2>;
> +        nvmem-cell-names = "e_data1","e_data2";
> +    };
> +...
> -- 
> 2.35.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
