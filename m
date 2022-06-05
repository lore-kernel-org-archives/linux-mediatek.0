Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D33DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 03:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJAg3wAYIOfGkLJz9b2yaRRH7zU2464mSQGOOLGHIMo=; b=QLV13YRz2aevF1
	dU3X6obkzjbEfGbLzLPZmvMWcxLMf1dirrudNl3Y11MfrIfPYoRIKQPio5MF5enec2xo5k263NjOl
	kTN/ztYWfssFsgf5T29JDjOaxNaJJXo3tWRcoQmFnK9VkCMU1tvfIUgD+AYRfj19ivexZ5bzG6PZv
	Nj854C/z8jS22gADMQtVYx1LhyGyTP+5KLo/Tf8EIPUyb27uQZ3/yM0n5Cc3MnBIUJdk3fTs4U5bA
	gDc8oGfKq7rlekVmbArcK+XSoDz5Us7MJjn9q8TmksiCZOSxgV91Z6BvP1AV7GdXhGUgOuBE+oFGL
	Z3XedKxFd/JpwSgZlzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxgi1-00DDCu-0A; Sun, 05 Jun 2022 03:13:45 +0000
Received: from m12-12.163.com ([220.181.12.12])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxghq-00DD8m-6M; Sun, 05 Jun 2022 03:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=TUBfwF53I+2MtjAGYa
	pwu8YmcHWT7Pc/VRs7clOHSnE=; b=ZCqQKZAt5oWK5y3REdGO4gj2itwrzw0hCp
	vjMDwzhzbFIT+CNKCu6HyYEssriY+d9ejF2H3ppC1IHy8KIChiT5uOskW1sxTL7Y
	/TqK7b4EcM+LTy6o4+T4PPcBkXg2Syn8Au7RU4wqpEvEi3rE+VIVEMvK4rRxhqMy
	lMYqZo8zU=
Received: from localhost.localdomain (unknown [171.221.147.121])
	by smtp8 (Coremail) with SMTP id DMCowADHgyE4H5xi7gqqGA--.22831S2;
	Sun, 05 Jun 2022 11:13:01 +0800 (CST)
From: Chen Lin <chen45464546@163.com>
To: nbd@nbd.name,
	alexander.duyck@gmail.com
Cc: john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Lin <chen45464546@163.com>
Subject: [PATCH v3] net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
Date: Sun,  5 Jun 2022 11:12:37 +0800
Message-Id: <1654398757-2937-1-git-send-email-chen45464546@163.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CAKgT0UdR-bdiZXsV_=8yJUS8zjoO6jeBS5bKNWAyxwLCiOP8ZQ@mail.gmail.com>
References: <CAKgT0UdR-bdiZXsV_=8yJUS8zjoO6jeBS5bKNWAyxwLCiOP8ZQ@mail.gmail.com>
X-CM-TRANSID: DMCowADHgyE4H5xi7gqqGA--.22831S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyfKF4rCw15Jw1UJF1DZFb_yoW8AFWrpr
	4Yya43ZFyxAr4DG395Aa1UZFs8Aw4xKryUKry3Z34fZwn8tFWrKFyktFW5uryakrWvkFyS
	yrs0vr9I9Fn5Kw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi22NAUUUUU=
X-Originating-IP: [171.221.147.121]
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/xtbB2A0XnmBHK0PEJgAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220604_201334_627925_4D3EDDAA 
X-CRM114-Status: GOOD (  10.61  )
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
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |   16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b3b3c07..ba9259a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1467,7 +1467,13 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			goto release_desc;
 
 		/* alloc new buffer */
-		new_data = napi_alloc_frag(ring->frag_size);
+		if (ring->frag_size <= PAGE_SIZE)
+			new_data = napi_alloc_frag(ring->frag_size);
+		else
+			new_data = (void *)__get_free_pages(GFP_ATOMIC |
+			  __GFP_COMP | __GFP_NOWARN,
+			  get_order(mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH)));
+
 		if (unlikely(!new_data)) {
 			netdev->stats.rx_dropped++;
 			goto release_desc;
@@ -1914,7 +1920,13 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 		return -ENOMEM;
 
 	for (i = 0; i < rx_dma_size; i++) {
-		ring->data[i] = netdev_alloc_frag(ring->frag_size);
+		if (ring->frag_size <= PAGE_SIZE)
+			ring->data[i] = netdev_alloc_frag(ring->frag_size);
+		else
+			ring->data[i] = (void *)__get_free_pages(GFP_KERNEL |
+			  __GFP_COMP | __GFP_NOWARN,
+			  get_order(mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH)));
+
 		if (!ring->data[i])
 			return -ENOMEM;
 	}
-- 
1.7.9.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
