Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6597CC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZDD8upL/r+70rB2Afo4JoGPTnaEzVx0dEl4DiVOMWg=; b=jl/GBuVVu1A09FYoGEsDGE74WM
	eIXhcij5ZMNXDVyjN4d7y1kePQ5JohHxjrNuOUm3VI1XxHfHobaiqZt1uuDKw2+DKvQPA19rqvk2P
	ecTuCIZrIUnAWOzZQWBHNcYX4dpaNSvZhQmQAWFYEu52XF43Fme85QBTztNO1EoRa13qAgu5j6eVt
	8jI30qLJzYcFsEPEXnh0RfQ8CkCzA0TUrpzLdqVAJwFfGsWkLDZRyv77uwMHWfI9OgMddieyCTtj9
	kU0R3zy2Xs67IukPuqYIMMTLg+UJ13zdM7bvt8tefj+Hu8ep/L+74a2FcEJZaJ0zTLsSwudcuLLEG
	y4MChLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzINB-00AAQd-1r;
	Wed, 17 May 2023 14:43:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIN7-00AAOn-2B
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 14:43:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-510c734fa2dso163696a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684334598; x=1686926598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZDD8upL/r+70rB2Afo4JoGPTnaEzVx0dEl4DiVOMWg=;
        b=iNuaz3gEZr/wsvXC1ba0asKS7gklttvKStIfxh8Qs0kkWE3Xjo04RWBvjg6nqKnxum
         6EJGM+jO4EYfehiDb2qqtu28a44G8ZeBvpm4tUWfcRSn3jz0LBbMbDfHfVT5H8fCEdgF
         0D1HaKoNJH++dItJPrhVhXCFjDpK0KmoqYMseXiRJb87xTuvAkJJDLN79nts5Lv+0lmd
         zCKooCbbXsLWVUal+iKWTLGxM170+hF6tYOTeDDSKR1M9Tz9IyYTHXkFaBuRp/3fSVfR
         ex/6uvzXapEoaRnwSrtqW2tiL/rK04iFNHTDR5zQ7F+XkdawN39mbfDrYDG1IG29PtSy
         jMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684334598; x=1686926598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZDD8upL/r+70rB2Afo4JoGPTnaEzVx0dEl4DiVOMWg=;
        b=PtM78IIRqOig2rvXyJNPtSgsk9uhbR224V3wu++eL2JCLwW/XG49+a2+jNV4153HJi
         3VFvmm6MK2AAPGiKaRsp5jZTV4tvU2ECszMz0ZGBI5J9c/I5p302Qe/5MUEhs0M0fZUd
         DCBTQfnjbciAe0mvgy77PF2wcTNogne+Nxi3WwPSQJqoNykOCAPF7kB30Y4Qoij2Fp+i
         HvJsyhY8zkzRGJY8UxExMSrhyvMgh7YUlxnKhsO0Pj1QjZYw2IGMvBWC8FR+7FAjjcaF
         R1iF1LrzMJC+CC0UoixxIvdVE//CJYAkZivNAhC67sX2aUYo0FnWkGQ3WjpW4z5kXxmx
         W/Hw==
X-Gm-Message-State: AC+VfDx8MvPXq6I2zAO67RJdUy9oQCXq5DrqKH7hcTF7/+/ZU9h3pUJ+
	PQPftHkWyoQjJGwFQGIDCzxmSg==
X-Google-Smtp-Source: ACHHUZ4pYGjUVHIDzMVTFst1m4oKVnYh+z4Oa96EfEfP7Ed4lZHoKUEAgAScE6sd3/3n9e6WGRNDjg==
X-Received: by 2002:a05:6402:1e90:b0:506:72f8:eb10 with SMTP id f16-20020a0564021e9000b0050672f8eb10mr2673049edf.0.1684334597785;
        Wed, 17 May 2023 07:43:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id x14-20020aa7d38e000000b0050c0d651fb1sm9423734edq.75.2023.05.17.07.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 07:43:17 -0700 (PDT)
Message-ID: <9359c081-cd36-3e5b-a113-7600b4ba435e@linaro.org>
Date: Wed, 17 May 2023 16:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: update
 properties
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-6-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517111534.32630-6-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_074321_722989_1D05CFE5 
X-CRM114-Status: GOOD (  20.51  )
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

On 17/05/2023 13:15, Trevor Wu wrote:
> Add compatible string "mediatek,mt8188-nau8825" to support new board
> with nau8825 codec.

Subject: everything can be update of properties. Rephrase to focus on
actual change, e.g. on adding NAU8825.

> 
> ADDA_BE is used to connect to mt6359. For the machine, it must be
> fixed to the same codec and configured on the machine driver. Remove
> ADDA_BE from items of link-name.

I don't understand the justification for this. If this is not a correct
link name for MT6359 setup, then it should be removed in its own patch.
If this is removed because of adding NAU8825, then why does it affect
MT6359?

> 
> Introduce two properties "dai-format" and "mediatek,clk-provider" under
> dai-link subnode to configure dai-link parameters via dts.
> 
> "codec" property is removed from required property of dai-link subnode.
> For co-clock case, it's possible two dai-links should be configured to
> the same format, but only one dai-link builds link with codec.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mediatek,mt8188-mt6359.yaml         | 27 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> index 6640272b3f4f..05e532b5d50a 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8188-mt6359-evb
> +    enum:
> +      - mediatek,mt8188-mt6359-evb
> +      - mediatek,mt8188-nau8825
>  
>    model:
>      $ref: /schemas/types.yaml#/definitions/string
> @@ -42,7 +44,6 @@ patternProperties:
>            we are going to update parameters in this node.
>          items:
>            enum:
> -            - ADDA_BE


Best regards,
Krzysztof


