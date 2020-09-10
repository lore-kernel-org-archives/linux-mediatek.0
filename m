Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FF0C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 04:14:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D4A621D46
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 04:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B6N0v17L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dTCggUrL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D4A621D46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sBphlUBEgFnuJQjkZZlj7fZsXllv0MqifjWr2NCU+/U=; b=B6N0v17LgeEeyoIXXTSPvqWCv
	GzJv03oPtDcbtOohpG4AwNL7epjKqY/QtJ7c6ok7ziVcuAANDv62MnaxPwdjWBGHOhhlPA72LOMza
	u0aZ7WFHC9y0bG3Vo8opS8COoY5yNNb+m+3eQG1taoqYwIOT22xIf5ub754hA7N2UZW2LlYomLbDh
	yn8CGcdrDsXmqWvRa+zGaXEyaZy67kFkxFPKhP3mSrd8GxiHCR/od+3naDFfFe2vsXdqgXm/8Kf8Y
	m7ZDoHw6OxfRGZB51wt/eCial2twRWwP60ziB7sfTY37BWkzS95dolQ5X8kNNicAUIgRcK11nSVrQ
	jQBkK3zag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGDyp-0001W9-EF; Thu, 10 Sep 2020 04:14:39 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGDyf-0001TP-OE
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 04:14:30 +0000
Received: by mail-pl1-x641.google.com with SMTP id bd2so273686plb.7
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 21:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KWwm8mWE4d4wVcJJo9tytWYejv+Pxcnm9glHhgWnu5Q=;
 b=dTCggUrLZ8gGuJz0l6b75Knxn3+MUxo3lYXr/4UHEEgOKTtC1kTS0ojPh6SX8sQU8p
 BCYj2cqqON+K/W0M5bfhEKpPbtQxeGg35NlNVjC7cyMRlsDjHlao3a0vcIe18yGVY1pc
 4t0mrw36EPOR+39cKMN1JRaE/tiBhcjr6qetI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KWwm8mWE4d4wVcJJo9tytWYejv+Pxcnm9glHhgWnu5Q=;
 b=mbFgcw1ICUsxEWbFsX5dZ815AZ4dNpH8PBvtydbftSRNqVzyxUlGzkn8XN4pwS8i+g
 577BTHtXoG91qXxWjFKyEJgXA49AAFo5hZTJh9nvrQ1pUBw6cVuD+CXL44+3vdVj3yO7
 ghPD5SeIZlQi5ip2qyXKSWyUW8SSjOlFnfsDpuyZSB2DEyOHlVaFBf95pP2NKN+C8tdz
 mbV5YmcvPKr9R7n2hv8epYmIw5GpwZGZ5lplZD6Qpp13rM1AfXI8vhQK+5KBSf5eRG2K
 rs1sXADH8I854xkJs+2VqUT4sis76Re/pTSAePaWyYda4Z54+nJSKcpR/pa+gMEPt+QA
 UAUQ==
X-Gm-Message-State: AOAM5330KWbOhXMfAK/ENnRda//CgFfhoVmgmJgSdrpipoMYi2gG+IER
 Fhzp/voTHJAaJF0jZC47Xrf4TA==
X-Google-Smtp-Source: ABdhPJzYfBcwkmIQmoRUkge3+F2vQd+PMsW9pyK+LSIVKTewrgGDMUCeeNY1yViHgy9zIU7mIyiTog==
X-Received: by 2002:a17:902:b409:b029:d0:cbe1:e741 with SMTP id
 x9-20020a170902b409b02900d0cbe1e741mr4019631plr.28.1599711267272; 
 Wed, 09 Sep 2020 21:14:27 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id z11sm4266169pfc.181.2020.09.09.21.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 21:14:26 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 2/2] spi: spi-mtk-nor: support 36bit dma addressing to
 mediatek spi-nor
Date: Thu, 10 Sep 2020 12:11:01 +0800
Message-Id: <20200910041101.1695195-3-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910041101.1695195-1-ikjn@chromium.org>
References: <20200910041101.1695195-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_001429_826518_927EAAC7 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch enables direct mappings over 32bit range to spi-mtk-nor.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

 drivers/spi/spi-mtk-nor.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6e6ca2b8e6c8..eb93ae34e670 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -78,6 +78,8 @@
 #define MTK_NOR_REG_DMA_FADR		0x71c
 #define MTK_NOR_REG_DMA_DADR		0x720
 #define MTK_NOR_REG_DMA_END_DADR	0x724
+#define MTK_NOR_REG_DMA_DADR_HB		0x738
+#define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
 
 #define MTK_NOR_PRG_MAX_SIZE		6
 // Reading DMA src/dst addresses have to be 16-byte aligned
@@ -101,6 +103,7 @@ struct mtk_nor {
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
+	bool high_dma;
 	struct completion op_done;
 };
 
@@ -279,6 +282,11 @@ static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
 	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
 	writel(dma_addr + length, sp->base + MTK_NOR_REG_DMA_END_DADR);
 
+	if (sp->high_dma) {
+		writel(dma_addr >> 32, sp->base + MTK_NOR_REG_DMA_DADR_HB);
+		writel((dma_addr + length) >> 32, sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
+	}
+
 	if (sp->has_irq) {
 		reinit_completion(&sp->op_done);
 		mtk_nor_rmw(sp, MTK_NOR_REG_IRQ_EN, MTK_NOR_IRQ_DMA, 0);
@@ -578,7 +586,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
 };
 
 static const struct of_device_id mtk_nor_match[] = {
-	{ .compatible = "mediatek,mt8173-nor" },
+	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
+	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_nor_match);
@@ -591,6 +600,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	u8 *buffer;
 	struct clk *spi_clk, *ctlr_clk;
 	int ret, irq;
+	unsigned long dma_bits;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -614,6 +624,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
 		buffer = (u8 *)(((ulong)buffer + MTK_NOR_DMA_ALIGN) &
 				~MTK_NOR_DMA_ALIGN_MASK);
 
+	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
+		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
+		return -EINVAL;
+	}
+
 	ctlr = spi_alloc_master(&pdev->dev, sizeof(*sp));
 	if (!ctlr) {
 		dev_err(&pdev->dev, "failed to allocate spi controller\n");
@@ -640,6 +656,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->dev = &pdev->dev;
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
+	sp->high_dma = (dma_bits > 32);
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
