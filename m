Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BD0C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 19:31:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1521261260
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 19:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1521261260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=29CsuXH2NCEREad2BxS1WtTfpUEXh0MyHXrIV8C4ShE=; b=Wyodu6xxgITDmi8e+qQXr16x+
	0ltoIt5+sG0thw4+Ygyj2jEqgm6TRJcPdGkTxQwvmwNcF4RtHgQ+JtltfMvdBRGjr5GoBGKgV7y4N
	UdezFHsvmxqZKVgBjDg/Z+UIIo36Eq/EGmhjod0749cTBJgGZrd9wD+PtQ2yDn6PAJ/1KJBGD2xWG
	pqaTRyZSLIIB2qys/6fDDVZcrln/Y1MX+wtTtyEY5zKpqcxdp4O2Gktbo2r8EZJnsel/KAMP+gS9t
	VOZ7oEhovA7LMDEq3nLroW+5jNWb3FnkouiVgpRVa0M6HUWI8aANg/doeBy0Yf/jILkLC8oeQlHVu
	Csv44l/iA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhH37-006GuC-Qp; Thu, 13 May 2021 19:31:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGzG-006GVc-0r
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 19:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=j3rMCST+HXWYznkK+d1QOqqcV5rur8wbxkYAuvymJ68=; b=AV0/e+c3ipXz/T5PJRr5Rsveev
 lP9Wk07CUuNh8X4MPRmjVf6nn1a1qD2i3Q6PgtuzcyYSHp/LHuDp/WNp1U5pTW+mLe+hAUluycCJr
 ClDea8rq5OBcdIRURAfmYepuSU2XlZb2iWIP8JXlWleKcKt6poIh5SCIW+t3EWY/ZFUhl4rCUvq78
 eMsuRoVBG+sqAQpUkkx0Ib/YeXOa7xDePAFKvtgoTxAfwnxHh3s5ORaeFoa3YwCW4FhuDYk4qh5yP
 ltfo4ncAfZD7kXqe9HiqyNGPd6Y+ZMrBNl1ZWCHPMwaT0Gl6lp+1F7a5GUcejAZm8qVt0cZKjjhjQ
 SMoIGQrA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGzC-00BTYH-Em
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 19:27:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1423547wmc.1
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 12:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3rMCST+HXWYznkK+d1QOqqcV5rur8wbxkYAuvymJ68=;
 b=iXGsYQ3aCos5lh8Flu1CH3c2WhrNHPiobWA3CJU8S2Zz8hNAfgpCHFOZebov7jBkbF
 Wn2unDtn96RcYqNoxyyGGPD6cB7p5z7kbh+o7UPYKb92JhQHnaNnxLaRDB6euEqC2xlq
 WHPQdkleg4+U4bXIRxja/rnK9wDkRugP0Qlr3/pZ8An6N/QxpiV/2TpPtseqvZYh1bA9
 bJCWMYW4pHloFhJdImpV4B9182jUG7IbZlnadtCsoePmJ++T/G+eDes89+5sRrmhAh6r
 rfX2dOKLlck8NjWQv5xIlCbBzdsMzzO7PTmdmB315QSM3ttPdpjRwQBqT4rr7ld3o4+t
 xkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3rMCST+HXWYznkK+d1QOqqcV5rur8wbxkYAuvymJ68=;
 b=UBx8U3JVXptoVi3r/1mErGPpJIE0duZVhAIg205ugyUSRAw57xLbpkwYIwplADn5sO
 2gdEPnf/WNaEYyVwqtPxsgTAZqsmH8cP0MUd1nbY49n8QXeqQk2nEKaVAISRabSKxo+S
 WUGHwSNTYeFXPmgYN8AWrZrCT7nZlRYNqKmIyj0r1g8FOUi1euyXHvRRHVEpJdqb48G8
 SCY7VDVK+/MMBlfiUnMq3Rs0JdQ6v/3UqSJP0ftbtyZMGEMU06pqXDiyuEwi9o8JVxaL
 nscW/lKZJVvOA2PvqgiIESCWlsvWQN2SufuO0OWmZcoMpkdKeGUUaydfiNkdRAseoGaX
 UkhQ==
X-Gm-Message-State: AOAM532GQ6LVz0IBPcT/2MjwlxufQ7oESOwoiRw7L//8BJhxu1OGsJo7
 RT5SULqdP2e8KNYDFSBUaWAkGA==
X-Google-Smtp-Source: ABdhPJyX9nit3J47iZ6CZSouR97dqQsMArptT4kaSpWbjbao2AoF2xLXk9D9A8B8xJ4iYXcXD+LbXA==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr45992727wmq.4.1620934025298; 
 Thu, 13 May 2021 12:27:05 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-d842-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:d842:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h9sm3053621wmb.35.2021.05.13.12.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 12:27:04 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dmaengine: mediatek: do not issue a new desc if one is
 still current
Date: Thu, 13 May 2021 21:26:41 +0200
Message-Id: <20210513192642.29446-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513192642.29446-1-granquet@baylibre.com>
References: <20210513192642.29446-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_122706_530296_BCF47058 
X-CRM114-Status: GOOD (  11.98  )
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

Avoid issuing a new desc if one is still being processed as this can
lead to some desc never being marked as completed.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index e38b67fc0c0c..a09ab2dd3b46 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -204,14 +204,9 @@ static void mtk_uart_apdma_start_rx(struct mtk_chan *c)
 
 static void mtk_uart_apdma_tx_handler(struct mtk_chan *c)
 {
-	struct mtk_uart_apdma_desc *d = c->desc;
-
 	mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
 	mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
 	mtk_uart_apdma_write(c, VFF_EN, VFF_EN_CLR_B);
-
-	list_del(&d->vd.node);
-	vchan_cookie_complete(&d->vd);
 }
 
 static void mtk_uart_apdma_rx_handler(struct mtk_chan *c)
@@ -242,9 +237,17 @@ static void mtk_uart_apdma_rx_handler(struct mtk_chan *c)
 
 	c->rx_status = d->avail_len - cnt;
 	mtk_uart_apdma_write(c, VFF_RPT, wg);
+}
 
-	list_del(&d->vd.node);
-	vchan_cookie_complete(&d->vd);
+static void mtk_uart_apdma_chan_complete_handler(struct mtk_chan *c)
+{
+	struct mtk_uart_apdma_desc *d = c->desc;
+
+	if (d) {
+		list_del(&d->vd.node);
+		vchan_cookie_complete(&d->vd);
+		c->desc = NULL;
+	}
 }
 
 static irqreturn_t mtk_uart_apdma_irq_handler(int irq, void *dev_id)
@@ -258,6 +261,7 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int irq, void *dev_id)
 		mtk_uart_apdma_rx_handler(c);
 	else if (c->dir == DMA_MEM_TO_DEV)
 		mtk_uart_apdma_tx_handler(c);
+	mtk_uart_apdma_chan_complete_handler(c);
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 
 	return IRQ_HANDLED;
@@ -363,7 +367,7 @@ static void mtk_uart_apdma_issue_pending(struct dma_chan *chan)
 	unsigned long flags;
 
 	spin_lock_irqsave(&c->vc.lock, flags);
-	if (vchan_issue_pending(&c->vc)) {
+	if (vchan_issue_pending(&c->vc) && !c->desc) {
 		vd = vchan_next_desc(&c->vc);
 		c->desc = to_mtk_uart_apdma_desc(&vd->tx);
 
-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
