Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A266C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPKFsn5fgFC3dh7g4FEmoTkg1BmyHxMILE2vHE8EovU=; b=u8CuJnGgHSk/a4xgzStGetyX5n
	/8Enh9IOnWldB76hEOF0BwfuRkf1I31JqV9utavqvKEuQy7pWcHq0twE6J50+OSWx3hRhBvq3ky7Z
	jb4Ak87DRlEFJBaCCiJEVP7ok4uCCR1IKjPpvLf9j76mzGPeve/hiQMUrLEGJRA/6UL5AjRAmvc+0
	AiHMV3QU3xf523cVKNRc+QPApEHJW7A/JDIOKO/VcEmzwRMb1xhol/ujhJpUs0BGFzu/CKTLN2yt3
	bgO+HdM5CgfWv9SSQnmBj/+WyGq4vLOKTfSEitjzI64BYhxEf57vg/PFXQFELsKaLY4nrvQvltIB7
	g3/vmRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8LJC-008oc3-B3; Mon, 04 Jul 2022 12:36:10 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8LJA-008oWy-2w
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 12:36:09 +0000
Received: by mail-lj1-x232.google.com with SMTP id r9so10902537ljp.9
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iPKFsn5fgFC3dh7g4FEmoTkg1BmyHxMILE2vHE8EovU=;
        b=kakAYzAv3NzfFeDUN+1/0H8cOwRS5NqlQ27nFKj7WIejGwKhWzq7PYg92rhzNELiok
         ows4QwIkoF9T/PEjYcacupijYOGztmIJZX5YdHTCt3hjFdawbgKTdqTaV6X7nBRw7S3T
         AXH0gKwluMjUJWlDwI5dk9h305balLQvjZXjNgfj8QNQkyOv5iSvci8Ht5scpAM7Igho
         DCubFtKdQXghwAMldj0MDUQ4tO1CpDbwAuKH8DBDDNe3zPp6iys8MQwWuh+1QlJ5iG3q
         07cYHofieHH6/bTNQXBanUdfaKrMjdJKOLNvLTNTQg2AN2MO4crHODHokwL2rzBMdm9t
         fT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iPKFsn5fgFC3dh7g4FEmoTkg1BmyHxMILE2vHE8EovU=;
        b=Je10A23P+o22IScsOV9nG+anL2LtWrLd8FbdZpekL37GHQoqTuQLUWC+ZlK432OTzH
         pbyCreTj7CaQCnGoQZN7KEQgxBaNj8vNZ98qHtSaFsvHUwxJILUaPk7ehYoF71I8Vpku
         kk3ce5sfwMhUzKRx6k4oEUtTG8w3Ce1Io3NZXpxZXyS6u+79wt8XdUzT83XnCixsmdLt
         01wt7GGNL8qzk351hQ1Th2xB10yeRh3B69uS4EpXQZt33YSvcmH/Z0j1iveu81tq6gq8
         pQnKxrdlxSyhryKFszHqJoZmionQ/j7wgGyLfjJjuzP9m1NDKOUchhPMEgYl/hg4EsQn
         4kUg==
X-Gm-Message-State: AJIora8J4U/W6aIUr1T8h71LneYa+VIYGDwWg2P4jgvWO73FANG6Orkt
	jQQDmJNgC43kTOJ/1OOFhbp7EQ==
X-Google-Smtp-Source: AGRyM1tXWRrB0b5dEJCLzGc/R5uafVj4v54jWmEi9eVLKfsI4Srl/ADg1V4X5sgKVHCa6i63d9K/IA==
X-Received: by 2002:a2e:b713:0:b0:25a:90bd:cb6b with SMTP id j19-20020a2eb713000000b0025a90bdcb6bmr16083013ljo.380.1656938166435;
        Mon, 04 Jul 2022 05:36:06 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id f10-20020a056512360a00b0047255d211c2sm1727143lfs.241.2022.07.04.05.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 05:36:05 -0700 (PDT)
Message-ID: <119f2a98-ef56-7b99-631f-221b737939ae@linaro.org>
Date: Mon, 4 Jul 2022 14:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 02/16] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
 <20220704100028.19932-3-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704100028.19932-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_053608_173248_38ED406C 
X-CRM114-Status: GOOD (  17.46  )
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

On 04/07/2022 12:00, Tinghan Shen wrote:
> The max clock items for the dts node with compatible
> 'mediatek,mt8195-smi-sub-common' should be 3.
> 
> However, the dtbs_check of such node will get following message,
> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>          From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> 
> Remove the last 'else' checking to fix this error.

Missing fixes tag.

> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../memory-controllers/mediatek,smi-common.yaml        | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index a98b359bf909..e5f553e2e12a 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -143,7 +143,15 @@ allOf:
>              - const: gals0
>              - const: gals1
>  
> -    else:  # for gen2 HW that don't have gals
> +  - if:  # for gen2 HW that don't have gals
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt2712-smi-common
> +            - mediatek,mt8167-smi-common
> +            - mediatek,mt8173-smi-common
> +

Without looking at the code, it's impossible to understand what you are
doing here. The commit msg says one, but you are doing something else.

Write commit msg explaining what you want to achieve and what you are doing.


Best regards,
Krzysztof

