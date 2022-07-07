Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3266EC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTKsDc0N/t7R2FE7e8qc9b6f62szw20LTPOT6cDttmI=; b=hk5RG7PQjbQ4XswHyxzLnzHp7Y
	ve/uudDLziaHyY8PEsm8fCTl/Scf5eBEo0WuyWbUqLzSHd0eJpYnyTxw9VLU4SmBm8+dhUh2mJIX/
	WSNd0RpuB5riDtwLOJ/cooxKaNZ1bI1JIWI5HLyssPMC56CnQ06QRs3HsX6gesw4XHrHTPH5HBVsW
	BPsn7q9ikslGYyRrSrox7LqSXknEJB3dw2WWVQ9WcRLqKTiZq2aCaZvgjVuQfN40LknQEDI+s35Ch
	pEUEXGvR7I5T5nTYKmyCpOfey/m9J0VUwpiIBzKjfinD3AEu8PXlcKA/kcyLWi6KU1D1nmW3w4LDQ
	+7HgkYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Mqo-00FCPL-Sw; Thu, 07 Jul 2022 08:27:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Mqd-00FCMM-Iq; Thu, 07 Jul 2022 08:26:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id r14so19435411wrg.1;
        Thu, 07 Jul 2022 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=QTKsDc0N/t7R2FE7e8qc9b6f62szw20LTPOT6cDttmI=;
        b=HyIH7xk6yru9oy170K9g2hvgVus86Ui4axzJlhxfhcliJroS1jnyBoVRj4ODf7WNYA
         Ly800IqWmeVLmbjCEBNNXPbMVnz22YErTPPKsFhcRQXrAXGtMSAbl+5p3TCRL/JpXMye
         TEv7EhT8dG3VKbRQZgzc87k2mkmm9ZAdSNN1y4xoI3NGqDVTVQ1mHzS6Xmu1cZkiOwLr
         84LowuZVRAX6B5RZ0jcB/8uo1Jo7lHfQNwxE97Y2W7f+hGYR10ZeTt/NjYOButhf4VD6
         k0p7UpKWV5SyxHaBSgbkARVDkc1/CL3FNPglG0F3zIg9HEAO6LUJppCQT0kF3OPVMwmg
         iCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=QTKsDc0N/t7R2FE7e8qc9b6f62szw20LTPOT6cDttmI=;
        b=wINzFOJq7zNo1q5uc2Mj65RkJi23ZpQyMsRYEr1SK/iwaQth3DhsCHpQ1OhGmRlIBb
         Dpm2K5S0jlKg77eRUALhehZAG/c+t8b6MZZayuegLXLAj4lgO4Qr9ZbmGCI/4Qx9veew
         IvJyqcp7xv1iJCBV1vfiwdRdxPVAV9dhi49jYpM8ZjzJfXwyZfdfzkc+TtzmBMNtboP3
         udRzfmfk1e+qn82WfhZglQV3ZlTMgLeJDPTCPq2S1RzfOqvnnSpAzD/shV27VpnGGuYE
         2OeBxRqcVWXsUWIt4HMG/cN2H4A97tlO5hIJGliYH/g9xKMiltsOYs/2PK2RO47rA3ts
         MG1Q==
X-Gm-Message-State: AJIora++qyMAh5KFMjrcN8d+BGwR5c4Wd5V+XZqUKAvjlljlT0ZDbQ0R
	a4fPXjlTX+XfoFa6C6RECTM=
X-Google-Smtp-Source: AGRyM1tS+6lW63F88bR6HiGjHZ5SprOSCNjOdDOL1OoF+m3XQ5fOHIjiZGDgv7z3ySy8RO9u5xquXg==
X-Received: by 2002:adf:f20e:0:b0:21d:8aa6:69da with SMTP id p14-20020adff20e000000b0021d8aa669damr47390wro.66.1657182414269;
        Thu, 07 Jul 2022 01:26:54 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4a50000000b0021d7d251c76sm3852686wrs.46.2022.07.07.01.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 01:26:53 -0700 (PDT)
Message-ID: <95151159-19fc-891f-65dc-2b66e2b96357@gmail.com>
Date: Thu, 7 Jul 2022 10:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
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
 <952582d8-1e02-8407-0f90-d54d327056ad@gmail.com>
In-Reply-To: <952582d8-1e02-8407-0f90-d54d327056ad@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_012655_664908_26A0BB0B 
X-CRM114-Status: GOOD (  17.51  )
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



On 23/06/2022 14:03, Matthias Brugger wrote:
> 
> 
> On 23/06/2022 13:59, Matthias Brugger wrote:
>>
>>
>> On 23/06/2022 05:09, Jin Xiaoyun wrote:
>>> Use DEFINE_SIMPLE_DEV_PM_OPS() instead of the SIMPLE_DEV_PM_OPS()
>>> macro, along with using pm_sleep_ptr() as this driver doesn't handle
>>> runtime PM.
>>>
>>> Fix build error:
>>> drivers/soc/mediatek/mtk-svs.c:1515:12: error: ‘svs_resume’ defined but not 
>>> used [-Werror=unused-function]
>>> drivers/soc/mediatek/mtk-svs.c:1481:12: error: ‘svs_suspend’ defined but not 
>>> used [-Werror=unused-function]
>>>
>>> Signed-off-by: Jin Xiaoyun <jinxiaoyun2@huawei.com>
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> I never did give my Reviewed-by for that. Please only add these tags if you got 
> it explicetely.
> 
> Regards,
> Matthias
> 
>>> ---
>>> v1->v2:
>>> - Remove the #ifdef CONFIG_PM guard around the suspend/resume functions
>>> - Use DEFINE_SIMPLE_DEV_PM_OPS along with using pm_sleep_ptr()
>>> ---
>>>   drivers/soc/mediatek/mtk-svs.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
>>> index 606a00a2e57d..fae7376bd083 100644
>>> --- a/drivers/soc/mediatek/mtk-svs.c
>>> +++ b/drivers/soc/mediatek/mtk-svs.c
>>> @@ -2381,13 +2381,13 @@ static int svs_probe(struct platform_device *pdev)
>>>       return ret;
>>>   }
>>>
>>> -static SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
>>> +static DEFINE_SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
>>>
>>>   static struct platform_driver svs_driver = {
>>>       .probe    = svs_probe,
>>>       .driver    = {
>>>           .name        = "mtk-svs",
>>> -        .pm        = &svs_pm_ops,
>>> +        .pm        = pm_sleep_ptr(&svs_pm_ops),
>>
>> Why do we need that? From my understanding DEFINE_SIMPLE_DEV_PM_OPS() sets 
>> runtime_suspend_fn, runtime_resume_fn and idle_fn to NULL.
>>

As I didn't see any response from you on that, I went ahead and applied
20220622175649.1856337-1-nathan@kernel.org

Regards,
Matthias

>> Regards,
>> Matthias
>>
>>>           .of_match_table    = of_match_ptr(svs_of_match),
>>>       },
>>>   };
>>> -- 
>>> 2.25.1
>>>

