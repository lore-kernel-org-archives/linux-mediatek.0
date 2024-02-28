Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE186C5478C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zu3ewqCG+5EQn7RzZWf4wxjkdVeCPYXJSPVh/ZEGpuY=; b=so8yjtAUAOD1dkCOtgonGJGbtS
	ONvMC2qLNyN372tXxrfi5hUShOlrRMRjkNzDNBxaqaz7GH7HzBugcXYuImlZm2gSvTLxR+pOBcfrE
	j+GINDIlI8xwHdnA/vZB5mSrXj/0W4NeViFvn1zluHJ7SdNfVfXI4cfKsa51+Fau8v0FMNURHMhs4
	eBAD4TaJzq5YPvQ4tqtMD4HkKjkTZNykfapzdu8YX7qVWs5WBM11FzJD6mwhm0Zchm+slzgRSi866
	LdYNkcx1PXd+g/zxbHC06jjQAyl7pzeNUNZRWngJaEz+aqhUoNRSLKxi73O+EYzUjU5dYolwHqk1G
	EwhorITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJZK-00000009MuU-2UxU;
	Wed, 28 Feb 2024 13:01:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfIPw-000000095rZ-44FN
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Feb 2024 11:48:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33d32f74833so2956719f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Feb 2024 03:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709120886; x=1709725686; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zu3ewqCG+5EQn7RzZWf4wxjkdVeCPYXJSPVh/ZEGpuY=;
        b=UBDSL2HaHtfhTLxF7rM5TkU4KM9iE058vs1qoIUWENDRPHr6jKsfcqAOagwHM6Rs/E
         6ZLntB2jOX4NsGedtZd3nhf4UERSPhzf4X+3ZPT/ORhlCvTDndinf9pXQzFD+L9NFSYV
         zXtft77tQt9FITNBant12tjHSJ/3GBBTIHmxq2LCILh6r3tEPzh7/CFFCCFLs2rkfBrv
         vcHMqaO5Y708G925iq2zCbS1+8J9cK84YACtEGvrLeN2rvTFa1mvBQpk76a5k2ShVI34
         +G48iwjljQWLB8wKWEe/qqL56/9oJplV3BccEAg6D99ujF7fPu/OCxxdq48OEYRWIBfz
         p3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709120886; x=1709725686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zu3ewqCG+5EQn7RzZWf4wxjkdVeCPYXJSPVh/ZEGpuY=;
        b=lq7DVvsyr9rcrhj4FYzYU5NOJU2zOPGwQvn8cYyvyjKuh6YJX64gQeKvQAboLuIcgh
         78v7+plwTdxNxwu/MpOL+XTLQtrTpxtYxAAwP2eymZxYk3JFfeXZ5pi3b5DXZ60YNJJM
         nVU8IDYtyRoJlp2gLNzMfbNBuABUVPoygDHBAv0e0ADIamSMQ+W4UPEaWZiIzvISoKPe
         o7+z4j6gnuVjfzNYKEB8D959sjXTwhMmtZWJudnhvmBPsl/iBFQo2cfd9FVx9qkZ8io/
         nyjJRSM+aSqG0IFRza4vCDwVvIzNBkCel5/xru3Q24BGp3fnK7h58x/+aponO0p7GPxb
         TCDg==
X-Forwarded-Encrypted: i=1; AJvYcCXAZyUPyySbActpvIwT55NIg6/y6Fw+tSnPHLnvPS7KPCgwVTFKFGqXyCiHzMdX8ld/q4zEClAuhZXNrXzyH/+4X3nS8MJQ26vI+y24vcNYx7jB
X-Gm-Message-State: AOJu0YwSP1g1aPvaCvBvHejzX4pOPLLvyqcDAua5igEDMWZh1SCLmLd1
	9rDiHsfBf3q9G1iGxn2hBOTR86qszGO59FZpYG6RL5Lm48X/ZCR3ksEjQJHytNY=
X-Google-Smtp-Source: AGHT+IEB/UQwleJbf7XKW6dc1tBjhAXHjTKhYWiBK169zurfst+bdJvN4ZyFBulks3zB3QHX3zW7pQ==
X-Received: by 2002:adf:fd44:0:b0:33d:277d:a2c7 with SMTP id h4-20020adffd44000000b0033d277da2c7mr7855219wrs.16.1709120886505;
        Wed, 28 Feb 2024 03:48:06 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id bo14-20020a056000068e00b0033d6bc17d0esm15009877wrb.74.2024.02.28.03.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 03:48:06 -0800 (PST)
Message-ID: <a4ba6a35-cfb4-4c3d-a9c7-ccd47d4c32d8@baylibre.com>
Date: Wed, 28 Feb 2024 12:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
 <bb86b986-ecd7-416a-9036-082a3cff2176@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <bb86b986-ecd7-416a-9036-082a3cff2176@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_034809_444509_945601EF 
X-CRM114-Status: GOOD (  29.11  )
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



On 28/02/2024 11:25, AngeloGioacchino Del Regno wrote:
> Il 28/02/24 10:57, Alexandre Mergnat ha scritto:
>> I think I got it.
>>
>> - mediatek,i2s-shared-clock: will be remove from DT
>> - mediatek,dmic-iir-on: will be remove from DT
>> - mediatek,dmic-irr-mode: will be remove from DT
>> - mediatek,dmic-two-wire-mode: rephrase description needed
>>
>> I've did abstraction (despite me) that IIR settings are runtime config 
>> because the driver implement its usage like a one-time-setup -_-'
>>
> 
> Yes but just one more thing I just noticed: 
> `mediatek,dmic-two-wire-mode` - can we
> please rename this to `mediatek,dmic-mode` ?

Sure, I wasn't aware of this property. I will do it.

