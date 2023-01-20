Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152BBC25B50
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 21:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qe79gp9v6F9f07AMBV5HihIHF6Yv06nn7LnQj2QYctU=; b=Y+/miGv9tH75E/Cn7YzsUZU29K
	P6qHGr1kWLse/uRwJPpywd5zwj87Z/HmGGQ0IRhiC5NAHD3MFOV+GFDyKttzD5WTvBDjE2g2bvLeE
	wl/HvJ1ncNDn5FMJZKvYPl14ttgRbStS+QhzTkPmPIBkAVHrwhv3c2yc0sy8rAM3eVNZRWHa41rcl
	MA4TKz5lh9vJSMvlfLGnRrZm/ERLGd5Ou8MCzXU41u8QSpRmgd3jJABVGgTG7TuT90MRP2m3tKmca
	y8IJDM+A47JASjT2M9ZoStqolFySjPJwBIeGHfbx6/th8GvZS0c5Zqn6wwWp7shaizzBfGo1UuyEs
	G++V9N2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIykT-00COEz-Hj; Fri, 20 Jan 2023 21:16:33 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIykF-00COAB-Pc; Fri, 20 Jan 2023 21:16:21 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 4A5AF1883A74;
	Fri, 20 Jan 2023 21:16:03 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 412112500327;
	Fri, 20 Jan 2023 21:16:03 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 2D75D91201E4; Fri, 20 Jan 2023 21:16:03 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Fri, 20 Jan 2023 22:16:03 +0100
From: netdev@kapio-technology.com
To: Vladimir Oltean <olteanv@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach
 <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung Huh
 <woojung.huh@microchip.com>, "maintainer:MICROCHIP KSZ SERIES ETHERNET
 SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Russell King <linux@armlinux.org.uk>, Christian
 Marangi <ansuelsmth@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [RFC PATCH net-next 1/5] net: bridge: add dynamic flag to
 switchdev notifier
In-Reply-To: <20230119134045.fqdt6zrna5x3iavt@skbuf>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
 <20230117185714.3058453-2-netdev@kapio-technology.com>
 <20230117230806.ipwcbnq4jcc4qs7z@skbuf>
 <a3bba3eb856a00b5e5e0c1e2ffe8749a@kapio-technology.com>
 <20230119093358.gbyka2x4qbxxr43b@skbuf>
 <20230119134045.fqdt6zrna5x3iavt@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <29501147c96e7e2f06c999410d42e2bf@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_131620_023021_009CF192 
X-CRM114-Status: GOOD (  19.72  )
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

On 2023-01-19 14:40, Vladimir Oltean wrote:
> On Thu, Jan 19, 2023 at 11:33:58AM +0200, Vladimir Oltean wrote:
>> On Wed, Jan 18, 2023 at 11:14:00PM +0100, netdev@kapio-technology.com 
>> wrote:
>> > > > +	item->is_dyn = !test_bit(BR_FDB_STATIC, &fdb->flags);
>> > >
>> > > Why reverse logic? Why not just name this "is_static" and leave any
>> > > further interpretations up to the consumer?
>> >
>> > My reasoning for this is that the common case is to have static entries,
>> > thus is_dyn=false, so whenever someone uses a switchdev_notifier_fdb_info
>> > struct the common case does not need to be entered.
>> > Otherwise it might also break something when someone uses this struct and if
>> > it was 'is_static' and they forget to code is_static=true they will get
>> > dynamic entries without wanting it and it can be hard to find such an error.
>> 
>> I'll leave it up to bridge maintainers if this is preferable to 
>> patching
>> all callers of SWITCHDEV_FDB_ADD_TO_BRIDGE such that they set 
>> is_static=true.
> 
> Actually, why would you assume that all users of 
> SWITCHDEV_FDB_ADD_TO_BRIDGE
> want to add static FDB entries? You can't avoid inspecting the code and
> making sure that the is_dyn/is_static flag is set correctly either way.

Well, up until this patch set there is no option, besides entries from 
SWITCHDEV_FDB_ADD_TO_BRIDGE events will get the external learned flag 
set, so they will not be aged by the bridge, and so dynamic entries that 
way don't make much sense I think. Is that not right?

