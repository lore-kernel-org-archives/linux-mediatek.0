Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D27C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEHe6A9CebQVDQApvzE21dG1GXCQNVlzDvOQzFuLOnw=; b=O/k344cGAjs8Nspm9v4t1iVe+l
	YyJrD0H8H1lQc0rUCgi6mSHG1RjBlCziyBGn32NSO8iRh3K9RqiwqcmI6PvJSue/TJWg62owDxsaX
	oCSgyr05g2tXEaHnRDCzrcVpWzhvDZUe7iTsHP6NZmwf8Y/7+aGoAd2DU/SUyjKNifk+nScZEyCYL
	n7xxkKgQdrI+gd8IVnbfo0L4szU6KNtm+oI9A/CkY8uXR+w0DWS0tvu1cFQbPhlzDHpkgThmo0nhT
	bnlDSbkU329g1Js9WwlOh4ecizBe86MewaWGbXFPCp5cngSPmMAUx172NO3qfN2Nv9eloDWVnl21J
	c3rhyzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdE6-00GmDO-VI; Thu, 02 Feb 2023 17:18:22 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdDw-00GmAR-4h; Thu, 02 Feb 2023 17:18:13 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 5FBE31883A58;
	Thu,  2 Feb 2023 17:18:10 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 463FE250007B;
	Thu,  2 Feb 2023 17:18:10 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 3ECC991201E4; Thu,  2 Feb 2023 17:18:10 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 02 Feb 2023 18:18:10 +0100
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@idosch.org>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 "maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Cl=C3=A9m?=
 =?UTF-8?Q?ent_L=C3=A9ger?= <clement.leger@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 0/5] ATU and FDB synchronization on locked ports
In-Reply-To: <Y9lrIWMnWLqGreZL@shredder>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <Y9lrIWMnWLqGreZL@shredder>
User-Agent: Gigahost Webmail
Message-ID: <1fe06ed3010fe318728ebd73eee7f092@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_091812_358386_9C0F40BD 
X-CRM114-Status: GOOD (  17.99  )
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

On 2023-01-31 20:25, Ido Schimmel wrote:
>> command like:
>> 
>> bridge fdb replace ADDR dev <DEV> master dynamic
>> 
>> We choose only to support this feature on locked ports, as it involves
>> utilizing the CPU to handle ATU related switchcore events (typically
>> interrupts) and thus can result in significant performance loss if
>> exposed to heavy traffic.
> 
> Not sure I understand this reasoning. I was under the impression that
> hostapd is installing dynamic entries instead of static ones since the
> latter are not flushed when carrier is lost. Therefore, with static
> entries it is possible to unplug a host (potentially plugging a
> different one) and not lose authentication.
> 

Both auth schemes 802.1X and MAB install dynamic entries as you point 
out, and both use locked ports.
In the case of non locked ports, they just learn normally and age and 
refresh their entries, so the use case of a userspace added dynamic FDB 
entry is hard for me to see. And having userspace being notified of an 
ordinary event that a FDB entry has been aged out could maybe be used, 
but for the reasons mentioned it is not supported here.

>> 
>> On locked ports it is important for userspace to know when an 
>> authorized
>> station has become silent, hence not breaking the communication of a
>> station that has been authorized based on the MAC-Authentication 
>> Bypass
>> (MAB) scheme. Thus if the station keeps being active after 
>> authorization,
>> it will continue to have an open port as long as it is active. Only 
>> after
>> a silent period will it have to be reauthorized. As the ageing process 
>> in
>> the ATU is dependent on incoming traffic to the switchcore port, it is
>> necessary for the ATU to signal that an entry has aged out, so that 
>> the
>> FDB can be updated at the correct time.
> 
> Why mention MAB at all? Don't you want user space to always use dynamic
> entries to authenticate hosts regardless of 802.1X/MAB?

Yes, you are right about that. I guess it came about as this was 
developed much in the same time and with the code of MAB.

