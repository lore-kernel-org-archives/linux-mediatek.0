Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA772C761A6
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQSQpbyEP141etG6ZHWQCiEBFDe9rB+aPA05dS71AiE=; b=XIQMUI7cGBNLhSz/F5EapFPl+n
	Y26j2IZWzCjieAeoaOoTzlJqhngQQ85KXL6lr0W+O63f1o1KmNV+b5Xj7TCyEn9X7oUWjqXsgrwS1
	Sr3MBAvQtoG57eachr26N68nDDe6x/coNYTgsQb7nxw09BbZr+c1eDdYXM0EO7gS2y40JtLTqv1iY
	0U2BExyBOBNK3cnDS4dKUmDxWk4jNGLJlJwxymkAcgejmThBGyz7qcKMbY9IqCP1lpwv4C1Lkt5xi
	YwTfyK0xkv/J92uD0m/DBazmf46Eu7pn/8trz1dgKjBNegCFcxuDH4Z1AhE1eQTV8elDqBfZfhME5
	T8kBqImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piFy3-007mDK-1W;
	Fri, 31 Mar 2023 14:43:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piFxy-007m9g-0M;
	Fri, 31 Mar 2023 14:42:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id e18so22664721wra.9;
        Fri, 31 Mar 2023 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680273772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQSQpbyEP141etG6ZHWQCiEBFDe9rB+aPA05dS71AiE=;
        b=cbBpJS1pp2VUe5eBBEWBtRWugdEsiSuZ1H1qoGepOP42kpx6N3zGIJHgbeL6Rec+eI
         s9pTLH9Ici9vksjbXT60EgfezzKaGrWspX+Dwq7+kCxYhp3cr+0WAKQZOR6aXbp7Bhz2
         08ENky6Z4m6kPYkUsD61RTA6JvPhuEtDkt1yL3ZCFfUisFGgUR594C8S5kD5AFRw7hfT
         7x1Z9wEqfBsYqHaanJwr0EHsSriJn+pKviGmh5lnyop2MFqokHOfWEj3l4IQywKa9j5t
         9JfJmH82bFFTyv+KK62K/QYrbTnfi2lLh8aW6VWZyeB7GwMprJ/xQfzyJF6KHzBDYoR6
         db2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680273772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQSQpbyEP141etG6ZHWQCiEBFDe9rB+aPA05dS71AiE=;
        b=4q5u64SPAyIVOlc1wBq+k7ACqL2LuYRxnrv/zpopvOwtlmBu5ORgho+tmEMKe01UQ+
         PSXUMhfbFq1sSgSGqTeIDdJQ2lNl0EbjkqYtQ4mVvx/1RN9LsGA4o1zQWEsckNDvEu23
         +1zRhnI85ltRArqpv8RUS9oYS3gIThB9S86MswlXU5OKhzqU36D6fGie6Jpe/U8N3Ifq
         78Lf/DEhGxzlQ4J+7YBim51uApKQjPILNGqw4WzMI0OuBdcTuLNz0zwDoEeam8NJDvPP
         eKoixo5EQArB8BPx6cgxgWJLBR9bovbDbH/e7XhKF8G2SZ1iLLd3QHDui9FK+zKa8fa0
         O+OQ==
X-Gm-Message-State: AAQBX9eDU4mxFvtPM6BLjijFr4jGLHPydBwQNdvZaIvtXi+VJR1OjZML
	v6lO73mXo+j1DxzeTpeUy14=
X-Google-Smtp-Source: AKy350ajzHQlwsDqL16oAUF2LtmLOv7wD/G4o4yloSXgjLI/FwWSy/wydMjxZrGLOzpCruc324uE2w==
X-Received: by 2002:a5d:6585:0:b0:2c8:c667:1bb4 with SMTP id q5-20020a5d6585000000b002c8c6671bb4mr19680706wru.48.1680273772501;
        Fri, 31 Mar 2023 07:42:52 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g4-20020adffc84000000b002d8566128e5sm2374858wrr.25.2023.03.31.07.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:42:51 -0700 (PDT)
Message-ID: <d3d6392f-98ae-f6da-914c-943962d94a74@gmail.com>
Date: Fri, 31 Mar 2023 16:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 14/21] dt-bindings: soc: mediatek: specify which
 compatible requires clocks property
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-14-45cbc68e188b@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230220-display-v1-14-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_074258_146301_887E918A 
X-CRM114-Status: GOOD (  16.82  )
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



On 09/03/2023 15:23, Alexandre Mergnat wrote:
> According to the mtk-mutex.c driver and the SoC DTS, the clock isn't
> required to work properly for some of MTK SoC. Improve the clock
> requirement by adding a condition which is function to the compatible.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied, thanks.

Now I think we can get rid of the no_clk variable in struct mtk_mutex_data, as 
this should be mandated by the device-tree.

Regards,
Matthias

> ---
>   .../bindings/soc/mediatek/mediatek,mutex.yaml        | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 9241e5fc7cff..ca0ca549257d 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -69,12 +69,30 @@ properties:
>         4 arguments defined in this property. Each GCE subsys id is mapping to
>         a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
>   
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt2701-disp-mutex
> +              - mediatek,mt2712-disp-mutex
> +              - mediatek,mt6795-disp-mutex
> +              - mediatek,mt8173-disp-mutex
> +              - mediatek,mt8186-disp-mutex
> +              - mediatek,mt8186-mdp3-mutex
> +              - mediatek,mt8192-disp-mutex
> +              - mediatek,mt8195-disp-mutex
> +    then:
> +      required:
> +        - clocks
> +
> +
>   required:
>     - compatible
>     - reg
>     - interrupts
>     - power-domains
> -  - clocks
>   
>   additionalProperties: false
>   
> 

