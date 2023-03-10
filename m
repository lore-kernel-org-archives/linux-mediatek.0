Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A40AC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDVe/ilGCM1upNn+sXA7kF6veY8qJPcVwvcThxhDa6I=; b=QWp1HSwTa3DWV7+Vc9HYmGpHYU
	2mohLc+7Nl9nd9+5PZ5kNpo62maW13mJyzYlPbajgWMbqyvQIFTxpZWHpCeV4Be6f5MQ2BoVD52VK
	sOgNIMupME5h7NXo90S/jDADV+xtV65JabOXWaLCD1B9mu96GXxCMxD9wEWG7enT/rA0eS6KsyF2M
	0vQYPNumpt263kUcdRBJYZj/rVT123X0xUv/SuengHMgzba8bD7Qsmm1ydsijqNf/Fc+N9+Sr4mee
	enm+9BaIjdYoLu+nYfS17WzDfYqnuhrjZs86lnGjTTsdSNgBLuCDbykVglcI4goBflPR2G53aRiuR
	1LvTVSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYGf-00DhT0-JS; Fri, 10 Mar 2023 08:38:25 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYGS-00DhMe-Vw
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:38:14 +0000
Received: by mail-ed1-x52a.google.com with SMTP id a25so17576552edb.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDVe/ilGCM1upNn+sXA7kF6veY8qJPcVwvcThxhDa6I=;
        b=Pppuz/JUxawEDgmha2lSlsuKf9XEo5uJceQZxG8fZOdPlDwIRI++f8KUoyTdi1SIHS
         X4sXlMNXDbkeuKb3jIUN4o7S7NEkEG05vm7lD5PCJnPhjmgOzY89IEQtKS8dxyxk8J1p
         CfyhenjkMXgLzXcACM5LDZPpRa8/h28POLoty99ux4Xb0Q86qvvbHHOXRmxkf5MV+Kc6
         QdP7NdvX7H5WiLeysJM+Aj6g9JV9sy6/1kkXK3r7A6IdtKIkQar1kh768C/tV89f1G8l
         yzL1HXgEv/znoQ72yptz3rHrY2mOypVUIlhUmH9q0mw/tr9JSHfiV630dBNEKEq1uHas
         L5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDVe/ilGCM1upNn+sXA7kF6veY8qJPcVwvcThxhDa6I=;
        b=TkXVM6vrggKTGE+ohdzN+ESO/5mFRVn/wOir39lMFTGBDsmpptmElEDmnIo38ONC74
         LMGwMij+3QwBNsEwqD1EkS5TloWNhD4hOr48ZfUAa7X4dUz4eEQ4ysgY7um9a2zW1LcK
         cD260v69w2ixzw/hy9O+UP8gydbOrezlmR3LWoE7hHOxjEERIwpIHXB4n3rfXh7WRQ4x
         nYSvyTdov4zFVsR8PE3V0JT4A6yz+koyaftaJNj0UBTtXjoLkzXmmaT/O9CqaCesVakK
         OSg6qYWSyUICXEpcGBfjuBH5qapknzYaRH4fUryHg8fmbGyKFOj+2WUsve9hARksV1gJ
         ZB6w==
X-Gm-Message-State: AO0yUKUbCgK6qNsGC4zNWFedTJxPNcrn4Lel9Fh/X6CUr6J/qu9Lt3Nf
	DSUck5iqk2/THIi1yFPJPX6Jfw==
X-Google-Smtp-Source: AK7set/A9FqHxSnqzhC3hpME6V/vzWuY7o2BpQIjGMxyMR4uXXCeSmQQGuphYw5/Z1RGHpprlaNx2Q==
X-Received: by 2002:a17:907:1b1e:b0:7c4:fa17:7203 with SMTP id mp30-20020a1709071b1e00b007c4fa177203mr31355684ejc.63.1678437491488;
        Fri, 10 Mar 2023 00:38:11 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906319600b008ee5356801dsm661622ejy.187.2023.03.10.00.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:38:11 -0800 (PST)
Message-ID: <f908e9f1-2cee-8f9f-5da1-f231febf107b@linaro.org>
Date: Fri, 10 Mar 2023 09:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/21] dt-bindings: display: mediatek: dpi: add binding
 for MT8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-7-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-7-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003813_064580_4E956B80 
X-CRM114-Status: GOOD (  15.20  )
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

On 09/03/2023 15:22, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> DPI for MT8365 is compatible with MT8192 but requires an additional
> clock. Modify the documentation to requires this clock only on MT8365 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml    | 48 ++++++++++++++++++----
>  1 file changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 56511c4d4b9b..3f6cca81340c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -17,15 +17,20 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-dpi
> -      - mediatek,mt7623-dpi
> -      - mediatek,mt8173-dpi
> -      - mediatek,mt8183-dpi
> -      - mediatek,mt8186-dpi
> -      - mediatek,mt8188-dp-intf
> -      - mediatek,mt8192-dpi
> -      - mediatek,mt8195-dp-intf
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dpi
> +          - mediatek,mt7623-dpi
> +          - mediatek,mt8173-dpi
> +          - mediatek,mt8183-dpi
> +          - mediatek,mt8186-dpi
> +          - mediatek,mt8188-dp-intf
> +          - mediatek,mt8192-dpi
> +          - mediatek,mt8195-dp-intf
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-dpi
> +          - const: mediatek,mt8192-dpi
>  
>    reg:
>      maxItems: 1
> @@ -34,16 +39,20 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 3
>      items:
>        - description: Pixel Clock
>        - description: Engine Clock
>        - description: DPI PLL
> +      - description: DPI Clock
>  
>    clock-names:
> +    minItems: 3
>      items:
>        - const: pixel
>        - const: engine
>        - const: pll
> +      - const: dpi
>  
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -72,6 +81,27 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8365-dpi
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4

We usually set minItems, so it is clear readable that you raise the
lower bracket. Code should be equivalent, but I would say this is less
readable (maxItems: 4 was actually implied by top-level list).



Best regards,
Krzysztof


