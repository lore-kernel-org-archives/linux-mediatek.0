Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200C0C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 09:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMmaHFxsdOxXG7OCPRHkrxQe1P3t75LjLh+737W0FeA=; b=den7J9tibcCUOIDbIeqkuz1lj6
	8KK8X8ls0Q1TzmSGAH6C/NBYDDlkG5ul2ZC81TAt9HTsSIQlfX548EaptnBaC3ILsCDJCAuve0KVU
	vPo0rqtiRSolGVuGzxR2EkSgZczr7W300+4AxpFUKXz74IFiGzH9V+DWmkOu7SofsQyL8L2izDkmi
	KnahvropNxPI2B5jMcYZ0UReeO2mubkvua7KYwcWcY4p0t2rBxDKybKsu2TzKLhkOK9Xs9u0UHS/7
	EU2IU3eqnsbAMHiVObfnaASbvO9/NHHmbiO0PnRRBBo71OWQIYvn0+Gov4jj1BdcP03kJCPfO2IF7
	GxBEL7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfG5N-00000008dwS-2GS8;
	Wed, 28 Feb 2024 09:18:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfG5J-00000008du4-2nBQ
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Feb 2024 09:18:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33d0a7f2424so3555436f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Feb 2024 01:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709111920; x=1709716720; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMmaHFxsdOxXG7OCPRHkrxQe1P3t75LjLh+737W0FeA=;
        b=c+yRNUfxD20G/pRJxFDtu1jxnYp+YKGwm8FdFWirDHWBvFrjqMrcUQpgP+4MFz3kgc
         o89+gse6R8dpuhWUhLUBIf8eh/okdcMd8EJwORNdVzXfpAZs/RIFR5V9WmFQ6BQQss3R
         gABxjBl+zaFK2FxS+/19HwAPtmGflIsNKNngyIV5DW69sorO3d/t578A4Ty9nMgDBVyL
         jIR4jjZU9OoO3x88nJmKskAE4iazFLuazUxXUe4xy5NTTvmx/lROq/1vCLUSGRnIREle
         /8gFQrqLZb9yzdilFIu6yWG9w2IB9pDDF+CD4v37DzDb9x5nuI/Iwcuriw/yR/WqaOG4
         0VZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709111920; x=1709716720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMmaHFxsdOxXG7OCPRHkrxQe1P3t75LjLh+737W0FeA=;
        b=OFPjkdtDY26faZEN+RDye8httTUS6PQUFtsniyHgRmE8jwBWsT8NockrUt9c1f6Kqb
         Ny3CJbkOwKGbCw6IS4mJaNi5wopX8d7rAnrqvs/+y8j6pCOeUdcMJF1CxGII9ZanEpyh
         lvpB5OtSCays6Mr3LR+xOblo2YkruVE/ExAzrt1Fp+Bue2BPjMJBTgzzW6/WOmFmRJ7W
         A2X7+LcKDUmKJ4b2jgXFaHOfvH5OP+NW5e5+ro5O+O6FkPP66YEzxucOs+ZQFEtnqI/H
         +UYSC07eipbsYb58dmWEK/3kwgopnyDh1ur6mCb7atySsWt/RgSmwkRb4SJdJiF/ol6t
         TYDw==
X-Forwarded-Encrypted: i=1; AJvYcCVnUvADHNHQDgreXjFzjh4qX+Qs+ydtWejpX2DEEtXhWGIu/6/tgoaAt2DIlETLkrn9BGAaZLZVP2x2H/ld3PcFez9TnfKClz4S4vC6Za9QtF49
X-Gm-Message-State: AOJu0Yz0W21beke+OnrrENUx/dDT/iT/24N9MVQa4prywXS7aOEZAJMD
	OeztMXMXzCpOOiJQVYdpUnJSUyxvU9phf6WIkAtYZ8mikVAuaR9BwEebntXiKqujEy+ZbWk8WqO
	P
X-Google-Smtp-Source: AGHT+IHl+T1jJDOelrcnlLr/v3d1Q6gKha6LkXJVtKyTJdnBjWcimArxu7uFwJpoiZ24rSsAKDTJ4Q==
X-Received: by 2002:adf:fd8e:0:b0:33d:af84:2a59 with SMTP id d14-20020adffd8e000000b0033daf842a59mr7977078wrr.28.1709111919598;
        Wed, 28 Feb 2024 01:18:39 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600003ce00b0033dd06e628asm10602047wrg.27.2024.02.28.01.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 01:18:39 -0800 (PST)
Message-ID: <77509c18-a4a8-4803-8370-cdcaa175ada1@baylibre.com>
Date: Wed, 28 Feb 2024 10:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
 <20240226-audio-i350-v1-2-4fa1cea1667f@baylibre.com>
 <e15fdb18-d4de-495f-b90b-ba0e787cbef4@collabora.com>
 <92b9e9ac-6265-4611-888d-ba74bb871be5@baylibre.com>
 <e0907559-121f-4cdf-8b5a-744295ec85b3@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <e0907559-121f-4cdf-8b5a-744295ec85b3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_011841_964934_F2457F21 
X-CRM114-Status: GOOD (  24.50  )
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



