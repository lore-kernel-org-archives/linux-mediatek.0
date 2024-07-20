Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FB6C3DA59
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jul 2024 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l6XmwiNF0U9ALABlmqNHLWtjd5nTEgsEVV0Hcqvx7zs=; b=YEKCKYD2zmAIE+JFZk24SAvW6U
	NkQv5YGBHH6f/Z2Ta6jCRCmR5KX7WYAsk5TIxMtq+Du8gDkWrNpYrYbhOyRr1TEKll9JjPGgvw+HS
	bIRs30h6aBkQstYyJ0O9xr2PlIfsvuLSASztI1vSB2Bzw8dbREA7wzlxjZu30w1l2UOsG/AOKXrgC
	cEQW0D+ep1xcvjSWADr+DkJ9cbX1H/C0emTXXPifn5Cpv9D9FmxykL9OYrx3Mzfa+k+v7yQrW1aWY
	ofnlhpDwvKMeHNjud6iE5jMsfB4xWHPtqKdnHyNpC8RjG3J99PdgEZRZHkV3SNDbYLh2XX7vb+eEf
	pfbMM/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDEq-00000005OII-2wZH;
	Sat, 20 Jul 2024 16:47:16 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDEU-00000005OEO-02Hs;
	Sat, 20 Jul 2024 16:46:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-36844375001so1374408f8f.0;
        Sat, 20 Jul 2024 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721494012; x=1722098812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6XmwiNF0U9ALABlmqNHLWtjd5nTEgsEVV0Hcqvx7zs=;
        b=BxBdW/C8MmAT17EQyAvDUEEPHdlCC1E/NBhCx2CgIxT+SdyeYhWZMs9lDXtAhqH5g5
         +5ZQ4R9naWf9YMADh/y1ot2/4wz0QBf5zKu+7sTzPV658YX5y//zasQxZDd2AHmW6SUh
         6hytJSEQ2UGRu4spzT9ixQD+j2KHi8p4QWtVqp32sCrkNt1n9mnvXdpmhApnjdxf+z19
         LR+aoCoXuxyzEJ9FdWQOkP/+/1lhVbpZUcr0JqzC+4CIRIpYbi8fpmPX3hlCGi7GPCoZ
         zv4GkTpqMn3SiscKC3K1KHu/ZJs9BoMQtJCogBARuLxvbQRwkk6DQjsp1uCtg70Tke4d
         mUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721494012; x=1722098812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6XmwiNF0U9ALABlmqNHLWtjd5nTEgsEVV0Hcqvx7zs=;
        b=V6RQjYOU4m9BIVGyz/t4cxe1nYHmBwf9626zhqUnprORSXS/a6436+5w9ueC4Rg+nB
         TfqWE5sCR9Ne3n3K8X2stWV1ul4SHw10MS0HIYwr52dyluw7Z1ARtOF2W7YQqVXX9dmC
         3UcFTuI8n/kh72TABVQxmqnij5izhs9b614JHfTdEKss3KxeamcYhwuQN4FhgxgQK69K
         z6q7Yfci9xff+aMgDgv/zmjIQa9j+KR/Yfj3mOoavjTE4na7MvGgN5fVckA9P2po4aFu
         No8pIpHzEH3BvYDP/UBT6PHgGjZSqaULHyYU3AOFGa3V9Lg+O6TTotl/yC6jwkiHBQ97
         SkDg==
X-Forwarded-Encrypted: i=1; AJvYcCVvZnUYoF1fQfId1Z70rKO2KS/i/z21wUPOa3Y7aouqKESadgEAzAZQoI+Y5UFFmxO8FYCu8oXLAsyzHmLpCT1vTY9aY89eqIvx4Dx1/2cOZSZakYxl/fA4TmRFniFzVcEBsUtLuo0SdrOgcLgdt/y/y3S+CZkHQOc=
X-Gm-Message-State: AOJu0YwIOtIpo3E31xi4zLbs6DzSTMbnfLVnWfdy/nEOIht+SYRIfn7W
	I3Dr1clkKM+rr7ZsZwqcmw9cXigdMY6VUmmKrBai3jr6JduSu3vi
X-Google-Smtp-Source: AGHT+IE5Pz7ugxkqfgR4dRjntSLua/ddvvNazQUyapOJH+FfafymKxtCwgQeo94JmRGb5cwc1ufI9w==
X-Received: by 2002:adf:a15a:0:b0:367:4dce:1ff5 with SMTP id ffacd0b85a97d-369bae50e74mr1120538f8f.32.1721494011616;
        Sat, 20 Jul 2024 09:46:51 -0700 (PDT)
Received: from yifee.lan ([176.230.105.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787eda2fsm4293616f8f.108.2024.07.20.09.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 09:46:51 -0700 (PDT)
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
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: use prefetch methods
Date: Sat, 20 Jul 2024 19:46:18 +0300
Message-ID: <20240720164621.1983-1-eladwf@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_094654_070911_2AD98545 
X-CRM114-Status: GOOD (  10.87  )
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

Utilize kernel prefetch methods for faster cache line access.
This change boosts driver performance,
allowing the CPU to handle about 5% more packets/sec.

Signed-off-by: Elad Yifee <eladwf@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0cc2dd85652f..1a0704166103 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1963,6 +1963,7 @@ static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
 	if (!prog)
 		goto out;
 
+	prefetchw(xdp->data_hard_start);
 	act = bpf_prog_run_xdp(prog, xdp);
 	switch (act) {
 	case XDP_PASS:
@@ -2039,7 +2040,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
 		rxd = ring->dma + idx * eth->soc->rx.desc_size;
 		data = ring->data[idx];
-
+		prefetch(rxd);
 		if (!mtk_rx_get_desc(eth, &trxd, rxd))
 			break;
 
@@ -2105,6 +2106,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			if (ret != XDP_PASS)
 				goto skip_rx;
 
+			net_prefetch(xdp.data_meta);
 			skb = build_skb(data, PAGE_SIZE);
 			if (unlikely(!skb)) {
 				page_pool_put_full_page(ring->page_pool,
@@ -2113,6 +2115,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				goto skip_rx;
 			}
 
+			prefetchw(skb->data);
 			skb_reserve(skb, xdp.data - xdp.data_hard_start);
 			skb_put(skb, xdp.data_end - xdp.data);
 			skb_mark_for_recycle(skb);
@@ -2143,6 +2146,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
 					 ring->buf_size, DMA_FROM_DEVICE);
 
+			net_prefetch(data);
 			skb = build_skb(data, ring->frag_size);
 			if (unlikely(!skb)) {
 				netdev->stats.rx_dropped++;
@@ -2150,6 +2154,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				goto skip_rx;
 			}
 
+			prefetchw(skb->data);
 			skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
 			skb_put(skb, pktlen);
 		}
-- 
2.45.2


