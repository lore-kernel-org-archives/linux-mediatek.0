Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC25C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EK/pgDUArBGDlWlhMCFaCK72bY1hOVuO3X2s45L1HUw=; b=HNAMF3y26zgemDjobJZiXwfrL/
	zybulvc9b0+U2PHY97JLuekEmRkyZKwfn1fojtziB3Q0D/h5w9CH1xeFA+Ykyv8DE4Sh76BWvQ/2i
	b36Oq/TF7WDEWGk5MyjcQVH1SpoWlX8j8ymB6RaQS3OdqqU1ll7hf3XPKMK0wFBLRoR1MCsTmkbTC
	Tlqfv2wNSw0aYmsIT0xtctfJZOhXDkeOIvYjN48kUWSPNuX0cZ4Bcbm7zZQrDsk3w2ZCO3nQeZaSe
	AUVKvQGvfQJFGs7xwn6sO6DKm0yIol9QRZtjg31UWDV6NbLUSuSl9+FxPHOVGCi4NFE6P86mt8/FC
	AXDG5sMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV7r-001x15-Gn; Fri, 24 Feb 2023 10:16:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV7R-001wog-Fx
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:16:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so3918686wms.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EK/pgDUArBGDlWlhMCFaCK72bY1hOVuO3X2s45L1HUw=;
        b=XS8QLB4b2RJCaLW8agzMJqOk0+FJG90O6WobXXNccvnc5zyr7zB25DOu5qZRchPc0M
         ZZbmYY/+2XdvjHgZXPnF7Arl0/IOqd7U150pjvCJcyDBueSWS/FWN4YZrFdQvFGqjSxT
         s4+DWXzmXf9/muGQ9ZjWcD9UsxzXvAILT1/8ObNutwF9QRRVzBYVMJBOFqSvPD8qQ6aN
         n2jrTiAlK2/pO1aUqYLDjnwtECVm8nfcsl3Rnc9rbOBYoIqCWgj7RRBtu3ENHGNYO3GA
         la/L/wWYi/kimn0tiNeSAB5PlAnZwLde+xEfP6mkWLQxnfEm5Cy3MHpUPb8+B4Wttdp/
         vxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EK/pgDUArBGDlWlhMCFaCK72bY1hOVuO3X2s45L1HUw=;
        b=1mPdbtjdkow8wp+QXRF5AwzvvqlnwPEPfGZYmwnyTtWKkx6bptKYG8O/NZnwDwtdXd
         ATWXQkSE8rhQ3pmD5xBdmtAiWPpIeYcgmrzngIvyq69vhS1Cz7aR01lYcVamTjw66RIo
         T8XJFUX2TzB9Txwn8k/T4LLsMeIh+LZXqeJWJ6SL7ItxXvBwqH7KEyNGzc2thDxUzxFy
         NaYecKSu7rLbtpAAxRPp78d7p8qkG4mXYaGglJUGjbwIj3jLGVnYjU8tVyzTnviHjCwD
         Ay78KBTAPUapgOaGCtAHvQLAByyqMa6Mqxrjbsy+MfNpKtg1zSe49uQdGRt9FjR8C+lC
         osiA==
X-Gm-Message-State: AO0yUKWIVvgIVnFdHK/lCQG2lDNOIklx+GDOjZStM+X8u+GIHPHhEvvZ
	zEYC4tjfpfjKi0tjMv1qCAym9g==
X-Google-Smtp-Source: AK7set//sOeJ6yfMcZNqW9A5CgabKnheWeFJx+hUkJlWbpQd1DFPL8N1VUfsNnQ6RDhMmSaYyDmGuA==
X-Received: by 2002:a05:600c:13d4:b0:3eb:29fe:70df with SMTP id e20-20020a05600c13d400b003eb29fe70dfmr347817wmg.35.1677233759199;
        Fri, 24 Feb 2023 02:15:59 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c16-20020a05600c0ad000b003e214803343sm2220728wmr.46.2023.02.24.02.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:15:58 -0800 (PST)
Message-ID: <f754b5a3-3268-9e97-858c-8aa9e5b8c55c@linaro.org>
Date: Fri, 24 Feb 2023 11:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/11] dt-bindings: gpu: mali-bifrost: Add
 power-domain-names to base schema
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
 <20230223133440.80941-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223133440.80941-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_021601_612652_E7D674E7 
X-CRM114-Status: GOOD (  14.48  )
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
> From: Chen-Yu Tsai <wenst@chromium.org>
> 
> In commit a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek
> MT8183"), "power-domain-names" was added to the mt8183-mali sub-schema,
> but was not added to the base mali-bifrost schema. Because validation
> happens for the base schema and any sub-schemas separately, this causes
> errors to be emitted when validating the MT8183 device trees.
> 
> Add power-domain-names to the base schema to silence the error.
> 
> Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 78964c140b46..02699d389be1 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -65,6 +65,8 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  power-domain-names: true

Symmetric to power-domains, so min/maxItems.


Best regards,
Krzysztof


