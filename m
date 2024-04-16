Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A43C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m566RVi6Hjc4VyINZc6IMhS42+xhOl1ARnyrIuF1SbM=; b=jKmJDgTuyCaKsG7T49S0WAnojp
	Askl0IrOKKyJwuTL8kZs+L+fvbh0+NZbyTq08dtwGympHnzOLBwiP0hRlCgVckG1go2DY1OVH2Umo
	CN8UtiIl+w5MTXT58dn477xpa+aKbdGFL/Y4iV9B4Dbo6/UHHcjs+J8nq2/76yng0H+XXJJoVXtq2
	XUtaegv0i2s0i08a2j2H1sO6BGhBl6CM1RljeTwDHi0fVZlOWe3jBAFDb2O3wPhUSVwu2omdAq73h
	bi5OpD0UQNDCVafVarJNSDvDjuPXDZyUhY49uUfYoCESZdTSulvmn12hspv4vDzT2ENQeaLbnd783
	DNM2fb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweFc-0000000BSxY-1WuX;
	Tue, 16 Apr 2024 08:33:12 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweFX-0000000BSvT-1w9S;
	Tue, 16 Apr 2024 08:33:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1FD1C0009;
	Tue, 16 Apr 2024 08:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1713256375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m566RVi6Hjc4VyINZc6IMhS42+xhOl1ARnyrIuF1SbM=;
	b=SXiPD9tA3i+YVZj1nSoulZISksMVUPC9CQbgwO1PiVLiguE+LcuIS0qBfzixGRc6j1xhi8
	uHlSIWDTTgF9NgPoZmZVWz3UbBplGE0SEwWD8uV/dz1mJu2vgjF/uiboHYWpd7dkgcNdRf
	WtN3t/O3N9yp+lfpAQUvgCmhXpe9ofeAPmn8o9JGkoOiyR82NwHPluSG1W/ARFWQ/IUAZU
	RyxVW7rNmzpEU1pZvtOnNXCSpcisSn0AnWaZDO3/CwnLH7Qcyo7NgQJQ7l3O/9WtY3MX2r
	T/8TcK3bBxBkX140iMJJHuBG3qUoOZERTbl3FFLHznSEszmBgZZjXcFWdMI7HQ==
Message-ID: <7d0ded52-14f0-4f6a-b639-72f537603be8@arinc9.com>
Date: Tue, 16 Apr 2024 11:32:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: dsa: mt7530-mdio: read PHY address
 of switch from device tree
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-0-1a7649c4d3b6@arinc9.com>
 <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-1-1a7649c4d3b6@arinc9.com>
 <459b31bd-64b3-4804-bc5a-c8ffd145e055@gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <459b31bd-64b3-4804-bc5a-c8ffd145e055@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_013307_822492_47C5AC1D 
X-CRM114-Status: GOOD (  15.95  )
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

On 15/04/2024 18:30, Florian Fainelli wrote:
> 
> 
> On 4/13/2024 11:07 PM, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Read the PHY address the switch listens on from the reg property of the
>> switch node on the device tree. This change brings support for MT7530
>> switches on boards with such bootstrapping configuration where the switch
>> listens on a different PHY address than the hardcoded PHY address on the
>> driver, 31.
>>
>> As described on the "MT7621 Programming Guide v0.4" document, the MT7530
>> switch and its PHYs can be configured to listen on the range of 7-12,
>> 15-20, 23-28, and 31 and 0-4 PHY addresses.
>>
>> There are operations where the switch PHY registers are used. For the PHY
>> address of the control PHY, transform the MT753X_CTRL_PHY_ADDR constant
>> into a macro and use it. The PHY address for the control PHY is 0 when the
>> switch listens on 31. In any other case, it is one greater than the PHY
>> address the switch listens on.
>>
>> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
>> Tested-by: Daniel Golle <daniel@makrotopia.org>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> I would go a step further and name phy_addr switch_mdio_addr, or something along those lines to clearly denote this is not a per-port PHY address neither a proper PHY device, but we've already had a similar discussion before about spelling this out clearly as a "pseudo PHY"....

I am fine with calling the switch operating on an MDIO bus a psuedo-PHY.
But I don't believe this grants making up names on our own instead of using
the name described in IEEE Std 802.3-2022. The switch listens on a PHY
address on the MDIO bus. The description for the phy_addr member of the
mt753x_info structure clearly explains that so I don't see a reason to
change the variable name.

Arınç

