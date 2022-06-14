Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FDECCA47B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 02:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4idwG+tKDvX1dNtDkormtxAxVY/zKvOi/yW5o4b5jg=; b=Hmyagrg6YUU1UW
	R8PZyBMX5Bj5DAQfj4yE1V6XbNk/GKrmeK1G2U8f7ZcF0gXIq6FLE330qcFesdPCg+Dw+lhUlis5I
	CxXZ0/1MqZxXdWCUvLTekIC++2YUE6LYZ3wUVOtQZjdEOvAFIuED8P3ptcxPWTU/e7QK4bQEu2LgU
	w5xa9g0QLevoqFUtaicaTmkPw4NdRwYRBLn9io94pKoguDi6CxqWgOHGzf/3xYcCjh+E/dNgN/BAn
	Fah4GbtvunMJ4Le19x4UbyN+mBEH2rYFr4FdzbCbz94KQXZbjJgZH6phdJ70RoZBhoPG3QeLOIjMX
	VGfGAlLzkmT7SVzcNLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0w0o-006fsh-TA; Tue, 14 Jun 2022 02:10:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0w0X-006fjB-Pm; Tue, 14 Jun 2022 02:10:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5977B60F1C;
	Tue, 14 Jun 2022 02:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB2BC36B00;
	Tue, 14 Jun 2022 02:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655172617;
	bh=y5LEe/I2hjA22v9AnBMJ09sBI7qaJ0yppZgeWvB0g/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o87WBV2+JCaSHhjUdpECagfL+qjwUXaXqrhD64FEmmXMkqyBgTE6ldR0fTc6pYSJh
	 1TN7WIcfmUeH9BeGcfhm8Pp0Ifvlfo9a/a09TuG2q8F4MFMiWY6grRc1EuasxOqgY4
	 a95HKd/ysFfzMwaku+23hV0KpETwlpgLBn3l5F3EgFJzH1mY4J79hf7bSWHdWoOGGY
	 zbKBkO4VeeKqZl9b7cRKrL3Fx9LDSHTku343uhIGJN/PyXAXNCbytf7n4x5HoPzCEp
	 1wRNELoFaaDTY0YzSu8C6CqcohC2Ym4gYhWZgSlcwPyPjNBcmKwvgyMHhs4zePbwC5
	 dVtoBtobS/+7A==
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
Subject: [PATCH AUTOSEL 4.19 17/18] net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
Date: Mon, 13 Jun 2022 22:09:40 -0400
Message-Id: <20220614020941.1100702-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020941.1100702-1-sashal@kernel.org>
References: <20220614020941.1100702-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_191017_949516_399927B0 
X-CRM114-Status: GOOD (  15.61  )
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
index 59f3dce3ab1d..d0f2488003eb 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -597,6 +597,17 @@ static inline void mtk_rx_get_desc(struct mtk_rx_dma *rxd,
 	rxd->rxd4 = READ_ONCE(dma_rxd->rxd4);
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
@@ -1005,7 +1016,10 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
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
@@ -1312,7 +1326,10 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
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
