Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BCCCD11BF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Mar 2024 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f73/Dv7onEyO5WX6ZGZIZmakEQpnxirbQv7vQRZBis4=; b=l+o1ecb82v4KoorjS38ORMFPJR
	gn7Uk1ckoM5LRoDnjNtE87xTMDJog7jaxj1w4sN7cVGoonJFUyu61Qxz6CSIlt/NnX5yXXqzHdDgH
	I3RRvgW24lfRUU0gY8DG+qdgIrWRYNPOiuXRufDe9bipZESBteFdL4keiBVjerW4qjzAEwZTdimKA
	pV8pHErHU5K15wdnZnD3aa5IbqxtqAt2rAordfkQ6whUIscp9rzOjTChPuJT7vsEXVg61i8qRbBJy
	ckVDKxNgCPv14NQ2JPubmCjtKrB9nvXEeoQKCam8enseeqcP1s7l3o9J4oGrlPQWd2GEXWNEFRKLs
	mt6qe8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roKRt-0000000CHQJ-25IA;
	Sun, 24 Mar 2024 09:47:29 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roKRl-0000000CHM1-08h2;
	Sun, 24 Mar 2024 09:47:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D280C40002;
	Sun, 24 Mar 2024 09:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711273635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f73/Dv7onEyO5WX6ZGZIZmakEQpnxirbQv7vQRZBis4=;
	b=U61oCGXpXRQHJIhDTF91TvYBDsLhHB1RxvBJ4BongC/t9IUZixLMFfWJCkbf/I1R9LCTss
	LbCTa4/lz7pFpk8TTyIuR0FBdkR7Om55Rde9zwnLXpzNZn8+fbxbSmVdAMXxf9CRaYqtSx
	V+Y6tNLH0IQ2OoAJcGgXEbVhFm0TPnnC+F6UhHZ6yedNXazTppRP9+cB2Yd0NhO8CfVPx/
	epUGhMDav2BQrpoQwf9Bnpp1ONpvcZ+pl1KBb4zqii/3a7HaciXiZiSnLfrLIDKcyXEn6e
	Nihvh1gBioe3f8bjApjJeLZE7uaBXQEkU7ClIYQohmFRSlAElVYXE6FgAdA7Ww==
Message-ID: <5a4c0436-cd78-419f-af14-9c4e0c0435e3@arinc9.com>
Date: Sun, 24 Mar 2024 12:47:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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
 <38798882-c033-4949-9446-4c6f15c25ebe@gmail.com>
 <0fbe7ba2-6529-4118-b050-8ea76d28b712@arinc9.com>
 <11b2a4d1-66d8-4bcf-b1a8-20a635b99cc4@gmail.com>
Content-Language: en-US
In-Reply-To: <11b2a4d1-66d8-4bcf-b1a8-20a635b99cc4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_024721_374933_AFC18543 
X-CRM114-Status: GOOD (  13.09  )
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

On 21/03/2024 18:31, Florian Fainelli wrote:
> On 3/21/24 09:09, Arınç ÜNAL wrote:
>> I have started testing MT7531 with EEE enabled and immediately experienced
>> frames that wouldn't egress the switch or improperly received on the link
>> partner.
>>
>> SoC MAC       <-EEE off-> MT7531 P6 MAC (acting as PHY)
>> MT7531 P0 MAC <-EEE on -> MT7531 P0 PHY
>> MT7531 P0 PHY <-EEE on -> Computer connected with twisted pair
> 
> OK, so this is intended to describe that the SoC's Ethernet MAC link to the integrated switch did not use EEE only the user-facing ports. That makes sense because it's all digital logic and you are not going to be seeing much power saving from having EEE enabled between the SoC's Ethernet MAC and CPU port of the switch, that said, however, I wonder if this has an impact on any form of flow control within the switch that is reacting to LPI and you need EEE to be enabled end-to-end?

I've tested pinging between my computers with EEE enabled interfaces. The
behaviour is identical.

> 
>>
>> I've tested pinging from the SoC's CPU. Packet capturing on the twisted
>> pair computer showed very few frames were being received.
>>
>> # ping 192.168.2.2
>> PING 192.168.2.2 (192.168.2.2): 56 data bytes
>> 64 bytes from 192.168.2.2: seq=36 ttl=64 time=0.486 ms
>> ^C
>> --- 192.168.2.2 ping statistics ---
>> 64 packets transmitted, 1 packets received, 98% packet loss
>> round-trip min/avg/max = 0.486/0.486/0.486 ms
>>
>> It seems there's less loss when frames are passed more frequently.
> 
> That would point to an issue getting in and out of LPI, do you see these packet losses even with different LPI timeouts?

The NICs on my computers don't seem to allow changing the tx-lpi and
tx-timer options.

Computer 1 (Intel I219-V, driver: e1000e):

$ sudo ethtool --set-eee eno1 tx-timer 15
netlink error: Invalid argument

$ sudo ethtool --show-eee eno1
EEE settings for eno1:
	EEE status: enabled - active
	Tx LPI: 17 (us)
	Supported EEE link modes:  100baseT/Full
	                           1000baseT/Full
	Advertised EEE link modes:  100baseT/Full
	                            1000baseT/Full
	Link partner advertised EEE link modes:  100baseT/Full
	                                         1000baseT/Full

Computer 2 (Realtek RTL8111H, driver: r8169):

$ sudo ethtool --set-eee eno1 tx-lpi on

$ sudo ethtool --show-eee eno1
EEE settings for eno1:
	EEE status: enabled - active
	Tx LPI: disabled
	Supported EEE link modes:  100baseT/Full
	                           1000baseT/Full
	Advertised EEE link modes:  100baseT/Full
	                            1000baseT/Full
	Link partner advertised EEE link modes:  100baseT/Full
	                                         1000baseT/Full

I've tested with switch ports interfaces' tx-timer from 0 to 40, same
tx-timer for both interfaces. Loss is still there.

I suppose the MT7531 switch PHYs need calibration for EEE that is currently
missing from the mediatek-ge driver.

Arınç

