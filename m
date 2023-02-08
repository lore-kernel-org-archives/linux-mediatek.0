Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD6EC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnSkljIpR8ATyKhVrygVxOMSwVCtcXa/ymKaXsWn3tA=; b=may0LAlQEL4Nqs0Gquwy+UYK44
	QP7eRbSdNTeueKl+DdEOohE2hnOF/H2auaMQmp04iMDYzPfUpdMBFCV0Iq0HxY5NaKdOBuoyVxV06
	ZOGvsFimq+G4RQlMFMn6BSPFR6nmM8kXWgUZz5WIYHwNAIqUHDBw6cuL9buY7S0tQvg/8Or7c4UR5
	jh3kXDriRsvzMiuklEHMXYRQl9r+ljjNyN7Ybtzns5GehFNlSPjA3tKIaJM3hGrOgEzHaLMs+UpJ6
	XZkmt/CsvONTt5/4d7Zp4UwJIcDzb73So6nmETx13pUARLM5uU2LG0j2n7pDSfoXjxIVHEMlT1Nud
	UTnktCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgtZ-00EuXh-Vp; Wed, 08 Feb 2023 09:37:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgp6-00Esb8-OK; Wed, 08 Feb 2023 09:33:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40D3A61544;
	Wed,  8 Feb 2023 09:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1595C433EF;
	Wed,  8 Feb 2023 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675848783;
	bh=mtLAxODoZih5gt61pMFGV9SSfH5hXOAxrX2G4TD7tV8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFcBniOZqVPytRtBzGqthXxYKgChac/vlLk8nKkV4S9ps/uitnOruM83klgnrBVWX
	 hlceJQRmodry2wCGOvSB6BnCFYfCo9/qC1sVlXtkGlOhbcF0kWlyJa/7KJWiSoL2SE
	 RQh1v49CIUMk6mJ7vf60Nw9hlMote6tmWY/CUa0xeYdwBCqKm0W6f7Urh4vqXXt1IH
	 hxxgCgQQm7gnzlexkhh+YRJdf4iTEnSttLRX+SEg6Hi7fjyt/WFZ2Gm14ThP+qN1Mw
	 kPW7EOENnOAnc4c2TI2+U4END54wvsHRysVDYYN1ZefZLPfxE9dQVwMChs9DKrHcyw
	 r3BFRPx/pBeYg==
Message-ID: <b6d782ef-b375-1e73-a384-1ff37c1548a7@kernel.org>
Date: Wed, 8 Feb 2023 10:32:53 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <Y+KR26aepqlfsjYG@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_013304_917946_0B741E1E 
X-CRM114-Status: GOOD (  30.06  )
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

On 07/02/2023 19:00, Daniel Golle wrote:
> Hi Krzysztof,
> 
> On Tue, Feb 07, 2023 at 06:38:23PM +0100, Krzysztof Kozlowski wrote:
>> On 07/02/2023 15:19, Daniel Golle wrote:
>>> Add documentation for the newly introduced 'mediatek,pn_swap' property
>>> to mediatek,sgmiisys.txt.
>>>
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>  .../devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt    | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
>>> index d2c24c277514..b38dd0fde21d 100644
>>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
>>> @@ -14,6 +14,10 @@ Required Properties:
>>>  	- "mediatek,mt7986-sgmiisys_1", "syscon"
>>>  - #clock-cells: Must be 1
>>>  
>>> +Optional Properties:
>>> +
>>> +- mediatek,pn_swap: Invert polarity of the SGMII data lanes.
>>
>> No:
>> 1. No new properties for TXT bindings,
> 
> So I'll have to convert the bindings to YAML, right?

Yes, please.

> 
>> 2. Underscore is not allowed.
> 
> Ack, will change the name of the property.
> 
>> 3. Does not look like property of this node. This is a clock controller
>> or system controller, not SGMII/phy etc.
> 
> The register range referred to by this node *does* represent also an
> SGMII phy. These sgmiisys nodes also carry the 'syscon' compatible, and
> are referenced in the node of the Ethernet core, and then used by
> drivers/net/ethernet/mediatek/mtk_sgmii.c using syscon_node_to_regmap.
> (This is the current situation already, and not related to the patchset
> now adding only a new property to support hardware which needs that)

Just because a register is located in syscon block, does not mean that
SGMII configuration is a property of this device.

> 
> So: Should I introduce a new binding for the same compatible strings
> related to the SGMII PHY features? Or is it fine in this case to add
> this property to the existing binding?

The user of syscon should configure it. I don't think you need new
binding. You just have to update the user of this syscon.

Best regards,
Krzysztof


