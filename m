Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D301FC05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ProAxIu/D+Y00gK1YGgligpks3ChxET0IaQ63SQcWyc=; b=Bb4iA8rf564qN1OtVJml4GW3mL
	xLiVl8vxcNBhMle2ogP9hpKa3Vx80jmbUqcjtgCtfpsTwHrn/M6wHRaiEyXPoGQB8reSpc4h5LRgu
	lo7D68vpv+kRJvIwy8DGo4q0/viegvpgRlDI0IqtM48BQCf0IV5ts/hFcco1vBK62Ke1vMgtR0DJp
	Hn2MD+OHDkVpmm1vfF452DbDXIh+c2NTsn00qVHtGoOIbZ3yF+qxY30UG0TVshHl5JZDMgWfQvuc1
	eQfPl9g75p3m1h/txyu+W4CeTupQUJayB4ziKfHRB42thTokJB+aj3pf5Lv4iO3VrKZlvJlHpd8Wn
	0iiq14Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOw8F-007bSB-Oa; Mon, 06 Feb 2023 07:41:43 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOw84-007bQC-Ds; Mon, 06 Feb 2023 07:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675669268; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QvGmYhi4eB/6QWILE6zV6VL6cdgXaVOHTgFYd7z+HZHz1rAl1iVwq3FVwgefGje53OXUYJojhEwX7k6IoI3sciFPFPggQ5YGkZNU3fCgH7gDeM6TF/WHqlgtQa24I4NHYF84kPlk1QuTJ/xQyuwtZSGoiaCFixWK0f+suueLX4A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675669268; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ProAxIu/D+Y00gK1YGgligpks3ChxET0IaQ63SQcWyc=; 
	b=f0Da2RiRsc0MBmnIkLBDM3hly5EFC293CgfdAfQVhegpN1gIbEwPb+zp5tt2UNJqEnArA5ZPNb0sDi98bxQsaryPPAxIv0yTKJiTPCzcUHKpI+iogSiVWgMLU9M/kM4sR/et1bA3tp8wfQxLqE34gzY9CSclojbjgsU4t2vT70w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675669268;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ProAxIu/D+Y00gK1YGgligpks3ChxET0IaQ63SQcWyc=;
	b=UuPiXzwywvZMSGkFAvJT9Phy+Yumhho/1T7LP6hHjZotCZRRVzCB6DRRS7qtQVhO
	2YIdQqDtsk+k8R03Li12Ndjuj/HnZPujwc6QVgwLSgGTA30seyupT9bvD6YV6RfDz9U
	DQFv0yLAiqZW2uhfOPju6OZ3NRMQV7oeCxIOGqFc=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675669267703114.06415242476771; Sun, 5 Feb 2023 23:41:07 -0800 (PST)
Message-ID: <704f3a72-fc9e-714a-db54-272e17612637@arinc9.com>
Date: Mon, 6 Feb 2023 10:41:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
To: frank-w@public-files.de, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com,
 richard@routerhints.com
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
 <3649b6f9-a028-8eaf-ac89-c4d0fce412da@arinc9.com>
 <20230205203906.i3jci4pxd6mw74in@skbuf>
 <b055e42f-ff0f-d05a-d462-961694b035c1@arinc9.com>
 <20230205235053.g5cttegcdsvh7uk3@skbuf>
 <E5DEFD06-4B8F-4A37-918F-61AD4EB15761@public-files.de>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <E5DEFD06-4B8F-4A37-918F-61AD4EB15761@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_234132_596512_EF72D202 
X-CRM114-Status: GOOD (  17.22  )
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

