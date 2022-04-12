Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FF7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzOBkj8Y4GJtdBCCWtbqB457tPkVEDiWhsIPPWFa68A=; b=QmYrmKBCaxe8U5
	v9V1mG4cVmXj9KAhu/XhkcvkwFeOWP9U3HgHyRf6uGMO6xCIwV3aseLtMglXyD3Za3+tnrk1kQmBI
	8tKGhz3FoOf5bYYFV/iZQcOse+4h5M18Vrt4DlguIvOaZXBvoqVXZbuUZAbaEhoSd5+isC+e2Vnqx
	n4UoroQfI3EZ6PLsWGvwmxoTBGH2aj5nm9G/1N01kf/SccFE6XkDvxjGsFSnEpFgaFoKj+nJEMB1E
	xbQGjc1i3oNAmZmToCBAjoRgkA6W5sBK3SR3gBUUllSHZhyDfxeBwES5vrmdCyOleFGOwG8oW0Hwk
	yEBmhqQCaDEvtzI4BR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGuS-00EhYz-KZ; Tue, 12 Apr 2022 13:50:20 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neGuF-00EhXb-BR; Tue, 12 Apr 2022 13:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=DqKc8iJWKXFesV4tUBomdbYhQAx3J3hZZcgttBI4x2Y=; b=lUcIljzLQVkGDAXHQvO3ekCQ9M
 JW4E1mqnOh350Gj+Eo1iyNXxUT+ph4jRyeLYG3/8bpC3qR5mSIBj1whJKWuTaAsjmIKKYhUDNBrnj
 06RlAEIaL8dX8lKiR47oFmu0ZI/9BKYRTXp8vJ4av43r3Y3xyLnM47QGCmqTDWbqLZK8=;
Received: from p57a6f1f9.dip0.t-ipconnect.de ([87.166.241.249] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1neGu0-00074w-2t; Tue, 12 Apr 2022 15:49:52 +0200
Message-ID: <ee1d6c89-95f4-bf28-cf25-36b18ffb342f@nbd.name>
Date: Tue, 12 Apr 2022 15:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jiri Pirko <jiri@nvidia.com>,
 Ido Schimmel <idosch@nvidia.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-15-nbd@nbd.name> <Yk8pJRxnVCfdk8xi@lunn.ch>
 <f25a6278-1baf-cc27-702a-5d93eedda438@nbd.name> <YlQmf7qGAnq/3nW0@lunn.ch>
 <ece29b0d-bbbe-7c03-a6b4-60e44453ca31@nbd.name> <YlV5jEzNZT1aKmNL@lunn.ch>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2 14/14] net: ethernet: mtk_eth_soc: support creating mac
 address based offload entries
In-Reply-To: <YlV5jEzNZT1aKmNL@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_065007_687255_A4657C5E 
X-CRM114-Status: GOOD (  37.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 12.04.22 15:07, Andrew Lunn wrote:
>> > > > > I'm trying to understand the architecture here.
>> > > > > We have an Ethernet interface and a Wireless interface. The slow
>> > > path
>> > > > is that frames ingress from one of these interfaces, Linux decides
>> > > > what to do with them, either L2 or L3, and they then egress probably
>> > > > out the other interface.
>> > > > > The hardware will look at the frames and try to spot flows? It
>> > > will
>> > > > then report any it finds. You can then add an offload, telling it for
>> > > > a flow it needs to perform L2 or L3 processing, and egress out a
>> > > > specific port? Linux then no longer sees the frame, the hardware
>> > > > handles it, until the flow times out?
>> > > Yes, the hw handles it until either the flow times out, or the corresponding
>> > > offload entry is removed.
>> > > 
>> > > For OpenWrt I also wrote a daemon that uses tc classifier BPF to accelerate
>> > > the software bridge and create hardware offload entries as well via hardware
>> > > TC flower rules: https://github.com/nbd168/bridger
>> > > It works in combination with these changes.
>> > 
>> > What about the bridge? In Linux, it is the software bridge which
>> > controls all this at L2, and it should be offloading the flows, via
>> > switchdev. The egress port you derive here is from the software bridge
>> > FDB?
> 
>> My code uses netlink to fetch and monitor the bridge configuration,
>> including fdb, port state, vlans, etc. and it uses that for the offload path
>> - no extra configuration needed.
> 
> So this is where we get into architecture issues. Do we really want
> Linux to have two ways for setting up L2 networking? It was decided
> that users should not need to know about how to use an accelerator,
> they should not use additional tools, it should just look like
> linux. The user should just add the WiFi netdev to the bridge and
> switchdev will do the rest to offload L2 switching to the hardware.
> 
> You appear to be saying you need a daemon in userspace. That is not
> how every other accelerate works in Linux networking.
> 
> We the Linux network community need to decided if we want this?
The problem here is that it can't be fully transparent. Enabling 
hardware offload for LAN -> WiFi comes at a cost of bypassing airtime 
fairness and mac80211's bufferbloat mitigation.
Some people want this anyway (often but not always for 
benchmark/marketing purposes), but it's not something that I would want 
to have enabled by default simply by a wifi netdev to a bridge.

Initially, I wanted to put more of the state tracking code in the 
kernel. I made the first implementation of my acceleration code as a 
patch to the network bridge - speeding up bridge unicast forwarding 
significantly for any device regardless of hardware support. I wanted to 
build on that to avoid putting a lot of FDB/VLAN related tracking 
directly into the driver.

That approach was immediately rejected and I was told to use BPF instead.

That said, I really don't think it's a good idea to put all the code for 
tracking the bridge state, and all possible forwarding destinations into 
the driver directly.

I believe the combination of doing the bridge state tracking in user 
space + using the standard TC API for programming offloading rules into 
the hardware is a reasonable compromise.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
