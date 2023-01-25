Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F264C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbhZrnM6mfd46f2wkH2U150cOFArpKuhN8vLZPnu2Us=; b=yYHGIYdHO9MGV8ZBXPya7CRLLP
	jzMccIoEZczxhZTlDezspHK9vown3BUE3dU8BE5zWvMclPjwgHw/tg39zQ/RNIQV9T+7HAr+dRk9c
	9KzE2JcFp4p3r8iJJ6v0PQBFGtrQQLCoJB4zP679uCdcPImNdChBVBsRLhZs8yl3KaphbyMur8+Vr
	NDULvI00L76+WDTUYeEckwK3RlJNgqF3L2xqIvHrBVi8MlnvACTAYlf7irzB0xDbJehb+knHlXKG3
	B2XA/Jzztd4v5dNqN5fRuwHZjPmJMZeLZx4DO86dkyd0Yt81b2meY1hJevNxm7GwMJvK1oRJuKO/P
	I/Jhz4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKd0U-006vOz-14; Wed, 25 Jan 2023 10:27:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKd0G-006vL9-2x
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 10:27:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so938452wmq.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 02:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbhZrnM6mfd46f2wkH2U150cOFArpKuhN8vLZPnu2Us=;
        b=um5KOEmxDtoPoQAuc6NgwIwqE8E1tsVOuA0r8VIa7+DumXxQtmSODovV+CiWvssSAO
         9pFKV49mNWSV2GLWaxePW8JQ1hcWi6x9i48WKtC9IQc3f6hJFGm3c6nZ1Xls0bAqTdRM
         P9ttNuD5a1MCoW0sDzfgAEHCB/PrFxbxg6Soox0xHNGH0490IIV3EPLq9qaM0WhjSYtQ
         jnuI8RLeCOhFOw//quyNHE5KDEojkI3/RyuzR45dIkOpOHlXAy8QnYxjj/l3uuZWTEGD
         SvYLrMTVhIBeGaSCj/YxFruHJXBOnrdalv27w6zKsfvmszt33rDLo1W1yPUlSx7cojMH
         b5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbhZrnM6mfd46f2wkH2U150cOFArpKuhN8vLZPnu2Us=;
        b=QrT4paNMrYv1PDSr11aMbFQH0lqopCdFR13n4PJu75PYp44nJ2oTHHHoeQ7sN0K9eT
         iuAHMHkRT99GPWFytXqLu6Xf1r6wfUnLL4a/n3X0Ljwf+oxYEdmCxR/z7pMlXlVp8lsW
         sYi/sItXjI4Clo4Q2maKSZg/XK0309pA9n7lf+AFxE9+fEZf//w3luwV4/VPIUFRyFEX
         5/jWO+zQZleNlTQOKscpBB3jz/SQjojFRZCm943HEYg9IlcvGzvYzr2cbZxhSJJQuTox
         SsgJi/3+exvFZyrHsfQaQAkgLRHrYoPnxfrOzu4mF0XXiH8qz5Vh9R2bIfZlpEroOS0f
         XeVw==
X-Gm-Message-State: AFqh2kqKbZYAjC8EgaJypjBKfHirkl3BEAcbe9eBHwkLR6MqNrO0xSI+
	R9rxSZzDA/KhXQ+UqRO9ySJ44A==
X-Google-Smtp-Source: AMrXdXtKgy48rz00UMBhwP0Nzrp1Xhd4qMKtvxDVpA8TgtfNn+bybvxaGr2VyhrpXFYGmHRqTI7v3Q==
X-Received: by 2002:a05:600c:601c:b0:3d9:ee01:60a4 with SMTP id az28-20020a05600c601c00b003d9ee0160a4mr31527635wmb.1.1674642456074;
        Wed, 25 Jan 2023 02:27:36 -0800 (PST)
Received: from [192.168.0.20] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.gmail.com with ESMTPSA id g9-20020adff3c9000000b002bfb29d19e4sm3202470wrp.88.2023.01.25.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 02:27:35 -0800 (PST)
Message-ID: <8d9c51c8-8271-51de-a02c-4e44668be692@baylibre.com>
Date: Wed, 25 Jan 2023 11:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
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
 <d3daece0-ed23-fae7-9bc8-c6e53b84e8e7@baylibre.com>
 <9f9547a2-69dd-f91d-c587-289156bf9d55@linaro.org>
 <2950b824-ad2f-2579-a956-a03d157453eb@baylibre.com>
 <c1fad818-1858-2e81-84fd-03cfb54d8938@linaro.org>
 <0b5e3a14-fd23-4646-d4cb-df255eb8fa20@baylibre.com>
 <0df50d0f-de3a-a2be-9363-2b3c65599f96@linaro.org>
Content-Language: en-US
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <0df50d0f-de3a-a2be-9363-2b3c65599f96@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_022740_153331_F8C00D48 
X-CRM114-Status: GOOD (  27.80  )
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


