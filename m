Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD953C83F01
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Aug 2023 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6W9mzAtKWx51Rskvge5H/u9ebJrwzLGVXRJcxA2W1lc=; b=EXPRqd2QTtZCYkMYVWTBOWrkP2
	e/wpESBHlWg+iLR8QfEWNshlyp88gi8lZHlhRm1/tvoIQ1tQRSogTbE67cPsmmI5WkAtfMwAWFqGi
	C+e3N49YWFUpGVQ5klZBksxxZ7iTzjgLioiiStVMYyg9N4rs+lBZ48geSsijJrbCaLRbTEfSrtywA
	tiFKgsPoFyKtyD3m2QICThSola+wBjCtIHoyYha+ERz/mzeshX7YtwVc0DmIgtBn/k/dIWZIzZu2T
	IyzREAfbaExFa2VK1U7EqzUM/w5vQeh1ght1hE/P06mRmt9VYQ8JCFJ9VtP5k9S86862zJsleHELZ
	9UnQwoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBMv-007gNQ-28;
	Sun, 27 Aug 2023 08:43:37 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBMr-007gHc-1X;
	Sun, 27 Aug 2023 08:43:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 657771BF203;
	Sun, 27 Aug 2023 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1693125805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6W9mzAtKWx51Rskvge5H/u9ebJrwzLGVXRJcxA2W1lc=;
	b=XoVn4kftWxFmAtZIw9B2AzmBInIn0jYC93DYDeLPOUJv0H7dlA91Pz6N+VHHOTbEKtQY/9
	fk51wtb4HRR40ics2fbs2eZOG3eDJbled2zeMMv0KHUPHmEx4MJQRzVD+4DjZ5KZTQoAVk
	56hxw+yoMZ4+/t47HK0qHQMx+6t4Ur6dsNepoAk4ZDAOY3cBgBavGiMjq0EXgmGk4oU1kW
	8fsvZu/OTEM9VAfjWOSoRHdTdN89EJdOzYcOHjoH/YyXevb7sYm55pk0O56I1VmcF1XZxt
	DAQxgg2/3APPuOww2pAG7kWM8wMMNiPa/caU4OdPcNizzdq+qEbKwdinGgcAHw==
Message-ID: <4abd22a6-ec79-42ea-a143-40a40462b73c@arinc9.com>
Date: Sun, 27 Aug 2023 11:42:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230821174423.GA2008354-robh@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230821174423.GA2008354-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_014333_793586_29AA7502 
X-CRM114-Status: GOOD (  17.77  )
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

