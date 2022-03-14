Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6155FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 07:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnQ6cj49bNKOaVmAPiqAZFgp/weSJOL3kM+erUPlG4c=; b=qYuJsrPWoEzTQi
	Sm8D6aW/Rjz+T/WLAKeYIxVWLUthVopmlx5HTtCKs10kZ/vwq0Gtp3S+1s72vJBXgiEGwbgAOnjoX
	MLOTWi/lWSh+xSvs1hajsd2QT6IChh2hW2Njr1c8NakAC3HqtM0VS59zbXDtCu8Fg5PndYFlWUyCA
	Fz66agwHhc8pqFq9DFGSUcXOziKgQBMD63WlcVLMRY3FWnpSrUbMpIziADCIgDMayH3o1xp8BoWKb
	9ax1RUkR0xhB4yXZ+8ZU7rej3gQ14/QafjF70KOtGnjdW0N6B4CDxaIId+4GfDZ0zZlrEBLxBuK+d
	RzK0XaI0v/A/QbfRgS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTeiD-0040PR-6c; Mon, 14 Mar 2022 07:01:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTei0-0040MG-RO; Mon, 14 Mar 2022 07:01:38 +0000
X-UUID: 8c6f5e56a35c4c69a7634e40a50155cd-20220314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6oQU1CUFaqxtK4EGas9NEDX1K7XaBFpelCgodx75H08=; 
 b=OTpiesbKUrm8TLAj74vPJBJFjxkrfar5REszEwLEuYHXM7sb2RXGk6b4o9SC3V8MY3W8piVk2n7SDcpxTufWOF3e/xkE43GJ93CI3T7h/FVxO9RnGpMnPFFoCSZZO7YUUiu4N5gpR7aqSBLuUL0T886EFdRclEBCLEm4EBvtpdE=;
X-UUID: 8c6f5e56a35c4c69a7634e40a50155cd-20220314
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1546828186; Mon, 14 Mar 2022 00:01:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 00:01:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Mar 2022 15:01:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 15:01:23 +0800
Message-ID: <2d0ab5290e63069f310987a4423ef2a46f02f1b3.camel@mediatek.com>
Subject: Re: [PATCH net-next v2 9/9] net: ethernet: mtk-star-emac: separate
 tx/rx handling with two NAPIs
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Date: Mon, 14 Mar 2022 15:01:23 +0800
In-Reply-To: <20220128074454.46d0ca29@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20220127015857.9868-1-biao.huang@mediatek.com>
 <20220127015857.9868-10-biao.huang@mediatek.com>
 <20220127194338.01722b3c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2bdb6c9b5ec90b6c606b7db8c13f8acb34910b36.camel@mediatek.com>
 <20220128074454.46d0ca29@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_000136_921265_45BE3318 
X-CRM114-Status: GOOD (  32.36  )
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

Dear Jakub,
	Thanks for your comments~

