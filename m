Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D3FC47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 18:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EC4520746
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 18:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZSQoofqw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xMhGv+FI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EC4520746
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHg8rAZEo7e07Uh6bX+djRAYHR3q1MnTUYZAIcQSG4A=; b=ZSQoofqwFpQUAL
	hf8RRs6Fy/4Th65pYI66mIUAgVntTthZnqevjSI2qbzqoTWi8ChxpD87Z+dk3sSly5uwrWfKuTch/
	r7vKMUWnhvsJECr6yy3SjpsXRPO3T60hAm7uOGpRIN4LgHuD8iPiyByt32FbkYsbhnH5JRb+PODr+
	WRHBASYjIy39b/cM2jqjJfc3S9yD5siU+8oc6GPx/Azsz1zY7x20MssTc0rBAggej/UBJUjo3Tl7R
	zUW4AxWFmaztfzwwhpOtFCJy2q/KpxNBBVCuwI9e4skLjvYEcxu3+gT5Z8BteFANSWbmj81rVz2zU
	6MYGLx4uZsl4xuTTAdQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW1wD-0002HY-3w; Tue, 05 May 2020 18:05:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW1w2-00027x-P8; Tue, 05 May 2020 18:04:52 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D052C206FA;
 Tue,  5 May 2020 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588701890;
 bh=gxQ9X4QqLM4ifn43Epi1xaqmsSAjK08ljpO1RMYITFA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xMhGv+FIQKSRyxGwUiJ/AsRgse+wPElZYeTjqa7uJjSd6RYitHwXt7qkr1Lty6+TN
 /lSppEHghJ7X8pJhajXeQR+bP6XEDHSOGnolzpfBR3Sz8lqKXTOL1eQqY3pAdjxmLj
 DY3NaZqP2B5dpznzKE/mwncbic5KUnoURX5rWoKY=
