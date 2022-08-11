Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607A0C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFFMtaVBliTagdTvSpSN15r9jSDZm4o7vU7Pd75SHu4=; b=HiMy9A6FU2GpXOzHTeh2s35Tgh
	B79+keKcfqrqQ/EBUT4CYUTjl/867eKSmYlJRMFZQ07Se+vFv7Vyfc28oF8N05ZJRvfDH9iimVZ+H
	+HL1yp9h7SzD26eJeHXo6VxVEtr+o6owSSEyVi2l2yjymNAfr0cLRMs9PzPkzmF26sRvhRdvCO8h/
	I1jVxZVxAm2jnGcZsb0MKZqxOK/bkJ0Zdb8j5Q8k5aFsgZ0H9AwlmyrMYNosenYd5FQxePnXmFXFi
	H0kOlh1uOJLTFnu28fKtoNE9Gp3l2AgAtm4CtmWEH+7pmVpHa31vxwmElGYdFMaUjlCEXWsAOOWJG
	91WQpIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMGNT-005zli-LN; Thu, 11 Aug 2022 22:10:07 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMGNB-005zbK-VE; Thu, 11 Aug 2022 22:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660255755; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hMvs2oJMne1yVImneST7KbWUNwdgKhxFA0mi+4AnyeoGhsn/nOb9uhVt1/zecAFWqp+xsi+L3YC+nNI/DjkxKSDXx5D/4uCL+WKT7fdcKpAk78vQ1CbazQqP+Bt14EZQ6OUUoCWP064QtdztGgJgFA1F9tWjjC8wugyTCRrscQA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660255755; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=aFFMtaVBliTagdTvSpSN15r9jSDZm4o7vU7Pd75SHu4=; 
	b=Dog8CgAmfWALpRjNmir8xU7iv2zgTd6vZv5sJKrmnX+tPO0vglPU1s0upoE7SIjtB9YZSrBIO+7O3QgFpWn4mPiaOzE98OFejWiqVZ4I68V7dQdHexcwKVz43sTebVC8rkmDKj94wOnaiU1J0QSKPcPWLy11n+nYwWq3l9sHFLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660255755;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aFFMtaVBliTagdTvSpSN15r9jSDZm4o7vU7Pd75SHu4=;
	b=YfLL99dDY71yrA88XdSECdHu5Hole25hcBOCy4oBu/T+TpXclhA4cFXYmj31jY6g
	1jTBD3o/9Ti0LGWOcpGHgmSsy13kwADqmTAre4V+PgaHc7gf5a4wHr1C+8XhXzH7zdK
	MgYsLjfrnq8H1ByvAmCXV+b7W9esSvQoxOCErFjQ=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1660255752376179.3283196687969; Thu, 11 Aug 2022 15:09:12 -0700 (PDT)
Message-ID: <6bbb23e5-d073-33fc-e16b-e8de8091eb44@arinc9.com>
Date: Fri, 12 Aug 2022 01:09:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: mediatek,mt7530: make trivial
 changes
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
 <20220730142627.29028-2-arinc.unal@arinc9.com>
 <cc60401b-ecb8-4907-af3e-bb437ae1421b@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <cc60401b-ecb8-4907-af3e-bb437ae1421b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_150950_088302_63B247D5 
X-CRM114-Status: GOOD (  21.79  )
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

On 2.08.2022 11:41, Krzysztof Kozlowski wrote:
> On 30/07/2022 16:26, Arınç ÜNAL wrote:
>> Make trivial changes on the binding.
>>
>> - Update title to include MT7531 switch.
>> - Add me as a maintainer. List maintainers in alphabetical order by first
>> name.
>> - Add description to compatible strings.
>> - Fix MCM description. mediatek,mcm is not used on MT7623NI.
>> - Add description for reset-gpios.
>> - Remove quotes from $ref: "dsa.yaml#".
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 27 ++++++++++++++-----
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index 17ab6c69ecc7..541984a7d2d4 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -4,12 +4,13 @@
>>   $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Mediatek MT7530 Ethernet switch
>> +title: Mediatek MT7530 and MT7531 Ethernet Switches
>>   
>>   maintainers:
>> -  - Sean Wang <sean.wang@mediatek.com>
>> +  - Arınç ÜNAL <arinc.unal@arinc9.com>
>>     - Landen Chao <Landen.Chao@mediatek.com>
>>     - DENG Qingfang <dqfext@gmail.com>
>> +  - Sean Wang <sean.wang@mediatek.com>
>>   
>>   description: |
>>     Port 5 of mt7530 and mt7621 switch is muxed between:
>> @@ -66,6 +67,14 @@ properties:
>>         - mediatek,mt7531
>>         - mediatek,mt7621
>>   
>> +    description: |
>> +      mediatek,mt7530:
>> +        For standalone MT7530 and multi-chip module MT7530 in MT7623AI SoC.
>> +      mediatek,mt7531:
>> +        For standalone MT7531.
>> +      mediatek,mt7621:
>> +        For multi-chip module MT7530 in MT7621AT, MT7621DAT and MT7621ST SoCs.
> 
> If compatible: is changed to oneOf, you can use description for each
> item. Look at board compatibles (arm/fsl.yaml)

Will do, thanks for the example.

> 
>> +
>>     reg:
>>       maxItems: 1
>>   
>> @@ -79,7 +88,7 @@ properties:
>>     gpio-controller:
>>       type: boolean
>>       description:
>> -      if defined, MT7530's LED controller will run on GPIO mode.
>> +      If defined, MT7530's LED controller will run on GPIO mode.
>>   
>>     "#interrupt-cells":
>>       const: 1
>> @@ -98,11 +107,15 @@ properties:
>>     mediatek,mcm:
>>       type: boolean
>>       description:
>> -      if defined, indicates that either MT7530 is the part on multi-chip
>> -      module belong to MT7623A has or the remotely standalone chip as the
>> -      function MT7623N reference board provided for.
>> +      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
>> +      switch is a part of the multi-chip module.
> 
> Does this mean it is valid only on these variants? If yes, this should
> have a "mediatek,mcm:false" in allOf:if:then as separate patch (with
> this change in description).

Only valid for those, yes. I'll make it false in allOf:if:then for 
mediatek,mt7531. It either can or can't be used for mediatek,mt7530 so 
nothing to do there.

> 
>>   
>>     reset-gpios:
>> +    description:
>> +      GPIO to reset the switch. Use this if mediatek,mcm is not used.
> 
> The same. Example:
> https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155

Thanks, I'll make it false in allOf:if:then for mediatek,mcm.

Arınç

