Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A48FC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15f+b3ir248yJBPLFwNXMmDHb0AYqmrWqEK1jk7P7pA=; b=kEuCibYSqKa2iC6XO64iotLwaV
	OSFLZiMkU0rE6ZskzzqLVPIjaO17yaxeQ2QFLMvECdHKXKuToB5ez31rnZvi/lMTclsctyB14eLBp
	N8coYsTUxnJIWk5OowTegH9q14gIuqtmAPIt71WNd0at4GzIs4/deufcywsl1VoP8O9esC/uCfdBX
	V5ecJws6vcFo8y+ggnxONJIWlAI/InIeVFjN7bUh2iARHqmLqEq3AC43XAW/LTJBeVhmA3+pm7xJN
	MbThkWviL+a3PJ7difShAbJe6Da9O3b2qbD5I8u+KINv5YGNqY8GoNdg6fDNu3GfMrxyFlE3oEGpX
	4SDUNYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shPLH-0000000FmI4-3Rm4;
	Fri, 23 Aug 2024 08:08:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shPIe-0000000Fl9L-2Cyc;
	Fri, 23 Aug 2024 08:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA6CC60C2D;
	Fri, 23 Aug 2024 08:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6599DC32786;
	Fri, 23 Aug 2024 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724400335;
	bh=3DBW+FV0Qyml7NyCLmwz2xf7cfhi6345pH4If8jgZIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kQfKR5IBSmLGWLQDQGiDmbz7OBXpnBl0PHBONjiUkC1GQkZ54cBY+9SyNI2ZXF5U4
	 WuW9N+V6qBQ/Mzqo6FpoIAZX9zQdOPozG0UgzJhyhMP64Q4AqZ8FXDE5GmciBUIzN4
	 bCkCKYtr6r+a98zPVUZCP6nNsXxCKb38kVD8ucaPHrbf/db/8YsC14SS7CJl86uCMe
	 JRcMyTy1gJMTMfsZ8tLWoXmQy8Rv9+SVWDNyKezGZXlvQm0pHl7VzYPflfYKHMD8k+
	 CA679AVZpAjH7zN9oIvn+eOs3fjlNtfIQ2XNBuCnFcd3pWTIOgpE1FM8y4MXFMiPYt
	 Ihu8dvFaHNCDg==
Message-ID: <e3f2f022-aacc-41ed-8d29-b341c903ae9c@kernel.org>
Date: Fri, 23 Aug 2024 10:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: mt6397: Convert to DT schema
 format
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20240808105722.7222-1-macpaul.lin@mediatek.com>
 <2d89c86b-28b4-439f-824b-1d0560ff36bd@kernel.org>
 <fb1d3c99-c524-adfa-94b7-822801b98034@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <fb1d3c99-c524-adfa-94b7-822801b98034@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_010536_738947_A3821190 
X-CRM114-Status: GOOD (  35.46  )
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

On 23/08/2024 08:44, Macpaul Lin wrote:
> 
> On 8/8/24 20:04, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 08/08/2024 12:57, Macpaul Lin wrote:
>>> Convert the mfd: mediatek: mt6397 binding to DT schema format.
>>>
>>> New updates in this conversion:
>>>  - Align generic names of DT schema "audio-codec" and "regulators".
>>>  - mt6397-regulators: Replace the "txt" reference with newly added DT
>>>    schema.
>>>
>>> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>  .../bindings/mfd/mediatek,mt6397.yaml         | 202 ++++++++++++++++++
>>>  .../devicetree/bindings/mfd/mt6397.txt        | 110 ----------
>>
>> You are doing conversions in odd order... and ignore my comments. The
>> example from your regulator binding is supposed to be here - I wrote it
>> last time.
>>
>> Due to doing changes totally unsynchronized, this CANNOT be merged
>> without unnecessary maintainer coordination, because of dependency.
>>
>> Sorry, that's not how it works for MFD devices.
>>
>> Perform conversion of entire device in ONE patchset.
> 
> Okay, will collect the conversion of mt6323-regulator.txt and 
> rtc-mt6397.txt in the next version.
> 
>>>  2 files changed, 202 insertions(+), 110 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt
>>>
>>> Changes for v1:
>>>  - This patch depends on conversion of mediatek,mt6397-regulator.yaml
>>>    [1] https://lore.kernel.org/lkml/20240807091738.18387-1-macpaul.lin@mediatek.com/T/
> 
> [snip]
> 
>>> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT6397/MT6323 Multifunction Device
>>> +
>>> +maintainers:
>>> +  - Sen Chu <sen.chu@mediatek.com>
>>> +  - Macpaul Lin <macpaul.lin@mediatek.com>
>>> +
>>> +description: |
>>> +  MT6397/MT6323 is a multifunction device with the following sub modules:
>>
>> MFD is Linuxism, avoid it.
> 
> Will replace MFD with "power management system chip with sub-modules" 
> something like this in next version.
> 
>>> +  - Regulator
>>> +  - RTC
>>> +  - Audio codec
>>> +  - GPIO
>>> +  - Clock
>>> +  - LED
>>> +  - Keys
>>> +  - Power controller
>>> +
>>> +  It is interfaced to host controller using SPI interface by a proprietary hardware
>>> +  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
>>> +  See the following for pwarp node definitions:
>>> +  ../soc/mediatek/mediatek,pwrap.yaml
>>
>> Drop, instead add proper ref or compatible in parent node.
> 
> I'm confused here. I've checked mediatek,mt6357.yaml as a reference
> .
> It uses the similar method here.
>      "See the following for pwarp node definitions:"
>      "Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml"

