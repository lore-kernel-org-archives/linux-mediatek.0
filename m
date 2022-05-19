Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 03:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YIQ2XFk6qMidx6tGNLwlOAspMu82/Vir6lUhZL/61kw=; b=LkIodIiW5BwRmJ
	UsPVTzYO3NssyVNNuqPCsJXy4dNLGZaeNpJXTsvySBYGVX9XLO0ERc+J/4sgGQNhAhhr1BLrcuTJ2
	QGMu6McXY+1YudPq0jdw9YNrZcVMOd6bnDVs/2vQ/9uppigsNzX7ZXRm6UNL0e53AXZEXXgp6+6rk
	lxhlEBlr/TyjnxDLAbiGe0wK9wZDZTmMHoj7ZER1zRgZTK+goZG1vYtyR8jjFuZHdyUL34BqO3WuO
	Uk95xUAtHBIuJGyAB5Zd4He+eVHs9iVU/hupuI1dpDKFkxRGnV9vlBX7hhwLDKaV/WIFTbxdDDK6L
	0byeSqSZ7UXuzZpEFxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrWYH-004mCP-PF; Thu, 19 May 2022 03:10:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrWY5-004lyO-66; Thu, 19 May 2022 03:10:03 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L3ZX40zRNzQkKB;
 Thu, 19 May 2022 11:07:00 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 19 May 2022 11:09:52 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 11:09:52 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <haijun.liu@mediatek.com>, <chandrashekar.devegowda@intel.com>,
 <ricardo.martinez@linux.intel.com>, <loic.poulain@linaro.org>,
 <davem@davemloft.net>, <kuba@kernel.org>
Subject: [PATCH -next v2] net: wwan: t7xx: use GFP_ATOMIC under spin lock in
 t7xx_cldma_gpd_set_next_ptr()
Date: Thu, 19 May 2022 11:21:08 +0800
Message-ID: <20220519032108.2996400-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_201001_453831_2AB8DF02 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Sometimes t7xx_cldma_gpd_set_next_ptr() is called under spin lock,
so add 'gfp_mask' parameter in t7xx_cldma_gpd_set_next_ptr() to pass
the flag.

Fixes: 39d439047f1d ("net: wwan: t7xx: Add control DMA interface")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2:
  change the parameter to gfp flag.
---
 drivers/net/wwan/t7xx/t7xx_hif_cldma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
index 0c52801ed0de..6ff30cb8eb16 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
@@ -91,9 +91,9 @@ static void t7xx_cldma_gpd_set_next_ptr(struct cldma_gpd *gpd, dma_addr_t next_p
 }
 
 static int t7xx_cldma_alloc_and_map_skb(struct cldma_ctrl *md_ctrl, struct cldma_request *req,
-					size_t size)
+					size_t size, gfp_t gfp_mask)
 {
-	req->skb = __dev_alloc_skb(size, GFP_KERNEL);
+	req->skb = __dev_alloc_skb(size, gfp_mask);
 	if (!req->skb)
 		return -ENOMEM;
 
@@ -174,7 +174,7 @@ static int t7xx_cldma_gpd_rx_from_q(struct cldma_queue *queue, int budget, bool
 		spin_unlock_irqrestore(&queue->ring_lock, flags);
 		req = queue->rx_refill;
 
-		ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, queue->tr_ring->pkt_size);
+		ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, queue->tr_ring->pkt_size, GFP_KERNEL);
 		if (ret)
 			return ret;
 
@@ -402,7 +402,7 @@ static struct cldma_request *t7xx_alloc_rx_request(struct cldma_ctrl *md_ctrl, s
 	if (!req->gpd)
 		goto err_free_req;
 
-	val = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, pkt_size);
+	val = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, pkt_size, GFP_KERNEL);
 	if (val)
 		goto err_free_pool;
 
@@ -801,7 +801,7 @@ static int t7xx_cldma_clear_rxq(struct cldma_ctrl *md_ctrl, int qnum)
 		if (req->skb)
 			continue;
 
-		ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, rxq->tr_ring->pkt_size);
+		ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, rxq->tr_ring->pkt_size, GFP_ATOMIC);
 		if (ret)
 			break;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
