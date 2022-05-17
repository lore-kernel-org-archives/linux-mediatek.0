Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WY43q6WSo0ecN2k8jBt8tT6QcCtKYEqnGDvlBUu880c=; b=2gtrS7ALRDra5X
	yENWeQR3w1cuLGn+YbT6xyZbVyAazILsMnDihQt3CwIv8CAsmu7TXoTlVOEx2LXFqy+cZIMJu2gOI
	PvK508o7Eh+GkzIgh1pJD6v+xD/a5YaKHJom6I4Yx2XR8Cc9f7VpE7ceY8wlwS2NlFYDybXgq/Xrr
	R32uY/hHlrIMyQrhXxg9GafEvCTqn8LEafw9EQSZYMiQLotMnRT+et4MShzQA39unyoY98D3MePkj
	o7zmSy0lvVFy6hwiGlnftpzbP4ZU5rJFHz6kjmLPD4GUhlJkK3b/HK1kwVNGletqGJc7qHkXzuHEh
	BM517o+hwCaWdM1Px+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqy8k-00EMFX-Mq; Tue, 17 May 2022 14:25:34 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqy6u-00EKoF-NK
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:23:42 +0000
Received: by mail-lf1-x130.google.com with SMTP id f4so18818390lfu.12
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Lnn8RnWZse55RuB4yg/vu5G7bPymERhSpz38ty/G94A=;
 b=FCgjt+lf9hFi7sB3SJOv43XgmvYxTBFuv1iaHRc4BG+bzmJCFyEIRbbuX7L4KvN6D1
 jZaNpeKuLQIZh/dpKpDJaxcH4kaEHje4Ykc3lHWSRziSPuY8QwGCJud7QM/OoPS6EpVb
 kc5CU3UASpZXUpsJvnh2zCBHk4tAyNZsOcI00zufriY6glGzShgkNNc5ozlAnT5M117f
 WHcVHF+SzeFZ82gNRuZVjqex1jnKBeiVOKRcuk0AxbEqYVEErcSv8AsbQ7LRcMzEw3Qa
 vHWff82Bt/+ba99MkJtVfDbo7fdUDKThMCLfT0oVRAUI1Uc/T7E01TJUepkNX+LO1B4q
 0h/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lnn8RnWZse55RuB4yg/vu5G7bPymERhSpz38ty/G94A=;
 b=J+oHTVFFF3WQPXMTl4/QZPeG+kyPDly6UACuMuKP0CSqXiHrddHpDdTB+odng4CuV0
 xMPUK4C+5ZWanEGUfhAEMm7E+wJ+ivAyk/WHNd0tfpeigvjUfenDmMEvLnuRiiMn2zzI
 E3X2RaWrPWcdPMNn3p2odBrg/kWNled3GHnnO9Xh5GKZwSxLnZMihzGd4m2E+F1nEoVX
 Ncvhl7SZuud8oxFb9XX85RSJ6Anj0SePv0u0r6sMAYcPSqRC+8kufTGNm9sOUEkUEJMp
 7f1W/xVxFzngaNrK/3OIgUhLXRdxo6xSx0nEVJTPNEwutVS+0QgL5wBR+7OiyrMzJvS/
 iWSw==
X-Gm-Message-State: AOAM532xzTW44Z+dDdGui8CLiMXIv9cvegboGvoBZ5yhCmxI+sO5xvGn
 gKWF4D5641fpn2oaJZt9xvTG8Q==
X-Google-Smtp-Source: ABdhPJzdrATa4hivK3skT4LaVtlu+jnncbJ7AOzRa56KLicCMPpXG+kCMdTvT8ScBNWmHguDQbZUVw==
X-Received: by 2002:a05:6512:3c9b:b0:472:60d0:ebb0 with SMTP id
 h27-20020a0565123c9b00b0047260d0ebb0mr17556169lfv.682.1652797417174; 
 Tue, 17 May 2022 07:23:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 q23-20020a2e8757000000b0024f3d1daed4sm1892435ljj.92.2022.05.17.07.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:23:36 -0700 (PDT)
Message-ID: <669d68ce-959b-5486-8b1e-316aafa7b52a@linaro.org>
Date: Tue, 17 May 2022 16:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/8] dt-bindings: iommu: mediatek: Add mediatek,pericfg
 phandle
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
 <20220517132107.195932-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517132107.195932-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_072340_864291_CB12360A 
X-CRM114-Status: GOOD (  13.78  )
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

On 17/05/2022 15:21, AngeloGioacchino Del Regno wrote:
> Add property "mediatek,pericfg" to let the mtk_iommu driver retrieve
> a phandle to the pericfg syscon instead of performing a per-soc
> compatible lookup, as it was also done with infracfg.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index 78c72c22740b..a6cf9678271f 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -116,6 +116,10 @@ properties:
>        Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
>        according to the local arbiter index, like larb0, larb1, larb2...
>  
> +  mediatek,pericfg:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

No need for quotes.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
