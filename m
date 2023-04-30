Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3433C77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 12:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olgWYWHl3CQIZVN3meZ6Pp4mpjNF3JJSDCCjo5V0hYc=; b=ZvnVbgcsTqvA85XG4Jag9K7hBV
	dWa1fKGHRW6nmKheORewHVriwirj07wsnVAVtFls7jAjTFZ7wc450GX/yg3Nwrr6ibgy65UuV3FYu
	U0IUOsqkpq8IFoLDpW8XasjC5cKpgtmoIN8mch7TOXU702gcfI04Qvac0RU86jbYnlS5y2w3/iRgB
	DgLeElxzP1iMnxxZV+3XSOhxRdNQKernjxWX1VAwlTi8jLCmd/105rqM+Yww66bPSwx6YP3pSFLHE
	e2cJGgHTA8z7y98FS07wLrnc5ym4rb7fZlq2ZpJkrYsf12ULVMIfH2/dx9HSF+TD5slSWqxGLoHtC
	l+QXlUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pt6YG-00EBSX-2T;
	Sun, 30 Apr 2023 12:53:16 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pt6YD-00EBS0-1s;
	Sun, 30 Apr 2023 12:53:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682859173; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JJtlInMc88s5cFIFmb+28p/VR0ERmgrMdExIpBCVB2u0u51AvybL5+lXT+Qr8+1bruuRToPe9C2vL77iPL4Qc2Lq+TTwXjsll72KaJa8HLIVQmux8TVoNWKy/x7T+Kzq+2JZqo69smHGOmiJ3x6+Km8cK0LhTlFeeDMezTja5CY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682859173; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=olgWYWHl3CQIZVN3meZ6Pp4mpjNF3JJSDCCjo5V0hYc=; 
	b=bw/iSmSCLJJScNpdJHpLmt3Ngo1oZI2SRyiGgwByfPoI6qD0NffUNwdMEW/w0Dd3/U7QKBMaUFbIrY2iQTFR46L/f4TYOZ5c0hE3bDa+EQ3mUTKJ8d22wCkxScG/wqmCKcMG2xu5oOglBpoS2ByApYASHATpFyX54LvgPIZS54g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682859173;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=olgWYWHl3CQIZVN3meZ6Pp4mpjNF3JJSDCCjo5V0hYc=;
	b=bf53awNY/1fwqOZeqetH9iXc8AzrtW5xOObM24CSmkh/GNMH9sBZT9fMXX67Abqm
	jyUrpzciSMxqsobNeCXeXBDjyDN4ZGKGlJ7OX6rdoD1H4Bbk7ds01Kx/8TUeiYxKjSK
	13jLwcRf4iHBec+pcm8jTcDDZaagWge5cekVyTY0=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 168285917183957.9871848963279; Sun, 30 Apr 2023 05:52:51 -0700 (PDT)
Message-ID: <4270c379-ae34-0002-e812-874180257d9e@arinc9.com>
Date: Sun, 30 Apr 2023 15:52:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] dt-bindings: net: dsa: mediatek,mt7530: document
 MDIO-bus
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: David Bauer <mail@david-bauer.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230430112834.11520-1-mail@david-bauer.net>
 <20230430112834.11520-2-mail@david-bauer.net>
 <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
 <ZE5inBwZrOE-9uyA@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZE5inBwZrOE-9uyA@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_055313_681759_2091C12F 
X-CRM114-Status: GOOD (  20.31  )
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

On 30.04.2023 15:44, Daniel Golle wrote:
> On Sun, Apr 30, 2023 at 03:34:43PM +0300, Arınç ÜNAL wrote:
>> On 30.04.2023 14:28, David Bauer wrote:
>>> Document the ability to add nodes for the MDIO bus connecting the
>>> switch-internal PHYs.
>>
>> This is quite interesting. Currently the PHY muxing feature for the MT7530
>> switch looks for some fake ethernet-phy definitions on the mdio-bus where
>> the switch is also defined.
>>
>> Looking at the binding here, there will be an mdio node under the switch
>> node. This could be useful to define the ethernet-phys for PHY muxing here
>> instead, so we don't waste the register addresses on the parent mdio-bus for
>> fake things. It looks like this should work right out of the box. I will do
>> some tests.
>>
>> Are there any examples as to what to configure on the switch PHYs with this
>> change?
>>
>>>
>>> Signed-off-by: David Bauer <mail@david-bauer.net>
>>> ---
>>>    .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> index e532c6b795f4..50f8f83cc440 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> @@ -128,6 +128,12 @@ properties:
>>>          See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
>>>          details for the regulator setup on these boards.
>>> +  mdio:
>>> +    $ref: /schemas/net/mdio.yaml#
>>> +    unevaluatedProperties: false
>>> +    description:
>>> +      Node for the internal MDIO bus connected to the embedded ethernet-PHYs.
>>
>> Please set this property as false for mediatek,mt7988-switch as it doesn't
>> use MDIO.
> 
> Well, quite the opposite is true. This change is **needed** on MT7988 as
> the built-in 1GE PHYs of the MT7988 are connected to the (internal) MDIO
> bus of the switch. And they do need calibration data assigned as nvmem
> via device tree.
> 
> tl;dr: Despite not being connected via MDIO itself also MT7988 exposes an
> internal MDIO bus for the switch PHYs.

Got it, thanks.

Arınç

