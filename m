Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCC0C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nlt/G17aXBcIkxFBoshwvsk7eT7YHwzJ2xRtKm9wMgY=; b=EumaR8qSL6i4Xg
	n+lKNa7WPsHpHieiEm7GepfarJTlz+X2sFwMmZd/Ov23hEJSKiOLpgbKgXCYljowMmDnhROTOwNSX
	isGeo+TS4akh6sQDE+ZlJ5uZbaMRcMR80O6lXCFFCKAqoeK5TVCxs8lgZH47XHo9noHwonMXHAMKY
	1lSUkdTvIj16Oj2MaZiYpDp0oxvYubqFEO1x0PLinmCI9zQmfiVxuVrSY6PHnynAJ70leNPwlpANe
	6ey8bX7yAIqe9KwZjmQW12hIBn7/BX4emxesE7yzMdNJxXruiyBqc88yjjk9UWt2zxSd5LUiypzOy
	vqL+C/gCbjeuHAMCLHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDTR1-002lYn-Kx; Fri, 28 Jan 2022 15:45:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDTQp-002lWO-2c; Fri, 28 Jan 2022 15:45:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0E88B80D60;
 Fri, 28 Jan 2022 15:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27F4C340E0;
 Fri, 28 Jan 2022 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643384696;
 bh=tBLay+o+eLrzKqcv6juJyl5BpntLLfH1nmE4tQVkqOI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y/G5V8Pvgkh6qVfEMzR5GQbkaMA4nl/3Tx5R5Wbxt/AJbXHo3nyc8ivxe1gkQCgno
 a5PwXkKvRyTfJUAIYbswanYXF15XWDyUz0EXiwiFjPs+Nip2ykPYcbmvsR4hJPpF4a
 6+rJm15brN+3A8EY/3P8TgJq1c2N7UH6WQMCJjGSRdMoHCsWkhfixNTotVuwzROgLD
 pUF7dSFbOLtvtU3SLIhOzhwoDdjfYDowZy5ZfXwleqbPLbCA5PAC7YyaMRm6MvltCi
 IgqmQ3XuTcnuG/QyHE+QvqVQomBX3KaZiuiWkTYsUaDyNpu+911BswVX0L8hvXUEEr
 uoB4xjcPIFAvg==
Date: Fri, 28 Jan 2022 07:44:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Yinghua Pan
 <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>
Subject: Re: [PATCH net-next v2 9/9] net: ethernet: mtk-star-emac: separate
 tx/rx handling with two NAPIs
Message-ID: <20220128074454.46d0ca29@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <2bdb6c9b5ec90b6c606b7db8c13f8acb34910b36.camel@mediatek.com>
References: <20220127015857.9868-1-biao.huang@mediatek.com>
 <20220127015857.9868-10-biao.huang@mediatek.com>
 <20220127194338.01722b3c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <2bdb6c9b5ec90b6c606b7db8c13f8acb34910b36.camel@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_074459_442052_3FC5BBEE 
X-CRM114-Status: GOOD (  24.35  )
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

On Fri, 28 Jan 2022 15:05:27 +0800 Biao Huang wrote:
> > > + * Description : this is the driver interrupt service routine.
> > > + * it mainly handles:
> > > + *  1. tx complete interrupt for frame transmission.
> > > + *  2. rx complete interrupt for frame reception.
> > > + *  3. MAC Management Counter interrupt to avoid counter overflow.
> > >   */
> > >  static irqreturn_t mtk_star_handle_irq(int irq, void *data)
> > >  {
> > > -	struct mtk_star_priv *priv;
> > > -	struct net_device *ndev;
> > > +	struct net_device *ndev = data;
> > > +	struct mtk_star_priv *priv = netdev_priv(ndev);
> > > +	unsigned int intr_status = mtk_star_intr_ack_all(priv);
> > > +	unsigned long flags = 0;
> > > +
> > > +	if (intr_status & MTK_STAR_BIT_INT_STS_FNRC) {
> > > +		if (napi_schedule_prep(&priv->rx_napi)) {
> > > +			spin_lock_irqsave(&priv->lock, flags);
> > > +			/* mask Rx Complete interrupt */
> > > +			mtk_star_disable_dma_irq(priv, true, false);
> > > +			spin_unlock_irqrestore(&priv->lock, flags);
> > > +			__napi_schedule_irqoff(&priv->rx_napi);
> > > +		}
> > > +	}
> > >  
> > > -	ndev = data;
> > > -	priv = netdev_priv(ndev);
> > > +	if (intr_status & MTK_STAR_BIT_INT_STS_TNTC) {
> > > +		if (napi_schedule_prep(&priv->tx_napi)) {
> > > +			spin_lock_irqsave(&priv->lock, flags);
> > > +			/* mask Tx Complete interrupt */
> > > +			mtk_star_disable_dma_irq(priv, false, true);
> > > +			spin_unlock_irqrestore(&priv->lock, flags);
> > > +			__napi_schedule_irqoff(&priv->tx_napi);
> > > +		}
> > > +	}  
> > 
> > Seems a little wasteful to retake the same lock twice if two IRQ
> > sources fire at the same time.  
> The TX/RX irq control bits are in the same register,
> but they are triggered independently.
> So it seems necessary to protect the register
> access with a spin lock.

This is what I meant:

rx = (status & RX) && napi_schedule_prep(rx_napi);
tx = (status & TX) && napi_schedule_prep(tx_napi);

if (rx || tx) {
	spin_lock()
	disable_irq(priv, rx, tx);	
	spin_unlock();
	if (rx)
		__napi_schedule_irqoff(rx_napi)
	if (tx)
		__napi_schedule_irqoff(tx_napi)
}

> > >  	desc_data.dma_addr = mtk_star_dma_map_tx(priv, skb);
> > >  	if (dma_mapping_error(dev, desc_data.dma_addr))
> > > @@ -1050,18 +1103,10 @@ static int
> > > mtk_star_netdev_start_xmit(struct sk_buff *skb,
> > >  
> > >  	desc_data.skb = skb;
> > >  	desc_data.len = skb->len;
> > > -
> > > -	spin_lock_bh(&priv->lock);
> > > 
> > >  	mtk_star_ring_push_head_tx(ring, &desc_data);
> > >  
> > >  	netdev_sent_queue(ndev, skb->len);
> > >  
> > > -	if (mtk_star_ring_full(ring))
> > > -		netif_stop_queue(ndev);  
> > 
> > Are you stopping the queue in advance somewhere else now? Did you
> > only
> > test this with BQL enabled? Only place that stops the ring also
> > prints
> > a loud warning now AFAICS..  
> No.
> 
> We modify the ring full condition, and will not invoke netif_stop_queue
> if queue is already stopped.

I don't understand what you're saying.

> Test pass no matter whether BQL is enabled or disabled.
> 
> It's much safer to judge queue is full or not at the beginning of
> start_xmit() to avoid invalid setting.

Drivers are expected to stop their queues at the end of xmit routine if
the ring can't accommodate another frame. It's more efficient to stop
the queues early than have to put skbs already dequeued from the qdisc
layer back into the qdiscs.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
