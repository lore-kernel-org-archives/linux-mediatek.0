Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB05C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygFXuh/XT7kReqZaDd5fpLgDWX3W0sTsYYW23Ba0Cco=; b=eWYS/DG5xigzApnFZ3SHOGKZMA
	xv/0ytoy5rus1SH2s4DLKLQf3MwnW370vWldihv7K/BrJ68v4tXnqB5PkfTx5SN9US1xz6eec7RkY
	6upsXF/ZGdXEdRdBhPVAZIl6vENCZCqDm+VMLBZWQHVGUldsK1uSK9tqAOTN0l0TuJpQ1pxg+W0JH
	5pXL2axSzYPqths7rY6tpyEIQwPj+MRldvzhqb4pSytLP/7wz1ufiUqFfauo3s9DTK+Z3PpNLI/lX
	knVEXOpG9XOnkJSlgP1f8a/two7MgB6Mnuq/Xhz1Cqg3tKzNPhrVP0ySJY3PzH7tCbQwxUKb5sJks
	DfUx+HAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Q9-00EH4M-Ot; Fri, 16 Dec 2022 10:58:29 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Pw-00EGyV-Cr
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 10:58:18 +0000
Received: by mail-lj1-x231.google.com with SMTP id s25so1767751lji.2
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Dec 2022 02:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ygFXuh/XT7kReqZaDd5fpLgDWX3W0sTsYYW23Ba0Cco=;
        b=Q9/nnJTh5ZlCNrSi1xSAw8/IPnsDKRTheZD++k9Wj4N9M7ZGZeQauuT6+xvtw6k+DA
         hc8KW1GiTnMItg4pqjy2PjZUmtnytIlxyudgZAkT3770ZWVx8/fbi5DmY3kguXxw8lZ/
         lk24S0ixs+tzgFHDwKE6WiiSK4jFUDw6XGFXkiXEzyhtdREou4zhYr2fCXWMNg0AsS9S
         BzySpLZfusUEu0uvB2gXebRGd8DenMoxzE0gyS11eGdDhM37ZswUn6d08i9P/wydy4Em
         qctoPpfi6FylQSUUSubiSndesj4tXEj1tVSHkIxJeWGxw3rGBcG/D7pXguuXitG5Md/t
         Tz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygFXuh/XT7kReqZaDd5fpLgDWX3W0sTsYYW23Ba0Cco=;
        b=wN7dkcV6BV3yhzi46Cyhdqu1ae8JMyytDS3WFW8znGxcQrW1kekTcI4jEUIue2BaFh
         pkKQO/jbOeuSSAOXsqC52WqKoqamVHBWFcWnVaLApDHlZphkH4XpD08E2cMvyCf0r6S8
         Nbor+O61dvjefVcb2XPuG1bfdJ45pG68PgwJFVohXUmPNaDVc3uax0VrRIfiQgZhvdA6
         Sxwkq8g16Ks5yVPtXFtcAZ/bThOqYMGx/upF4dkKwmXsaJ27Zxpr7cSrdw8KJ8hJKV2K
         kZ13v1DuvBqYuvnKo1yXdi9irq5MCtzA+CJWWoMiYg7wBYmgBvNvCJ6eAF19pmDRK4tr
         ciEQ==
X-Gm-Message-State: ANoB5pmt4AlHWM6BBcveBKrevIRMLhMmz4AYewymC13OjNJ2xmGUG0AM
	n7a0PT5k1fwD+Zw1NeGR090OVA==
X-Google-Smtp-Source: AA0mqf6cwxbcwO1KvynhxssOA5xVEOIxgjpbbo+ezdAW5K3rEPQME1P5bGFXc4B4HPpHq4q0GpuECg==
X-Received: by 2002:a2e:9184:0:b0:27a:129f:770e with SMTP id f4-20020a2e9184000000b0027a129f770emr7627543ljg.5.1671188293806;
        Fri, 16 Dec 2022 02:58:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b004b55cebdbd7sm187519lfe.120.2022.12.16.02.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 02:58:13 -0800 (PST)
Message-ID: <3bad1a29-6457-8958-64c2-a0002c7959a1@linaro.org>
Date: Fri, 16 Dec 2022 11:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: Add missing power-domains
 property
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
References: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
 <20221215120016.26611-4-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221215120016.26611-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_025816_498030_51FCF2E6 
X-CRM114-Status: GOOD (  15.04  )
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

On 15/12/2022 13:00, Allen-KH Cheng wrote:
> The "mediatek,mt8192-scp_adsp" binding requires a power domain to be
> specified.
> 
> Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8192-clock.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> index b57cc2e69efb..cbedef114103 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> @@ -40,6 +40,9 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  power-domains:
> +    maxItems: 1
> +
>    '#clock-cells':
>      const: 1
>  
> @@ -49,11 +52,25 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:

allOf goes just before additionalProperties.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8192-scp_adsp

For the future: please don't use underscores in compatibles.

> +    then:
> +      required:
> +        - power-domains
> +
>  examples:
>    - |
> +    #include <dt-bindings/power/mt8192-power.h>
> +
>      scp_adsp: clock-controller@10720000 {
>          compatible = "mediatek,mt8192-scp_adsp";
>          reg = <0x10720000 0x1000>;
> +        power-domains = <&spm MT8192_POWER_DOMAIN_ADSP>;
>          #clock-cells = <1>;
>      };
>  

Best regards,
Krzysztof


