Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF77C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hug2v4Ka3R4MCIfyKGeLem4atH/atOqt/PHOxo3O0Sg=; b=wPIx9tA/q6ceuU
	KC9EBmRG4DElWabECQENu8qd2LtcGIyN8/KYmH0J31q4DzNZPi09b9ozXZer6z8/FbpBWoQY7eKOh
	kXjF7PZW5qm3YNAdTWSpmH3M8J1F8z1yNYjc4Diphaj/eXNaJIs90l4lRLtG37Gz2i3ety49OAIAh
	+8q3qZ04h7kFah9Wd1iHrLndnx2QxySmYPFqCbQms1KzjsAYigdKYKxkvErUGfkqzaor3XUZkDjEg
	mjrQWE8aDgZOKhy6Z4zDLGfjljjaRQX0OUBYXZU/UMVVLKGTFCNrqU+srWuwclFRIurbbe9kFWecg
	Zq4u1xBwb1a99OF6ne8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neKbG-00FM3o-JU; Tue, 12 Apr 2022 17:46:46 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neKSG-00FHtg-UQ; Tue, 12 Apr 2022 17:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=siXsIFTv0iJUejxwOAzvUbsb/T5/As2BWNYw6PcaWME=; b=44OSwrVN1YpoBcUi3H++pRcShG
 mBftYT66PiYNaHZNAVNQfvB4d7oktMmkkxBpA9MMSMmPbQz09LmJSOQyR8KCRV/uTD3kK5i+3XBph
 Io2iVxxj7eGki2FSrRyMs4cciwahAmW8//0K/PwcZdUbek+rZ1YLwT6xflkwxDn3wU2I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1neKS4-00FUdg-Kl; Tue, 12 Apr 2022 19:37:16 +0200
Date: Tue, 12 Apr 2022 19:37:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Pirko <jiri@nvidia.com>, Ido Schimmel <idosch@nvidia.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 14/14] net: ethernet: mtk_eth_soc: support creating
 mac address based offload entries
Message-ID: <YlW4zF1s3SRTl2ue@lunn.ch>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-15-nbd@nbd.name> <Yk8pJRxnVCfdk8xi@lunn.ch>
 <f25a6278-1baf-cc27-702a-5d93eedda438@nbd.name>
 <YlQmf7qGAnq/3nW0@lunn.ch>
 <ece29b0d-bbbe-7c03-a6b4-60e44453ca31@nbd.name>
 <YlV5jEzNZT1aKmNL@lunn.ch>
 <ee1d6c89-95f4-bf28-cf25-36b18ffb342f@nbd.name>
 <YlWK5Dozpo7nIS9j@lunn.ch>
 <29cecc87-8689-6a73-a5ef-43eb2b8f33cd@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29cecc87-8689-6a73-a5ef-43eb2b8f33cd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_103729_047987_56371CC8 
X-CRM114-Status: GOOD (  35.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> It basically has to keep track of all possible destination ports, their STP
> state, all their fdb entries, member VLANs of all ports. It has to quickly
> react to changes in any of these.

switchdev gives you all of those i think. DSA does not make use of
them all, in particularly the fdb entries, because of the low
bandwidth management link to the switch. But look at the Mellanox
switch, it keeps its hardware fdb entries in sync with the software
fdb.

And you get every quick access to these, sometimes too quick in that
it is holding a spinlock when it calls the switchdev functions, and
you need to defer the handling in your driver if you want to use a
mutex, perform blocking IO etc.

> In order to implement this properly, I would also need to make more changes
> to mac80211. Right now, mac80211 drivers do not have access to the
> net_device pointer of virtual interfaces. So mac80211 itself would likely
> need to implement the switchdev ops and handle some of this.

So this again sounds like something which would be shared by IPA, and
any other hardware which can accelerate forwarding between WiFi and
some other sort of interface.

> There are also some other issues where I don't know how this is supposed to
> be solved properly:
> On MT7622 most of the bridge ports are connected to a MT7531 switch using
> DSA. Offloading (lan->wlan bridging or L3/L4 NAT/routing) is not handled by
> the switch itself, it is handled by a packet processing engine in the SoC,
> which knows how to handle the DSA tags of the MT7531 switch.
> 
> So if I were to handle this through switchdev implemented on the wlan and
> ethernet devices, it would technically not be part of the same switch, since
> it's a behind a different component with a different driver.

What is important here is the user experience. The user is not
expected to know there is an accelerate being used. You setup the
bridge just as normal, using iproute2. You add routes in the normal
way, either by iproute2, or frr can add routes from OSPF, BGP, RIP or
whatever, via zebra. I'm not sure anybody has yet accelerated NAT, but
the same principle should be used, using iptables in the normal way,
and the accelerate is then informed and should accelerate it if
possible.

switchdev gives you notification of when anything changes. You can
have multiple receivers of these notifications, so the packet
processor can act on them as well as the DSA switch.
 
> Also, is switchdev able to handle the situation where only parts of the
> traffic is offloaded and the rest (e.g. multicast) is handled through the
> regular software path?

Yes, that is not a problem. I deliberately use the term
accelerator. We accelerate what Linux can already do. If the
accelerator hardware is not capable of something, Linux still is, so
just pass it the frames and it will do the right thing. Multicast is a
good example of this, many of the DSA switch drivers don't accelerate
it.

> In my opinion, handling it through the TC offload has a number of
> advantages:
> - It's a lot simpler
> - It uses the same kind of offloading rules that my software fastpath
> already uses
> - It allows more fine grained control over which traffic should be offloaded
> (src mac -> destination MAC tuple)
> 
> I also plan on extending my software fast path code to support emulating
> bridging of WiFi client mode interfaces. This involves doing some MAC
> address translation with some IP address tracking. I want that to support
> hardware offload as well.
> 
> I really don't think that desire for supporting switchdev based offload
> should be a blocker for accepting this code now, especially since my
> implementation relies on existing Linux network APIs without inventing any
> new ones, and there are valid use cases for using it, even with switchdev
> support in place.

What we need to avoid is fragmentation of the way we do things. It has
been decided that switchdev is how we use accelerators, and the user
should not really know anything about the accelerator. No other in
kernel network accelerator needs a user space component listening to
netlink notifications and programming the accelerator from user space.
Do we really want two ways to do this?

   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
