Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D48C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYCOWLF9hq9wkvCumymUaiOvsXj6LCxun7IcsC517zo=; b=qCMOoY/ISEShV1
	H1PuEkx4egZ3l3FQwQsouqRDO+dfqpB9Tlc2M2EJG98sgLbo1827aFzCadkYkpSsijK4uNv5eEPya
	1mm9qfNwW7S7rVZLGJWItOXplqDT62LOCyO0dFBP5XgbMrlNBtM6OVQouvdtAsUcdWtBWkBOigM/H
	0DBkO0DX0IJ5qg9/vKxeL/k181MSkEoq3pRuZHxaXAbKIlEl8/Phb+6IJFcdruGTxQXGmmXwey4G9
	vWRUaBnNfs2L6Yedsd7SpNhCKECcQxqmG19XRINsE1HaJ/LFG9JNoyPxgRrTX2PstGzDeQNHhoBL3
	vMJ9Ds+yuaxnAWUe6wpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8Gh-00CSZP-4V; Tue, 31 May 2022 20:15:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8Gd-00CSWS-U1
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 20:15:05 +0000
Received: by mail-ed1-x52e.google.com with SMTP id er5so19025664edb.12
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oFtwwjCwLQncprSW0uxMAdDJMdxwLty5X6vUURCLEwk=;
        b=ITMWpvDnZ+RR0dXG8wMy2xR2rl4TYKiJPd4P2ee+6b+YSNrXIfd5C5/sxHiIaiV8l/
         Rr8j5rbfZJQdWDicbqJLULlJ8a1LPJtojDk9pZRk5GN9Grou5i7tAHjAOnAm+43fQbft
         AItTPaS/anUqkjrgHeA8gWiVTOnJVpyYwkX4kWPrZRx3KFfTtM/N/iDSPeACILsT4aQf
         M3SWSLCBTTSyyMcH3BloOhEZjIv4V9qKLVXjfngWe+ZrAh5pvVrbUk/ZDUnhXwaHIcji
         8VSjsm3e2xhEeVQO89RSDtV5LDweV0ruYx2PZwybiDHSYQi1HJRfQptttYSjG2nvuBwD
         fRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oFtwwjCwLQncprSW0uxMAdDJMdxwLty5X6vUURCLEwk=;
        b=ye49lThyh16IynWIzwaRmiXhIl19J3SsVm0tygHO8IlOHz0RvbjLs0/BzyWKtfuqMw
         n+lLM1xF0nEw5h21bY3lNy/1BqkanQu1/3RL6E5QZ4tSclMCQ93esDxU10XpyB2DoBq+
         EryUVlAm9hy6wuF/jzrh4KHumobB+hJ9vZuw+YVWX5ckPMZSKqk4j1eNxXmoFYlYmG+M
         gzXGfsGmZwqmioJx4jpaMj9tpaRlKAgBS0KIKJOHLUIYDsHGLiGr8ug67Gu/SzoYFNZ/
         ooLVylBiFjsEavQqi7khAVlI6ruWkfR5NQh3J5Qes768hg6hQrTGZA6/JLs/ycvqcBT3
         a5lA==
X-Gm-Message-State: AOAM532+bcg+fLDaSuYEgjynnW2KOjC4nbXr0XBoctsHFfnSp4C1zRqQ
	sYKNTlneRFD8TwV90NcCWo4Bdg==
X-Google-Smtp-Source: ABdhPJxh3X5a34X2qfUbuwM7ahlfxQCxIkomDGMgER9D0LcMD1yvEUBK+ewRUPxHTf67kQQv6tje2Q==
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id b1-20020aa7d481000000b0042dd5fdf963mr10752639edr.209.1654028100222;
        Tue, 31 May 2022 13:15:00 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i24-20020a170906091800b006ff05d4726esm5251077ejd.50.2022.05.31.13.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 13:14:59 -0700 (PDT)
Message-ID: <33a797d7-ca60-5153-2ba1-3a909fcc5965@linaro.org>
Date: Tue, 31 May 2022 22:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 10/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger binding documentation
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
 <20220531104211.17106-2-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531104211.17106-2-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_131504_001895_E04117CF 
X-CRM114-Status: GOOD (  17.88  )
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

On 31/05/2022 12:42, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 

Subject - remove "binding documentation". It's already implied by prefix.

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
> index 000000000000..9d5c4487ca9c
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
> +      - description: BC1.2 done irq for mt6370 charger
> +      - description: usb plug in irq for mt6370 charger
> +      - description: mivr irq for mt6370 charger

s/for mt6370 charger//
in each item

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

Constraints (e.g. maxItems) are needed.

> +
> +  usb-otg-vbus:

Let's keep the same name as in MT6360:

usb-otg-vbus-regulator
> +    type: object
> +    description: OTG boost regulator.
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +    properties:
> +      enable-gpio:
> +        maxItems: 1
> +        description: |
> +          Specify a valid 'enable' gpio for the regulator and it's optional

This description is pointless - does not bring any more information. You
repeat the schema. Please, avoid such descriptions.

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - io-channels
> +
> +additionalProperties: false


How about example? Or is it going to be in MFD schema?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
