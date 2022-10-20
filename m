Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4637C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 19:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAPns4fCejPzUoEn4kQ9gEvSh3iELvJlsJGeTwtB7Is=; b=uDa1MVXGJom1Dz+VHlYhbNvohy
	Fooejo3/gikIae47BMsjy5tlm9hv57IgzwTFiPMIZgXBlrzgLkAfDyOJ52PM9QiphK5+T6pRQlFyH
	H5tY/HWDmB5bf00CHaBUhDn7oHXWXB7hyTgD6fE/yivh5jJ3wLVGaBBpwACMiRvVrEuTsAffWukQr
	dUzPnzQwnLZ8nq9qUSClfuhTIjyEGEZYjjle3mUU5x7wJ3rDaR7PV92mlTGDQyE2Lxc37Eh7trHT8
	ENwgNlCp259ZouRhDv4xTfjTMWLIDmZdLWJ9xyH1Gs9Vw6K5mAifT6+bg9YDF2LdGkf68TGkrahYc
	ybBm2WUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbEF-001MqR-Ly; Thu, 20 Oct 2022 19:29:19 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbE4-001Mo7-Mc; Thu, 20 Oct 2022 19:29:09 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 5A96F18838D4;
	Thu, 20 Oct 2022 19:29:06 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 48C0C25001FA;
	Thu, 20 Oct 2022 19:29:06 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 3A7E29EC0002; Thu, 20 Oct 2022 19:29:06 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 20 Oct 2022 21:29:06 +0200
From: netdev@kapio-technology.com
To: Vladimir Oltean <olteanv@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke
 Mehrtens <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan
 <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Ido Schimmel
 <idosch@nvidia.com>, Florent Fourcot <florent.fourcot@wifirst.fr>, Hans
 Schultz <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>, Amit
 Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 03/12] net: bridge: enable bridge to install
 locked fdb entries from drivers
In-Reply-To: <20221020125549.v6kls2lk7etvay7c@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-4-netdev@kapio-technology.com>
 <20221020125549.v6kls2lk7etvay7c@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <e1184c879642c35e4ff6f19e0fd5de46@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_122908_912655_623B6068 
X-CRM114-Status: GOOD (  11.88  )
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

On 2022-10-20 14:55, Vladimir Oltean wrote:
> On Tue, Oct 18, 2022 at 06:56:10PM +0200, Hans J. Schultz wrote:
>> diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
>> index 8f3d76c751dd..c6b938c01a74 100644
>> --- a/net/bridge/br_switchdev.c
>> +++ b/net/bridge/br_switchdev.c
>> @@ -136,6 +136,7 @@ static void br_switchdev_fdb_populate(struct 
>> net_bridge *br,
>>  	item->added_by_user = test_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
>>  	item->offloaded = test_bit(BR_FDB_OFFLOADED, &fdb->flags);
>>  	item->is_local = test_bit(BR_FDB_LOCAL, &fdb->flags);
>> +	item->locked = test_bit(BR_FDB_LOCKED, &fdb->flags);
> 
> Shouldn't this be set to 0 here, since it is the bridge->driver
> direction?
> 

Wouldn't it be a good idea to allow drivers to add what corresponds to a 
blackhole
entry when using the bridge input chain to activate the MAB feature, or 
in general
to leave the decision of what to do to the driver implementation?

