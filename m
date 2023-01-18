Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA47C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 22:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTQgcL8EA+KJ6qskhiBYZhFxfQIcNHSpD8+7n6ObB1s=; b=HdXqWCcfz2iLdp4vtnuRnoRRoh
	lCJQzySreOnePmSe7Cmk9ifFFESpbfrcr6fa0go2lt3JU5iXc2llVfhLpsJjPXRw4ygCG15RNDPEw
	kZZLC1i1p2BneWT9YvZHFjFAs2Z+CCgZK4BjVch/dPRVtXoHBvqwxp5pRng3HFv2Sn4JnY7ugltG1
	3ja0DoMVVDTUoocqg3LpWgWeo+oebfJQKFtt08UaQd/8hcxUCgTG8H0l398ZugUXjOcRKunurMwfX
	hR+AMqmZNIYALy+WNMhZ7UBVW75NtQ6QFuvB6PdK1M6dp5WjWaLfT7C6c/uiT+cWXosHbkmKfX4tL
	mk0VHRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGjI-002q32-Hp; Wed, 18 Jan 2023 22:16:24 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGj8-002puq-3u; Wed, 18 Jan 2023 22:16:15 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id CB2F818837A5;
	Wed, 18 Jan 2023 22:14:00 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id BAF2B25003AB;
	Wed, 18 Jan 2023 22:14:00 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id A73C791201E4; Wed, 18 Jan 2023 22:14:00 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Wed, 18 Jan 2023 23:14:00 +0100
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
In-Reply-To: <20230117230806.ipwcbnq4jcc4qs7z@skbuf>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
 <20230117185714.3058453-2-netdev@kapio-technology.com>
 <20230117230806.ipwcbnq4jcc4qs7z@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <a3bba3eb856a00b5e5e0c1e2ffe8749a@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_141614_348608_061C6607 
X-CRM114-Status: GOOD (  16.87  )
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

On 2023-01-18 00:08, Vladimir Oltean wrote:
> On Tue, Jan 17, 2023 at 07:57:10PM +0100, Hans J. Schultz wrote:
>> To be able to add dynamic FDB entries to drivers from userspace, the
>> dynamic flag must be added when sending RTM_NEWNEIGH events down.
>> 
>> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
>> ---
>>  include/net/switchdev.h   | 1 +
>>  net/bridge/br_switchdev.c | 1 +
>>  2 files changed, 2 insertions(+)
>> 
>> diff --git a/include/net/switchdev.h b/include/net/switchdev.h
>> index ca0312b78294..aaf918d4ba67 100644
>> --- a/include/net/switchdev.h
>> +++ b/include/net/switchdev.h
>> @@ -249,6 +249,7 @@ struct switchdev_notifier_fdb_info {
>>  	u8 added_by_user:1,
>>  	   is_local:1,
>>  	   locked:1,
>> +	   is_dyn:1,
>>  	   offloaded:1;
>>  };
>> 
>> diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
>> index 7eb6fd5bb917..60c05a00a1df 100644
>> --- a/net/bridge/br_switchdev.c
>> +++ b/net/bridge/br_switchdev.c
>> @@ -136,6 +136,7 @@ static void br_switchdev_fdb_populate(struct 
>> net_bridge *br,
>>  	item->added_by_user = test_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
>>  	item->offloaded = test_bit(BR_FDB_OFFLOADED, &fdb->flags);
>>  	item->is_local = test_bit(BR_FDB_LOCAL, &fdb->flags);
>> +	item->is_dyn = !test_bit(BR_FDB_STATIC, &fdb->flags);
> 
> Why reverse logic? Why not just name this "is_static" and leave any
> further interpretations up to the consumer?
> 

My reasoning for this is that the common case is to have static entries, 
thus is_dyn=false, so whenever someone uses a 
switchdev_notifier_fdb_info struct the common case does not need to be 
entered.
Otherwise it might also break something when someone uses this struct 
and if it was 'is_static' and they forget to code is_static=true they 
will get dynamic entries without wanting it and it can be hard to find 
such an error.

>>  	item->locked = false;
>>  	item->info.dev = (!p || item->is_local) ? br->dev : p->dev;
>>  	item->info.ctx = ctx;
>> --
>> 2.34.1
>> 

