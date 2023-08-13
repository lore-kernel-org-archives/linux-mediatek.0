Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE80C001DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbfJ1w4vh9YoBeVEGEmzngRytdBt78w8hV92B1PwD0w=; b=OipizEp7+z9dq038wIPqwrHKTA
	U5qKL/P/dRFIRumcsK7m1aeFsiSx903SKWuIhYk2aKsz2jX5dkKHKblC8ad7iJ5MnA62ceZmhyN4H
	QYcd1FpMLjRzfFCiyVWaSjXICXmvZwusjf5J6OY8YK2RtQ4o2lzINlk4KAnohZcINnY2NnMCVWSFC
	XWKlJqTe74UW5VzjE9davS87MiXpJj7/j8vE3DqLWE1ti1hNerq2SIZMNwU9Muu5eXN1Af3r2dtom
	O9w6x2b0gS6tG3hcJVzScgXcIEEnR5klCptexrHE2pG38Ki/LpomQEXK5m9lWY60VDzwJWu7WTizg
	RwXTZHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVCYl-00FI26-0S;
	Sun, 13 Aug 2023 14:59:15 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVCYh-00FI1A-2f;
	Sun, 13 Aug 2023 14:59:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E9BAC0003;
	Sun, 13 Aug 2023 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691938747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vbfJ1w4vh9YoBeVEGEmzngRytdBt78w8hV92B1PwD0w=;
	b=Zrz/Jo7HSDyWNAVlKAx9QLmmLp0ngnZoSEwxn4kw9tPJat6WjyJXyEV5i+jyX6p9CL6Urc
	m8t9x3Pk52MAyX5BJeR0Hw+gXNBK9ze9V2pcd5Lw3WWIx2n7sSE1sk9sXfI4+Vm1rzdpcN
	dw2CbphKiuUmzRM1kcq88sWEzsjoheclqsWZazQOe2VW3Vc4zxss0NC84zLzj2bBYGwV43
	MJ23nSifNSw1hpsDn+2NLrHEcmWeRCpEXFE6xdHbYjjSVVT2muXFgsvl614TxiE5K8gRxm
	X1p5BpNm09wOmAZB693eYrQ3xpa9a8rQxxOyChOrq9aDorKKgD3VDT4sdtdgjg==
Message-ID: <891c0b67-abe1-416c-aa94-675f7f3d8044@arinc9.com>
Date: Sun, 13 Aug 2023 17:58:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
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
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
Content-Language: en-US
In-Reply-To: <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_075912_153189_1835F90B 
X-CRM114-Status: GOOD (  19.42  )
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

On 13.08.2023 15:59, Arınç ÜNAL wrote:
> On 13.08.2023 14:53, Vladimir Oltean wrote:
>> On Sat, Aug 12, 2023 at 10:20:43PM +0300, Arınç ÜNAL wrote:
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>>> index 4d5f5cc6d031e2..82dda8fae8b16e 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>>> @@ -72,6 +72,10 @@ properties:
>>>             - compatible
>>>             - reg
>>> +  mdio:
>>> +    $ref: dsa.yaml#/properties/mdio
>>> +    unevaluatedProperties: false
>>
>> sja1105 does not support an "mdio" child property. I haven't checked the
>> others. Don't add properties that aren't supported.
> 
> Adding the mdio property to the dsa.yaml schema will allow it on all of the
> schemas that refer to dsa.yaml such as this one. This addition here is only
> to disallow additional properties under the mdio property for this specific
> schema.
> 
> That said, my understanding is that the internal MDIO bus exists on all of
> the switches controlled by DSA. Whether each individual DSA subdriver
> supports registering it does not matter in terms of documenting the
> internal MDIO bus for all DSA switches.

On top of this, I'd argue to document the internal MDIO bus on the
ethernet-switch.yaml schema instead.

Arınç

> 
> SJA1110 uses the mdios property instead because it's got two internal mdio
> buses, which is why I invalidate the mdio property for it. If SJA1105 has
> also got two internal mdio buses, let me know.
> 
>>
>>> +
>>>   patternProperties:
>>>     "^(ethernet-)?ports$":
>>>       patternProperties:
>>>
>>> The nxp,sja1105.yaml schema also needed some changes.
>>>
>>> dt-bindings: net: dsa: nxp,sja1105: improve internal MDIO bus bindings
>>>
>>> SJA1110 Ethernet Switch uses the mdios property for its internal MDIO bus.
>>> Therefore, disallow the mdios property for SJA1105, and the mdio property
>>> for SJA1110.
>>>
>>> Require the phy-handle property on the non-CPU ports if the mdios property
>>> is being used.
>>>
>>> Refer to dsa.yaml#/properties/mdio to point the human readers to the
>>> description on the dsa.yaml schema.
>>>
>>> ---
>>>   .../bindings/net/dsa/nxp,sja1105.yaml         | 20 ++++++++++++++++++-
>>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>>> index 82dda8fae8b16e..7d92350f1065b2 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
>>> @@ -52,7 +52,7 @@ properties:
>>>       patternProperties:
>>>         "^mdio@[0-1]$":
>>> -        $ref: /schemas/net/mdio.yaml#
>>> +        $ref: dsa.yaml#/properties/mdio
>>>           unevaluatedProperties: false
>>>           properties:
>>> @@ -128,14 +128,32 @@ allOf:
>>>       then:
>>>         properties:
>>>           spi-cpol: false
>>> +        mdios: false
>>> +
>>>         required:
>>>           - spi-cpha
>>>       else:
>>>         properties:
>>>           spi-cpha: false
>>> +        mdio: false
>>> +
>>>         required:
>>>           - spi-cpol
>>> +  - if:
>>> +      required: [ mdios ]
>>> +    then:
>>> +      patternProperties:
>>> +        "^(ethernet-)?ports$":
>>> +          patternProperties:
>>> +            "^(ethernet-)?port@[0-9]+$":
>>> +              if:
>>> +                not:
>>> +                  required: [ ethernet ]
>>> +              then:
>>> +                required:
>>> +                  - phy-handle
>>
>> For sja1105, phylink-compatible bindings (phy-handle, fixed-link or managed)
>> are required for all ports (user, dsa or cpu).
>>
>> Also, sja1105 does not populate the slave_mii_bus, so it never uses the
>> fallback where ports implicitly connect to an internal PHY if no phylink
>> bindings are present.
> 
> I'll handle these accordingly with your answer to my question above.
> 
> Arınç

