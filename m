Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073DFC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:13:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62FC861424
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62FC861424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QCSGd9u+ekDmAEfTtS//OOvJ0R/aYYtla3lS5AzoRG8=; b=FKq73uXg1et2tnggcSkzTU/nD
	o2zq7iAjf+2BOrXo2KSM2XubhY8WQBx/wpeJGwtkg3+N0ZgovtkruNnQL55BVf82TNNT33hWxHTcC
	M20nAh5cegtXJBhZONwjV55lNFFOnQDm+OBE7lk+qnAdeZTgtj9lpnc6Gh94bfDwTadD4ZOVHJRBu
	6y42hx2D05lKtyRY9gNxfjw/r6eQRxwAiOfNVXYoct7CvivbgGSg8n6Vw4e8TgJ2MYuZ6z1TXjoqD
	tuI8NmNF12MZxxj7WNvbOpdzeOhyUouapNCvL9tcAiUnO3uXDkBf7daSPKuZv7oMsF4XQhqBJQ5/1
	8dd2n3jwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQi9-00FmXM-3u; Thu, 22 Apr 2021 04:13:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQey-00FlRv-S4; Thu, 22 Apr 2021 04:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Smtj4gwdxb0ZLZIeEWGZNPNrgYDMaUuIXb1nAA+jADw=; b=mDgEDLNe0auUKNl18dj1z2fXt1
 497J/htqkb4tEXRmlXZaW+fU5My6aEapP82DcrMb6zVIsxNmQXb6HH+In2DEChB13Qea/PQmOXyaR
 0WTUVvnapu43HhPrQYtRoUW0YK68JCdN7xm6d89BV1DRaCVr3NuaCWq+Lf+STyc/F5EogD8z1Wz9r
 a9kVrJJYYUQR2Yyf945XA29KX1hC0PbUxgT2d8knnwcLReUaAWvlK0IOb4oQGj3brzfI/6lhxqIPW
 928Rluq0fAIRW3u5U7m+bve/ht57OMICLGoG949EtBqIoO1dlL1ri/Bt48jPcb2n2vfosfuUGIA8m
 A7Rlui7g==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQew-00DLfP-Bq; Thu, 22 Apr 2021 04:09:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso240313pjs.2; 
 Wed, 21 Apr 2021 21:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Smtj4gwdxb0ZLZIeEWGZNPNrgYDMaUuIXb1nAA+jADw=;
 b=m2/PbzI84d6d9OgipdUa6ooqlmZ1yTJHHypRkqQkG2bpVUy3ScKdKsanBUcLcxPxe1
 49Kl7GHhccN4bfMUvm5TbmHyZOKAy0qg1/Lkgd4NpuXTRdVO447y3T1pUIZNBFe+LkVB
 X2sHi/hwQvHU3pJJ8ahjC6omiel2gEdz77r1GYe90YLzLabr0xm7vqS7hBAison6UqOv
 1BUr3umNN7qJe3cJGP4m7zsIIndBNxgYdCrODgwC1Lwzkt4BXbwzaPs9/jhbmsg2+mM8
 0dH7Ab68oGanlDKPvEZLj18t06rr10OH3gBzdHJghF7LbzlSlKd2MXyLZtPiVMow5lUH
 T4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Smtj4gwdxb0ZLZIeEWGZNPNrgYDMaUuIXb1nAA+jADw=;
 b=SMckl3mL7SYXIAVMcaLX4Fj78e4569umUDVpGGIr6sbJlJGie2RlSUEVtE0Whq/VYJ
 f1dYlh6nNummpZ3XOCPHecOiCiS29qAyomJevDspboVyjK8LCzEc733ZR5vYk6/rGuAq
 FMs8QoWpNeZ3tfUq4cfQMwvxY3fKGz5TdeRNIpOYDYR9iOXnSSJgBKCsAN8DBy47eaRw
 3Bq+nqgdNoLgjaOe9YOXw5rAXpnuRl59gz6syZJg+ZrVGbzoirtTfWw+C5UpgTaQUf3E
 4o1TksuY1MipkwCqY/e1f3fS6WxHvMw5wGuyrOfgR5/MJWtfZBg3ZKdx4N9w4miMnM/J
 lHYQ==
