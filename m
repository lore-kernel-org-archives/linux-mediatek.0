Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488E7CCA480
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GzcFi+vPIgQomELE8X8bD71ocK65f+Pq/zDznCpD/A=; b=U8nBdgXvqy1jW89/dtThqMQgTk
	EvXWIR2BjUz0D2nHe7obyc4qo9qqkPAf44LdIKSsoDrnrjtbO08XYxYx15PY1X8SXJow+DuvZWrRB
	H2YBz1E0erY/Zp+bDZyXWEaO1gGhcxv2JjPOtqcaOyhVg2Jtv+YtMkwZsGJ+cP5hNs20mfKaROVtP
	PtoeWQe9SpSC69QJxQmUFCLat94/H3TgGvnzUhfcsHCC+E9xO4gvojCQe4lQB1J7ojiTKpzzo1x5r
	achTw5WKBB/rZQ1ai1uAod/pVciJuAdVFJI2148r2x7J6L/qkKYgc4wwOyztRrda+GN2sPbV038ZY
	ld0vL5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCsg-009eQ4-6w; Tue, 12 Jul 2022 10:12:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCsd-009eMm-4i
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 10:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657620753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9GzcFi+vPIgQomELE8X8bD71ocK65f+Pq/zDznCpD/A=;
	b=T4JRpY7LR0E+L3L61MHjvF3wktLF7yS9Nvqw2NSc7oVnDQ0kLfivGCxpgld9SN6OfuGoc9
	2aPLcAIrAur4hOEeqcVBIPqpO82QzDocHN55zGzaDlXKJKqsUSI6zHdCFSIsO/ie3e+SF9
	9kRbz/yOlOcfFPGBTnNW5+6eJ8MylaA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-bAGNprEEMG2ftdxr7x_5Wg-1; Tue, 12 Jul 2022 06:12:33 -0400
X-MC-Unique: bAGNprEEMG2ftdxr7x_5Wg-1
Received: by mail-wr1-f72.google.com with SMTP id l11-20020adfbd8b000000b0021d754b84c5so1274326wrh.17
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 03:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9GzcFi+vPIgQomELE8X8bD71ocK65f+Pq/zDznCpD/A=;
        b=5+WqI14g984b/GrY3JIRCgztZDPz5ucX1mhAoFoJXL2fMzEOp4n5Ow6DMejsCxFecX
         ucwNMnG0oUy8sf69kitwMzIGUwnPWslAOHod8vZLn57+qg0ksUt8Z1snlnMM+PTOvC/f
         3Fitz+vbIxTz7oX6PkupISG9+MLbuXMGpsJeb75vkLh20n8aoWB0qjbtnrlS6Vz0TzYO
         Kmqk65q4PLk0IG+ZtBwsWylZ7lt4jNTthljliL7zfurM8cZQmZ6S0PwuMJZ5Rftk1f+Z
         SnsRP3foM7hsP/fIJsiqePwQySE1B7X1dtpr2l6pAYhLNE3j2BYN0GOZDiqgTowP4P5u
         kpJQ==
X-Gm-Message-State: AJIora9aoeF8xKWnkMysid3Fd4itc477zDgDi5e/Eka3CfIDeEtIFC2e
	9vMMOhg0YCaXAZ71qfCkr8xPquK+Z/NVmjXLjqeUeX0bkpNrOZMS8AshQUL7/r2BYDv9AjkfIyK
	1QNgvbOegy131IhDH33rITD5SR2xbOTsu
X-Received: by 2002:adf:f14d:0:b0:21d:ad67:c2e0 with SMTP id y13-20020adff14d000000b0021dad67c2e0mr4957633wro.247.1657620751058;
        Tue, 12 Jul 2022 03:12:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usRquEy8dwdRl0HJMJ8j+JYqzqJnTapkyaV2RE+c1r9tWr5ZRFbOxvkYpWLP2w1063WeSpwA==
X-Received: by 2002:adf:f14d:0:b0:21d:ad67:c2e0 with SMTP id y13-20020adff14d000000b0021dad67c2e0mr4957606wro.247.1657620750800;
        Tue, 12 Jul 2022 03:12:30 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-238.dyn.eolo.it. [146.241.97.238])
        by smtp.gmail.com with ESMTPSA id v5-20020a7bcb45000000b0039c811077d3sm8848135wmj.22.2022.07.12.03.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 03:12:30 -0700 (PDT)
Message-ID: <9c0b3cef3029ea71f7802eab6214062aad48d509.camel@redhat.com>
Subject: Re: [PATCH net-next 2/4] net: ethernet: mtk_eth_soc: add basic XDP
 support
From: Paolo Abeni <pabeni@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org,  ilias.apalodimas@linaro.org,
 lorenzo.bianconi@redhat.com, jbrouer@redhat.com
