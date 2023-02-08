Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B23C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2iWE5pk2XiTA8IzaVyZC++cnQDDkHbNEKPWZFzKyfs=; b=X6sGb6N1egpFMu3BMNNrB4I2KN
	EaTGKQX8FETDXIFufQm4Z1MmINZWmsBMmaKynwSmgX4EscJQ3JY6lgbfkuiLfwpLH/VAayJCnHWE8
	RxDln1u6SooTbbZsZZM3Or3QzZAkTj3Lce3vHBZLXongoOHuX4ed07XyS/zHGdk30AygoUPtt04Zg
	nQQmqACudssuk3YzyddCKDygqFun4j8XyynROB0kdvhydhlr3nkhTfXc4jFdo85A5Ro2VxPLHaltU
	Ki3m5TmrgTCXr/iaLimrpnyr8+9mIx/fTzCIus2oQALNU1Ag+UiJb+kzWWK+rXgytWN/RSKDe63DU
	1jURrzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqkj-00GqcT-Kk; Wed, 08 Feb 2023 20:09:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqkY-00GqZ5-SR; Wed, 08 Feb 2023 20:09:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 690A0B81F9B;
	Wed,  8 Feb 2023 20:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44CFC433EF;
	Wed,  8 Feb 2023 20:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675886936;
	bh=u08v1uuwDFJtOpWpfegicZ6WBuCjXNKnjx/7U+yBIcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DKp9BLh12I0dzoJ4m2uBCId/223QoOf9AzGj+vgHRsAqqpF0ZIeu/kVJWdudh92HT
	 RqFFOlgfhcKWN+JF6OzbPam8bdSDpe5hv72xmLRnRkZOddKXYAz/rmcvJIEGMNWxna
	 z2fRbu1whwzaOZGDUVvdo7KxCJQDrr9gw6FmdyyRlSQSZ4TgZPxuk0YwXq/IAMce5L
	 13W/egEklQnx0RrbqHN5TKLtqWasH0VXvlWIyhau5243MwwDnp1FViSZV9tB8h+fLe
	 +G86i7TlOiUaCvP0eX5+EqKL9cRf0+NiOjsF/CrUj8oKfh7WgHYVw7MBIHju/YXvOi
	 yrmBww94CQO+A==
Message-ID: <514ec4b8-ef78-35c1-2215-22884fca87d4@kernel.org>
Date: Wed, 8 Feb 2023 21:08:40 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <Y+Oo9HaqPeNVUANR@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_120903_267673_6FE8A2C5 
X-CRM114-Status: GOOD (  32.52  )
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

On 08/02/2023 14:51, Daniel Golle wrote:
> On Wed, Feb 08, 2023 at 10:32:53AM +0100, Krzysztof Kozlowski wrote:
>> On 07/02/2023 19:00, Daniel Golle wrote:
>>> ...
>>>> 3. Does not look like property of this node. This is a clock controller
>>>> or system controller, not SGMII/phy etc.
>>>
>>> The register range referred to by this node *does* represent also an
>>> SGMII phy. These sgmiisys nodes also carry the 'syscon' compatible, and
>>> are referenced in the node of the Ethernet core, and then used by
>>> drivers/net/ethernet/mediatek/mtk_sgmii.c using syscon_node_to_regmap.
>>> (This is the current situation already, and not related to the patchset
>>> now adding only a new property to support hardware which needs that)
>>
>> Just because a register is located in syscon block, does not mean that
>> SGMII configuration is a property of this device.
> 
> It's not just one register, the whole SGMII PCS is located in those
> mediatek,sgmiisys syscon nodes.

Then maybe this should be a PCS PHY device instead of adding properties
unrelated to clock/system controller? I don't know, currently this
binding says it is a provider of clocks...

> 
>>
>>>
>>> So: Should I introduce a new binding for the same compatible strings
>>> related to the SGMII PHY features? Or is it fine in this case to add
>>> this property to the existing binding?
>>
>> The user of syscon should configure it. I don't think you need new
>> binding. You just have to update the user of this syscon.
> 
> Excuse my confusion, but it's still not entirely clear to me.
> So in this case I should add the description of the added propterty of
> the individual SGMII units (there can be more than one) to
> Documentation/devicetree/bindings/net/mediatek,net.yaml
> eventhough the properties are in the sgmiisys syscon nodes?

I guess the property should be in the node representing the SGMII. You
add it now to the clock (or system) controller, so it does not look
right. It's not a property of a clock controller.

Now which node should have this property depends on your devices - which
I have no clue about, I read what is in the bindings.

> 
> If so I will have to figure out how to describe properties of other
> nodes in the binding of the node referencing them. Are there any
> good examples for that?

phys and pcs'es?

> 
> Or should the property itself be moved into yet another array of
> booleans which should be added in the node describing the ethernet
> controller and referencing these sgmiisys syscons using phandles?

Best regards,
Krzysztof