Note: the description isn't consistent with the enum comments
"
0 means two wires, 1 means one wire.
...
        - 0 # one wire
        - 1 # two wires
"

> 
> That'd be for consistency check mt6359.yaml and mt6358.txt
> 
>    mediatek,dmic-mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: |
>        Indicates how many data pins are used to transmit two channels of 
> PDM
>        signal. 0 means two wires, 1 means one wire. Default value is 0.
>      enum:
>        - 0 # one wire
>        - 1 # two wires
> 
> Cheers,
> Angelo
> 
> 
> 
>> Thanks for the explanations, that help.
>>
>> Regards,
>> Alexandre
>>
>> On 28/02/2024 08:28, Krzysztof Kozlowski wrote:
>>> On 27/02/2024 16:18, Alexandre Mergnat wrote:
>>>>>
>>>>>> +    type: boolean
>>>>>> +
>>>>>> +  mediatek,dmic-iir-on:
>>>>>> +    description:
>>>>>> +      Boolean which specifies whether the DMIC IIR is enabled.
>>>>>> +      If this property is not present the IIR is disabled.
>>>>>
>>>>> "is enabled" or "enable it"?
>>>>>
>>>>> You described the desired Linux feature or behavior, not the actual
>>>>> hardware. The bindings are about the latter, so instead you need to
>>>>> rephrase the property and its description to match actual hardware
>>>>> capabilities/features/configuration etc.
>>>>
>>>> I will rephrase:
>>>>
>>>> True to enable the Infinite Impulse Response (IIR) filter
>>>> on the digital microphone inputs.
>>>
>>> I still don't know why this is DT-specific. You still tell driver what
>>> to do...
>>>
>>>>
>>>>>
>>>>>> +    type: boolean
>>>>>> +
>>>>>> +  mediatek,dmic-irr-mode:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description:
>>>>>> +      Selects stop band of IIR DC-removal filter.
>>>>>> +      0 = Software programmable custom coeff loaded by the driver.
>>>>>
>>>>> Bindings are for hardware, not drivers. Why is this a property of 
>>>>> board DTS?
>>>>
>>>> Actually this is a hardware feature. Mode 1 t 5 are predefined filters.
>>>> Mode 0, the HW will read some "coef filter registers" to setup the
>>>> custom filter. the "coef filter regs" are written by the driver.
>>>> Currently the coef values are hardcoded in the driver.
>>>
>>> You don't get the point. Just because you choose some mode it does not
>>> mean is hardware feature for DT. Sampling frequency done by hardware is
>>> also "hardware feature", but do you put it to DT? No.
>>>
>>> Explain why this is board-specific, not runtime configuration.
>>>
>>>>
>>>>>
>>>>>> +      1 = 5Hz if 48KHz mode.
>>>>>> +      2 = 10Hz if 48KHz mode.
>>>>>> +      3 = 25Hz if 48KHz mode.
>>>>>> +      4 = 50Hz if 48KHz mode.
>>>>>> +      5 = 65Hz if 48KHz mode.
>>>>>
>>>>> Use proper unit suffixes - hz.
>>>>>
>>>>>
>>>>>> +    enum:
>>>>>> +      - 0
>>>>>> +      - 1
>>>>>> +      - 2
>>>>>> +      - 3
>>>>>> +      - 4
>>>>>> +      - 5
>>>>>> +
>>>>>> +  mediatek,dmic-two-wire-mode:
>>>>>> +    description:
>>>>>> +      Boolean which turns on digital microphone for two wire mode.
>>>>>> +      If this property is not present the two wire mode is disabled.
>>>>>
>>>>> This looks like hardware property, but the naming looks like SW. Again
>>>>> you instruct what driver should do. Standard disclaimer:
>>>>>
>>>>> You described the desired Linux feature or behavior, not the actual
>>>>> hardware. The bindings are about the latter, so instead you need to
>>>>> rephrase the property and its description to match actual hardware
>>>>> capabilities/features/configuration etc.
>>>>
>>>> Actually this is a hardware feature. This is ALL I have to describe the
>>>> HW behavior from the datasheet:
>>>> "
>>>> bit name: ul_dmic_two_wire_ctl
>>>> Turns on digital microphone for two wire mode.
>>>> 0: Turn off
>>>> 1: Turn on
>>>
>>> That's rather suggestion it is not a description of hardware but you
>>> want driver to do something...
>>>
>>>> "
>>>>
>>>> On the board schematic, SoC and DMIC and linked by 3 pins:
>>>> - clk
>>>> - data0
>>>> - data1
>>>>
>>>> IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC 
>>>> must
>>>> be aware of that by reading the register value written by the driver,
>>>> using the value found in the DTS.
>>>
>>> So this depends on type of connection of DMIC? Then rephrase description
>>> property like this.
>>>
>>>>
>>>> I don't get why you think it wouldn't be hardware behavior.
>>>
>>> Because telling what to write to the registers which is typical sign of
>>> people stuffing to DT whatever they need to configure the hardware.
>>>
>>>>
>>>> Rephrase description:
>>>> "True to enable the two wire mode of the digital microphone"
>>>> Is it better ?
>>>
>>> No, because again you describe some sort of mode. If you insist on such
>>> description, then my answer is: it's runtime, so not suitable for DT.
>>> Instead describe what is the hardware problem/configuration, e.g. "DMIC
>>> is connected with only CLK and DATA0, without third pin" etc.
>>>
>>>>
>>>> About the property name, "mediatek,dmic-two-wire-ctl" sound better 
>>>> for you ?
>>>
>>> To sound more like a register less like physical characteristic of the
>>> board? No. The name can stay, I don't have better ideas.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
> 

-- 
Regards,
Alexandre

