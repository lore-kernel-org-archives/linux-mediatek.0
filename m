Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC341C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MCRc6Em9AZ2JNAk2m0q4W1tjHuqQkALm4CiVjqKzIc=; b=zoClEzT/UVEVwE
	F1fzstVLym2yITym+KwfptHJ0C8B6fY1nBrWua+N+Cp8svnKU2Dyifc9L7LbVZiD3ibe7gvObmply
	mOsgnfZoRAIpBhSQelx+b2u/4ufgmirhVQ/q2Hb+u6cgZKv4hsheEm3Dg/hBb2DhR8ZnzWgBQvEsQ
	/btRba0UrcG7aYM4U4yeR+n3vHhJ6EK6bXdXc8Aher/jGtPcZ047epmuWCp4/Fvn/L+Xgo2XfHXlk
	uOaJ48OodZI3jHQGZkEypjeZtjtxziu1PYX5bSfaeUMyvXfnMVVZDut3L7lLgefYxiMNq8rPKwwtT
	UryaRogPYSkSWs425MKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhtdR-000fsn-G0; Fri, 22 Apr 2022 13:47:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhtdE-000fo7-Cw; Fri, 22 Apr 2022 13:47:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so7998512wma.3; 
 Fri, 22 Apr 2022 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dZT9d6RauuQU8OC2AaH9n9Wn7bUZdwOkzeuUvog/EI8=;
 b=UV4FW6Z65JSNumepoTaoZtdissD/RhjoJ+RaHPgfiVTeLGVLHqVLYdAH43GktRU6FW
 smal8DQwhuR9q49uB9H6em4MqfW/Eh1pzNabqgH25bIQ/79JHnjmUiT6D/CRbkNQ5uBK
 cZ/+hGWSiE8qc7DZuh3MdFQv6uG91CnVuFQ09sOyutRRCRbgdmjtuzi3n0gPcyN5JUxL
 g6FnBsGjWACLuL4v+UA5QXdigusKBG3vMQftg67DzMoOm61ImqbGZqurHkvDH+Ndus46
 LAfG+lq/Pip6cK3AsHGAJTz2E60SdSv8uFGX43GMB/XhkxW2K14mBZVI0SdZafprIAPA
 5SJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dZT9d6RauuQU8OC2AaH9n9Wn7bUZdwOkzeuUvog/EI8=;
 b=lRKFpYQYoKQOibKAzRwu0oDhMdBgdmnxoFCVKXQC7b/JAu+PwUxYxGnZdP8wRTz1Rv
 Tq1hE+xR1lxy2VX6tUSIFWVq1aHG7gpoiTcU5ealuRp46xouj2TvuEW9ydqC1DrVEbUD
 OrdQ7EaQjwGTaxkkEHB5mX0R6E25qkhZ5/nt/GqiG0oFei5kCMp3vEYUo2VtcaJgLmOe
 BbfYPpIkyMO1A16Jk01vXcP98Ut1OtbCEon0loPy+pDQAC7qU+guYahCGmCYz7JClflU
 JX78Be47fSLSDpdR6NwA7SzY4YkEiI5vvYAFVcYxbhYmGYZbSr0x/t/yYHt4XAH9kKy4
 ecBg==
X-Gm-Message-State: AOAM533VMAcx4Z3EEVk+6plgOc1bRwqYFKD82QZRcmnNH0u9XVWgmZNK
 BHI/8qzejHJq6RRq1sniE+A=
X-Google-Smtp-Source: ABdhPJzuejfEwWDWhPoDL3axXouRXkPSERJInAHBaND+APz5Svxkas8Ce8anQuWTB0GwWz0/PP96Jw==
X-Received: by 2002:a1c:7416:0:b0:38e:b8b7:e271 with SMTP id
 p22-20020a1c7416000000b0038eb8b7e271mr13118777wmc.7.1650635248803; 
 Fri, 22 Apr 2022 06:47:28 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b0038ecd1ccc17sm4977707wms.35.2022.04.22.06.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 06:47:28 -0700 (PDT)
Message-ID: <ef917fb9-ded2-6e4e-d3ca-f992fc6ae159@gmail.com>
Date: Fri, 22 Apr 2022 15:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] dt-bindings: media: mtk-vcodec: Add encoder power
 domain property
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
References: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
 <20220421035111.7267-5-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220421035111.7267-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_064732_494543_2E52291B 
X-CRM114-Status: GOOD (  14.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/04/2022 05:51, Allen-KH Cheng wrote:
> From: Irui Wang <irui.wang@mediatek.com>
> 
> Add encoder power domain property
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index e7b65a91c92c..de2df6c6352c 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -41,6 +41,9 @@ properties:
>   
>     assigned-clock-parents: true
>   
> +  power-domains:
> +    maxItems: 1
> +
>     iommus:
>       minItems: 1
>       maxItems: 32
> @@ -74,6 +77,7 @@ required:
>     - iommus
>     - assigned-clocks
>     - assigned-clock-parents
> +  - power-domains
>   
>   allOf:
>     - if:
> @@ -135,6 +139,7 @@ examples:
>       #include <dt-bindings/clock/mt8173-clk.h>
>       #include <dt-bindings/memory/mt8173-larb-port.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>   
>       vcodec_enc_avc: vcodec@18002000 {
>         compatible = "mediatek,mt8173-vcodec-enc";
> @@ -156,6 +161,7 @@ examples:
>         clock-names = "venc_sel";
>         assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
>         assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
> +      power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
>       };
>   
>       vcodec_enc_vp8: vcodec@19002000 {
> @@ -176,4 +182,5 @@ examples:
>         clock-names = "venc_lt_sel";
>         assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
>         assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
> +      power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC_LT>;
>       };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
