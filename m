Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B388AC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPwpR6cjf4gl+iJ2edVyQ5QVngSHrLLuTQ/c3n689y0=; b=ldY8BwLhKQM+Q0ODpFKZpi0hIW
	kJez8XQ9/YOv5mBlxDDm/zPjfsAETXOGDHE/Fk/QjrwUAuVwM7MSm9pwE+NELT49exH2ix678q73C
	tGga2NZqHn5S4sS5TcPEJJkJ9uNsRFpmD6BDJ8DRfU/Pz9mGA0vDSbucdSKCcQn4xcisVQRhtUgkn
	iXfrvTbzQWHIoobFPRObBXUqXd+//TeRHhOVOxn5JvjAwO5CKCO/pLs0Ae5jlyjS8Igtw1kUEaUbd
	wql1kGl0XmNEvjF83Yfmw4dOI96wS6xOvYsgMQgLqF6SZEKRmqDWqOWIV77fzL1as93xEt3EqZiTS
	z8uE3HWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9dm-00CC9V-27;
	Thu, 07 Dec 2023 08:21:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9dj-00CC7V-04
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 08:21:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c26a45b2dso3609125e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701937303; x=1702542103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fPwpR6cjf4gl+iJ2edVyQ5QVngSHrLLuTQ/c3n689y0=;
        b=E7Eew73mRlg1IU4MXtTHgwVxUo0airf2imIY/+HwHUarbfUACs1hECdof8l4d530E7
         eXbSQhmh9xxuowow1eYdoygTT/VhpNTkcSvPOHqNk6vF6gKWVhbxSCoBJ9xIBlW/oQMk
         wwjWus/gBVkVcH8swGeAvdtE1xNgf38yBViSSKJX5IEkATS1asSZxf9dUA/Eub1sBRjI
         fZM61ail6izmUrTIav0PEQ7B+GpLu3oXJtbr9U6fVlL6m3rK8pvZAIRHTTcetx7ymhSB
         hpFt1l51fndlBMgMcWK94HEYoJyGcQkT8Q8J7GwAy31uXBTLeVq3M9McUB1oPtGuCIo1
         q61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701937303; x=1702542103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPwpR6cjf4gl+iJ2edVyQ5QVngSHrLLuTQ/c3n689y0=;
        b=BRO82W0rOnepTyxjYRcE75tH9PQepKPqSBfWHa71bcC707sqXBTliPWlCYQzYDXXrz
         Wzd5JKSs7w8Jq+VDXsWrYkiclmm+/Wy6f4cFOqPrbDi+VFgTnYwFn+nWWkjWxULpQeDB
         BfPcLGATCZ7bOGqsnm6BTphP/l6naQ6NnK4KSOhzCNi/LeSG2FxV5ig1FLtx0a6uMpm0
         J6Yur7Mpk6kFP+H0R8RIUHgbrCOvrHl+n58PhUHfOnoLKkqCxEnQrKHGfUhVCG5uicVz
         sq0g9CGZ1bLy40iL8TsWMkSD6Coa6AmqriFkK/9g/mglrbz2CjjXMqqAW/mSZiIuisJt
         I2aQ==
X-Gm-Message-State: AOJu0YwzUm1sohSZGrE+p3omnxj6aLtrp97OlFOLlWR+aqddwGWZM8eD
	aSl48WDditl87PCEXzUmKyIOqw==
X-Google-Smtp-Source: AGHT+IGG7QLYaH+Oo1cYq79KdJYAiV++XaIXXAxgTVSDkn3fzotgBZNT5mlR7KvgyOGB6p+b8hzpww==
X-Received: by 2002:a05:600c:d4:b0:40c:2698:db59 with SMTP id u20-20020a05600c00d400b0040c2698db59mr535004wmm.11.1701937303017;
        Thu, 07 Dec 2023 00:21:43 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id m12-20020a5d4a0c000000b003333a0da243sm777924wrq.81.2023.12.07.00.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 00:21:42 -0800 (PST)
Message-ID: <a7a9a204-cfd2-4510-890d-ce3f72d5fcda@linaro.org>
Date: Thu, 7 Dec 2023 09:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: media: i2c: Document GC08A3
 bindings
To: Zhi Mao <zhi.mao@mediatek.com>, mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: shengnan.wang@mediatek.com, yaya.chang@mediatek.com, 10572168@qq.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yunkec@chromium.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jacopo.mondi@ideasonboard.com,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, heiko@sntech.de,
 jernej.skrabec@gmail.com, macromorgan@hotmail.com, linus.walleij@linaro.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
 andy.shevchenko@gmail.com, bingbu.cao@intel.com,
 dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
 <20231207052016.25954-3-zhi.mao@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231207052016.25954-3-zhi.mao@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_002147_062889_36137AC8 
X-CRM114-Status: GOOD (  18.81  )
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

On 07/12/2023 06:20, Zhi Mao wrote:
> Add YAML device tree binding for GC08A3 CMOS image sensor,
> and the relevant MAINTAINERS entries.
> 
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>  .../bindings/media/i2c/galaxycore,gc08a3.yaml | 127 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> new file mode 100644
> index 000000000000..1802ff1c8a12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc08a3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GalaxyCore gc08a3 1/4" 8M Pixel MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Zhi Mao <zhi.mao@mediatek.com>
> +
> +description:
> +  The gc08a3 is a raw image sensor with an MIPI CSI-2 image data
> +  interface and CCI (I2C compatible) control bus. The output format
> +  is raw Bayer.
> +
> +properties:
> +  compatible:
> +    const: galaxycore,gc08a3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      External clock for the sensor.
> +    maxItems: 1

Items must be defined or just drop the property. How did it even appear?
Who asked for this? Your changelog is so vague that anything can happen
with this code and you will claim "it was review fix". No, you must
explain the changes.

Go back to previous review and implement all the changes requested.

> +
> +  clock-frequency:
> +    description:
> +      Frequency of the clock in Hz.

Drop property


> +
> +  dovdd-supply: true
> +
> +  avdd-supply: true
> +
> +  dvdd-supply: true
> +
> +  enable-gpios:
> +    description: Reference to the GPIO connected to the RESETB pin. Active low.

That's not enable, but reset-gpios.

> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +    description:
> +      Output port node, single endpoint describing the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-frequency
> +  - dovdd-supply
> +  - avdd-supply
> +  - dvdd-supply
> +  - enable-gpios
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sensor0@31 {
> +            status = "okay";

Drop. Do you see it anywhere in the bindings examples?

> +            compatible = "galaxycore,gc08a3";
> +            reg = <0x31>;
> +
> +            clocks = <&gc08a3_clk>;
> +            clock-names = "xvclk";

Drop

> +            clock-frequency = <24000000>;

Drop

> +
> +            enable-gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
> +
> +            avdd-supply = <&gc08a3_avdd>;
> +            dovdd-supply = <&ogc08a3_dovdd>;
> +            dvdd-supply = <&gc08a3_dvdd>;
> +
> +            port {
> +                sensor0_out_2: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <336000000 207000000>;
> +                    remote-endpoint = <&seninf_csi_port_0_in_2>;
> +                };
> +            };
> +        };
> +

Drop stray blank line.

> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index b752f8902367..1a16a94fb202 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -502,6 +502,8 @@ patternProperties:
>      description: Fujitsu Ltd.
>    "^fxtec,.*":
>      description: FX Technology Ltd.
> +  "^galaxycore,.*":
> +    description: GalaxyCore Inc.

That's a duplicated patch... how many of this people are going to send?

Drop and rebase on top of previous work of people.


Best regards,
Krzysztof


