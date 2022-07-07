Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2810AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUcILjU05md1B2NfaElYe4uchnCp46FPLcmqNORjJrE=; b=xkzLlZrV45nR39X097sAa19zXU
	Aomu460fywUGtTz7qSD7F+Ukukm5DjXrg56qFvAr1Z/tAfytc7GNZAVUe9bmXs3G8Shcpu/Q5NSYL
	P7r72zt3OHD1WRzsDcUl01lqAmTjdKPpbUSxeXnR/q8KJSrb079gYTvh8Eggi8MODrJdc0PzMn1Qf
	G8GMHSMMBKnzrHLDjbjMYALm8n9YmTQZaFpg873GC6K1KHYXXtM84rBqtQeUb7gR3aBrclmr5O1GR
	iYihIAQ7qfm3XejAyw2eWkB5Hn5wd94nfbFczweXUkuwTwFoBAGkYqoheyuxJ4rFfkkaNIA09zibD
	94VkvCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Mpn-00FCBG-7o; Thu, 07 Jul 2022 08:26:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Mpb-00FC96-Ki; Thu, 07 Jul 2022 08:25:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id ay25so517959wmb.1;
        Thu, 07 Jul 2022 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=ZUcILjU05md1B2NfaElYe4uchnCp46FPLcmqNORjJrE=;
        b=HKQ8SC+cJ0al4Lw44hNe4JkWTVj4SU/Ck+/6qZwc4m44JnE3ZSohU+1BnIRe2UVkNu
         xlBVlK0kNxTuWvdkTC8fhlh6Lv8auVqQZMzDI/avsvT8C2otxzOeNerzr2YlJk6U688y
         I3xVQHBv+kU9WzGrO6k0f32aFdu5NWBUBd+6HHQ5lEIaOlf7rnGCMwXatDntMtFXAf8V
         D7GjPbpPMTt6WRspXuu7wiDFddp9ITCerDuc3X97nNDs/piy61Uy/CW/O+aOc3TfXNVw
         9xY3J0hMNaJeh80jLCjZltTxgIuz5HihVhEGoYW0OZgwatKXTsKl19Mnengktel50jgZ
         kjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=ZUcILjU05md1B2NfaElYe4uchnCp46FPLcmqNORjJrE=;
        b=Eq+xXgL2CuacWj3hxP21jMlP9GBDsduzANDwOu6DaDzWQ/BSyHkKDJxWyEPERZOD3e
         Q+gwrJZV1Ty2cypHKQdh7gxbHyrfIAvPBNfQ0R9H4J8tQBucFaZvQKgCuEERDJGrZQ65
         K69rGriilKC9DzVC3aOG8XmIzrHmLQK9FhES8/ZoOn257856iOTFviY0gpBv7kfxa7zy
         oNS4+i0JVd3d6hOnax9eDdGOx+ev3e07yb/v+6vikI2rtMze0m3AmiAjhgwozuAnIiEK
         rhntk/y9YW9LYsOiOXKm+iXrdfRnodR2hd7A/NRGjx0qKLFPObnBqF5c4QQm+vb0hatA
         4pQg==
X-Gm-Message-State: AJIora+ljhKvhI3L5wTZx/T2HRGZyg0AHL5gO5Cr6phd3wZR/LkefA3V
	gtW5+E5IDWw26mdUlN6VtvM=
X-Google-Smtp-Source: AGRyM1t4ZZhJso9Y8L5ePctxxoWGaSr2UMTxX6k5aIkfnbLkMlsQHWfCVBQRikMdjHbzOfcgGWkSRQ==
X-Received: by 2002:a05:600c:3ba7:b0:3a1:6c19:fa8c with SMTP id n39-20020a05600c3ba700b003a16c19fa8cmr2996907wms.120.1657182347619;
        Thu, 07 Jul 2022 01:25:47 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b002185d79dc7fsm14554361wrm.75.2022.07.07.01.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 01:25:46 -0700 (PDT)
Message-ID: <782e345f-1f15-c65b-9ff1-3da3e0ecd7fc@gmail.com>
Date: Thu, 7 Jul 2022 10:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soc: mediatek: SVS: Use DEFINE_SIMPLE_DEV_PM_OPS for
 svs_pm_ops
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Roger Lu <roger.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, patches@lists.linux.dev,
 Jin Xiaoyun <jinxiaoyun2@huawei.com>
References: <20220622175649.1856337-1-nathan@kernel.org>
 <92d0d361-7d04-150c-97f2-3e073945a210@gmail.com>
In-Reply-To: <92d0d361-7d04-150c-97f2-3e073945a210@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_012551_720184_66A7995B 
X-CRM114-Status: GOOD (  19.34  )
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



On 23/06/2022 14:04, Matthias Brugger wrote:
> 
> 
> On 22/06/2022 19:56, Nathan Chancellor wrote:
>> When building this driver for an architecture that does not support
>> CONFIG_PM_SLEEP, such as hexagon, the following warnings occur:
>>
>>    drivers/soc/mediatek/mtk-svs.c:1481:12: error: unused function 
>> 'svs_suspend' [-Werror,-Wunused-function]
>>    static int svs_suspend(struct device *dev)
>>               ^
>>    drivers/soc/mediatek/mtk-svs.c:1515:12: error: unused function 'svs_resume' 
>> [-Werror,-Wunused-function]
>>    static int svs_resume(struct device *dev)
>>               ^
>>    2 errors generated.
>>
>> This happens because SIMPLE_DEV_PM_OPS uses SET_SYSTEM_SLEEP_PM_OPS,
>> which evaluates to nothing when CONFIG_PM_SLEEP is not set, leaving the
>> functions unused in the eyes of the compiler.
>>
>> This problem was rectified in commit 1a3c7bb08826 ("PM: core: Add new
>> *_PM_OPS macros, deprecate old ones") with new macros. Use
>> DEFINE_SIMPLE_DEV_PM_OPS to fix the warning while not changing
>> svs_pm_ops when CONFIG_PM_SLEEP is set.
>>
>> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for the patch. The same issue was addressed by Jin Xiayun here:
> https://lore.kernel.org/linux-mediatek/20220623030931.2816013-1-jinxiaoyun2@huawei.com/T/#u 
> 
> 
> I'm happy for any review help.
> 

As there was no progress on the other patch, I now applied yours.

Thanks!
Matthias

> Regards,
> Matthias
> 
>> ---
>>   drivers/soc/mediatek/mtk-svs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
>> index 606a00a2e57d..d70903f45ddf 100644
>> --- a/drivers/soc/mediatek/mtk-svs.c
>> +++ b/drivers/soc/mediatek/mtk-svs.c
>> @@ -2381,7 +2381,7 @@ static int svs_probe(struct platform_device *pdev)
>>       return ret;
>>   }
>> -static SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
>> +static DEFINE_SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
>>   static struct platform_driver svs_driver = {
>>       .probe    = svs_probe,
>>
>> base-commit: 71eaf1887203d0a59c92fd9dd3436b8d8489d68c

