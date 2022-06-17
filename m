Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=294ojvCzJG+QxzRogH/Uf6cGP9X/olCBo7vsCMUaWUs=; b=zqtc/lg6AE9C1ncUWH2yu4IDjF
	WmqWU1aTMQcgum+yFY6VJ11TBh/5rQuXdtssLvHcX7yg1mYmDRsmVUFtMVvzjgil/wnpX6W1n2kwt
	29ktD8cAGPvxWHIgAkj5KQLcorKxSqEoPHASqYPvyoAn2WMHyT3n21f9n3ABqOIbUuR8f3PLpMbZS
	QJ3/ZcRudFtHFsxIDZeDsAXD5i7OpMuKkaIphiDOzvcNJtE4+q+gbK1lCyqCa31lwzRegGx3Epwie
	uX5MiB34STx4xku+y+uAqeMwyJuLjPubIksNP82/70G23w2vsaksXPMGdJp2JvY34K5Netz/G+Kus
	EXQ7khvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2L8Q-009Y1S-4g; Fri, 17 Jun 2022 23:12:14 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2L8M-009Xxn-JP
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 23:12:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id y196so5327169pfb.6
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 16:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=294ojvCzJG+QxzRogH/Uf6cGP9X/olCBo7vsCMUaWUs=;
        b=rRMAv5j+Hd/iJN32vcBDVL12U3rDEOOrDCl0MNjeuoB8nfWV1YTHVPRQxhLQzoJgkX
         ZJG8iKXWOMEzcoSSx4BzvL4tW/FkQYqnQyv12OpGhLHgnqsF6MA0Zv/JSKUyme4TAdC1
         PK4UNdO1p7nq6ua9IRX7f5y8kq4TRP0rZ11wo6jCd21bxBCR0qCtS3EqGZPgSOcsLfsG
         FG4f5UYmY07Jsv9z6xEuBtiNjJlIeAgxtaZTK9tJdqWjWANTPiGOVJybe7hvJ9oZqXL9
         HFn/y5aQTdGOOA9aVIAvXAe7Q0YJ5X8tMP0RYR8Qd7xIDEPKM+u0LrMy9wJIkIzH20SK
         yGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=294ojvCzJG+QxzRogH/Uf6cGP9X/olCBo7vsCMUaWUs=;
        b=QMZ81rIbmvRyEVTxFFykhQn2BH2TLuqIHKF01fcUypodwXlyqG7l7Hjfr6Rl8DLUQ9
         xMGneJGpRlIikge/He9Z75L1lmVOR4Q5THd1UuZ0GS19YjdBJitXrYIvryOmW6MUGGV8
         Q8LlCk+9NzFcjjX9E6bNIPsABW44S3EVTeGQnULYZpeaHaxNGJXs5fsHkLeBrEgBI1Qk
         EqFdsqMKUOTTc5qCMxv/EYuosYDvP9FAmgbWOlnnnFXlbGEnGMo9r83AnPTEtTK7iU3c
         Dcl+0k+W14+GiXP/jciyvwXn1nwiSeWCHG6wuSfztGtg2nbInEnkYGOFG+icvNDVPAl0
         9pIw==
X-Gm-Message-State: AJIora9aLjhrNseyeTkLj1Y4V0xAHQcQFntdAC2Ol/hJwUAI4zyhLPXr
	MXYHHyzBkkvVGieEHBaEKFA7Fg==
X-Google-Smtp-Source: AGRyM1stFAPlhmMkLY1NazO67J7oIwcpQv5+571CFcD+wsnGDHo4hdZrZyBBUSUL5SYGrTcERU92tQ==
X-Received: by 2002:a63:4f05:0:b0:405:5463:2ea8 with SMTP id d5-20020a634f05000000b0040554632ea8mr10679545pgb.94.1655507526105;
        Fri, 17 Jun 2022 16:12:06 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id c2-20020a639602000000b003fb098151c9sm4301292pge.64.2022.06.17.16.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 16:12:05 -0700 (PDT)
