Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51030C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 07:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN1ynZb+M/pEdeaFP7asb9LXkXZC7h0etJiEWs3VMGU=; b=BWVjRF5aebKCqD
	yB0L7aUvJnEEk1xR5+9eSGVsigdo/cVTq37QSUIIUKy3QSP6s6cQctdGe7wkVDAGQaNf+6TjRPwMr
	oHTJNoWElS6LfadGGAaAaNg8TsQu54hvnl35A78S2h1VkmRcwG3uHvAzGaSFAvQDM/1AvyGH282/+
	5FjHKgDHPSFoFfmrQ4HnO0ZpmBLAAJWahjm6dmyRjc+eHJDkgrKj2hbEjLpF8ZAboA66lZGBuUSit
	ThDwK2AnSePWCyGawkTb8DQuJOkTQ9UrRHu3UJY3nAdzt307QeUnymoLLBPEa/zIypN7o792yGFW4
	EwrZACmGqg5TMthsBESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDLUd-000lgd-CA; Fri, 28 Jan 2022 07:16:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDLTu-000lRs-T7; Fri, 28 Jan 2022 07:15:41 +0000
X-UUID: bf5ca4b561174569ad1554462018bf40-20220128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bvVFvOUSrdsUknOC5W8O0XnzTsnq1OORjcJgQHLdrpk=; 
 b=nXR0dLnm35MUYohcBK1ORpftGh+B9NKA/3xTwaR4AkqD7NqZqy2YStOdPhHyXThBt6Jb3JZxftgUwXCFn8GG3dNxoWf7ZNRIPi/cHu7DFZFgKK4q0GQHMaU2vsrIEBAbh36g01MHsY5o0kuZv9ORvH9dFAgHpbCxbL2JHwXy4fI=;
X-UUID: bf5ca4b561174569ad1554462018bf40-20220128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 987649605; Fri, 28 Jan 2022 00:15:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 23:05:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 28 Jan 2022 15:05:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 15:05:27 +0800
Message-ID: <2bdb6c9b5ec90b6c606b7db8c13f8acb34910b36.camel@mediatek.com>
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
Date: Fri, 28 Jan 2022 15:05:27 +0800
In-Reply-To: <20220127194338.01722b3c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20220127015857.9868-1-biao.huang@mediatek.com>
 <20220127015857.9868-10-biao.huang@mediatek.com>
 <20220127194338.01722b3c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_231538_992016_7C64DA3D 
X-CRM114-Status: GOOD (  35.81  )
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
	Thanks for your comments!

