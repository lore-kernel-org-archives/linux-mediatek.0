Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9C2C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFAsoCM7lTTy8pzMkhBP/3Y7R7BLbBDpiacpk1e+svk=; b=1CoDOHNwOzU40MwTs2RftlfG/d
	9RNRXGX7HzbC0MflwoDdL7Pc8n30/93PBvx4BuikwcpWaCKkmaWaEuDxlwpC2HShkFbvUxUvSxcz7
	nP4FKE4HIRcQhPukb0rdYByYgNhwOVaeCj524hmS0vLILxiSuWy2OlBOuqUoXO8sjNL33xaQUWn0M
	kQi39pmMTnr3+kmrkx3LKS83R7GSo/WkEsFIzhV9JK3yzdxzgKKXSWWVrAp3GBfdskX2L9srUJfqm
	iHUxIUwdk+DBOo9ASPpoFXZwsfcG8oOckkQSjXSnGsTLu9YZiAKuO9zm2aaUE/YKiWcpWVjbIKKNG
	jI0Lq9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGE3-0032Qx-BU; Tue, 24 Jan 2023 10:08:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGDp-0032MA-6Q
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 10:08:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id o17-20020a05600c511100b003db021ef437so10508590wms.4
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 02:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BFAsoCM7lTTy8pzMkhBP/3Y7R7BLbBDpiacpk1e+svk=;
        b=zbc1Kh29haSWpTL482axZTwaQ+BCuuBVWHm9Wm9CefPtdVb2/WcPKQtJBGwMv8h1Xa
         Uu3j/8TozWnXngaG9EMppKbhb+OEJAx2cDFrbg/7y9Apf3rS0ImEdwsm/sQ2qEPKbPY/
         g5VdPz5btDNmrLcJsNN39oIPiUWQWPqMqR4HmfMtKZVrUEsJNAYyYB7VPDWlA4RZyGlj
         RSOf1frU64pubP9yex7qfz6s5oKkc9G36D/M/6370N4aSnqEDDbxsgwFeDlpXeMHcZ1t
         tMSzZcOvNm6JIKGPVWLu2QTY8+TQV51tFYQV2t4z7lyzacaDeZmajykwGoSJkI8DBgYD
         lRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFAsoCM7lTTy8pzMkhBP/3Y7R7BLbBDpiacpk1e+svk=;
        b=pXZ4WD00AUA9sJESq/Bde9Rx6w4DmjL9H25i8nZSfNEyMIFEG1qbdB/loyyPSiFEZ0
         blCAynEMJ0BlmvTUCN9qa8e0Lueq0DfyGOmc9/6PYVQCh1dcqBwh8LV/eZ0PKaa96Vvj
         HqfcdYO0+j38ydNsH7ftHL+JyHrJzAlP1me0BqOkeAITb7oMRX4zOiFFo/9zQaihBRr+
         aR6xIHsvIdmOR6FnS/hcFIKLES0jYwHEp7ESHSTJ5BvXfVJvAPmg8K37pJvU4nL6rjFD
         X8kkFvG0QOqMrY5Lx91ImZOBxCMOezItMQVNYT66jxHp5M31JWCddkQGVBcvEMbYY+ep
         ujZw==
X-Gm-Message-State: AFqh2kpnah8C/BihEUcb0xW14gFg1TLPd0H5ujlBLycjwZLHGtrwdCG7
	asrbmJ9J5rID8yoAVIKDXmZzL21Tzxvy3mIm
X-Google-Smtp-Source: AMrXdXtnSVR3GOqGkK+I/1saZYRYhFvhUquzJUpk3lftfHhjGUEtOPza9mC7F8QU6s/MYeXc3UoNng==
X-Received: by 2002:a05:600c:3556:b0:3db:331b:bd2d with SMTP id i22-20020a05600c355600b003db331bbd2dmr15705410wmq.18.1674554886768;
        Tue, 24 Jan 2023 02:08:06 -0800 (PST)
Received: from [192.168.99.137] ([95.178.111.30])
        by smtp.gmail.com with ESMTPSA id az41-20020a05600c602900b003dab77aa911sm13183099wmb.23.2023.01.24.02.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 02:08:06 -0800 (PST)
Message-ID: <d3daece0-ed23-fae7-9bc8-c6e53b84e8e7@baylibre.com>
Date: Tue, 24 Jan 2023 11:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Michael Kao <michael.kao@mediatek.com>,
 linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
 <20221018-up-i350-thermal-bringup-v7-4-ebf08ff2eddb@baylibre.com>
 <4121bb6b-30db-7a23-f4c8-40afdda7a0b5@linaro.org>
 <COTTJX635TNF.1WL2TEZN7VW9O@amjad-ThinkPad-T490>
 <adfe41f7-00e5-876b-7803-3127919fba13@linaro.org>
 <COUMF3IZ9Y63.LA3KFHJSUZIC@amjad-ThinkPad-T490>
 <0644aede-c281-3919-50e0-4466f6587d81@linaro.org>
 <187b0fe1-1f14-d8b8-c827-1e824da0b1d3@baylibre.com>
