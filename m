Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258CEC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Il1fLpnIw62f1EPFFu5UIbfJ788oXdqBQbcrArB3mHk=; b=b2cDcdrL259D9cgdytdUhVnR3y
	dVqBUgE2GfXCiSR8CizkxU+xtEbtlJuqY46axppky+sVLao7FZyoZgwAjWd8qQQTl/pSoqs24vsIv
	jKx3mi/nr+p5Z1ift6MpkrC2wKaFX0T9bpU+CdleFDfhYMI2XtsPjTLoC/Li8zssnryNrKqod/5RX
	YDz78AOyyveI0oAwY9bp2VWrvoGZxTy7jhhw3OvjHqKEicbXqme1J8eb+UKDe00EaoEZwXBFL3tWk
	bBidz3cn5MrRyXiaro3QJmCPCkRsIg0sfgeo7XH37Ra1qv7ftzFBo9b1qy1Ftvws81M4Jjnr/mZpF
	idxhbtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOjs-0000000666s-2DFx;
	Wed, 26 Jun 2024 09:14:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOhz-000000065Z6-0z72;
	Wed, 26 Jun 2024 09:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83A1661883;
	Wed, 26 Jun 2024 09:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F13DC2BD10;
	Wed, 26 Jun 2024 09:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719393174;
	bh=qRy4tUMDP+Uxf64KBaFAJesy6ZVQGIcbefa8y1zH8ek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=huIXkH714nccd7u6UXnSxPFS9BLjkaTQHRbRCF9MeeQ14XucSjFxV0+GqCqpXjBLy
	 AsQE66jxo1OQf6K+JOAy6dDrGU/OVUefIdvVAk6jiqN+soAw6a7r3Xfgdl8mr93LJX
	 1LrlU0agu6md+Ai+FuY6GUqh5+W9dif+iPid7UmWNI9Pyfb7nYo71Ml4W6/A2GzpEh
	 JpcpplmIyUPpB99ejbKeyHv2zqiwMdh9f/dGrAReyBpGsi1nkL97+nSl3sq3uUlbGq
	 NfTQFqch2s8HGRFGct0rrJhc5IeOcoH3aw1B59aI2y1ISHiTa1q5JePP69N3ezAaTI
	 eOR55AOf+uMtQ==
Message-ID: <5dad1ef4-4dc8-4f36-9150-fbe8b388a6d7@kernel.org>
Date: Wed, 26 Jun 2024 11:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
To: Alexandre Mergnat <amergnat@baylibre.com>,
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
 <79811fff-4fdf-4121-9cea-6ed7e1329dad@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <79811fff-4fdf-4121-9cea-6ed7e1329dad@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_021255_413365_D717AABA 
X-CRM114-Status: GOOD (  18.74  )
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

On 26/06/2024 10:30, Alexandre Mergnat wrote:
> 
> 
> On 25/06/2024 15:44, Krzysztof Kozlowski wrote:
>> On 25/06/2024 11:23, Alexandre Mergnat wrote:
>>>
>>>
>>> On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
>>>> On 19/06/2024 16:46, Alexandre Mergnat wrote:
>>>>> Add the audio codec sub-device. This sub-device is used to set the
>>>>> optional voltage values according to the hardware.
>>>>> The properties are:
>>>>>     - Setup of microphone bias voltage.
>>>>>     - Setup of the speaker pin pull-down.
>>>>>
>>>>> Also, add the audio power supply property which is dedicated for
>>>>> the audio codec sub-device.
>>>>>
>>>>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>>>>> ---
>>>>>    .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
>>>>>    1 file changed, 33 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>>> index 37423c2e0fdf..d95307393e75 100644
>>>>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>>> @@ -37,6 +37,32 @@ properties:
>>>>>      "#interrupt-cells":
>>>>>        const: 2
>>>>>    
>>>>> +  vaud28-supply:
>>>>> +    description: 2.8 volt supply phandle for the audio codec
>>>>> +
>>>>> +  audio-codec:
>>>>> +    type: object
>>>> Still not much improved. You do not have any resources there, so these
>>>> should go to the parent node.
>>>
>>> Hi Krzysztof,
>>>
>>> vaud28-supply seems to be a mistake that I forward port.
>>> In the V4, AFAII, your feedback [1] suggested me to move the vaud28-supply from the "audio-codec"
>>> sub-node to the parent node, which for me is the "pmic" (mfd), because the property is considered as
>>> power-supply.
>>>
>>>       pwrap {
>>>           pmic {
>>>               ...
>>>               audio-codec {
>>>                   ...
>>>
>>> Hardware side, vaud28-supply is the output of PMIC-regulator subsystem, and AVDD28 is the input of
>>> PMIC-audio-codec subsystem. Then:
>>> - The property name is wrong and must be change to AVDD28, which is a consumer (power input), not a
>>> power-supply. => description: 2.8 volt power input for microphones (AU_VIN0, AU_VIN1, AU_VIN2)
>>> - IMHO, move this property to the next parent (pwrap) isn't consistent. It should be moved back to
>>> Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml (Done in the V4) into audio-codec
>>> substystem, beside mediatek,micbias0-microvolt
>>
>> I don't understand why do we talk again about supply. My comment was not
>> under the supply.
> 
> Because your word are:
> "
> And now you should see how odd it looks. Supplies are part of entire
> chip, not subblock, even if they supply dedicated domain within that chip.
> 
> That's why I asked to put it in the parent node.
> "
> 
> My bad, I forgot to link you the old message in my previous answer [1]
> 
> [1] https://lore.kernel.org/all/6d21da37-8be7-467c-8878-d57af0b0201b@kernel.org/#t

And you implemented this, so why do we talk again about it? It is
already solved, isn't it? Since previous version?

Best regards,
Krzysztof


