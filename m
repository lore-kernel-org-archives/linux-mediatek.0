Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C796CCA483
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TA5hj5LY9TtMU86mVjQzKjchWlgrykmSYMSLGFhDRLI=; b=lLhXzN7yFaEkJT77F10B/eoOXp
	dB0rdYX5PyEd8nNRgTZumjPraX7Q8PWe8n8KbHa7nsnM8+Yphn+uqQZQVbfdSJblUo+ihO4gK3Zal
	7vUuMPx6EjH2NjIgOXh38dzO3GJkTKoB6iYs4ap6nEYSp1zXYOXSL6fE0noYvVcbEHKSXfutF+7ku
	dNc3/41U34DLeLIpCn/eCzovUiEZ9i2BP0NSAr/gnQelF/WITTUxTI7XTmZptLeV0ysxd/sF26zMO
	5eYT9qUzrCXgig3GPXUZYkMLbyDB6gJDq5SHyCBdPvGeOHk+MdH73a3wzGhRjOQYeGq0sN9ang16F
	D9SWl6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFqE-004vbl-GI; Fri, 15 Jul 2022 07:34:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFq2-004vXw-NF
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 07:34:16 +0000
Received: by mail-lf1-x12a.google.com with SMTP id t1so6504143lft.8
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 00:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TA5hj5LY9TtMU86mVjQzKjchWlgrykmSYMSLGFhDRLI=;
        b=GMLdwZdscB3EVWWQJArsx6d/B5HTsSL0X+YyJqJvwd/YISkCGh8eTxRsF7sx+/6Rqk
         vccRH5iciobLCat0H8mQHRB4/daOK9clx7e7zY+qk5o//z50AoX8XNJdR3v40LhXPwZd
         0nnIi2GxiO3DASoJAvpdixcNDWSaZ8qukpbjRfkmWzmxkX2KIpPCBN7muIZQN4hSRflz
         ZhrZMHeMZYj/U0hc0Q994nc0G9v3jsI2W0C2fukcZwIwP4l8K1WBdWVl/VyIGhQTztp9
         iEtO8BP3lyKyDxCSLzdMDOitfwtTyp6jo01eZddW9nEsF1S/Uc4SCeWQrIKcEB34Aq7u
         vB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TA5hj5LY9TtMU86mVjQzKjchWlgrykmSYMSLGFhDRLI=;
        b=f++xrwvn2vV4zVsdZ4/zwpGAGdh68JiHuDasKtw4XOhQX7t7OhfPTr6m4646qOvuRu
         XW3FmKB8Iq+y52W590/UQPIThDbMB9EDLLmKRJBIfUU9gLzoNTG8sntgOI4F6XCXpJxc
         I33DPe7P8xwGmH6+wEM24qRiioGrkC81Zf+1M+MVYY3xujAu+m8n4JVUqjRqgbAMGXhj
         7PlcN0VV0qMsbYNhR2arEqj+wa1MIz+2vqIavd1WQIrL+u56zceEoL8bk+3u947D4Iba
         9oVGrOaNRdNGDguIiDWLUutqR+peqTa6G7I9DDbcAlPM9ldtMN/IAwbnDSnjxh6lGN2X
         uQ0Q==
X-Gm-Message-State: AJIora/TMRaxZ5D/AtAmvvETc9qaq8fiC2XrM/oW2XS2k6riZTXD6GPe
	8pKKOIQZ4K5byyQEhg72ujtKyw==
X-Google-Smtp-Source: AGRyM1tH5bnYQivH0Q5JPcptYdImDfGxTQXL34OhB5o30DvQgYbjSK4eEJREJEcjGz6RCB/F8X5kLg==
X-Received: by 2002:a05:6512:478:b0:47f:86f2:811f with SMTP id x24-20020a056512047800b0047f86f2811fmr6974156lfd.305.1657870450856;
        Fri, 15 Jul 2022 00:34:10 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id u5-20020a196a05000000b00473c87152bcsm769756lfu.127.2022.07.15.00.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 00:34:10 -0700 (PDT)
Message-ID: <18cb5b0a-b096-6056-10c8-9df76db820f0@linaro.org>
Date: Fri, 15 Jul 2022 09:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/19] dt-bindings: iommu: mediatek: Increase max
 interrupt number
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220714122837.20094-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_003414_792154_1A39069B 
X-CRM114-Status: GOOD (  13.52  )
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

On 14/07/2022 14:28, Tinghan Shen wrote:
> mt8195 infra iommu uses 5 interrupts.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/iommu/mediatek,iommu.yaml    | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index fee0241b5098..53e712cd0d21 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -91,7 +91,8 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
>  
>    clocks:
>      items:
> @@ -191,9 +192,18 @@ allOf:
>                const: mediatek,mt8195-iommu-infra
>  
>      then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>        required:
>          - mediatek,larbs
>  
> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 5

You need to list/describe the items.

Best regards,
Krzysztof