On 21.08.2023 20:44, Rob Herring wrote:
> On Sat, Aug 12, 2023 at 10:20:43PM +0300, Arınç ÜNAL wrote:
>> I've realised there are more schemas that extend the mdio.yaml schema. This
>> is the final state of this patch.
>>
>> dt-bindings: net: dsa: document internal MDIO bus
>>
>> Add the schema to document the internal MDIO bus. Require the phy-handle
>> property on the non-CPU ports if the mdio property is being used.
>>
>> Define the mdio property on all of the schemas that refer to
>> dsa.yaml#/$defs/ethernet-ports. Refer to dsa.yaml#/properties/mdio to point
>> the human readers to the description on the dsa.yaml schema.
>>
>> Some of these schemas extend the mdio.yaml schema. The mdio.yaml schema is
>> also being referred to through dsa.yaml#/$defs/ethernet-ports now which
>> means we cannot disallow additional properties by 'unevaluatedProperties:
>> false' on the dsa.yaml schema.
>>
>> ---
>>   .../bindings/net/dsa/arrow,xrs700x.yaml        |  4 ++++
>>   .../devicetree/bindings/net/dsa/brcm,b53.yaml  |  4 ++++
>>   .../devicetree/bindings/net/dsa/brcm,sf2.yaml  |  4 ++++
>>   .../devicetree/bindings/net/dsa/dsa.yaml       | 18 ++++++++++++++++++
>>   .../bindings/net/dsa/hirschmann,hellcreek.yaml |  4 ++++
>>   .../bindings/net/dsa/mediatek,mt7530.yaml      |  4 ++++
>>   .../bindings/net/dsa/microchip,ksz.yaml        |  4 ++++
>>   .../bindings/net/dsa/microchip,lan937x.yaml    |  2 +-
>>   .../bindings/net/dsa/mscc,ocelot.yaml          |  4 ++++
>>   .../bindings/net/dsa/nxp,sja1105.yaml          |  4 ++++
>>   .../devicetree/bindings/net/dsa/qca8k.yaml     |  2 +-
>>   .../devicetree/bindings/net/dsa/realtek.yaml   |  2 +-
>>   .../bindings/net/dsa/renesas,rzn1-a5psw.yaml   |  2 +-
>>   13 files changed, 54 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml b/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
>> index 9565a740214629..f0229352e05694 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
>> @@ -29,6 +29,10 @@ properties:
>>     reg:
>>       maxItems: 1
>> +  mdio:
>> +    $ref: dsa.yaml#/properties/mdio
>> +    unevaluatedProperties: false
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml b/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
>> index 4c78c546343f5e..e14562b33bfb97 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
>> @@ -65,6 +65,10 @@ properties:
>>                 - brcm,bcm63268-switch
>>             - const: brcm,bcm63xx-switch
>> +  mdio:
>> +    $ref: dsa.yaml#/properties/mdio
>> +    unevaluatedProperties: false
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/net/dsa/brcm,sf2.yaml b/Documentation/devicetree/bindings/net/dsa/brcm,sf2.yaml
>> index c745407f2f6853..1bf4317e038687 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/brcm,sf2.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/brcm,sf2.yaml
>> @@ -90,6 +90,10 @@ properties:
>>                 tags enabled (per-packet metadata)
>>               type: boolean
>> +  mdio:
>> +    $ref: dsa.yaml#/properties/mdio
>> +    unevaluatedProperties: false
>> +
>>   required:
>>     - reg
>>     - interrupts
>> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
>> index ec74a660bedaed..03ccedbc49dcc3 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
>> @@ -31,6 +31,24 @@ properties:
>>         (single device hanging off a CPU port) must not specify this property
>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>> +  mdio:
>> +    description: The internal MDIO bus of the switch
>> +    $ref: /schemas/net/mdio.yaml#
>> +
>> +if:
>> +  required: [ mdio ]
>> +then:
>> +  patternProperties:
>> +    "^(ethernet-)?ports$":
>> +      patternProperties:
>> +        "^(ethernet-)?port@[0-9]+$":
>> +          if:
>> +            not:
>> +              required: [ ethernet ]
>> +          then:
>> +            required:
>> +              - phy-handle
>> +
>>   additionalProperties: true
>>   $defs:
>> diff --git a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
>> index 4021b054f68446..32f17345825d4a 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
>> @@ -67,6 +67,10 @@ properties:
>>       additionalProperties: false
>> +  mdio:
>> +    $ref: dsa.yaml#/properties/mdio
>> +    unevaluatedProperties: false
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index e532c6b795f4fc..293d1affe75451 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -151,6 +151,10 @@ properties:
>>         ethsys.
>>       maxItems: 1
>> +  mdio:
>> +    $ref: dsa.yaml#/properties/mdio
>> +    unevaluatedProperties: false
>> +
>>   patternProperties:
>>     "^(ethernet-)?ports$":
>>       type: object
>> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
>> index e51be1ac036237..01d11c642ecfd4 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
>> @@ -49,6 +49,10 @@ properties:
>>         Set if the output SYNCLKO clock should be disabled. Do not mix with
>>         microchip,synclko-125.
>> +  mdio:
>> +    $ref: dsa.yaml#/properties/mdio
>> +    unevaluatedProperties: false
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
>> index 49af4b0d591695..15f24a1716cd44 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
>> @@ -32,7 +32,7 @@ properties:
>>       maxItems: 1
>>     mdio:
>> -    $ref: /schemas/net/mdio.yaml#
>> +    $ref: dsa.yaml#/properties/mdio
>>       unevaluatedProperties: false
>>   patternProperties:
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml b/Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml
>> index fe02d05196e4a6..d781b8c2324836 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml
>> @@ -73,6 +73,10 @@ properties:
>>     little-endian: true
>>     big-endian: true
>> +  mdio:
>> +    $ref: dsa.yaml#/properties/mdio
>> +    unevaluatedProperties: false
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>> index 4d5f5cc6d031e2..82dda8fae8b16e 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>> @@ -72,6 +72,10 @@ properties:
>>             - compatible
>>             - reg
>> +  mdio:
>> +    $ref: dsa.yaml#/properties/mdio
>> +    unevaluatedProperties: false
>> +
>>   patternProperties:
>>     "^(ethernet-)?ports$":
>>       patternProperties:
>> diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
>> index df64eebebe1856..001b72bcd0746b 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
>> @@ -60,7 +60,7 @@ properties:
>>         B68 on the QCA832x and B49 on the QCA833x.
>>     mdio:
>> -    $ref: /schemas/net/mdio.yaml#
>> +    $ref: dsa.yaml#/properties/mdio
>>       unevaluatedProperties: false
> 
> Just from a schema standpoint, this is pointless indirection as
> dsa.yaml#/properties/mdio is just a reference to /schemas/net/mdio.yaml#.

Sure, this is only to point the human readers to the description on the
dsa.yaml schema which describes the property as the internal MDIO bus of an
ethernet switch. Let me know if you find this unnecessary.

> 
> As it seems an MDIO bus is not universal for DSA, it seems you'll be
> dropping this change anyways.

For now, I don't think that'll be the case.

Arınç

