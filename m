Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09CAC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WIxTn0pRjbZXHgFG8AwaR4joGVxkdi8wOuc1SO7gIs=; b=X85A0JXBlER711flogky+b+bv1
	/WFbzXS8Rk96W/Dj+q+RYSF+S6MHUXzF05niCQwj5FVm5oK9glYd8HTnjv8LHVG4MKEriD7eXVgQr
	xSUd+Y7ECCPEGuE2eityo2Npww5aGuLa6DVwiNraTkCzDk064CKFrt8BC6tqSj3HTjnb4KSDPQu8D
	hcHTDlv0u+R+xjSR0CwB/Yb2PhpKkNSfzFhC/7Fm1Dp1A59132XHz7Rya22PhSkjGxFXlUryB0N2p
	7HxUjuyst34ZYAAb0kX7lQ63tUZx9Pmh9AyamLyR1s4CiLi1njj1ey7aTMmyGklIcsBTtHnKX8eDU
	1Y7iN5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qtq-00000002tus-0vxB;
	Mon, 29 Apr 2024 13:18:30 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qtk-00000002tm2-1ysi;
	Mon, 29 Apr 2024 13:18:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4C1DC0005;
	Mon, 29 Apr 2024 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1714396691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6WIxTn0pRjbZXHgFG8AwaR4joGVxkdi8wOuc1SO7gIs=;
	b=FGEd0IUVUimnHqEMC3oAwvto00HNVnMflL0L7Ph/Ryrk7N/JOd8t1z4bbBPy5b58KRO9k5
	I3szYcCy8KVwRYHA1I6NfbF0HWGffDxy9+baoG19copWjA/jxRvbpIWFAaMDBDjyaWLWXk
	IKPn/HbPA4OqlW2+y/DGE85RCCMAklQrxnr+rWemcMa7T4IlOjaPDGsuV3y00M+UGoipOp
	Lsv/aCYhblt5FsBnUNpFA/1mLETUrUj0KaEnJ+E/2UYRMLXP3yc6HN0o0gYxq4oRf5EWh1
	txO81TyFcNZxEJVl4hf3JCF+BaPQlmyEXsv00J6rxXu9sd40YeFXkPafTdvXzg==
Message-ID: <f5eb359a-fdbf-4b0a-8df5-be034da1aca3@arinc9.com>
Date: Mon, 29 Apr 2024 16:17:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mt7530: detect PHY muxing when PHY is
 defined on switch MDIO bus
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240429-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v1-1-1f775983e155@arinc9.com>
 <Zi9vYLwgekd0Pmzn@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Zi9vYLwgekd0Pmzn@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_061824_819030_357AB2C4 
X-CRM114-Status: GOOD (  25.04  )
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

On 29.04.2024 12:58, Russell King (Oracle) wrote:
> On Mon, Apr 29, 2024 at 12:46:43PM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Currently, the MT7530 DSA subdriver configures the MT7530 switch to provide
>> direct access to switch PHYs, meaning, the switch PHYs listen on the MDIO
>> bus the switch listens on. The PHY muxing feature makes use of this.
>>
>> This is problematic as the PHY may be probed before the switch is
>> initialised, in which case attaching the PHY will fail.
>>
>> Since commit 91374ba537bd ("net: dsa: mt7530: support OF-based registration
>> of switch MDIO bus"), we can describe the switch PHYs on the MDIO bus of
>> the switch on the device tree. Extend the check to detect PHY muxing when
>> the PHY is defined on the MDIO bus of the switch on the device tree.
>>
>> When the PHY is described this way, the switch will be initialised first,
>> then the switch MDIO bus will be registered. Only after these steps, the
>> PHY will be probed.
> 
> Looking at the commit description and the patch, I'm not sure whether
> you really mean "probed" or whether you mean "attached".
> 
> PHY drivers will bind to PHY devices when they are detected on the MDIO
> bus (either by scanning or instantiating firmware description) and the
> devices are registered. As each device is registered, the drivers for
> the bus type are scanned and any matches will have their probe function
> called. This happens outside of any control of the DSA driver if the
> DSA device is on the same MDIO bus.
> 
> This is separate from the process of looking up a PHY and attaching the
> PHY.
> 
> So, I think there is probably a terminology issue with the patch
> description. I suspect you don't mean "probing" as in phy_probe() being
> called. Looking at the code, it looks like the driver is making
> decisions based on how PHYs are connected to the ethernet MACs in the
> device tree, and you're making decisions based on that. I wouldn't call
> that "probing" a PHY.

Yes, I meant to say "looking up a PHY and attaching the PHY" by probing a
PHY. I'll adjust the patch log to below, thanks.

Currently, the MT7530 DSA subdriver configures the MT7530 switch to provide
direct access to switch PHYs, meaning, the switch PHYs listen on the MDIO
bus the switch listens on. The PHY muxing feature makes use of this.

This is problematic as the PHY may be attached before the switch is
initialised, in which case, the PHY will fail to be attached.

Since commit 91374ba537bd ("net: dsa: mt7530: support OF-based registration
of switch MDIO bus"), we can describe the switch PHYs on the MDIO bus of
the switch on the device tree. Extend the check to detect PHY muxing when
the PHY is defined on the MDIO bus of the switch on the device tree.

When the PHY is described this way, the switch will be initialised first,
then the switch MDIO bus will be registered. Only after these steps, the
PHY will be attached.

Arınç

