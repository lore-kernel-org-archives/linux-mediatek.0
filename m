Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C37C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4985D613F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4985D613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YGvzv9AYxLBx+YF9PSt5PIyY5dbJpuwVMG8rqAn3lI0=; b=Js+GjwOdqOM0Mm9+UvSWEFdaO
	3oTO6qq473sKccfNO4JiGwuKKdXu3iZvdvCwgYWXmK9ErPu+eu052fxmIXYlUzOrPsVLMcE7VbqEt
	rOKJRzIN3NkNJeZxIyFqTmrYNOCvmugtZk5LrP85/2aw1gJ+eR129lN+9Pdo48G0j+feovnBYkMgM
	5CPRz+BJVWBGMbr81htj7ADlzAyn4Wej+O0dZxJGMZfE1nzByYf8EBPashujl+5p61LGXKsiB9Ohx
	9kcU9dVZFkg+ECgHoVBE9gGOHGW2Rzx1luGWaqM6YaWfztK5KxEKI3p9RJCpsyP73DFGFFEF56dO3
	CG1IVI7rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoPK-000hUl-Hu; Fri, 23 Apr 2021 05:31:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoGu-000fXo-CH; Fri, 23 Apr 2021 05:23:58 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so619371pjb.4; 
 Thu, 22 Apr 2021 22:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVCvFP7FkhaoSFqQuRF6Qi4Ni9yogvujik129mGGQRY=;
 b=b8DQMctCJXEHiD048Y5scEAzRTZ7QYvWF0SxauygF7xjyqpaGVHJSji2oR+CngdSj/
 vvS7D2kVSZtdUKViEdS0uSACqA5QM0IpxROAN41YOz8O9yNm4+RSTCa2GYpdTTZnGvA/
 NrCPPzaCIkTwUEL+ftiCUwGmNEvco9FLYkjBz7WLg19cJk/cENK55WipKFnstSh1vyhm
 ldz7VUzgN1E782MgEVp44U7FVEY7gY2anAgw5F0BC7BUwMmHOuXyAkA3zUC0HUa58uxH
 MQo0nC9HZTuh+PjehkK4X4hHwiVBoTDa3ADj/945jPJatpfXrlT72yao2WwYMjrZRHn4
 OeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVCvFP7FkhaoSFqQuRF6Qi4Ni9yogvujik129mGGQRY=;
 b=HDq2DF/oYy7fy1ol75jt9tQanqsShGVikGg8djd+/4HMJDQzgtV4McrRFPJc63ZvPV
 I+zJjY39cGRRM4Cl0m2VlASnrNMcr3oIqmDlpWYHvMeDBZJmLSqInDOwfkogyx5kZCN9
 hRyrtQurrlMTtGPD3bSpo4zRRvQvG5xGmjoOztkvRa4WSrJXDPkjb7NN6EyZCEEE1sSk
 10KBgE6OwaYyS5yLHJs5j2IyhedzDDRY9yrsFu3TMp34cLTWuEyjNXdqWAKGAaf2LHGK
 EzJG8R5Ore1BadONt6g1sLKdwD8JqwOkaOoPCo0xMzC4gwNdByeKiKQjyeiyXkhM95I3
 HosA==
X-Gm-Message-State: AOAM532juqNevJ5kd2Mc+oMMY1osl3PaossoeOUpRUZmH/QaYa4GfQP+
 pW5OzfDh0G+IjYQ7Hi4qDKE=
X-Google-Smtp-Source: ABdhPJzlYQGDMbvjAhTMbiHqgzZgVDWONAAlUkjdJXUrpAtnk/pfi10MLR7qP/KayIypU4kejcy7TA==
X-Received: by 2002:a17:90a:4f41:: with SMTP id
 w1mr3896776pjl.231.1619155289404; 
 Thu, 22 Apr 2021 22:21:29 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:29 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 13/15] net: ethernet: mtk_eth_soc: rework NAPI
 callbacks
Date: Thu, 22 Apr 2021 22:21:06 -0700
Message-Id: <20210423052108.423853-14-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062334_389529_7102D4C3 
X-CRM114-Status: GOOD (  13.30  )
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

