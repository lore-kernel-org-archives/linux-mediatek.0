Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AEDC54E41
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 09:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qg3bz6jhBZS7ET92hBbbxbLJcdz5hFSe7r4a1+zUYlM=; b=uUvZCdvO8r/55ZeYIuxa/Kz3hk
	/QaEM4SwzbWiSleRbiKI/bc/Z7SEc+TKcM6PCaTRM2xu/r6ABv/tGvFgA/hyAk5Csfx1u5w2vsKLL
	ylteqi0lWh8Pmge+5S9micPWzXp+6wuC3pHlQPScbgqH0BeCkd3AVK3inPS7E2+JLYoXubIxCtCju
	27uOxu5vOSw08Ji4HB0GF/tWa7gx1knxJE0Zmzi636+xl2/V3fqFx8Wqb75SqkHpzqXlKGhIs9RjC
	C3IOeLX0uWz326e7gvQfhZisDWsXEFKnLp2fjX3qWANcoZ0Dh2gd6UkRfQc8edDAsJGupuTCq8H4b
	g79sgHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGgl-00000008kqE-2IlT;
	Wed, 28 Feb 2024 09:57:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGgi-00000008kot-1YNo
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Feb 2024 09:57:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-412a14299a4so29184525e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Feb 2024 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709114239; x=1709719039; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qg3bz6jhBZS7ET92hBbbxbLJcdz5hFSe7r4a1+zUYlM=;
        b=cQYP/lwltqnNX1GQMw7qq6kss03ZiBqXrubHYuYxtGNfN4wFY1eO5kPvbeACOALA9g
         vAM29WkzpLuBXTy/3h6pE/GsOVqCidUxlCAlh+d/M8K0hbgvi0LUgFn5PjwOrLbfstK4
         s5ONARm/bJXOWJstzmY01old60IU+jKkOKDsUNl4wrRhK5AH2eVkhynPfURayAOleqln
         ml5EdiS1+87khYQ9jAtVmEHuz89aTFhHuiwSWaww9DyeqbezSF3nLyNDCL9Mxm3nhtD2
         60R4v6cVzkUvXFiHIcGIP0dJ84zs+a/tglpbBjTTWghDEsNbZgiHwe/8+ZVa2jqt5mzs
         5Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709114239; x=1709719039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qg3bz6jhBZS7ET92hBbbxbLJcdz5hFSe7r4a1+zUYlM=;
        b=t5hrIrfScH+PbS3O8Gw9yAxyy3RPXCIspURHFK2RkSYtVpmDCqL0sk2mrXJ/tv82F+
         It8vndfrLLYqt3Xj4OrcTLEpSj4Wrr5NoFOGX9xOagQY9wHszA+u0znsTWuZwm7XQ9zT
         v7qJVMBaCxcSjZy7VGcx3z3gJq6qLTlxUl/rotECpJGzelylARH7XhGOzoRc2eigvd6Z
         v0NLYGO6R+2qwPxlEOCMv/97ilKLywM9FH5Zr4OG3YxD2mbGIH0P36/ahnME83MBbq6x
         rDa/lWjrZ/PjgK9QWlFyivPk6FZW0T7qVgDuYKPLzQBwEx+nxtp/Mv5dm0PwLTW1IWb6
         MjVg==
X-Forwarded-Encrypted: i=1; AJvYcCU/YnwAY58jeeCpW5RY/2q13s4flqYFh6wz8w75TatJfoHbdlx8jdjlK+W3GINOK5vCMtofGqrH8cgmeKr3Tr8tJ+XOj1PJVl/EAvMXNPxYZRdF
X-Gm-Message-State: AOJu0YwFZrNf/EuKAMltcouXdayh6J6McchfKqyyxNplPcO7ZyLz13bp
	YsNnTShtoxM3a8642JwjeQLO8N/evVbtMAEpYD4wvx5klK3VM4C4lZRqp4UGPfk=
X-Google-Smtp-Source: AGHT+IGdYYc+4l8lA19KSveVtxa+iJnXttf25DgJgoEb24NGtWPvG7/6OUbeiGefYFJlE7T6JjPt3Q==
X-Received: by 2002:a05:600c:3b9d:b0:412:b623:bbcc with SMTP id n29-20020a05600c3b9d00b00412b623bbccmr529089wms.10.1709114238861;
        Wed, 28 Feb 2024 01:57:18 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c351100b00412b3bf811bsm1537547wmq.8.2024.02.28.01.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 01:57:18 -0800 (PST)
Message-ID: <66e527af-0253-4565-9822-04ed84e5817c@baylibre.com>
Date: Wed, 28 Feb 2024 10:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
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
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <bd4bf6ae-350e-4ee6-a924-7dd31b2c6034@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_015720_454621_9364777B 
X-CRM114-Status: GOOD (  33.95  )
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

I think I got it.

