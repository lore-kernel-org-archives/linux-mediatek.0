Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E63C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 14:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmODYZHjNY0jRKgVrCFnYYBcjaMY9BZ4+DFNs940aLU=; b=Rue4mOoksIFiSz
	hMLeSrM2Rpgs6Q1yZm6oqrux2Q2p/p36usXYDL8iAVVPN1CuOJymvA10WxRW4/0ke75fVaN4glSXA
	T84Z+HIvh50KnzmcjiBH7ny5PC3iLPPGffpZCnwSYiJQnRs5zGuvQy/eWFp0zoTsZhnFZUHzVm761
	A706G+Kgs9pIbdrp7Irj53l6GChRWG4Xf2Ip1Yn5/dyNvb7DF8Wm/NN5wosNntFWX9uBrMwEdFG7y
	OF/fOIn+46paebplDcBop88XLqRGNrYnPHZf7Z+syyVKFvR/AF0MXTRQNMvUsge0sEQjNq3ce8Hk4
	0ubs8zivx+CZCC4oLRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9lO-00CMdv-8a; Thu, 12 May 2022 14:25:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9lL-00CMcf-9m
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 14:25:56 +0000
Received: by mail-ej1-x633.google.com with SMTP id bv19so10597087ejb.6
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e7wJLjfJ1iVilvpq3jQ/LuI1I5wd6zNBUq4hxK7yISQ=;
 b=r5ualuxQ0leFqfg+jbNOvJJk8d5rLmW6rQULOQ0IRnTzgGR9H/PIWd9zWwzi3fs9WC
 S1+FtRFMKsim/XCxLByVyAPekRdEM+FkcCbXi0+pkaqQrGQuMKAqH4LWlJgqhnW90b53
 hUcHLI6ng/MAOx3Ixjn4Bte8v2Le82Buhh1GjWKoq0c0Q8nk9dyi3F42U34U10f6fyyO
 +hMWt5oUXdRHyqZvXq4fpzcyQ+u/x9RJ318MWMw/PSTuk7Wo0+iY86IzDn6FKEzxbT8x
 EG0pnu9SrvZgNIOARlKvfuwqyU1AOdJqhDncYUpZLB5LqJs2JwSHle88uuT735DJAPAC
 y0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e7wJLjfJ1iVilvpq3jQ/LuI1I5wd6zNBUq4hxK7yISQ=;
 b=cGV+8uajmJ0YH2eYywNttK6+d8FHyRhGD1+FElPywpc2UIOcsh3phX2HDHetviK5RA
 aDD756JlY0wVWP559Yp048kRf7mjxpsPPrKxijhkLhWAAI4iiTHp8bTeWbcqXjHelg1D
 +vxukGpqSiBD7bxXP4tFttgg9YtGkL7WGJo9BOSEGfRhkLeSN/28ya5jMRaIS/UKV+HM
 geFaKz7Gte6a+pqZXE/J7G+YKkde8qMrh0PNIFZ2wZ7p/jCqdy7nahXnoeytLi8iRsFv
 ysjCMxrKsTM5kKmbbUaz6iapjFPbT87oAA00vTiclx7RDu/qQl9LT5llThZDylcRVSOR
 op+Q==
X-Gm-Message-State: AOAM532yxZwEHhSx4ls6poZBQfQO+vDm+JPD6xNwwVJjXroccbrqU08w
 oz5mS52tT2+z5+mReUpVAawyEw==
X-Google-Smtp-Source: ABdhPJxfn8AF52a6nAcaWJI5jbWZNRWTIkVKS2zEyi9i2MQCsxmdkfWrb5DIJvkdV6aURcKf/+NZ2w==
X-Received: by 2002:a17:907:6e88:b0:6fa:888d:74a7 with SMTP id
 sh8-20020a1709076e8800b006fa888d74a7mr141867ejc.335.1652365553928; 
 Thu, 12 May 2022 07:25:53 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n14-20020a170906700e00b006f3ef214e34sm2134511ejj.154.2022.05.12.07.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:25:53 -0700 (PDT)
Message-ID: <546ddbd4-927d-2e28-6e82-a67b4584a17f@linaro.org>
Date: Thu, 12 May 2022 16:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 2/7] dt-bindings: thermal: Add binding document for
 mt6873 thermal controller
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
References: <20220512122433.1399802-1-abailon@baylibre.com>
 <20220512122433.1399802-3-abailon@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512122433.1399802-3-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_072555_399604_4B7E581E 
X-CRM114-Status: GOOD (  18.84  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 rui.zhang@intel.com, ben.tseng@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/05/2022 14:24, Alexandre Bailon wrote:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> This patch adds binding document for mt6873 thermal controller.

Thank you for your patch. There is something to discuss/improve.

> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> ---
>  .../thermal/mediatek-thermal-lvts.yaml        | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> new file mode 100644
> index 000000000000..69ffe7b14c21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml

filename: vendor,device
so something like mediatek,mt6873-lvts.yaml or
mediatek,mt6873-lvts-thermal.yaml

> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SoC LVTS thermal controller (DTS) binding

s/(DTS) binding//
(unless DTS means something related to hardware)

> +
> +maintainers:
> +  - Yu-Chia Chang <ethan.chang@mediatek.com>
> +  - Ben Tseng <ben.tseng@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6873-lvts
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
> +  clock-names:
> +    items:
> +      - const: lvts_clk

Skip "_clk" suffix, so just lvts.

> +
> +  "#thermal-sensor-cells":
> +    const: 0
> +
> +required:
> +  - "#thermal-sensor-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names

You should reference in allOf therma-sensor.yaml unless this is not a
thermal sensor?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/thermal/thermal.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    dts: lvts@1100b000 {

Generic node name, so thermal-sensor

> +        compatible = "mediatek,mt6873-lvts";
> +        reg = <0x1100b000 0x1000>;
> +        clocks = <&infracfg CLK_INFRA_THERM>;
> +        clock-names = "lvts_clk";
> +        #thermal-sensor-cells = <0>;
> +        interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +    thermal-zones {
> +        cpu_thermal: cpu-thermal {
> +            polling-delay-passive = <0>;
> +            polling-delay = <0>;
> +
> +            thermal-sensors = <&dts>;
> +            trips {
> +                cpu_alert1: cpu-alert1 {
> +                    temperature = <85000>;
> +                    hysteresis = <0>;
> +                    type = "passive";
> +                };
> +
> +                cpu_crit: cpu-crit {
> +                    temperature = <120000>;
> +                    hysteresis = <0>;
> +                    type = "critical";
> +                };
> +            };
> +
> +            cooling-maps {
> +            };

Empty node? Is it used anyhow here?

> +        };
> +    };
> +...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
