Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C939AC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 07:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/FlQC5Q2ET2tc73S8vRew9D2w/9C51b4ONdPMKoY6Y=; b=tJjJBJhQpuUgLI
	7cZvL97pyvDaG/0PR7VZEzpq6V3vsgmvEd9EA1JGFJ0hGrYlPaBo80kORIQ/HI0hfPhz4YSpAXNRJ
	VNCBZHyIR5k93Mgggvr+i07q9BjC+wfzhh/sVnkSn75jYrX6pOm/W0yWD5hjQrDAhPBx5pWz42y2z
	mhSWNXLUbrgBEC1k3xwBRqQwTo6Vo4nWAVzPmRZFw8hZRN7UYpsHpz/iZoZuZCp6dhUeObfJkiyzp
	y/rMaGMHEwM9jNiXqlSkYHQnXp1McZPCrMVNABJFRrYpiJiCaZrK2WNzbxphxMTlulwvD0dkyoY8L
	88UGts6J5w5IyQKzs4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSzZ-00Abgb-2F;
	Wed, 10 Jan 2024 07:27:13 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSzU-00AbfP-2e;
	Wed, 10 Jan 2024 07:27:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 203EFC0005;
	Wed, 10 Jan 2024 07:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704871623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a/FlQC5Q2ET2tc73S8vRew9D2w/9C51b4ONdPMKoY6Y=;
	b=T5qJ7b4xaA0GBYZYKmmBMQKQm9GhK5NqUzyB+rLGNLIeULaidw/I5/MEhJVsdwAAGmNJRz
	zzqorDR0yLw4ihEE+TL5uwC7cOAgwx3E53ERubOLFzmdBoQMbBgLfreaXTIKgoA26NChsG
	+QLDoHl0qkRTAdOskGqKY+qVf+aGId/cMXu2gnJAgP1/D5XH6782V5ZmyiFx2hRq57iRRs
	FAmZ2PdvdGIKBokpN+jYpGF4Zyf5Rchd5F6as+3sbWz4lT1Mpx38udHAUSaNI1TkW4iY8e
	UCcI47FhTkyGU53/+pFPLIaqPrpXfhZim+0Ad36Irl2RmE1xQP3PsaXBhsX7pQ==
Message-ID: <0a086b5f-b319-4f08-9513-a38c214e1da7@arinc9.com>
Date: Wed, 10 Jan 2024 10:26:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
 <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
 <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
 <20231208184652.k2max4kf7r3fgksg@skbuf>
 <c3a0fc6a-825c-4de3-b5cf-b454a6d4d3cf@arinc9.com>
 <48b664fb-edf9-4170-abde-2eb99e04f0e5@suswa.mountain>
 <2ad136ed-be3a-407f-bf3c-5faf664b927c@arinc9.com>
 <20240109145740.3vbtkuowiwedz5hx@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240109145740.3vbtkuowiwedz5hx@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_232709_139457_05DA58E9 
X-CRM114-Status: GOOD (  27.99  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Dan Carpenter <dan.carpenter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9.01.2024 17:57, Vladimir Oltean wrote:
> Yes, well _now_ it is a false positive, probably because smatch cannot
> determine that when priv->p5_intf_sel has been set to P5_INTF_SEL_PHY_P0
> or P5_INTF_SEL_PHY_P4, "interface" should have been also initialized.
> But it doesn't matter, you can ignore a false positive. I'm also seeing it.
> Although you should check whether treating -ENODEV as a hard error is fine
> and won't cause regressions.
> 
>> Just so you know, I intend to remove this whole PHY muxing feature once I
>> bring changing DSA conduit support to this subdriver. I've got two strong
>> reasons for this.
>> - Changing the DSA conduit achieves the same result with the only overhead
>>    being the DSA header included on every frame.
>>
>> - There can't be proper dt-bindings for it as the nature of the feature
>>    shows that it represents an optional way to operate the hardware, it does
>>    not represent a hardware design. Overall, the implementation is a hack to
>>    make it work for specific hardware (switch must be connected to gmac1 of
>>    a MediaTek SoC, no PHY must be present at address 0 or 4 on the MDIO bus
>>    of the SoC. It should rather be configurable on userspace. Which will
>>    never happen as it is specific to this switch and the changing DSA
>>    conduit feature is the perfect substitute for this.
> 
> Is PHY muxing a "true" switch bypass, or is it just a route through the
> switch for all packets coming from GMAC5 to go to phy0 or phy4? If the
> latter, I agree that dynamic conduit changing is a more flexible option,
> not to mention the user space tooling is already there.

It's the latter, and that's exactly what I think.

> 
> Are there existing systems that use PHY muxing? The possible problem I
> see is breaking those boards which have a phy-handle on gmac5, if the
> mt7530 driver is no longer going to modify its HWTRAP register.

Ah see, for PHY muxing, the driver actually wants the phy-handle to be put
on the SoC MAC, and the PHY to be defined on the SoC ethernet's MDIO bus.
We don't even define gmac5 as a port on the switch dt-bindings.

While none of the DTs on the Linux repository utilise this, some of the
mt7621 DTs on OpenWrt do. The change in behaviour will only be that phy0/4
will be inaccessible from the SoC MAC's network interface. I de-facto
maintain the mt7621 device tree source files there. I intend to revert it
along with adding port 5 as a CPU port so that the conduit changing feature
becomes available.

> 
>>
>> Let me know if you've got any suggestions that can get rid of the warning
>> without reworking the whole code block. Otherwise, I'm just going to ignore
>> it until I get rid of the whole code block.
> 
> The obvious way would be to leave the initialization to PHY_INTERFACE_MODE_NA
> there. Or to just ignore the warning.

I'll ignore.

Arınç

