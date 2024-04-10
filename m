Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C093DCD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKqbO668b8E4Nf7LDIlbKX4rUhaxUkRh/n7dIzv+XJA=; b=h8/SGhp7Xa3mFHo2Ac0tsZstL+
	sb3QE8gaIqw1+vZChH+1AjLURkit+3GEWUNmJXEXwqkcWKUhVihkcgqrXwyCXMjPkki8iekmH+sI6
	zOvS28iaaeTefbrtylQaw2+/GRu1v0sx3Nk/Dfw8MCk59fKpqrV2MLMYpiCGMGDXkk2eS7vjlvpuy
	tAv5l5QdMonjbE5OghOdRaBAc/URgjvmKc21RuZWNmXIL/4Zfr4jbOTHqd/tQJm7S1VRhrCzNP6Om
	PVOHYBcD0Ci7wFha/2bMo7z/o1fKrO6iu+xDt1yuCjNKLvrJNgxqHOfkexYPhiQeN+Q/xd0bEZG/E
	GWEyNtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWtm-00000006pxF-2uWo;
	Wed, 10 Apr 2024 12:17:54 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWtj-00000006pwJ-2KT6;
	Wed, 10 Apr 2024 12:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712751467;
	bh=aSWsZW3PPr3ut14CSL6esqj3XAo3ApAiyL2z+qeFyUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hqM3Q6ukcFIQgwSig39iCJNyMZbUwME4Zc+vHw7Fkq0PbfNvj8FKXgvOxYpZsbdSD
	 xwcyLgpcf+HtWUiAJLss6ZEswzJtaqGxolgdeSEihM6whs2JJGUzQraueye6dPm6jN
	 1xDYXNqiDjQB4KrO920HNy65ePd6E52DaLwiopaVEcTZfxf2BDGiv0E87w6Jlq1jrJ
	 bVaot+9bMLXf0+N5/SPKzSb8+RbtEOW7eek9zgwhrZTVVtCUTy4EZbmympa3moUZB1
	 PEPq2CSCudJgw2n+RH9roo+gM5/QDLvRIrtSmnCBWk5i1aotOvUDbRvyQzMGMaHKRE
	 xRgYGCuIjzUAQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0B84737811D1;
	Wed, 10 Apr 2024 12:17:46 +0000 (UTC)
Message-ID: <0487ed41-0404-4215-a346-1a3daedc417f@collabora.com>
Date: Wed, 10 Apr 2024 14:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8192: Add missing trip point
 in thermal zone
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240410-upstream-torvalds-master-v2-1-679777847b63@chromium.org>
 <d1dafc46-9b14-4752-822c-86cbabdcfb8b@collabora.com>
 <CAHc4DNLrU=QVWODOzHXW16Ko1V=W31zkSHOi7rztiJMOMDcKqg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAHc4DNLrU=QVWODOzHXW16Ko1V=W31zkSHOi7rztiJMOMDcKqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_051751_771608_02123171 
X-CRM114-Status: GOOD (  22.78  )
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

Il 10/04/24 14:06, Hsin-Te Yuan ha scritto:
> Hi Angelo,
> 
> 1. 68°C is provided by MediaTek previously in downstream
> 2. I think sustainable power will be estimated by
> estimate_sustainable_power in drivers/thermal/gov_power_allocator.c,
> but I'll ask MediaTek if they can provide the precise value.
> 3. Sure. I'll do it in v3 after I check 2. with MediaTek
> 

Perfect, thanks for the clarification.

Will wait for v3.

Cheers,
Angelo

