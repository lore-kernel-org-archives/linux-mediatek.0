Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A63C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1rjsEgyVWVkG2lBkygNFoS+ERY9yY1N//Uw/xuZ26A=; b=w0wloEXRIeK5rstundQsHaWVvH
	hGg+C6qrWBWA/sRqc6Sop1djEZ8QCiJ2Uookkd9xH7NYzsjZ0+TdwiJvSyBjF7yLFzGb+xbDLwCPX
	2+bSAQDCBAIBrgV69WTKKnC2ddLlRbd7J98cqhb2B1SrlcHh+JaN9BdMy7Lqjyhnf0RaCTqMYFm9I
	xzNWcw8PAshxW2eH2czKBXXaBafY5diWJFIUHUUwgLPdBk8Kdmhm+Wv17p47b+swjlNuFHZCj+C08
	kXUXVrvlz/bRB7V7yzkOTcnjNPEgJzBUnHnWWRK4DtxUUwJoIf+Is8yarjW9a1IjcYh/l9k5XLYGx
	5/JslcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2kh-00000000ux0-1x2u;
	Wed, 20 Mar 2024 20:41:35 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2kc-00000000uvY-3jsg;
	Wed, 20 Mar 2024 20:41:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64A981BF203;
	Wed, 20 Mar 2024 20:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710967282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1rjsEgyVWVkG2lBkygNFoS+ERY9yY1N//Uw/xuZ26A=;
	b=OrA6x1pw+oPiuzJyJ6Pla7RsogCFk+LQcK4+lE0F3bjgNfUapB5dc+J9P9L6oKhRsURsYY
	1+wzoAlDzufeHPBu4hIfEgvqTui3nNq4Q7Cfa1x7I9LMd4tBO6sEmJrS0iVbVaTaD1WFB1
	KkQ/HhxIibIrs0EvHBweSj/5Z7lXSKJJhuatUETaxN8QrZVo6AZIe5DHSADPq0Q77arMbB
	Kug78hCkX7MmcOPQn+W1L89iwFAHrht83noEZWNrhifBHDefOvwNekMlWe2AO6arp1lc6f
	wHlWDRxSM7I/HYJqePmmg5vcSEnEB1cARMmii3dEj6Qs9Ozpb+EQLEDHCfDRrg==
Message-ID: <3698b522-d6dc-46c1-bab2-d5ee3bed1fce@arinc9.com>
Date: Wed, 20 Mar 2024 23:40:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: phy: mediatek-ge: do not disable EEE
 advertisement
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
 <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-3-3f17226344e8@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-3-3f17226344e8@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_134131_272589_688CDBDC 
X-CRM114-Status: GOOD (  11.95  )
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

On 18.03.2024 10:46, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There's no need to disable Energy-Efficient Ethernet (EEE) advertisement on
> the MT7530 and MT7531 switch PHYs. EEE works fine on MT7530 and MT7531
> switch PHYs. Remove the code where EEE advertisement is disabled.
> 
> This is a bugfix because there's a possible race condition where the
> mediatek-ge driver would kick in after the MT7530 DSA subdriver which would
> have EEE disabled until manually enabled.

Can I get an opinion on this? Is it actually possible that the PHY driver
would start probing after the DSA subdriver? On the console logs for the
DSA subdriver, I can see that the name of the PHY driver will appear, which
makes me believe the PHY driver would actually never probe after the DSA
subdriver.

[    4.402641] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=POLL)
[    4.420392] mt7530-mdio mdio-bus:1f lan0 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=POLL)
[    4.437791] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=POLL)
[    4.455096] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=POLL)
[    4.472422] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=POLL)

I don't want to submit a bugfix to the net tree if the bug won't ever
happen in real life.

Arınç

