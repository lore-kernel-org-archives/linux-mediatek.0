Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D59C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcHD+68JKivFTNKn8cO/CBcZZAARu6aqYEBF3jaYXXY=; b=FWwX4MvMplvRXPNrxv4rq7F91H
	vW4EVpPxqdxqSJ0aJBgU7RY3jtYsd3Jg36opvVgCpSSuHIbj5E2KPJhr5iNMaqJUJ7+8KgYlbJFOS
	jkpsbYIxaoKv3n0IU/xXo7T18/wRjDzGpKWJNX28IihgP7FNfSawL0JgFDVtSq6EnJIhiiooU4qq/
	WOYIEq6XDcYLJk0eLLnrv32K16HOufq6Z5z4J277MF9CTYV3YfSjxeqWYO957zP1pXF5r6wJ6VrPu
	cuGU4uwTyff0Q2EUX4cZOE9nr42DbUPk4AbzMhYvHbkGFEzUwlMurItoSHKwuOHoNdb+3xru9MFVf
	yW+ViVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAv9x-00HA4f-3B; Thu, 29 Dec 2022 15:49:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAv9j-00HA0U-OI
	for linux-mediatek@lists.infradead.org; Thu, 29 Dec 2022 15:49:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso11533205wmb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 07:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcHD+68JKivFTNKn8cO/CBcZZAARu6aqYEBF3jaYXXY=;
        b=wov4t/Dp6UbuGwqLvgc4vMkRfInBScyFz5VfMRxkFh9qxszC85YMpmSHny1gXPrVsS
         g32f4reKOVtWQMJ8tXOoxbkRbjZCZ1m5SUTFsEeNVyo3qe4fzbUv7mzyONTfBVWN/ygF
         VCv0lEJwgaS8OQpQtH1AmoCHEbO8WSsmtXkJwQMKbTVyQhOUnzPNh5aURydy23AIStHq
         7IW6dSqOnW/cLTthbtNHuMUuvGcSnsN4MUGA1Z6MgEXnnWMIIXtkOr33tpHLHB4icRu/
         EKo8oFJTgXBFfNfzRgvO95/Kqn05D0Qao4eQAzZ4kyo7nkuPJ1BIRmhp7+wC87dbet08
         SVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcHD+68JKivFTNKn8cO/CBcZZAARu6aqYEBF3jaYXXY=;
        b=o1ujnmpyt9xhVAgw+HNYoSVf4wwOuOlUrVKueLr+/HuYwj634i8vPkt1t1crbwrS3v
         x7nORDZQrgmO7L6D5NMGzruc4O6rqF3SG6FJE80A4nHFurtjft6wvH0HAXzhLAeypWfg
         TWOjbvV6qQ2Ian6DUieurom8kHwfZm0CGu0vn9thhJFGSZ8g3ypSqCrK+bBpvAvGywPq
         mnuWZSalZH8PjKzCPPqiYHN+KUTMNfmQeu505D7QrqXwYZEXgoMjNIYcS8m+fcMYzOrQ
         zK7CClbtjMqpzxLKcAbzM6mtoLynMSa5arMk/H3Xbdu9g8V13O4vtyuiTfM8wurN1qtI
         M+bg==
X-Gm-Message-State: AFqh2kpon8WBPSFICCOV9FAhvI8yDUkjilM4maSJ0HZiw/iFTdbN4TdP
	c1PIVqnRMzWHOvjSaRkQp6/Pjw==
X-Google-Smtp-Source: AMrXdXtGRRh5vsIthQvg5P5kw1KkeD+SE+4wsU583Cr1cJtcHYeGo9tuCyPGsdjApkph9RNzbdVSaQ==
X-Received: by 2002:a05:600c:3b02:b0:3c7:18:b339 with SMTP id m2-20020a05600c3b0200b003c70018b339mr25804533wms.37.1672328955770;
        Thu, 29 Dec 2022 07:49:15 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id d10-20020a05600c3aca00b003d34faca949sm24381530wms.39.2022.12.29.07.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 07:49:15 -0800 (PST)
Message-ID: <0644aede-c281-3919-50e0-4466f6587d81@linaro.org>
Date: Thu, 29 Dec 2022 16:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
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
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <COUMF3IZ9Y63.LA3KFHJSUZIC@amjad-ThinkPad-T490>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_074919_809436_30BB2F2F 
X-CRM114-Status: GOOD (  22.34  )
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

On 06/12/2022 10:18, Amjad Ouled-Ameur wrote:
> Hi Daniel,
> On Mon Dec 5, 2022 at 8:39 PM CET, Daniel Lezcano wrote:
>>
>> Hi Amjad,
>>
>>
>> On 05/12/2022 11:41, Amjad Ouled-Ameur wrote:
>>
>> [ ... ]
>>
>>>>> @@ -1161,11 +1197,24 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>>>>     
>>>>>     	platform_set_drvdata(pdev, mt);
>>>>>     
>>>>> -	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
>>>>> -					      &mtk_thermal_ops);
>>>>> -	if (IS_ERR(tzdev)) {
>>>>> -		ret = PTR_ERR(tzdev);
>>>>> -		goto err_disable_clk_peri_therm;
>>>>> +	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
>>>>> +		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
>>>>> +		if (!tz)
>>>>> +			return -ENOMEM;
>>>>> +
>>>>> +		tz->mt = mt;
>>>>> +		tz->id = i;
>>>>> +
>>>>> +		tzdev = devm_thermal_of_zone_register(&pdev->dev, i, tz, (i == 0) ?
>>>>> +							     &mtk_thermal_ops :
>>>>> +							     &mtk_thermal_sensor_ops);
>>>>
>>>> Here you use again the aggregation
>>> I addressed this concern in V6, could you please take a look and let me
>>> know what you think [0].
>>>
>>> [0]: https://lore.kernel.org/all/5eb0cdc2-e9f9-dd42-bf80-b7dcd8bcc196@baylibre.com/
>>
>> May I misunderstanding but AFAICS, this patch is setting the
>> mtk_thermal_ops if the sensor id is zero. The get_temp is computing the
>> max temperature in this ops which is what we don't want to do.
> 
> Correct, but I think that is out of scope of this patchset, as the current
> driver already uses mtk_thermal_ops for sensor 0. The focus of this patchset
> is to add support for the other sensors.
> 
> Besides, what do you suggest as a clean implementation if the current one
> no longer meets thermal core requirements ?

IIUC, there is a sensor per couple of cores. 1 x 2Bigs, 1 x 2Bigs, 1 x 4 
Little, right ?

If it is the case, then a thermal zone per sensor with the trip points 
and a cooling device for each of them.

The two thermal zones for the big will share the same cooling device. 
The little thermal zone will have its own cooling device.

If there is the GPU, then its own cooling device also with devfreq.


>> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>>
>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>> <http://twitter.com/#!/linaroorg> Twitter |
>> <http://www.linaro.org/linaro-blog/> Blog
> 

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


