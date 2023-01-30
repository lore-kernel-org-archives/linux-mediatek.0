Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FC7C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcsOz5l4A5Qt9G01n1NrnH84MH1IPjpME7/fhI2iF0g=; b=nQjSE95iWl56xYzK9df0je3feF
	LLKNgejADEMxLKPJaoXdfYpnQ4rzm1Ogos7y+aE866VF0pY+iG+zisSkgx2Rn0F/7qACwo/fxjiT3
	gEUjZpF3n+k5DkF76naGGSgHJ3t17xEhjMORpS7eRfGXyHYJA+Wk28V9kJNi/Y2a0uMC3Vnb9b9F8
	5UDpy8aRDITIhdsKPUAlHGZkA1HGQP6Jhw8bu5R30aKytbcQfvnHwtwlvDU2ebYI6+ik/3pSFx7cM
	EW/HbvY7+ppHnpC6RKCK8g2Q3U+MAMKzzrk4QyW5rC8WBwG4DJpSOJVMK/N9WKDpo6Pb0zWamUYnY
	yK6xW4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWhk-004A9E-Un; Mon, 30 Jan 2023 16:08:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWgW-0049xZ-GG; Mon, 30 Jan 2023 16:07:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so8536987wms.2;
        Mon, 30 Jan 2023 08:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcsOz5l4A5Qt9G01n1NrnH84MH1IPjpME7/fhI2iF0g=;
        b=eSYigaYKAbXI+/QTBx97k8BcDabnYfa4okz2cD3wMfgS1LwSZlwoIJXQQga0Yq6Tze
         pD6ECEV0TbsEkuVqQdBvsFlaM4maHbPpPRAJCU7/6FoczqqVNmLzVOuTmDMHYcNWP7zE
         93wAqq0h0BiRamVPbOVAUyTn6fOr1nu09Ym3FnEcI0wAVTHbPeQOj9i0vMRsLOlsQkup
         oBuy5KjMp6GferCoa4LIfB6hAKRk+ygm33FOGIcvCbkiA0MM8qVicG6B4tctta7QJWFk
         9iJ2gfoMRjmHpTPVtdMe+RHbqJAA9nCUx47EzWa443vmNt/JVLx7g4Weot6oxrc5XCSn
         yGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcsOz5l4A5Qt9G01n1NrnH84MH1IPjpME7/fhI2iF0g=;
        b=1rMlA/zFjgu/f4QszqY+W59hjTfPKXpRpsUfz/YUQ14A4wAiRCu4gwgh6d27z01tL+
         vH4RPFewGpCdSub8yMF1OGjo2+UWtMB2/vl7Ye0oUawTOLcR2sPPz4bWu9Q2wvexjVZ9
         +2wmJjPGumo7gsWP6pwFKeu/feW+sPi6tJbQEplk0ZA3Bb5EJn8kFIk3oagPJ/0J4sCY
         ZsGkr+qzK0gPHjFKPfPLsNrjjCe5ovvxAiSKySyxg8fP3kivucLLyzt5VtFqlvh5I1GB
         12zegM4u6YWsxtjLOghZyPpShu4dh4K0tCfbiD6R/uC+/6WXFCKONuUpjCgwgIg4pUsR
         VqgQ==
X-Gm-Message-State: AFqh2krCFU8kVUFduReV3C4K3a/phtDuDSckAnnuQWIk6Hb7nAtj+uqC
	qE4j+ThXJ1jBKCKZSpBoKjY=
X-Google-Smtp-Source: AMrXdXu9HKhEJ2RNPfqy3AnZQ9le/ijXLWlcWwESfIh9wkAl33WqP2J5IwADNa8ByLsmxgSIrJ1SOQ==
X-Received: by 2002:a05:600c:1c2a:b0:3cf:d0b1:8aa1 with SMTP id j42-20020a05600c1c2a00b003cfd0b18aa1mr48413698wms.0.1675094823720;
        Mon, 30 Jan 2023 08:07:03 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id ay6-20020a05600c1e0600b003db00747fdesm16752584wmb.15.2023.01.30.08.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 08:07:03 -0800 (PST)
