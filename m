Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3503C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 22:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDTa5//nWj0Esms9kmwbp72Q9GG2XuE8CLV0rVm05OU=; b=gHM/igYN+2t8Hd
	VZjuOcrGH8pNmOD5p3D9dOs/TyPMNmDNdjNIZNc/BAUXEsd+owFiH4zTvQXIv4tBTi8nnqmDzNZKp
	RRM5Dh+Slpm1uEwdkB3Oq8vpsuLZ27Ozg49uZN43QUZRl6+mNs0x0fySkctwkZ+X1I6xQsUvFq0jB
	iLPJFm4XKVJZgoPY6hj+aFS67A+7al/ZeeryGQVHs7xJDk4o+GOCYsZrmYa2Yeu+v+umhvZxMKD1C
	VWwD3RsX/x/CMXF+HDZj4NrG0KbR8s7XFp9GEE9RdUq+KSdurE0/VJriiJLRtgPaQeSiSrKJmBigU
	rJlkv3sG+aCPIdft7s0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO4wa-007SkR-Af; Tue, 16 Aug 2022 22:21:52 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO4wO-007Sf9-Ir; Tue, 16 Aug 2022 22:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660688477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NDa+061Xblq9xAwNXmKcv17QPR2sLX3FhHhmESb1b8pgFXJpC4RsjI6lshyl5b8uGAnsfd0VenkgKfQmvlvUb4xb3FzeG6IQ1y5bDzj8igQsM3qWAMtf530W0VzbQSx6WOHGxZA4EIUnEURTp+yCWpEaKfu4OBzi5zaWlBXiUIk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660688477; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=nDTa5//nWj0Esms9kmwbp72Q9GG2XuE8CLV0rVm05OU=; 
	b=FNd0K0wsnycSXgfDGw+2jBnr+YiOBQNV87VdOrVPrP0D+a1Hh71XiBgKM0a0QPiJOei3knCh+ZBA5tvjEB82nv1wnAkmTtswjDCpzlfOCx6tv5ByV+AX8yJ7vaL81xV9DuxtPm4rnwyPgvELLuaMUuBBEnl4UY2pKdy2C52nwOc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660688477;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nDTa5//nWj0Esms9kmwbp72Q9GG2XuE8CLV0rVm05OU=;
	b=PrUQ84eiaZMAzNAz87ySIRMyHo6lq90+7mpr+fefTGiTteckeRDGLgem3+0MIEcn
	+lIjubL1TdKrUwk5E/B95tNIdkQxoGNppf9KeaMv3OGMAInBY0JBY+Vo+z9aXcL637X
	iJUiy5lrPhl4XRPkWO6CvObCMpF66Drzb0FlyfP4=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1660688475774900.170062109623; Tue, 16 Aug 2022 15:21:15 -0700 (PDT)
Message-ID: <5d51394b-cef2-6bb2-763c-e801994f67ea@arinc9.com>
Date: Wed, 17 Aug 2022 01:21:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 5/7] dt-bindings: net: dsa: mediatek,mt7530: remove
 unnecesary lines
To: Rob Herring <robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-6-arinc.unal@arinc9.com>
 <20220816211454.GA2734299-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20220816211454.GA2734299-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_152140_702649_1237E8F6 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, linux-kernel@vger.kernel.org, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17.08.2022 00:14, Rob Herring wrote:
> On Sat, Aug 13, 2022 at 06:44:13PM +0300, Arınç ÜNAL wrote:
>> Remove unnecessary lines as they are already included from the referred
>> dsa.yaml.
> 
> You are duplicating the schema and then removing parts twice. I would
> combine patches 4 and 5 or reverse the order.

Will combine.

> 
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 27 -------------------
>>   1 file changed, 27 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index ff51a2f6875f..a27cb4fa490f 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -162,15 +162,8 @@ allOf:
>>   
>>         patternProperties:
>>           "^(ethernet-)?ports$":
>> -          type: object
>> -
>>             patternProperties:
>>               "^(ethernet-)?port@[0-9]+$":
>> -              type: object
>> -              description: Ethernet switch ports
>> -
>> -              unevaluatedProperties: false
>> -
>>                 properties:
>>                   reg:
>>                     description:
>> @@ -178,7 +171,6 @@ allOf:
>>                       0 to 5 for user ports.
>>   
>>                 allOf:
>> -                - $ref: dsa-port.yaml#
>>                   - if:
> 
> This 'if' schema is the only part you need actually (though you have to
> create the node structure).

Do you mean that I should take "if:" out of allOf?

> 
>>                       properties:
>>                         label:
>> @@ -186,7 +178,6 @@ allOf:
>>                             - const: cpu
>>                     then:
>>                       required:
>> -                      - reg
>>                         - phy-mode
>>   
>>     - if:
>> @@ -200,15 +191,8 @@ allOf:
>>   
>>         patternProperties:
>>           "^(ethernet-)?ports$":
>> -          type: object
>> -
>>             patternProperties:
>>               "^(ethernet-)?port@[0-9]+$":
>> -              type: object
>> -              description: Ethernet switch ports
>> -
>> -              unevaluatedProperties: false
>> -
>>                 properties:
>>                   reg:
>>                     description:
>> @@ -216,7 +200,6 @@ allOf:
>>                       0 to 5 for user ports.
>>   
>>                 allOf:
>> -                - $ref: dsa-port.yaml#
>>                   - if:
>>                       properties:
>>                         label:
>> @@ -224,7 +207,6 @@ allOf:
>>                             - const: cpu
>>                     then:
>>                       required:
>> -                      - reg
>>                         - phy-mode
>>   
>>     - if:
>> @@ -238,15 +220,8 @@ allOf:
>>   
>>         patternProperties:
>>           "^(ethernet-)?ports$":
>> -          type: object
>> -
>>             patternProperties:
>>               "^(ethernet-)?port@[0-9]+$":
>> -              type: object
>> -              description: Ethernet switch ports
>> -
>> -              unevaluatedProperties: false
>> -
>>                 properties:
>>                   reg:
>>                     description:
>> @@ -254,7 +229,6 @@ allOf:
>>                       0 to 5 for user ports.
>>   
>>                 allOf:
>> -                - $ref: dsa-port.yaml#
>>                   - if:
>>                       properties:
>>                         label:
>> @@ -262,7 +236,6 @@ allOf:
>>                             - const: cpu
>>                     then:
>>                       required:
>> -                      - reg
>>                         - phy-mode
>>   
>>   unevaluatedProperties: false
>> -- 
>> 2.34.1
>>
>>

