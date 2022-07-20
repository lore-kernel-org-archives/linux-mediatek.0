Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154EBC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpdLAALfeFZJFf34lr9EAhmP/cSrmy7SxAXiREu4lCE=; b=GkqCRMoi9vWduQpnSafksGBs3+
	mWConEBpNt1QvMfR9kCZnP82zCh+dp5/cfWwiLkp8H9qqeI6YLw4wLZzuug9144p9DTo4SUModzo4
	r6WagI6pC+zf2LXl3Y3/LczuecedVL5NTpdp8ZpptPda5t7SDwfln/8/298p3b9C/5fKpBpC2SMMu
	RdxhapJ+vqK13t9EbBGCRmsVBZsVTU5bRwgazXorMS3QFhaQDHQPEoU7AHrQy48OfH4+z4Byzs0WQ
	P5lkLMCWjIbNEJGvnaqJQ7woBDfb2sVr6WMcLkHYv/dydUHucOChSkb+1KK0NjjFay/oDCqd2mWC6
	IIQDncdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDYj-008ei6-QC; Wed, 20 Jul 2022 17:32:29 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDYf-008edY-LQ
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:32:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id o7so31428731lfq.9
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FpdLAALfeFZJFf34lr9EAhmP/cSrmy7SxAXiREu4lCE=;
        b=e2PwSymV0hA+iIEXs5JnVHMHTYba9XQeH1c2XfY/o0kRymmpd+9BFAruPDv8CzYshH
         7UNWBFLSTwSwpS7PgmNyLKD7dcV25GMdPqgurrpIqDzTKca1UbsGLc0fX4rKKZVBFR/y
         tuE4CWS3WSCn8N5efQvbI328K33oijpEPSZLThOZimXoq/kosT5TIMmQpwcvj9Zd1RrD
         PvqjlNJQwxnzemXPGKP8NdhOCgS3Oyu7a9qARuKOiabCTX0V0lwBJMAnAT5LTbllpfKX
         t8zNsw2nEL1IgV8iKQxyx31A+hu/coiIuhkosx5vZGkk4e4jyr0Vk0vbcG7gMPruU3FM
         /XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FpdLAALfeFZJFf34lr9EAhmP/cSrmy7SxAXiREu4lCE=;
        b=OnmleRizZeRviH1SMz/2EqTuiTXm7Nf5xdzIMmjnIvz34XgJupr92Jzo2jvw5lMOaX
         DUx9wFuPvsBOBCRLc8pLCFvr52hQj+mwFkwLOEmBhyM6NC2b8iazwOMLqpNPgCeelkgk
         Qdxm7xjYGYHv5pXcXve2h1CZPB3da5zZnlaCNonSX1PjjiKsCcb/ZBM5aZPOQF3D25gq
         kP/YmWl5Y9h+ueM1qnUyyZ4F5rEtLZ02RSW/2gifEV7AcfQ1NSDlbquug9jkOI2Rfy0h
         dGbD4GwDxQxKRJIoJujz7o4hSOi/j9mgF8cBTjcFEDQ79ogQOOdE44gVLQ6TvXOiBaPT
         JEzg==
X-Gm-Message-State: AJIora9/z66R4qgYEYInd0xH9mkRPSvHMCOKjnbUVWsU1od8tbufspXn
	5vWbH8Qoilx7+woXciYKrXUxQw==
X-Google-Smtp-Source: AGRyM1sjIgDPvW7XqgXeKtiTiExWUywK1Bz9F9BKOt5z1/TReYjxYJre4a0CVxkypZSJHZbV45ScyQ==
X-Received: by 2002:a19:700b:0:b0:486:e7ec:67ad with SMTP id h11-20020a19700b000000b00486e7ec67admr19129070lfc.263.1658338344098;
        Wed, 20 Jul 2022 10:32:24 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id o13-20020ac25e2d000000b004896ed8dce3sm3917980lfg.2.2022.07.20.10.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:32:23 -0700 (PDT)
Message-ID: <4afe8a76-08be-224f-d40f-0b45566a5147@linaro.org>
Date: Wed, 20 Jul 2022 19:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 03/21] dt-bindings: power: mediatek: Refine multiple
 level power domain nodes
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-4-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720123023.13500-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_103225_746865_8F9A1796 
X-CRM114-Status: GOOD (  14.18  )
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

On 20/07/2022 14:30, Tinghan Shen wrote:
> Extract duplicated properties and support more levels of power
> domain nodes.
> 
> This change fix following error when do dtbs_check,
>     arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: power-controller: power-domain@15:power-domain@16:power-domain@18: 'power-domain@19', 'power-domain@20', 'power-domain@21' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	 From schema: Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../power/mediatek,power-controller.yaml      | 131 +++---------------
>  1 file changed, 17 insertions(+), 114 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index b448101fac43..321802c95308 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -42,6 +42,23 @@ properties:
>  
>  patternProperties:
>    "^power-domain@[0-9a-f]+$":
> +    $ref: "#/$defs/power-domain-node"
> +    patternProperties:
> +      "^power-domain@[0-9a-f]+$":
> +        $ref: "#/$defs/power-domain-node"
> +        patternProperties:
> +          "^power-domain@[0-9a-f]+$":
> +            $ref: "#/$defs/power-domain-node"
> +            patternProperties:
> +              "^power-domain@[0-9a-f]+$":
> +                $ref: "#/$defs/power-domain-node"
> +                unevaluatedProperties: false
> +            unevaluatedProperties: false
> +        unevaluatedProperties: false
> +    unevaluatedProperties: false

I see some beauty in previous endless recurrence, but at least we are
specific...


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

