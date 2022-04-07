Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8DBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQuEUtbKjo7xRFceMkuL784ksvyOewYDuNFim8EunMM=; b=Xazbgng1zHkGAR
	vbXgfRHGIoACtt8jn9czWxQ8G+t54RGC4bW+GnCnpHgVoVU6ydtv9xgcCfulxMRvXatQmuCSRISQK
	F+cbEshPG5PZ0NXGaFzkHGBHhnAdchqGtvnyJe2Q2R9tSjmtiC1uOSFpTVM9HsmWJiAe4KjREGURt
	60wmRZ5sOe2A74sjJKq5zZxUo9wBZNJzD87jsV25R3LRwCkLBVG7LQhghzUUUiKXO2ZfnrHuersNt
	uWvxMiy3skte077r3RI7hIADKlM5qQv3TdpmNVIw2VXLIc0u5/YYnO3dJBYS4lZBP4txCK6uLqWGh
	yYWK2NrYsHm3xrZPotiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncWb7-00DV67-R8; Thu, 07 Apr 2022 18:11:09 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncWav-00DUzn-EG; Thu, 07 Apr 2022 18:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=DOHMWvbr3Z63nSFUQaulSgXC+Xhq8zHgLVzmAiSOJbc=; b=TQ3yv6Is+8a+xn3TBSun88S7hr
 K+KKf0InfVrqJZV4hMGgYIu9AFr/uKOv63e9E77YwbiCQWByyGTLphRK9PCYGiQeFUmtq5Nm7EAN4
 9rS8EiLSWZrUBu1P3INVVUCtjbSYWX029mUbmPGc0b+dHR7Ruv88ZdvFUPZV97lROkx4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ncWaj-00Egnx-GF; Thu, 07 Apr 2022 20:10:45 +0200
Date: Thu, 7 Apr 2022 20:10:45 +0200
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
Message-ID: <Yk8pJRxnVCfdk8xi@lunn.ch>
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-15-nbd@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405195755.10817-15-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_111057_535040_287A1153 
X-CRM114-Status: GOOD (  24.00  )
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

On Tue, Apr 05, 2022 at 09:57:55PM +0200, Felix Fietkau wrote:
> This will be used to implement a limited form of bridge offloading.
> Since the hardware does not support flow table entries with just source
> and destination MAC address, the driver has to emulate it.
> 
> The hardware automatically creates entries entries for incoming flows, even
> when they are bridged instead of routed, and reports when packets for these
> flows have reached the minimum PPS rate for offloading.
> 
> After this happens, we look up the L2 flow offload entry based on the MAC
> header and fill in the output routing information in the flow table.
> The dynamically created per-flow entries are automatically removed when
> either the hardware flowtable entry expires, is replaced, or if the offload
> rule they belong to is removed

> +
> +	if (found)
> +		goto out;
> +
> +	eh = eth_hdr(skb);
> +	ether_addr_copy(key.dest_mac, eh->h_dest);
> +	ether_addr_copy(key.src_mac, eh->h_source);
> +	tag = skb->data - 2;
> +	key.vlan = 0;
> +	switch (skb->protocol) {
> +#if IS_ENABLED(CONFIG_NET_DSA)
> +	case htons(ETH_P_XDSA):
> +		if (!netdev_uses_dsa(skb->dev) ||
> +		    skb->dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
> +			goto out;
> +
> +		tag += 4;
> +		if (get_unaligned_be16(tag) != ETH_P_8021Q)
> +			break;
> +
> +		fallthrough;
> +#endif
> +	case htons(ETH_P_8021Q):
> +		key.vlan = get_unaligned_be16(tag + 2) & VLAN_VID_MASK;
> +		break;
> +	default:
> +		break;
> +	}

I'm trying to understand the architecture here.

We have an Ethernet interface and a Wireless interface. The slow path
is that frames ingress from one of these interfaces, Linux decides
what to do with them, either L2 or L3, and they then egress probably
out the other interface.

The hardware will look at the frames and try to spot flows? It will
then report any it finds. You can then add an offload, telling it for
a flow it needs to perform L2 or L3 processing, and egress out a
specific port? Linux then no longer sees the frame, the hardware
handles it, until the flow times out?

So i'm wondering what is going on here. So is this a frame which has
ingressed, either from the WiFi, or another switch port, gone to the
software bridge, bridges to a DSA slave interface, the DSA tagger has
added a tag and now it is in the master interface? Can you accelerate
such frames? What is adding the DSA tag on the fast path? And in the
opposite direction, frames which egress the switch which have a DSA
tag and are heading to the WiFi, what is removing the tag? Does the
accelerator also understand the tag and know what to do with it?

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