What exactly is confusing? The other example is wrong. It's not a
schema, but free form text. Write schema so it would be applied and
would validate the DTS.

> 
> If "$ref: /schemas/soc/mediatek/mediatek,pwrap.yaml" is added here,
> dt_bindings_check will complain the following errors and more.
> 
> Documentation/devicetree/bindings/mfd/mediatek,mt6397.example.dtb: pmic: 
> compatible: 'oneOf' conditional failed, one must be fixed:
>          ['mediatek,mt6397'] is too short
>          'mediatek,mt6397' is not one of ['mediatek,mt2701-pwrap', 
> 'mediatek,mt6765-pwrap', 'mediatek,mt6779-pwrap', 
> 'mediatek,mt6795-pwrap', 'mediatek,mt6797-pwrap', 
> 'mediatek,mt6873-pwrap', 'mediatek,mt7622-pwrap', 
> 'mediatek,mt8135-pwrap', 'mediatek,mt8173-pwrap', 
> 'mediatek,mt8183-pwrap', 'mediatek,mt8186-pwrap', 
> 'mediatek,mt8195-pwrap', 'mediatek,mt8365-pwrap', 'mediatek,mt8516-pwrap']
>          'mediatek,mt6397' is not one of ['mediatek,mt8186-pwrap', 
> 'mediatek,mt8195-pwrap']
>          'mediatek,mt6397' is not one of ['mediatek,mt8188-pwrap']
>          from schema $id: 
> http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
> 
> Which also conflicts with the comments in the examples..

So investigate and fix this, instead of hiding the problem.

>  >> +    pwrap {
>  >
>  > Drop
> 
> Please help to check if a $ref or a compatible of pwrap should be added 
> here.

Where did you add the $ref? The child node should have it, not parent,
obviously. Just look at one of many other examples having children.

...

>>
>>> +              - const: mediatek,mt6358-rtc
>>> +
>>> +  regulators:
>>> +    type: object
>>> +    oneOf:
>>> +      - $ref: /schemas/regulator/mediatek,mt6358-regulator.yaml
>>> +      - $ref: /schemas/regulator/mediatek,mt6397-regulator.yaml
>>
>> And how is it supposed to be tested?
> 
> The dt_bindings_check didn't complain eny thing about these.

Really? Then checkout the maintainer tree, apply this patch and test
again. You know, it is impossible for us to apply a patch on top of
linux-next...


> Of course I've included the conversion patch of 
> mediatek,mt6397-regulator.yaml.


> 
>>> +    unevaluatedProperties: false
>>> +    description:
>>> +      Regulators
>>> +      For mt6323, see ../regulator/mt6323-regulator.txt
>>
>> Drop, useless.
> Should I convert it to DT schema and add to $ref above together?

Or just use compatibles. There are also examples of this - in MFD
devices, Qcom display.

> 
>>
>>> +    properties:
>>> +      compatible:
>>> +        oneOf:
>>> +          - enum:
>>> +              - mediatek,mt6323-regulator
>>> +              - mediatek,mt6358-regulator
>>> +              - mediatek,mt6397-regulator
>>> +          - items:
>>> +              - enum:
>>> +                  - mediatek,mt6366-regulator # Regulator MT6366
>>> +              - const: mediatek,mt6358-regulator
>>> +
>>> +  audio-codec:
>>> +    type: object
>>> +    unevaluatedProperties: false
>>
>> This does not make sense. You do not have any ref here.
> 
> The dt_bindings_check will complain error here.
> Will replace it with "additionalProperties: false".
> 
> 
>>> +    description:
>>> +      Audio codec
>>> +    properties:
>>> +      compatible:
>>> +        oneOf:
>>> +          - enum:
>>> +              - mediatek,mt6397-codec
>>> +              - mediatek,mt6358-sound
>>> +          - items:
>>> +              - enum:
>>> +                  - mediatek,mt6366-sound # Codec MT6366
>>> +              - const: mediatek,mt6358-sound
>>
>> This wasn't in the old binding. Commit msg also does not explain why you
>> are doing changes from conversion.
> 
> Will update new added item into commit message in next version.
> 
>>> +
>>> +  clk:
>>> +    type: object
>>> +    unevaluatedProperties: false
>>
>> Again, no, it does not work like this. See example schema for
>> explanation of this.
> 
> Will replace it with "additionalProperties: false".
> 
>> Convert all children - entire device. Then either use ref or
>> additionalProperties: true. See Qualcomm mdss bindings for example.

Oh, look here, I even mentioned Qualcomm to use as an example...

> 
> There is no more children available for the clock node of this PMIC.
> This is a clock buffer node. However, there are no sub nodes or any
> public document explain these clock buffer in public domain.
> What I've got is the compatible string in the driver.

Then I don't know what you want to express here.

> 
>>> +    description:
>>> +      Clock
>>
>> Your descriptions are useless. You just said "clk" node is "clock". Really?
> 
> Will improve it in next version.
Best regards,
Krzysztof


