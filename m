Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22C3C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2c9Sf7R5wcwbIwSIRyEAmMEDEeuK8FPLKcXx7pmUlI=; b=OHyJgYK+kHYjwExnKRR+Gqr8gT
	IowPFSHiDI+oPqz+JXiFGGxWgajc8JkZz3na6/ZcwgtsLq5BGVUu23/k8gfHcufNovwE7YvAGbWbV
	2wmmSF3bDhHFDiehx5GuHyZz9OHt7fko5jN3tkzlURm3PnVXplSwDMwFQiDBBU7b7gJ/KumKIONbI
	NSbNdnZH4WYP96iYGSzSn+PgFgqkx3HdVqA9QLd59IqTuKrIw8APp/vNyRAiJf5hx4e/Z5kRozMRE
	6MO0BU51IbdbEqQQev7QA4K7QJKo9ZO5KUDltE1vKDbLYFc+GazCYYutyCyJcILlYW5VCAf11R1yv
	j+VSqLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTvR-00H1A6-31; Tue, 07 Mar 2023 09:48:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTv5-00H0zI-BA; Tue, 07 Mar 2023 09:47:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 75E7B6602FE6;
	Tue,  7 Mar 2023 09:47:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678182462;
	bh=FIy3VD1GcrwVsZV6x47mkmmqykaahfq9tEgiYJql5Dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AcS5VvvvocXA1mATfJ1yLsnVJXSonHGJFAjamsq7Df9hwXl8FiLubQx5r1Zc+JBbf
	 y6e6FQ9q8IEdd/qZDiOXUOw7A/YcJczybOx9O+ml3scQNTvyh436KGEoZDzY56oPs9
	 YJz2WhQInhdERkkVE/ub+lAu3+mY8vDuYaS9hgdnBFmyVMHSNGMyFJ6b4z8NzhKsno
	 bNPxNpoHdF2HTwwX7nCGBClWaiEKCXJJOCjkn9zlNWlRxc+fqYQqMfGJANfLlKLOtm
	 Bj2c8X6SoFft0i7NaGYNzWoPlbwGmleC+/+IQAeoGzm7TSfDcH2GtRGpnnTVWpD2p4
	 RVmOFyaIqMwGw==
Message-ID: <f7453c57-d921-a789-75f6-c837ca50187c@collabora.com>
Date: Tue, 7 Mar 2023 10:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/19] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <20230301095523.428461-13-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHdtbheL6wxtDo-szk+=3BGk2z93SBowd4Z=E9XupZkw@mail.gmail.com>
 <5dba27e1-d480-ea24-c1ba-03bb7f77b1b1@collabora.com>
 <CAGXv+5FwNfZ7TwKVMM5_uAjYQ6ZmhZVFsWREb_da-jxC6EUVJw@mail.gmail.com>
 <CAGXv+5F8A4kLq3y8dE4mrcVb338-afDorWsS5MRBvWVPgiAhEA@mail.gmail.com>
 <e1b9d901-421c-3509-c92a-c59d49ff2b0d@collabora.com>
 <CAGXv+5EcAMmGro9UFLmQvkgcBykS9rsUdF_YsdbRUbtipfEFJA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EcAMmGro9UFLmQvkgcBykS9rsUdF_YsdbRUbtipfEFJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_014743_694548_831DF6DD 
X-CRM114-Status: GOOD (  22.66  )
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

