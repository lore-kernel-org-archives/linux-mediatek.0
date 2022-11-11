Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E35C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILQKPbjyWoRxHDAqSBL6QoJBaVHzXKbksM3KezorxPM=; b=bnVMO9jnQRYgJHZOEYDF8DhyvZ
	7I0Ys0u1+cSPTKvkLUVkcSVGLAtXh8yZOWWXZOcqSTeX5DSkvZJRrfmZ2VJkMt7B7uyDZ/wlA7UwJ
	j1kf3c/AXJmO2uq/RMR6m6yuI4leYhWh1QwUESdxclGMN0ePxGsULbo/QF7dJ0Sk76p/sMkggJDl8
	fdtaMBsBeZNTQbmejxhVFaght8Q5SQDYpVqEq2qIcV+vCrQlYEy8/mIUCWa+slKjtWwhbwsd5ypMK
	aEsLAa49u6rOAK39MHYmQDewYAlZyxw8WwBs5KN8ye1ATt2QyEn6i1fJ9lLxBOLn4C1I9KxBP+Rrb
	UTS6gBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPRt-00EEUo-QM; Fri, 11 Nov 2022 08:31:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPRc-00EEPP-1D; Fri, 11 Nov 2022 08:31:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id p16so2536502wmc.3;
        Fri, 11 Nov 2022 00:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILQKPbjyWoRxHDAqSBL6QoJBaVHzXKbksM3KezorxPM=;
        b=e5FxWUo0+SMymkxP1MLNhjSp9cJdwZ7MeUMHkMKh63YNS5+AdO8Udkzgi9LsuyZnvR
         bK+Ut6bfeRkUyIP0mIDGF5G3XRqUlJCeXsmGxdEigqWNGxg1awwuJXgogY/FvHOQNAkT
         IlisjD6vbInlJSgvgf6H0itnPwJGTw4wJnNRyFQXCCNGa9hO0cbkeF2nVYdwyboJt9gH
         vjmryJtc+BnzZ6z/PMNi/HWGysN3OHKrcYqnpR2VDMFOHdXbNf3hT3NdvB/rdU32qreD
         TFMxIJmIFZo0J6/d0IifY41aWugbFZb6WQ/yAMdBPDojJU48fQFH17c1ho2KdAh4fvFK
         SUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILQKPbjyWoRxHDAqSBL6QoJBaVHzXKbksM3KezorxPM=;
        b=EXRsrPS2+UwKmzT3czUSrz5M1HaBVWjE7WFQ+B03BNXzGAWIA853cpLcydDY9FCOxv
         G41lSfbJMpXHmlexgxN7q/EP1go4d1dO4512VKJzqX6ZvLYiODWW1Mp3ncK1flt+SFyN
         yLdoK+x6jmBD0KwYHKUTxfV2Q1kr3UG0E7LK1Cz/CBG7jm+dlqk2PHd+lel5SwN3iDsR
         VvdsL1wwZ9FbcIcL/lSLImACgs5AhgCEX6Ma0njZv52SNnZT1N4+7KYTiIDXwqD+fZLs
         EShrdmycPcxaFd/YvGfPHaOEcnOty7X4bGAQIS1GbbZFGXrXBjlrGVvWDPzVW2a4Cfem
         WGGg==
X-Gm-Message-State: ANoB5pmCUxvw4mrF4ZB0LZ0osE7lPmdM1vqGhggWBju6OcCSP83z7J3+
	1H5a3VybasLIP6QfNw+JAKY=
X-Google-Smtp-Source: AA0mqf4JkVa8kzZkdsc/bnynW+tiN56YWEa1BtHBq+7CkAFwiL9Bzu5gmXucv0j0YY2W/W3ccnCj/g==
X-Received: by 2002:a7b:c447:0:b0:3a5:f600:502e with SMTP id l7-20020a7bc447000000b003a5f600502emr501296wmi.39.1668155477990;
        Fri, 11 Nov 2022 00:31:17 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p33-20020a05600c1da100b003c71358a42dsm10048391wms.18.2022.11.11.00.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:31:16 -0800 (PST)
Message-ID: <465810f6-98f0-4125-179d-dd484e5ac09d@gmail.com>
Date: Fri, 11 Nov 2022 09:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] soc: mediatek: Add deprecated compatible to mmsys
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org, nancy.lin@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221110120222.32297-1-matthias.bgg@kernel.org>
 <eae90e1e-408b-4f9a-9211-649da28b0358@collabora.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <eae90e1e-408b-4f9a-9211-649da28b0358@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_003124_118048_D7F47333 
X-CRM114-Status: GOOD (  15.35  )
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



On 10/11/2022 16:03, AngeloGioacchino Del Regno wrote:
> Il 10/11/22 13:02, matthias.bgg@kernel.org ha scritto:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> For backward compatibility we add the deprecated compatible.
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Hello Matthias,
> 
> You forgot to advertise that this commit depends on [1]... and I'm afraid
> that you have to push a v2 anyway, because...
> 

Well yes I based it against mediateks for-next branch, sorry for the confusion.

>> ---
>>   drivers/soc/mediatek/mtk-mmsys.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>> index ba2e79b26993b..47106f557c574 100644
>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>> @@ -303,6 +303,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>>           .compatible = "mediatek,mt8192-mmsys",
>>           .data = &mt8192_mmsys_driver_data,
>>       },
>> +    {    /* deprecated compatible */
>> +        .compatible = "mediatek,mt8195-mmsys",
>> +        .data = &mt8195_mmsys_match_data,
> 
> ...mt8195_mmsys_match_data doesn't exist anymore after [1], so this should be
> 
>          .data = &mt8195_vdosys0_driver_data,
> 

Of course, should have compile tested at least. /o\

Regards,
Matthias

> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
> 
> Cheers,
> Angelo
> 

