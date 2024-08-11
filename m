Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40240C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+q3yH2GVKTI88q3BAmiWkMTGDbrf/3EozEWfMZeP1ec=; b=Tr0UH34RgkxoLTGhu7KPxoTMKI
	oAnBlC2YJq/T8aeori6UvcSqf/6vJUDBsLf+20GXEjny9LfnPDDxyUVKb+b8T760R8BdIMVXDBnKn
	sH1NpVRIvGHfWxx2sSnLbQPdyYvhI48WK31KPHTuhj8ei+ImTl4FsAaRVRD539XHwJhD3zMdaPlQz
	FQqRy+QS1r8T3jmos5Qu2Do56Cg8A6/Mea3as7rouk0IyoweExKl0/gw8f7b+2JA1V+Ib8Qro0ycs
	YmWk+WnZFMkb12ScHsX2UyF1W4d0lv+DEwNVxvdBX4OyZuwA/G2uyol2QCfAHLXgfXzy3jzXLCleb
	2ZCM6dOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdDeT-0000000G124-2TqC;
	Sun, 11 Aug 2024 18:50:49 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdDdr-0000000G0v4-3XFF;
	Sun, 11 Aug 2024 18:50:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so14664315e9.0;
        Sun, 11 Aug 2024 11:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723402209; x=1724007009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+q3yH2GVKTI88q3BAmiWkMTGDbrf/3EozEWfMZeP1ec=;
        b=F0p+nt7xo7ay/DmGzZKg4nNDWZvIGCSVx86SrQof/kIETfHBgPkSmXwLL3CwcVEOR5
         Xzv1lmCT+e63xp/D56LbfX+o6IUlDUtfZsKLyUK0/SKFA4QWo70WqUcxOBufgOkEiJ1B
         js1cu7Ejmu3ezpXDEWxcu30IB3ZexBrbbxVIKi1qr4e49jjdWx12bWVgde8Nlmys8Ps9
         g7QIn/IlVfkJ3STaaVSlnd/D4chZ/SGbcr4oG1Lu0AbrpopY7vQPOXu3SGGFY9wZ1mMH
         MOE16Bp145M+rsdA5kbuQw4rC+ewgEObRobZQ9Jenc2zabgW8YI2oE4CZw7IIH/HlxXv
         xzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723402209; x=1724007009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+q3yH2GVKTI88q3BAmiWkMTGDbrf/3EozEWfMZeP1ec=;
        b=cskjW1Wwi9VhFSnrWSqF1ppvFbBHxbiZs4ON6RiNpgAxDv2yjpHw8QJPQD0o/jG/b2
         MJLrPI1xgZpKE7OJGFfMCdDAoQbnhkMd7FtL/0VKZ1xnnRo8eqCKiKeiSm/A9KYskEOj
         a0J9xHsjkJ89Uqf9x5HmqrExb2zBGEUZ5kraNePyzTwSWfS8VeCkXDBw5vIlx1C/kBIx
         osTywih+yxaBI2joPDq6lAb6DqJpM3EKqyffSBs1lUmMCIXd1HeGdPFl1ZNJUQFTlOjf
         KU5QDROOZlSDgOOCEByACuvoK92NgsqJO0yJCJ5qLnJV37L9mPUkmoaB90gVBZN4wiUv
         pxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGDJmeyvAgZiEEh0+6Ppy4KclOSlcPy3F6NyN9TxZFl6gE0mI3vQ6DOW6WVljoN6mw72jXnmWsyT2y7sVI98lT03NVHFNmJV3rwXp5bFp6WEI3SLm6Qf6X0OBOnZxBRAg13niQF7P3UVqwlb6laGmccuRWdiB7mi4=
X-Gm-Message-State: AOJu0Yy0InAw2J6TuzSryqLfT2jTsiRkdkuVpTepMtcB4w0Sq1MUbGvg
	KAXANtjE7tkjzKIIBM2KEHomUuEy3m6FBUy8k3Nw4UOf8AZ8K+bu
X-Google-Smtp-Source: AGHT+IH9FjXsU3WtmkAc/rzXtJFMjqHYnqwh8bqjz1y9HWu7myVmeb6vI9Hl9TlvZKwTXMnYMroIbQ==
X-Received: by 2002:a5d:60c5:0:b0:360:7c4b:58c3 with SMTP id ffacd0b85a97d-36d603555f9mr5650727f8f.54.1723402208958;
        Sun, 11 Aug 2024 11:50:08 -0700 (PDT)
Received: from yifee.lan ([176.230.105.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51ea8dsm5539929f8f.87.2024.08.11.11.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:50:08 -0700 (PDT)
From: Elad Yifee <eladwf@gmail.com>
To: 
Cc: eladwf@gmail.com,
	daniel@makrotopia.org,
	Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Lin <chen45464546@163.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix memory leak in LRO rings release
Date: Sun, 11 Aug 2024 21:49:45 +0300
Message-ID: <20240811184949.2799-1-eladwf@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_115011_905301_BB9F5526 
X-CRM114-Status: GOOD (  10.97  )
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

For LRO we allocate more than one page, yet 'skb_free_frag' is used
to free the buffer, which only frees a single page.
Fix it by using 'free_pages' instead.

Fixes: 2f2c0d2919a1 ("net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag")
 
Signed-off-by: Elad Yifee <eladwf@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 16ca427cf4c3..bac6d0c48d21 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1762,8 +1762,10 @@ static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
 	if (ring->page_pool)
 		page_pool_put_full_page(ring->page_pool,
 					virt_to_head_page(data), napi);
-	else
+	else if (ring->frag_size <= PAGE_SIZE)
 		skb_free_frag(data);
+	else
+		free_pages(data, get_order(mtk_max_frag_size(ring->frag_size)));
 }
 
 static int mtk_xdp_frame_map(struct mtk_eth *eth, struct net_device *dev,
@@ -2132,7 +2134,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				ring->buf_size, DMA_FROM_DEVICE);
 			if (unlikely(dma_mapping_error(eth->dma_dev,
 						       dma_addr))) {
-				skb_free_frag(new_data);
+				mtk_rx_put_buff(ring, new_data, true);
 				netdev->stats.rx_dropped++;
 				goto release_desc;
 			}
@@ -2146,7 +2148,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			skb = build_skb(data, ring->frag_size);
 			if (unlikely(!skb)) {
 				netdev->stats.rx_dropped++;
-				skb_free_frag(data);
+				mtk_rx_put_buff(ring, data, true);
 				goto skip_rx;
 			}
 
@@ -2691,7 +2693,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 				ring->buf_size, DMA_FROM_DEVICE);
 			if (unlikely(dma_mapping_error(eth->dma_dev,
 						       dma_addr))) {
-				skb_free_frag(data);
+				mtk_rx_put_buff(ring, data, false);
 				return -ENOMEM;
 			}
 		}
-- 
2.45.2


