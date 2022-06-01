Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F145C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7wf0O0BQvkHch7GMoWGw0shjvfnfiuuUmDyB0qKExM=; b=pG5kgJIE2fluzf
	HbbEue5MOBs1FNrznddXieeccu250x9QjSf9zO3iiOiX1YJWhOxKnXATr38BivmDyYLmbjDcJHuX8
	Wu12oUM592Rld1NbGvTKy5lHQ73OwlLZJHMlY1p21jEicBPsmawGONedJH9O19GQrg3CmluTM1hVg
	DSPbaeNJG6C/nduDPR6Z5UOvglucNg6n5XHhDtEoJQ6B67MOMMeTrcgyieMVCu9ZpyMXRu+jmi1j0
	TznmD1q5TvBgRJdCVyldlLVbL5Y98VfB5HzZRnlenlE+kq7ZzOz0EhsKmfYP72L/8kGilYU8hP8JU
	1ogMtToGh/UmCifDBnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKkM-00EwZD-Jd; Wed, 01 Jun 2022 09:34:34 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKkB-00EwUZ-3p
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:34:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id t5so1369454edc.2
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=roNxqKUu0+AV4DeO1JbEmmYOyNX8wIcqoT9AzN3Cm2M=;
        b=bRYOQ9fGbJR0V+y0wEZKLfg/TqqyZIxzKGA17cV2dYd4XNtRdHyH4/yeq/LxJn/NsU
         j6OqB6oDPLhE4+MsUHuxGDg87PixqxiwzQaEWzu7LQlfhqmrcWF4UkzqEBolU2arg+t6
         ZEwzrsNkZLoDZczkN8gxN3A8zioU+OYUAKXz6M2fKE+P44DYTD4hjyLrpXG1BBn8GjtJ
         Zwt1N2HkZX6pvO+XccPH+zn+GyEdE+57hkLjfHZB8pbh1tqGeuiAAR6NSEznBiagvjAc
         M1xkmzTZ28Y8eJe5MQO0kbBJUDQjPWxbeeOzk7JlypHCfAslHnHPBBQFMRZo+sI+F7y6
         ilhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=roNxqKUu0+AV4DeO1JbEmmYOyNX8wIcqoT9AzN3Cm2M=;
        b=bZP2q9MuKT7FlJZK2G7c/u1P/rpJ40rGVQ6KytYsRfRH2W/ujMlDKMRM9l2fNgQzy4
         4gfMCysn9EN9Mf1EQxuV6z+X5mcDHOcCz+VxGwxjwrv/9PbxUf7JzZvRbjC/d14cY41Q
         FKstCtHTXweGAdIciZ0Jz4hX5Du6D+3H6UxJkqP/Cjir6woexxTXLC7teL5TpTuSFk6M
         YHUG0Tm2JXMZaTwO0juP3Rm4gg1D6d5c6BO0xF9ZdTskTC6kzZmasWCt2jKDJGIe/VWs
         okbqEAI4G+ieYhRxwIprUA0vsVxQCvWyI9H0u0m2eiBq2Kho6ex+LGUeDgrwUBnUAG6t
         WPzw==
X-Gm-Message-State: AOAM531jNYm11GoKaR5XN4MIpm6g7V4hhN2FZCThCKqz1CKaCbZ23Itn
	WExYOwAQHELrL0vly9OlfT04GQ==
X-Google-Smtp-Source: ABdhPJzh9Lf8L/NKchmFQc388SPcHvGUJvGg8NbDDJ7Sxuy5dahguWAyQXRYAWLbvqWHCJKhyvlBgQ==
X-Received: by 2002:a05:6402:42c1:b0:42d:fba6:d5c5 with SMTP id i1-20020a05640242c100b0042dfba6d5c5mr1180660edc.295.1654076059375;
        Wed, 01 Jun 2022 02:34:19 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b8-20020aa7c6c8000000b0042617ba637bsm710427eds.5.2022.06.01.02.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 02:34:18 -0700 (PDT)
Message-ID: <c510cf8e-4111-8886-99e0-8ad35b3086a8@linaro.org>
Date: Wed, 1 Jun 2022 11:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 02/17] dt-bindings: memory: add mt8365 SoC binding
 documentation
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, jic23@kernel.org, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
 chunfeng.yun@mediatek.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, Yong Wu <yong.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-3-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-3-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_023423_207973_EEB581FA 
X-CRM114-Status: GOOD (  14.14  )
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

On 31/05/2022 15:50, Fabien Parent wrote:
> Add MediaTek SMI bindings for MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml    | 6 ++++++
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml      | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index a98b359bf909..e1029ac99ab4 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -46,6 +46,11 @@ properties:
>            - const: mediatek,mt7623-smi-common
>            - const: mediatek,mt2701-smi-common
>  
> +      - description: for mt8365

Skip description and:

> +        items:
> +          - const: mediatek,mt8365-smi-common

This should be rather enum. I see existing code did that way, but this
way makes it bloated. If new device compatible with mt8186 comes, should
be added to this enum, not to new items.

> +          - const: mediatek,mt8186-smi-common
> +
>    reg:
>      maxItems: 1
>  
> @@ -130,6 +135,7 @@ allOf:
>              - mediatek,mt8192-smi-common
>              - mediatek,mt8195-smi-common-vdo
>              - mediatek,mt8195-smi-common-vpp
> +            - mediatek,mt8365-smi-common
>  
>      then:
>        properties:
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index c886681f62a7..815d87fc64a0 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -32,6 +32,11 @@ properties:
>            - const: mediatek,mt7623-smi-larb
>            - const: mediatek,mt2701-smi-larb
>  
> +      - description: for mt8365
> +        items:
> +          - const: mediatek,mt8365-smi-larb
> +          - const: mediatek,mt8186-smi-larb

Ditto.

> +
>    reg:
>      maxItems: 1
>  
> @@ -78,6 +83,7 @@ allOf:
>              - mediatek,mt8183-smi-larb
>              - mediatek,mt8186-smi-larb
>              - mediatek,mt8195-smi-larb
> +            - mediatek,mt8365-smi-larb
>  
>      then:
>        properties:


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
