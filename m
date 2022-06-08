Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD41C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXyOQNzfjxV1FarpBoWgO9Pe1uTG3Vae/Id/6AxzLLM=; b=SQToH8K399xoK3
	FjB9jp8uom5myjpeSnhX3qCcspiHMgyvB0qYYLL9fFiS+JzpTF7gJaLa5LnkoUlMauJ+Ppss4p2sJ
	OQwkYAgsbmrpnQAMCVzykJ0tI4PCG6rhyxpcE8gHfUmyoMzabvP2hGnd8JouaS1+FICczJOccDXc1
	0IEE9Q2KK9AiFGa65A69Gf9MbNykIBk8yjkk7N52wUhYubloFOmM5TpqzCfXj2eJ8ZzdkCbt6FhbQ
	/xXJj47BUsr2qgaKgJm4u4+Y0KNsHRC+0jt216PHwtP16AUqmLGdIIoAWkMmZgJ4ksI3q2uAv94i7
	dxjekFusbAcfzHTOXyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyv6H-00D5cF-Pu; Wed, 08 Jun 2022 12:47:53 +0000
Received: from m12-17.163.com ([220.181.12.17])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyv66-00D5aL-3H; Wed, 08 Jun 2022 12:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=LvqB+oCn++tayjaTVT
	UBZXPkGSvkcgZKDldpZZY9yS8=; b=VBm9IRZqrjQMnsWOoil6bShC0ooCRYhb7j
	VLEpL/PeIbHgWz0AP5twjtd9xakdtQTNIdjwdZwaSYPtHwPMQc34I5/C3f+wdtYj
	2aphTboobzoNVqtgOpR/sFx3YeXjXipSQYrvl9WHB/S8h9Ju60xceH8M6WCrWM+0
	8CqeXHGhs=
Received: from localhost.localdomain (unknown [171.221.147.121])
	by smtp13 (Coremail) with SMTP id EcCowAC3rJxTmqBiHla6Gw--.54176S2;
	Wed, 08 Jun 2022 20:47:19 +0800 (CST)
From: Chen Lin <chen45464546@163.com>
To: kuba@kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexander.duyck@gmail.com,
	Chen Lin <chen45464546@163.com>
Subject: [PATCH v5] net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
Date: Wed,  8 Jun 2022 20:46:53 +0800
Message-Id: <1654692413-2598-1-git-send-email-chen45464546@163.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20220607161413.655dd63f@kernel.org>
References: <20220607161413.655dd63f@kernel.org>
X-CM-TRANSID: EcCowAC3rJxTmqBiHla6Gw--.54176S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyfKF13AF45WF15tr45GFg_yoW8uryrpr
	4UKa43AF48Jr47G395Aa1DZa1Yyw4IgrWUKFy3Z34fZ345tFWrtFyktFW5WFySkrWvkF1S
	yFs8Zr9xursxtw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piIPf9UUUUU=
X-Originating-IP: [171.221.147.121]
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/1tbiGhganlaECDCbOQAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_054742_523553_4EE6E514 
X-CRM114-Status: GOOD (  13.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When rx_flag == MTK_RX_FLAGS_HWLRO,
rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
netdev_alloc_frag is for alloction of page fragment only.
Reference to other drivers and Documentation/vm/page_frags.rst

Branch to use __get_free_pages when ring->frag_size > PAGE_SIZE.

Signed-off-by: Chen Lin <chen45464546@163.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |   21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b3b3c07..aba0d84 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -899,6 +899,17 @@ static bool mtk_rx_get_desc(struct mtk_eth *eth, struct mtk_rx_dma_v2 *rxd,
 	return true;
 }
 
+static void *mtk_max_lro_buf_alloc(gfp_t gfp_mask)
+{
+	unsigned long data;
+	unsigned int size = mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH);
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
@@ -1467,7 +1478,10 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
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
@@ -1914,7 +1928,10 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
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
1.7.9.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
