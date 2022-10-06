Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BE4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzBoGlicy3cr5i7Md3OkU8BP9DCvHUCzxRYJ1FITrS8=; b=B9FzYqzeLKTNDczaL/UJ9x93N+
	Q7b1WvmeplLsTAfXt6GHbfuDFlR6rZqq7dNkOF3alEzFFje3XKIWh6bpSu6NAcmifoSIMdy3zCmoI
	f7O87/OJtXFad1K+Yv1VBwMsDJST8PV8z/BjVcZlobHygX9ZHPUhtGqqTK6fnb1oj4Dm6gtiDqI2y
	PqM73SxgZXyOra8boaX6E3VLeCPAqIbOsY0hIXvT9vn6zGiK1mrYN6DUDHeKiSvHuu0AF7SgRJV7p
	aFKzrJ2coye516+E0cOQJl3Xa/vEgm6plBH+p1xjqI43/5QW/x35iwc2LHbzzVYJkJAKEK/WORa1Q
	iRL0odiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogP4S-001srE-DW; Thu, 06 Oct 2022 11:29:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogP4H-001sow-HN
	for linux-mediatek@lists.infradead.org; Thu, 06 Oct 2022 11:29:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso2638203wmc.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Oct 2022 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzBoGlicy3cr5i7Md3OkU8BP9DCvHUCzxRYJ1FITrS8=;
        b=PQPhGGy4X0icS+0U2DZWL+y2oAC8x7qKbdkkA8xEaHD3BL5dHEE+JwcqqDAN1nKEAO
         iz50hZZshHS2CkDbAX3jyQYCov8MtfjxhvS29p4BSpiBCu1MYV4oxOig32UDIuw2/P5W
         jBqZkOhr/2gkwBeIKYx+Ce2HnOT9B4O3eWiICLHSmijTi29KmqUmCqP8anx6cfD66PZc
         NGfcAePJARl7raC0L/ok/65qFgVHyDImjD7i5HkwtxZNCEy8N2PQGf+ySAoC2dlnWb2w
         Sba2uyaMtphhXPQuzYl6pnOHIzttmC9vdEyjNOIyFUBv8OQvnfq5vO9mKUuRgeW7lmJe
         kt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzBoGlicy3cr5i7Md3OkU8BP9DCvHUCzxRYJ1FITrS8=;
        b=zGNLSaLX7SzxIOBVZUiWlb1qHxuiqcBkncaUz47biDxt8hA4xjXy0R9mWAMHo/Np/N
         u8Hqbi31h0qd/lxOAjRtrs1RimFWfxrcQezWu8zilgAX62xC4k6uqg/Yux/YmTWXuBud
         TwxRwVJ3IHO1OsICuCzytR71ng3HeWKpXu6roLixQ6efQt8ymmuQ3dlglWPdzgqeWW7b
         A3y4jt9hX/wy+QHDPkhTU+6vO5f9ENbtPfRQuQUqAAWFja6ixRZotQo09p+dBn+n6etZ
         4YeT5zMn5XTIkXB6clQseEvjkJbWX6Jp1D84WGV7qEJr0SaEnrTOWTokPwWztzqdvcpi
         BE5Q==
X-Gm-Message-State: ACrzQf0KFGnYaQOKLpZuXilZTkVftXCRS/fFOjdhFYpbMLaph62viOjF
	8lrSQJHHkv4VBxvtTedqrel6lw==
X-Google-Smtp-Source: AMsMyM4D8IVPdtfX1BGMVrLvF4BEJS2QdV3t02qYVEv36AAcuIauZqgZNPTN+8DYtrOHhrsdaVUtlw==
X-Received: by 2002:a05:600c:12c6:b0:3bd:eeec:309 with SMTP id v6-20020a05600c12c600b003bdeeec0309mr6651003wmd.167.1665055769752;
        Thu, 06 Oct 2022 04:29:29 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:86cc:fff3:d44b:9793? ([2a05:6e02:1041:c10:86cc:fff3:d44b:9793])
        by smtp.googlemail.com with ESMTPSA id u8-20020a5d5148000000b0022e04bfa661sm16280780wrt.59.2022.10.06.04.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 04:29:29 -0700 (PDT)
Message-ID: <f66c795b-03e7-083c-e4ba-5b5c150b88df@linaro.org>
Date: Thu, 6 Oct 2022 13:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8183: disable thermal zones
 without trips.
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221004101130.17256-1-aouledameur@baylibre.com>
 <17f3fd40-70c1-2e8d-8002-dfe9690aed88@linaro.org>
 <cdebdf53-d691-41b6-bb8e-f66bb6f56e56@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <cdebdf53-d691-41b6-bb8e-f66bb6f56e56@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_042933_586074_A9C11A2D 
X-CRM114-Status: GOOD (  27.07  )
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

