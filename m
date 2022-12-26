Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227ACC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KALJq/V5r25unN7gpBUsW9CyIRW7TsaG7eOK1RtrxG4=; b=Z/fxUaqo2exOlnJ0sff30JdvwT
	mip1AbG0BtBmlzf3hHZeRAhyknwWAKhZmHgx87kaaCEtIR5o9xu6UqdL4DvHGwEGLLKDis6WcBmq0
	htzr/7l/Xn07JUXHMG3oq4iohkNu+sMonB5gYA/lhsOYswO8odpAmLiZ2qHnbE7CRqcMttABDNOzt
	QQxzUdhWbcpi6lB9+Ke+GU4r2gAwEIkoPLA8w7RLNafyaCT1ECukGUCzHPiFyYkg0bR6cg0YssgH1
	+U4OyoOQ+f3Hy38aEDNnKp3S+S+w7ilrXr4VyDCyNWnenSAZphrLka6Z0wO+ovdipjtMXidqXoQ2I
	fbQD61rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9khy-003BI4-Js; Mon, 26 Dec 2022 10:27:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9khn-003BA1-5x
	for linux-mediatek@lists.infradead.org; Mon, 26 Dec 2022 10:27:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id o15so7331729wmr.4
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Dec 2022 02:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KALJq/V5r25unN7gpBUsW9CyIRW7TsaG7eOK1RtrxG4=;
        b=XzoOX9nL0mKaY5BM2p/ifqJKZH4E/8KMeSnguCGzpxWpEBvgYTmiK+K1kVTtCCt5ux
         OyeIMNGwB/MHMmzj4+0bTPPRaXqZJYUtFh8+g3Int9c4AnhoS6LOwB4zNkd40tvX2IFm
         D07fTPm/juu0sQOmHMoKo96EpBDk9YKJJTvnEa6MUGtyvlTJMFtHsV2ezn3fhkfhVAEv
         uQwMrri1uBw4vqyHiz5Mn38wOqmP/b8UtUC0vynz3Y5gGeG9nVIScx+Zy+rAMPzDeu3e
         /FQ4P4KDt9S1O2HqkspgszzZSn5be/Vush6RLNcG+RoOwUGv9MPa0k9fB79P+aPZSb6W
         aZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KALJq/V5r25unN7gpBUsW9CyIRW7TsaG7eOK1RtrxG4=;
        b=np1t6QIsVflrhivYLZQ+i7/Tm7aIoOfmlCoL93z8GGKsG5MEbPTBsaYi+MNTLWg48V
         orVrsTPRlcwen1peoAb6xWqpSatnLxSIlWSLRjdSXr3q7K6+nZzr+/QQuiHACq+MgVhT
         +zPEzc3GEJZzK+hd1Oh9RapnnTNwv3MHYkUBsUx5lNbCveZaBGpaNNlb3A4DI0QWBH28
         n4We6ukndgWH576vpQZSB6sDFIxdUZtqA2aBLbZWPpDv4gCL89bDEK7gtzqrnMNriQjT
         TscdrFg5v4+IBNIiI5JpMktuj5SAAszo0e9VfFmPBl9EUV5EnlaBxDV0SkO98nO3ZA6r
         XesA==
X-Gm-Message-State: AFqh2krj0ongdNCJgfC3i/yxqM6Di8luNigzhTzE1RfXhkpUlq1GFmpe
	L9I8tCP4zf+GTfPtIcwBzYlaZw==
X-Google-Smtp-Source: AMrXdXvPOLaWe2a9phpQit63w0mHUGY18F/dL/xLYS/XbGC0BC2+uZqL8drVpMoEOVKN6hV2HSTLSQ==
X-Received: by 2002:a05:600c:3209:b0:3cf:5fd2:87a0 with SMTP id r9-20020a05600c320900b003cf5fd287a0mr12566712wmp.40.1672050455288;
        Mon, 26 Dec 2022 02:27:35 -0800 (PST)
Received: from [192.168.0.20] (117.215.132.195.rev.sfr.net. [195.132.215.117])
        by smtp.gmail.com with ESMTPSA id l17-20020adfe9d1000000b0024165454262sm9841286wrn.11.2022.12.26.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 02:27:34 -0800 (PST)
Message-ID: <fa6ec5ae-3c09-6a8d-b6bd-46fbdfcb4f26@baylibre.com>
Date: Mon, 26 Dec 2022 11:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
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
Content-Language: en-US
In-Reply-To: <COUMF3IZ9Y63.LA3KFHJSUZIC@amjad-ThinkPad-T490>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_022739_242601_1A2118C1 
X-CRM114-Status: GOOD (  20.21  )
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

On 12/6/22 10:18, Amjad Ouled-Ameur wrote:
> Hi Daniel,
> On Mon Dec 5, 2022 at 8:39 PM CET, Daniel Lezcano wrote:
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
>>>> Here you use again the aggregation
>>> I addressed this concern in V6, could you please take a look and let me
>>> know what you think [0].
>>>
>>> [0]: https://lore.kernel.org/all/5eb0cdc2-e9f9-dd42-bf80-b7dcd8bcc196@baylibre.com/
>> May I misunderstanding but AFAICS, this patch is setting the
>> mtk_thermal_ops if the sensor id is zero. The get_temp is computing the
>> max temperature in this ops which is what we don't want to do.
> Correct, but I think that is out of scope of this patchset, as the current
> driver already uses mtk_thermal_ops for sensor 0. The focus of this patchset
> is to add support for the other sensors.
>
> Besides, what do you suggest as a clean implementation if the current one
> no longer meets thermal core requirements ?

Could you please address this ?


Kindly,

Amjad

> Regards,
> Amjad
>>
>> -- 
>> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
>>
>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>> <http://twitter.com/#!/linaroorg> Twitter |
>> <http://www.linaro.org/linaro-blog/> Blog

