Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB263C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:33:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650DC2084C
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QdLKOsut";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aKWzQy2E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 650DC2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Trbse7JfIkyCxKJ52Gq0Jb6Rz8uvbflevIZiFmC1BdQ=; b=QdLKOsutlJHn2t6CQtaMUPNSg
	rP9knkzaaGuE5ZsovbOOEYmehK4WncBI/0M4rRybELHwWWlwTb9z35BFS5ZXu4mkX3yXt0E4/n50s
	0VCky8eCE3cC8OR0ONqusGpLBHC6z0X4nKq7sv1XmblTOZaccicPFFUbxjDTNCAKEKXrWeOeBOunH
	AUGDBqIpayMd7EJDBZiyUqi3hb6f0DF3OsICkwe28vzhMNFCHDYkc0HPtiBZXPjIHcdapcYq0MgMC
	FVn25aVm83vmNCqXqul6AqACmDLnWpc7lDro1+WDWb55kdPpZgj0Mm2e6H7smffeK3Cfh5GBpCJDk
	rq9PzjH1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBpJ-0000R4-8p; Fri, 18 Sep 2020 08:33:05 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBnw-0008Eu-Pe
 for linux-mediatek@lists.infradead.org; Fri, 18 Sep 2020 08:31:46 +0000
Received: by mail-pj1-x1041.google.com with SMTP id s14so3988547pju.1
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2020 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxzc9a+AIt4XaKyopJ42uaLRgvLPMA2J58JJPLPnlzc=;
 b=aKWzQy2E785EwAM3zf48FJb9SNxM9DqZ/gBRc2hdvGt4wpySSDDXJpsjYmHjGtfHFg
 Pef8sAkwLXdKucFl0JVcA28XlPywjWT6DIOd/jU30Y3A7jt6NOFX2NGxl2v6yHSy8XPy
 U0V84UjZArDqeNq+9eUQ3y6A7X+a2w20XBgfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxzc9a+AIt4XaKyopJ42uaLRgvLPMA2J58JJPLPnlzc=;
 b=j/8jsd4hBJyQUuC/cEIihdm0jX4+GWyLavUimi2zqyAv7I8h06jEg9bgHW4hgh4G47
 h8dB7pvDD1TCxUTtIeQkIENAV6VxhXye67Y2FROM4kzKAgSblKe/DoPPUYY0Fc2pid8p
 17Wuq2FPPhXkhwyQfqiJflXLFqUyHVD7hltTZzNQvEUwyRbdGd7hFoNSwsmJjNDTPaVR
 gIbEKP1qNjxYc0loTnVEJGzQdWXzBWJV6SCRGyxc8XVohp4VxAOEnFtOPYFfpfZ0eXb3
 uQ67I317RNyJ337vfyBwR70q/TSF/kbxRbnoBI0o2ql6HzWBCBU2/0i3q5nzYbmopk4V
 Rozw==
X-Gm-Message-State: AOAM532vjC+cel+HBFCJf26J1Ik5CFP2AlWGgICUrYK9VW/zyme3xh4Z
 VUpjPVTZ4R8mXsul7NSIq/a5hi9JgE1d3qSK
X-Google-Smtp-Source: ABdhPJzBVKAVejjumP8o+IHhjgLXqk+sE9Xn+VoGTnsSVjmfSDXZ5WjU6KJ+Men/NRjcjzHizH5IhA==
X-Received: by 2002:a17:90a:858a:: with SMTP id
 m10mr11441620pjn.185.1600417898406; 
 Fri, 18 Sep 2020 01:31:38 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:37 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/5] spi: spi-mtk-nor: use dma_alloc_coherent() for bounce
 buffer
Date: Fri, 18 Sep 2020 16:31:21 +0800
Message-Id: <20200918162834.v2.3.I06cb65401ab5ad63ea30c4788d26633928d80f38@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918083124.3921207-1-ikjn@chromium.org>
References: <20200918083124.3921207-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043140_902349_BDBD19B7 
X-CRM114-Status: GOOD (  18.22  )
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

Use dma_alloc_coherent() for bounce buffer instead of kmalloc.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 60 +++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 54b2c0fde95b..e14798a6e7d0 100644
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
@@ -275,19 +276,16 @@ static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
 	mtk_nor_rmw(sp, MTK_NOR_REG_BUSCFG, reg, MTK_NOR_BUS_MODE_MASK);
 }
 
