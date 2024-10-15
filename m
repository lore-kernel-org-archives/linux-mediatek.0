Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B76CFC28A
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 11:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mrBSUlA65UftkpATPLrRQIlIiwqBHNpOsskKA65gcc=; b=LNlDYtceU/yyecLc2WJkBZoDpT
	42n8QJEQiDheMaTHNzpp7QOuYI1fG5/2SXat8Jm4xsY+LcfjlrRjG6Htpd7FuRpoe+cknlqeYUv+A
	BYrgng44BLmqk5m+BYxwlTOYFZlfRY/IYPsEgDpRbEnJcYb6kwF28ltsQeM2uWxzTJk62wLZGfu5d
	3l40arKr1iF54l20fwPHHDKgBqSa6F0k5Q5FFl1kiqzo1TONqGFf8UDWx/X13soPe+Zpu24Y1KJoS
	ZUhB1NVAImcOVmatWEYIyGIm7A7aC9U1qLz9uVXjetLUqScW8l2H751bl+kaHYHgG13QoXObgxZ4c
	p/tRHTiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fXP-00000007zCg-176P;
	Tue, 15 Oct 2024 11:16:27 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fR5-00000007xvV-27hq;
	Tue, 15 Oct 2024 11:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/mrBSUlA65UftkpATPLrRQIlIiwqBHNpOsskKA65gcc=; b=Ja3YFPd0tLHgX6PRBueMkS+dNx
	l3dbc091tXL2lZ84yyHZpccPr7mZ9aKtHnGVTgh/lQe6ge3CFl33L0u1Uz0RzJh16UKyroGu8V6Qq
	a+X/uWsrhfmfkMtbdu18El3J0IrjHaz+2zqI/JF/8CgnIvzkdUg52JJ2FQRGQG3F+w5Y=;
Received: from p54ae9bfc.dip0.t-ipconnect.de ([84.174.155.252] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1t0fQr-0096bC-38;
	Tue, 15 Oct 2024 13:09:42 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 2/4] net: ethernet: mtk_eth_soc: use napi_build_skb()
Date: Tue, 15 Oct 2024 13:09:36 +0200
Message-ID: <20241015110940.63702-2-nbd@nbd.name>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015110940.63702-1-nbd@nbd.name>
References: <20241015110940.63702-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_040955_646236_71FD71F0 
X-CRM114-Status: GOOD (  10.99  )
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

The napi_build_skb() can reuse the skb in skb cache per CPU or
can allocate skbs in bulk, which helps improve the performance.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 4a9cf06bdff5..4e4ece5e257a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2137,7 +2137,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			if (ret != XDP_PASS)
 				goto skip_rx;
 
-			skb = build_skb(data, PAGE_SIZE);
+			skb = napi_build_skb(data, PAGE_SIZE);
 			if (unlikely(!skb)) {
 				page_pool_put_full_page(ring->page_pool,
 							page, true);
@@ -2175,7 +2175,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
 					 ring->buf_size, DMA_FROM_DEVICE);
 
-			skb = build_skb(data, ring->frag_size);
+			skb = napi_build_skb(data, ring->frag_size);
 			if (unlikely(!skb)) {
 				netdev->stats.rx_dropped++;
 				skb_free_frag(data);
-- 
2.47.0


