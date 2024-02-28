Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EACC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/lGOSStuo5S8BivYVx+Oubi2zIluL7l1Ql9VnzNeN4=; b=d5C/rQtHMI6KZ7BOw8Fjemwc5T
	yobvTI8qYHDJtiKhXZhIRQ0Jneyj1G61dyhcvKtvwLMmO/atQGKk6o+JsbwD8p79+vzH/ucQhfxhk
	FiOvLeqDeMHBqMBFEuX8qrxr2R4Y2u+8NElbqVBy7g/+Of2/9970RoRbMUT0/DMy68ohJTBtZXtwD
	gSequyh+e6a698yejleYhtx9bdvxug2O3Xft53MQnFZON5gkKg9kvnVMrSClKBB8dPTcyqG1XXvwm
	Gq8YriEPOjJ2elK/2vcJQKdiiTjABXLoY8y3hnyQRXsWf4oZuOE9d62QcetL6a+xq6AfeXE/ZIXEh
	4FLS5/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfH87-00000008pQi-2pg4;
	Wed, 28 Feb 2024 10:25:39 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfH84-00000008pPd-0eRj;
	Wed, 28 Feb 2024 10:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709115933;
	bh=E8R79vstTtZYjkIXyTYbyYkKBTC6894FJU5MK2LqR20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qVdjMgNpoJSKYoUGzNNif7MwqOIvRhO+7Z512Q1OpHtWr70VAn2rL29LyFCx5lcOu
	 2A+3rlzaNSw1g91MWg9EOwDjy0uIXRvFQe8lG+ZfY76MTDsfoXPLs73Ne1Se/vBUbv
	 VpOLc1vtuTvKRGQtbKDRuKGyfxcvr8ufYw5nC+/8DZYLodTszxLHzRryEYxFhssgrw
	 oAphV7git0xKym3Y/vQWhfh+Yme1IfUOBmtbU7oTWRHVm9YqOMrnEIy7veaCQATzW8
	 TjkxbCIEE9MER6XEM87oFe7lh0ZSRcN6OZPk/sUiDQ0VVSmBJM5WF1FdL6uC3PR8gA
	 jemLx0f+CRKLA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 30B7E3780C6C;
	Wed, 28 Feb 2024 10:25:32 +0000 (UTC)
Message-ID: <bb86b986-ecd7-416a-9036-082a3cff2176@collabora.com>
Date: Wed, 28 Feb 2024 11:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
 <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
 <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
 <bd4bf6ae-350e-4ee6-a924-7dd31b2c6034@linaro.org>
 <66e527af-0253-4565-9822-04ed84e5817c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <66e527af-0253-4565-9822-04ed84e5817c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_022536_392146_991457C8 
X-CRM114-Status: GOOD (  29.66  )
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

Il 28/02/24 10:57, Alexandre Mergnat ha scritto:
> I think I got it.
> 
> - mediatek,i2s-shared-clock: will be remove from DT
> - mediatek,dmic-iir-on: will be remove from DT
> - mediatek,dmic-irr-mode: will be remove from DT
> - mediatek,dmic-two-wire-mode: rephrase description needed
> 
> I've did abstraction (despite me) that IIR settings are runtime config because the 
> driver implement its usage like a one-time-setup -_-'
> 

Yes but just one more thing I just noticed: `mediatek,dmic-two-wire-mode` - can we
please rename this to `mediatek,dmic-mode` ?

That'd be for consistency check mt6359.yaml and mt6358.txt

   mediatek,dmic-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       Indicates how many data pins are used to transmit two channels of PDM
       signal. 0 means two wires, 1 means one wire. Default value is 0.
     enum:
       - 0 # one wire
       - 1 # two wires

Cheers,
Angelo



