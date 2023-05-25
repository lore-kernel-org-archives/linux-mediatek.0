Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CADC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKbbvExgw3/ucZ1dpR5ySDq0P8r8eayisJ2/W5CCx7o=; b=oxgk+2QKG5HM+lhfeGEcR9FO1n
	N87uVayB4zlAJU6H6RSPmuqYVD8XD2/phZ4hX5izaj47X7QNZvhFchLR1pUWXV8UCZ9EveR2J+Ksd
	gXPfqbEaqrYeHO9UTDWwHNVOhi10qj4iaoP8uXQ6tXJIQxIzW66TkOEr30CkSohOV6K/COFh70Rl7
	3fNBXAbSupFbNzyrCAtd1RfJDZjxZnQoEb0PUZl7z4H5ERUVQegUs2xOuEiUvXxAkP48djT7WA1+R
	hxj9kT6ubE+2npV9QVRwzK5KGXo5WlkGWnTzSWEkcxgl4Pt0Tl28zegOc8iu0c763cpgo4jJrdwGr
	f8dKN5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q28zM-00GUde-2T;
	Thu, 25 May 2023 11:18:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q28zJ-00GUcx-1K;
	Thu, 25 May 2023 11:18:35 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B04EA6605842;
	Thu, 25 May 2023 12:18:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685013512;
	bh=OExk5meRIRFEoYMeLOHPGIMC4kPUX+AcmJGbRhlWmSg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=fz4FEKJH5MvYMlx5eTqeTGeVWYLPVANfSJxLKygoNZfliMLH6KD8EXKCz+HG/sYzN
	 mbNaC7rID2ovzlrI81d3VKJqmYAkq7B5xrWvEceJxmIMvd9b5OKME70oRdHzgiCslN
	 xTYET0294uaIgHf0j13K0ekwi/ybuSyahIa3pmILn14TRe4nNd5lUjD/FOO0upXsuT
	 2/IrAVAnMLhobKBCvjJ4wR7zg+fH+CU9S7fAB0Yi7TOUFBSRkcW9eG4jwr0KSySI+Z
	 GVk+CF9bCADEJ1oSSCPdbo2d1j44duy/kzj1zXk+ccAYWJqpY16byThp/v80n/4FxO
	 uYHDVdAbFHFeg==
Message-ID: <915d83d3-0fe9-faa5-c7a4-db9a81374178@collabora.com>
Date: Thu, 25 May 2023 13:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] Revert "thermal/drivers/mediatek: Use devm_of_iomap to
 avoid resource leak in mtk_thermal_probe"
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 matthias.bgg@gmail.com
Cc: void0red@hust.edu.cn, daniel.lezcano@linaro.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel@collabora.com
References: <20230525111417.3350271-1-ricardo.canuelo@collabora.com>
 <2bf27b63-2269-1e11-dd20-bf6a7691ee42@collabora.com>
In-Reply-To: <2bf27b63-2269-1e11-dd20-bf6a7691ee42@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_041833_585806_5D09FF66 
X-CRM114-Status: GOOD (  18.32  )
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

Il 25/05/23 13:17, AngeloGioacchino Del Regno ha scritto:
> Il 25/05/23 13:14, Ricardo Cañuelo ha scritto:
>> This reverts commit f05c7b7d9ea9477fcc388476c6f4ade8c66d2d26.
>>
>> That change was causing a regression in the generic-adc-thermal-probed
>> bootrr test as reported in the kernelci-results list [1].
>> A proper rework will take longer, so revert it for now.
>>
>> [1] https://groups.io/g/kernelci-results/message/42660
>>
>> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
>> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> Adding context: the rework would require us to "probably" change this
> iomap to getting regmap handle(s) and working with that, which is why
> that wouldn't be trivial.
> 
> My apologies about initially misunderstanding the fact that
> devm_of_iomap() behaves in a different way compared to of_iomap().
> 
> Ricardo, huge thanks for sending this revert.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 

Sorry for the double mail, you're missing the Fixes tag, as this should also
be scheduled for backporting; you can use the commit that you're reverting
as your Fixes tag.

>>   drivers/thermal/mediatek/auxadc_thermal.c | 14 ++------------
>>   1 file changed, 2 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c 
>> b/drivers/thermal/mediatek/auxadc_thermal.c
>> index 0b5528804bbd..f59d36de20a0 100644
>> --- a/drivers/thermal/mediatek/auxadc_thermal.c
>> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
>> @@ -1222,12 +1222,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>           return -ENODEV;
>>       }
>> -    auxadc_base = devm_of_iomap(&pdev->dev, auxadc, 0, NULL);
>> -    if (IS_ERR(auxadc_base)) {
>> -        of_node_put(auxadc);
>> -        return PTR_ERR(auxadc_base);
>> -    }
>> -
>> +    auxadc_base = of_iomap(auxadc, 0);
>>       auxadc_phys_base = of_get_phys_base(auxadc);
>>       of_node_put(auxadc);
>> @@ -1243,12 +1238,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>           return -ENODEV;
>>       }
>> -    apmixed_base = devm_of_iomap(&pdev->dev, apmixedsys, 0, NULL);
>> -    if (IS_ERR(apmixed_base)) {
>> -        of_node_put(apmixedsys);
>> -        return PTR_ERR(apmixed_base);
>> -    }
>> -
>> +    apmixed_base = of_iomap(apmixedsys, 0);
>>       apmixed_phys_base = of_get_phys_base(apmixedsys);
>>       of_node_put(apmixedsys);
> 
> 



