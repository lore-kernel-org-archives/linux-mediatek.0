Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922EDC25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 21:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfkAEDsCIWyxNmI4mhwJ5mn7xuF3EwVazopkyV9HuQY=; b=Pd9pVc3IsHS6jv
	3XjGbu3ztClkBrgqULIAKnDJeqoMQlFO7PxMM39tpZAmIMZ0dbpFHND/eUGf5ICOVE24GYqI91bQ6
	R02hWYNzCUEqTeJPIC+HnCQaXbt1kMWz59IlgshVH3tpR2KQk28LwhFCEilE46ZI6LuJi/BPyRR4B
	hijOOU03uz4c4lJc0cHPHTEgPxOFcTeni+1Aaiyc+J7s6yLypPqL4Tl7rPGLsfDEZPhpTvvgMBU59
	82uEgrqHDNK+alPF+Ty6geULww1SmIak7jMbMLm6+ag5cBJPo2Y/ZGGGdG2cUwc7BJzACYDDrFcXf
	Qsv3+Y7r9UAPnB/ZIb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO4W9-007ILe-Kc; Tue, 16 Aug 2022 21:54:33 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO4Vy-007IHQ-FH; Tue, 16 Aug 2022 21:54:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660686829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cxwQ1WMR00lHnGYAVyGK0+SuWRoNIS9p15F1MWhE1PdicDfyEpCNMCudXWTUI9MFYl/+o5ZfEg+GWSuE76klI7uWsjBYRWgfFLboQOSY9IK45cPaESj8omtCDTMFlJ09cCEodygSseqJo34w73xSQJJK8rwcx5LmFU+rdg7iYVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660686829; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JfkAEDsCIWyxNmI4mhwJ5mn7xuF3EwVazopkyV9HuQY=; 
	b=lcrM0XzMAkhg/fDf3O3b2+G9+wBcUXFo1hJwAg8/I1RXxJEI56qXaTCJYZs9YJvZQUrGVyabUbnbgAsHz0KjXSgdvXEYLZH6FQK3FDqSA7ebnU9SXXFQF/DyKsLI9xsEouvlxWu3K539BI7bVDfPeEy0N1wLFbvnqWlfPlKfspI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660686829;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JfkAEDsCIWyxNmI4mhwJ5mn7xuF3EwVazopkyV9HuQY=;
	b=PgkQ6qf/dl0nMSLdNDRFu5czFHKSBpy4/KalbfVejqx8Vdevne9K8KW9jd36qMdu
	0qr219GkbrNlUMHZesCOCW5j1G9JIC13uDDxjMWv6d2qQM7hTRgln8GYd/yyVoHLZrE
	bh7McL80X4XytMJHfGA7U7hkvTuF8bpBxJe6lTOo=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1660686827773292.2548995045163; Tue, 16 Aug 2022 14:53:47 -0700 (PDT)
Message-ID: <112f47d9-5b8a-8be5-52da-42f7c5223161@arinc9.com>
Date: Wed, 17 Aug 2022 00:53:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/7] dt-bindings: net: dsa: mediatek,mt7530: update
 binding description
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-8-arinc.unal@arinc9.com>
 <20220816212558.GA2754986-robh@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220816212558.GA2754986-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_145422_586394_156C4C1D 
X-CRM114-Status: GOOD (  31.02  )
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

