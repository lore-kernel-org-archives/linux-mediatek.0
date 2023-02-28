Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0E7C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 08:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCa9eFA4MAuvdUpjEutbEhVDEXa13F9jRr5aGoUB3t8=; b=sM5oq5ZrF5srRW
	88159WssZJColM0F1rE75YI9dSFbtBl3P2QtuYA6/Jkfj/cHSuvZ0Dxj7VeG28FvhWWYAvlC6VS5+
	Iwcv3EMmZ1qrET/u1K1l65C9TDXg2dheGs2Q9Q/i91fAeijkpt055JAjEhRurTOjAx/ZXLDB8uAZI
	xSsI5qcE8dXMuTDk5czufz4wM9e4JNSplUXBDyICXfOxffF//LW7g3S55YALK4T4/IXiNmOyULXs5
	WSmqrUGh6UbJ7GiXIKnyVIu1bGqggqh9XVfflkXqDb+51VplvNy4zocg0YOgX13s9QH5pba6JAOMY
	+M5Rs0hT7vMJxWVQy3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWvHq-00CMUJ-6s; Tue, 28 Feb 2023 08:24:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWvHi-00CMRt-Mo
	for linux-mediatek@lists.infradead.org; Tue, 28 Feb 2023 08:24:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso8455688wmi.4
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Feb 2023 00:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677572666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCa9eFA4MAuvdUpjEutbEhVDEXa13F9jRr5aGoUB3t8=;
        b=R97enwMN3XC+NbplCZTfX0/1FWjL0/ibd4Ss7LWrablB8qE+oj645pJM4lUVcG2EEO
         vT4qiDpVqbxagWtoO1z4PLBqy4XmiPInZ3XxdKejzfVzudVwj4+Hg09nkH1aPUwX0Kdu
         2ltBKOx6NpeHs8/c3p/XXEDTB/fCeTS/L//E0hZwGieMPAKebRtYtD+RKcM5udhu/3Y0
         Uryt7404F5L8593ZAXq4ttqTT7UQxkwlm5S4PepoiclPT6AdtZqf+SSJXIT1LKcYiFIS
         Sl49KwNlUkrQjzXfad09XVJMs2nWT2saj8lRZV5LrmtCdhYPKSeNONnLhSCJ7Xiyhnvl
         ZEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677572666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCa9eFA4MAuvdUpjEutbEhVDEXa13F9jRr5aGoUB3t8=;
        b=2HmvWn/0I1Ykgib/KwTyRPD9rnyMUYqF3BKVbTxgCXlzv6WM1nOD+qfqRzDmcGb/Tp
         tNsJA3wMLvvZbQNlx+jiwnkFajtXHoqfr2gDUhkiBtiS3Sfu0Gvqr36HJYP3FbCOpbxP
         6fO0izHaoENnCXnQsbi8rWDtBBJOmURMIXUdk4O5j5JikK5StaYyx1eY1VKReq/Ap6UY
         LEdODcVOoE8X1bqR0eAi9UmFGRJE6qARKcMR/hfnFjAOJC1smKDLx+NAj8iAVR6HkeUJ
         Qi9nEnbDGxXjzKrAbPFbLdHtcUcl6rEKOUUegFA2u+1FK3knf0sO27ow47uj0ZQIQZoN
         k8Sw==
X-Gm-Message-State: AO0yUKXeHYl7rkNJMH5u66emyieC3vYuRV1wG21eCHSZxrxgZw/KfwXF
	IaB5/2lVYntYK4LGCItaa+yhgA==
X-Google-Smtp-Source: AK7set+561ScUMYHwh6Ics+VWI683XONjmmmO5cGE2PRQI2VyhOWzhywPrSMutxHQNhiUzsuMT3LiA==
X-Received: by 2002:a05:600c:1d29:b0:3eb:2708:86ce with SMTP id l41-20020a05600c1d2900b003eb270886cemr1337572wms.31.1677572665796;
        Tue, 28 Feb 2023 00:24:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p15-20020a7bcdef000000b003e200d3b2d1sm11651518wmj.38.2023.02.28.00.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:24:25 -0800 (PST)
Message-ID: <1cf02768-aa92-3ad4-af00-566c16128352@linaro.org>
Date: Tue, 28 Feb 2023 09:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 09/16] dt-bindings: pinctrl: mediatek: rt305x: split
 binding
