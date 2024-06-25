Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F610C30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlRhdkp6kAFepHjID66aLvJv1DZVnaI5n6pLIDvUVYM=; b=h15Lvsod7p/Xl+Ga0xqlXeAyyL
	+OBBP3lkIkbzt+GXZxiL/+yDiqJbiLMX5EX7BvzVHOj9w6JE6wZ7JsbN4I9xM8XjH9DUa232F3fIs
	H/q/Z1V47ttsUi5cZLDXRyXhPwDZy/WYR6jytqGiLsCyRXVUgEm5fHL9mbSYYSkYKGIE6J7S4bsuq
	Wpda9OjvsjdmiDDmZDIMuGKOZAAcVUramhANV7KgAKtpg7frEwz+y8EQQ4NMISbfmnNd9fCer4gPx
	lsjigEYchrLNUdJVGKEoebGvJmr5YObchyGwxUx1XblxmZtktFZlbExIZB7Y0UJU8emU5Q352vHht
	GoEERnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2OQ-00000002G4p-2eO5;
	Tue, 25 Jun 2024 09:23:14 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2OJ-00000002G1j-0xOk
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jun 2024 09:23:09 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso30558311fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jun 2024 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719307385; x=1719912185; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LlRhdkp6kAFepHjID66aLvJv1DZVnaI5n6pLIDvUVYM=;
        b=SPaZZFpCjlsZtQRhiL5PRiUj4GktaN0rD7wyk8ZHRSGh4+mik863w8EGGmEzSx47ZS
         J2NjuSKANTtjElSNJHaeENJ1mei7GMAMEGWsEnjHlI0CtTKi/277zHTgC310j/SacqeL
         m+nQM/FdYJwG5Wm7pJrC+r2gmSznuDXYK/PbKbBDoTzxoauclqR3xz6iSGhkfDRTZ36G
         ytF0bAZAuKt8SPhUWJVQRL/Imc2jEE2xe4NlV9tRwVLeT53xhzKm124CWFIcAqvtRpgm
         jPbANi7VAj/yi4WAiAKTe0rBCQf2fZdQWuoiEYlejmXnAP1DgBQnMSL6aLYV1OvQYsz6
         oGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719307385; x=1719912185;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LlRhdkp6kAFepHjID66aLvJv1DZVnaI5n6pLIDvUVYM=;
        b=j6LQoWOOMvjjQy4/oQVzDgxXpQTaOREBC6YecUHzpDnUyCI7vtP+atoTR8ZAU9xXbS
         9LoNP6J8u3QmSZl5eSw/2VYd6j//4Wi3nSBJAVu79EfKBcFeReEX0Z5qlVcFO3L7WCiI
         Z6qcA/EYqUj2DeSz1nzhJtJUI1tohw9dS9AeqrLbCCElkzixqwmWmuOSj1++qYyOXXT/
         7jM9ml0E2IAArLANrIFVLnqb05oZEdbJl62o/tBinmt9GE8trDhmhBLIH0+UT1mth8+3
         WTZOFkPB3fvxexm1X4IhqdrjArLyZhgRGrXQQ9PEjCycp7xpoZQXLa7t6ERoZsWzXmU/
         wXTw==
X-Forwarded-Encrypted: i=1; AJvYcCXWgR8Df1IaCfM/tEl00ydJZpwm9GBnC3y08XBNFcejOQ7jK0bVWhnQLdUqW8p5j5tRnrM4h80VSEd2XCRUcZTSPs/QHZkEFP8/aW8Pbh39I0Te
X-Gm-Message-State: AOJu0YzNzzAwA53WULSWYrkXb5Hxnxa/4uHEhR4lUsuQQ9sjj26AkbRe
	oOktONUVpW9B1HKmqYhtiXT2CAdbFSl5yLEpzdvC/XVcYA3VUSVIgt7a9S+meQc=
X-Google-Smtp-Source: AGHT+IETSGc5PC+/KSXGB7oMPpuYoRZNE+bp/p6Mqr9WgOryoy8prGpDjhg+IZxxEgRRH3Pn20MxJA==
X-Received: by 2002:a05:6512:3e24:b0:52c:dff5:8087 with SMTP id 2adb3069b0e04-52ce185f998mr5011614e87.51.1719307384919;
        Tue, 25 Jun 2024 02:23:04 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366f624cdacsm4476317f8f.70.2024.06.25.02.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 02:23:04 -0700 (PDT)
Message-ID: <95bab90f-b196-4e79-bb88-7fd534cca721@baylibre.com>
Date: Tue, 25 Jun 2024 11:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
 <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
Content-Language: en-US
In-Reply-To: <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_022307_293803_37D870A6 
X-CRM114-Status: GOOD (  17.46  )
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



On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
> On 19/06/2024 16:46, Alexandre Mergnat wrote:
>> Add the audio codec sub-device. This sub-device is used to set the
>> optional voltage values according to the hardware.
>> The properties are:
>>    - Setup of microphone bias voltage.
>>    - Setup of the speaker pin pull-down.
>>
>> Also, add the audio power supply property which is dedicated for
>> the audio codec sub-device.
>>
>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>> ---
>>   .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>> index 37423c2e0fdf..d95307393e75 100644
>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>> @@ -37,6 +37,32 @@ properties:
>>     "#interrupt-cells":
>>       const: 2
>>   
>> +  vaud28-supply:
>> +    description: 2.8 volt supply phandle for the audio codec
>> +
>> +  audio-codec:
>> +    type: object
> Still not much improved. You do not have any resources there, so these
> should go to the parent node.

Hi Krzysztof,

vaud28-supply seems to be a mistake that I forward port.
In the V4, AFAII, your feedback [1] suggested me to move the vaud28-supply from the "audio-codec" 
sub-node to the parent node, which for me is the "pmic" (mfd), because the property is considered as 
power-supply.

     pwrap {
         pmic {
             ...
             audio-codec {
                 ...

Hardware side, vaud28-supply is the output of PMIC-regulator subsystem, and AVDD28 is the input of 
PMIC-audio-codec subsystem. Then:
- The property name is wrong and must be change to AVDD28, which is a consumer (power input), not a 
power-supply. => description: 2.8 volt power input for microphones (AU_VIN0, AU_VIN1, AU_VIN2)
- IMHO, move this property to the next parent (pwrap) isn't consistent. It should be moved back to 
Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml (Done in the V4) into audio-codec 
substystem, beside mediatek,micbias0-microvolt

Does this sound good to you ?

-- 
Regards,
Alexandre