Content-Language: en-US
In-Reply-To: <187b0fe1-1f14-d8b8-c827-1e824da0b1d3@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_020809_260804_588C1247 
X-CRM114-Status: GOOD (  26.96  )
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

Hi Daniel,

On 1/19/23 18:03, Amjad Ouled-Ameur wrote:
> Hi Daniel,
>
> On 12/29/22 16:49, Daniel Lezcano wrote:
>> On 06/12/2022 10:18, Amjad Ouled-Ameur wrote:
>>> Hi Daniel,
>>> On Mon Dec 5, 2022 at 8:39 PM CET, Daniel Lezcano wrote:
>>>>
>>>> Hi Amjad,
>>>>
>>>>
>>>> On 05/12/2022 11:41, Amjad Ouled-Ameur wrote:
>>>>
>>>> [ ... ]
>>>>
>>>>>>> @@ -1161,11 +1197,24 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>>>>>>             platform_set_drvdata(pdev, mt);
>>>>>>>     -    tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
>>>>>>> -                          &mtk_thermal_ops);
>>>>>>> -    if (IS_ERR(tzdev)) {
>>>>>>> -        ret = PTR_ERR(tzdev);
>>>>>>> -        goto err_disable_clk_peri_therm;
>>>>>>> +    for (i = 0; i < mt->conf->num_sensors + 1; i++) {
>>>>>>> +        tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
>>>>>>> +        if (!tz)
>>>>>>> +            return -ENOMEM;
>>>>>>> +
>>>>>>> +        tz->mt = mt;
>>>>>>> +        tz->id = i;
>>>>>>> +
>>>>>>> +        tzdev = devm_thermal_of_zone_register(&pdev->dev, i, tz, (i == 0) ?
>>>>>>> +                                 &mtk_thermal_ops :
>>>>>>> + &mtk_thermal_sensor_ops);
>>>>>>
>>>>>> Here you use again the aggregation
>>>>> I addressed this concern in V6, could you please take a look and let me
>>>>> know what you think [0].
>>>>>
>>>>> [0]: https://lore.kernel.org/all/5eb0cdc2-e9f9-dd42-bf80-b7dcd8bcc196@baylibre.com/
>>>>
>>>> May I misunderstanding but AFAICS, this patch is setting the
>>>> mtk_thermal_ops if the sensor id is zero. The get_temp is computing the
>>>> max temperature in this ops which is what we don't want to do.
>>>
>>> Correct, but I think that is out of scope of this patchset, as the current
>>> driver already uses mtk_thermal_ops for sensor 0. The focus of this patchset
>>> is to add support for the other sensors.
>>>
>>> Besides, what do you suggest as a clean implementation if the current one
>>> no longer meets thermal core requirements ?
>>
>> IIUC, there is a sensor per couple of cores. 1 x 2Bigs, 1 x 2Bigs, 1 x 4 Little, right ?
>
> MT8365 SoC has 4 x A53 CPUs. The SoC has 4 thermal zones per sensor. Thermal zone 0 corresponds
>
> to all 4 x A53 CPUs, the other thermal zones (1, 2 and 3) has nothing to do with CPUs. The cooling device type
>
> used for CPUs is passive. FYI, thermal zones 1, 2 and 3 are present in the SoC for debug-purpose only, they are not supposed
>
> to be used for production.
>
After reconsidering the fact that zones 1, 2 and 3 are only used for dev/debug, it might be best to avoid

aggregation as you suggested, and keep only support for zone 0 in this driver. Thus I suggest I send a V8

where I keep only below fixes for this patch if that's okay with you:

- Define "raw_to_mcelsius" function pointer for "struct thermal_bank_cfg".

- Fix "mtk_thermal" variable in mtk_read_temp().

- Set "mt->raw_to_mcelsius" in probe().


For zones 1, 2 and 3 we can later add a different driver specific for dev/debug to probe them to

avoid confusion.


Regards,

Amjad

>
> Regards,
>
> Amjad
>
>>
>> If it is the case, then a thermal zone per sensor with the trip points and a cooling device for each of them.
>>
>> The two thermal zones for the big will share the same cooling device. The little thermal zone will have its own cooling device.
>>
>> If there is the GPU, then its own cooling device also with devfreq.
>>
>>
>>>> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>>>>
>>>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>>>> <http://twitter.com/#!/linaroorg> Twitter |
>>>> <http://www.linaro.org/linaro-blog/> Blog
>>>
>>

