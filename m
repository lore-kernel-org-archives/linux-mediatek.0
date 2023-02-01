Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667CAC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAYK3TYYJaUS303BiC19eGVbURXpPLfapr3AkUuAJEg=; b=xRIcsc55JYU2yMNOK2G8cFCze/
	ldLDQqY9Zsi88Kpw5J/HJQlWkFMhG+xtcudHbx3oBeMLwyj3PZw9ZSAySzBizjH0jxCBJmSQyScaW
	4M3rDaEouJsFHqfO+VMXv+2vt8TVWkAGfYBBg/cMwKOYytocRbi50VOYSCsfhyIioJJIQ0i3nWPlM
	Gx7BuCWyJX9YvXS078y9LBvgVE8C0S0fVq+Hpy8o+1YiLGces2csu7fYDqVuAdGGx+Dxdinr0K1+4
	6cA2XU0Hmj9X+GS7wyICA9InOiXS5ap1UDo9PiO0ISP/qhxHlZsS2V5iny/q4ospI18GmfA2uTAc/
	1xze6y+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDSp-00C8A8-R1; Wed, 01 Feb 2023 13:47:51 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDSn-00C89f-Jx; Wed, 01 Feb 2023 13:47:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id mf7so32840120ejc.6;
        Wed, 01 Feb 2023 05:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAYK3TYYJaUS303BiC19eGVbURXpPLfapr3AkUuAJEg=;
        b=JJ5MTU8YfsTRyn8GFnxVev/0QSLfJwzfK3HGnHyqPONF8XbvSskm3MBEfiNSfc2rBG
         UlwBfeQPGolGO5nRgBo1dy9JJl//gcHeEzWYKXxGcLD5gU6ajxQvgSutM240vvWqKvBk
         Mhohzx65wk3FOAML3cKvL2vv8q8HVTgcQXgmAXdQyU5TRddC0ZdZI+u3eNxMQYnsjdVH
         W3CDOmtggKzT9WndAVZ0bGC/TmveAsU8Ig8eiFg+zOuTRUajFyXuVVqWiqjvdH4Afd99
         5dyzQgHdowZtVGzSoc+Q/kk2Pgk3rJWEc5ha0XKAULgQycP5uAj8HnHmCF5c8Py2DT2K
         13wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAYK3TYYJaUS303BiC19eGVbURXpPLfapr3AkUuAJEg=;
        b=Pl01P/tOvDP5cWl3bLWk7RW+ahMse3ltYy5id2ZatsB1VuPBXJWXBAbdN5afdvGFh4
         pBjzXlUDJb8wmLcJrubNR4gGeXWC6PLLSEmf3TYbmZ9gSAcwhozeSSTQqtyWCb3GINUu
         c0oj4+kcdmuaExTlCf7u8sAo+cT5abDJo8dL0lxUiBEFHbGlPMChSawsxzuzPZLM8igF
         sCXQqYA1NyE4mV4+9/mY72y4PV+ls0J7PA0bXUqJiJfGEjEZDQV6L86/4CT682njPATK
         KBnRLU1owxaiju3b3QC+tagoquMeVUHHghWXGlHeVm3GLomQ0E9MXBgq5NpuAqVZHiCn
         ODDg==
X-Gm-Message-State: AO0yUKXHuLYBxym7dScLEqpb7fgK69gy0rml++HnIWRoO56gfRdkL9Xu
	qHTJ4yyzHndaRmEnR6/sOFo=
X-Google-Smtp-Source: AK7set9+8h3TtIUgYCEumqDGu7/k2mPjC7QxBLFQEUbNA9ZoT+PjOsIM6GO6pUCmTQe4D3KJOysRNQ==
X-Received: by 2002:a17:906:7246:b0:87d:eff1:acc1 with SMTP id n6-20020a170906724600b0087deff1acc1mr2187158ejk.64.1675259268083;
        Wed, 01 Feb 2023 05:47:48 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id ss2-20020a170907c00200b0087329ff5922sm9917665ejc.139.2023.02.01.05.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:47:47 -0800 (PST)
