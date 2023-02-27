Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC88C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgkZ/7Ar4KpMlYo0Ie0qrRnEDsnDl1Cx4IjEfHmmGEs=; b=CAOLoZSSOrz8TUt4fFBsNrlWnX
	fbQA9P9eivjPoqkVKna5jZ5KMrv7A6d6Bb8diIWE9LgbsYrv52DfKcmlGt/PlWhz+Pc+/OKhUnvMA
	Us0JZghmLwVwQews9J+DVnzYfO54GPC7b/2/8tyMBROduIn8TYtIC3+iN6x08spjgjVAEsqEar15c
	1OPkiGAuF36aSH0HQln3KI7v7KhCg+ODlkkdO/xmrbV6Enj3HJNzQhdJ4KdL6ckAD5+BtrbQOJzDR
	O0CWI617l1ivjAan5V/NZEIZ1rdbhcdqJNtH/SeX2S8jsfTTnnLzIqoitmBeBZhddaQ5xZf91V9sg
	PMheThBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWhSC-00AVxh-92; Mon, 27 Feb 2023 17:38:24 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWhS7-00AVva-RW; Mon, 27 Feb 2023 17:38:22 +0000
Received: by mail-oo1-f43.google.com with SMTP id l16-20020a4ad9d0000000b005254905810aso1108298oou.9;
        Mon, 27 Feb 2023 09:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgkZ/7Ar4KpMlYo0Ie0qrRnEDsnDl1Cx4IjEfHmmGEs=;
        b=DKOQi71+9J5QFIaCFboXGaq6MilMwLYSZx5jn116ruAUZxm3p0hOpzsfbJFYOE629o
         DHaOFwdfDFe6dIO13tK7KHmBGKjs0JDE8cDfTiYmz13os+OGTSb4UF313cxabmArZkFj
         G3psZ8mV6l8rfdj17bSgjFwNvA0pjGWUcXDR5hHizZkHYvOvgCRy9Y+zR9vEWKhMvq2v
         lDLaPcMpKNLXkwVZkgvh9b0P4U7/4Nl8ZpZwtlQHbxTNWDjRaYnFmw4BbgHu4KE6WLIZ
         q3OQwlozD0kj7klFYFlMYLcbhE8THIzcY1xEXVdfPeWts/dPIy0mdq9DBMWVF3lT7rkl
         Gzpw==
X-Gm-Message-State: AO0yUKU5JiZVgM9efXGPI3G+muFJ4p+i5/71ZWfp7vpWaU5O3Ao3qiC/
	jP5U+/WSr/Lwd++lu9R3hw==
X-Google-Smtp-Source: AK7set8FJe5xztcBF6GRv+jcUAEBTrhZshKAEsTcASPsfocC0zofE+fXHQXjcEGimqKxXkMCQR//dw==
X-Received: by 2002:a4a:ca13:0:b0:525:3ac1:28be with SMTP id w19-20020a4aca13000000b005253ac128bemr4392209ooq.1.1677519497795;
        Mon, 27 Feb 2023 09:38:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f9-20020a4a6709000000b0051ffe0fe11bsm2886260ooc.6.2023.02.27.09.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 09:38:17 -0800 (PST)
Received: (nullmailer pid 510693 invoked by uid 1000);
	Mon, 27 Feb 2023 17:38:16 -0000
Date: Mon, 27 Feb 2023 11:38:16 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH 09/16] dt-bindings: pinctrl: mediatek: rt305x: split
 binding
Message-ID: <20230227173816.GA505343-robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-10-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222183932.33267-10-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_093819_924437_3AC3AFC1 
X-CRM114-Status: GOOD (  21.67  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 22, 2023 at 09:39:25PM +0300, arinc9.unal@gmail.com wrote:
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
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    patternProperties:
> +      '^(.*-)?pinmux$':
> +        type: object
> +        description: node for pinctrl.
> +        $ref: pinmux-node.yaml#
> +
> +        properties:
> +          function:
> +            description:
> +              A string containing the name of the function to mux to the group.
> +            enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led, lna,
> +                   mdio, pa, pcm gpio, pcm i2s, pcm uartf, rgmii, spi, spi_cs1,
> +                   uartf, uartlite, wdg_cs1]
> +
> +          groups:
> +            description:
> +              An array of strings. Each string contains the name of a group.
> +            maxItems: 1
> +
> +        required:
> +          - groups
> +          - function
> +
> +        allOf:
> +          - if:
> +              properties:
> +                function:
> +                  const: gpio
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c, jtag, led, lna, mdio, pa, rgmii, spi, spi_cs1,
> +                         uartf, uartlite]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: gpio i2s
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uartf]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: gpio uartf
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uartf]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: i2s uartf
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uartf]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [jtag]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: led
> +            then:
> +              properties:
> +                groups:
> +                  enum: [led]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: lna
> +            then:
> +              properties:
> +                groups:
> +                  enum: [lna]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: mdio
> +            then:
> +              properties:
> +                groups:
> +                  enum: [mdio]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: pa
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pa]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm gpio
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uartf]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm i2s
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uartf]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm uartf
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uartf]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: rgmii
> +            then:
> +              properties:
> +                groups:
> +                  enum: [rgmii]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: spi
> +            then:
> +              properties:
> +                groups:
> +                  enum: [spi]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: spi_cs1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [spi_cs1]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: uartf
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uartf]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: uartlite
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uartlite]
> +
> +          - if:
> +              properties:
> +                function:
> +                  const: wdg_cs1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [spi_cs1]
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: "pinctrl.yaml#"

Drop quotes here and other refs.


