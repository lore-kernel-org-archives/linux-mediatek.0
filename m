Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F418C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 21:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWeAN6wBOdgTg8JbowHd+2FzjeCfu8a+6968a4QI8WI=; b=qefuiiEACrHJWAgq5LUWmJV6vJ
	Lx/vbPURzcrMd2A10c2cCvkUArLd0SSvXUVtM48cyJHwklUyKoWDGXX0G0ZrEiltsK7T0gahE6Rsi
	fCSwAQmcrpVSLQieoIO+MYh6zEcZ1xhXtitliBiB4jy+ay2tc7MNF0BkedCpxwU7GHycmvv9k5lkF
	HU3ZL497pDUYJ5GwSgbtGgWpD7Jx1LAusuRZVOEbSNI0cSEa/zdzIa6jPLqnydfmu/iVq5OAg6IxQ
	fQZ+8+mEuBh1WRMca5tigqu/JuL5894erI1foY+DBRRqIpmTlOZS5pgAAqBje+sQ3rcJM1nF2FC4P
	j6nZWdzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wgY-004LZ1-MT; Thu, 16 Jun 2022 21:05:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wgM-004LUS-5C
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 21:05:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id m14so2227896plg.5
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qWeAN6wBOdgTg8JbowHd+2FzjeCfu8a+6968a4QI8WI=;
        b=N5ZFoL+aFoUS6hB954SKMlb7yCUNVwnEz5QTGbIWpo81EwQ1sMXtUJNQgQWUFXyaqj
         B3EKyPgnhgeP6Zxqc0o0AXWyPWgb2jZKHij8R6bu7VXYG/qL6Jeu3Pus4aTVrIH5N/up
         1mVgnWLjqxO/IM/TYAske9+86aHB4TE/sPT2q6jKDvKrVbIRbqCUop88VsbKe70HL/Xn
         WD13w1gMuXTC77dfwj7AUO0e7PAT47hYpwj/3hqPUXU+ijawuZQFwT1JvD33vRGoqe5d
         JySTlKChot+aWilu0E/PsGcDvuRxR9SgKE0cOeMTOx1RDYK8f3vG2bi+O+s59MTFKM8U
         9Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qWeAN6wBOdgTg8JbowHd+2FzjeCfu8a+6968a4QI8WI=;
        b=mJbdQ4SoTsxkIyzx9ZP0rlZwsbY09Xk0v1sRkKTUM5dEl+smLoCoi+01iT5lcMpwfj
         LkG5prbWFD3kKxNUrbC9YqXymetzFUO/j/DhLvXslUYGhueZgoTrMI/0gkDeRH1+IkFI
         bzpdgxnY59VZU8EHvrDMxhj0GLjZeMOXfJegahLib1Ev+RXTvIHPUzGRsDOP1GtBm0Ks
         ygOmdtA2RAc4GPriU/EWan5Ba6DIJ6Irqb8FWbNmqUUQ4F6IN1tUjxopDN/196j+kRal
         d9Ck2Zi90QBlT1tvNOKOV1tK00zPJBwhd89DUIowVPQ4EJHDWPdeLXhNCqBDTA+1U9e2
         PVMg==
X-Gm-Message-State: AJIora+FAEy9aGamB5FHILr0XLuIHUEB3XX9NX66STSdWGbWso8W3byg
	hV8G5pGrZqaqA94lXfp6otTA0g==
X-Google-Smtp-Source: AGRyM1unXZ92n4cSgCY+nW05HkVgMJnrvjv1CRQe+KwLgKR+A0HSLHUM2FUPV+vxq7K020P5WmFE0w==
X-Received: by 2002:a17:90b:4d8a:b0:1e6:87ad:bfd3 with SMTP id oj10-20020a17090b4d8a00b001e687adbfd3mr7000104pjb.138.1655413536660;
        Thu, 16 Jun 2022 14:05:36 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090ad70500b001dd16b86fc0sm4249403pju.19.2022.06.16.14.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 14:05:36 -0700 (PDT)
Message-ID: <dd9b9be2-7bdf-6cb6-b8ad-d7c0a0d5b98a@linaro.org>
Date: Thu, 16 Jun 2022 14:05:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/15] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 ChiaEn Wu <chiaen_wu@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-3-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-3-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_140538_242619_AD33EAA8 
X-CRM114-Status: GOOD (  16.74  )
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

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Charger binding documentation.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> new file mode 100644
> index 000000000000..b63553ebb15b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 Battery Charger
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-charger
> +
> +  interrupts:
> +    description: |
> +      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
> +      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
> +      are required.
> +    items:
> +      - description: BC1.2 done irq
> +      - description: usb plug in irq
> +      - description: mivr irq
> +
> +  interrupt-names:
> +    items:
> +      - const: attach_i
> +      - const: uvp_d_evt
> +      - const: mivr
> +
> +  io-channels:
> +    description: |
> +      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
> +      is required.

Add io-channel-names and describe each item - what type of ADC it is
expected to be.

> +    minItems: 1
> +    maxItems: 9
> +
> +  usb-otg-vbus-regulator:
> +    type: object
> +    description: OTG boost regulator.
> +    $ref: /schemas/regulator/regulator.yaml#

unevaluatedProperties: false

> +
> +    properties:
> +      enable-gpio:

"gpios", so:
enable-gpios

> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - io-channels
> +
> +additionalProperties: false
> +
> +...


Best regards,
Krzysztof

