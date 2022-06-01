Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0EEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjYpn+t4+8lEOjXndNH/b06aybhFT1VEeZIYipMisWs=; b=kD6uCsF9Nh2A6r
	68/Qd3q/V9ZzQ4wxD6v1mOYB4M0Uin+v75vekgk6tbkr3Rx9+juLkqrhbOZf/vW93T763h0gKj7bw
	MDSqjckREZv4i84i6ZsWZUjXXJ0d5MFpAuuyzYrQeFKwBuAYemwYmHyHXgScrv8p6pRq1ptbgpFOs
	QrzZc4uBWlFODZ0fG3moM23He/BiJn2nzE9zRH71Nym954zZWKvlAad6aQw3rRV4ZZfSbWHolKOTV
	RaRzL4YGs4nIgaLOaMCORLirYYmKASn3Q1q+POEnHeNeRgvfz1pM01sJBh1yaWBKUzMlc3Jm0wsDY
	dZ0wBxZ/ZCtFiMkyJFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIsg-00ENlL-7p; Wed, 01 Jun 2022 07:35:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIsc-00ENjF-Ct
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 07:35:00 +0000
Received: by mail-ed1-x52d.google.com with SMTP id v25so969422eda.6
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 00:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UkKpNYLV+QZV53hwWfH5fNHVrBq7gV6/OoYtJa/OWHg=;
        b=rMnrfEU0hqxNbgO3Ngd4aiEKTa1atj5Akph4RlI7CZIaOcu1EO+hnB5M0SZ23e/3z2
         rN7OEJEvscZpeWlRG7rWq53GkfQjm3Gq7tRIKXdTgw7OU0jszTjSXI/x/abDIi4/YrLW
         y6D4ObKimOf5l5JILct6SzrdKI//yM3Xd3wezrz3e0Jgf6E/GnN4jlSR2xoDvzSA3cEe
         r7+Z2Y2HxfKsW1IK7UxozvJkgXuUlooXD0+gnyqDqslcPpTu3yAt36QJjN/yef+m0H6Z
         5WYBQb3lILHrheefyEo1M+ENIANP5hCJ55qRPEphBhEQNSaOv5FqsoWn1cmcw4pbaHzg
         g/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UkKpNYLV+QZV53hwWfH5fNHVrBq7gV6/OoYtJa/OWHg=;
        b=vEjPH9GE0kKuxWPmzsPpNqOYWgoXFDWqxObttp69ei1K7+kmGQqXYB8B2lHED3Ghz4
         Nkkw2h2RCvVOnZtlHBAMNNhZ5TRvMfPgR9yrSJhcMbMxt5L4+m62AO51S1I7uFSfXn5V
         k07X+IaaSvhjzkpnu616aIqxkxrD8paha34AqbIa8QVuuYofU4Aj8VdYCOM0q6i4WCTP
         BCerH7v3EUVVRFlLHbCsVd8N9wxUNiUGBr0pL7zylP2OGkzNwsDPrj4/tn+b9oq/gGpv
         6g5wHOXGcoG43mcXCzTSCP9ervOf4jMl6S694SH+edQG8Nx8lOUiosOfGT+DIODrx8TF
         Xfqw==
X-Gm-Message-State: AOAM5309DqLyCNGRUu46AKPSeovq1DCkHaUg8meH9hADLC3arrpAxW7E
	KY9RLOYwrJyxL9FxAVL8SboU0w==
X-Google-Smtp-Source: ABdhPJz96yqdhicWuQ/1oz1BY3Wwhy9jxY/RrbCB45rlVIhHe75cCdPoQVOlyJGi8PCpDIpC7VcczQ==
X-Received: by 2002:a05:6402:518f:b0:42b:4404:63d4 with SMTP id q15-20020a056402518f00b0042b440463d4mr56379750edd.177.1654068896097;
        Wed, 01 Jun 2022 00:34:56 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k11-20020a056402048b00b0042ab02e3485sm509213edv.44.2022.06.01.00.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:34:55 -0700 (PDT)
Message-ID: <6227bc72-fe7c-561a-073d-bd5e6debc68f@linaro.org>
Date: Wed, 1 Jun 2022 09:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 13/14] dt-bindings: backlight: Add Mediatek MT6370
 backlight binding documentation
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
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-14-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531102809.11976-14-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_003458_536255_2FF541E8 
X-CRM114-Status: GOOD (  20.22  )
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

On 31/05/2022 12:28, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add mt6370 backlight binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../backlight/mediatek,mt6370-backlight.yaml  | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> new file mode 100644
> index 000000000000..81d72ed44be4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 Backlight
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  MT6370 is a highly-integrated smart power management IC, which includes a
> +  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
> +  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
> +  driver, a backlight WLED driver, a display bias driver and a general LDO for
> +  portable devices.

Do not repeat entire device description, but describe only this part.
Your other pieces of MFD were doing it correctly, so why here it is
different?

> +
> +  For the LCD backlight, it can provide 4 channel WLED driving capability.
> +  Each channel driving current is up to 30mA
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-backlight
> +
> +  default-brightness:
> +    minimum: 0
> +    maximum: 2048
> +
> +  max-brightness:
> +    minimum: 0
> +    maximum: 2048
> +
> +  enable-gpios:
> +    description: External backlight 'enable' pin
> +    maxItems: 1
> +
> +  mediatek,bled-pwm-enable:
> +    description: |
> +      Enable external PWM input for backlight dimming
> +    type: boolean
> +
> +  mediatek,bled-pwm-hys-enable:
> +    description: |
> +      Enable the backlight input-hysteresis for PWM mode
> +    type: boolean
> +
> +  mediatek,bled-pwm-hys-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      Backlight PWM hysteresis input level selection.
> +      value mapping:
> +        - 0: 1bit
> +        - 1: 2bit
> +        - 2: 4bit
> +        - 3: 6bit

Please explain what is this input level and what is the meaning of
6bit... In any case you cannot have values mapping, but instead you
should use the logical values (so 1, 2, 4, and 6).

If "sel" is shortcut of "selection" please drop it.

> +
> +  mediatek,bled-ovp-shutdown:
> +    description: |
> +      Enable the backlight shutdown when OVP level triggered
> +    type: boolean
> +
> +  mediatek,bled-ovp-level-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      Backlight OVP level selection.
> +      value mapping:
> +        - 0: 17V
> +        - 1: 21V
> +        - 2: 25V
> +        - 3: 29V

Logical values in microvolts. Name it according to unit suffices and
drop any useless parts of property name like "level selection". It is
simply - mediatek,bled-ovp-microvolt.

> +
> +  mediatek,bled-ocp-shutdown:
> +    description: |
> +      Enable the backlight shutdown when OCP level triggerred.
> +    type: boolean
> +
> +  mediatek,bled-ocp-level-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      Backlight OC level selection.
> +      value mapping:
> +        - 0: 900mA
> +        - 1: 1200mA
> +        - 2: 1500mA
> +        - 3: 1800mA

Same comments.

> +
> +  mediatek,bled-channel-use:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      Backlight LED channel to be used.
> +      Each bit mapping to:
> +        - 0: CH4
> +        - 1: CH3
> +        - 2: CH2
> +        - 3: CH1> +    minimum: 1
> +    maximum: 15
> +
> +required:
> +  - compatible
> +  - mediatek,bled-channel-use
> +
> +additionalProperties: false


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