- mediatek,i2s-shared-clock: will be remove from DT
- mediatek,dmic-iir-on: will be remove from DT
- mediatek,dmic-irr-mode: will be remove from DT
- mediatek,dmic-two-wire-mode: rephrase description needed

I've did abstraction (despite me) that IIR settings are runtime config 
because the driver implement its usage like a one-time-setup -_-'

Thanks for the explanations, that help.

Regards,
Alexandre

On 28/02/2024 08:28, Krzysztof Kozlowski wrote:
> On 27/02/2024 16:18, Alexandre Mergnat wrote:
>>>
>>>> +    type: boolean
>>>> +
>>>> +  mediatek,dmic-iir-on:
>>>> +    description:
>>>> +      Boolean which specifies whether the DMIC IIR is enabled.
>>>> +      If this property is not present the IIR is disabled.
>>>
>>> "is enabled" or "enable it"?
>>>
>>> You described the desired Linux feature or behavior, not the actual
>>> hardware. The bindings are about the latter, so instead you need to
>>> rephrase the property and its description to match actual hardware
>>> capabilities/features/configuration etc.
>>
>> I will rephrase:
>>
>> True to enable the Infinite Impulse Response (IIR) filter
>> on the digital microphone inputs.
> 
> I still don't know why this is DT-specific. You still tell driver what
> to do...
> 
>>
>>>
>>>> +    type: boolean
>>>> +
>>>> +  mediatek,dmic-irr-mode:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      Selects stop band of IIR DC-removal filter.
>>>> +      0 = Software programmable custom coeff loaded by the driver.
>>>
>>> Bindings are for hardware, not drivers. Why is this a property of board DTS?
>>
>> Actually this is a hardware feature. Mode 1 t 5 are predefined filters.
>> Mode 0, the HW will read some "coef filter registers" to setup the
>> custom filter. the "coef filter regs" are written by the driver.
>> Currently the coef values are hardcoded in the driver.
> 
> You don't get the point. Just because you choose some mode it does not
> mean is hardware feature for DT. Sampling frequency done by hardware is
> also "hardware feature", but do you put it to DT? No.
> 
> Explain why this is board-specific, not runtime configuration.
> 
>>
>>>
>>>> +      1 = 5Hz if 48KHz mode.
>>>> +      2 = 10Hz if 48KHz mode.
>>>> +      3 = 25Hz if 48KHz mode.
>>>> +      4 = 50Hz if 48KHz mode.
>>>> +      5 = 65Hz if 48KHz mode.
>>>
>>> Use proper unit suffixes - hz.
>>>
>>>
>>>> +    enum:
>>>> +      - 0
>>>> +      - 1
>>>> +      - 2
>>>> +      - 3
>>>> +      - 4
>>>> +      - 5
>>>> +
>>>> +  mediatek,dmic-two-wire-mode:
>>>> +    description:
>>>> +      Boolean which turns on digital microphone for two wire mode.
>>>> +      If this property is not present the two wire mode is disabled.
>>>
>>> This looks like hardware property, but the naming looks like SW. Again
>>> you instruct what driver should do. Standard disclaimer:
>>>
>>> You described the desired Linux feature or behavior, not the actual
>>> hardware. The bindings are about the latter, so instead you need to
>>> rephrase the property and its description to match actual hardware
>>> capabilities/features/configuration etc.
>>
>> Actually this is a hardware feature. This is ALL I have to describe the
>> HW behavior from the datasheet:
>> "
>> bit name: ul_dmic_two_wire_ctl
>> Turns on digital microphone for two wire mode.
>> 0: Turn off
>> 1: Turn on
> 
> That's rather suggestion it is not a description of hardware but you
> want driver to do something...
> 
>> "
>>
>> On the board schematic, SoC and DMIC and linked by 3 pins:
>> - clk
>> - data0
>> - data1
>>
>> IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC must
>> be aware of that by reading the register value written by the driver,
>> using the value found in the DTS.
> 
> So this depends on type of connection of DMIC? Then rephrase description
> property like this.
> 
>>
>> I don't get why you think it wouldn't be hardware behavior.
> 
> Because telling what to write to the registers which is typical sign of
> people stuffing to DT whatever they need to configure the hardware.
> 
>>
>> Rephrase description:
>> "True to enable the two wire mode of the digital microphone"
>> Is it better ?
> 
> No, because again you describe some sort of mode. If you insist on such
> description, then my answer is: it's runtime, so not suitable for DT.
> Instead describe what is the hardware problem/configuration, e.g. "DMIC
> is connected with only CLK and DATA0, without third pin" etc.
> 
>>
>> About the property name, "mediatek,dmic-two-wire-ctl" sound better for you ?
> 
> To sound more like a register less like physical characteristic of the
> board? No. The name can stay, I don't have better ideas.
> 
> 
> Best regards,
> Krzysztof
> 