On Fri, 2022-01-28 at 07:44 -0800, Jakub Kicinski wrote:
> On Fri, 28 Jan 2022 15:05:27 +0800 Biao Huang wrote:
> > > > + * Description : this is the driver interrupt service routine.
> > > > + * it mainly handles:
> > > > + *  1. tx complete interrupt for frame transmission.
> > > > + *  2. rx complete interrupt for frame reception.
> > > > + *  3. MAC Management Counter interrupt to avoid counter
> > > > overflow.
> > > >   */
> > > >  static irqreturn_t mtk_star_handle_irq(int irq, void *data)
> > > >  {
> > > > -	struct mtk_star_priv *priv;
> > > > -	struct net_device *ndev;
> > > > +	struct net_device *ndev = data;
> > > > +	struct mtk_star_priv *priv = netdev_priv(ndev);
> > > > +	unsigned int intr_status = mtk_star_intr_ack_all(priv);
> > > > +	unsigned long flags = 0;
> > > > +
> > > > +	if (intr_status & MTK_STAR_BIT_INT_STS_FNRC) {
> > > > +		if (napi_schedule_prep(&priv->rx_napi)) {
> > > > +			spin_lock_irqsave(&priv->lock, flags);
> > > > +			/* mask Rx Complete interrupt */
> > > > +			mtk_star_disable_dma_irq(priv, true,
> > > > false);
> > > > +			spin_unlock_irqrestore(&priv->lock,
> > > > flags);
> > > > +			__napi_schedule_irqoff(&priv->rx_napi);
> > > > +		}
> > > > +	}
> > > >  
> > > > -	ndev = data;
> > > > -	priv = netdev_priv(ndev);
> > > > +	if (intr_status & MTK_STAR_BIT_INT_STS_TNTC) {
> > > > +		if (napi_schedule_prep(&priv->tx_napi)) {
> > > > +			spin_lock_irqsave(&priv->lock, flags);
> > > > +			/* mask Tx Complete interrupt */
> > > > +			mtk_star_disable_dma_irq(priv, false,
> > > > true);
> > > > +			spin_unlock_irqrestore(&priv->lock,
> > > > flags);
> > > > +			__napi_schedule_irqoff(&priv->tx_napi);
> > > > +		}
> > > > +	}  
> > > 
> > > Seems a little wasteful to retake the same lock twice if two IRQ
> > > sources fire at the same time.  
> > 
> > The TX/RX irq control bits are in the same register,
> > but they are triggered independently.
> > So it seems necessary to protect the register
> > access with a spin lock.
> 
> This is what I meant:
> 
> rx = (status & RX) && napi_schedule_prep(rx_napi);
> tx = (status & TX) && napi_schedule_prep(tx_napi);
> 
> if (rx || tx) {
> 	spin_lock()
> 	disable_irq(priv, rx, tx);	
> 	spin_unlock();
> 	if (rx)
> 		__napi_schedule_irqoff(rx_napi)
> 	if (tx)
> 		__napi_schedule_irqoff(tx_napi)
> }
> 
OK, We'll adopt your suggestion, and corresponding modification will be
added in next send.
> > > >  	desc_data.dma_addr = mtk_star_dma_map_tx(priv, skb);
> > > >  	if (dma_mapping_error(dev, desc_data.dma_addr))
> > > > @@ -1050,18 +1103,10 @@ static int
> > > > mtk_star_netdev_start_xmit(struct sk_buff *skb,
> > > >  
> > > >  	desc_data.skb = skb;
> > > >  	desc_data.len = skb->len;
> > > > -
> > > > -	spin_lock_bh(&priv->lock);
> > > > 
> > > >  	mtk_star_ring_push_head_tx(ring, &desc_data);
> > > >  
> > > >  	netdev_sent_queue(ndev, skb->len);
> > > >  
> > > > -	if (mtk_star_ring_full(ring))
> > > > -		netif_stop_queue(ndev);  
> > > 
> > > Are you stopping the queue in advance somewhere else now? Did you
> > > only
> > > test this with BQL enabled? Only place that stops the ring also
> > > prints
> > > a loud warning now AFAICS..  
> > 
> > No.
> > 
> > We modify the ring full condition, and will not invoke
> > netif_stop_queue
> > if queue is already stopped.
> 
> I don't understand what you're saying.
> 
> > Test pass no matter whether BQL is enabled or disabled.
> > 
> > It's much safer to judge queue is full or not at the beginning of
> > start_xmit() to avoid invalid setting.
> 
> Drivers are expected to stop their queues at the end of xmit routine
> if
> the ring can't accommodate another frame. It's more efficient to stop
> the queues early than have to put skbs already dequeued from the
> qdisc
> layer back into the qdiscs.
Yes, if descriptors ring is full, it's meaningful to stop the queue 
at the end of xmit; 
But driver seems hard to know how many descriptors the next skb will
request, e.g. 3 descriptors are available for next round send, but the
next skb may need 4 descriptors, in this case, we still need judge
whether descriptors are enough for skb transmission, then decide stop
the queue or not, at the beginning of xmit routine.

Maybe we should judge ring is full or not at the beginning and the end
of xmit routine(seems a little redundancy).

Regards~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