X-Gm-Message-State: AOAM532oD8uoWOq1ETucxV0/hw9kHlWag7JmsnAvgX+ta9wqDnXvufrj
 GWeAHyzZ4YZxU7TaQ7ymijk=
X-Google-Smtp-Source: ABdhPJw/RJBg5z72O0mNnzutjMCrzGHJDTgHgizsfQ9xv1oCCJjoF/x/bDrceXqjOabCBFD3JsC4ew==
X-Received: by 2002:a17:902:edc4:b029:eb:159f:32b7 with SMTP id
 q4-20020a170902edc4b02900eb159f32b7mr1461172plk.11.1619064585968; 
 Wed, 21 Apr 2021 21:09:45 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:45 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 10/14] net: ethernet: mtk_eth_soc: cache HW pointer
 of last freed TX descriptor
Date: Wed, 21 Apr 2021 21:09:10 -0700
Message-Id: <20210422040914.47788-11-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210946_427930_4153ECF9 
X-CRM114-Status: GOOD (  15.27  )
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

From: Felix Fietkau <nbd@nbd.name>

The value is only updated by the CPU, so it is cheaper to access from the
ring data structure than from a hardware register.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 ++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 043ab5446524..01ad10c76d53 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1362,7 +1362,7 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 	struct mtk_tx_buf *tx_buf;
 	u32 cpu, dma;
 
-	cpu = mtk_r32(eth, MTK_QTX_CRX_PTR);
+	cpu = ring->last_free_ptr;
 	dma = mtk_r32(eth, MTK_QTX_DRX_PTR);
 
 	desc = mtk_qdma_phys_to_virt(ring, cpu);
@@ -1396,6 +1396,7 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 		cpu = next_cpu;
 	}
 
+	ring->last_free_ptr = cpu;
 	mtk_w32(eth, cpu, MTK_QTX_CRX_PTR);
 
 	return budget;
@@ -1596,6 +1597,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 	atomic_set(&ring->free_count, MTK_DMA_SIZE - 2);
 	ring->next_free = &ring->dma[0];
 	ring->last_free = &ring->dma[MTK_DMA_SIZE - 1];
+	ring->last_free_ptr = (u32)(ring->phys + ((MTK_DMA_SIZE - 1) * sz));
 	ring->thresh = MAX_SKB_FRAGS;
 
 	/* make sure that all changes to the dma ring are flushed before we
@@ -1609,9 +1611,7 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
 		mtk_w32(eth,
 			ring->phys + ((MTK_DMA_SIZE - 1) * sz),
 			MTK_QTX_CRX_PTR);
-		mtk_w32(eth,
-			ring->phys + ((MTK_DMA_SIZE - 1) * sz),
-			MTK_QTX_DRX_PTR);
+		mtk_w32(eth, ring->last_free_ptr, MTK_QTX_DRX_PTR);
 		mtk_w32(eth, (QDMA_RES_THRES << 8) | QDMA_RES_THRES,
 			MTK_QTX_CFG(0));
 	} else {
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index a8d388b02558..214da569e869 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -642,6 +642,7 @@ struct mtk_tx_buf {
  * @phys:		The physical addr of tx_buf
  * @next_free:		Pointer to the next free descriptor
  * @last_free:		Pointer to the last free descriptor
+ * @last_free_ptr:	Hardware pointer value of the last free descriptor
  * @thresh:		The threshold of minimum amount of free descriptors
  * @free_count:		QDMA uses a linked list. Track how many free descriptors
  *			are present
@@ -652,6 +653,7 @@ struct mtk_tx_ring {
 	dma_addr_t phys;
 	struct mtk_tx_dma *next_free;
 	struct mtk_tx_dma *last_free;
+	u32 last_free_ptr;
 	u16 thresh;
 	atomic_t free_count;
 	int dma_size;
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
