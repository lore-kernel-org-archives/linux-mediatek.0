Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B79C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+/sgG8pAMlcxfhAM+l19ggZIZSPjCNCepiJAetQLeE=; b=lp3VHHiFvZhqGLxVB2rWBcw2iS
	s9X1/veJ2kGt9q3VRfzpX3AZvuYs4FEo5428kknk0HBwce+AfGNfwl1B/wO9qSBItyv4V+qDEsqGR
	6sPP2MPFmiotuEbWYBy8EIa6dWyV22sJet/Z2knIlGyup1YNXgD4oCklwy7mf4kj6w2R5x9inbRuC
	L43C4fFZRhUC/u4ISH3I+GrmSzbw2ZsJQct6R/ABSvKwi5TqXWVGzBxhVfx5Cjc68Rpb0DSbyLofW
	GG9VT6ld8+agBo8QVJm7qYWjMQq6+4SYU/LML1SGli5UB1dY8PFhhaTkHBPN4GgrQyx2ukgayL9Vi
	PHYYiEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCcc-008J10-CM; Thu, 10 Nov 2022 18:49:54 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCWO-008EX7-PT; Thu, 10 Nov 2022 18:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
	:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=o+/sgG8pAMlcxfhAM+l19ggZIZSPjCNCepiJAetQLeE=; b=ivWn5cEcMRiHZMtn1GmY2t4o6Z
	UCdZXM/WKtWcnRfmOhN2Syr0NuTg9Q6ItYeJ5kveX8+++T7FdqcpqFSZm1T3GRPd8LIB5klOxcAjT
	ecLCqJC386Upn23peOPNBXNkMnuHnot1sTwz27n7+6KWFVW2hUPmi/YwCZQIWqX0ScA4=;
Received: from p200300daa72ee10c199752172ce6dd7a.dip0.t-ipconnect.de ([2003:da:a72e:e10c:1997:5217:2ce6:dd7a] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1otCVt-0010BT-Aj; Thu, 10 Nov 2022 19:42:57 +0100
Message-ID: <e010ec84-9d50-31ca-fdf2-af73dad5f718@nbd.name>
Date: Thu, 10 Nov 2022 19:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221109163426.76164-1-nbd@nbd.name>
 <20221109163426.76164-1-nbd@nbd.name> <20221109163426.76164-10-nbd@nbd.name>
 <20221109163426.76164-10-nbd@nbd.name>
 <20221110152259.id5gg67wcy3pbart@skbuf>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next v2 09/12] net: ethernet: mtk_eth_soc: fix VLAN rx
 hardware acceleration
In-Reply-To: <20221110152259.id5gg67wcy3pbart@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_104328_979140_502CCFB4 
X-CRM114-Status: GOOD (  19.44  )
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

On 10.11.22 16:22, Vladimir Oltean wrote:
> On Wed, Nov 09, 2022 at 05:34:23PM +0100, Felix Fietkau wrote:
>> - enable VLAN untagging for PDMA rx
>> - make it possible to disable the feature via ethtool
>> - pass VLAN tag to the DSA driver
>> - untag special tag on PDMA only if no non-DSA devices are in use
>> - disable special tag untagging on 7986 for now, since it's not working yet
> 
> Each of these bullet points should be its own patch, really.
> "Fix VLAN rx hardware acceleration" isn't doing much to describe them
> and their motivation.
I think some minor things could be split off, but doing one patch per 
bullet point definitely does not make sense.

>>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 99 ++++++++++++++++-----
>>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  8 ++
>>  2 files changed, 84 insertions(+), 23 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> index 92bdd69eed2e..ffaa9fe32b14 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> @@ -23,6 +23,7 @@
>>  #include <linux/jhash.h>
>>  #include <linux/bitfield.h>
>>  #include <net/dsa.h>
>> +#include <net/dst_metadata.h>
>>  
>>  #include "mtk_eth_soc.h"
>>  #include "mtk_wed.h"
>> @@ -2008,23 +2009,27 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>>  		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
>>  			mtk_ppe_check_skb(eth->ppe[0], skb, hash);
>>  
>> -		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX) {
>> -			if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
>> -				if (trxd.rxd3 & RX_DMA_VTAG_V2)
>> -					__vlan_hwaccel_put_tag(skb,
>> -						htons(RX_DMA_VPID(trxd.rxd4)),
>> -						RX_DMA_VID(trxd.rxd4));
>> -			} else if (trxd.rxd2 & RX_DMA_VTAG) {
>> -				__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
>> -						       RX_DMA_VID(trxd.rxd3));
>> -			}
>> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
>> +			if (trxd.rxd3 & RX_DMA_VTAG_V2)
>> +				__vlan_hwaccel_put_tag(skb,
>> +					htons(RX_DMA_VPID(trxd.rxd4)),
>> +					RX_DMA_VID(trxd.rxd4));
>> +		} else if (trxd.rxd2 & RX_DMA_VTAG) {
>> +			__vlan_hwaccel_put_tag(skb, htons(RX_DMA_VPID(trxd.rxd3)),
>> +					       RX_DMA_VID(trxd.rxd3));
>> +		}
>> +
>> +		/* When using VLAN untagging in combination with DSA, the
>> +		 * hardware treats the MTK special tag as a VLAN and untags it.
>> +		 */
>> +		if (skb_vlan_tag_present(skb) && netdev_uses_dsa(netdev)) {
>> +			unsigned int port = ntohs(skb->vlan_proto) & GENMASK(2, 0);
>> +
>> +			if (port < ARRAY_SIZE(eth->dsa_meta) &&
>> +			    eth->dsa_meta[port])
>> +				skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);
> 
> Why _noref?
In order to avoid the cost of unnecessary refcounting. The metadata dst 
is only held until dsa_switch_rcv processes it, after which it is 
removed. The driver only frees it after all its netdevs have been 
unregistered.

- Felix