On 27/02/2024 13:38, AngeloGioacchino Del Regno wrote:
> Il 27/02/24 11:23, Alexandre Mergnat ha scritto:
>>
>>
>> On 26/02/2024 16:30, AngeloGioacchino Del Regno wrote:
>>> Il 26/02/24 15:01, Alexandre Mergnat ha scritto:
>>>> Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.
>>>>
>>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> ---
>>>>   .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 127 
>>>> +++++++++++++++++++++
>>>>   1 file changed, 127 insertions(+)
>>>>
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
>>>> new file mode 100644
>>>> index 000000000000..f469611ec6b6
>>>> --- /dev/null
>>>> +++ 
>>>> b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
>>>> @@ -0,0 +1,127 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Mediatek MT8365 sound card with MT6357 sound codec.
>>>> +
>>>> +maintainers:
>>>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>>>> +
>>>> +description:
>>>> +  This binding describes the MT8365 sound card.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: mediatek,mt8365-mt6357
>>>> +
>>>> +  mediatek,hp-pull-down:
>>>> +    description:
>>>> +      Earphone driver positive output stage short to the
>>>> +      audio reference ground.
>>>> +      Default value is false.
>>>> +    type: boolean
>>>> +
>>>> +  mediatek,micbias0-microvolt:
>>>> +    description: |
>>>
>>> description: Selects MIC Bias 0 output voltage
>>>
>>>> +      Selects MIC Bias 0 output voltage.
>>>> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
>>>> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
>>>
>>> No, you don't say 0 1 2 3 4 to a property that says "microvolt", 
>>> that's simply
>>> wrong.
>>>
>>> mediatek,micbias0-microvolt = <2100000>;
>>>
>>> ...so you want a binding that says
>>> enum: [ 1700000, 1800000, this, that, 2700000]
>>>
>>
>> Is it correct if I put "description: Selects MIC Bias 0 output voltage 
>> index" ?
>>
> 
> No, it's still not correct. You have to pass microvolt values.
> 
> The driver will then transform the microvolt values to the index and 
> subsequently
> write the index value to the hardware registers.
> 
> The bindings shall be generic, in the sense that they shall not express 
> hardware
> register values... and this is especially true when we have a value that 
> *does*
> actually have means to be expressed in common units.
> 
> Besides, in the cases in which there's no common units involved, the 
> values most
> probably won't be suited for devicetree//bindings, so those would be 
> hardcoded in
> the driver as platform data.
> 
> This is not the case, so, please keep this property but specify 
> microvolts in the
> bindings (and obviously in devicetree).

Got it, thx !

> 
>>>> +
>>>> +  mediatek,micbias1-microvolt:
>>>> +    description: |
>>>> +      Selects MIC Bias 1 output voltage.
>>>> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
>>>> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
>>>
>>> same here.
>>>
>>>> +
>>>> +  mediatek,platform:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: The phandle of MT8365 ASoC platform.
>>>> +
>>>> +  pinctrl-names:
>>>> +    minItems: 1
>>>> +    items:
>>>> +      - const: aud_default
>>>> +      - const: aud_dmic
>>>> +      - const: aud_miso_off
>>>> +      - const: aud_miso_on
>>>> +      - const: aud_mosi_off
>>>> +      - const: aud_mosi_on
>>>> +
>>>> +  vaud28-supply:
>>>> +    description:
>>>> +      2.8 volt supply for the audio codec
>>>> +
>>>> +patternProperties:
>>>> +  "^dai-link-[0-9]+$":
>>>> +    type: object
>>>> +    description:
>>>> +      Container for dai-link level properties and CODEC sub-nodes.
>>>> +
>>>> +    properties:
>>>> +      codec:
>>>> +        type: object
>>>> +        description: Holds subnode which indicates codec dai.
>>>> +
>>>> +        properties:
>>>> +          sound-dai:
>>>> +            maxItems: 1
>>>> +            description: phandle of the codec DAI
>>>> +
>>>> +        additionalProperties: false
>>>> +
>>>> +      link-name:
>>>> +        description:
>>>> +          This property corresponds to the name of the BE dai-link 
>>>> to which
>>>> +          we are going to update parameters in this node.
>>>> +        items:
>>>> +          const: 2ND I2S BE
>>>> +
>>>> +      sound-dai:
>>>> +        maxItems: 1
>>>> +        description: phandle of the CPU DAI
>>>> +
>>>> +    additionalProperties: false
>>>> +
>>>> +    required:
>>>> +      - link-name
>>>> +      - sound-dai
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - mediatek,platform
>>>> +  - pinctrl-names
>>>> +  - vaud28-supply
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    sound {
>>>> +        compatible = "mediatek,mt8365-mt6357";
>>>> +        mediatek,platform = <&afe>;
>>>
>>> Please:
>>>
>>> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>>
>> Is it about the wrong pinctrl-names tab alignment ?
>> Also, 2ND I2S BE => 2ND_I2S_BE ?
>> Otherwise, I don't get it sorry.
>>
> 
> ...as Krzysztof already clarified, won't repeat :-P

Yes it is, I will fix that.

> 
> Cheers!
> 
>>>
>>> Regards,
>>> Angelo
>>>
>>>> +        pinctrl-names = "aud_default",
>>>> +            "aud_dmic",
>>>> +            "aud_miso_off",
>>>> +            "aud_miso_on",
>>>> +            "aud_mosi_off",
>>>> +            "aud_mosi_on";
>>>> +        pinctrl-0 = <&aud_default_pins>;
>>>> +        pinctrl-1 = <&aud_dmic_pins>;
>>>> +        pinctrl-2 = <&aud_miso_off_pins>;
>>>> +        pinctrl-3 = <&aud_miso_on_pins>;
>>>> +        pinctrl-4 = <&aud_mosi_off_pins>;
>>>> +        pinctrl-5 = <&aud_mosi_on_pins>;
>>>> +        vaud28-supply = <&mt6357_vaud28_reg>;
>>>> +
>>>> +        /* hdmi interface */
>>>> +        dai-link-0 {
>>>> +            sound-dai = <&afe>;
>>>> +            link-name = "2ND I2S BE";
>>>> +
>>>> +            codec {
>>>> +                sound-dai = <&it66121hdmitx>;
>>>> +            };
>>>> +        };
>>>> +    };
>>>>
>>>
>>
> 
> 

-- 
Regards,
Alexandre