> Thanks for the explanations, that help.
> 
> Regards,
> Alexandre
> 
> On 28/02/2024 08:28, Krzysztof Kozlowski wrote:
>> On 27/02/2024 16:18, Alexandre Mergnat wrote:
>>>>
>>>>> +    type: boolean
>>>>> +
>>>>> +  mediatek,dmic-iir-on:
>>>>> +    description:
>>>>> +      Boolean which specifies whether the DMIC IIR is enabled.
>>>>> +      If this property is not present the IIR is disabled.
>>>>
>>>> "is enabled" or "enable it"?
>>>>
>>>> You described the desired Linux feature or behavior, not the actual
>>>> hardware. The bindings are about the latter, so instead you need to
>>>> rephrase the property and its description to match actual hardware
>>>> capabilities/features/configuration etc.
>>>
>>> I will rephrase:
>>>
>>> True to enable the Infinite Impulse Response (IIR) filter
>>> on the digital microphone inputs.
>>
>> I still don't know why this is DT-specific. You still tell driver what
>> to do...
>>
>>>
>>>>
>>>>> +    type: boolean
>>>>> +
>>>>> +  mediatek,dmic-irr-mode:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description:
>>>>> +      Selects stop band of IIR DC-removal filter.
>>>>> +      0 = Software programmable custom coeff loaded by the driver.
>>>>
>>>> Bindings are for hardware, not drivers. Why is this a property of board DTS?
>>>
>>> Actually this is a hardware feature. Mode 1 t 5 are predefined filters.
>>> Mode 0, the HW will read some "coef filter registers" to setup the
>>> custom filter. the "coef filter regs" are written by the driver.
>>> Currently the coef values are hardcoded in the driver.
>>
>> You don't get the point. Just because you choose some mode it does not
>> mean is hardware feature for DT. Sampling frequency done by hardware is
>> also "hardware feature", but do you put it to DT? No.
>>
>> Explain why this is board-specific, not runtime configuration.
>>
>>>
>>>>
>>>>> +      1 = 5Hz if 48KHz mode.
>>>>> +      2 = 10Hz if 48KHz mode.
>>>>> +      3 = 25Hz if 48KHz mode.
>>>>> +      4 = 50Hz if 48KHz mode.
>>>>> +      5 = 65Hz if 48KHz mode.
>>>>
>>>> Use proper unit suffixes - hz.
>>>>
>>>>
>>>>> +    enum:
>>>>> +      - 0
>>>>> +      - 1
>>>>> +      - 2
>>>>> +      - 3
>>>>> +      - 4
>>>>> +      - 5
>>>>> +
>>>>> +  mediatek,dmic-two-wire-mode:
>>>>> +    description:
>>>>> +      Boolean which turns on digital microphone for two wire mode.
>>>>> +      If this property is not present the two wire mode is disabled.
>>>>
>>>> This looks like hardware property, but the naming looks like SW. Again
>>>> you instruct what driver should do. Standard disclaimer:
>>>>
>>>> You described the desired Linux feature or behavior, not the actual
>>>> hardware. The bindings are about the latter, so instead you need to
>>>> rephrase the property and its description to match actual hardware
>>>> capabilities/features/configuration etc.
>>>
>>> Actually this is a hardware feature. This is ALL I have to describe the
>>> HW behavior from the datasheet:
>>> "
>>> bit name: ul_dmic_two_wire_ctl
>>> Turns on digital microphone for two wire mode.
>>> 0: Turn off
>>> 1: Turn on
>>
>> That's rather suggestion it is not a description of hardware but you
>> want driver to do something...
>>
>>> "
>>>
>>> On the board schematic, SoC and DMIC and linked by 3 pins:
>>> - clk
>>> - data0
>>> - data1
>>>
>>> IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC must
>>> be aware of that by reading the register value written by the driver,
>>> using the value found in the DTS.
>>
>> So this depends on type of connection of DMIC? Then rephrase description
>> property like this.
>>
>>>
>>> I don't get why you think it wouldn't be hardware behavior.
>>
>> Because telling what to write to the registers which is typical sign of
>> people stuffing to DT whatever they need to configure the hardware.
>>
>>>
>>> Rephrase description:
>>> "True to enable the two wire mode of the digital microphone"
>>> Is it better ?
>>
>> No, because again you describe some sort of mode. If you insist on such
>> description, then my answer is: it's runtime, so not suitable for DT.
>> Instead describe what is the hardware problem/configuration, e.g. "DMIC
>> is connected with only CLK and DATA0, without third pin" etc.
>>
>>>
>>> About the property name, "mediatek,dmic-two-wire-ctl" sound better for you ?
>>
>> To sound more like a register less like physical characteristic of the
>> board? No. The name can stay, I don't have better ideas.
>>
>>
>> Best regards,
>> Krzysztof
>>
> 