On Thu, 2022-01-27 at 19:43 -0800, Jakub Kicinski wrote:
> On Thu, 27 Jan 2022 09:58:57 +0800 Biao Huang wrote:
> > Current driver may lost tx interrupts under bidirectional test with
> > iperf3,
> > which leads to some unexpected issues.
> > 
> > This patch let rx/tx interrupt enable/disable separately, and rx/tx
> > are
> > handled in different NAPIs.
> > +/* mtk_star_handle_irq - Interrupt Handler.
> > + * @irq: interrupt number.
> > + * @data: pointer to a network interface device structure.
> 
> if you mean this to me a kdoc comment it needs to start with /**
Yes, will fix in next send.
> 
> > + * Description : this is the driver interrupt service routine.
> > + * it mainly handles:
> > + *  1. tx complete interrupt for frame transmission.
> > + *  2. rx complete interrupt for frame reception.
> > + *  3. MAC Management Counter interrupt to avoid counter overflow.
> >   */
> >  static irqreturn_t mtk_star_handle_irq(int irq, void *data)
> >  {
> > -	struct mtk_star_priv *priv;
> > -	struct net_device *ndev;
> > +	struct net_device *ndev = data;
> > +	struct mtk_star_priv *priv = netdev_priv(ndev);
> > +	unsigned int intr_status = mtk_star_intr_ack_all(priv);
> > +	unsigned long flags = 0;
> > +
> > +	if (intr_status & MTK_STAR_BIT_INT_STS_FNRC) {
> > +		if (napi_schedule_prep(&priv->rx_napi)) {
> > +			spin_lock_irqsave(&priv->lock, flags);
> > +			/* mask Rx Complete interrupt */
> > +			mtk_star_disable_dma_irq(priv, true, false);
> > +			spin_unlock_irqrestore(&priv->lock, flags);
> > +			__napi_schedule_irqoff(&priv->rx_napi);
> > +		}
> > +	}
> >  
> > -	ndev = data;
> > -	priv = netdev_priv(ndev);
> > +	if (intr_status & MTK_STAR_BIT_INT_STS_TNTC) {
> > +		if (napi_schedule_prep(&priv->tx_napi)) {
> > +			spin_lock_irqsave(&priv->lock, flags);
> > +			/* mask Tx Complete interrupt */
> > +			mtk_star_disable_dma_irq(priv, false, true);
> > +			spin_unlock_irqrestore(&priv->lock, flags);
> > +			__napi_schedule_irqoff(&priv->tx_napi);
> > +		}
> > +	}
> 
> Seems a little wasteful to retake the same lock twice if two IRQ
> sources fire at the same time.
The TX/RX irq control bits are in the same register,
but they are triggered independently.
So it seems necessary to protect the register
access with a spin lock.
> 
> > @@ -1043,6 +1085,17 @@ static int mtk_star_netdev_start_xmit(struct
> > sk_buff *skb,
> >  	struct mtk_star_ring *ring = &priv->tx_ring;
> >  	struct device *dev = mtk_star_get_dev(priv);
> >  	struct mtk_star_ring_desc_data desc_data;
> > +	int nfrags = skb_shinfo(skb)->nr_frags;
> > +
> > +	if (unlikely(mtk_star_tx_ring_avail(ring) < nfrags + 1)) {
> > +		if (!netif_queue_stopped(ndev)) {
> > +			netif_stop_queue(ndev);
> > +			/* This is a hard error, log it. */
> > +			netdev_err(priv->ndev, "%s: Tx Ring full when
> > queue awake\n",
> > +				   __func__);
> 
> This needs to be rate limited. Also no point printing the function
> name, unless the same message appears in multiple places.
OK, will fix in next send.
> 
> > +		}
> > +		return NETDEV_TX_BUSY;
> > +	}
> >  
> >  	desc_data.dma_addr = mtk_star_dma_map_tx(priv, skb);
> >  	if (dma_mapping_error(dev, desc_data.dma_addr))
> > @@ -1050,18 +1103,10 @@ static int
> > mtk_star_netdev_start_xmit(struct sk_buff *skb,
> >  
> >  	desc_data.skb = skb;
> >  	desc_data.len = skb->len;
> > -
> > -	spin_lock_bh(&priv->lock);
> > 
> >  	mtk_star_ring_push_head_tx(ring, &desc_data);
> >  
> >  	netdev_sent_queue(ndev, skb->len);
> >  
> > -	if (mtk_star_ring_full(ring))
> > -		netif_stop_queue(ndev);
> 
> Are you stopping the queue in advance somewhere else now? Did you
> only
> test this with BQL enabled? Only place that stops the ring also
> prints
> a loud warning now AFAICS..
No.

We modify the ring full condition, and will not invoke netif_stop_queue
if queue is already stopped.
Test pass no matter whether BQL is enabled or disabled.

It's much safer to judge queue is full or not at the beginning of
start_xmit() to avoid invalid setting.
> 
> > -static void mtk_star_tx_complete_all(struct mtk_star_priv *priv)
> > +static int mtk_star_tx_poll(struct napi_struct *napi, int budget)
> >  {
> > -	struct mtk_star_ring *ring = &priv->tx_ring;
> > -	struct net_device *ndev = priv->ndev;
> > -	int ret, pkts_compl, bytes_compl;
> > +	int ret, pkts_compl = 0, bytes_compl = 0, count = 0;
> > +	struct mtk_star_priv *priv;
> > +	struct mtk_star_ring *ring;
> > +	struct net_device *ndev;
> > +	unsigned long flags = 0;
> > +	unsigned int entry;
> >  	bool wake = false;
> >  
> > -	spin_lock(&priv->lock);
> > +	priv = container_of(napi, struct mtk_star_priv, tx_napi);
> > +	ndev = priv->ndev;
> >  
> > -	for (pkts_compl = 0, bytes_compl = 0;;
> > +	__netif_tx_lock_bh(netdev_get_tx_queue(priv->ndev, 0));
> 
> Do you really need to lock out the Tx while cleaning?
> 
> Drivers usually manage to implement concurrent Tx and cleanup with
> just
> a couple of memory barriers.
We'll simplify the lock handling in next send,
the lock should protect tx descriptor ring, which is accessed by xmit()
and tx_complete().
> 
> > +	ring = &priv->tx_ring;
> > +	entry = ring->tail;
> > +	for (pkts_compl = 0, bytes_compl = 0;
> > +	     (entry != ring->head) && (count < budget);
> 
> budget is not really relevant for Tx, you can clean the whole ring.
> netpoll will pass a budget of 0 to clean up rings.
OK, will fix in next send.
> 
> >  	     pkts_compl++, bytes_compl += ret, wake = true) {
> > -		if (!mtk_star_ring_descs_available(ring))
> > -			break;
> >  
> >  		ret = mtk_star_tx_complete_one(priv);
> >  		if (ret < 0)
> >  			break;
> > +		count++;
> > +		entry = ring->tail;
> >  	}
> >  
> > @@ -1196,7 +1258,7 @@ static const struct ethtool_ops
> > mtk_star_ethtool_ops = {
> >  	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
> >  };
> >  
> > -static int mtk_star_receive_packet(struct mtk_star_priv *priv)
> > +static int mtk_star_rx(struct mtk_star_priv *priv, int budget)
> >  {
> >  	struct mtk_star_ring *ring = &priv->rx_ring;
> >  	struct device *dev = mtk_star_get_dev(priv);
> > @@ -1204,107 +1266,86 @@ static int mtk_star_receive_packet(struct
> > mtk_star_priv *priv)
> >  	struct net_device *ndev = priv->ndev;
> >  	struct sk_buff *curr_skb, *new_skb;
> >  	dma_addr_t new_dma_addr;
> > -	int ret;
> > +	int ret, count = 0;
> >  
> > -	spin_lock(&priv->lock);
> > -	ret = mtk_star_ring_pop_tail(ring, &desc_data);
> > -	spin_unlock(&priv->lock);
> > -	if (ret)
> > -		return -1;
> > +	while (count < budget) {
> > +		ret = mtk_star_ring_pop_tail(ring, &desc_data);
> > +		if (ret)
> > +			return -1;
> > -static int mtk_star_process_rx(struct mtk_star_priv *priv, int
> > budget)
> > -{
> > -	int received, ret;
> > +		count++;
> >  
> > -	for (received = 0, ret = 0; received < budget && ret == 0;
> > received++)
> > -		ret = mtk_star_receive_packet(priv);
> > +		desc_data.len = skb_tailroom(new_skb);
> > +		desc_data.skb = new_skb;
> > +		mtk_star_ring_push_head_rx(ring, &desc_data);
> > +	}
> >  
> >  	mtk_star_dma_resume_rx(priv);
> 
> Again you can get a call with a budget of 0, not sure if it's okay to
> resume DMA in that case..
OK, we'll take it into consideration in next send.
> 
> > -	return received;
> > +	return count;
> >  }
> 
> 
Regards!
Biao
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
