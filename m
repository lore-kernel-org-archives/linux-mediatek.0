Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442F3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XB81VnaoXikp+oivrMS6UcyCLGWclDmKXLHIzIH744E=; b=HNXYZTb+3SiFVX/mnC2XjQ3f2f
	+v6JK5uOU0VlEkSpZu8BxSGdaq9IMD6I35Ogw4+ZHce0Tki+yYQnGy/nWPlI5bzAvhxzCXKq/oGgh
	T0Y0NXsCMk89s/QcKM6rFv6J0lEFV6Ycic/G3+aAjMaIzHvNFYiUoiA4mfdVvZEJs68Bd++nns1h3
	Zv3nvPDJAYBpVfp43b/3z0c/9sTCMOCS4l6lxlGhxClUPqRiO2S9VHko4mwdSR0hI8533N7QnUG1R
	fVzzJ6qwwWRXPRwEKHu7eg2WwL4546ycIuNSIasoh1iTXNG9eXBSG24+F2flYwNYePsDTstiymNSz
	/nxNsQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmyK-000bIM-Po; Fri, 22 Jul 2022 07:21:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmyI-000bHH-Ap
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 07:21:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9BB46621C3;
	Fri, 22 Jul 2022 07:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB92C341C6;
	Fri, 22 Jul 2022 07:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658474473;
	bh=kpLqIwyhx5Mkngpodf9zhchYBbDCqagoWs8dhA4A2UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VwtxPD0WjLQozT2GUl6DvrxjjBvAsphO7xo1IKdYqf9+7MIO8RkaIXk54TBTHot8X
	 tEDO4wAFm5A4aqIUSw2NWDAeaTjDmy3GWeNxjjpDir+VFyeCA4dH5HGGU+JpsXoqUo
	 ByqHTzvh3gaKNESTcxCohM7AiTT6lgCm7ag9EXlH6Dj+SKQemmFmhnjL0NZkzsHf5J
	 tSnjkP7dueTtfjDY3ZIcDRU9Vl6MamwQdvOTP4E+j6r3wRECq9Nk+k/V8ChYRaR32m
	 kJOMe9E5qKy4Tm17Hrg6etvOQHf68gHRNcqd/ekCDCao4kFfm0zQPVrNXInGeiXcWl
	 ZdFNDD95/HBVw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH v4 net-next 2/5] net: ethernet: mtk_eth_soc: add basic XDP support
Date: Fri, 22 Jul 2022 09:19:37 +0200
Message-Id: <280b4e0dd175840dcfba683f01c461685e4692f3.1658474059.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1658474059.git.lorenzo@kernel.org>
References: <cover.1658474059.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_002114_477312_50D36AFB 
X-CRM114-Status: GOOD (  19.47  )
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

Introduce basic XDP support to mtk_eth_soc driver.
Supported XDP verdicts:
- XDP_PASS
- XDP_DROP
- XDP_REDIRECT

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 162 +++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |   2 +
 2 files changed, 145 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 9a92d602ebd5..9a40876e5417 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1432,6 +1432,11 @@ static void mtk_update_rx_cpu_idx(struct mtk_eth *eth)
 	}
 }
 
+static bool mtk_page_pool_enabled(struct mtk_eth *eth)
+{
+	return !eth->hwlro;
+}
+
 static struct page_pool *mtk_create_page_pool(struct mtk_eth *eth,
 					      struct xdp_rxq_info *xdp_q,
 					      int id, int size)
@@ -1494,11 +1499,52 @@ static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
 		skb_free_frag(data);
 }
 
