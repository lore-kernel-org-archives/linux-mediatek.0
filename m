Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994B0C4741F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 07:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3659320848
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 07:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2odGLpb9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GvVQ+kAG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3659320848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pog1i/wGOuucftQqbOly1TDy9Sp7WonixyWDoTwbT/Y=; b=2odGLpb9u76tppFVNmwt8+13U
	qyK0OI1UI+GdjPxFzD2Oo6F+jEQVA/cgPlj4TqClq0v8YX4yA9/7BdIoJBtxqfBfBhe/4vXKiRuQg
	d2Coz1qi3bAfvD/r0NdovnRBu+POuFhG364ExWeUtC/kbh6mszzGRTPY7z8EYxz3iHCMhdram7BQ+
	f2ceEjB6xQQ4OBU0htYp4nkrCzVsrElCBl5Y1WCUKBuAfqA45vGmhrJrYDo2zfsfdSerxCW599q2j
	A2Cc62fHtvRSFxR5i21igzZQzUCg6zJjF1y3AxAqlXpv672QfXTm8irf/TzUFpTUwSp5Wf6+AXahu
	Rn4dg47PA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNAE9-0002q2-Hl; Tue, 29 Sep 2020 07:39:09 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNADm-0002g5-Op
 for linux-mediatek@lists.infradead.org; Tue, 29 Sep 2020 07:38:49 +0000
Received: by mail-pg1-x541.google.com with SMTP id s31so3154292pga.7
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2020 00:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rdWz+ZyG62m5arW+Qy6bGdg2LVkta9/ER2EhDPjnR0s=;
 b=GvVQ+kAGZRMHDvFY+dX0CiorSG0wudjaaSuFKXMLGOMZCTG/Ve9qYDA+7MGGLXXAcT
 VuHqgAl5RBIeWHgeoonxdMFugZ3JceAqI/WLejNr1SjJODLRcB2ZWT2jrtmIUSaXX/bu
 cN5O8FcycZx0hgad1TZdbxAK9r8oErQLgTFHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rdWz+ZyG62m5arW+Qy6bGdg2LVkta9/ER2EhDPjnR0s=;
 b=B3JHrZYc7JY3CH5LmX7wecaKkxdVL/1H9y5p+bFh/ZRL9G6IEnFsKbjR7ngMlc4pOT
 o8WOdVpay+XI535Wdyoj9IcM6IyInXyimjWn7kq1AsfR4WjRjdPP797I+ZHiQbQV1MuL
 GxL2bR52CT0fQWblelWSfn1hqjL5POrCnQRnzJoeTsewUBbvopEP0TJESE32nL0kmHXD
 cKpA3swGnNSTpCkcPLzb18QU9tPRk2xd1nPl2i1mXtrWz5ZLwsnVytv7xenucqqZ1yKb
 /6EyGqO1NWzV6pOlCJiBcj8tydiVozp/LmqfwlZXohOqELCefq+19v3rcPGbrJHHJJij
 h4Ww==
X-Gm-Message-State: AOAM531E4xIpjDRNj+HBKjChyeFbLgLU9GAO5yoWI5dq2LvEte5ewS5U
 r9NZu55NMgWcw7MOmok+cOAfJw==
X-Google-Smtp-Source: ABdhPJwLJTU9cxoMZuGNs9a4koIqVDQ2Ze6yK26tMjSimBv2MYtu7K5VT9yr3F3lAgWk7FHF0RYc2A==
X-Received: by 2002:a17:902:c213:b029:d2:564d:8352 with SMTP id
 19-20020a170902c213b02900d2564d8352mr3350077pll.54.1601365124558; 
 Tue, 29 Sep 2020 00:38:44 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id e13sm3737317pjy.38.2020.09.29.00.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 00:38:43 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 2/4] spi: spi-mtk-nor: use dma_alloc_coherent() for bounce
 buffer
