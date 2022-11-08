Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083B8C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 06:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXHT3OV3Sy5eJ5+6znkGvJWy1L+yHwOVWv37w7Ji/M0=; b=U5KLsu2VYIKrQUjpEP1aUsE9M6
	46o1y3AjlKm7ku+SCeDE6sfDvr6W5fU+ljDRGshOZ+ohzGKz3LH3XZSVTtdEwNwe3twZGFUQUwOOX
	OfvqFgYzDrnlOJOFyVDrM0DbG28dkER9BVMqGhEsfxyY/TVzLZ4Sq/kTUythxOBRL9xn6ZtXOJDCx
	zQ8PNGSpYrBzR6qylFq6zODqJoy3yAJnHR1LDhPk34EOILJ3Wsch9TKMpGLJxcZ6di5DNPHaFn9RO
	UdWkMYyAXL+PiBbI/tWARGZELAfL+y+oH7K1kSe5mc+WdJ+dizKQB1onOxiSMOHWFylEtAGNiX+Gh
	ylPmjN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osHvv-0039Li-Oq; Tue, 08 Nov 2022 06:18:03 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osHvk-0039IZ-Qu; Tue, 08 Nov 2022 06:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
	:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kXHT3OV3Sy5eJ5+6znkGvJWy1L+yHwOVWv37w7Ji/M0=; b=biGHaUTVuiP339mg/UexJyeZxE
	lxrMngemoM8L6ADQwk1Iaqx1NpHmybt0IUhIi18v6VDLykaQkof9uDH0T/it/l3ZEXseQ+GYfTnhI
	/Yl4KODK+TPhQayMfR3qgKk1/U44MbUQOblj6hKL/85cmIjN3VoYO7A1rYVcjgGar8Ds=;
Received: from p200300daa72ee1006d973cebf3767a25.dip0.t-ipconnect.de ([2003:da:a72e:e100:6d97:3ceb:f376:7a25] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1osHvW-000S77-Q3; Tue, 08 Nov 2022 07:17:38 +0100
Message-ID: <56a5a15c-a26f-1ff2-9ecf-46b3e1c07806@nbd.name>
Date: Tue, 8 Nov 2022 07:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221107185452.90711-1-nbd@nbd.name>
 <20221107185452.90711-11-nbd@nbd.name>
 <20221107233229.qzwuex4nwm44xbe4@skbuf>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 11/14] net: ethernet: mtk_eth_soc: fix VLAN rx hardware
 acceleration
In-Reply-To: <20221107233229.qzwuex4nwm44xbe4@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_221752_902345_335BCD16 
X-CRM114-Status: GOOD (  31.28  )
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

On 08.11.22 00:32, Vladimir Oltean wrote:
> On Mon, Nov 07, 2022 at 07:54:49PM +0100, Felix Fietkau wrote:
>> - enable VLAN untagging for PDMA rx
>> - make it possible to disable the feature via ethtool
>> - pass VLAN tag to the DSA driver
>> - untag special tag on PDMA only if no non-DSA devices are in use
>> - disable special tag untagging on 7986 for now, since it's not working yet
> 
> What is the downside of not enabling VLAN RX offloading, is it a
> performance or a functional need to have it?
> 
>> 
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
>>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 36 +++++++++++++--------
>>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  3 ++
>>  2 files changed, 25 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> index ab31dda2cd66..3b8995a483aa 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> @@ -2015,16 +2015,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>>  						htons(RX_DMA_VPID(trxd.rxd4)),
>>  						RX_DMA_VID(trxd.rxd4));
>>  			} else if (trxd.rxd2 & RX_DMA_VTAG) {
>> -				__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
>> +				__vlan_hwaccel_put_tag(skb, htons(RX_DMA_VPID(trxd.rxd3)),
> 
> Why make this change? The network stack doesn't like it when you feed it
> non-standard VLAN protocols, as you've noticed.
To make the hardware untag the DSA special tag, which is faster than 
doing it in the DSA tag driver.

>>  						       RX_DMA_VID(trxd.rxd3));
>>  			}
>> -
>> -			/* If the device is attached to a dsa switch, the special
>> -			 * tag inserted in VLAN field by hw switch can * be offloaded
>> -			 * by RX HW VLAN offload. Clear vlan info.
> 
> What is the format of this special tag, what does it contain? The same
> thing as what mtk_tag_rcv() parses?
Yes

>> -			 */
>> -			if (netdev_uses_dsa(netdev))
>> -				__vlan_hwaccel_clear_tag(skb);
> 
> If the DSA switch information is present in the VLAN hwaccel, and the
> VLAN hwaccel is cleared, and that up until this change,
> NETIF_F_HW_VLAN_CTAG_RX was not configurable, it means that every
> mtk_soc_data with MTK_HW_FEATURES would be broken as a DSA master?Before my change, the hardware wasn't actually untagging packets with 
the DSA special tag. Because of that, the code that I'm removing here 
was never used.

>>  		}
>>  
>>  		skb_record_rx_queue(skb, 0);
>> @@ -2847,15 +2840,17 @@ static netdev_features_t mtk_fix_features(struct net_device *dev,
>>  
>>  static int mtk_set_features(struct net_device *dev, netdev_features_t features)
>>  {
>> -	int err = 0;
>> -
>> -	if (!((dev->features ^ features) & NETIF_F_LRO))
>> -		return 0;
>> +	struct mtk_mac *mac = netdev_priv(dev);
>> +	struct mtk_eth *eth = mac->hw;
>> +	netdev_features_t diff = dev->features ^ features;
>>  
>> -	if (!(features & NETIF_F_LRO))
>> +	if ((diff & NETIF_F_LRO) && !(features & NETIF_F_LRO))
>>  		mtk_hwlro_netdev_disable(dev);
>>  
>> -	return err;
>> +	/* Set RX VLAN offloading */
>> +	mtk_w32(eth, !!(features & NETIF_F_HW_VLAN_CTAG_RX), MTK_CDMP_EG_CTRL);
> 
> Nit: do this only if (diff & NETIF_F_HW_VLAN_CTAG_RX).
Will fix that in v2.
> 
>> +
>> +	return 0;
>>  }
>>  
>>  /* wait for DMA to finish whatever it is doing before we start using it again */
>> @@ -3176,6 +3171,15 @@ static int mtk_open(struct net_device *dev)
>>  	else
>>  		refcount_inc(&eth->dma_refcnt);
>>  
>> +	/* Hardware special tag parsing needs to be disabled if at least
>> +	 * one MAC does not use DSA.
>> +	 */
> 
> Don't understand why, sorry.
The hardware has multiple ethernet MACs connected to the same DMA ring. 
The parsing flag can't be turned off per MAC and it makes the hardware 
assume that a DSA special tag is present.

>> +	if (!netdev_uses_dsa(dev)) {
>> +		u32 val = mtk_r32(eth, MTK_CDMP_IG_CTRL);
>> +		val &= ~MTK_CDMP_STAG_EN;
>> +		mtk_w32(eth, val, MTK_CDMP_IG_CTRL);
>> +	}
>> +
>>  	phylink_start(mac->phylink);
>>  	netif_tx_start_all_queues(dev);
>>  

- Felix