Date: Tue, 5 May 2020 11:04:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
Message-ID: <20200505110447.2404985c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200505140231.16600-7-brgl@bgdev.pl>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_110450_858305_34342DE0 
X-CRM114-Status: GOOD (  20.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue,  5 May 2020 16:02:26 +0200 Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This adds the driver for the MediaTek Ethernet MAC used on the MT8* SoC
> family. For now we only support full-duplex.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

> +#define MTK_MAC_VERSION				"1.0"

Please don't add driver versions, we're removing those from networking
drivers.

> +/* Represents the actual structure of descriptors used by the MAC. We can
> + * reuse the same structure for both TX and RX - the layout is the same, only
> + * the flags differ slightly.
> + */
> +struct mtk_mac_ring_desc {
> +	/* Contains both the status flags as well as packet length. */
> +	u32 status;
> +	u32 data_ptr;
> +	u32 vtag;
> +	u32 reserved;
> +} __aligned(4) __packed;

It will be aligned to 4, because the members are all 4B. And there is
no possibility of holes. You can safely remove those attrs.

> +static int mtk_mac_ring_pop_tail(struct mtk_mac_ring *ring,
> +				 struct mtk_mac_ring_desc_data *desc_data)
> +{
> +	struct mtk_mac_ring_desc *desc = &ring->descs[ring->tail];
> +	unsigned int status;
> +
> +	dma_rmb();

This should be after desc->status read, probably.

> +	status = desc->status;
> +
> +	if (!(status & MTK_MAC_DESC_BIT_COWN))
> +		return -1;
> +
> +	desc_data->len = status & MTK_MAC_DESC_MSK_LEN;
> +	desc_data->flags = status & ~MTK_MAC_DESC_MSK_LEN;
> +	desc_data->dma_addr = desc->data_ptr;
> +	desc_data->skb = ring->skbs[ring->tail];
> +
> +	desc->data_ptr = 0;
> +	desc->status = MTK_MAC_DESC_BIT_COWN;
> +	if (status & MTK_MAC_DESC_BIT_EOR)
> +		desc->status |= MTK_MAC_DESC_BIT_EOR;
> +
> +	dma_wmb();

What is this separating?

> +	ring->tail = (ring->tail + 1) % MTK_MAC_RING_NUM_DESCS;
> +	ring->count--;
> +
> +	return 0;
> +}
> +
> +static void mtk_mac_ring_push_head(struct mtk_mac_ring *ring,
> +				   struct mtk_mac_ring_desc_data *desc_data,
> +				   unsigned int flags)
> +{
> +	struct mtk_mac_ring_desc *desc = &ring->descs[ring->head];
> +	unsigned int status;
> +
> +	dma_rmb();

What's this barrier separating?

> +	status = desc->status;
> +
> +	ring->skbs[ring->head] = desc_data->skb;
> +	desc->data_ptr = desc_data->dma_addr;
> +
> +	status |= desc_data->len;
> +	if (flags)
> +		status |= flags;
> +	desc->status = status;
> +
> +	dma_wmb();
> +	desc->status &= ~MTK_MAC_DESC_BIT_COWN;
> +
> +	ring->head = (ring->head + 1) % MTK_MAC_RING_NUM_DESCS;
> +	ring->count++;
> +}

> +/* All processing for TX and RX happens in the napi poll callback. */
> +static irqreturn_t mtk_mac_handle_irq(int irq, void *data)
> +{
> +	struct mtk_mac_priv *priv;
> +	struct net_device *ndev;
> +	unsigned int status;
> +
> +	ndev = data;
> +	priv = netdev_priv(ndev);
> +
> +	if (netif_running(ndev)) {
> +		mtk_mac_intr_mask_all(priv);
> +		status = mtk_mac_intr_read_and_clear(priv);
> +
> +		/* RX Complete */
> +		if (status & MTK_MAC_BIT_INT_STS_FNRC)
> +			napi_schedule(&priv->napi);
> +
> +		/* TX Complete */
> +		if (status & MTK_MAC_BIT_INT_STS_TNTC)
> +			schedule_work(&priv->tx_work);
> +
> +		/* One of the counter reached 0x8000000 */
> +		if (status & MTK_MAC_REG_INT_STS_MIB_CNT_TH) {
> +			mtk_mac_update_stats(priv);
> +			mtk_mac_reset_counters(priv);
> +		}
> +
> +		mtk_mac_intr_unmask_all(priv);

Why do you unmask all IRQs here? The usual way to operate is to leave
TX and RX IRQs masked until NAPI finishes.

> +	}
> +
> +	return IRQ_HANDLED;
> +}

> +static int mtk_mac_enable(struct net_device *ndev)
> +{
> +	/* Reset all counters */
> +	mtk_mac_reset_counters(priv);

This doesn't reset the counters to zero, right?

> +	/* Enable Hash Table BIST and reset it */
> +	regmap_update_bits(priv->regs, MTK_MAC_REG_HASH_CTRL,
> +			   MTK_MAC_BIT_HASH_CTRL_BIST_EN,
> +			   MTK_MAC_BIT_HASH_CTRL_BIST_EN);

> +}
> +
> +static void mtk_mac_disable(struct net_device *ndev)
> +{
> +	struct mtk_mac_priv *priv = netdev_priv(ndev);
> +
> +	netif_stop_queue(ndev);
> +	napi_disable(&priv->napi);
> +	mtk_mac_intr_mask_all(priv);
> +	mtk_mac_dma_disable(priv);
> +	mtk_mac_intr_read_and_clear(priv);
> +	phy_stop(priv->phydev);
> +	phy_disconnect(priv->phydev);
> +	free_irq(ndev->irq, ndev);
> +	mtk_mac_free_rx_skbs(ndev);
> +	mtk_mac_free_tx_skbs(ndev);
> +}

> +static int mtk_mac_netdev_start_xmit(struct sk_buff *skb,
> +				     struct net_device *ndev)
> +{
> +	struct mtk_mac_priv *priv = netdev_priv(ndev);
> +	struct mtk_mac_ring *ring = &priv->tx_ring;
> +	struct device *dev = mtk_mac_get_dev(priv);
> +	struct mtk_mac_ring_desc_data desc_data;
> +
> +	if (skb->len > MTK_MAC_MAX_FRAME_SIZE)
> +		goto err_drop_packet;

This should never happen if you set mtu right, you can drop it.

> +	desc_data.dma_addr = mtk_mac_dma_map_tx(priv, skb);
> +	if (dma_mapping_error(dev, desc_data.dma_addr))
> +		goto err_drop_packet;
> +
> +	desc_data.skb = skb;
> +	desc_data.len = skb->len;
> +
> +	mtk_mac_lock(priv);
> +	mtk_mac_ring_push_head_tx(ring, &desc_data);
> +
> +	if (mtk_mac_ring_full(ring))
> +		netif_stop_queue(ndev);
> +	mtk_mac_unlock(priv);
> +
> +	mtk_mac_dma_resume_tx(priv);
> +
> +	return NETDEV_TX_OK;
> +
> +err_drop_packet:
> +	dev_kfree_skb(skb);
> +	ndev->stats.tx_dropped++;
> +	return NETDEV_TX_BUSY;
> +}

> +static void mtk_mac_tx_work(struct work_struct *work)
> +{
> +	struct mtk_mac_priv *priv;
> +	struct mtk_mac_ring *ring;
> +	struct net_device *ndev;
> +	bool wake = false;
> +	int ret;
> +
> +	priv = container_of(work, struct mtk_mac_priv, tx_work);
> +	ndev = mtk_mac_get_netdev(priv);
> +	ring = &priv->tx_ring;
> +
> +	for (;;) {
> +		mtk_mac_lock(priv);
> +
> +		if (!mtk_mac_ring_descs_available(ring)) {
> +			mtk_mac_unlock(priv);
> +			break;
> +		}
> +
> +		ret = mtk_mac_tx_complete(priv);
> +		mtk_mac_unlock(priv);
> +		if (ret)
> +			break;
> +
> +		wake = true;
> +	}
> +
> +	if (wake)
> +		netif_wake_queue(ndev);

This looks racy, if the TX path runs in parallel the queue may have
already been filled up at the point you wake it up.

> +}

Why do you clean the TX ring from a work rather than from the NAPI
context?

> +static void mtk_mac_set_rx_mode(struct net_device *ndev)
> +{
> +	struct mtk_mac_priv *priv = netdev_priv(ndev);
> +	struct netdev_hw_addr *hw_addr;
> +	unsigned int hash_addr, i;
> +
> +	if (ndev->flags & IFF_PROMISC) {
> +		regmap_update_bits(priv->regs, MTK_MAC_REG_ARL_CFG,
> +				   MTK_MAC_BIT_ARL_CFG_MISC_MODE,
> +				   MTK_MAC_BIT_ARL_CFG_MISC_MODE);
> +	} else if (netdev_mc_count(ndev) > MTK_MAC_HASHTABLE_MC_LIMIT ||
> +		   ndev->flags & IFF_ALLMULTI) {
> +		for (i = 0; i < MTK_MAC_HASHTABLE_SIZE_MAX; i++)
> +			mtk_mac_set_hashbit(priv, i);
> +	} else {
> +		netdev_for_each_mc_addr(hw_addr, ndev) {
> +			hash_addr = (hw_addr->addr[0] & 0x01) << 8;
> +			hash_addr += hw_addr->addr[5];
> +			mtk_mac_set_hashbit(priv, hash_addr);

Hm, are the hash bits cleared when address is removed?

> +		}
> +	}
> +}

> +static int mtk_mac_receive_packet(struct mtk_mac_priv *priv)
> +{
> +	struct net_device *ndev = mtk_mac_get_netdev(priv);
> +	struct mtk_mac_ring *ring = &priv->rx_ring;
> +	struct device *dev = mtk_mac_get_dev(priv);
> +	struct mtk_mac_ring_desc_data desc_data;
> +	struct sk_buff *new_skb;
> +	int ret;
> +
> +	mtk_mac_lock(priv);
> +	ret = mtk_mac_ring_pop_tail(ring, &desc_data);
> +	mtk_mac_unlock(priv);
> +	if (ret)
> +		return -1;
> +
> +	mtk_mac_dma_unmap_rx(priv, &desc_data);
> +
> +	if ((desc_data.flags & MTK_MAC_DESC_BIT_RX_CRCE) ||
> +	    (desc_data.flags & MTK_MAC_DESC_BIT_RX_OSIZE)) {
> +		/* Error packet -> drop and reuse skb. */
> +		new_skb = desc_data.skb;
> +		goto map_skb;
> +	}
> +
> +	new_skb = mtk_mac_alloc_skb(ndev);
> +	if (!new_skb) {
> +		netdev_err(ndev, "out of memory for skb\n");

No need for printing, kernel will complain loudly about oom.

> +		ndev->stats.rx_dropped++;
> +		new_skb = desc_data.skb;
> +		goto map_skb;
> +	}
> +
> +	skb_put(desc_data.skb, desc_data.len);
> +	desc_data.skb->ip_summed = CHECKSUM_NONE;
> +	desc_data.skb->protocol = eth_type_trans(desc_data.skb, ndev);
> +	desc_data.skb->dev = ndev;
> +	netif_receive_skb(desc_data.skb);
> +
> +map_skb:
> +	desc_data.dma_addr = mtk_mac_dma_map_rx(priv, new_skb);
> +	if (dma_mapping_error(dev, desc_data.dma_addr)) {
> +		dev_kfree_skb(new_skb);
> +		netdev_err(ndev, "DMA mapping error of RX descriptor\n");
> +		return -ENOMEM;

In this case nothing will ever replenish the RX ring right? If we hit
this condition 128 times the ring will be empty?

> +	}
> +
> +	desc_data.len = skb_tailroom(new_skb);
> +	desc_data.skb = new_skb;
> +
> +	mtk_mac_lock(priv);
> +	mtk_mac_ring_push_head_rx(ring, &desc_data);
> +	mtk_mac_unlock(priv);
> +
> +	return 0;
> +}
> +
> +static int mtk_mac_process_rx(struct mtk_mac_priv *priv, int budget)
> +{
> +	int received, ret;
> +
> +	for (received = 0, ret = 0; received < budget && ret == 0; received++)
> +		ret = mtk_mac_receive_packet(priv);
> +
> +	mtk_mac_dma_resume_rx(priv);
> +
> +	return received;
> +}

> +static int mtk_mac_probe(struct platform_device *pdev)
> +{

> +	mtk_mac_set_mode_rmii(priv);
> +
> +	dev->coherent_dma_mask = DMA_BIT_MASK(32);
> +	dev->dma_mask = &dev->coherent_dma_mask;

Why set this manually and no thru dma_set_mask_and_coherent()?

> +	priv->ring_base = dmam_alloc_coherent(dev, MTK_MAC_DMA_SIZE,
> +					      &priv->dma_addr,
> +					      GFP_KERNEL | GFP_DMA);
> +	if (!priv->ring_base)
> +		return -ENOMEM;
> +
> +	mtk_mac_nic_disable_pd(priv);
> +	mtk_mac_init_config(priv);
> +
> +	ret = mtk_mac_mdio_init(ndev);
> +	if (ret)
> +		return ret;
> +
> +	ret = eth_platform_get_mac_address(dev, ndev->dev_addr);
> +	if (ret || !is_valid_ether_addr(ndev->dev_addr)) {
> +		random_ether_addr(ndev->dev_addr);
> +		ndev->addr_assign_type = NET_ADDR_RANDOM;

eth_hw_addr_random()

> +	}
> +
> +	ndev->netdev_ops = &mtk_mac_netdev_ops;
> +	ndev->ethtool_ops = &mtk_mac_ethtool_ops;
> +
> +	netif_napi_add(ndev, &priv->napi, mtk_mac_poll, MTK_MAC_NAPI_WEIGHT);
> +
> +	return devm_register_netdev(ndev);
> +}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