Date: Tue, 29 Sep 2020 15:37:53 +0800
Message-Id: <20200929153320.v4.2.I06cb65401ab5ad63ea30c4788d26633928d80f38@changeid>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
In-Reply-To: <20200929073755.3741416-1-ikjn@chromium.org>
References: <20200929073755.3741416-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_033846_838430_3C169AA5 
X-CRM114-Status: GOOD (  20.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use dma_alloc_coherent() for bounce buffer instead of kmalloc() to
make sure the bounce buffer to be allocated within its DMAable range.

Additionally, add an internal helper need_bounce() function checking
whether op's data buffer is DMAable.

Reviewed-by: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

Changes in v4:
- No changes since v3

Changes in v3:
- simplify function names
- restore back padding bytes to bounce buffer omitted in v2

 drivers/spi/spi-mtk-nor.c | 93 +++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 42 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6e6ca2b8e6c8..cfb9a2450962 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -96,6 +96,7 @@ struct mtk_nor {
 	struct device *dev;
 	void __iomem *base;
 	u8 *buffer;
+	dma_addr_t buffer_dma;
 	struct clk *spi_clk;
 	struct clk *ctlr_clk;
 	unsigned int spi_freq;
@@ -144,6 +145,11 @@ static void mtk_nor_set_addr(struct mtk_nor *sp, const struct spi_mem_op *op)
 	}
 }
 
+static bool need_bounce(struct mtk_nor *sp, const struct spi_mem_op *op)
+{
+	return ((uintptr_t)op->data.buf.in & MTK_NOR_DMA_ALIGN_MASK);
+}
+
 static bool mtk_nor_match_read(const struct spi_mem_op *op)
 {
 	int dummy = 0;
@@ -169,6 +175,7 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
 
 static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 {
+	struct mtk_nor *sp = spi_controller_get_devdata(mem->spi->master);
 	size_t len;
 
 	if (!op->data.nbytes)
@@ -180,8 +187,7 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 			if ((op->addr.val & MTK_NOR_DMA_ALIGN_MASK) ||
 			    (op->data.nbytes < MTK_NOR_DMA_ALIGN))
 				op->data.nbytes = 1;
-			else if (!((ulong)(op->data.buf.in) &
-				   MTK_NOR_DMA_ALIGN_MASK))
+			else if (!need_bounce(sp, op))
 				op->data.nbytes &= ~MTK_NOR_DMA_ALIGN_MASK;
 			else if (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE)
 				op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;
@@ -261,19 +267,12 @@ static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
 	mtk_nor_rmw(sp, MTK_NOR_REG_BUSCFG, reg, MTK_NOR_BUS_MODE_MASK);
 }
 
-static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
-			    u8 *buffer)
+static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
+			    dma_addr_t dma_addr)
 {
 	int ret = 0;
 	ulong delay;
 	u32 reg;
-	dma_addr_t dma_addr;
-
-	dma_addr = dma_map_single(sp->dev, buffer, length, DMA_FROM_DEVICE);
-	if (dma_mapping_error(sp->dev, dma_addr)) {
-		dev_err(sp->dev, "failed to map dma buffer.\n");
-		return -EINVAL;
-	}
 
 	writel(from, sp->base + MTK_NOR_REG_DMA_FADR);
 	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
@@ -298,30 +297,49 @@ static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
 					 (delay + 1) * 100);
 	}
 
-	dma_unmap_single(sp->dev, dma_addr, length, DMA_FROM_DEVICE);
 	if (ret < 0)
 		dev_err(sp->dev, "dma read timeout.\n");
 
 	return ret;
 }
 
