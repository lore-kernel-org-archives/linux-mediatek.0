Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E69C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 03:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ClLd2szB4mOT6KzQOprKAl17yD2rLgC0rUAVkDSzZwI=; b=Ps9leGlwt4KfZiwjg/oVaWiLdp
	umaiNux460dm8ayx+o+PcEZQBWbEW79puMO7avsk2imToZc66iiikXmCADxIEIJauu5VouATkvocS
	KKnTOXkmGD0VHa0o7xR6a5eCfkDsIj6IS+9yACnmcs6Em+GIbdIDq0VDKIqdhXy1Jzr5bxDCOpOeW
	EFEFy8Zasi1wOVmguHe/oN3VTNeItsrvdDYboYJp/bhoyarVVZ3vmgWoe++y5fTSKo3YVeuz7qFs/
	0uD6VzHJXxfK1jcB7ZFwf0hvDGb8oUJ/8bfrY4le3SD1M+DDRZVhx2y16pyqGg1DJwbGn6atrU5FI
	EsyHXKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owbPc-001toF-1E; Sun, 20 Nov 2022 03:54:32 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owbPQ-001tWF-EK; Sun, 20 Nov 2022 03:54:22 +0000
Received: from canpemm500006.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NFGpS25yJzHvbn;
	Sun, 20 Nov 2022 11:53:36 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 canpemm500006.china.huawei.com (7.192.105.130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 11:54:09 +0800
From: Ziyang Xuan <william.xuanziyang@huawei.com>
To: <nbd@nbd.name>, <john@phrozen.org>, <sean.wang@mediatek.com>,
	<Mark-MC.Lee@mediatek.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <matthias.bgg@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <lorenzo@kernel.org>
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix potential memory leak in mtk_rx_alloc()
Date: Sun, 20 Nov 2022 11:54:05 +0800
Message-ID: <20221120035405.1464341-1-william.xuanziyang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500006.china.huawei.com (7.192.105.130)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_195420_692621_E4FF8FE2 
X-CRM114-Status: UNSURE (   9.38  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When fail to dma_map_single() in mtk_rx_alloc(), it returns directly.
But the memory allocated for local variable data is not freed, and
local variabel data has not been attached to ring->data[i] yet, so the
memory allocated for local variable data will not be freed outside
mtk_rx_alloc() too. Thus memory leak would occur in this scenario.

Add skb_free_frag(data) when dma_map_single() failed.

Fixes: 23233e577ef9 ("net: ethernet: mtk_eth_soc: rely on page_pool for single page buffers")
Signed-off-by: Ziyang Xuan <william.xuanziyang@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 7cd381530aa4..bc47ef1e4dd5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2378,8 +2378,10 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 				data + NET_SKB_PAD + eth->ip_align,
 				ring->buf_size, DMA_FROM_DEVICE);
 			if (unlikely(dma_mapping_error(eth->dma_dev,
-						       dma_addr)))
+						       dma_addr))) {
+				skb_free_frag(data);
 				return -ENOMEM;
+			}
 		}
 		rxd->rxd1 = (unsigned int)dma_addr;
 		ring->data[i] = data;
-- 
2.25.1