Date: Tue, 12 Jul 2022 12:12:28 +0200
In-Reply-To: <dc3235fd20b74f78f4f42550ca7513063269a752.1657381057.git.lorenzo@kernel.org>
References: <cover.1657381056.git.lorenzo@kernel.org>
	 <dc3235fd20b74f78f4f42550ca7513063269a752.1657381057.git.lorenzo@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_031235_295509_1BECBA2D 
X-CRM114-Status: GOOD (  23.96  )
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

On Sat, 2022-07-09 at 17:48 +0200, Lorenzo Bianconi wrote:
> Introduce basic XDP support to mtk_eth_soc driver.
> Supported XDP verdicts:
> - XDP_PASS
> - XDP_DROP
> - XDP_REDIRECT
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 146 +++++++++++++++++---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |   2 +
>  2 files changed, 130 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 9a92d602ebd5..3b583abb599d 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -1494,22 +1494,55 @@ static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
>  		skb_free_frag(data);
>  }
>  
> +static u32 mtk_xdp_run(struct mtk_rx_ring *ring, struct bpf_prog *prog,
> +		       struct xdp_buff *xdp, struct net_device *dev)
> +{
> +	u32 act = XDP_PASS;
> +
> +	if (!prog)
> +		return XDP_PASS;
> +
> +	act = bpf_prog_run_xdp(prog, xdp);
> +	switch (act) {
> +	case XDP_PASS:
> +		return XDP_PASS;
> +	case XDP_REDIRECT:
> +		if (unlikely(xdp_do_redirect(dev, xdp, prog)))
> +			break;
> +		return XDP_REDIRECT;
> +	default:
> +		bpf_warn_invalid_xdp_action(dev, prog, act);
> +		fallthrough;
> +	case XDP_ABORTED:
> +		trace_xdp_exception(dev, prog, act);
> +		fallthrough;
> +	case XDP_DROP:
> +		break;
> +	}
> +
> +	page_pool_put_full_page(ring->page_pool,
> +				virt_to_head_page(xdp->data), true);
> +	return XDP_DROP;
> +}
> +
>  static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  		       struct mtk_eth *eth)
>  {
> +	struct bpf_prog *prog = READ_ONCE(eth->prog);
>  	struct dim_sample dim_sample = {};
>  	struct mtk_rx_ring *ring;
>  	int idx;
>  	struct sk_buff *skb;
>  	u8 *data, *new_data;
>  	struct mtk_rx_dma_v2 *rxd, trxd;
> +	bool xdp_do_redirect = false;
>  	int done = 0, bytes = 0;
>  
>  	while (done < budget) {
>  		unsigned int pktlen, *rxdcsum;
> -		u32 hash, reason, reserve_len;
>  		struct net_device *netdev;
>  		dma_addr_t dma_addr;
> +		u32 hash, reason;
>  		int mac = 0;
>  
>  		ring = mtk_get_rx_ring(eth);
> @@ -1539,8 +1572,14 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  		if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
>  			goto release_desc;
>  
> +		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
> +
>  		/* alloc new buffer */
>  		if (ring->page_pool) {
> +			struct page *page = virt_to_head_page(data);
> +			struct xdp_buff xdp;
> +			u32 ret;
> +
>  			new_data = mtk_page_pool_get_buff(ring->page_pool,
>  							  &dma_addr,
>  							  GFP_ATOMIC);
> @@ -1548,6 +1587,34 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  				netdev->stats.rx_dropped++;
>  				goto release_desc;
>  			}
> +
> +			dma_sync_single_for_cpu(eth->dma_dev,
> +				page_pool_get_dma_addr(page) + MTK_PP_HEADROOM,
> +				pktlen, page_pool_get_dma_dir(ring->page_pool));
> +
> +			xdp_init_buff(&xdp, PAGE_SIZE, &ring->xdp_q);
> +			xdp_prepare_buff(&xdp, data, MTK_PP_HEADROOM, pktlen,
> +					 false);
> +			xdp_buff_clear_frags_flag(&xdp);
> +
> +			ret = mtk_xdp_run(ring, prog, &xdp, netdev);
> +			if (ret != XDP_PASS) {
> +				if (ret == XDP_REDIRECT)
> +					xdp_do_redirect = true;
> +				goto skip_rx;
> +			}
> +
> +			skb = build_skb(data, PAGE_SIZE);
> +			if (unlikely(!skb)) {
> +				page_pool_put_full_page(ring->page_pool,
> +							page, true);
> +				netdev->stats.rx_dropped++;
> +				goto skip_rx;
> +			}
> +
> +			skb_reserve(skb, xdp.data - xdp.data_hard_start);
> +			skb_put(skb, xdp.data_end - xdp.data);
> +			skb_mark_for_recycle(skb);
>  		} else {
>  			if (ring->frag_size <= PAGE_SIZE)
>  				new_data = napi_alloc_frag(ring->frag_size);
> @@ -1571,27 +1638,20 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  
>  			dma_unmap_single(eth->dma_dev, trxd.rxd1,
>  					 ring->buf_size, DMA_FROM_DEVICE);
> -		}
>  
> -		/* receive data */
> -		skb = build_skb(data, ring->frag_size);
> -		if (unlikely(!skb)) {
> -			mtk_rx_put_buff(ring, data, true);
> -			netdev->stats.rx_dropped++;
> -			goto skip_rx;
> -		}
> +			skb = build_skb(data, ring->frag_size);
> +			if (unlikely(!skb)) {
> +				netdev->stats.rx_dropped++;
> +				skb_free_frag(data);
> +				goto skip_rx;
> +			}
>  
> -		if (ring->page_pool) {
> -			reserve_len = MTK_PP_HEADROOM;
> -			skb_mark_for_recycle(skb);
> -		} else {
> -			reserve_len = NET_SKB_PAD + NET_IP_ALIGN;
> +			skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
> +			skb_put(skb, pktlen);
>  		}
> -		skb_reserve(skb, reserve_len);
>  
> -		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
>  		skb->dev = netdev;
> -		skb_put(skb, pktlen);
> +		bytes += skb->len;
>  
>  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
>  			rxdcsum = &trxd.rxd3;
> @@ -1603,7 +1663,6 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  		else
>  			skb_checksum_none_assert(skb);
>  		skb->protocol = eth_type_trans(skb, netdev);
> -		bytes += pktlen;
>  
>  		hash = trxd.rxd4 & MTK_RXD4_FOE_ENTRY;
>  		if (hash != MTK_RXD4_FOE_ENTRY) {
> @@ -1666,6 +1725,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  			  &dim_sample);
>  	net_dim(&eth->rx_dim, dim_sample);
>  
> +	if (prog && xdp_do_redirect)
> +		xdp_do_flush_map();
> +
>  	return done;
>  }
>  
> @@ -2750,6 +2812,48 @@ static int mtk_stop(struct net_device *dev)
>  	return 0;
>  }
>  
> +static int mtk_xdp_setup(struct net_device *dev, struct bpf_prog *prog,
> +			 struct netlink_ext_ack *extack)
> +{
> +	struct mtk_mac *mac = netdev_priv(dev);
> +	struct mtk_eth *eth = mac->hw;
> +	struct bpf_prog *old_prog;
> +	bool need_update;
> +
> +	if (eth->hwlro) {
> +		NL_SET_ERR_MSG_MOD(extack, "XDP not supported with HWLRO");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (dev->mtu > MTK_PP_MAX_BUF_SIZE) {
> +		NL_SET_ERR_MSG_MOD(extack, "MTU too large for XDP");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	need_update = !!eth->prog != !!prog;
> +	if (netif_running(dev) && need_update)
> +		mtk_stop(dev);
> +
> +	old_prog = xchg(&eth->prog, prog);
> +	if (old_prog)
> +		bpf_prog_put(old_prog);
> +
> +	if (netif_running(dev) && need_update)
> +		return mtk_open(dev);
> +
> +	return 0;
> +}
> +
> +static int mtk_xdp(struct net_device *dev, struct netdev_bpf *xdp)
> +{
> +	switch (xdp->command) {
> +	case XDP_SETUP_PROG:
> +		return mtk_xdp_setup(dev, xdp->prog, xdp->extack);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static void ethsys_reset(struct mtk_eth *eth, u32 reset_bits)
>  {
>  	regmap_update_bits(eth->ethsys, ETHSYS_RSTCTRL,
> @@ -3045,6 +3149,11 @@ static int mtk_change_mtu(struct net_device *dev, int new_mtu)
>  	struct mtk_eth *eth = mac->hw;
>  	u32 mcr_cur, mcr_new;
>  
> +	if (eth->prog && length > MTK_PP_MAX_BUF_SIZE) {
> +		netdev_err(dev, "Invalid MTU for XDP mode\n");
> +		return -EINVAL;
> +	}
> +
>  	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
>  		mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
>  		mcr_new = mcr_cur & ~MAC_MCR_MAX_RX_MASK;
> @@ -3372,6 +3481,7 @@ static const struct net_device_ops mtk_netdev_ops = {
>  	.ndo_poll_controller	= mtk_poll_controller,
>  #endif
>  	.ndo_setup_tc		= mtk_eth_setup_tc,
> +	.ndo_bpf		= mtk_xdp,
>  };
>  
>  static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 26c019319055..a1cea93300c1 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -1088,6 +1088,8 @@ struct mtk_eth {
>  
>  	struct mtk_ppe			*ppe;
>  	struct rhashtable		flow_table;
> +
> +	struct bpf_prog			*prog;

The XDP program is apparently under an RCU protection schema (otherwise
you will get UaF when replacing it). Why don't you have explicit RCU
annotations? (here, and where the 'prog' field is touched).

Thanks!

Paolo