Use napi_complete_done to communicate total TX and RX work done to NAPI.
Count total RX work up instead of remaining work down for clarity.
Remove unneeded local variables for clarity. Use do {} while instead of
goto for clarity.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 54 +++++++++------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e1792ccaedc3..8faf8fb1c83a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1496,7 +1496,6 @@ static void mtk_handle_status_irq(struct mtk_eth *eth)
 static int mtk_napi_tx(struct napi_struct *napi, int budget)
 {
 	struct mtk_eth *eth = container_of(napi, struct mtk_eth, tx_napi);
-	u32 status, mask;
 	int tx_done = 0;
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
@@ -1505,21 +1504,19 @@ static int mtk_napi_tx(struct napi_struct *napi, int budget)
 	tx_done = mtk_poll_tx(eth, budget);
 
 	if (unlikely(netif_msg_intr(eth))) {
-		status = mtk_r32(eth, eth->tx_int_status_reg);
-		mask = mtk_r32(eth, eth->tx_int_mask_reg);
 		dev_info(eth->dev,
-			 "done tx %d, intr 0x%08x/0x%x\n",
-			 tx_done, status, mask);
+			 "done tx %d, intr 0x%08x/0x%x\n", tx_done,
+			 mtk_r32(eth, eth->tx_int_status_reg),
+			 mtk_r32(eth, eth->tx_int_mask_reg));
 	}
 
 	if (tx_done == budget)
 		return budget;
 
-	status = mtk_r32(eth, eth->tx_int_status_reg);
-	if (status & MTK_TX_DONE_INT)
+	if (mtk_r32(eth, eth->tx_int_status_reg) & MTK_TX_DONE_INT)
 		return budget;
 
-	if (napi_complete(napi))
+	if (napi_complete_done(napi, tx_done))
 		mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
 
 	return tx_done;
@@ -1528,36 +1525,33 @@ static int mtk_napi_tx(struct napi_struct *napi, int budget)
 static int mtk_napi_rx(struct napi_struct *napi, int budget)
 {
 	struct mtk_eth *eth = container_of(napi, struct mtk_eth, rx_napi);
-	u32 status, mask;
-	int rx_done = 0;
-	int remain_budget = budget;
+	int rx_done_total = 0;
 
 	mtk_handle_status_irq(eth);
 
-poll_again:
-	mtk_w32(eth, MTK_RX_DONE_INT, MTK_PDMA_INT_STATUS);
-	rx_done = mtk_poll_rx(napi, remain_budget, eth);
+	do {
+		int rx_done;
 
-	if (unlikely(netif_msg_intr(eth))) {
-		status = mtk_r32(eth, MTK_PDMA_INT_STATUS);
-		mask = mtk_r32(eth, MTK_PDMA_INT_MASK);
-		dev_info(eth->dev,
-			 "done rx %d, intr 0x%08x/0x%x\n",
-			 rx_done, status, mask);
-	}
-	if (rx_done == remain_budget)
-		return budget;
+		mtk_w32(eth, MTK_RX_DONE_INT, MTK_PDMA_INT_STATUS);
+		rx_done = mtk_poll_rx(napi, budget - rx_done_total, eth);
+		rx_done_total += rx_done;
 
-	status = mtk_r32(eth, MTK_PDMA_INT_STATUS);
-	if (status & MTK_RX_DONE_INT) {
-		remain_budget -= rx_done;
-		goto poll_again;
-	}
+		if (unlikely(netif_msg_intr(eth))) {
+			dev_info(eth->dev,
+				 "done rx %d, intr 0x%08x/0x%x\n", rx_done,
+				 mtk_r32(eth, MTK_PDMA_INT_STATUS),
+				 mtk_r32(eth, MTK_PDMA_INT_MASK));
+		}
+
+		if (rx_done_total == budget)
+			return budget;
+
+	} while (mtk_r32(eth, MTK_PDMA_INT_STATUS) & MTK_RX_DONE_INT);
 
-	if (napi_complete(napi))
+	if (napi_complete_done(napi, rx_done_total))
 		mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
 
-	return rx_done + budget - remain_budget;
+	return rx_done_total;
 }
 
 static int mtk_tx_alloc(struct mtk_eth *eth)
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
