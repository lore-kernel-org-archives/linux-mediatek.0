Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881F4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8sftCPNBYNerNefr2SKCJcx41DneW9Iyj+t5CuD3OE=; b=D9+oozbbd228lA
	sMTjFVKrbkATl9YA9R3mBR9mSoPNeb/whOkylmPRPgpYketanKDlSWQhLTMEVq7VgfAn4/igW1Ouu
	8R1N396/zUkV6ClghIfk4Agqr6gBANbMBMegZjN5ORg6bcK35sn6HgxgYDIvXHmDrJFzbYidwUPsN
	nA4BbGxHEDxqCc1CoVZGnCUya8qhTbQ7FaLiBMOBWAScahcNVEdETJHbWxa7a5oy7UT9itwPi7pDK
	GvGjSd8FueyihbZ90s7QIIHlNNTFV4wfFcWZ5bjc62WID25GuWv7PGIkt0B3l2Ccz0cEntFUFKPK6
	72hfCQQXG0z1tVuoCEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neAji-00C86A-2L; Tue, 12 Apr 2022 07:14:50 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neAj8-00C7om-1Y; Tue, 12 Apr 2022 07:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtaxEETAanzEBI5ZCrBTObGqYu4eUkH/80V7BcVtCTE=; b=dn8/9vrX7GguY418rNKJLb9/N8
 DSEK325oohvxQUlkohyA3zbONZVq22faYjHytu7U9EcG0/w5p2boa8VoGa0ygJ5UgLWdl6xFH6Ker
 jThloXxYvrgRtNj3DNedbOCFIT5JxUyv/RT19yqtM2ydtRUQ9yWpFex1nsJ2LgQ81Wa0=;
Received: from p57a6f1f9.dip0.t-ipconnect.de ([87.166.241.249] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1neAip-0007Yd-LZ; Tue, 12 Apr 2022 09:13:55 +0200
Message-ID: <ece29b0d-bbbe-7c03-a6b4-60e44453ca31@nbd.name>
Date: Tue, 12 Apr 2022 09:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 14/14] net: ethernet: mtk_eth_soc: support creating mac
 address based offload entries
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-15-nbd@nbd.name> <Yk8pJRxnVCfdk8xi@lunn.ch>
 <f25a6278-1baf-cc27-702a-5d93eedda438@nbd.name> <YlQmf7qGAnq/3nW0@lunn.ch>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <YlQmf7qGAnq/3nW0@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_001414_388153_742FAF8A 
X-CRM114-Status: GOOD (  42.30  )
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


On 11.04.22 15:00, Andrew Lunn wrote:
> On Thu, Apr 07, 2022 at 08:21:43PM +0200, Felix Fietkau wrote:
>> 
>> On 07.04.22 20:10, Andrew Lunn wrote:
>> > On Tue, Apr 05, 2022 at 09:57:55PM +0200, Felix Fietkau wrote:
>> > > This will be used to implement a limited form of bridge offloading.
>> > > Since the hardware does not support flow table entries with just source
>> > > and destination MAC address, the driver has to emulate it.
>> > > 
>> > > The hardware automatically creates entries entries for incoming flows, even
>> > > when they are bridged instead of routed, and reports when packets for these
>> > > flows have reached the minimum PPS rate for offloading.
>> > > 
>> > > After this happens, we look up the L2 flow offload entry based on the MAC
>> > > header and fill in the output routing information in the flow table.
>> > > The dynamically created per-flow entries are automatically removed when
>> > > either the hardware flowtable entry expires, is replaced, or if the offload
>> > > rule they belong to is removed
>> > 
>> > > +
>> > > +	if (found)
>> > > +		goto out;
>> > > +
>> > > +	eh = eth_hdr(skb);
>> > > +	ether_addr_copy(key.dest_mac, eh->h_dest);
>> > > +	ether_addr_copy(key.src_mac, eh->h_source);
>> > > +	tag = skb->data - 2;
>> > > +	key.vlan = 0;
>> > > +	switch (skb->protocol) {
>> > > +#if IS_ENABLED(CONFIG_NET_DSA)
>> > > +	case htons(ETH_P_XDSA):
>> > > +		if (!netdev_uses_dsa(skb->dev) ||
>> > > +		    skb->dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
>> > > +			goto out;
>> > > +
>> > > +		tag += 4;
>> > > +		if (get_unaligned_be16(tag) != ETH_P_8021Q)
>> > > +			break;
>> > > +
>> > > +		fallthrough;
>> > > +#endif
>> > > +	case htons(ETH_P_8021Q):
>> > > +		key.vlan = get_unaligned_be16(tag + 2) & VLAN_VID_MASK;
>> > > +		break;
>> > > +	default:
>> > > +		break;
>> > > +	}
>> > 
>> > I'm trying to understand the architecture here.
>> > 
>> > We have an Ethernet interface and a Wireless interface. The slow path
>> > is that frames ingress from one of these interfaces, Linux decides
>> > what to do with them, either L2 or L3, and they then egress probably
>> > out the other interface.
>> > 
>> > The hardware will look at the frames and try to spot flows? It will
>> > then report any it finds. You can then add an offload, telling it for
>> > a flow it needs to perform L2 or L3 processing, and egress out a
>> > specific port? Linux then no longer sees the frame, the hardware
>> > handles it, until the flow times out?
>> Yes, the hw handles it until either the flow times out, or the corresponding
>> offload entry is removed.
>> 
>> For OpenWrt I also wrote a daemon that uses tc classifier BPF to accelerate
>> the software bridge and create hardware offload entries as well via hardware
>> TC flower rules: https://github.com/nbd168/bridger
>> It works in combination with these changes.
> 
> What about the bridge? In Linux, it is the software bridge which
> controls all this at L2, and it should be offloading the flows, via
> switchdev. The egress port you derive here is from the software bridge
> FDB?
My code uses netlink to fetch and monitor the bridge configuration, 
including fdb, port state, vlans, etc. and it uses that for the offload 
path - no extra configuration needed.

>> > So i'm wondering what is going on here. So is this a frame which has
>> > ingressed, either from the WiFi, or another switch port, gone to the
>> > software bridge, bridges to a DSA slave interface, the DSA tagger has
>> > added a tag and now it is in the master interface? Can you accelerate
>> > such frames? What is adding the DSA tag on the fast path? And in the
>> > opposite direction, frames which egress the switch which have a DSA
>> > tag and are heading to the WiFi, what is removing the tag? Does the
>> > accelerator also understand the tag and know what to do with it?WiFi ->
>> > Ethernet is not supported by MT7622, but will be added for newer
> 
>> SoCs like MT7986. The PPE supports both parsing and inserting MT7530
>> compatible DSA tags. For Ethernet->WiFi flows, the PPE will also add
>> required metadata that is parsed by the MT7915 WiFi Firmware in order to
>> figure out what vif/station the packets were meant for.
> 
> O.K. What about IGMP and multicast? Does the accelerate match on IGMP
> and forwards it to the CPU, rather than follow the flow rules? Can you
> set multiple egress destinations for multicast so that it can go both
> to the switch and the host, when the host has a local interest in the
> traffic?
IGMP/multicast isn't handled yet at the moment. I still need to do some 
research on what can be offloaded and how. The offload only handles 
unicast and everything else is going through the CPU.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
