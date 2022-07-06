Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A99C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 13:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ys6nhaWDkYktLlUqq0SwlRalsF7YwG4ENbLhHnvqbhY=; b=Ur1lKm4SbeBG5ANfjWJB+ytOLj
	VBk56zI/WwhKg+k6hrKdHsgpxsdRxUpuEmrDAll7Xdl07T4D6qaVPtrPwlj9JI0WHZO+AoeVLjK/M
	sa9rcP0UCiHUybffnl6LNSEEUmSybhn7AMbz3S8zZ3mfEXNG/AOr77nWlKBtgiRevtN5VkBac52l5
	C4zUQHwtRcWnF/DRGXj8e/4jEEIfo7LJrCMHnZUh7CvJ+C7dxn/jW764YE1pAjiGGCC0Evx0ZOwvj
	kDhST6Sz9iPBnAa9dpWMtCjUa3YrMCpUMfPoRsKgQhTQJTpioCMZock1vdMhMLTn5He/nWTsPc3E0
	1Rw2JSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95O3-00APOt-1G; Wed, 06 Jul 2022 13:48:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Nz-00APJX-QJ; Wed, 06 Jul 2022 13:48:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id f2so16791578wrr.6;
        Wed, 06 Jul 2022 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ys6nhaWDkYktLlUqq0SwlRalsF7YwG4ENbLhHnvqbhY=;
        b=fV8aJ9j+yuHCeCJsnseihO3elQIXDVuluuk4eEAuWmKG+ZK7rCd24w3roTCv9M3cST
         X5kMf3UXuNCGkNWELxZKURXY0ztY/VKtR6/sCuBqAOOoH759XuEGDMn/RcFj0qaYKaLe
         kTRu9z4IqfmlqILQRbqADqlV2hrVFq77785WL1jQIwYmp+9cY0tfQOInOH7Enyih4OQy
         6QzZVmfouiDIElYWsH34+xwHK6E3jiSnOTph+07cgrvKE00fQA4IeucMqhvFgxJVPpbh
         Fjf7bydjRVlNfviN68vi9tA2pbet372RqOUYk7ePKh4exRP1IaJp4myFJmdOIavAtPu3
         TN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ys6nhaWDkYktLlUqq0SwlRalsF7YwG4ENbLhHnvqbhY=;
        b=eQLE3X7rvEjAFjpncOvDIOv/C/eKSt5QB79iHWRrYPzMp/M0+k4P0Xej8TSvHOnWM/
         UPs8VirTbvOBSrpfFAUe/Khw6taBTpoT6P00l623iBGV9nGPOb3c0BQRn9GHMb86mOs9
         x4d/3lATpAO4ZwogYAKfaxHQz9pxuTnxS9O85G/aJ6LTJ2f6bsHAlvHH+ATufNHCdAvd
         FSXvTEm5PT7mw5a/rMGlEkmq3ntWJoD9bHhtFyupddCVoscGMlWvDyuLFC8uLp1bp9Pw
         jwW/nkLT1PbLLgCbiKH4vvtPJqgDKQ7jZCeCmjZJKTVMXGVTIHKDipNDYEUfri+o0kP1
         x9cw==
X-Gm-Message-State: AJIora+CnV97kG8Fxw9K1M+kjks5Jh8e96Nb6Mbn7Sfms6m9lGl4Yzte
	UYcxyh0fWXR9AZqqKJEm3F4=
X-Google-Smtp-Source: AGRyM1uKokpPXD3KIW+1SGhOJH0F4Ot+3fwFEVIyD8thjoxNU4UTGfcWYVexdf/YGnIyZIvbYxqHnQ==
X-Received: by 2002:a5d:4201:0:b0:21d:7b63:1b43 with SMTP id n1-20020a5d4201000000b0021d7b631b43mr3917188wrq.225.1657115288718;
        Wed, 06 Jul 2022 06:48:08 -0700 (PDT)
Received: from [192.168.0.14] ([37.223.147.254])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm25703913wmi.29.2022.07.06.06.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 06:48:07 -0700 (PDT)
Message-ID: <9757b32c-c196-f7e0-3c61-1d4edae854dc@gmail.com>
Date: Wed, 6 Jul 2022 15:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/16] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 <119f2a98-ef56-7b99-631f-221b737939ae@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <119f2a98-ef56-7b99-631f-221b737939ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_064811_920459_74D4140B 
X-CRM114-Status: GOOD (  18.59  )
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



On 04/07/2022 14:36, Krzysztof Kozlowski wrote:
> On 04/07/2022 12:00, Tinghan Shen wrote:
>> The max clock items for the dts node with compatible
>> 'mediatek,mt8195-smi-sub-common' should be 3.
>>
>> However, the dtbs_check of such node will get following message,
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>>           From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>>
>> Remove the last 'else' checking to fix this error.
> 
> Missing fixes tag.
> 

 From my understanding, fixes tags are for patches that fix bugs (hw is not 
working etc) and not a warning message from dtbs_check. So my point of view 
would be to not add a fixes tag here.

Regards,
Matthias

>>
>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>> ---
>>   .../memory-controllers/mediatek,smi-common.yaml        | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>> index a98b359bf909..e5f553e2e12a 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>> @@ -143,7 +143,15 @@ allOf:
>>               - const: gals0
>>               - const: gals1
>>   
>> -    else:  # for gen2 HW that don't have gals
>> +  - if:  # for gen2 HW that don't have gals
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - mediatek,mt2712-smi-common
>> +            - mediatek,mt8167-smi-common
>> +            - mediatek,mt8173-smi-common
>> +
> 
> Without looking at the code, it's impossible to understand what you are
> doing here. The commit msg says one, but you are doing something else.
> 
> Write commit msg explaining what you want to achieve and what you are doing.
> 
> 
> Best regards,
> Krzysztof