On 6.02.2023 10:35, Frank Wunderlich wrote:
> Am 6. Februar 2023 00:50:53 MEZ schrieb Vladimir Oltean <vladimir.oltean@nxp.com>:
>> On Mon, Feb 06, 2023 at 02:02:48AM +0300, Arınç ÜNAL wrote:
>>> # ethtool -S eth1 | grep -v ': 0'
>>> NIC statistics:
>>>       tx_bytes: 6272
>>>       tx_packets: 81
>>>       rx_bytes: 9089
>>>       rx_packets: 136
>>>       p05_TxUnicast: 52
>>>       p05_TxMulticast: 3
>>>       p05_TxBroadcast: 81
>>>       p05_TxPktSz65To127: 136
>>>       p05_TxBytes: 9633
>>>       p05_RxFiltering: 11
>>>       p05_RxUnicast: 11
>>>       p05_RxMulticast: 26
>>>       p05_RxBroadcast: 44
>>>       p05_RxPktSz64: 47
>>>       p05_RxPktSz65To127: 34
>>>       p05_RxBytes: 6272
>>> # ethtool -S eth1 | grep -v ': 0'
>>> NIC statistics:
>>>       tx_bytes: 6784
>>>       tx_packets: 89
>>>       rx_bytes: 9601
>>>       rx_packets: 144
>>>       p05_TxUnicast: 60
>>>       p05_TxMulticast: 3
>>>       p05_TxBroadcast: 81
>>>       p05_TxPktSz65To127: 144
>>>       p05_TxBytes: 10177
>>>       p05_RxFiltering: 11
>>>       p05_RxUnicast: 11
>>>       p05_RxMulticast: 26
>>>       p05_RxBroadcast: 52
>>>       p05_RxPktSz64: 55
>>>       p05_RxPktSz65To127: 34
>>>       p05_RxBytes: 6784
>>> # ethtool -S eth1 | grep -v ': 0'
>>> NIC statistics:
>>>       tx_bytes: 7424
>>>       tx_packets: 99
>>>       rx_bytes: 10241
>>>       rx_packets: 154
>>>       p05_TxUnicast: 70
>>>       p05_TxMulticast: 3
>>>       p05_TxBroadcast: 81
>>>       p05_TxPktSz65To127: 154
>>>       p05_TxBytes: 10857
>>>       p05_RxFiltering: 11
>>>       p05_RxUnicast: 11
>>>       p05_RxMulticast: 26
>>>       p05_RxBroadcast: 62
>>>       p05_RxPktSz64: 65
>>>       p05_RxPktSz65To127: 34
>>>       p05_RxBytes: 7424
>>
>> I see no signs of packet loss on the DSA master or the CPU port.
>> However my analysis of the packets shows:
>>
>>> # tcpdump -i eth1 -e -n -Q in -XX
>>> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
>>> listening on eth1, link-type NULL (BSD loopback), snapshot length 262144 bytes
>>> 03:50:38.645568 AF Unknown (2459068999), length 60:
>>> 	0x0000:  9292 6a47 1ac0 e0d5 5ea4 edcc 0806 0001  ..jG....^.......
>>                  ^              ^              ^
>>                  |              |              |
>>                  |              |              ETH_P_ARP
>>                  |              MAC SA:
>>                  |              e0:d5:5e:a4:ed:cc
>>                  MAC DA:
>>                  92:92:6a:47:1a:c0
>>
>>> 	0x0010:  0800 0604 0002 e0d5 5ea4 edcc c0a8 0202  ........^.......
>>> 	0x0020:  9292 6a47 1ac0 c0a8 0201 0000 0000 0000  ..jG............
>>> 	0x0030:  0000 0000 0000 0000 0000 0000            ............
>>
>> So you have no tag_mtk header in the EtherType position where it's
>> supposed to be. This means you must be making use of the hardware DSA
>> untagging feature that Felix Fietkau added.
>>
>> Let's do some debugging. I'd like to know 2 things, in this order.
>> First, whether DSA sees the accelerated header (stripped by hardware, as
>> opposed to being present in the packet):
>>
>> diff --git a/net/dsa/tag.c b/net/dsa/tag.c
>> index b2fba1a003ce..e64628cf7fc1 100644
>> --- a/net/dsa/tag.c
>> +++ b/net/dsa/tag.c
>> @@ -75,12 +75,17 @@ static int dsa_switch_rcv(struct sk_buff *skb, struct net_device *dev,
>> 		if (!skb_has_extensions(skb))
>> 			skb->slow_gro = 0;
>>
>> +		netdev_err(dev, "%s: skb %px metadata dst contains port id %d attached\n",
>> +			   __func__, skb, port);
>> +
>> 		skb->dev = dsa_master_find_slave(dev, 0, port);
>> 		if (likely(skb->dev)) {
>> 			dsa_default_offload_fwd_mark(skb);
>> 			nskb = skb;
>> 		}
>> 	} else {
>> +		netdev_err(dev, "%s: there is no metadata dst attached to skb 0x%px\n",
>> +			   __func__, skb);
>> 		nskb = cpu_dp->rcv(skb, dev);
>> 	}
>>
>>
>> And second, which is what does the DSA master actually see, and put in
>> the skb metadata dst field:
>>
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> index f1cb1efc94cf..e7ff569959b4 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> @@ -2077,11 +2077,23 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>> 		if (skb_vlan_tag_present(skb) && netdev_uses_dsa(netdev)) {
>> 			unsigned int port = ntohs(skb->vlan_proto) & GENMASK(2, 0);
>>
>> +			netdev_err(netdev, "%s: skb->vlan_proto 0x%x port %d\n", __func__,
>> +				   ntohs(skb->vlan_proto), port);
>> +
>> 			if (port < ARRAY_SIZE(eth->dsa_meta) &&
>> -			    eth->dsa_meta[port])
>> +			    eth->dsa_meta[port]) {
>> +				netdev_err(netdev, "%s: attaching metadata dst with port %d to skb 0x%px\n",
>> +					   __func__, port, skb);
>> 				skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);
>> +			} else {
>> +				netdev_err(netdev, "%s: not attaching any metadata dst to skb 0x%px\n",
>> +					   __func__, skb);
>> +			}
>>
>> 			__vlan_hwaccel_clear_tag(skb);
>> +		} else if (netdev_uses_dsa(netdev)) {
>> +			netdev_err(netdev, "%s: received skb 0x%px without VLAN/DSA tag present\n",
>> +				   __func__, skb);
>> 		}
>>
>> 		skb_record_rx_queue(skb, 0);
>>
>> Be warned that there may be a considerable amount of output to the console,
>> so it would be best if you used a single switch port with small amounts
>> of traffic.
> 
> Arınç have you tested with or without this series?
> 
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=707666

I'm trying this without it, this is the tree I'm testing.

https://github.com/arinc9/linux/commits/test-for-richard

Arınç

