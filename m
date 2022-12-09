Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C677C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b+nzUQkfFI17ZarCDIwZk6LrBaQpiedauRmlOVndtI=; b=10qBbSvhU3aFIMI7iUuSWsx79a
	umejcCurPRD9jZ/m8U/SDkmOUefyKYoa0DVjkO0f1iRFylNkKsDQ5adNYvgQ1ezJRbtDvbtOI//LY
	EYSp09Qcsl2ct/CpqLspqbTiaZfcATAji3FDw17y2zW6vfn2JLlu6PBvrueZWxGJyjXnp6uJ00fbm
	dUJGtLLN2DRL8tmd9taSfcxjro5EYz+x+gN/+zFdQL6oZt9hyzzXoQbT8ZfWfzuVMXmp2Cc8bGFrz
	BPCxcrdXNb+FeY1jnMUEQeTtMYwa0xH7AyIWoM9Y5zaBLUYn4TvNklhNdQg5bv+1Y0ntvD+RoxpZe
	V/pSg1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YaK-005Vww-0g; Fri, 09 Dec 2022 08:18:20 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ya8-005VqX-Ba
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 08:18:10 +0000
Received: by mail-lj1-x234.google.com with SMTP id q7so4161709ljp.9
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Dec 2022 00:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9b+nzUQkfFI17ZarCDIwZk6LrBaQpiedauRmlOVndtI=;
        b=MP3CwhmhfT+bowc34rbCU80wMR4XjEpjYAwxPJsUEqPeN+i/yGN89NgsklJdd/Pk6o
         71VoyIrQon/Vrk/acTGP33lzfmd20YH0dcHV70Hg4bTUPWmLeFuskj+7Du9sjGoEhyTg
         amkLN3CAWB6nFrtKKqIAXrAmYiEJr60PphupoLN3Yrf1S9DLgZU1ruaqQAsfEWj3INUs
         qIm70cFv3tX52c2VZmkVDXRmD9r3GeB6n8X36jG56eAv6GRYCs6Ap1A/6Ih2B8eW3xGi
         Ajt6YZoddzJGkliRozpmbes8OjMyw2/fLhbv5DBfuix1hfmsL0w8fe/TyEfHejWDBlX7
         jmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9b+nzUQkfFI17ZarCDIwZk6LrBaQpiedauRmlOVndtI=;
        b=sMb2NDCPdEGyei21v2qXfoBszxPE+jyijedGYeIpuWU4Yy11hkOzCcF+jcsQeWl3IP
         3OfKcumtW5yb67ApFuIZUgXI2p/Y0K8nOOeLlj27bzUP/CLTNzwWtd4pI8/O1zcPCcmM
         SqJIFBi0i+PZfcmfE8Fk6w2rASOQEKFpr4+DcH9ChpDZzjY4eh/b6xxja9A4cX1KT/kA
         2cPkLLsClsbu88H9pFcxZhtBa5HhSFc0jUjb1XqmM+Zx27ySUFEnFlcrSoGrSvn4F2fd
         SZwUIu+0nM2TeDubTOcRilBVnKmBTTjkDTMxB1eaNXqeeMLNjsMdArabzkZ01FbRXY6P
         ebPw==
X-Gm-Message-State: ANoB5pmNpr+8tnDVeD84mcnti4RgcX1Fpiy+BfEH/JJPUoMvVnEv8DO4
	rvyi4bszgSOgpVC0yzwiMJmeXg==
X-Google-Smtp-Source: AA0mqf7gOOWLgjKHZQK+6oE9u4is1OfW8LjVsmng1iYVVk810DsmCov5IqCqFw56AzowQ+pJj2g4Bg==
X-Received: by 2002:a05:651c:1697:b0:279:d092:caa2 with SMTP id bd23-20020a05651c169700b00279d092caa2mr1154060ljb.32.1670573886031;
        Fri, 09 Dec 2022 00:18:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bg32-20020a05651c0ba000b00279cf45a02asm124286ljb.132.2022.12.09.00.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:18:05 -0800 (PST)
Message-ID: <22dacd0a-d482-d4e6-fc69-187f9ae79956@linaro.org>
Date: Fri, 9 Dec 2022 09:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com
References: <20221208153041.3965378-1-bero@baylibre.com>
 <20221208153041.3965378-5-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208153041.3965378-5-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_001808_434741_70CB6672 
X-CRM114-Status: GOOD (  17.07  )
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

On 08/12/2022 16:30, Bernhard Rosenkränzer wrote:
> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 ++++++++++++++++++
>  1 file changed, 197 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> new file mode 100644
> index 0000000000000..9560e1d2898d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> @@ -0,0 +1,197 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8365-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8365 Pin Controller
> +
> +maintainers:
> +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> +  - Bernhard Rosenkränzer <bero@baylibre.com>
> +
> +description: |+
> +  The MediaTek's MT8365 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,pctl-regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Should be phandles of the syscfg node.
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> +      binding is used, the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":

Use consistent quotes - ' or "

> +    const: 2
> +
> +patternProperties:
> +  '-pins$':
> +    type: object

(...)

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pio: pinctrl@1000b000 {
> +          compatible = "mediatek,mt8365-pinctrl";
> +          reg = <0 0x1000b000 0 0x1000>;
> +          mediatek,pctl-regmap = <&syscfg_pctl>;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          interrupt-controller;
> +          #interrupt-cells = <2>;
> +          interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +
> +          pio-pins {
> +            pins {
> +              pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>, <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
> +              mediatek,pull-up-adv = <3>;
> +              mediatek,drive-strength-adv = <00>;
> +              bias-pull-up;
> +            };
> +          };
> +        };
> +    };
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +allOf:
> +  - $ref: pinctrl.yaml#

The order of your top-level entries is mixed up. required and allOf  are
never after the example. Please open example-schema and align the order.

Best regards,
Krzysztof


