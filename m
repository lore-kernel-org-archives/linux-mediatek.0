Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B17C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqJwjbl3GoQWjYkDuqhTJNQZBiUhf6ZgViZvTqKCmxg=; b=X+0qnp6JIhVYDi
	7QTRI+wEc+XsgZF9uot2/BEsvk43mrx44PkbIJp76fkrZ8LZZ/ICGD0ijX3rhlvTkJ0LfqlyNL668
	ijxF1gKNFyFRA5HJMMnI0aniCmydBpXW8B2/Wx6oGVzyszfLgEaRg3X6Nw429VaejGaAS1mIygrOI
	F58mq/V/mgclpnlycktaggmfv5HkLICDcM7q2O4P00Rf962yOnGXopNthBoLhbKqBIPjmMa+yhPGL
	pB56yRViPS9QrMVmxRmxrgcyBZuo88rmt8eC3WZCxzx5+RBxiEcZGpMXbxmynYKTR+fstk1vpvKme
	z88nGaeUPtfu0/t+wZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8df-00CYIE-D6; Tue, 31 May 2022 20:38:51 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8dR-00CYDs-Uw
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 20:38:45 +0000
Received: by mail-ed1-x52f.google.com with SMTP id c2so9573850edf.5
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 13:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LnHG31HXQfKnbhGg7cjs5q5dHO7sV+EO7splsWy9LeQ=;
        b=G4bpmdn50HXz387vl8R3y2JvcN1BMO8J4TnlELbvBC3hch09KoDJys8Gb1VxVKVfMp
         WF4/5Bl7r3o0N8kDIFXar10RdRAF2ERfMar+yaboTm27MUMOFUcQYMywTvJn4plszWu8
         Ezu6XeSDZVZvjILJcLyo9KEkUpJBiujNlQNxKeqylfN4Z1m0gwC/cw2quZMAy9Tl2zNe
         8VT/AW2zGVespv4TQu1Zz7OhJPEKNhKrS9X+3H43j6OKle3lQ4bHS3gfG7NjX7SzzA4Y
         6dd+Ty88BqnmRjplgHfH6NgwyQ/L5t4nymBrZrAKk05FYWSm/8zJsHLfWc7dmq7YPoJ5
         1mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LnHG31HXQfKnbhGg7cjs5q5dHO7sV+EO7splsWy9LeQ=;
        b=DLJ+rUYPqwQC/MEnWuQPdYBhIFA2YbbeqbQaTUA62oqa+h8ftVNQqsje67qo/cAYGy
         ibpv/MiSrkIV/KlfoI4ZNwVCuVrlrB/qXtfW79wkaPVivgZMfuBsUtkwhGBS+N+BQdwi
         0XUS/5dXWEYkA/zQHmgQpvlQ/ctkwtL8SgIS6XPZZ2KW1ij5BRVQX+87MxhduVOc41Jd
         oDjRfN2qOlAnVHB+j9oSd5UGKFOCw2JNQyumT4Q/jRUkEUav82t/8EUPzfVtHWt5iWZX
         QHW9rsnKCmWlNOjaKLZ7xoMgoq9MWtUNRb9xJhSAfeO002qpbdMw3qOQXcgwQgyElQn1
         RHXg==
X-Gm-Message-State: AOAM53168RGPE4IYc82nB/B74dUrKh9HD4hUKWYsXCOZHfXLPRXgUkvP
	D2SdLjyP3oZ4DT67Ad+Kjnvgyg==
X-Google-Smtp-Source: ABdhPJxkgTOHGDh/+1ZlJUDIpeS1F3D633+ql1GnhfBUpZG6Av5LP8dRbdIOBf6rA5kXSNJ0tE0G7w==
X-Received: by 2002:a05:6402:1f0f:b0:42d:d4a5:a38c with SMTP id b15-20020a0564021f0f00b0042dd4a5a38cmr10987637edb.140.1654029514252;
        Tue, 31 May 2022 13:38:34 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 12-20020a50874c000000b0042bc5a536edsm9094727edv.28.2022.05.31.13.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 13:38:33 -0700 (PDT)
Message-ID: <0036b3f3-fdf8-4635-18e9-461b93a87f19@linaro.org>
Date: Tue, 31 May 2022 22:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 11/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 indicator documentation
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
 <20220531104211.17106-3-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531104211.17106-3-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_133838_022030_8064A4DF 
X-CRM114-Status: GOOD (  16.67  )
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
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek mt6370 indicator documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../leds/mediatek,mt6370-indicator.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> new file mode 100644
> index 000000000000..823be3add097
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for MT6370 PMIC from MediaTek Integrated.
> +
> +maintainers:
> +  - Alice Chen <alice_chen@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  see Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-indicator
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^(multi-)?led@[0-3]$":
> +    description: |
> +      Properties for a single LED.

Not useful description. Just skip it, I think schema allows it.

> +    $ref: common.yaml#
> +    type: object
> +
> +    properties:
> +      reg:
> +        description: |
> +          Index of the LED.

The same, regs are usually not described.

> +        enum:
> +          - 0 # LED output ISINK1
> +          - 1 # LED output ISINK2
> +          - 2 # LED output ISINK3
> +          - 3 # LED output ISINK4
> +
> +      mediatek,soft-start:
> +        description: |
> +          soft start step control, support /0.5ms/1ms/1.5ms/2ms.

Why here you start sentence lower-case?

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]

This has to be in logical values, so in ms, not in some register values.
Use proper unit suffix and enumerate the actual values.

> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