-static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
-			    u8 *buffer)
+static int read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
+		    dma_addr_t dma_addr)
 {
 	int ret = 0;
 	ulong delay;
 	u32 reg;
-	dma_addr_t dma_addr;
 
-	dma_addr = dma_map_single(sp->dev, buffer, length, DMA_FROM_DEVICE);
-	if (dma_mapping_error(sp->dev, dma_addr)) {
-		dev_err(sp->dev, "failed to map dma buffer.\n");
+	if (WARN_ON((length & MTK_NOR_DMA_ALIGN_MASK) ||
+		    (dma_addr & MTK_NOR_DMA_ALIGN_MASK)))
 		return -EINVAL;
-	}
 
 	writel(from, sp->base + MTK_NOR_REG_DMA_FADR);
 	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
@@ -312,30 +310,39 @@ static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from, unsigned int length,
 					 (delay + 1) * 100);
 	}
 
-	dma_unmap_single(sp->dev, dma_addr, length, DMA_FROM_DEVICE);
 	if (ret < 0)
 		dev_err(sp->dev, "dma read timeout.\n");
 
 	return ret;
 }
 
-static int mtk_nor_read_bounce(struct mtk_nor *sp, u32 from,
-			       unsigned int length, u8 *buffer)
+static int mtk_nor_read_dma(struct mtk_nor *sp, u32 from,
+			    unsigned int length, u8 *buffer)
 {
-	unsigned int rdlen;
 	int ret;
+	dma_addr_t dma_addr;
+	bool bounce = need_bounce(buffer, length);
 
-	if (length & MTK_NOR_DMA_ALIGN_MASK)
-		rdlen = (length + MTK_NOR_DMA_ALIGN) & ~MTK_NOR_DMA_ALIGN_MASK;
-	else
-		rdlen = length;
+	if (!bounce) {
+		dma_addr = dma_map_single(sp->dev, buffer, length,
+					  DMA_FROM_DEVICE);
+		if (dma_mapping_error(sp->dev, dma_addr)) {
+			dev_err(sp->dev, "failed to map dma buffer.\n");
+			return -EINVAL;
+		}
+	} else {
+		dma_addr = sp->buffer_dma;
+	}
 
-	ret = mtk_nor_read_dma(sp, from, rdlen, sp->buffer);
-	if (ret)
-		return ret;
+	ret = read_dma(sp, from, length, dma_addr);
 
-	memcpy(buffer, sp->buffer, length);
-	return 0;
+	if (!bounce)
+		dma_unmap_single(sp->dev, dma_addr, length,
+				 DMA_FROM_DEVICE);
+	else
+		memcpy(buffer, sp->buffer, length);
+
+	return ret;
 }
 
 static int mtk_nor_read_pio(struct mtk_nor *sp, const struct spi_mem_op *op)
@@ -439,11 +446,6 @@ static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		if (op->data.nbytes == 1) {
 			mtk_nor_set_addr(sp, op);
 			return mtk_nor_read_pio(sp, op);
-		} else if (((ulong)(op->data.buf.in) &
-			    MTK_NOR_DMA_ALIGN_MASK)) {
-			return mtk_nor_read_bounce(sp, op->addr.val,
-						   op->data.nbytes,
-						   op->data.buf.in);
 		} else {
 			return mtk_nor_read_dma(sp, op->addr.val,
 						op->data.nbytes,
@@ -654,6 +656,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->dev = &pdev->dev;
 	sp->spi_clk = spi_clk;
 	sp->ctlr_clk = ctlr_clk;
+	sp->buffer = dma_alloc_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
+					&sp->buffer_dma, GFP_KERNEL);
+	if (!sp->buffer)
+		return -ENOMEM;
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
@@ -674,6 +680,8 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	ret = mtk_nor_init(sp);
 	if (ret < 0) {
 		kfree(ctlr);
+		dma_free_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
+				  sp->buffer, sp->buffer_dma);
 		return ret;
 	}
 
@@ -692,6 +700,8 @@ static int mtk_nor_remove(struct platform_device *pdev)
 
 	mtk_nor_disable_clk(sp);
 
+	dma_free_coherent(&pdev->dev, MTK_NOR_BOUNCE_BUF_SIZE,
+			  sp->buffer, sp->buffer_dma);
 	return 0;
 }
 
-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
