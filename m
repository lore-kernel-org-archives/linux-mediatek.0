Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A66CEE3F0C
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NZeUieWGIH4FCtXbzG8+QrsUPwd3uZJU/4DYFsvIUU=; b=kf+nMUX8zSJKD+VeirNqGdDe4e
	31tco6ZxE/yv7BUQK6uGtfCumplMB4CUQn8mCavA+ZIrjbIINRRGXdyr152/CbOCYf8I4+WRmhJPk
	09Iqzhx/8jUeCoAs6cqnsI+6UPxSAjNm13mmMsdCpxq8sQ6wGAprcUZw1M2Pszt8D0ncSkx827aEA
	ywN1kn6M9R4CrBN8DZ1EPcoIeZwrndAUWar2+frHecq134bTxFfmjrY62QUcH34u7lP119p8CbSbu
	KGkNIcJEmOjtdm8NQpN9qvD3xv8raKobPEA4m5b6PcrJ/2Ws28jgTTK/bcAN5JuQPFbtpiUp0u3vO
	ytbKegXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg8zc-0042Rv-10;
	Tue, 12 Sep 2023 19:24:12 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg8zX-0042QX-0E;
	Tue, 12 Sep 2023 19:24:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44DD31BF207;
	Tue, 12 Sep 2023 19:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694546641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8NZeUieWGIH4FCtXbzG8+QrsUPwd3uZJU/4DYFsvIUU=;
	b=YAaGe5kFs4iHlGtkZ9HLtYXMxer3HiGn6HNlojbyUaS3Q6tO/qbb2YRRwQehFtEy5NTULX
	eP1cwwXCCwCZMs7QM35Kg8t+5F9h+fvyr9MWIjJGo975vd00GjFJMDYP7KQvrtEIMhPsjx
	ucOgDpCEOxjal4ljm/UmJBTsC5HtCx4GldHKtkTl8+HiuRTv6g6ia93MFHYPKlZIieqmwd
	J3y0qskw3BVw07/BCseSws6d9hS//h+pTTjyIs1s4YxsOdZgZDuR5N0qW8O9CKgXrrgtT0
	Ls5pdNR17CeYFpalEj7RD0JpTMv4Z1pw14w9VTm6pkmLkdZsYE9WtAocE+qIAg==
Message-ID: <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
Date: Tue, 12 Sep 2023 22:23:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Content-Language: en-US
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
References: <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230911225126.rk23g3u3bzo3agby@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_122407_381423_D18289D0 
X-CRM114-Status: GOOD (  13.34  )
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

On 12.09.2023 01:51, Vladimir Oltean wrote:
> On Sat, Sep 09, 2023 at 11:53:50AM +0300, Arınç ÜNAL wrote:
>> What to do:
>> - For mscc,vsc7514-switch, enforce phylink bindings for ports.
>> - For mscc,vsc7512-switch, enforce phylink bindings for user ports.
> 
> you can also look at dsa_switches_apply_workarounds[], and if the switch
> isn't there, then you can replace "user ports" with "ports" here and
> everywhere.

The phylink bindings for user ports I ended up making by looking up the 
existing devicetrees are different than the phylink bindings for the 
shared (CPU and DSA) ports currently enforced on all switches.

My phylink bindings for user ports:

             allOf:
               - anyOf:
                   - required: [ fixed-link ]
                   - required: [ phy-handle ]
                   - required: [ managed ]

               - if:
                   required: [ fixed-link ]
                 then:
                   not:
                     required: [ managed ]

The phylink bindings for shared ports enforced on all switches on 
dsa-port.yaml:

   allOf:
     - required:
         - phy-mode
     - oneOf:
         - required:
             - fixed-link
         - required:
             - phy-handle
         - required:
             - managed

Here's what I understand:

- For switches in dsa_switches_apply_workarounds[]
   - Enforce the latter for shared ports.
   - Enforce the former for user ports.

- For switches not in dsa_switches_apply_workarounds[]
   - Enforce the former for all ports.

> 
>> - renesas,rzn1-a5psw.yaml
>>    - renesas,r9a06g032-a5psw, renesas,rzn1-a5psw
>>
>> What to do:
>> - Document "mdio".
> 
> Not clear here and for all the schemas quoted below.. is "mdio" not documented already?

They are, or rather I didn't care while constructing this text. I will 
mention "mdio" is already documented per schema on the patch log.

Arınç