On 06/10/2022 13:08, Amjad Ouled-Ameur wrote:
> Hi Daniel,
> 
> Thank you for your feedback.
> 
> On 10/4/22 12:47, Daniel Lezcano wrote:
>>
>> Hi Amjad,
>>
>> On 04/10/2022 12:11, Amjad Ouled-Ameur wrote:
>>> Thermal zones without trip point are not registered by thermal core.
>>>
>>> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
>>> only.
>>>
>>> Disable the zones above and keep only cpu_thermal enabled.
>>
>> It does not make sense to disable the thermal zones. Either the 
>> thermal zones are needed or they are not. Keeping them for debug 
>> purpose is not desired.
> As Matthias Brugger mentioned in previous versions, DTS should describe 
> the HW as it is, the sensors are in the HW.

Yes, it is here:

		thermal: thermal@1100b000 {
                         #thermal-sensor-cells = <1>;
                         compatible = "mediatek,mt8183-thermal";
                         reg = <0 0x1100b000 0 0x1000>;
                         clocks = <&infracfg CLK_INFRA_THERM>,
                                  <&infracfg CLK_INFRA_AUXADC>;
	                clock-names = "therm", "auxadc";
                         resets = <&infracfg 
MT8183_INFRACFG_AO_THERM_SW_RST>;
                         interrupts = <0 76 IRQ_TYPE_LEVEL_LOW>;
                         mediatek,auxadc = <&auxadc>;
		        mediatek,apmixedsys = <&apmixedsys>;
                         nvmem-cells = <&thermal_calibration>;
			nvmem-cell-names = "calibration-data";
		};

>> Alternatively to removal, you can:
>>
>>  - remove 'sustainable-power'
>>  - add a passive trip point, optionally a hot trip point and a 
>> critical trip point
> 
> Why removing "sustainable-power" instead of simply disabling the device 
> ? 

Because sustainable-power is wrong. It is probably coming from a 
copy-paste. It does not make sense to have this.

The sustainable-power is for the power allocator governor which is 
limited to CPU and GPU. Here the thermal zones are for different devices.

Especially that, if a user needs to use the sensor

If the thermal zone is disabled, how can it use the sensor?

> in the future, they might not be able to find the right 
> sustainable-power ; thus I think it should remain the way it is.
> 
> As to adding tripping points, MediaTek does not have ones to add for now 
> for those sensors.

Please do this:

Add:

trips {
        threshold : trip1 {
            	temperature = <50000>;
                 type = "passive";
           };
};

And remove all the empty cooling maps and the sustainable power properties.


>> The passive trip point will allow the userspace to set a value in 
>> order to get notified about the devices temperature (writable trip 
>> point). The hot temperature will send a notification to userspace so 
>> it can take a last chance decision to drop the temperature before the 
>> critical temperature.
>>
>> The passive trip point temperature could be a high temperature.
>>
>> The mitigation is also managed from userspace as a whole.
>>
>>
>>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi 
>>> b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> index 9d32871973a2..53f7a0fbaa88 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> @@ -1191,6 +1191,7 @@ tzts1: tzts1 {
>>>                   polling-delay = <0>;
>>>                   thermal-sensors = <&thermal 1>;
>>>                   sustainable-power = <5000>;
>>> +                status = "disabled";
>>>                   trips {};
>>>                   cooling-maps {};
>>>               };
>>> @@ -1200,6 +1201,7 @@ tzts2: tzts2 {
>>>                   polling-delay = <0>;
>>>                   thermal-sensors = <&thermal 2>;
>>>                   sustainable-power = <5000>;
>>> +                status = "disabled";
>>>                   trips {};
>>>                   cooling-maps {};
>>>               };
>>> @@ -1209,6 +1211,7 @@ tzts3: tzts3 {
>>>                   polling-delay = <0>;
>>>                   thermal-sensors = <&thermal 3>;
>>>                   sustainable-power = <5000>;
>>> +                status = "disabled";
>>>                   trips {};
>>>                   cooling-maps {};
>>>               };
>>> @@ -1218,6 +1221,7 @@ tzts4: tzts4 {
>>>                   polling-delay = <0>;
>>>                   thermal-sensors = <&thermal 4>;
>>>                   sustainable-power = <5000>;
>>> +                status = "disabled";
>>>                   trips {};
>>>                   cooling-maps {};
>>>               };
>>> @@ -1227,6 +1231,7 @@ tzts5: tzts5 {
>>>                   polling-delay = <0>;
>>>                   thermal-sensors = <&thermal 5>;
>>>                   sustainable-power = <5000>;
>>> +                status = "disabled";
>>>                   trips {};
>>>                   cooling-maps {};
>>>               };
>>> @@ -1236,6 +1241,7 @@ tztsABB: tztsABB {
>>>                   polling-delay = <0>;
>>>                   thermal-sensors = <&thermal 6>;
>>>                   sustainable-power = <5000>;
>>> +                status = "disabled";
>>>                   trips {};
>>>                   cooling-maps {};
>>>               };
>>
>>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