Il 07/03/23 10:44, Chen-Yu Tsai ha scritto:
> On Tue, Mar 7, 2023 at 5:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 07/03/23 10:24, Chen-Yu Tsai ha scritto:
>>> On Fri, Mar 3, 2023 at 12:09 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>>>
>>>> On Thu, Mar 2, 2023 at 6:17 PM AngeloGioacchino Del Regno
>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>
>>>>> Il 02/03/23 11:03, Chen-Yu Tsai ha scritto:
>>>>>> On Wed, Mar 1, 2023 at 5:55 PM AngeloGioacchino Del Regno
>>>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>>>
>>>>>>> Add coupling for these regulators, as VSRAM_OTHER is used to power the
>>>>>>> GPU SRAM, and they have a strict voltage output relation to satisfy in
>>>>>>> order to ensure GPU stable operation.
>>>>>>> While at it, also add voltage constraint overrides for the GPU SRAM
>>>>>>> regulator "mt6359_vsram_others" so that we stay in a safe range of
>>>>>>> 0.75-0.80V.
>>>>>>>
>>>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>>>> ---
>>>>>>>     arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
>>>>>>>     1 file changed, 9 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>>>>>> index 8570b78c04a4..f858eca219d7 100644
>>>>>>> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>>>>>> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
>>>>>>>            regulator-always-on;
>>>>>>>     };
>>>>>>>
>>>>>>> +&mt6359_vsram_others_ldo_reg {
>>>>>>> +       regulator-min-microvolt = <750000>;
>>>>>>> +       regulator-max-microvolt = <800000>;
>>>>>>> +       regulator-coupled-with = <&mt6315_7_vbuck1>;
>>>>>>> +       regulator-coupled-max-spread = <10000>;
>>>>>>
>>>>>> Looking again at the downstream OPP table, it seems there's no voltage
>>>>>> difference requirement. It only needs V_SRAM >= V_GPU. Same applies to
>>>>>> MT8195. Looks like only MT8183 and MT8186 need V_SRAM - V_GPU >= 10000.
>>>>>
>>>>> On MT8195 we don't need any regulator coupling. There, the GPU-SRAM voltage
>>>>> is fixed at .. I don't remember, 0.7V? - anyway - MT8195 doesn't need to
>>>>> scale the vsram.
>>>>
>>>> Looks like it's fixed at 0.75V. I guess we're Ok on MT8195.
>>>>
>>>>>>
>>>>>> Would setting max-spread to 0 work? I ask because with both regulator's
>>>>>> maximum voltage set to 0.8V, there's no way we can reach the highest
>>>>>> OPP.
>>>>>>
>>>>>
>>>>> No that doesn't work. I can raise the Vgpu max voltage to 0.88V to solve the
>>>>> issue right here and right now, or we can leave it like that and revisit it
>>>>> later.
>>>>>
>>>>> I would at this point go for setting mt6315_7_vbuck1's max-microvolt to
>>>>> 880000, as this is the maximum recommended voltage for the GPU as per the
>>>>> MT8192 datasheet, it would also make sense as we would be still describing
>>>>> the hardware in a correct manner.
>>>>>
>>>>> What do you think?
>>>>
>>>> If it's just to accommodate the coupler stuff, I say just set the maximum
>>>> at the lowest possible setting that satisfies the coupler constraint and
>>>> granularity of the regulator. The regulator does 6250 uV steps, so I guess
>>>> we could set the maximum at 812500 uV, with a comment stating the nominal
>>>> voltage of 800000 uV and that the extra 12500 uV is to workaround coupler
>>>> limitations.
>>>>
>>>> Does that sound OK?
>>>
>>> Even without changing anything, the coupler seems to work OK:
>>>
>>>    vsram_others                     1    1      0  normal   800mV
>>> 0mA   750mV   800mV
>>>       10006000.syscon:power-controller-domain   1
>>>            0mA     0mV     0mV
>>>    Vgpu                             2    2      0  normal   800mV
>>> 0mA   606mV   800mV
>>>       13000000.gpu-mali             1
>>> 0mA   800mV   800mV
>>>       10006000.syscon:power-controller-domain   1
>>>            0mA     0mV     0mV
>>>
>>> Am I missing something?
>>>
>>
>> I don't think you are... I may be getting confused by all of the changesets
>> that I'm pushing at once.
>>
>> Hence, is this commit fine as it is?
> 
> It works for some reason. Maybe it's a bug in the coupler. Either way I
> think it works, even though the numbers might be a bit off. We can revisit
> it later.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


Thanks!

Angelo


