Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D12C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FknEHEc1nj2hFhwhzwEjhZw/Siy0uBdyidv+M0TdjsE=; b=Lib4xXLmPYjYmKEpBFm0VsQoV+
	Kin7+EPRAvI3g3R564ZTwhQ7pkR51hu0mCVSbV8snqHjJNan7Rd9ByNtiZh9ZobBWOqfAuRX9wk+D
	DZbFLqEuYfaO2gSRELGSLj3t2KnBbEqeSdPxrLSgpy1kiVeNjx1j+GULIzl1kDKKeY/qhh3zc08Ou
	ruR2gSZzmjBzgH3EsvzAdRZE7uYiJAFans6JTkrbD8MpBHLg3cD0rYbrFkM8L4iLXMjxoEy24/FXY
	g5hysOqAr82TJmHMuHqmNuJod7cmquRbsliZ70NyT3FZWxQ2jhFZxV4iDSr9kgavGf84BgEEq/iiF
	/snoLANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVKF-008bom-Fx; Fri, 12 Aug 2022 14:07:47 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVK3-008bAH-A1; Fri, 12 Aug 2022 14:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660313231; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fbBtS1sg+Vt+hYNlH9db0vKSm0VsISSrbfKZ/jEVUctlhUv5Xw0mKF+lLIVdoOC67ZqtwTDl6GFF8h81U4wl03iMeFA2rH3tCxg+UuQrCE64wNKQ4ctiDtYbgXfQv3VNw+3p1b8EzvwFZWgglGMMKOZwefzrtQKneptX8LGJnZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660313231; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=FknEHEc1nj2hFhwhzwEjhZw/Siy0uBdyidv+M0TdjsE=; 
	b=ejCDYI+Vgpjfdt/dnFRUl682pDogP8XqdY2fOEJXOEgi4dwLIVjYUGvNfl/2zrKz9R5whJ0XUzCS02wecsaw28nvbwvQqMPVIUKQ3lmOJtCDDNA7sBwOb5sLMPLUhmi/lLOvz2b6toEXjiUn7IY/YYRK9UXl+nt/pC4s09Ce458=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660313231;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FknEHEc1nj2hFhwhzwEjhZw/Siy0uBdyidv+M0TdjsE=;
	b=hwqzb+Y5rHO41lrcPIZ6+VC9+Dogbd4NVHxz44ZoQT3+znvTYXqqwpgUoX2t5gA/
	pGmtNz/+mfYN6mG2syEJNbXRVTlpWxSa5AOtc2UodyAwE45f+OH+aRsbfbf7kvDqV4I
	HnQ15pmVHeveHhlEv12dlDPD8dwmloROl5lpYfqU=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 16603132237851003.355451322594; Fri, 12 Aug 2022 07:07:03 -0700 (PDT)
Message-ID: <24e251d7-f5db-5715-463d-333f5dfbfceb@arinc9.com>
Date: Fri, 12 Aug 2022 17:06:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] dt-bindings: net: dsa: mediatek,mt7530: update
 json-schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220730142627.29028-1-arinc.unal@arinc9.com>
 <20220730142627.29028-5-arinc.unal@arinc9.com>
 <e5cf8a19-637c-95cf-1527-11980c73f6c0@linaro.org>
 <bb60608a-7902-99fa-72aa-5765adabd300@arinc9.com>
 <8a665b7a-bbd0-99ce-658e-bc78568bdca2@linaro.org>
 <40130c63-1e36-bb43-43b4-444a8f287226@linaro.org>
 <70e246af-c336-0896-95b5-9e42a17a239d@arinc9.com>
 <3731cd56-f7e8-6807-06b5-b8b176b078b6@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <3731cd56-f7e8-6807-06b5-b8b176b078b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_070735_439357_DBF9CB70 
X-CRM114-Status: GOOD (  19.07  )
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



On 12.08.2022 16:48, Krzysztof Kozlowski wrote:
> On 12/08/2022 16:41, Arınç ÜNAL wrote:
>> On 12.08.2022 10:01, Krzysztof Kozlowski wrote:
>>> On 12/08/2022 09:57, Krzysztof Kozlowski wrote:
>>>> On 12/08/2022 01:09, Arınç ÜNAL wrote:
>>>>>>> -patternProperties:
>>>>>>> -  "^(ethernet-)?ports$":
>>>>>>> -    type: object
>>>>>>
>>>>>> Actually four patches...
>>>>>>
>>>>>> I don't find this change explained in commit msg. What is more, it looks
>>>>>> incorrect. All properties and patternProperties should be explained in
>>>>>> top-level part.
>>>>>>
>>>>>> Defining such properties (with big piece of YAML) in each if:then: is no
>>>>>> readable.
>>>>>
>>>>> I can't figure out another way. I need to require certain properties for
>>>>> a compatible string AND certain enum/const for certain properties which
>>>>> are inside patternProperties for "^(ethernet-)?port@[0-9]+$" by reading
>>>>> the compatible string.
>>>>
>>>> requiring properties is not equal to defining them and nothing stops you
>>>> from defining all properties top-level and requiring them in
>>>> allOf:if:then:patternProperties.
>>>>
>>>>
>>>>> If I put allOf:if:then under patternProperties, I can't do the latter.
>>>>
>>>> You can.
>>
>> Am I supposed to do something like this:
>>
>> patternProperties:
>>     "^(ethernet-)?ports$":
>>       type: object
>>
>>       patternProperties:
>>         "^(ethernet-)?port@[0-9]+$":
>>           type: object
>>           description: Ethernet switch ports
>>
>>           unevaluatedProperties: false
>>
>>           properties:
>>             reg:
>>               description:
>>                 Port address described must be 5 or 6 for CPU port and
>>                 from 0 to 5 for user ports.
>>
>>           allOf:
>>             - $ref: dsa-port.yaml#
>>             - if:
>>                 properties:
>>                   label:
>>                     items:
>>                       - const: cpu
>>               then:
>>                 allOf:
>>                   - if:
>>                       properties:
> 
> Not really, this is absolutely unreadable.
> 
> Usually the way it is handled is:
> 
> patternProperties:
>     "^(ethernet-)?ports$":
>       type: object
> 
>       patternProperties:
>         "^(ethernet-)?port@[0-9]+$":
>           type: object
>           description: Ethernet switch ports
>           unevaluatedProperties: false
>           ... regular stuff follows
> 
> allOf:
>   - if:
>       properties:
>         compatible:
>           .....
>     then:
>       patternProperties:
>         "^(ethernet-)?ports$":
>           patternProperties:
>             "^(ethernet-)?port@[0-9]+$":
>               properties:
>                 reg:
>                   const: 5
> 
> 
> I admit that it is still difficult to parse, which could justify
> splitting to separate schema. Anyway the point of my comment was to
> define all properties in top level, not in allOf.
> 
> allOf should be used to constrain these properties.

The problem is:
- only specific values of reg are allowed if label is cpu.
- only specific values of phy-mode are allowed if reg is 5 or 6.

This forces me to define properties under allOf:if:then. Splitting to 
separate schema (per compatible string?) wouldn't help in this case.

I can split patternProperties to two sections, but I can't directly 
define the reg property like you put above.

I can at least split mediatek,mt7531 to a separate schema to have less 
patternProperties on a single binding.

What do you think?

Arınç

