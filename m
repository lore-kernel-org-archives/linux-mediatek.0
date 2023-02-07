Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D16C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPYG/zvRTVen44RSGuz7Fz8RexNUnqk9Tz3jaq6V3LQ=; b=C1CZAo70P2x3Ecp5gLJUUE+ks+
	7tZ+HvxyXEJaEU9CNjIia/Ks0E9vhZBafnev35gdL1QRDOPPVMOldbNg5364QGZ9uQcTIL4TxGJqy
	32xNeR1hVOaE5dMOzhelVB3qmNm8uhPwI12IttkXQZ2EJofS9WZAHKahcS3M47BuVhHVlgoirSk97
	O7JhMgy360HcBScRYX/tcwdfrDseVIHmCqlfaxpqPnimibXNTlG8C2/xW8Y1MRi6kz8/1ISkaEVwT
	1SO1jrlAL5b2ib5/DXH4mBjLX+R4zeePu7z2/VIdkwDOdojVj5uq94WN8VCJ7GntuXJNFOqTPqJjS
	AXlclCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLR0-00BmAz-I2; Tue, 07 Feb 2023 10:42:46 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLQo-00Bm5v-1o; Tue, 07 Feb 2023 10:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZPYG/zvRTVen44RSGuz7Fz8RexNUnqk9Tz3jaq6V3LQ=; b=kMTMZX3j7GPqGpI8ybON0E5M4y
	FNDv0nmaEMUpCHKXGZ6BCidO2MxqelVkXd50X8yAceTl7B8fyYh1B8neNO7W1UMjv8sFMMyx6/ngC
	NNcKw06np0c6UWqHkvhC2i5G9PIpjI/zsEFXPKEEyGS2gdFgytK3cypQp9fh7hi66kEQ=;
Received: from p200300daa717ad04d0827e150ac3376f.dip0.t-ipconnect.de ([2003:da:a717:ad04:d082:7e15:ac3:376f] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pPLQM-005hBy-Kr; Tue, 07 Feb 2023 11:42:06 +0100
Message-ID: <b1d812ea-57a0-fd68-d398-69e0b17c2f34@nbd.name>
Date: Tue, 7 Feb 2023 11:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix DSA TX tag hwaccel
 for switch port 0
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>
References: <20230207103027.1203344-1-vladimir.oltean@nxp.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20230207103027.1203344-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_024234_256113_061222C2 
X-CRM114-Status: GOOD (  23.68  )
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

On 07.02.23 11:30, Vladimir Oltean wrote:
> Arınç reports that on his MT7621AT Unielec U7621-06 board and MT7623NI
> Bananapi BPI-R2, packets received by the CPU over mt7530 switch port 0
> (of which this driver acts as the DSA master) are not processed
> correctly by software. More precisely, they arrive without a DSA tag
> (in packet or in the hwaccel area - skb_metadata_dst()), so DSA cannot
> demux them towards the switch's interface for port 0. Traffic from other
> ports receives a skb_metadata_dst() with the correct port and is demuxed
> properly.
> 
> Looking at mtk_poll_rx(), it becomes apparent that this driver uses the
> skb vlan hwaccel area:
> 
> 	union {
> 		u32		vlan_all;
> 		struct {
> 			__be16	vlan_proto;
> 			__u16	vlan_tci;
> 		};
> 	};
> 
> as a temporary storage for the VLAN hwaccel tag, or the DSA hwaccel tag.
> If this is a DSA master it's a DSA hwaccel tag, and finally clears up
> the skb VLAN hwaccel header.
> 
> I'm guessing that the problem is the (mis)use of API.
> skb_vlan_tag_present() looks like this:
> 
>   #define skb_vlan_tag_present(__skb)	(!!(__skb)->vlan_all)
> 
> So if both vlan_proto and vlan_tci are zeroes, skb_vlan_tag_present()
> returns precisely false. I don't know for sure what is the format of the
> DSA hwaccel tag, but I surely know that lowermost 3 bits of vlan_proto
> are 0 when receiving from port 0:
> 
> 	unsigned int port = vlan_proto & GENMASK(2, 0);
> 
> If the RX descriptor has no other bits set to non-zero values in
> RX_DMA_VTAG, then the call to __vlan_hwaccel_put_tag() will not, in
> fact, make the subsequent skb_vlan_tag_present() return true, because
> it's implemented like this:
> 
> static inline void __vlan_hwaccel_put_tag(struct sk_buff *skb,
> 					  __be16 vlan_proto, u16 vlan_tci)
> {
> 	skb->vlan_proto = vlan_proto;
> 	skb->vlan_tci = vlan_tci;
> }
> 
> What we need to do to fix this problem (assuming this is the problem) is
> to stop using skb->vlan_all as temporary storage for driver affairs, and
> just create some local variables that serve the same purpose, but
> hopefully better. Instead of calling skb_vlan_tag_present(), let's look
> at a boolean has_hwaccel_tag which we set to true when the RX DMA
> descriptors have something. Disambiguate based on netdev_uses_dsa()
> whether this is a VLAN or DSA hwaccel tag, and only call
> __vlan_hwaccel_put_tag() if we're certain it's a VLAN tag.
> 
> Arınç confirms that the treatment works, so this validates the
> assumption.
> 
> Link: https://lore.kernel.org/netdev/704f3a72-fc9e-714a-db54-272e17612637@arinc9.com/
> Fixes: 2d7605a72906 ("net: ethernet: mtk_eth_soc: enable hardware DSA untagging")
> Reported-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Felix Fietkau <nbd@nbd.name>

