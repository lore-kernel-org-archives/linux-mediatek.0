Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA99C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWlQjuIk4L4+i6BrKAO0jJY0YGGnEkXAuN7xx1lsz7w=; b=GFXG+ZQ29Eko2hKDUCAleD8Pbp
	O5zjSAPikD2YNb1f7YcyGijYp9h+JmYTlTO1zHGTJ55JHFIYxRQFdHOQYlpaEA7dZ/i12BSuDR5oo
	D//uQdVkfOFrSc0GCoBEF05XikjdYY1p4SpyeYBFGcWBw8DxWl5Jb4LRr4n1K+/wnI32OlAeeoDjR
	x7nc9eDl21C3BV2EDDTMZTy9RAEVULXAo3uPWwww3m1ZH0S/kyY9XTNYjj5RuKZzbB+FcfCq708dQ
	gmfTiDN0dDnz28XyBh1wwZ3oDudOepc8JOMpsu9QSw7kZJ7KufKIPeW/0IFONQSb8lqP3eqfZVjti
	P0zybbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTeu-00Guxw-8F; Tue, 07 Mar 2023 09:31:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTe4-00Guco-Tg; Tue, 07 Mar 2023 09:30:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC8EB6602FE5;
	Tue,  7 Mar 2023 09:30:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678181407;
	bh=9SABq8iXVESIcH7tVR9rm9V3gZZHiNkHp84CGrGa3yw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kTiWBQcC1KNkom+7BnNGE14JbRpIEIei0qbqkSFZ72GTl5OX9nIC8dnmrWK4W6H4M
	 MX6DRSWIeb/+Q44pGw6CPbzEmIp8a71X0IpiWrg4eV2d+dFFR/j4u42PnoGq6DYhMs
	 iY9M7EU0KDQ6TLe7BWv2pOIr72vtvSb7WxC18w7+T8VxEbKi++TIVKl4YpjMXFefLv
	 frb58kPCfJ1TSNVVGRi8i/r8iWwgJtgh3rpjg5KJXZZfvEUR0sonHwhJQf5hkJ1eIj
	 i+9HTSUOZbSjPCruhMDgeBy+5zhhrU4DTcKV1f5yF0erZz1ZxQIkrQIa7/1mKZMsLz
	 O5nFudCcv+1LQ==
Message-ID: <e1b9d901-421c-3509-c92a-c59d49ff2b0d@collabora.com>
Date: Tue, 7 Mar 2023 10:30:04 +0100
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5F8A4kLq3y8dE4mrcVb338-afDorWsS5MRBvWVPgiAhEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_013009_256986_AF5B06DF 
X-CRM114-Status: GOOD (  21.11  )
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

Il 07/03/23 10:24, Chen-Yu Tsai ha scritto:
> On Fri, Mar 3, 2023 at 12:09 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> On Thu, Mar 2, 2023 at 6:17 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Il 02/03/23 11:03, Chen-Yu Tsai ha scritto:
>>>> On Wed, Mar 1, 2023 at 5:55 PM AngeloGioacchino Del Regno
>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>
>>>>> Add coupling for these regulators, as VSRAM_OTHER is used to power the
>>>>> GPU SRAM, and they have a strict voltage output relation to satisfy in
>>>>> order to ensure GPU stable operation.
>>>>> While at it, also add voltage constraint overrides for the GPU SRAM
>>>>> regulator "mt6359_vsram_others" so that we stay in a safe range of
>>>>> 0.75-0.80V.
>>>>>
>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
>>>>>    1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>>>> index 8570b78c04a4..f858eca219d7 100644
>>>>> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>>>> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
>>>>>           regulator-always-on;
>>>>>    };
>>>>>
>>>>> +&mt6359_vsram_others_ldo_reg {
>>>>> +       regulator-min-microvolt = <750000>;
>>>>> +       regulator-max-microvolt = <800000>;
>>>>> +       regulator-coupled-with = <&mt6315_7_vbuck1>;
>>>>> +       regulator-coupled-max-spread = <10000>;
>>>>
>>>> Looking again at the downstream OPP table, it seems there's no voltage
>>>> difference requirement. It only needs V_SRAM >= V_GPU. Same applies to
>>>> MT8195. Looks like only MT8183 and MT8186 need V_SRAM - V_GPU >= 10000.
>>>
>>> On MT8195 we don't need any regulator coupling. There, the GPU-SRAM voltage
>>> is fixed at .. I don't remember, 0.7V? - anyway - MT8195 doesn't need to
>>> scale the vsram.
>>
>> Looks like it's fixed at 0.75V. I guess we're Ok on MT8195.
>>
>>>>
>>>> Would setting max-spread to 0 work? I ask because with both regulator's
>>>> maximum voltage set to 0.8V, there's no way we can reach the highest
>>>> OPP.
>>>>
>>>
>>> No that doesn't work. I can raise the Vgpu max voltage to 0.88V to solve the
>>> issue right here and right now, or we can leave it like that and revisit it
>>> later.
>>>
>>> I would at this point go for setting mt6315_7_vbuck1's max-microvolt to
>>> 880000, as this is the maximum recommended voltage for the GPU as per the
>>> MT8192 datasheet, it would also make sense as we would be still describing
>>> the hardware in a correct manner.
>>>
>>> What do you think?
>>
>> If it's just to accommodate the coupler stuff, I say just set the maximum
>> at the lowest possible setting that satisfies the coupler constraint and
>> granularity of the regulator. The regulator does 6250 uV steps, so I guess
>> we could set the maximum at 812500 uV, with a comment stating the nominal
>> voltage of 800000 uV and that the extra 12500 uV is to workaround coupler
>> limitations.
>>
>> Does that sound OK?
> 
> Even without changing anything, the coupler seems to work OK:
> 
>   vsram_others                     1    1      0  normal   800mV
> 0mA   750mV   800mV
>      10006000.syscon:power-controller-domain   1
>           0mA     0mV     0mV
>   Vgpu                             2    2      0  normal   800mV
> 0mA   606mV   800mV
>      13000000.gpu-mali             1
> 0mA   800mV   800mV
>      10006000.syscon:power-controller-domain   1
>           0mA     0mV     0mV
> 
> Am I missing something?
> 

I don't think you are... I may be getting confused by all of the changesets
that I'm pushing at once.

Hence, is this commit fine as it is?

Regards,
Angelo

