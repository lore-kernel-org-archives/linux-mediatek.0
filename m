Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18DAC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=; b=4sBev3y7M1JXQaRITSWfYH8faQ
	Gj9+7SRsrEVRrbH+Nppa671zDyES2ziNV/4Rqy2tPpeh4hqg8rTJQeHeucsPDZdP+EC5mcAHnBQi3
	Lw0n6ZLDyVUfHcVLGn/TG3fIdKS4Uu88Km2i9T9ZltERTlTL5Sptx26qY6JOWNbZbbzn9ND1p8PK7
	cJqGxcXnEWHJbruwcRQePN3WZhNuSHyX0l8Fht3GkmG4zFuphKZPyDwQB+tAsKuYAYhNzt4LIXUQK
	xge9Kl0hTLMz0F+NJF0X3Ng0jclnQIPhzmo0R5q2YVCTAYf8UfkmJuHtd+S30eYQcy1ZF5yB8qZyR
	gMxH6lKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMO2l-00000005vp7-3Y9B;
	Wed, 26 Jun 2024 08:30:19 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMO2X-00000005vhd-2ouE
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 08:30:07 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52cd6784aa4so5675778e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719390603; x=1719995403; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=;
        b=MnrZrHXPTJMqxP94BCIGb2y3jIWsMpJak+HL4ahFo8a24nRnJiRAMIHbX8uysM4NrN
         Tq73bNb/6rcIfJZuhgvPqRpzakKmWIiMcsfbvzAs4RXGrgU1BkokzNRD+WVF1MI3Sxp3
         MrgXK/rH4PeKqZPpKWA7L4+eS+cSYQwpBW0/VoOfokakv+1+VOjLKo2TJ5Bu69zwmvi7
         dqQgOgBnOFYLJq+i+s4MJrjsQqyXIqmU3mMBYfsi/ycjV63V0vveoHgs45vDOLYeCcbc
         eL4tK99Pm/TgG/R2ayNKS6BNmK44JJ3RyBMB7gXWsoqECRU7aJeBeU5c0HUtReWYjCy6
         HA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719390603; x=1719995403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=;
        b=GlBFdnFblQsOATFPUWRnMuJ3QfcEer1MiExXAu3Bkn04QCBm7jC9egJiIOBFb0Cr0G
         dJXpruYaZE2k/Tab6g4c8uOff1pUZ7wjvM+EsNNp/3JcMBK5pw5CcIRYTOMVsBuFL2o4
         mAN9Cy1hS28Mxg3EHg987NzH/WzlT0GyDSCpMYVsLyYSAjtaeBMxxX7YISxEQlkn9o1e
         DCHYGgsqESkwuAr9U0jpe9KYNw7Pd7pcsX01I1CFu7gqg+rLB6hqnAKZMSdYTJoFDtgI
         DbEC0+R9sQqkguHFHfTZJfo9VNPEo2F+QK5IFsAq0NTDGTcR4iZFpHeIQY7iXBEtvNzm
         05Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVHyo7wBNK4CtuFO8pLs33nLInpDlWuPmuRpGP1UOpxK2MmcFA5/1L3VJRH0VW8aXzHTVgyu/S3ZHRyhGBqS/+PeopopqDO3CS/By7qofEK5x2P
X-Gm-Message-State: AOJu0YxbEDiYUzmRU20jkcc/qO+HtKt7AVlfmQbddTt+CjnhSbsFxbO9
	+quyWTBn3e4BytF3oGVXTS2soMi5JkPfc5olnRucnp0ANGPq0GC86HpYBUzhYkc=
X-Google-Smtp-Source: AGHT+IEca5cJU5ZW212x9C2okoEwkWZvRgPivrrUuJX0Y9+4JhwZuZye4d1Yr/SDCtFZrF/eM34AgA==
X-Received: by 2002:a05:6512:607:b0:52c:d84b:93b2 with SMTP id 2adb3069b0e04-52ce18341f9mr5698467e87.15.1719390603394;
        Wed, 26 Jun 2024 01:30:03 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c84245f0sm16687705e9.33.2024.06.26.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 01:30:03 -0700 (PDT)
Message-ID: <79811fff-4fdf-4121-9cea-6ed7e1329dad@baylibre.com>
Date: Wed, 26 Jun 2024 10:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
 <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
 <95bab90f-b196-4e79-bb88-7fd534cca721@baylibre.com>
 <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_013005_805040_9542EC48 
X-CRM114-Status: GOOD (  18.93  )
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



On 25/06/2024 15:44, Krzysztof Kozlowski wrote:
> On 25/06/2024 11:23, Alexandre Mergnat wrote:
>>
>>
>> On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
>>> On 19/06/2024 16:46, Alexandre Mergnat wrote:
>>>> Add the audio codec sub-device. This sub-device is used to set the
>>>> optional voltage values according to the hardware.
>>>> The properties are:
>>>>     - Setup of microphone bias voltage.
>>>>     - Setup of the speaker pin pull-down.
>>>>
>>>> Also, add the audio power supply property which is dedicated for
>>>> the audio codec sub-device.
>>>>
>>>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>>>> ---
>>>>    .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
>>>>    1 file changed, 33 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> index 37423c2e0fdf..d95307393e75 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> @@ -37,6 +37,32 @@ properties:
>>>>      "#interrupt-cells":
>>>>        const: 2
>>>>    
>>>> +  vaud28-supply:
>>>> +    description: 2.8 volt supply phandle for the audio codec
>>>> +
>>>> +  audio-codec:
>>>> +    type: object
>>> Still not much improved. You do not have any resources there, so these
>>> should go to the parent node.
>>
>> Hi Krzysztof,
>>
>> vaud28-supply seems to be a mistake that I forward port.
>> In the V4, AFAII, your feedback [1] suggested me to move the vaud28-supply from the "audio-codec"
>> sub-node to the parent node, which for me is the "pmic" (mfd), because the property is considered as
>> power-supply.
>>
>>       pwrap {
>>           pmic {
>>               ...
>>               audio-codec {
>>                   ...
>>
>> Hardware side, vaud28-supply is the output of PMIC-regulator subsystem, and AVDD28 is the input of
>> PMIC-audio-codec subsystem. Then:
>> - The property name is wrong and must be change to AVDD28, which is a consumer (power input), not a
>> power-supply. => description: 2.8 volt power input for microphones (AU_VIN0, AU_VIN1, AU_VIN2)
>> - IMHO, move this property to the next parent (pwrap) isn't consistent. It should be moved back to
>> Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml (Done in the V4) into audio-codec
>> substystem, beside mediatek,micbias0-microvolt
> 
> I don't understand why do we talk again about supply. My comment was not
> under the supply.

Because your word are:
"
And now you should see how odd it looks. Supplies are part of entire
chip, not subblock, even if they supply dedicated domain within that chip.

That's why I asked to put it in the parent node.
"

My bad, I forgot to link you the old message in my previous answer [1]

[1] https://lore.kernel.org/all/6d21da37-8be7-467c-8878-d57af0b0201b@kernel.org/#t

-- 
Regards,
Alexandre

