Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946C0C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HBt/khsRbZ12y4DNnhyHBQxHwraCeIVVecLhcdY2IrA=; b=eUS9AUU0wYYl5c
	ruCrlYKv4jKfligFYhCJRc3h6CETsWMh9jUUzoMqXN546ZTQj5xOWqeSaakATnu15mZVWy1JiaSVF
	GpJrXWF0in/QC896dGzxvgRv9PBN0tRMYGZke3OBQroB+/r6PFjOrxWs8yJJIx/VFe3CGlQt1jKfy
	6Ec39sYXOfmAJNNxarf3HcUjRWEc6UiX4vswTeWGg9KJBrwx60BF/IiVm8zgud/f2XHTvXppUvOhm
	bwy7SHjaXOKFLSFMz5IwLbwoVqtHLL8LvgVuN8me1E1RsO3qUqxB42FB9l7iKI5Y/tXF2aPbh1t56
	qtITlSn/Q2g1h1MlcMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIiw-002Wgp-I7; Mon, 06 Jun 2022 19:49:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIiu-002WgB-Dh
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 19:49:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 296CEB81B3E;
	Mon,  6 Jun 2022 19:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9C6C385A9;
	Mon,  6 Jun 2022 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654544948;
	bh=3Y/KHoTrQT6IeNQh9g1R9PRk/OuHTxu9UIy1sab/6aM=;
	h=From:To:Cc:Subject:Date:From;
	b=Q3qupXSjXyIT2uybSqSLb/aRAhoeX+K0pu5DXTGZiAQMQ/3V2YYVjCiT/0K5DcCuN
	 crx92iWLE/bYe9WHVBsvLqu7FR7ogDQIx8fNwjhkTBY5lUJco6XfnwO1TJwPFaRG8b
	 KX4G2ZZFSLVnbiQiT9KE/6dZfLY4OLgRJf/CSEvSurSahnZSFkM6PIolekTARGwRdq
	 otMloGqiBk18o3KRFHQTjXcDvabQJDNDYeNrle6H9hJKjgWqxs1c/C9/cRzsOJRUrt
	 wv6fvyXn82vZiYQbjD4l/zDvz1MJcVkzKVxgQZSonLQ5Z/oCebhDmdrhd+qSX6rG27
	 ytGT0skDIDP+Q==
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
	Sam.Shih@mediatek.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: enable rx cksum offload for MTK_NETSYS_V2
Date: Mon,  6 Jun 2022 21:49:00 +0200
Message-Id: <c8699805c18f7fd38315fcb8da2787676d83a32c.1654544585.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_124912_643174_14CD0CB7 
X-CRM114-Status: GOOD (  11.51  )
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

Enable rx checksum offload for mt7986 chipset.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b3b3c079a0fa..9d7700984e9b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1433,8 +1433,8 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 	int done = 0, bytes = 0;
 
 	while (done < budget) {
+		unsigned int pktlen, *rxdcsum;
 		struct net_device *netdev;
-		unsigned int pktlen;
 		dma_addr_t dma_addr;
 		u32 hash, reason;
 		int mac = 0;
@@ -1498,7 +1498,13 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
 		skb->dev = netdev;
 		skb_put(skb, pktlen);
-		if (trxd.rxd4 & eth->soc->txrx.rx_dma_l4_valid)
+
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
+			rxdcsum = &trxd.rxd3;
+		else
+			rxdcsum = &trxd.rxd4;
+
+		if (*rxdcsum & eth->soc->txrx.rx_dma_l4_valid)
 			skb->ip_summed = CHECKSUM_UNNECESSARY;
 		else
 			skb_checksum_none_assert(skb);
@@ -3744,6 +3750,7 @@ static const struct mtk_soc_data mt7986_data = {
 		.txd_size = sizeof(struct mtk_tx_dma_v2),
 		.rxd_size = sizeof(struct mtk_rx_dma_v2),
 		.rx_irq_done_mask = MTK_RX_DONE_INT_V2,
+		.rx_dma_l4_valid = RX_DMA_L4_VALID_V2,
 		.dma_max_len = MTK_TX_DMA_BUF_LEN_V2,
 		.dma_len_offset = 8,
 	},
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
