Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1208FC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWQnxO1Qoh2BkDXLOlnoREhUBx6MERP/uawbk8zyhDE=; b=hE9A7iXcMAKktrUc+JBhCDLQri
	NyAGh0054GVkcSqB4uoPyCL/SmfGDMc312Do1l7pmxbdZrZOiKHMvv3oknu91j/QYhhdXdB2iKP7k
	FAo12cPVt8ThDOsduaaOZ98mYM0JmcSYUqysfqtSYZAN9tdpLxFz+UDHHmsvzWYrChMt9xwowSa+P
	DIdaCwh7yqrol0GmFR7rFQ6DFG+ALFvCsXIh41jSMbS2fL9vpmtl9D55AYCVwOuOoL+RYPmzCIl8z
	mVsVj/MQLlsIrCm2YZRTIcZKq/wDp/WrZRYYs3gQUCtuD/Kzu1PpEmBKcvadMkh7jjDxRqHzkLPK0
	YtNXNizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVmq-0028v0-3d; Fri, 24 Feb 2023 10:58:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVmZ-0028mp-Vu
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:58:33 +0000
Received: by mail-wr1-x433.google.com with SMTP id bv17so655604wrb.5
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BWQnxO1Qoh2BkDXLOlnoREhUBx6MERP/uawbk8zyhDE=;
        b=oIYBcBS1IroSN+gIwdmpGD92lGKnxaCpEVal9alvoswXTnjWR+wsNj8HIy1pvZhg83
         0BJVTC6M2grX3w9wNFNgKBv4oBo6cvjCBTzXNPwkh5SftRZUGQ7xc1uirr3KRFx5yd2+
         lHU5VTv+zCcnIXOjplrdeeHBGPa3FnJmhgHarkMjegfRxiCTY6BLccitUp8E96XcPSE3
         xE9JeN0xJwtQwYceNzORWOWBcjozomasU5yL//L144AJJIRcBvgLegxYUeDcCwTCqBJe
         hqWhqWI3kBLSKqwBIXoYgguws0lSf+P8+83nczcaHN/UEIJd1JA8k66x1FN8yF4hhmiB
         bYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWQnxO1Qoh2BkDXLOlnoREhUBx6MERP/uawbk8zyhDE=;
        b=HuWsWMAtnf2NMTVl3yNHPosEyHiUh4j+2jZi5zBKD6JTi0TQs4kRCUwmbQELmPm6Cw
         vSggjYu4IyMddxOiwmrk8AQe3Zg2tgHDdRAeTRY6mphCyQ2zcpBK27WB7ip8mM7Li0a1
         kQ6MDM+QsPBt/qmo+58rN++2EmDS2MYc8DRJq/Cn3rGmrPVSSipYYiHIsufeo/AMoOxj
         jqIc5ZU3JFSL8zH3ouKFpO26S//dpFZJXAr0dcOD9jKSpFuDR4qa14VMzaUJz87pH2h7
         pwhNg2KeQyUy9MRoGOfzeLNDWa1Vtnf7Bc+OfyBMSQK5JdkQmZpHmqe46PqerrBET6+3
         WWJA==
X-Gm-Message-State: AO0yUKXLCsBg/lgH27B+1TCvHKdRVtos3L4BRNWj+XorvJ1SZ9opmT/N
	SMK2vTAzXV0rubQqHU+sBgOSAg==
X-Google-Smtp-Source: AK7set+20sAValcTBU0xLyseyncEcxYkyBhTV7YB9xSSXQvtIniIzhiGHg6epY5B4L3Xsq5lj7UD+w==
X-Received: by 2002:a5d:56c9:0:b0:2c3:e07d:46cc with SMTP id m9-20020a5d56c9000000b002c3e07d46ccmr14386158wrw.41.1677236309745;
        Fri, 24 Feb 2023 02:58:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o24-20020a5d58d8000000b002c7066a6f77sm9714423wrf.31.2023.02.24.02.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:58:29 -0800 (PST)
Message-ID: <08fca891-d5df-0337-0615-e49e53fd2940@linaro.org>
Date: Fri, 24 Feb 2023 11:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 05/11] dt-bindings: gpu: mali-bifrost: Add new MT8183
 compatible
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
Cc: daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 matthias.bgg@gmail.com, robh@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-6-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223133440.80941-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_025832_047108_D747E461 
X-CRM114-Status: GOOD (  11.71  )
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

On 23/02/2023 14:34, AngeloGioacchino Del Regno wrote:
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 4d9ab4702582..be18b161959b 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -19,6 +19,7 @@ properties:
>            - enum:
>                - amlogic,meson-g12a-mali
>                - mediatek,mt8183-mali
> +              - mediatek,mt8183b-mali
>                - realtek,rtd1619-mali
>                - renesas,r9a07g044-mali
>                - renesas,r9a07g054-mali
> @@ -157,6 +158,7 @@ allOf:
>              contains:
>                enum:
>                  - mediatek,mt8183-mali
> +                - mediatek,mt8183b-mali
>                  - mediatek,mt8192-mali
>      then:
>        properties:
> @@ -185,6 +187,23 @@ allOf:
>      else:
>        properties:
>          sram-supply: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183b-mali
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 3

also: maxItems

Best regards,
Krzysztof


