Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52328C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0C2613F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0C2613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bD/3i+6eZs4kc/G7/xtxnMlhld/hDab0n1YAHHEzkcY=; b=CSVZCy8V5nz3xXZsaSe/kjoBC
	nw/nIKnHxJMkSkTggWLNBZFSerzdfyTaRlkZeYCgVzQXCqiRA2cvoZ0XkTKJMCA4RIL2oKCg8HjmY
	7oir1LlzCrmOaRCe64EgyJJxfJ/DIJhjtFP/sgDrkyIRq774VddN8VOjsTFfJ8PcMy9k0UR+v1AP/
	tbCWe6YnVGAPIjbFy8XribGxv2OUgwpZO1P2FbEaJo1Ld/cgGcDmnwbw7tqZWdV2nQf2VCb+DMms/
	J4x8xY341lu6b/VUfdg3qQ0D497z35RuU5aGpcpwOz0Sh8aUGzFETcVq57U3SJNNvCnBv2f8lyEbN
	jbvkE09KQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoPg-000hg7-37; Fri, 23 Apr 2021 05:31:36 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoHk-000fbO-16; Fri, 23 Apr 2021 05:24:04 +0000
Received: by mail-pg1-x52c.google.com with SMTP id p12so34440212pgj.10;
 Thu, 22 Apr 2021 22:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VddRnX0bE97CmvaALzam+ApYpCJ5QzcFqH5F34H/Njg=;
 b=joV3J9h1Tn+aV8SS5MNFC/VGzBuKjiBRrMggkam1ZnBX6VW1YfhMIYGe9j6VsyClqk
 3kGCcITNUb2WQxv8k0UzIv7s+r70pZ0MQ/nNpHF0ivP2NA15IsKmx7vrkbAxDB84yAL9
 sEiYi55+jLK1NbaL7LHlqUHOEP3j5lHJ03hRDcLF6X3qhBhaOu0wFzYmFl0DRzCOgwvr
 LcWgzDf0pVeU0m2iltwEEsWtshqZ0NEmCQ46wflAazkL6l2xjJFUgbhbu/m5X3nB/FOj
 x00rhsyeMQzmjMI5lxarCgHUcPrZNSTUEg7ORrIIaZb7gesP8kbUtYxNuo3bnNP52b8b
 r2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VddRnX0bE97CmvaALzam+ApYpCJ5QzcFqH5F34H/Njg=;
 b=Esi+72QN1cd7EeewDK/j4ZugUkHhF5BujGHbqS4jbeZ1/edQQ5ZK9ybejjSfff1wKq
 FZAeDp2zscmlhABalHTL3Z3amjwUM+vZlJ3ULcQgvBm0ydIuUbnUMM0f7+mSAOFzqNom
 X7j//bfGwu1Tgi0e03zJdIfS0F74gNTlX+720xHekqQ7WFygRhBDB+R/PM4bxQGZi7Eg
 8D7zLS0oaoDIPqfA5yYh/YftevahXUJOcpGENDyeCoYs+Sf3gQYC6QIlltxiKkp4hvQO
 sVnPSUrCkX5Wx4I4gomFnmDWWwuUIPAtlSE97W90kvM5XDzT74g7HHTI2sQNRdbnFts/
 +uKA==
X-Gm-Message-State: AOAM5311lYLyHsUxMd0gWanrTNG2XbT4bzPUvRdNSgrdBu1x+n2ecqcx
 Ut8zPU7tOSSWhTDwYJD+OFg=
X-Google-Smtp-Source: ABdhPJzvwQj5389BqDSDkiHBaH24ca03aWG0rJvfV0xgiI9wYJxOtUVDhmwwNFLi+bcqrW0T8d0Pxg==
X-Received: by 2002:a63:344:: with SMTP id 65mr2186120pgd.24.1619155281653;
 Thu, 22 Apr 2021 22:21:21 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:21 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 04/15] net: ethernet: mtk_eth_soc: use
 napi_consume_skb
Date: Thu, 22 Apr 2021 22:20:57 -0700
Message-Id: <20210423052108.423853-5-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062403_319446_9BB3EEEC 
X-CRM114-Status: GOOD (  13.10  )
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

Should improve performance, since it can use bulk free

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 07daa5de8bec..5cf64de3ddf8 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -858,7 +858,8 @@ static int txd_to_idx(struct mtk_tx_ring *ring, struct mtk_tx_dma *dma)
 	return ((void *)dma - (void *)ring->dma) / sizeof(*dma);
 }
 
-static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf)
+static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
+			 bool napi)
 {
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		if (tx_buf->flags & MTK_TX_FLAGS_SINGLE0) {
@@ -890,8 +891,12 @@ static void mtk_tx_unmap(struct mtk_eth *eth, struct mtk_tx_buf *tx_buf)
 
 	tx_buf->flags = 0;
 	if (tx_buf->skb &&
-	    (tx_buf->skb != (struct sk_buff *)MTK_DMA_DUMMY_DESC))
-		dev_kfree_skb_any(tx_buf->skb);
+	    (tx_buf->skb != (struct sk_buff *)MTK_DMA_DUMMY_DESC)) {
+		if (napi)
+			napi_consume_skb(tx_buf->skb, napi);
+		else
+			dev_kfree_skb_any(tx_buf->skb);
+	}
 	tx_buf->skb = NULL;
 }
 
@@ -1069,7 +1074,7 @@ static int mtk_tx_map(struct sk_buff *skb, struct net_device *dev,
 		tx_buf = mtk_desc_to_tx_buf(ring, itxd);
 
 		/* unmap dma */
-		mtk_tx_unmap(eth, tx_buf);
+		mtk_tx_unmap(eth, tx_buf, false);
 
 		itxd->txd3 = TX_DMA_LS0 | TX_DMA_OWNER_CPU;
 		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
@@ -1388,7 +1393,7 @@ static int mtk_poll_tx_qdma(struct mtk_eth *eth, int budget,
 			done[mac]++;
 			budget--;
 		}
-		mtk_tx_unmap(eth, tx_buf);
+		mtk_tx_unmap(eth, tx_buf, true);
 
 		ring->last_free = desc;
 		atomic_inc(&ring->free_count);
@@ -1425,7 +1430,7 @@ static int mtk_poll_tx_pdma(struct mtk_eth *eth, int budget,
 			budget--;
 		}
 
-		mtk_tx_unmap(eth, tx_buf);
+		mtk_tx_unmap(eth, tx_buf, true);
 
 		desc = &ring->dma[cpu];
 		ring->last_free = desc;
@@ -1627,7 +1632,7 @@ static void mtk_tx_clean(struct mtk_eth *eth)
 
 	if (ring->buf) {
 		for (i = 0; i < MTK_DMA_SIZE; i++)
-			mtk_tx_unmap(eth, &ring->buf[i]);
+			mtk_tx_unmap(eth, &ring->buf[i], false);
 		kfree(ring->buf);
 		ring->buf = NULL;
 	}
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
