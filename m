Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C472C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 04:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baoqy424p7XfN97tArls74tCTDhX71/K3R9N79wrOv8=; b=Giv/M9AJpucrYWFZPdkkmcjpaP
	7h5hbyptYGJHcgHqZccX2S4si1j8L2Q0pypJ9vNJxnLy4hpfskpCKoyyM3ZoMpga77sZpbL9Sbxrg
	kl2aGlw+JuA5tsSPYRriKYB0YZ++qb/oftcxHoyTv/hdBB5LK2Y0Wrpj7poQX+PeTwtmuXMG1fEeH
	AEjJd1BSA7andm0eOccoFCL9wV/sCTlRmpBN6jmBAdq8TBAGbPYU35ZO8dj+9oZfcU9Z8qgPC9X9m
	VOQ7UIO6vJ5nefpiTmtoybtEMsm+X0urAzjIUWBbuCxXQI100w8/cCxPSZAzAJ/TPhmIAS4t+CgBk
	KiatcH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4b1r-000Cpi-Cy; Fri, 24 Jun 2022 04:34:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4b1g-000Cp2-E0; Fri, 24 Jun 2022 04:34:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 10868620F8;
	Fri, 24 Jun 2022 04:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79368C34114;
	Fri, 24 Jun 2022 04:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656045273;
	bh=IZ5ZDn+9JIMGyBmDD2iT5ZTpxrtT5hVkr4pA6eYPL1o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WPhKfR9xr4x2sOntt3FQPKFrIn/4f4ExdSawkL52JIm1ImarWI5KFECBHQe9mh/gu
	 PWpPiGfWpkzOhzd2/2smGxrjw8D786MLMSJbmg7Xtv/bgDVT01DVEdic8Q3W2f+ijb
	 rzYnZNxrfX1NjTEdqFG9YSppTtnwqNKZj49OLffBrpFx1YAgAwWd40XTk7tCbJkGHa
	 lCLlRcQgEFBHQNgIHvQ3Gs4hZeeUYLkX6dmvp9oTkUmMvcRibr4qHTr6Cc4lfqwL/R
	 Jf1E2it522tpqTUBmZAj28ZS6Ans+02GRKtGKdn0qIiBpec+UR8Gf9mZkZzDoNa8RR
	 poad5oYVZbaAw==
Date: Thu, 23 Jun 2022 21:34:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>,
 Felix Fietkau <nbd@nbd.name>, "John Crispin" <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Yinghua Pan
 <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>
Subject: Re: [PATCH net-next v3 09/10] net: ethernet: mtk-star-emac:
 separate tx/rx handling with two NAPIs
Message-ID: <20220623213431.23528544@kernel.org>
In-Reply-To: <20220622090545.23612-10-biao.huang@mediatek.com>
References: <20220622090545.23612-1-biao.huang@mediatek.com>
	<20220622090545.23612-10-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_213436_594675_7DE72B20 
X-CRM114-Status: GOOD (  16.88  )
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

On Wed, 22 Jun 2022 17:05:44 +0800 Biao Huang wrote:
> +	if (rx || tx) {
> +		spin_lock_irqsave(&priv->lock, flags);
> +		/* mask Rx and TX Complete interrupt */
> +		mtk_star_disable_dma_irq(priv, rx, tx);
> +		spin_unlock_irqrestore(&priv->lock, flags);

You do _irqsave / _irqrestore here

> +		if (rx)
> +			__napi_schedule_irqoff(&priv->rx_napi);
> +		if (tx)
> +			__napi_schedule_irqoff(&priv->tx_napi);

Yet assume _irqoff here.

So can this be run from non-IRQ context or not?

> -	if (mtk_star_ring_full(ring))
> +	if (unlikely(mtk_star_tx_ring_avail(ring) < MAX_SKB_FRAGS + 1))
>  		netif_stop_queue(ndev);

Please look around other drivers (like ixgbe) and copy the way they
handle safe stopping of the queues. You need to add some barriers and
re-check after disabling.

> -	spin_unlock_bh(&priv->lock);
> -
>  	mtk_star_dma_resume_tx(priv);
>  
>  	return NETDEV_TX_OK;


> +	while ((entry != head) && (count < MTK_STAR_RING_NUM_DESCS - 1)) {
>  

Parenthesis unnecessary, so is the empty line after the while ().

>  		ret = mtk_star_tx_complete_one(priv);
>  		if (ret < 0)
>  			break;
> +
> +		count++;
> +		pkts_compl++;
> +		bytes_compl += ret;
> +		entry = ring->tail;
>  	}
>  
> +	__netif_tx_lock_bh(netdev_get_tx_queue(priv->ndev, 0));
>  	netdev_completed_queue(ndev, pkts_compl, bytes_compl);
> +	__netif_tx_unlock_bh(netdev_get_tx_queue(priv->ndev, 0));

what are you taking this lock for?

> -	if (wake && netif_queue_stopped(ndev))
> +	if (unlikely(netif_queue_stopped(ndev)) &&
> +	    (mtk_star_tx_ring_avail(ring) > MTK_STAR_TX_THRESH))
>  		netif_wake_queue(ndev);
>  
> -	spin_unlock(&priv->lock);
> +	if (napi_complete(napi)) {
> +		spin_lock_irqsave(&priv->lock, flags);
> +		mtk_star_enable_dma_irq(priv, false, true);
> +		spin_unlock_irqrestore(&priv->lock, flags);
> +	}
> +
> +	return 0;
>  }

> @@ -1475,6 +1514,7 @@ static int mtk_star_set_timing(struct mtk_star_priv *priv)
>  
>  	return regmap_write(priv->regs, MTK_STAR_REG_TEST0, delay_val);
>  }
> +
>  static int mtk_star_probe(struct platform_device *pdev)
>  {
>  	struct device_node *of_node;

spurious whitespace change