> Regards,
> Hsin-Te
> 
> On Wed, Apr 10, 2024 at 5:50 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 10/04/24 10:40, Hsin-Te Yuan ha scritto:
>>> According to Documentation/driver-api/thermal/power_allocator.rst, there
>>> should be two passive trip points. Adding the missing trip point to
>>> ensure that the governor works optimally.
>>>
>>> Fixes: c7a728051f4e ("arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones")
>>> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
>>
>> That's better - but while I can agree about setting a general temperature
>> for that, I still have a few questions and requests:
>>
>> 1. Why is this 68°C? Was that value provided by MediaTek, or was it calculated?
>>    1b. If this was calculated, please, can you explain how?
>>
>> 2. The power allocator documentation also says that the governor works good
>>      when a "sustainable dissipatable power" parameter is fed to it through the
>>      `sustainable-power` devicetree property (with that being strictly board
>>      specific and never SoC-global, as that depends on the form factor and on
>>      the cooling method of the machine), can you please also add the right
>>      sustainable power indication to the Chromebook devicetrees?
>>      In the MT8192 specific case, that's mt8192-asurada.dtsi.
>>
>> 3. I just noticed that MT8192 is not the only one that would be affected by
>>      the issue that you're describing in this commit; can you please perform a
>>      similar change on the others, if parameters are known?
>>
>> Thanks,
>> Angelo
>>
>>> ---
>>> Changes in v2:
>>> - Clearify the reason of adding another passive trip point
>>> - Link to v1: https://lore.kernel.org/r/20240410-upstream-torvalds-master-v1-1-852e903f0cec@chromium.org
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8192.dtsi | 40 ++++++++++++++++++++++++++++++++
>>>    1 file changed, 40 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> index 05e401670bced..08d8bccc84669 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> @@ -1959,6 +1959,11 @@ cpu0-thermal {
>>>                        thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU0>;
>>>
>>>                        trips {
>>> +                             cpu0_thres: trip-point {
>>> +                                     temperature = <68000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>>                                cpu0_alert: trip-alert {
>>>                                        temperature = <85000>;
>>>                                        hysteresis = <2000>;
>>> @@ -1989,6 +1994,11 @@ cpu1-thermal {
>>>                        thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU1>;
>>>
>>>                        trips {
>>> +                             cpu1_thres: trip-point {
>>> +                                     temperature = <68000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>>                                cpu1_alert: trip-alert {
>>>                                        temperature = <85000>;
>>>                                        hysteresis = <2000>;
>>> @@ -2019,6 +2029,11 @@ cpu2-thermal {
>>>                        thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU2>;
>>>
>>>                        trips {
>>> +                             cpu2_thres: trip-point {
>>> +                                     temperature = <68000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>>                                cpu2_alert: trip-alert {
>>>                                        temperature = <85000>;
>>>                                        hysteresis = <2000>;
>>> @@ -2049,6 +2064,11 @@ cpu3-thermal {
>>>                        thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU3>;
>>>
>>>                        trips {
>>> +                             cpu3_thres: trip-point {
>>> +                                     temperature = <68000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>>                                cpu3_alert: trip-alert {
>>>                                        temperature = <85000>;
>>>                                        hysteresis = <2000>;
>>> @@ -2079,6 +2099,11 @@ cpu4-thermal {
>>>                        thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU0>;
>>>
>>>                        trips {
>>> +                             cpu4_thres: trip-point {
>>> +                                     temperature = <68000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>>                                cpu4_alert: trip-alert {
>>>                                        temperature = <85000>;
>>>                                        hysteresis = <2000>;
>>> @@ -2109,6 +2134,11 @@ cpu5-thermal {
>>>                        thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU1>;
>>>
>>>                        trips {
>>> +                             cpu5_thres: trip-point {
>>> +                                     temperature = <68000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>>                                cpu5_alert: trip-alert {
>>>                                        temperature = <85000>;
>>>                                        hysteresis = <2000>;
>>> @@ -2139,6 +2169,11 @@ cpu6-thermal {
>>>                        thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU2>;
>>>
>>>                        trips {
>>> +                             cpu6_thres: trip-point {
>>> +                                     temperature = <68000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>>                                cpu6_alert: trip-alert {
>>>                                        temperature = <85000>;
>>>                                        hysteresis = <2000>;
>>> @@ -2169,6 +2204,11 @@ cpu7-thermal {
>>>                        thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU3>;
>>>
>>>                        trips {
>>> +                             cpu7_thres: trip-point {
>>> +                                     temperature = <68000>;
>>> +                                     hysteresis = <2000>;
>>> +                                     type = "passive";
>>> +                             };
>>>                                cpu7_alert: trip-alert {
>>>                                        temperature = <85000>;
>>>                                        hysteresis = <2000>;
>>>
>>> ---
>>> base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
>>> change-id: 20240410-upstream-torvalds-master-40aeff5416c7
>>>
>>> Best regards,
>>
>>