+static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
+		       struct xdp_buff *xdp, struct net_device *dev)
+{
+	struct bpf_prog *prog;
+	u32 act = XDP_PASS;
+
+	rcu_read_lock();
+
+	prog = rcu_dereference(eth->prog);
+	if (!prog)
+		goto out;
+
+	act = bpf_prog_run_xdp(prog, xdp);
+	switch (act) {
+	case XDP_PASS:
+		goto out;
+	case XDP_REDIRECT:
+		if (unlikely(xdp_do_redirect(dev, xdp, prog))) {
+			act = XDP_DROP;
+			break;
+		}
+		goto out;
+	default:
+		bpf_warn_invalid_xdp_action(dev, prog, act);
+		fallthrough;
+	case XDP_ABORTED:
+		trace_xdp_exception(dev, prog, act);
+		fallthrough;
+	case XDP_DROP:
+		break;
+	}
+
+	page_pool_put_full_page(ring->page_pool,
+				virt_to_head_page(xdp->data), true);
+out:
+	rcu_read_unlock();
+
+	return act;
+}
+
 static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		       struct mtk_eth *eth)
 {
 	struct dim_sample dim_sample = {};
 	struct mtk_rx_ring *ring;
+	bool xdp_flush = false;
 	int idx;
 	struct sk_buff *skb;
 	u8 *data, *new_data;
@@ -1507,9 +1553,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 	while (done < budget) {
 		unsigned int pktlen, *rxdcsum;
-		u32 hash, reason, reserve_len;
 		struct net_device *netdev;
 		dma_addr_t dma_addr;
+		u32 hash, reason;
 		int mac = 0;
 
 		ring = mtk_get_rx_ring(eth);
@@ -1539,8 +1585,14 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
 			goto release_desc;
 
+		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
+
 		/* alloc new buffer */
 		if (ring->page_pool) {
+			struct page *page = virt_to_head_page(data);
+			struct xdp_buff xdp;
+			u32 ret;
+
 			new_data = mtk_page_pool_get_buff(ring->page_pool,
 							  &dma_addr,
 							  GFP_ATOMIC);
@@ -1548,6 +1600,34 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				netdev->stats.rx_dropped++;
 				goto release_desc;
 			}
+
+			dma_sync_single_for_cpu(eth->dma_dev,
+				page_pool_get_dma_addr(page) + MTK_PP_HEADROOM,
+				pktlen, page_pool_get_dma_dir(ring->page_pool));
+
+			xdp_init_buff(&xdp, PAGE_SIZE, &ring->xdp_q);
+			xdp_prepare_buff(&xdp, data, MTK_PP_HEADROOM, pktlen,
+					 false);
+			xdp_buff_clear_frags_flag(&xdp);
+
+			ret = mtk_xdp_run(eth, ring, &xdp, netdev);
+			if (ret == XDP_REDIRECT)
+				xdp_flush = true;
+
+			if (ret != XDP_PASS)
+				goto skip_rx;
+
+			skb = build_skb(data, PAGE_SIZE);
+			if (unlikely(!skb)) {
+				page_pool_put_full_page(ring->page_pool,
+							page, true);
+				netdev->stats.rx_dropped++;
+				goto skip_rx;
+			}
+
+			skb_reserve(skb, xdp.data - xdp.data_hard_start);
+			skb_put(skb, xdp.data_end - xdp.data);
+			skb_mark_for_recycle(skb);
 		} else {
 			if (ring->frag_size <= PAGE_SIZE)
 				new_data = napi_alloc_frag(ring->frag_size);
@@ -1571,27 +1651,20 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 			dma_unmap_single(eth->dma_dev, trxd.rxd1,
 					 ring->buf_size, DMA_FROM_DEVICE);
-		}
 
-		/* receive data */
-		skb = build_skb(data, ring->frag_size);
-		if (unlikely(!skb)) {
-			mtk_rx_put_buff(ring, data, true);
-			netdev->stats.rx_dropped++;
-			goto skip_rx;
-		}
+			skb = build_skb(data, ring->frag_size);
+			if (unlikely(!skb)) {
+				netdev->stats.rx_dropped++;
+				skb_free_frag(data);
+				goto skip_rx;
+			}
 
-		if (ring->page_pool) {
-			reserve_len = MTK_PP_HEADROOM;
-			skb_mark_for_recycle(skb);
-		} else {
-			reserve_len = NET_SKB_PAD + NET_IP_ALIGN;
+			skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
+			skb_put(skb, pktlen);
 		}
-		skb_reserve(skb, reserve_len);
 
-		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
 		skb->dev = netdev;
-		skb_put(skb, pktlen);
+		bytes += skb->len;
 
 		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
 			rxdcsum = &trxd.rxd3;
@@ -1603,7 +1676,6 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		else
 			skb_checksum_none_assert(skb);
 		skb->protocol = eth_type_trans(skb, netdev);
-		bytes += pktlen;
 
 		hash = trxd.rxd4 & MTK_RXD4_FOE_ENTRY;
 		if (hash != MTK_RXD4_FOE_ENTRY) {
@@ -1666,6 +1738,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			  &dim_sample);
 	net_dim(&eth->rx_dim, dim_sample);
 
+	if (xdp_flush)
+		xdp_do_flush_map();
+
 	return done;
 }
 
