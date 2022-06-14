Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B472AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 02:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FcYSYHahMeLW+niRilJglJx7I4c7S8PgV0JjDFsmTXw=; b=AkVojE82kj3mGp
	f2dG4bZJPLP29kDaWF9jKX3OWaPScBbMt5gM+4xLg3YYUh/M+Lm+bAyVxHUBzS2mqmt9K3SgJXTXY
	SbTDBoc2juYM6HGwMwIjQX4eBb12WOuz96s8GBaGkjU9qPf/EM3+Ucb1fCIJfQOJW2i+EKRgwNY1D
	AqzZl0usnJRcZ6n88ihmQyDFYVrS4nQZHiIP1nGOdcFJyzBn2EcQOzYcpuiVte+UWL+9aMJlZ0UxP
	5XfQ/ZWo1XaJHdaV2Bqd//cR/9an6fR/oqmN1KfPN8V+Xj/wzCmfWOWYcxXNWhjz9drdfdAWWDY0m
	foi5I43yNTU4/mP2OArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0vyb-006eoP-HI; Tue, 14 Jun 2022 02:08:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0vyN-006ehJ-9m; Tue, 14 Jun 2022 02:08:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7180660B6E;
	Tue, 14 Jun 2022 02:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC633C34114;
	Tue, 14 Jun 2022 02:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655172480;
	bh=3ezzvPXMDNRdnzwVLzGOsLWQEZThp+ItuFIoYPPRs0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a4EqCrq11L82aSycyypA3lkGLq9DhDgoimRZNO48rSUsQwvKCdDxCaATENYQfzgKg
	 ktvDSaLKxMka9mSH5iKKRud02MtDjanFcmtYRp+ufuuRQjk2POYXo5gz6sTZuZfP92
	 +ISEy64qNzVo0l2dpFtKigUDHT+URcRv/VnZSMLANuHG0gVA+dBuDhb1KOX/P5Kqun
	 Layp1sbfmYR16XF4zYsKtOKvqdmcxJ4uqKdY6ha6bvVvDfe2C+8KwBVK3g77B2AwMB
	 1zGV9PKgbNOI2ggOurjk1Tpffd6cCPbLvCRVZMkzwvdMUXbdRZuWRaHFb/H2RtAPjx
	 XZk+DHJUH8vyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chen Lin <chen45464546@163.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	nbd@openwrt.org,
	blogic@openwrt.org,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 31/41] net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
Date: Mon, 13 Jun 2022 22:06:56 -0400
Message-Id: <20220614020707.1099487-31-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020707.1099487-1-sashal@kernel.org>
References: <20220614020707.1099487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_190803_447291_800118B3 
X-CRM114-Status: GOOD (  15.26  )
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

From: Chen Lin <chen45464546@163.com>

[ Upstream commit 2f2c0d2919a14002760f89f4e02960c735a316d2 ]

When rx_flag == MTK_RX_FLAGS_HWLRO,
rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
netdev_alloc_frag is for alloction of page fragment only.
Reference to other drivers and Documentation/vm/page_frags.rst

Branch to use __get_free_pages when ring->frag_size > PAGE_SIZE.

Signed-off-by: Chen Lin <chen45464546@163.com>
Link: https://lore.kernel.org/r/1654692413-2598-1-git-send-email-chen45464546@163.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index ee1fd472e925..97cc91f302b0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -820,6 +820,17 @@ static inline bool mtk_rx_get_desc(struct mtk_rx_dma *rxd,
 	return true;
 }
 
+static void *mtk_max_lro_buf_alloc(gfp_t gfp_mask)
+{
+	unsigned int size = mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH);
+	unsigned long data;
+
+	data = __get_free_pages(gfp_mask | __GFP_COMP | __GFP_NOWARN,
+				get_order(size));
+
+	return (void *)data;
+}
+
 /* the qdma core needs scratch memory to be setup */
 static int mtk_init_fq_dma(struct mtk_eth *eth)
 {
@@ -1311,7 +1322,10 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			goto release_desc;
 
 		/* alloc new buffer */
-		new_data = napi_alloc_frag(ring->frag_size);
+		if (ring->frag_size <= PAGE_SIZE)
+			new_data = napi_alloc_frag(ring->frag_size);
+		else
+			new_data = mtk_max_lro_buf_alloc(GFP_ATOMIC);
 		if (unlikely(!new_data)) {
 			netdev->stats.rx_dropped++;
 			goto release_desc;
@@ -1725,7 +1739,10 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 		return -ENOMEM;
 
 	for (i = 0; i < rx_dma_size; i++) {
-		ring->data[i] = netdev_alloc_frag(ring->frag_size);
+		if (ring->frag_size <= PAGE_SIZE)
+			ring->data[i] = netdev_alloc_frag(ring->frag_size);
+		else
+			ring->data[i] = mtk_max_lro_buf_alloc(GFP_KERNEL);
 		if (!ring->data[i])
 			return -ENOMEM;
 	}
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
