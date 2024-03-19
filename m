Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAB6C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 21:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s4X5Gi14fiprbPp/n09JkrAb3WJPWZ0M3os7Ylh/ek=; b=plkPAN4ixt20Yvy1upszOXf/KW
	dtsdCcdupmgvYc9BtSnnwCZaqy6FhCWRGztEzDJB3rqS6+6ZAok1Kk12zPZo5U1a6lFXtmDON7ohZ
	xH8EsbvR2Dv+2fvdf0BZ8rcHDyuarmzJ4ZvUSePSNroVQfOcwrBDXkNVfkGrGA7KP2ezfRv5ciTwt
	REweWjVxJ+FqxuLdqkYVc2WIKXy3gZn8knsKyLmlGI8kkIyh+JiMFgYLAx4b+MqSBNUv4C4gVw98K
	YwErrEocjsPO/6FMDbXZ8uk5ymMd09jqUVnqDmMC5hN34H+DRWVG2+0cds5yh23ebRYcEVRwJpTQ1
	pM3tEOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmgp8-0000000EGR8-0LX7;
	Tue, 19 Mar 2024 21:16:42 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmgp2-0000000EGNK-27BC;
	Tue, 19 Mar 2024 21:16:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A37D20003;
	Tue, 19 Mar 2024 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710882988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9s4X5Gi14fiprbPp/n09JkrAb3WJPWZ0M3os7Ylh/ek=;
	b=MHv/Y2Jf/gg5YRz9Xg02A3Uy/+L3ntSL/gPAF2UzYbGmc/qP7PHY7VuKl1zed85n+N0kdQ
	1o1k/QGe5GsBCSlsu39mtGksj8tLqwlnJ7WHeuYmJUOTLN8UP0ukvtN7f4FqZXg/Wv8AKZ
	mkWevzKGdbH9d1/Kjo5b6aQL2Fa88IJLQZwGG6TRvf8issssdzTBXSnOVcorW02H6rKQl4
	W8teqzjihbMWP1A90re1PyZwbcQn5VgYA5ceHRdyq2N8AnXB104IBNYkdxUa96gkkknxog
	fBwi1pMb8vaeKS9pQFCxNaQI2NRAfJjGt4aRoqOV43X4DOwUGW9EY4V5n6pisA==
Message-ID: <3c6ccef9-8654-49ba-88d9-d39e99d2b7b1@arinc9.com>
Date: Wed, 20 Mar 2024 00:16:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v>
 <ZfnYkuzuvwLepIfC@makrotopia.org>
 <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
 <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
 <Zfn1DxkEa3u-f7l2@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Zfn1DxkEa3u-f7l2@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_141636_701924_ACD7F0C7 
X-CRM114-Status: GOOD (  16.49  )
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

On 19.03.2024 23:26, Daniel Golle wrote:
> On Tue, Mar 19, 2024 at 08:38:03PM +0100, Andrew Lunn wrote:
>>> I would argue that EEE advertisement on the PHY should be enabled by
>>> default.
>>
>> That is an open question at the moment. For some use cases, it can add
>> extra delay and jitter which can cause problems. I've heard people
>> doing PTP don't like EEE for example.
> 
> MediaTek consumer-grade hardware doesn't support PTP and hence that
> quite certainly won't ever be an issue with all switch ICs supported
> by the mt7530 driver.
> 
> I'd rather first change the (configuration) default in OpenWrt (which
> is arguable the way most people are using this hardware), also because
> that will be more visible/obvious for users. Or even just make EEE
> configurable in the LuCI web-UI as a first step so users start playing
> with it.
> 
> After all, I also have a hard time imagining that MediaTek disabled
> EEE in their downstream driver for no reason:
> 
> https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/24091177a18ba7f2dd8d928a8f5b27b14df46b16

Are you saying this to indicate that we shouldn't remove that from
mediatek-ge? If so, I've already explained that there'd be no practical
change in removing it as both MT7530 and MT7531 switches enable EEE
advertisement after mediatek-ge.

Arınç