Message-ID: <736e2cc3-4c30-56eb-929f-145437044ade@gmail.com>
Date: Mon, 30 Jan 2023 17:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-3-bchihi@baylibre.com>
 <20230126161048.94089-1-bchihi@baylibre.com>
 <5ec49108-6ad8-daf7-54ec-104f0923a31d@linaro.org>
 <CAGuA+opQboxH8qoNv4GG+raX=ZZAyRVLC9VLjVCzbT_cUQWWTA@mail.gmail.com>
 <b4bec164-5986-718e-b9cc-290dfc995edb@gmail.com>
 <CAGuA+ooSK-rzeqbFoTX3Bnnp_TH=0Uiu7Nxs_1YiTiKK4w5qtw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGuA+ooSK-rzeqbFoTX3Bnnp_TH=0Uiu7Nxs_1YiTiKK4w5qtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_080708_580625_750F7919 
X-CRM114-Status: GOOD (  18.00  )
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



On 30/01/2023 13:19, Balsam CHIHI wrote:
> Hi Matthias,
> 
> On Mon, Jan 30, 2023 at 12:18 PM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 30/01/2023 11:40, Balsam CHIHI wrote:
>>> Hi Krzysztof,
>>>
>>> Thank you for the feedback.
>>>
>>> On Sat, Jan 28, 2023 at 11:48 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 26/01/2023 17:10, bchihi@baylibre.com wrote:
>>>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>>>
>>>>> Add LVTS thermal controllers dt-binding definition for mt8195.
>>>>
>>>> Subject: drop second/last, redundant "dt-binding definition". The
>>>> "dt-bindings" prefix is already stating that these are bindings.
>>>
>>> fixed.
>>> The patch title has been fixed as you suggested :
>>> "dt-bindings: thermal: mediatek: Add LVTS thermal controllers"
>>>
>>>>
>>>> Plus two comments at the end.
>>>>
>>>>>
>>>>> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>>>>> ---
>>>>> Changelog:
>>>>>     v12:
>>>>>        - Fixed subject prefix
>>>>>        - Fixed licences GPL-2.0+ to GPL-2.0
>>>>>        - Added dual licenses
>>>>
>>>>
>>>>> +    };
>>>>> diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
>>>>> new file mode 100644
>>>>> index 000000000000..902d5b1e4f43
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/thermal/mediatek-lvts.h
>>>>
>>>> Same filename as bindings.
>>>
>>> fixed.
>>> rename :
>>> include/dt-bindings/thermal/mediatek-lvts.h =>
>>> include/dt-bindings/thermal/mediatek-lvts-thermal.h
>>>
>>
>> I think it should be
>> include/dt-bindings/thermal/mediatek,lvts-thermal.yaml
> 
> OK,
> I will change it like that.
> (".h" and not ".yaml" I believe (just to be sure).).
> 

Yes sure, .h. Sorry for the confusion.

Regards,
Matthias

>>
>> Regards,
>> Matthias
>>
>>>>
>>>>> @@ -0,0 +1,19 @@
>>>>> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
>>>>
>>>> Although this is correct, any reason why not using exactly the same
>>>> license as bindings?
>>>
>>> fixed.
>>> both files are now using the same license :
>>> "SPDX-License-Identifier: (GPL-2.0 or MIT)"
>>>
>>>>
>>>>> +/*
>>>>> + * Copyright (c) 2023 MediaTek Inc.
>>>>> + * Author: Balsam CHIHI <bchihi@baylibre.com>
>>>>> + */
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> I'll send the changes soon.
>>>
>>> Best regards,
>>> Balsam
> 
> Best regards,
> Balsam