On 1/25/23 11:02, Daniel Lezcano wrote:
> On 24/01/2023 23:27, Amjad Ouled-Ameur wrote:
>>
>> On 1/24/23 18:55, Daniel Lezcano wrote:
>>> On 24/01/2023 18:46, Amjad Ouled-Ameur wrote:
>>>>
>>>> On 1/24/23 17:54, Daniel Lezcano wrote:
>>>>>
>>>>> Hi Amjad,
>>>>>
>>>>> On 24/01/2023 11:08, Amjad Ouled-Ameur wrote:
>>>>>
>>>>> [ ... ]
>>>>>
>>>>>>>>
>>>>>>>> IIUC, there is a sensor per couple of cores. 1 x 2Bigs, 1 x 2Bigs, 1 x 4 Little, right ?
>>>>>>>
>>>>>>> MT8365 SoC has 4 x A53 CPUs. The SoC has 4 thermal zones per sensor. Thermal zone 0 corresponds
>>>>>>>
>>>>>>> to all 4 x A53 CPUs, the other thermal zones (1, 2 and 3) has nothing to do with CPUs. The cooling device type
>>>>>>>
>>>>>>> used for CPUs is passive. FYI, thermal zones 1, 2 and 3 are present in the SoC for debug-purpose only, they are not supposed
>>>>>>>
>>>>>>> to be used for production.
>>>>>>>
>>>>>> After reconsidering the fact that zones 1, 2 and 3 are only used for dev/debug, it might be best to avo >
>>>>>> aggregation as you suggested, and keep only support for zone 0 in this driver. Thus I suggest I send a V8
>>>>>>
>>>>>> where I keep only below fixes for this patch if that's okay with you:
>>>>>>
>>>>>> - Define "raw_to_mcelsius" function pointer for "struct thermal_bank_cfg".
>>>>>>
>>>>>> - Fix "mtk_thermal" variable in mtk_read_temp().
>>>>>>
>>>>>> - Set "mt->raw_to_mcelsius" in probe().
>>>>>>
>>>>>>
>>>>>> For zones 1, 2 and 3 we can later add a different driver specific for dev/debug to probe them to
>>>>>>
>>>>>> avoid confusion.
>>>>>
>>>>> You can add them in the driver and in the device tree, but just add the cooling device for the thermal zone 0.
>>>>
>>>> Thermal zone 0 uses CPU{0..3} for passive cooling, in this case we should register cooling device with
>>>>
>>>> cpufreq_cooling_register() for each CPU right ?
>>>
>>> No, the OF code device tree does already that. You just have to register the different thermal zones.
>>>
>>> Do you have a pointer to a device tree for this board and the thermal setup ?
>>
>> Sure, here is a dtsi for MT8365 SoC which contains thermal nodes [0].
>
> From my POV, there are two different setup with the DT but only one implementation with the driver.
>
> The driver should register all the thermal zones for each CPUs. For that, make things nice with the defines for the dt-bindings like [1].
>
> Then the device tree:
>
> setup1:
>
> Describe all the thermal zones in the DT which will be similar to [2]. Each CPU has a thermal zone, trip points and the same cooling device.
>
> The first thermal zone reaching the trip temperature threshold will start the mitigation. The thermal framework takes care of multiple thermal zones sharing the same cooling device.
>
> The result will be the same as the max temperature aggregation you did previously.
>
> setup2:
>
> Describe all the thermal zones in the DT [3], but add the cooling device only on the sensor you are interested in mitigating.
>
>
> And finally, if the sensors should be used to describe a kind of temperature gradient, a linear equation could be used but that is not implemented yet in the thermal framework.
>
> Hope that helps
>
Thank you Daniel for the thorough insights.

FYI, MT8195 SoC you referred to has a different thermal architecture and sensor mapping than on MT8365. The latter has only one

useful thermal zone corresponding to 4 CPUs at once. The other 3 thermal zones have no real purpose and will probably

not be defined in dtsi. Thus I sent a V8 of this series to keep only support for thermal zone 0 of interest.

Kindly,

Amjad

>   -- Daniel
>
> [1] https://lore.kernel.org/linux-arm-kernel/5dd5c795-5e67-146d-7132-30fc90171d4c@collabora.com/T/#Z2e.:..:20230124131717.128660-3-bchihi::40baylibre.com:1include:dt-bindings:thermal:mediatek-lvts.h
>
> [2] https://lore.kernel.org/linux-arm-kernel/5dd5c795-5e67-146d-7132-30fc90171d4c@collabora.com/T/#m303240c4da71f6f37831e5d1b6f3da771ae8dd90
>
> [3] https://lore.kernel.org/linux-arm-kernel/5dd5c795-5e67-146d-7132-30fc90171d4c@collabora.com/T/#Z2e.:..:20230124131717.128660-6-bchihi::40baylibre.com:1arch:arm64:boot:dts:mediatek:mt8195.dtsi
>
>