On 17.08.2022 00:25, Rob Herring wrote:
> On Sat, Aug 13, 2022 at 06:44:15PM +0300, Arınç ÜNAL wrote:
>> Update the description of the binding.
>>
>> - Describe the switches, which SoCs they are in, or if they are standalone.
>> - Explain the various ways of configuring MT7530's port 5.
>> - Remove phy-mode = "rgmii-txid" from description. Same code path is
>> followed for delayed rgmii and rgmii phy-mode on mtk_eth_soc.c.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 97 ++++++++++++-------
>>   1 file changed, 62 insertions(+), 35 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> index 530ef5a75a2f..cf6340d072df 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>> @@ -13,41 +13,68 @@ maintainers:
>>     - Sean Wang <sean.wang@mediatek.com>
>>   
>>   description: |
>> -  Port 5 of mt7530 and mt7621 switch is muxed between:
>> -  1. GMAC5: GMAC5 can interface with another external MAC or PHY.
>> -  2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
>> -     of the SOC. Used in many setups where port 0/4 becomes the WAN port.
>> -     Note: On a MT7621 SOC with integrated switch: 2nd GMAC can only connected to
>> -       GMAC5 when the gpios for RGMII2 (GPIO 22-33) are not used and not
>> -       connected to external component!
>> -
>> -  Port 5 modes/configurations:
>> -  1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
>> -     GMAC of the SOC.
>> -     In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
>> -     GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
>> -  2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
>> -     It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
>> -     and RGMII delay.
>> -  3. Port 5 is muxed to GMAC5 and can interface to an external phy.
>> -     Port 5 becomes an extra switch port.
>> -     Only works on platform where external phy TX<->RX lines are swapped.
>> -     Like in the Ubiquiti ER-X-SFP.
>> -  4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
>> -     Currently a 2nd CPU port is not supported by DSA code.
>> -
>> -  Depending on how the external PHY is wired:
>> -  1. normal: The PHY can only connect to 2nd GMAC but not to the switch
>> -  2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
>> -     a ethernet port. But can't interface to the 2nd GMAC.
>> -
>> -    Based on the DT the port 5 mode is configured.
>> -
>> -  Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
>> -  When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
>> -  phy-mode must be set, see also example 2 below!
>> -  * mt7621: phy-mode = "rgmii-txid";
>> -  * mt7623: phy-mode = "rgmii";
>> +  There are two versions of MT7530, standalone and in a multi-chip module.
>> +
>> +  MT7530 is a part of the multi-chip module in MT7620AN, MT7620DA, MT7620DAN,
>> +  MT7620NN, MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs.
>> +
>> +  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/100 PHYs
> 
> s/got //

Can't use British English on bindings? :)

> 
>> +  and the switch registers are directly mapped into SoC's memory map rather than
>> +  using MDIO. There is currently no support for this.
> 
> No support in the binding or driver? Driver capabilities are relevant to
> the binding.

In the driver. Also, did you mean irrelevant? Should I remove this part 
from the binding?

> 
>> +
>> +  There is only the standalone version of MT7531.
>> +
>> +  Port 5 on MT7530 has got various ways of configuration.
> 
> s/got //
> 
>> +
>> +  For standalone MT7530:
>> +
>> +    - Port 5 can be used as a CPU port.
>> +
>> +    - PHY 0 or 4 of the switch can be muxed to connect to the gmac of the SoC
>> +      which port 5 is wired to. Usually used for connecting the wan port
>> +      directly to the CPU to achieve 2 Gbps routing in total.
>> +
>> +      The driver looks up the reg on the ethernet-phy node which the phy-handle
>> +      property refers to on the gmac node to mux the specified phy.
>> +
>> +      The driver requires the gmac of the SoC to have "mediatek,eth-mac" as the
>> +      compatible string and the reg must be 1. So, for now, only gmac1 of an
>> +      MediaTek SoC can benefit this. Banana Pi BPI-R2 suits this.
>> +      Check out example 5 for a similar configuration.
>> +
>> +    - Port 5 can be wired to an external phy. Port 5 becomes a DSA slave.
>> +      Check out example 7 for a similar configuration.
>> +
>> +  For multi-chip module MT7530:
>> +
>> +    - Port 5 can be used as a CPU port.
>> +
>> +    - PHY 0 or 4 of the switch can be muxed to connect to gmac1 of the SoC.
>> +      Usually used for connecting the wan port directly to the CPU to achieve 2
>> +      Gbps routing in total.
>> +
>> +      The driver looks up the reg on the ethernet-phy node which the phy-handle
>> +      property refers to on the gmac node to mux the specified phy.
>> +
>> +      For the MT7621 SoCs, rgmii2 group must be claimed with rgmii2 function.
>> +      Check out example 5.
>> +
>> +    - In case of an external phy wired to gmac1 of the SoC, port 5 must not be
>> +      enabled.
>> +
>> +      In case of muxing PHY 0 or 4, the external phy must not be enabled.
>> +
>> +      For the MT7621 SoCs, rgmii2 group must be claimed with rgmii2 function.
>> +      Check out example 6.
>> +
>> +    - Port 5 can be muxed to an external phy. Port 5 becomes a DSA slave.
>> +      The external phy must be wired TX to TX to gmac1 of the SoC for this to
>> +      work. Ubiquiti EdgeRouter X SFP is wired this way.
>> +
>> +      Muxing PHY 0 or 4 won't work when the external phy is connected TX to TX.
>> +
>> +      For the MT7621 SoCs, rgmii2 group must be claimed with gpio function.
>> +      Check out example 7.
>>   
>>   properties:
>>     compatible:
>> -- 
>> 2.34.1
>>
>>