Message-ID: <b59237c7-fb60-35e2-66f9-668d9946bd3c@linaro.org>
Date: Fri, 17 Jun 2022 16:12:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/15] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, Daniel Thompson <daniel.thompson@linaro.org>,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, szunichen@gmail.com,
 ChiaEn Wu <chiaen_wu@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-3-peterwu.pub@gmail.com>
 <dd9b9be2-7bdf-6cb6-b8ad-d7c0a0d5b98a@linaro.org>
 <CABtFH5+5Y5Tq3vO6Sg3kf98CWm9Aijv7qkdBcpm2SB0JZ1gCiA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABtFH5+5Y5Tq3vO6Sg3kf98CWm9Aijv7qkdBcpm2SB0JZ1gCiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_161210_754345_D5CFFB91 
X-CRM114-Status: GOOD (  24.55  )
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

On 17/06/2022 03:19, ChiaEn Wu wrote:
> Hi Krzysztof,
> 
> Thanks for your helpful comments! I have so some questions want to ask
> you below.
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年6月17日 週五 清晨5:05寫道：
>>
>> On 13/06/2022 04:11, ChiaEn Wu wrote:
>>> From: ChiaEn Wu <chiaen_wu@richtek.com>
>>>
>>> Add Mediatek MT6370 Charger binding documentation.
>>>
>>> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
>>> ---
>>>  .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
>>>  1 file changed, 60 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
>>> new file mode 100644
>>> index 000000000000..b63553ebb15b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
>>> @@ -0,0 +1,60 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Mediatek MT6370 Battery Charger
>>> +
>>> +maintainers:
>>> +  - ChiaEn Wu <chiaen_wu@richtek.com>
>>> +
>>> +description: |
>>> +  This module is part of the MT6370 MFD device.
>>> +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt6370-charger
>>> +
>>> +  interrupts:
>>> +    description: |
>>> +      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
>>> +      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
>>> +      are required.
>>> +    items:
>>> +      - description: BC1.2 done irq
>>> +      - description: usb plug in irq
>>> +      - description: mivr irq
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: attach_i
>>> +      - const: uvp_d_evt
>>> +      - const: mivr
>>> +
>>> +  io-channels:
>>> +    description: |
>>> +      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
>>> +      is required.
>>
>> Add io-channel-names and describe each item - what type of ADC it is
>> expected to be.
>>
> 
> I'm afraid I might not be understanding what you mean.
> I will try to add some text in "description" and "io-channel-names", like below
> ----------------------------------
> io-channels:
>   description: |
>     Use ADC channel to read VBUS, IBUS, IBAT, etc., info. Ibus ADC channel
>     is required. It can be seen in
> include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
>   minItems: 1
>   maxItems: 9
> 
> io-channel-names:
>   items:
>     - const: vbusdiv5
>     - const: vbusdiv2

Almost. The best would be something like this:
Documentation/devicetree/bindings/power/supply/cpcap-charger.yaml
so also "items" with description under "io-channels". You need to skip
maxItems in such case (keep minItems).

>     - ...
> ----------------------------------
> Did these modifications meet your expectations?
> 
>>> +    minItems: 1
>>> +    maxItems: 9
>>> +
>>> +  usb-otg-vbus-regulator:
>>> +    type: object
>>> +    description: OTG boost regulator.
>>> +    $ref: /schemas/regulator/regulator.yaml#
>>
>> unevaluatedProperties: false
> 
> I will add this in the next patch.
> 
>>
>>> +
>>> +    properties:
>>> +      enable-gpio:
>>
>> "gpios", so:
>> enable-gpios
> 
> If this otg regulator only uses one GPIO Pin, do I still need to
> change to "gpios"?

Yes, because "gpios" is the preferred suffix. This is requirement for
all such properties. enable-gpios are also documented here:
Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml


> If so, I will refine it along with the regulator "enable-gpio" in MFD
> dt-binding.

Yes, there it should be "enable-gpios" as well.




Best regards,
Krzysztof

