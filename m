Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB46C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 13:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HCCNiT/jJbbxbP9+1MT9x+xHUrLTTPASjBMmhCUfnQ=; b=p1c+2obtSF+3HS
	5ImZFwTlEleeQfagJLMbboJlHimopFGvqoAQrwocuonYsYC58ojZoPTwSz0tgu0LISer1mbtVLo4K
	XRo1wcod3Q7bLPw1nhMc0ByxqzcM1QkHkP93Qd18kToMLL80K1yDXnuwvV8E5K79vSNEPa2wHz0nU
	T4mJUaJEFGHbiXO82vj74WudkFVc/Op5LRgQg6XKCUuA9Kc+0EyOH2gkhFhBpNpcIqYXllSC9s9Ee
	9/oOkEhSU7tPUGjtHzf0+e1GA8qO+5EGwusHrPJ0CrgaB6Y/E+ZiO7bm9+RS2UU4tO3wB7aoeUk+n
	MsJcBnqObE9Lj1Yz62Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndtfS-0095HX-1G; Mon, 11 Apr 2022 13:01:18 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtfE-0095Bt-El; Mon, 11 Apr 2022 13:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=FZ1SJt0bIUnbaLywzWZdreS+P2JGanz13+UniX5OIOE=; b=N3yw4Kr9TJ3sZ4aBqz1MVCimD8
 jh1YJu/ectAs75UyqK/7fKTHWsI8U3OIwIIE88XuUzKcnTxma6QDyn/EzXV0hUrsAYU512gHw8MI5
 nYlxocp5Tc4jr6aCUC3kBxG7iUgGtnB8HD72TCdiSxjONCcngtK5Nf2Z96fgRH0RfexI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ndtex-00FGAY-4p; Mon, 11 Apr 2022 15:00:47 +0200
Date: Mon, 11 Apr 2022 15:00:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/14] net: ethernet: mtk_eth_soc: support creating
 mac address based offload entries
Message-ID: <YlQmf7qGAnq/3nW0@lunn.ch>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-15-nbd@nbd.name> <Yk8pJRxnVCfdk8xi@lunn.ch>
 <f25a6278-1baf-cc27-702a-5d93eedda438@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f25a6278-1baf-cc27-702a-5d93eedda438@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_060104_593688_ABF21D74 
X-CRM114-Status: GOOD (  40.68  )
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

On Thu, Apr 07, 2022 at 08:21:43PM +0200, Felix Fietkau wrote:
> 
> On 07.04.22 20:10, Andrew Lunn wrote:
> > On Tue, Apr 05, 2022 at 09:57:55PM +0200, Felix Fietkau wrote:
> > > This will be used to implement a limited form of bridge offloading.
> > > Since the hardware does not support flow table entries with just source
> > > and destination MAC address, the driver has to emulate it.
> > > 
> > > The hardware automatically creates entries entries for incoming flows, even
> > > when they are bridged instead of routed, and reports when packets for these
> > > flows have reached the minimum PPS rate for offloading.
> > > 
> > > After this happens, we look up the L2 flow offload entry based on the MAC
> > > header and fill in the output routing information in the flow table.
> > > The dynamically created per-flow entries are automatically removed when
> > > either the hardware flowtable entry expires, is replaced, or if the offload
> > > rule they belong to is removed
> > 
> > > +
> > > +	if (found)
> > > +		goto out;
> > > +
> > > +	eh = eth_hdr(skb);
> > > +	ether_addr_copy(key.dest_mac, eh->h_dest);
> > > +	ether_addr_copy(key.src_mac, eh->h_source);
> > > +	tag = skb->data - 2;
> > > +	key.vlan = 0;
> > > +	switch (skb->protocol) {
> > > +#if IS_ENABLED(CONFIG_NET_DSA)
> > > +	case htons(ETH_P_XDSA):
> > > +		if (!netdev_uses_dsa(skb->dev) ||
> > > +		    skb->dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
> > > +			goto out;
> > > +
> > > +		tag += 4;
> > > +		if (get_unaligned_be16(tag) != ETH_P_8021Q)
> > > +			break;
> > > +
> > > +		fallthrough;
> > > +#endif
> > > +	case htons(ETH_P_8021Q):
> > > +		key.vlan = get_unaligned_be16(tag + 2) & VLAN_VID_MASK;
> > > +		break;
> > > +	default:
> > > +		break;
> > > +	}
> > 
> > I'm trying to understand the architecture here.
> > 
> > We have an Ethernet interface and a Wireless interface. The slow path
> > is that frames ingress from one of these interfaces, Linux decides
> > what to do with them, either L2 or L3, and they then egress probably
> > out the other interface.
> > 
> > The hardware will look at the frames and try to spot flows? It will
> > then report any it finds. You can then add an offload, telling it for
> > a flow it needs to perform L2 or L3 processing, and egress out a
> > specific port? Linux then no longer sees the frame, the hardware
> > handles it, until the flow times out?
> Yes, the hw handles it until either the flow times out, or the corresponding
> offload entry is removed.
> 
> For OpenWrt I also wrote a daemon that uses tc classifier BPF to accelerate
> the software bridge and create hardware offload entries as well via hardware
> TC flower rules: https://github.com/nbd168/bridger
> It works in combination with these changes.

What about the bridge? In Linux, it is the software bridge which
controls all this at L2, and it should be offloading the flows, via
switchdev. The egress port you derive here is from the software bridge
FDB?

> > So i'm wondering what is going on here. So is this a frame which has
> > ingressed, either from the WiFi, or another switch port, gone to the
> > software bridge, bridges to a DSA slave interface, the DSA tagger has
> > added a tag and now it is in the master interface? Can you accelerate
> > such frames? What is adding the DSA tag on the fast path? And in the
> > opposite direction, frames which egress the switch which have a DSA
> > tag and are heading to the WiFi, what is removing the tag? Does the
> > accelerator also understand the tag and know what to do with it?WiFi ->
> > Ethernet is not supported by MT7622, but will be added for newer

> SoCs like MT7986. The PPE supports both parsing and inserting MT7530
> compatible DSA tags. For Ethernet->WiFi flows, the PPE will also add
> required metadata that is parsed by the MT7915 WiFi Firmware in order to
> figure out what vif/station the packets were meant for.

O.K. What about IGMP and multicast? Does the accelerate match on IGMP
and forwards it to the CPU, rather than follow the flow rules? Can you
set multiple egress destinations for multicast so that it can go both
to the switch and the host, when the host has a local interest in the
traffic?

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
