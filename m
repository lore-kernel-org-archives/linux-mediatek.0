Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D139EEB596
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 05:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcDrbEiun23FmVTKvz1/iXIyZVCi6wgj7E5zzmHbx8Q=; b=dKTEYNo92TlrjitTx7X9O+uynr
	+WMkA/mqy4Vy7dvC3EbmgXPBsYmEFPGTn6GedeBytSSkZZerwF9QVANgvFA7xOOx4w8Z5AGRdgNxp
	ptjjav6tlShHVkZIidXr9znAyZSN1hvign9t2wKIERm6M1GBLcjtKRA7M3pYQBgnGeMndxHmNnkYV
	lKsUL3aZbrtjmqP5jEcIouF65MP2LbllwFyXkUSF7NSSoh7wGp1+Zd9y2A0JatPvXeWDDUPx/B1ic
	ks+ePOCiBO5smruqfJqDRJuquQEdXYnMkQlTLCBIq/Ut8da3FJRaK3giGBq4ldKmt52zPn9Qgfjqi
	chEs86Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgIoJ-004iYE-19;
	Wed, 13 Sep 2023 05:53:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgIoF-004iWH-1r;
	Wed, 13 Sep 2023 05:53:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 341061C0005;
	Wed, 13 Sep 2023 05:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694584379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IcDrbEiun23FmVTKvz1/iXIyZVCi6wgj7E5zzmHbx8Q=;
	b=oJC8AIzhsGWqr5FQ7UGsC69a5dtNg+kdOYIJ/8pFW193rfzUoQNBaeLcBbQAaF8pciVkeS
	IfWkbbgNW+SlBJ7OSNd+g7u7komltvjIm4HYGhvhX+V18fQJi6ARO9pbFGBcBKN1CkWh3C
	WkTR2oRVYzZE+Kzm4IscN3Tp5N1JXUmwfRavXFr9O1qf3ioj/w9dS5YIkW0AEBIOk5fnZK
	+1cGjlew+y+OS0bdyDf1pu4X7RNnF4ogTUg04nYlFr3A7005Pp190vRzaf8ZdO7kTDiTzG
	Jo+c5RRohaMmWb/6VF9qU2Y8NS9c2wWRcqegWNVfX2VLMIj6k++JkNyrUPjFWw==
Message-ID: <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
Date: Wed, 13 Sep 2023 08:52:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
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
References: <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230912193450.h5s6miubag46z623@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_225307_909838_57A8F0FE 
X-CRM114-Status: GOOD (  18.26  )
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

On 12.09.2023 22:34, Vladimir Oltean wrote:
> On Tue, Sep 12, 2023 at 10:23:51PM +0300, Arınç ÜNAL wrote:
>> The phylink bindings for user ports I ended up making by looking up the
>> existing devicetrees are different than the phylink bindings for the shared
>> (CPU and DSA) ports currently enforced on all switches.
>>
>> My phylink bindings for user ports:
>>
>>              allOf:
>>                - anyOf:
>>                    - required: [ fixed-link ]
>>                    - required: [ phy-handle ]
>>                    - required: [ managed ]
>>
>>                - if:
>>                    required: [ fixed-link ]
>>                  then:
>>                    not:
>>                      required: [ managed ]
> 
> Right, it should have been anyOf and not oneOf.. my mistake. It is a bug
> which should be fixed. It's the same phylink that gets used in both cases,
> user ports and shared ports :)

One more thing, I don't recall phy-mode being required to be defined for
user ports as it will default to GMII. I don't believe this is the same
case for shared ports so phy-mode is required only for them?

> 
>>
>> The phylink bindings for shared ports enforced on all switches on
>> dsa-port.yaml:
>>
>>    allOf:
>>      - required:
>>          - phy-mode
>>      - oneOf:
>>          - required:
>>              - fixed-link
>>          - required:
>>              - phy-handle
>>          - required:
>>              - managed
>>
>> Here's what I understand:
>>
>> - For switches in dsa_switches_apply_workarounds[]
>>    - Enforce the latter for shared ports.
>>    - Enforce the former for user ports.
>>
>> - For switches not in dsa_switches_apply_workarounds[]
>>    - Enforce the former for all ports.
> 
> No, no. We enforce the dt-schema regardless of switch presence in
> dsa_switches_apply_workarounds[], to encourage users to fix device trees
> (those who run schema validation). The kernel workaround consists in
> doing something (skipping phylink) for the device trees where the schema
> warns on shared ports. But there should be a single sub-schema for
> validating phylink bindings, whatever port kind it is.

Hmm, like writing phylink.yaml and then referring to it under the port
pattern node? This could prevent a lot of repetition.

Arınç

