Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D8BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 11:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj6+le4xQYgRWhbJ4o+JcrPIptpoGXL5M4xVrdtZbXI=; b=vXtpVlYKW5e+Zachc+0Qh39WHk
	YhSaDRHZNRqWKqU9JEi3zkfbkTDtmsfF9ONIJ51RzW6XZytY7X7i00UdXtm2PAQkdAgeYQTbf8CK7
	ViT689YhH5X4ESo5Iae75vFBbxkXmZEAorv87YSPb3eHYlANnYy49+Idt8KJDt867n7V08xILBzX2
	adUF6x0lGXuzES98xxj1BIgnV/CNNdfQjqGgdnQSGyvYurAe9liANCrG2Kr+F7MwMH002QbA953cc
	/R48LMKlIpjNU5OiI5meMJkGzsHqycrS0igX0WDmU0JTHjZHHGRM94/YkGZ/KiVAJM3te1LIiWz0N
	CBSaAdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hfF-001xUr-KG; Fri, 24 Jun 2022 11:39:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hf3-001xS4-TQ
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 11:39:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id h23so4073558ejj.12
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jun 2022 04:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Wj6+le4xQYgRWhbJ4o+JcrPIptpoGXL5M4xVrdtZbXI=;
        b=O26iv82q0trCWgDQwRmW6rUiSusM7pWvnNkO+V25QbNy7sOhu5esaQuJS7PwEwU3me
         Y5h7BfA9Gsbe2XrGvelcv6XAS5b+QDIjWuyq9j37ZvWmhRmJ48gmjKfPI+n6s0JkG0Im
         CDVkH9TIGF7b8/w7lXV62OP94WgbzGfx7wpTJbGIrqDtM3uOjQnbLKSKlKwAtePFBT0V
         p0UC7KC2dcsZiVk+jsW+BB+3hwR39LVFSI68D3J4t1grJmX1kHAWk4K42QCX24AX1oi0
         SbMSM89C1Pj1C7dtRAeCcSnHR7lTOSfcpvpwV+KgsO9loIxaBH/9by5n0QkWSZvgYpVw
         4zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Wj6+le4xQYgRWhbJ4o+JcrPIptpoGXL5M4xVrdtZbXI=;
        b=Ezs/jN+OJwZsiOH9tDt6mxuvzmcoOUfSkzLhPotk0UQ/paFpvXBqHvnnFQfB8ontr2
         CFSyp9kMlenKXq3HsI0Kt8iGCymEAZzMsUQD0LendmD3M/DFh58G8Dbnr1jEqVX8VfqF
         /stsOmIXBwta3BWdbi5384AomOJy29rFivvLsNsGeg9YC1ROmVFE/NY6+zQVLXXUk2mw
         NgtOPzhi3j8s4XEI5AkaMFZzOyzSR4pYEB4/GEGzuxu9Ir1qc8HIntfGN3P4VfOmmLvX
         o7m2w0iKHOYN+QbMyW+5NSG8BVU9KgWoS3l8VKyyI+cpIsceJVsEa1MFb/O31cTrVKQS
         z0IQ==
X-Gm-Message-State: AJIora/mN2nKHx6TtpyHrC6TQqvkqJHfslLWppMYBSvH1eSBXlxhIM2M
	kYzLddYnt8zn72Cjv5BrGTJgEw==
X-Google-Smtp-Source: AGRyM1tMl63rWpj4b70pBJHZZBdq7tLURrxHPvEhTWmOq2GveNEsVZf4u0behvJ6CGqQ22A5aqS+/g==
X-Received: by 2002:a17:907:7e81:b0:726:2912:7467 with SMTP id qb1-20020a1709077e8100b0072629127467mr7207432ejc.373.1656070778635;
        Fri, 24 Jun 2022 04:39:38 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090638c100b007219c20dcd8sm962517ejd.196.2022.06.24.04.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 04:39:38 -0700 (PDT)
Message-ID: <8956c98e-657c-0263-c8d9-d6beb54410f9@linaro.org>
Date: Fri, 24 Jun 2022 13:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 06/14] dt-bindings: mfd: Add Mediatek MT6370
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-7-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623115631.22209-7-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_043941_977243_DB97C2EC 
X-CRM114-Status: GOOD (  15.80  )
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

On 23/06/2022 13:56, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 
> v3
> - Use " in entire patchset
> - Refine ADC description
> - Rename "enable-gpio" to "enable-gpios" in "regualtor"
> - Change "/schemas/" to "../" in every reference of all MT6370 modules
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
>  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
>  2 files changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> new file mode 100644
> index 0000000..fa9da13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> @@ -0,0 +1,280 @@
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
> +  "#interrupt-cells":
> +    const: 1
> +
> +  adc:
> +    type: object
> +    description: |
> +      Provides 9 channels for system monitoring, including VBUSDIV5 (lower
> +      accuracy, higher measure range), VBUSDIV2 (higher accuracy, lower
> +      measure range), VBAT, VSYS, CHG_VDDP, TS_BAT, IBUS, IBAT, and TEMP_JC.
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
> +      - "#io-channel-cells"
> +
> +  backlight:
> +    type: object
> +    $ref: ../leds/backlight/mediatek,mt6370-backlight.yaml#

This was correct before: /schemas/leds/ ....

Same in other places.


Best regards,
Krzysztof

