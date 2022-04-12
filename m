Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAJox90CtBktY1y1lA4P+vXcPSEFtbLP+6OuZverJTI=; b=ycRYjAfXJ4CCYA
	KqqMg/akoBR4MscZg+4dV9hCLPioQHKEejPrU5bnnKdEtckijYDr58UzOSCHRt7GyH/1CZ3EDAj2y
	trj6mJBOiS7qH8+bdICctGURF84rRRWSUFD/ssYa5JBzQcdjhkoAlvzuqy0TCRxtqHFChVZFLy6hG
	mSdlogOF2TiCuaE+xhIY5eRNpcvhzbSTm/GOSomW20KnOolcHwZoESSxj7m9bu5eE1pYBEKbK6w22
	n9HmsraDTauqx9B4wJBIcnb4OrQywojtRSVEbEZpFAUpkWuDdQF4OuhH0J+8RFAytgP94AHStxwlT
	I6LU5geKE2i5x9SoPXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neKgn-00FOCF-N9; Tue, 12 Apr 2022 17:52:29 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neKgT-00FO3q-OZ; Tue, 12 Apr 2022 17:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=jmqFnXO2ZqZwvHpgNAB6QeZncj7ETg2mnMiU2ejcaaE=; b=kFJmPNgcrTrkb88HIJO/HCKje7
 2eFdAtCq7U3T1febm9lJDI4aTtGD+sTL26jKqiTHXT+2O1kmvaGyAYr25staFA96BQImT3N5aEqpW
 Pr9lK7/XWH2DSeTm23KdBoN14/1TBE+drx6zgZkTSOe3Exh7Mz/gzG9+HaPa96DEZk8Y=;
Received: from p57a6f1f9.dip0.t-ipconnect.de ([87.166.241.249] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1neKgD-0008Kt-FP; Tue, 12 Apr 2022 19:51:53 +0200
Message-ID: <2989e566-a1d2-2288-8ef3-759f20aa0c2e@nbd.name>
Date: Tue, 12 Apr 2022 19:51:52 +0200
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
 <ee1d6c89-95f4-bf28-cf25-36b18ffb342f@nbd.name> <YlWK5Dozpo7nIS9j@lunn.ch>
 <29cecc87-8689-6a73-a5ef-43eb2b8f33cd@nbd.name> <YlW4zF1s3SRTl2ue@lunn.ch>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2 14/14] net: ethernet: mtk_eth_soc: support creating mac
 address based offload entries
In-Reply-To: <YlW4zF1s3SRTl2ue@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_105210_124635_B6B5E964 
X-CRM114-Status: GOOD (  47.56  )
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


On 12.04.22 19:37, Andrew Lunn wrote:
>> It basically has to keep track of all possible destination ports, their STP
>> state, all their fdb entries, member VLANs of all ports. It has to quickly
>> react to changes in any of these.
> 
> switchdev gives you all of those i think. DSA does not make use of
> them all, in particularly the fdb entries, because of the low
> bandwidth management link to the switch. But look at the Mellanox
> switch, it keeps its hardware fdb entries in sync with the software
> fdb.
> 
> And you get every quick access to these, sometimes too quick in that
> it is holding a spinlock when it calls the switchdev functions, and
> you need to defer the handling in your driver if you want to use a
> mutex, perform blocking IO etc.
> 
>> In order to implement this properly, I would also need to make more changes
>> to mac80211. Right now, mac80211 drivers do not have access to the
>> net_device pointer of virtual interfaces. So mac80211 itself would likely
>> need to implement the switchdev ops and handle some of this.
> 
> So this again sounds like something which would be shared by IPA, and
> any other hardware which can accelerate forwarding between WiFi and
> some other sort of interface.
I would really like to see an example of how this should be done.
Is there a work in progress tree for IPA with offloading? Because the 
code that I see upstream doesn't seem to have any of that - or did I 
look in the wrong place?

>> There are also some other issues where I don't know how this is supposed to
>> be solved properly:
>> On MT7622 most of the bridge ports are connected to a MT7531 switch using
>> DSA. Offloading (lan->wlan bridging or L3/L4 NAT/routing) is not handled by
>> the switch itself, it is handled by a packet processing engine in the SoC,
>> which knows how to handle the DSA tags of the MT7531 switch.
>> 
>> So if I were to handle this through switchdev implemented on the wlan and
>> ethernet devices, it would technically not be part of the same switch, since
>> it's a behind a different component with a different driver.
> 
> What is important here is the user experience. The user is not
> expected to know there is an accelerate being used. You setup the
> bridge just as normal, using iproute2. You add routes in the normal
> way, either by iproute2, or frr can add routes from OSPF, BGP, RIP or
> whatever, via zebra. I'm not sure anybody has yet accelerated NAT, but
> the same principle should be used, using iptables in the normal way,
> and the accelerate is then informed and should accelerate it if
> possible.
Accelerated NAT on MT7622 is already present in the upstream code for a 
while. It's there for ethernet, and with my patches it also works for 
ethernet -> wlan.

> switchdev gives you notification of when anything changes. You can
> have multiple receivers of these notifications, so the packet
> processor can act on them as well as the DSA switch.
>   
>> Also, is switchdev able to handle the situation where only parts of the
>> traffic is offloaded and the rest (e.g. multicast) is handled through the
>> regular software path?
> 
> Yes, that is not a problem. I deliberately use the term
> accelerator. We accelerate what Linux can already do. If the
> accelerator hardware is not capable of something, Linux still is, so
> just pass it the frames and it will do the right thing. Multicast is a
> good example of this, many of the DSA switch drivers don't accelerate
> it.
Don't get me wrong, I'm not against switchdev support at all. I just 
don't know how to do it yet, and the code that I put in place is useful 
for non-switchdev use cases as well.

>> In my opinion, handling it through the TC offload has a number of
>> advantages:
>> - It's a lot simpler
>> - It uses the same kind of offloading rules that my software fastpath
>> already uses
>> - It allows more fine grained control over which traffic should be offloaded
>> (src mac -> destination MAC tuple)
>> 
>> I also plan on extending my software fast path code to support emulating
>> bridging of WiFi client mode interfaces. This involves doing some MAC
>> address translation with some IP address tracking. I want that to support
>> hardware offload as well.
>> 
>> I really don't think that desire for supporting switchdev based offload
>> should be a blocker for accepting this code now, especially since my
>> implementation relies on existing Linux network APIs without inventing any
>> new ones, and there are valid use cases for using it, even with switchdev
>> support in place.
> 
> What we need to avoid is fragmentation of the way we do things. It has
> been decided that switchdev is how we use accelerators, and the user
> should not really know anything about the accelerator. No other in
> kernel network accelerator needs a user space component listening to
> netlink notifications and programming the accelerator from user space.
> Do we really want two ways to do this?
There's always some overlap in what the APIs can do. And when it comes 
to the "client mode bridge" use case that I mentioned, I would also need 
exactly the same API that I put in place here. And this is not something 
that can (or even should) be done using switchdev. mac80211 prevents 
adding client mode interfaces to bridges for a reason.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
