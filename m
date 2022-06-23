Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE340C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ezgso8XivHRRPiT85f6GCzH+pIwsqVbtG8cGrlQS8g=; b=mc5tHAP2FrV139ARIuOMrV36Zj
	71j/PiEj0FqoipBGamMlyFLdD/CL0uU35TReoWxrCzoF9F/noYo1MVFPCDjIAuXWpkjnOBg90laCx
	wfEuDCb21lj4b+dBZlLBneTo14AGPS+l9psbzpvywRfXp67Zw3GE39fcEvJwTB7EZ7cx5Wtn7U4HH
	HvyQRcb3RQFxxwkQgBzuIA/llpDQagjFR4mk1OQnSNLC33Sj+jH1DsKqJykmdcy95rdrNIhHCMkNf
	BMutp+NR19SvlfVIz05uLMeFOCvVXB4hObjhGTgPP9iH7qGdSAvg9LyfK6i643oRdm7pkH6SXnl+M
	KCpnjSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LiM-00EvnE-IJ; Thu, 23 Jun 2022 12:13:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LYk-00ErMZ-16; Thu, 23 Jun 2022 12:03:44 +0000
Received: by mail-ed1-x52d.google.com with SMTP id cf14so18437763edb.8;
        Thu, 23 Jun 2022 05:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=5Ezgso8XivHRRPiT85f6GCzH+pIwsqVbtG8cGrlQS8g=;
        b=cMQrBm9t4OvtqgEY61UcVrKGHscFtURRz/dn5wgBi1BJb+kWQj5nfHMX93bnwAU6Uw
         sm1sHoDxVPS5MZClbNo/WZLZ8S8vXB3AjcFF+4bDEUHdZjt11SMooJvZXHQfkCBrdHB5
         1bpkFhOuU3UPXpJ1E2STcbO+heIgE6KhqFKd5TAUTptCQ06vbXleCU4BwWgYviiucLo4
         I83xIz1Fznt2g60pcYvvp2HtCqcPNQDlQRLd7lj+t9vXfQ9/DwsD6q2IS6GK09gAayj6
         QxHs8a0p6nXv5saFuJPzVoi1I6+vFj3ddbdxAt9GktMgHnsZ7R4+hz7ZRkcyCMLmKktu
         GqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=5Ezgso8XivHRRPiT85f6GCzH+pIwsqVbtG8cGrlQS8g=;
        b=npZVSaCQJpF5w4y0vFnnswHv2TZ4GmtpSL4lZ5bQu0ks0p+SuPMb881YPdXfaiqftn
         L6N2l4+hc+XYWIyj9N7jZ2koV6ufqVMUiPbC8RFRYR3ZEJnMe7wWRvPfgc/zzYP6cwkJ
         IvKpyPQzHzKcY+43ga0iFu3KSFElul0hj8yjQDpj6fAEiyYKTp3++chOwRwrpuu3acxL
         B5Lfh6ncSewOLlSmhrsF9rZ9nobsw/1tZ+biPZWfxIGyw1LfDNEaJiFtiBmCkyxfSs8x
         a8Fzr55XTz0KoEt8aHIJiF9H3AzfkI52b+iMTlrlDdaDMRP4frcc3I9p3EyLDpA7Fwk0
         0ikQ==
X-Gm-Message-State: AJIora+m0vs1IcMlJPbH8ULiQXEOIlcjyMk8Zm7D9cnwxRQF48mqpzqe
	BSF6ef8lVL1EWOiwD+07FbM=
X-Google-Smtp-Source: AGRyM1tZb9uG7JLHZX5PUvW6s58qyiBpeM171hb7gzho2PSP4Nd26URePYk/o2EujwCrP6RRsDDOwQ==
X-Received: by 2002:a05:6402:218:b0:435:dc75:22e with SMTP id t24-20020a056402021800b00435dc75022emr956569edv.3.1655985818144;
        Thu, 23 Jun 2022 05:03:38 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id la10-20020a170907780a00b00722ea7a7aeesm2854255ejc.51.2022.06.23.05.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 05:03:37 -0700 (PDT)
Message-ID: <952582d8-1e02-8407-0f90-d54d327056ad@gmail.com>
Date: Thu, 23 Jun 2022 14:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 -next] soc: mediatek: SVS: Use the new PM macros
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Jin Xiaoyun <jinxiaoyun2@huawei.com>,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
 zhengbin13@huawei.com, gaochao49@huawei.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220622013410.2786760-1-jinxiaoyun2@huawei.com>
 <20220623030931.2816013-1-jinxiaoyun2@huawei.com>
 <d17549d3-a111-53b4-4576-2f5b6581c830@gmail.com>
In-Reply-To: <d17549d3-a111-53b4-4576-2f5b6581c830@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_050342_126785_D84C5939 
X-CRM114-Status: GOOD (  16.64  )
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



On 23/06/2022 13:59, Matthias Brugger wrote:
> 
> 
> On 23/06/2022 05:09, Jin Xiaoyun wrote:
>> Use DEFINE_SIMPLE_DEV_PM_OPS() instead of the SIMPLE_DEV_PM_OPS()
>> macro, along with using pm_sleep_ptr() as this driver doesn't handle
>> runtime PM.
>>
>> Fix build error:
>> drivers/soc/mediatek/mtk-svs.c:1515:12: error: ‘svs_resume’ defined but not 
>> used [-Werror=unused-function]
>> drivers/soc/mediatek/mtk-svs.c:1481:12: error: ‘svs_suspend’ defined but not 
>> used [-Werror=unused-function]
>>
>> Signed-off-by: Jin Xiaoyun <jinxiaoyun2@huawei.com>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

I never did give my Reviewed-by for that. Please only add these tags if you got 
it explicetely.

Regards,
Matthias

>> ---
>> v1->v2:
>> - Remove the #ifdef CONFIG_PM guard around the suspend/resume functions
>> - Use DEFINE_SIMPLE_DEV_PM_OPS along with using pm_sleep_ptr()
>> ---
>>   drivers/soc/mediatek/mtk-svs.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
>> index 606a00a2e57d..fae7376bd083 100644
>> --- a/drivers/soc/mediatek/mtk-svs.c
>> +++ b/drivers/soc/mediatek/mtk-svs.c
>> @@ -2381,13 +2381,13 @@ static int svs_probe(struct platform_device *pdev)
>>       return ret;
>>   }
>>
>> -static SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
>> +static DEFINE_SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
>>
>>   static struct platform_driver svs_driver = {
>>       .probe    = svs_probe,
>>       .driver    = {
>>           .name        = "mtk-svs",
>> -        .pm        = &svs_pm_ops,
>> +        .pm        = pm_sleep_ptr(&svs_pm_ops),
> 
> Why do we need that? From my understanding DEFINE_SIMPLE_DEV_PM_OPS() sets 
> runtime_suspend_fn, runtime_resume_fn and idle_fn to NULL.
> 
> Regards,
> Matthias
> 
>>           .of_match_table    = of_match_ptr(svs_of_match),
>>       },
>>   };
>> -- 
>> 2.25.1
>>

