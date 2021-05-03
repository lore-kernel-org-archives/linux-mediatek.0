Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822DFC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 15:27:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC25561073
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 15:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC25561073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VStLzrQJs0jeaBLBUIAQSrLxFec0Ef/SJeld9aXsQlI=; b=BO9fDI2wcyskUk
	Jxm6pq7dvcQiCN0lEsUpKUKuULqt8bO3t5YH4GYy9sMom8K0F+NdoJsFRToRYCcTkEA6SyKiugl12
	mHUetmiBN+4/h3V0g4Ua4Glio2OH7zzRZppx05GUmxAJY5AFHJQnyAG3rMxyLRff5GQVGBU36WmJ4
	1NDRRqGUytDFjLmYCARxGIYz3coZN37z0yzkb3pKC++XkZ/zqhiVPRlCMfqekyCrx7/RHwENKmJtF
	7j+eQMdSXajYFX8sB4jzWDTSZhLhu50pku20oOvOZno79gpNfbl8bKMPCtsIcUGUJuy93sXmDC4Wi
	fOnTbNexRW80xpGZEbSA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldaTZ-00EECM-Mt; Mon, 03 May 2021 15:27:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaSy-00EE6h-VN
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 15:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+0TCMPSPgNnKaQLcoOaFiNFXoz3PHgbrfotliZuGoqU=; b=Gv5l6T9OdC1EPFiPZouWCIwjCN
 dTzNVmvSn2w7TdVOUTnLME32skB9oEGmatWn2YovWUPSO+hZkFBxpkhGdWfioYilD7K2xtsSGD15+
 VfA7LaS7vCQq+33cxgEkzQBeZQZNYE5tcf2F7PlhkaQA0BvqBY4/TR8pR2ICznaj7qLQUJB8R8dVO
 PFMobeWUaGL7z1E9xgIw3dtrVtnutQEBVMv7jte69J/8m3VYslKPv6+bHHk+S/LvI/XXUH++zMpt1
 6onsNnGTsIVse9CU9ceqP4AWUWn+6rDmlUCDTdcXK7U5F/d2lQlyTsWvi4fl95ySNMBHpnaxIbWfc
 PikiLvZA==;
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaSu-003Auo-EQ
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 15:26:35 +0000
Received: by mail-oi1-x231.google.com with SMTP id i26so5743142oii.3
 for <linux-mediatek@lists.infradead.org>; Mon, 03 May 2021 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:cc;
 bh=+0TCMPSPgNnKaQLcoOaFiNFXoz3PHgbrfotliZuGoqU=;
 b=z7g3kLcgZlbrRBtb8CCRI1h9u/bLF74VDrbBqfM72Yarr8dimSBTyLlvUTL1zBDjYN
 lUG3Ju6NPYHf5r9ez9mmShBUiODfIb5zLctDXgickNqHAmb9FYvkTtbaOcAeSCmLL6RF
 g72P90/Eo9OBv9wMPqHUnoSlImhyJfoORfu6cs4gBVwqyJXzTp2GrVLfydcz2RZQVVPy
 X1wtYXCDqm3Ak2HWImonIZaWp9hRBpxduRgoVQttGQLnLOArw9nGHcD8De5dH1AqtumN
 QR7EGAOUt+E3AHUmsk8vYJC1ZN+G9VKPvxF6sHmUrxXfgZT/HGfEYUWIKp+TTwM6dhES
 kMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:cc;
 bh=+0TCMPSPgNnKaQLcoOaFiNFXoz3PHgbrfotliZuGoqU=;
 b=bDoj6PmaApPcKK2ta01QdqsRDs4g8ZC8kGMpmRRVS515aa7446lY9zzGbdpuh5J8GK
 y2FJEi4HEHLFmbHTetLhRTN7xK4I2Lyk71xtL39z8PlindcijPGwjqqIiXxPnzrj2wlN
 sJ/rymdljWWbykHHw+9C3rwZ7YZP4wN0eS/jwfP780rSAS4s/swTKBBrYnrWjwsQupl0
 8SONq6mFd9Kn/MogCCQ9cXhofcPrWpJnOYOogBjUVz466CwungfFzn8zeTLooFxB0wF0
 OIdVzqw2YNqxAhCi9UrCTWpYoviN75ZkCVirpv6XssGNyyhqqV4qLZjNSod3Gaijz/sg
 4vYg==
X-Gm-Message-State: AOAM532cRyxyXe4vkRJx5VpSGUhfPNiWysUBQzZvkk6y5vGYuBghZmro
 3psQpbA5AUdwpD6XU/BOeBDbAKgjalu94/GnllDP6Q==
MIME-Version: 1.0
X-Received: by 2002:a54:4f07:: with SMTP id e7mt10487611oiy.140.1620055590361; 
 Mon, 03 May 2021 08:26:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 08:26:29 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 3 May 2021 08:26:29 -0700
Message-ID: <CABnWg9vHxXSxDeBxjMCOHtCDogL+jUXMq9-SCC8x3zmaV8wL0g@mail.gmail.com>
Subject: [PATCH 2/4] dmaengine: mediatek: do not issue a new desc if one is
 still current
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_082632_511948_73D22785 
X-CRM114-Status: UNSURE (   8.61  )
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

Avoid issuing a new desc if one is still being processed as this can
lead to some desc never being marked as completed.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c
b/drivers/dma/mediatek/mtk-uart-apdma.c
index 4610dbdde75e..249cabddb7ee 100644
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
@@ -258,6 +261,7 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int
irq, void *dev_id)
 		mtk_uart_apdma_rx_handler(c);
 	else if (c->dir == DMA_MEM_TO_DEV)
 		mtk_uart_apdma_tx_handler(c);
+	mtk_uart_apdma_chan_complete_handler(c);
 	spin_unlock_irqrestore(&c->vc.lock, flags);

 	return IRQ_HANDLED;
@@ -363,7 +367,7 @@ static void mtk_uart_apdma_issue_pending(struct
dma_chan *chan)
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
