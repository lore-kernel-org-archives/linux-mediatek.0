Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0B3C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 22:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZYvwhY+9f843t/9+9YeemY82s4b/y6qSCIkArr4MHo=; b=SzMJAx+ttOfqYE
	8OHZyA/3xIhrjmVC7YFK5UftpCZRyGAIOuOytAVvTMx0CJ+ltE26QPmoCUoky28W1QOPXMU7xYaNm
	MzI41qTxpAJXTVA+Ms9Qo1QvON8G3R4Ijw58qtTxs5gRwI444uyNDsQ32b9IGcPFRDWG5IaMlyZay
	dXkmoKZbBzShA29MAC0Vy5r0/gGNsomM6ldfV2oqqzLPa1ZZk8Nd6zQr9rUBcvCL2aFakYKvYB0pD
	UkRMzk8AGoNWOKpV+hIo0w7gSjAy9O2NlzPAo5jTVH9MSYdG3+NjzS7N9+J2WyZTB1K5AHRbUL5oc
	qu62WKfJ0grP/ptAqxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO511-007UKe-Jw; Tue, 16 Aug 2022 22:26:27 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO50p-007UGB-UG; Tue, 16 Aug 2022 22:26:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660688754; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iPK7Jhd8ypbEHwD/n+VtVEaj5rJAQKANFd4jbZYUJqfyaHpikst0/xxoi9x4uZS49n27Lfcc9NYd/R34Wjsv8KiKpTM//U4ghN7MxqKNRw60srjH9/hl8Ov/6e4W1mmpgKie9yQoo4JejvmbC8by3ugeVTX5uF6vPJGnkm4xZjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660688754; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qZYvwhY+9f843t/9+9YeemY82s4b/y6qSCIkArr4MHo=; 
	b=LX0p2Bqi7yEFJCOKc5jBnZMoCsjDwBkAUDAe9VERP0ll/nwFaGWYNO3F3fIXrgfM+OmjTkm2NUH56R0gDXRDEvqZNOEQDUuXWr26TYBlTPlaEBTfV2gOLeHYbRONxoZZNgkVno2pR4B4rJA2a63Dv2OY/HiCwZ6XZuvTNrxLCTk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660688754;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qZYvwhY+9f843t/9+9YeemY82s4b/y6qSCIkArr4MHo=;
	b=R191Jh7nPNErVKrhNalKb34SdbPW1G6pI6ieMvF9bSLuGQ8Y85GW6iNLP99Eo37x
	AlvySHC3n41V4KyccZ5H8V/61wY8vzze6yzUyNiTUclYS/Kfc1JbsmWs7dQLW7cTSXu
	MM0BG4eDpRyH35h3RUkTbxte2yVojwwvuDQf073M=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1660688751681828.667318330111; Tue, 16 Aug 2022 15:25:51 -0700 (PDT)
Message-ID: <87f7dd90-d6b3-dad6-fe46-0b4ce38d9c29@arinc9.com>
Date: Wed, 17 Aug 2022 01:25:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/7] dt-bindings: net: dsa: mediatek,mt7530: fix reset
 lines
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-3-arinc.unal@arinc9.com>
 <20220816205228.GA2709277-robh@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220816205228.GA2709277-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_152616_040530_40699B67 
X-CRM114-Status: GOOD (  19.08  )
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

On 16.08.2022 23:52, Rob Herring wrote:
> On Sat, Aug 13, 2022 at 06:44:10PM +0300, Arınç ÜNAL wrote:
>> - Fix description of mediatek,mcm. mediatek,mcm is not used on MT7623NI.
>> - Add description for reset-gpios.
>> - Invalidate reset-gpios if mediatek,mcm is used.
>> - Invalidate mediatek,mcm if the compatible device is mediatek,mt7531.
>> - Require mediatek,mcm for the described MT7621 SoCs as the compatible
>> string is only used for MT7530 which is a part of the multi-chip module.
> 
> The commit message should answer 'why is this change needed/wanted?' not
> 'what changed'. I can read the diff to see what changed.

I'll explain why to invalidating reset-gpios and mediatek,mcm.

> 
> d>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 31 +++++++++++++++++--
>>   1 file changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index edf48e917173..4c99266ce82a 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -110,11 +110,15 @@ properties:
>>     mediatek,mcm:
>>       type: boolean
>>       description:
>> -      if defined, indicates that either MT7530 is the part on multi-chip
>> -      module belong to MT7623A has or the remotely standalone chip as the
>> -      function MT7623N reference board provided for.
>> +      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
>> +      switch is a part of the multi-chip module.
>>   
>>     reset-gpios:
>> +    description:
>> +      GPIO to reset the switch. Use this if mediatek,mcm is not used.
>> +      This property is optional because some boards share the reset line with
>> +      other components which makes it impossible to probe the switch if the
>> +      reset line is used.
>>       maxItems: 1
>>   
>>     reset-names:
>> @@ -165,6 +169,9 @@ allOf:
>>         required:
>>           - mediatek,mcm
>>       then:
>> +      properties:
>> +        reset-gpios: false
>> +
>>         required:
>>           - resets
>>           - reset-names
>> @@ -182,6 +189,24 @@ allOf:
>>           - core-supply
>>           - io-supply
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - const: mediatek,mt7531
>> +    then:
>> +      properties:
>> +        mediatek,mcm: false
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - const: mediatek,mt7621
>> +    then:
>> +      required:
>> +        - mediatek,mcm
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> -- 
>> 2.34.1
>>
>>