-static int mtk_nor_read_bounce(struct mtk_nor *sp, u32 from,
-			       unsigned int length, u8 *buffer)
+static int mtk_nor_read_bounce(struct mtk_nor *sp, const struct spi_mem_op *op)
 {
 	unsigned int rdlen;
 	int ret;
 
-	if (length & MTK_NOR_DMA_ALIGN_MASK)
-		rdlen = (length + MTK_NOR_DMA_ALIGN) & ~MTK_NOR_DMA_ALIGN_MASK;
+	if (op->data.nbytes & MTK_NOR_DMA_ALIGN_MASK)
+		rdlen = (op->data.nbytes + MTK_NOR_DMA_ALIGN) & ~MTK_NOR_DMA_ALIGN_MASK;
 	else
-		rdlen = length;
+		rdlen = op->data.nbytes;
 
-	ret = mtk_nor_read_dma(sp, from, rdlen, sp->buffer);
-	if (ret)
-		return ret;
+	ret = mtk_nor_dma_exec(sp, op->addr.val, rdlen, sp->buffer_dma);
 
-	memcpy(buffer, sp->buffer, length);
-	return 0;
+	if (!ret)
+		memcpy(op->data.buf.in, sp->buffer, op->data.nbytes);
+
+	return ret;
+}
+
+static int mtk_nor_read_dma(struct mtk_nor *sp, const struct spi_mem_op *op)
+{
+	int ret;
+	dma_addr_t dma_addr;
+
+	if (need_bounce(sp, op))
+		return mtk_nor_read_bounce(sp, op);
+
+	dma_addr = dma_map_single(sp->dev, op->data.buf.in,
+				  op->data.nbytes, DMA_FROM_DEVICE);
+
+	if (dma_mapping_error(sp->dev, dma_addr))
+		return -EINVAL;
+
+	ret = mtk_nor_dma_exec(sp, op->addr.val, op->data.nbytes, dma_addr);
+
+	dma_unmap_single(sp->dev, dma_addr, op->data.nbytes, DMA_FROM_DEVICE);
+
+	return ret;
 }
 
 static int mtk_nor_read_pio(struct mtk_nor *sp, const struct spi_mem_op *op)
@@ -425,15 +443,8 @@ static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		if (op->data.nbytes == 1) {
 			mtk_nor_set_addr(sp, op);
 			return mtk_nor_read_pio(sp, op);
-		} else if (((ulong)(op->data.buf.in) &
-			    MTK_NOR_DMA_ALIGN_MASK)) {
-			return mtk_nor_read_bounce(sp, op->addr.val,
-						   op->data.nbytes,
-						   op->data.buf.in);
 		} else {
-			return mtk_nor_read_dma(sp, op->addr.val,
-						op->data.nbytes,
-						op->data.buf.in);
+			return mtk_nor_read_dma(sp, op);
 		}
 	}
 
@@ -588,7 +599,6 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	struct spi_controller *ctlr;
 	struct mtk_nor *sp;
 	void __iomem *base;
-	u8 *buffer;
 	struct clk *spi_clk, *ctlr_clk;
 	int ret, irq;
 
@@ -604,16 +614,6 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(ctlr_clk))
 		return PTR_ERR(ctlr_clk);
 
-	buffer = devm_kmalloc(&pdev->dev,
-			      MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
-			      GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	if ((ulong)buffer & MTK_NOR_DMA_ALIGN_MASK)
-		buffer = (u8 *)(((ulong)buffer + MTK_NOR_DMA_ALIGN) &
-				~MTK_NOR_DMA_ALIGN_MASK);
-
 	ctlr = spi_alloc_master(&pdev->dev, sizeof(*sp));
 	if (!ctlr) {
 		dev_err(&pdev->dev, "failed to allocate spi controller\n");
@@ -633,13 +633,22 @@ static int mtk_nor_probe(struct platform_device *pdev)
 
 	sp = spi_controller_get_devdata(ctlr);
 	sp->base = base;
-	sp->buffer = buffer;
 	sp->has_irq = false;
 	sp->wbuf_en = false;
 	sp->ctlr = ctlr;
 	sp->dev = &pdev->dev;
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
+	sp->buffer = dmam_alloc_coherent(&pdev->dev,
+				MTK_NOR_BOUNCE_BUF_SIZE + MTK_NOR_DMA_ALIGN,
+				&sp->buffer_dma, GFP_KERNEL);
+	if (!sp->buffer)
+		return -ENOMEM;
+
+	if ((uintptr_t)sp->buffer & MTK_NOR_DMA_ALIGN_MASK) {
+		dev_err(sp->dev, "misaligned allocation of internal buffer.\n");
+		return -ENOMEM;
+	}
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
-- 
2.28.0.709.gb0816b6eb0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
