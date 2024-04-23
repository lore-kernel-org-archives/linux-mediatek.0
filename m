Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53E6C10F15
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RSaeKenSkqzfI7p9YhBSwGcR+DegY61d7J8nJauZO8=; b=oJ0q/m9caiNtbEPytz8lXLSHWe
	o6THjn9Qlg+IVeI7PsYQNc5+BK4o2uw+/PGrDvwhPoU56qUtjBLLTmQgaK6qvRwMZqYYJOVmcGW4c
	nQ2lKYKX82etPnPn7M56ZL1UJ2jUiejGKOHeNOn4Re2jcyBVsJb37op35PI8tWk3czZIbHRobYwMY
	E4mpynbTwb4UZpw3d9YmW6hI7pJndRtvWW2xjZb//UPZJyBwS2GQgunGhH8dh9PmikJhVpKiaMwMP
	UISVXJzPKi4/pNqKRpAtammSbum104A5sLUU2JXmZ1UQX3/H06xymp5dxdl2fy4PQwsoBd0Kj8Qm8
	8Ze6d4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCD2-0000000Gcz8-1WfT;
	Tue, 23 Apr 2024 09:13:04 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCCy-0000000Gcx6-1Y1H;
	Tue, 23 Apr 2024 09:13:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA66BC000A;
	Tue, 23 Apr 2024 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1713863575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4RSaeKenSkqzfI7p9YhBSwGcR+DegY61d7J8nJauZO8=;
	b=RisI7XupKRo6wJU3TRc7hhtxbnJr4vk3B/nwdTxtLfYbZbIpTA41dYeHgv83jFwkUkchaJ
	GRxF3LN4ttz6IQL4BgaxfR4QzSd+9e4jgnYPzGQC13E9EBcLVF3dmhG/CwAz9sS2RtKkKZ
	bXK6XI8RCIknkgSlHwDSBjP0btSBBwVQE7Pl6glaHHIO+HGLKiCJSKhqjA9AqgF15kYO3u
	A3C2vLY8YaUQam9W8pRs8kGne7fQ2IF7l/lRO8CtpDJUdNKeyjpubXqIX0TnNQK0XEqAc8
	SFwhodPli7/jQpUUBvMhLN2quJb3d3GujMPKB+UvyTdnWXHmdSsxZov3BHqJEw==
Message-ID: <6e67c66b-1d05-40d4-930f-625acc317ff1@arinc9.com>
Date: Tue, 23 Apr 2024 12:12:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net: dsa: mt7530: simplify core
 operations
To: Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240418-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v3-0-3b5fb249b004@arinc9.com>
 <20240418-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v3-2-3b5fb249b004@arinc9.com>
 <6123223eaf54ea6f492c896d81551315a1e38f66.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <6123223eaf54ea6f492c896d81551315a1e38f66.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_021300_692391_0B2C665A 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On 23/04/2024 11:40, Paolo Abeni wrote:
> On Thu, 2024-04-18 at 08:35 +0300, Arınç ÜNAL wrote:
>>   	/* Select the Function : DATA with no post increment */
>>   	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr),
>> -			 MII_MMD_CTRL, devad | MII_MMD_CTRL_NOINCR);
>> +			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
>>   	if (ret < 0)
>>   		goto err;
> 
> What about a possible follow-up, moving the above writes in a separate
> helper (say, 'core_select_register' or the like) and reusing it here
> and in core_rmw() ?

There's a possibility where the Clause 45 access method could be used here
which would make this redundant. I will do your suggestion if that won't
work out.

> 
> Not blocking this series, I'm applying it.

Cheers.
Arınç

