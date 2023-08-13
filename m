Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B46C04A6A
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GXovUO/PFAmMSu4eDPxz+1S111/9HB7f0QHyjq9J88=; b=lJR/SNVrYiunIVPe6yceXbBy9V
	+7RmUisgGZrK/MHIW1OeP9iWCzwwxVBHCuOMuRzB4ydCcjDBT7Y0QNFNDvF2GeTmQDNkwUAt0lGXf
	efTIcu3GYqHUyB4sj+K63yckmawe1YBM/RpYUqm1nfq8WIZkM/cInYkUAk07XjuF58nlTsEj5H+01
	r+pGvV4edB66q5RTOtMLntE9sRbQPT16H8D6LBaNl2SJ3OVkWyMXAtNBvp9rGYF6xWyJAtaefVQi/
	zG5v1k14dhc1KnTLOkRYDw4wvD3/82KEXZMx0r6PGNlczwWeDBFLGpCiBFBBNDx73uTZaApsRmYMT
	YAHVhI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV9Bv-00F1a1-0V;
	Sun, 13 Aug 2023 11:23:27 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV9Bs-00F1ZH-1e;
	Sun, 13 Aug 2023 11:23:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DF9D40003;
	Sun, 13 Aug 2023 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691925800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9GXovUO/PFAmMSu4eDPxz+1S111/9HB7f0QHyjq9J88=;
	b=MEO8bynVSnOxZ01sRklkbXmoBw+J8LaQRA7TI6gDLKiq2Z6rv8LcwgSJvOH7uqbev8KURt
	TrWsWTvx0cisOxLJl9Jsd5U6AhKfM8Vawwnc3F950pKoeWuqUVD51RTYzzYEOTZGiNUBp9
	KkY0o3sTyTIohpr0KOqb/mvrRH7UFYd930PofaMrhXqmNgotEgVyUcnaa5GXO/nAhxykge
	lp0fDU4JHgJr7Yg7aMPrdA8aAFGkzFmh4HgAbBXexTcb5EWJtjG+9cyu0Q5bDnOd0j11eR
	uDeHxATwJwJaNo2csLR6FU73vH3DWRxrla/o1kkz3jWXdeS/PSi5SkIfzdTD6Q==
Message-ID: <49acfbe1-a310-441d-99a5-16955b4cf41e@arinc9.com>
Date: Sun, 13 Aug 2023 14:23:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: microchip,lan937x: add missing
 ethernet on example
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
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-2-arinc.unal@arinc9.com>
 <20230812091708.34665-2-arinc.unal@arinc9.com>
 <20230813110747.rvvsvte2t6pbe5j4@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230813110747.rvvsvte2t6pbe5j4@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_042324_835930_19080435 
X-CRM114-Status: GOOD (  12.43  )
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

On 13.08.2023 14:07, Vladimir Oltean wrote:
> On Sat, Aug 12, 2023 at 12:17:05PM +0300, Arınç ÜNAL wrote:
>> The port@5 node on the example is missing the ethernet property. Add it.
>> Remove the MAC bindings on the example as they cannot be validated.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../bindings/net/dsa/microchip,lan937x.yaml           | 11 +----------
>>   1 file changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
>> index 8d7e878b84dc..49af4b0d5916 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
>> @@ -68,16 +68,6 @@ examples:
>>     - |
>>       #include <dt-bindings/gpio/gpio.h>
>>   
>> -    macb0 {
>> -            #address-cells = <1>;
>> -            #size-cells = <0>;
>> -
>> -            fixed-link {
>> -                    speed = <1000>;
>> -                    full-duplex;
>> -            };
>> -    };
>> -
>>       spi {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>> @@ -138,6 +128,7 @@ examples:
>>                                       phy-mode = "rgmii";
>>                                       tx-internal-delay-ps = <2000>;
>>                                       rx-internal-delay-ps = <2000>;
>> +                                    ethernet = <&macb1>;
> 
> macb1 instead of macb0: was it intentional?

Yes, port@4 defines macb0. I used macb1 for port@5 here.

Arınç

