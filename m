Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D96C369D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEl5lZ9LyepmTBdXl12N472xKmz4Z5x/uqpO/P2xlZU=; b=vGQv2tV2WyKfiF/7FEqot5TJjb
	jMDgjrUdFxmiCrXoSrU0KiwOSQiiEoYxOvVs6a6Mi9Z8fOcRCEC0bur3BDxVMZxahP0hM92ANdo3W
	5IXwo6CZIKJSgRHJJTEYj6q1znMRoa7f8eoqzML0dHPtjwPFwWbgud3x9FoYyB993suJxn8JegT3d
	oFJsoYhTptPbyIpDRVm168uy5nxWhkj67m3uF1AyPmYGjbGHFMtTM4xYAWouRLGGHLaABllyjXTR0
	/0BZmdtPL4nPXztq2O0prjieLfA/o+tWTDT1VsNzYrUzOpSjTDzoNt9ugqW6xJillxO2Fu0yn7Mb8
	x+NgxogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y2h-0000000AHFF-0KfS;
	Wed, 23 Apr 2025 11:13:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XO6-0000000AAUS-06zy
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 10:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745404287;
	bh=2MOPD1NtJjgVsrkU9nVN0H7gbMjIGR+VdbWECswCz20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GYQmfbjR6TCGVUI2c8dGCF8FIN7PRJn1iy+yUvHmasoaJbM7hUjT7M+9QxCd4JyTy
	 NiF2tLE0R7BILbzvHWa/L2uNu30ZiMdF613BgqCqQQdjomjIpoSAyWPj+Yd9P28mp2
	 1gyXwpUoQz/Khb3EVDPOkhYd4EKlGDXpkYSt5O0kGa3pXAIXNJl/RWDS47VVLHR6rw
	 ITA9mkU4QjJdhQagldE/OklTC5T2gs+ZQTQdpcYELSfCw9maLHKhksH34ShfU612at
	 WjHDDhFazs09Rhkmm047l/bQ4D5mz+fWZsSyTl9eA7ac/znxZWKVYYsezb8jIkQZye
	 3K0gMPSdc9HDQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F57417E0C10;
	Wed, 23 Apr 2025 12:31:27 +0200 (CEST)
Message-ID: <2ddff946-9c4c-4fb5-a8e7-b2fc413ae281@collabora.com>
Date: Wed, 23 Apr 2025 12:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dts: arm64: mediatek: mt8188: add more thermal trip
 points
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <s2sp5o57-o534-qso0-2733-o0prs6028por@onlyvoer.pbz>
 <dcc62684-0579-4d03-a430-d4a276153ca1@collabora.com>
 <85710oso-p1pp-647q-498p-23583s7nnn45@onlyvoer.pbz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <85710oso-p1pp-647q-498p-23583s7nnn45@onlyvoer.pbz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_033130_215537_7021FF30 
X-CRM114-Status: GOOD (  18.79  )
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

Il 13/03/25 19:30, Nicolas Pitre ha scritto:
> On Thu, 13 Mar 2025, AngeloGioacchino Del Regno wrote:
> 
>> Il 13/03/25 16:43, Nicolas Pitre ha scritto:
>>> Provide the "switch on" thermal trip point to be used by the power
>>> allocator governor.
>>>
>>
>> As far as I know, the power allocation is not supposed to be
>> SoC-global, as that does play with sustainable power values...
>>
>> Sustainable power depends on multiple factors - besides the power that
>> is actually sustainable by intrinsic properties of the silicon, this
>> mostly depends on the PCB that it is soldered to.
>>
>> Translated, this depends on the heat capacity of the copper layer(s)
>> and of the eventual additional passive heatsink, which is a physical
>> property relative to a board and not to the SoC by itself.
>>
>> ....which means.... that those nodes shall go to board specific devicetrees
>> and
>> not to the SoC devicetree :-)
>>
>> Unless I'm wrong - but if I am, please explain why :-)
> 
> I agree with everything you wrote above.
> 
> But this patch isn't about power allocation. This is about temperature
> thresholds. And temperature tolerance is rather SOC specific, no?
> 
> 

Sorry for letting this slip through the cracks - that wasn't intentional.

Agreed that temperature tolerance is SoC specific, but that's taken care of with
the other trip points, so that's not a concern here.

On the other hand, it's guaranteed that the SoC can "keep crunching numbers" at
full power when the CPUs are at 68-70°C without entering any actual danger zone,
temperature-speaking.

Remember that a machine may be designed to keep it at even 70°C for a prolonged
amount of time - depending on the cooling solution.

If you're doing this for a specific board, I'm happy to accept the addition to
the specific board (file) that you're doing this for.

Cheers,
Angelo

>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>>> index 338120930b..262eab8fd3 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>>> @@ -472,6 +472,12 @@ cpu-little0-thermal {
>>>       thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
>>>    
>>>    			trips {
>>> +				cpu_little0_switch_on: trip-switch-on {
>>> +					temperature = <68000>;
>>> +					hysteresis = <2000>;
>>> +					type = "passive";
>>> +				};
>>> +
>>>        cpu_little0_alert0: trip-alert0 {
>>>         temperature = <85000>;
>>>         hysteresis = <2000>;
>>> @@ -510,6 +516,12 @@ cpu-little1-thermal {
>>>       thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
>>>    
>>>    			trips {
>>> +				cpu_little1_switch_on: trip-switch-on {
>>> +					temperature = <68000>;
>>> +					hysteresis = <2000>;
>>> +					type = "passive";
>>> +				};
>>> +
>>>        cpu_little1_alert0: trip-alert0 {
>>>         temperature = <85000>;
>>>         hysteresis = <2000>;
>>> @@ -548,6 +560,12 @@ cpu-little2-thermal {
>>>       thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
>>>    
>>>    			trips {
>>> +				cpu_little2_switch_on: trip-switch-on {
>>> +					temperature = <68000>;
>>> +					hysteresis = <2000>;
>>> +					type = "passive";
>>> +				};
>>> +
>>>        cpu_little2_alert0: trip-alert0 {
>>>         temperature = <85000>;
>>>         hysteresis = <2000>;
>>> @@ -586,6 +604,12 @@ cpu-little3-thermal {
>>>       thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
>>>    
>>>    			trips {
>>> +				cpu_little3_switch_on: trip-switch-on {
>>> +					temperature = <68000>;
>>> +					hysteresis = <2000>;
>>> +					type = "passive";
>>> +				};
>>> +
>>>        cpu_little3_alert0: trip-alert0 {
>>>         temperature = <85000>;
>>>         hysteresis = <2000>;
>>> @@ -624,6 +648,12 @@ cpu-big0-thermal {
>>>       thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
>>>    
>>>    			trips {
>>> +				cpu_big0_switch_on: trip-switch-on {
>>> +					temperature = <68000>;
>>> +					hysteresis = <2000>;
>>> +					type = "passive";
>>> +				};
>>> +
>>>        cpu_big0_alert0: trip-alert0 {
>>>         temperature = <85000>;
>>>         hysteresis = <2000>;
>>> @@ -658,6 +688,12 @@ cpu-big1-thermal {
>>>       thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
>>>    
>>>    			trips {
>>> +				cpu_big1_switch_on: trip-switch-on {
>>> +					temperature = <68000>;
>>> +					hysteresis = <2000>;
>>> +					type = "passive";
>>> +				};
>>> +
>>>        cpu_big1_alert0: trip-alert0 {
>>>         temperature = <85000>;
>>>         hysteresis = <2000>;
>>
>>
>>