@@ -2011,7 +2086,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 	if (!ring->data)
 		return -ENOMEM;
 
-	if (!eth->hwlro) {
+	if (mtk_page_pool_enabled(eth)) {
 		struct page_pool *pp;
 
 		pp = mtk_create_page_pool(eth, &ring->xdp_q, ring_no,
@@ -2750,6 +2825,48 @@ static int mtk_stop(struct net_device *dev)
 	return 0;
 }
 
+static int mtk_xdp_setup(struct net_device *dev, struct bpf_prog *prog,
+			 struct netlink_ext_ack *extack)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+	struct mtk_eth *eth = mac->hw;
+	struct bpf_prog *old_prog;
+	bool need_update;
+
+	if (eth->hwlro) {
+		NL_SET_ERR_MSG_MOD(extack, "XDP not supported with HWLRO");
+		return -EOPNOTSUPP;
+	}
+
+	if (dev->mtu > MTK_PP_MAX_BUF_SIZE) {
+		NL_SET_ERR_MSG_MOD(extack, "MTU too large for XDP");
+		return -EOPNOTSUPP;
+	}
+
+	need_update = !!eth->prog != !!prog;
+	if (netif_running(dev) && need_update)
+		mtk_stop(dev);
+
+	old_prog = rcu_replace_pointer(eth->prog, prog, lockdep_rtnl_is_held());
+	if (old_prog)
+		bpf_prog_put(old_prog);
+
+	if (netif_running(dev) && need_update)
+		return mtk_open(dev);
+
+	return 0;
+}
+
+static int mtk_xdp(struct net_device *dev, struct netdev_bpf *xdp)
+{
+	switch (xdp->command) {
+	case XDP_SETUP_PROG:
+		return mtk_xdp_setup(dev, xdp->prog, xdp->extack);
+	default:
+		return -EINVAL;
+	}
+}
+
 static void ethsys_reset(struct mtk_eth *eth, u32 reset_bits)
 {
 	regmap_update_bits(eth->ethsys, ETHSYS_RSTCTRL,
@@ -3045,6 +3162,12 @@ static int mtk_change_mtu(struct net_device *dev, int new_mtu)
 	struct mtk_eth *eth = mac->hw;
 	u32 mcr_cur, mcr_new;
 
+	if (rcu_access_pointer(eth->prog) &&
+	    length > MTK_PP_MAX_BUF_SIZE) {
+		netdev_err(dev, "Invalid MTU for XDP mode\n");
+		return -EINVAL;
+	}
+
 	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628)) {
 		mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
 		mcr_new = mcr_cur & ~MAC_MCR_MAX_RX_MASK;
@@ -3372,6 +3495,7 @@ static const struct net_device_ops mtk_netdev_ops = {
 	.ndo_poll_controller	= mtk_poll_controller,
 #endif
 	.ndo_setup_tc		= mtk_eth_setup_tc,
+	.ndo_bpf		= mtk_xdp,
 };
 
 static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 26c019319055..cfb7aeda3f49 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1088,6 +1088,8 @@ struct mtk_eth {
 
 	struct mtk_ppe			*ppe;
 	struct rhashtable		flow_table;
+
+	struct bpf_prog			__rcu *prog;
 };
 
 /* struct mtk_mac -	the structure that holds the info about the MACs of the
-- 
2.36.1


