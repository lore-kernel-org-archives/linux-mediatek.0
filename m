Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB943C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LulmYrZUN7lkghAcE9Wui09yeAVc9eGaXV0QR0ha8g=; b=eb+gHpjNiladGdOniYp9Cw/12d
	iUpbgaLWWPPd5XhRmmcwYMjp6S4GYwlA8nbQABVqU/QNYeh7mStJfxRP9QwdJqmB7CI8bb3K4AOnf
	0WTrzdp8Jve7G0FtjIKS0PSnro3wJcsaFvbwY93c79rCRt38gBL9F/cEK9ZxqKt3/01Y4yaGDmcg9
	WfeAsAkJ8wNX2g3xlFORoX6xV1TGRcNNfaGDHY/Lakek9hLI0OXS/itQqyTTucOzBpSFWGuMKRZ4+
	OFCI5DQvF1dlsnou9A4nMKm9qKak8mS6n5i8x4Ta3ZvfcVaHme9qSqUka3QPRp3SsnEx23q40aYdi
	suhAyuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25aD-00FKWM-8E; Mon, 05 Dec 2022 07:08:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25a9-00FKSe-2T
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 07:08:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D79860F88;
	Mon,  5 Dec 2022 07:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE76BC433D6;
	Mon,  5 Dec 2022 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670224083;
	bh=xaI8ieGkNVAf5EJVbnS5sOjm4WQ5ODJeLJQADAuVQX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPw92dDrNNI0Z8iydBPT9xBzg1BJCX2TW/mLVdFP3v31qcp9KumxxSG+L8drhjuVj
	 a2v8o1/ZHxmLoQcATOF4zyY+7qrG9Las7OK4SoqLv/8ivr1JqTmx9GNl/51PSfLpeV
	 mqWqMUII/i2i9Z+0wWn5eMhxwuJfD8keDK5foO6V7mXIq1nr5CaoaTDwZ2G9h2WD4I
	 P+TsFlIioCOOvOghUNF3BNjMNjJTsDrAJc1MrbNNK5qTnQAD+sDj7WzO0pOp7Pnqdn
	 LTTA8HaVHHJbI5PoWKAP7yEV9EgSbUQ64sUdFjt+dNZKZIhkUJW0RITyjwYr/WTvfZ
	 vmfBITKPm/8zA==
Date: Mon, 5 Dec 2022 09:07:59 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, sujuan.chen@mediatek.com,
	lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: add reset to
 rx_ring_setup callback
Message-ID: <Y42Yz2hhwk1Rw1hz@unreal>
References: <26fa16f2f212bff5edfdbe8a4f41dba7a132b0be.1670072570.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26fa16f2f212bff5edfdbe8a4f41dba7a132b0be.1670072570.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_230805_245272_D95B938C 
X-CRM114-Status: GOOD (  20.00  )
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

On Sat, Dec 03, 2022 at 02:06:30PM +0100, Lorenzo Bianconi wrote:
> Introduce reset parameter to mtk_wed_rx_ring_setup signature.
> This is a preliminary patch to add Wireless Ethernet Dispatcher reset
> support.

So please submit it as part the relevant series.

Thanks