Message-ID: <7336156c-9451-bc59-2bd3-26c1b7809bb5@gmail.com>
Date: Wed, 1 Feb 2023 14:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 03/14] soc: mediatek: mtk-svs: enable the IRQ later
Content-Language: en-US
To: =?UTF-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>,
 "eballetbo@gmail.com" <eballetbo@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "drinkcat@google.com" <drinkcat@google.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ribalda@chromium.org" <ribalda@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?=
 <Jia-wei.Chang@mediatek.com>, =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
 <fan.chen@mediatek.com>
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-4-roger.lu@mediatek.com>
 <561d9a97-64c7-6633-ff10-d85ae2c7f314@gmail.com>
 <715873f9acb975aa8a6a21fda372b00dcc5c137a.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <715873f9acb975aa8a6a21fda372b00dcc5c137a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_054749_701344_D144BD1C 
X-CRM114-Status: GOOD (  20.72  )
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



On 01/02/2023 14:43, Roger Lu (陸瑞傑) wrote:
> Hi Matthias Sir,
> 
> On Tue, 2023-01-31 at 13:59 +0100, Matthias Brugger wrote:
>>
>> On 11/01/2023 08:45, Roger Lu wrote:
>>> From: Ricardo Ribalda <ribalda@chromium.org>
>>>
>>> If the system does not come from reset (like when is booted via
>>> kexec(), the peripheral might trigger an IRQ before the data structures
>>> are initialized.
>>>
>>> Fixes:
>>>
>>> [    0.227710] Unable to handle kernel NULL pointer dereference at virtual
>>> address 0000000000000f08
>>> [    0.227913] Call trace:
>>> [    0.227918]  svs_isr+0x8c/0x538
>>>
>>
>> This patch is different from
>> https://lore.kernel.org/r/20221127-mtk-svs-v2-0-145b07663ea8@chromium.org
>>
>> If you think the patch from Ricardo is wrong, then you should have mentioned
>> that in the review.
> 
> My bad. Ricardo's patch is correct. Moving platform_get_irq() brings no
> functional change and is for helping the svs probe readability as my preference.
> 

Thanks for the confirmation!

Regards,
Matthias

>>
>> Regards,
>> Matthias
>>
>>> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
>>> ---
>>>    drivers/soc/mediatek/mtk-svs.c | 28 ++++++++++++++--------------
>>>    1 file changed, 14 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
>>> index a803b92afc3d..64d4d03ab71c 100644
>>> --- a/drivers/soc/mediatek/mtk-svs.c
>>> +++ b/drivers/soc/mediatek/mtk-svs.c
>>> @@ -2403,20 +2403,6 @@ static int svs_probe(struct platform_device *pdev)
>>>    		goto svs_probe_free_resource;
>>>    	}
>>>    
>>> -	svsp_irq = platform_get_irq(pdev, 0);
>>> -	if (svsp_irq < 0) {
>>> -		ret = svsp_irq;
>>> -		goto svs_probe_free_resource;
>>> -	}
>>> -
>>> -	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
>>> -					IRQF_ONESHOT, svsp->name, svsp);
>>> -	if (ret) {
>>> -		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
>>> -			svsp_irq, ret);
>>> -		goto svs_probe_free_resource;
>>> -	}
>>> -
>>>    	svsp->main_clk = devm_clk_get(svsp->dev, "main");
>>>    	if (IS_ERR(svsp->main_clk)) {
>>>    		dev_err(svsp->dev, "failed to get clock: %ld\n",
>>> @@ -2438,6 +2424,20 @@ static int svs_probe(struct platform_device *pdev)
>>>    		goto svs_probe_clk_disable;
>>>    	}
>>>    
>>> +	svsp_irq = platform_get_irq(pdev, 0);
>>> +	if (svsp_irq < 0) {
>>> +		ret = svsp_irq;
>>> +		goto svs_probe_iounmap;
>>> +	}
>>> +
>>> +	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
>>> +					IRQF_ONESHOT, svsp->name, svsp);
>>> +	if (ret) {
>>> +		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
>>> +			svsp_irq, ret);
>>> +		goto svs_probe_iounmap;
>>> +	}
>>> +
>>>    	ret = svs_start(svsp);
>>>    	if (ret) {
>>>    		dev_err(svsp->dev, "svs start fail: %d\n", ret);

