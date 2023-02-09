Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5B9C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeNtsWvX49l6ovJSoV/XS3WyOG/poxfYK6JYT1hd4ls=; b=r3EZVhxVJCKzhr0gaZ40Rkc9y7
	z3hHvxH1FoXzVdTyDBGM2WRVEaVH4Za4ly7KazLwOTMnzV3bSl5D6gRrFR/+KQu6i1htmfRs3HLpJ
	UhCrbM9eoMtoMqRoQmoNeH1MYYSph0U2z0c+aklFYpw3hMWaD6DwUCdg45s9x4/zVoJhQfHdqvzd5
	r83cDY+7D8yoZq3H2tzldc/PUDCwcH4vjninI0cqcYWzKLhdU29N5DiS2DAf+zuqTywptEl02EjuZ
	cH+uSRtL9UQ/8ETIotd5NlrMubZm14lU7l8HXKcL0BFomBo68Rc0L//Yuu5sxGiA2aioixeS+J5p7
	271vWkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ58d-001K8H-4K; Thu, 09 Feb 2023 11:30:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ58S-001K63-Fv; Thu, 09 Feb 2023 11:30:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BFA59619F6;
	Thu,  9 Feb 2023 11:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8FDC433D2;
	Thu,  9 Feb 2023 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675942239;
	bh=n5BKd8V/ZQGgcA9CiHhAacPMcS6Ke8ZhtPgxOCdKjJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BoqaH1iWcJdCR9gkQ/R77lbxXuZwL54BikFx0DaNFTXtCPgUZkWXhHzG/eIPwmCo9
	 b0+8V/GxAJVuhelhx6AhC931IIx8OcEh+4/ystJPjcZT2Pj08aslS25Ofy+L8z9s73
	 3arZVi/3IlRYNV3I8w6gRywtLI+qjKgTuPzkJi36Zugn/sl9RN0NNB0NDp6N9Q1VW+
	 zEwD8jcaY+DfU9rv3VhfZ427S5DOHhNEeYKj80NApzvw7+D/LevO3g9R5sN0/VAV/h
	 Q4e1Dvi/KUZJynY6qJ9dpO6go06ODQEywoJzDYXtV35WPUhW6NBDZjgUFpDv0+NjcD
	 x0ydgxmcp9h0Q==
Message-ID: <c29a3a22-cc23-35bf-c8e0-ebe1405a4d94@kernel.org>
Date: Thu, 9 Feb 2023 12:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 03/11] dt-bindings: arm: mediatek: add
 'mediatek,pn_swap' property
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>,
 Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Jianhui Zhao <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
 <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
 <Y+KR26aepqlfsjYG@makrotopia.org>
 <b6d782ef-b375-1e73-a384-1ff37c1548a7@kernel.org>
 <Y+Oo9HaqPeNVUANR@makrotopia.org>
 <514ec4b8-ef78-35c1-2215-22884fca87d4@kernel.org>
 <Y+QinJ9W8hIIF9Ni@makrotopia.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <Y+QinJ9W8hIIF9Ni@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_033040_641470_3F991C4B 
X-CRM114-Status: GOOD (  47.86  )
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

On 08/02/2023 23:30, Daniel Golle wrote:
> Hi Krzysztof,
> 
> thank you for taking the time to review and explain.
> 
> On Wed, Feb 08, 2023 at 09:08:40PM +0100, Krzysztof Kozlowski wrote:
>> On 08/02/2023 14:51, Daniel Golle wrote:
>>> On Wed, Feb 08, 2023 at 10:32:53AM +0100, Krzysztof Kozlowski wrote:
>>>> On 07/02/2023 19:00, Daniel Golle wrote:
>>>>> ...
>>>>>> 3. Does not look like property of this node. This is a clock controller
>>>>>> or system controller, not SGMII/phy etc.
>>>>>
>>>>> The register range referred to by this node *does* represent also an
>>>>> SGMII phy. These sgmiisys nodes also carry the 'syscon' compatible, and
>>>>> are referenced in the node of the Ethernet core, and then used by
>>>>> drivers/net/ethernet/mediatek/mtk_sgmii.c using syscon_node_to_regmap.
>>>>> (This is the current situation already, and not related to the patchset
>>>>> now adding only a new property to support hardware which needs that)
>>>>
>>>> Just because a register is located in syscon block, does not mean that
>>>> SGMII configuration is a property of this device.
>>>
>>> It's not just one register, the whole SGMII PCS is located in those
>>> mediatek,sgmiisys syscon nodes.
>>
>> Then maybe this should be a PCS PHY device instead of adding properties
>> unrelated to clock/system controller? I don't know, currently this
>> binding says it is a provider of clocks...
> 
> As in reality it is really a clock provider and also SGMII PCS at the
> same time, maybe we should just update the description of the binding
> to match that:
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> index d2c24c2775141..db6f75df200ba 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> @@ -2,6 +2,7 @@ MediaTek SGMIISYS controller
>  ============================
>  
>  The MediaTek SGMIISYS controller provides various clocks to the system.
> +It also represents the SGMII PCS used by the Ethernet core.
>  
>  Required Properties:
>  
> 
> See
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mediatek/mtk_sgmii.c#n179
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/mediatek/mt7986a.dtsi#n409

But it is not used as phy or PCS. It is used as syscon. If it was a phy
or PCS, then the property probably belonged here, but bindings and Linux
implementation were created in different way, so it is not a phy or PCS,
just a syscon.

>>>>> So: Should I introduce a new binding for the same compatible strings
>>>>> related to the SGMII PHY features? Or is it fine in this case to add
>>>>> this property to the existing binding?
>>>>
>>>> The user of syscon should configure it. I don't think you need new
>>>> binding. You just have to update the user of this syscon.
>>>
>>> Excuse my confusion, but it's still not entirely clear to me.
>>> So in this case I should add the description of the added propterty of
>>> the individual SGMII units (there can be more than one) to
>>> Documentation/devicetree/bindings/net/mediatek,net.yaml
>>> eventhough the properties are in the sgmiisys syscon nodes?
>>
>> I guess the property should be in the node representing the SGMII. You
>> add it now to the clock (or system) controller, so it does not look
>> right. It's not a property of a clock controller.
> 
> Well maybe this node needs to be split then into one node representing
> only the clock controller and another node representing the SGMII PCS?
> I'm not sure if this is even possible, some registers in this range
> represent clocks, other registers are accessed using regmap API in
> mtk_sgmii.c.

This can be the same node, but it must be used like PCS. syscon phandle
for getting regmap is something entirely else.

> 
> And (see the rest of this series) the exact same SGMII PCS can also be
> found in MT7531 switch IC which has it's own (a bit odd) way to access
> 32-bit registers over MDIO, also in this case it is simply not easily
> possible to represent the SGMII PCS in device tree.
> 
>>
>> Now which node should have this property depends on your devices - which
>> I have no clue about, I read what is in the bindings.
> 
> There isn't any other node exclusively representing the SGMII PCS.
> I guess the only other option would be to move the property to the
> Ethernet controller node, which imho complicates things as it is
> really a property of an individual SGMII PHY (of which there can be
> more than one).
> 
>>
>>>
>>> If so I will have to figure out how to describe properties of other
>>> nodes in the binding of the node referencing them. Are there any
>>> good examples for that?
>>
>> phys and pcs'es?
> 
> Hm, none of the current PCS (or PHY) drivers are represented by a
> syscon node... (and maybe that's the mistake in first place?)

Yes.


Best regards,
Krzysztof