> 
> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c  | 20 +++++++++++++-------
>  drivers/net/wireless/mediatek/mt76/dma.c |  2 +-
>  include/linux/soc/mediatek/mtk_wed.h     |  8 ++++----
>  3 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 6352abd4157e..b1ec3f353b66 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -1216,7 +1216,8 @@ mtk_wed_wdma_rx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
>  }
>  
>  static int
> -mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
> +mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
> +			   bool reset)
>  {
>  	u32 desc_size = sizeof(struct mtk_wdma_desc) * dev->hw->version;
>  	struct mtk_wed_ring *wdma;
> @@ -1225,8 +1226,8 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
>  		return -EINVAL;
>  
>  	wdma = &dev->tx_wdma[idx];
> -	if (mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE, desc_size,
> -			       true))
> +	if (!reset && mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE,
> +					 desc_size, true))
>  		return -ENOMEM;
>  
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_BASE,
> @@ -1236,6 +1237,9 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size)
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
>  
> +	if (reset)
> +		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
> +
>  	if (!idx)  {
>  		wed_w32(dev, MTK_WED_WDMA_RING_TX + MTK_WED_RING_OFS_BASE,
>  			wdma->desc_phys);
> @@ -1577,18 +1581,20 @@ mtk_wed_txfree_ring_setup(struct mtk_wed_device *dev, void __iomem *regs)
>  }
>  
>  static int
> -mtk_wed_rx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs)
> +mtk_wed_rx_ring_setup(struct mtk_wed_device *dev, int idx, void __iomem *regs,
> +		      bool reset)
>  {
>  	struct mtk_wed_ring *ring = &dev->rx_ring[idx];
>  
>  	if (WARN_ON(idx >= ARRAY_SIZE(dev->rx_ring)))
>  		return -EINVAL;
>  
> -	if (mtk_wed_ring_alloc(dev, ring, MTK_WED_RX_RING_SIZE,
> -			       sizeof(*ring->desc), false))
> +	if (!reset && mtk_wed_ring_alloc(dev, ring, MTK_WED_RX_RING_SIZE,
> +					 sizeof(*ring->desc), false))
>  		return -ENOMEM;
>  
> -	if (mtk_wed_wdma_tx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE))
> +	if (mtk_wed_wdma_tx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
> +				       reset))
>  		return -ENOMEM;
>  
>  	ring->reg_base = MTK_WED_RING_RX_DATA(idx);
> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
> index 3f8c0845fcca..f795548562f5 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -648,7 +648,7 @@ mt76_dma_wed_setup(struct mt76_dev *dev, struct mt76_queue *q)
>  			q->wed_regs = wed->txfree_ring.reg_base;
>  		break;
>  	case MT76_WED_Q_RX:
> -		ret = mtk_wed_device_rx_ring_setup(wed, ring, q->regs);
> +		ret = mtk_wed_device_rx_ring_setup(wed, ring, q->regs, false);
>  		if (!ret)
>  			q->wed_regs = wed->rx_ring[ring].reg_base;
>  		break;
> diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
> index beb190449704..a0746d4aec20 100644
> --- a/include/linux/soc/mediatek/mtk_wed.h
> +++ b/include/linux/soc/mediatek/mtk_wed.h
> @@ -160,7 +160,7 @@ struct mtk_wed_ops {
>  	int (*tx_ring_setup)(struct mtk_wed_device *dev, int ring,
>  			     void __iomem *regs, bool reset);
>  	int (*rx_ring_setup)(struct mtk_wed_device *dev, int ring,
> -			     void __iomem *regs);
> +			     void __iomem *regs, bool reset);
>  	int (*txfree_ring_setup)(struct mtk_wed_device *dev,
>  				 void __iomem *regs);
>  	int (*msg_update)(struct mtk_wed_device *dev, int cmd_id,
> @@ -228,8 +228,8 @@ mtk_wed_get_rx_capa(struct mtk_wed_device *dev)
>  	(_dev)->ops->irq_get(_dev, _mask)
>  #define mtk_wed_device_irq_set_mask(_dev, _mask) \
>  	(_dev)->ops->irq_set_mask(_dev, _mask)
> -#define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs) \
> -	(_dev)->ops->rx_ring_setup(_dev, _ring, _regs)
> +#define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs, _reset) \
> +	(_dev)->ops->rx_ring_setup(_dev, _ring, _regs, _reset)
>  #define mtk_wed_device_ppe_check(_dev, _skb, _reason, _hash) \
>  	(_dev)->ops->ppe_check(_dev, _skb, _reason, _hash)
>  #define mtk_wed_device_update_msg(_dev, _id, _msg, _len) \
> @@ -249,7 +249,7 @@ static inline bool mtk_wed_device_active(struct mtk_wed_device *dev)
>  #define mtk_wed_device_reg_write(_dev, _reg, _val) do {} while (0)
>  #define mtk_wed_device_irq_get(_dev, _mask) 0
>  #define mtk_wed_device_irq_set_mask(_dev, _mask) do {} while (0)
> -#define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs) -ENODEV
> +#define mtk_wed_device_rx_ring_setup(_dev, _ring, _regs, _reset) -ENODEV
>  #define mtk_wed_device_ppe_check(_dev, _skb, _reason, _hash)  do {} while (0)
>  #define mtk_wed_device_update_msg(_dev, _id, _msg, _len) -ENODEV
>  #define mtk_wed_device_stop(_dev) do {} while (0)
> -- 
> 2.38.1
> 