Content-Language: en-US
To: arinc9.unal@gmail.com, Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-10-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222183932.33267-10-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_002430_763132_4ABDBB8E 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/02/2023 19:39, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The RT3352 and RT5350 SoCs each contain different pin muxing information,
> therefore, should be split. This can be done now that there are compatible
> strings to distinguish them from other SoCs.
> 
> Split the schema out to mediatek,rt3352-pinctrl.yaml and
> mediatek,rt5350-pinctrl.yaml.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/mediatek,rt305x-pinctrl.yaml      |  78 +-----
>  .../pinctrl/mediatek,rt3352-pinctrl.yaml      | 247 ++++++++++++++++++
>  .../pinctrl/mediatek,rt5350-pinctrl.yaml      | 210 +++++++++++++++
>  3 files changed, 462 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,rt5350-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
> index 61fcf3ab1091..1e6c7e7f2fe2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
> @@ -11,8 +11,7 @@ maintainers:
>    - Sergio Paracuellos <sergio.paracuellos@gmail.com>
>  
>  description:
> -  MediaTek RT305X pin controller for RT3050, RT3052, RT3350, RT3352 and RT5350
> -  SoCs.
> +  MediaTek RT305X pin controller for RT3050, RT3052, and RT3350 SoCs.
>    The pin controller can only set the muxing of pin groups. Muxing individual
>    pins is not supported. There is no pinconf support.
>  
> @@ -36,21 +35,9 @@ patternProperties:
>            function:
>              description:
>                A string containing the name of the function to mux to the group.
> -            anyOf:
> -              - description: For RT3050, RT3052 and RT3350 SoCs
> -                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, mdio,
> -                       pcm gpio, pcm i2s, pcm uartf, rgmii, sdram, spi, uartf,
> -                       uartlite]
> -
> -              - description: For RT3352 SoC
> -                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led,
> -                       lna, mdio, pa, pcm gpio, pcm i2s, pcm uartf, rgmii, spi,
> -                       spi_cs1, uartf, uartlite, wdg_cs1]
> -
> -              - description: For RT5350 SoC
> -                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led,
> -                       pcm gpio, pcm i2s, pcm uartf, spi, spi_cs1, uartf,
> -                       uartlite, wdg_cs1]
> +            enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, mdio,
> +                   pcm gpio, pcm i2s, pcm uartf, rgmii, sdram, spi, uartf,
> +                   uartlite]
>  
>            groups:
>              description:
> @@ -69,17 +56,7 @@ patternProperties:
>              then:
>                properties:
>                  groups:
> -                  anyOf:
> -                    - description: For RT3050, RT3052 and RT3350 SoCs
> -                      enum: [i2c, jtag, mdio, rgmii, sdram, spi, uartf,
> -                             uartlite]
> -
> -                    - description: For RT3352 SoC
> -                      enum: [i2c, jtag, led, lna, mdio, pa, rgmii, spi, spi_cs1,
> -                             uartf, uartlite]
> -
> -                    - description: For RT5350 SoC
> -                      enum: [i2c, jtag, led, spi, spi_cs1, uartf, uartlite]
> +                  enum: [i2c, jtag, mdio, rgmii, sdram, spi, uartf, uartlite]
>  
>            - if:
>                properties:
> @@ -126,24 +103,6 @@ patternProperties:
>                  groups:
>                    enum: [jtag]
>  
> -          - if:
> -              properties:
> -                function:
> -                  const: led
> -            then:
> -              properties:
> -                groups:
> -                  enum: [led]
> -
> -          - if:
> -              properties:
> -                function:
> -                  const: lna
> -            then:
> -              properties:
> -                groups:
> -                  enum: [lna]
> -
>            - if:
>                properties:
>                  function:
> @@ -153,15 +112,6 @@ patternProperties:
>                  groups:
>                    enum: [mdio]
>  
> -          - if:
> -              properties:
> -                function:
> -                  const: pa
> -            then:
> -              properties:
> -                groups:
> -                  enum: [pa]
> -
>            - if:
>                properties:
>                  function:
> @@ -216,15 +166,6 @@ patternProperties:
>                  groups:
>                    enum: [spi]
>  
> -          - if:
> -              properties:
> -                function:
> -                  const: spi_cs1
> -            then:
> -              properties:
> -                groups:
> -                  enum: [spi_cs1]
> -
>            - if:
>                properties:
>                  function:
> @@ -243,15 +184,6 @@ patternProperties:
>                  groups:
>                    enum: [uartlite]
>  
> -          - if:
> -              properties:
> -                function:
> -                  const: wdg_cs1
> -            then:
> -              properties:
> -                groups:
> -                  enum: [spi_cs1]
> -
>          additionalProperties: false
>  
>      additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml
> new file mode 100644
> index 000000000000..7a74c1602afc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml
> @@ -0,0 +1,247 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,rt3352-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek RT3352 Pin Controller
> +
> +maintainers:
> +  - Arınç ÜNAL <arinc.unal@arinc9.com>
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +description:
> +  MediaTek RT3352 pin controller for RT3352 SoC.
> +  The pin controller can only set the muxing of pin groups. Muxing individual
> +  pins is not supported. There is no pinconf support.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,rt3352-pinctrl
> +      - ralink,rt305x-pinctrl
> +      - ralink,rt2880-pinmux

Following Rob's comments, you need to keep old compatibles when
splitting binding.

Best regards,
Krzysztof


