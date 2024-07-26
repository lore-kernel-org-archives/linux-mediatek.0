Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D43CC3DA49
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jul 2024 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GXIIj0sazyuURoWnddMgP7HEAJMH/dRR4SOce0Ajk7w=; b=CnRcEdnGn1Elj4BT/0sljyLtwt
	uFg3EYgeBMLsbmNAnw7EG7XYdubl4x17eHw1d1SpIN7KX8dNjpFfTbuPGic8D8hN5pUq8PMFLfCxF
	9nFI45doUAllkf6VvtPRv0BIfTNf7vMZyNt2M7N2EfohqJOjuLWR8jwxN6hotBRAFqruL2tgqXupz
	RV/q+PkCIvXKLvuBgEXogAG03INy7WcBaqPI9SftC1uQHxSdDo+idp1Arl5W+C3avdRLA1Yl4v+Lv
	ZyexQpDkn/O1sdcVkew6WX6xS8Dhp7c5inrtCg2sAC7OFrgnO55e7YsI8ZRCkCVRqA1515LE1/qeH
	/Ca/xoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXJQS-00000003lVM-2U3s;
	Fri, 26 Jul 2024 11:47:56 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXJQ2-00000003lPb-2QMF;
	Fri, 26 Jul 2024 11:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721994445;
	bh=xHeBzfe88Lxqzz7XBGzmzvrhqcFCgBdJRHwCZQajHPg=;
	h=From:To:Cc:Subject:Date:From;
	b=l3stOCYFhwCvRGjQIb69osB2bZL97PdI3TEBBqCbIR1mfhIHcuU/m/ZJ+ueomJlmO
	 /znu1Kks2QmvcekDsPpICDqc0FshAZo4cN2Lw9jh+elRKAksu0+8Lf+/0zdPAKgt9b
	 bZ1Et6skX42DfAc8PQVwczEpcsuHnAvg2XwkqswgXMVnXtS3osQHFNzBU0OOp18C40
	 HHe+HfTIAZwrhLAdN2Ctf5YP0DKvJdFUSEIF7D7PAdo2mWjLPAHd6TlrHsVvQE7yvf
	 7ErnTIcyiHQfg+aLQZ1uK7plo7uHZuBdK2Pbg26xwCDds26yaWGCG6DNB3QuQq0hLL
	 D7WIt6PEJPi1A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1C58537804C6;
	Fri, 26 Jul 2024 11:47:25 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] spi: spi-mt65xx: Use threaded interrupt for non-SPIMEM transfer
Date: Fri, 26 Jul 2024 13:47:21 +0200
Message-ID: <20240726114721.142196-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_044730_793040_127D1F5D 
X-CRM114-Status: GOOD (  13.68  )
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

In order to avoid blocking for an excessive amount of time, eventually
impacting on system responsiveness, interrupt handlers should finish
executing in as little time as possible.

Use threaded interrupt and move the SPI transfer handling (both
CPU and DMA) for the non-spimem case to an interrupt thread instead.

For SPI-MEM (IPM) controllers, handling is kept in the blocking
interrupt as it simply consists in signalling completion.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 36c2f52cd6b8..dfee244fc317 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -743,25 +743,13 @@ static int mtk_spi_setup(struct spi_device *spi)
 	return 0;
 }
 
-static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
+static irqreturn_t mtk_spi_interrupt_thread(int irq, void *dev_id)
 {
 	u32 cmd, reg_val, cnt, remainder, len;
 	struct spi_controller *host = dev_id;
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 	struct spi_transfer *xfer = mdata->cur_transfer;
 
-	reg_val = readl(mdata->base + SPI_STATUS0_REG);
-	if (reg_val & MTK_SPI_PAUSE_INT_STATUS)
-		mdata->state = MTK_SPI_PAUSED;
-	else
-		mdata->state = MTK_SPI_IDLE;
-
-	/* SPI-MEM ops */
-	if (mdata->use_spimem) {
-		complete(&mdata->spimem_done);
-		return IRQ_HANDLED;
-	}
-
 	if (!host->can_dma(host, NULL, xfer)) {
 		if (xfer->rx_buf) {
 			cnt = mdata->xfer_len / 4;
@@ -845,6 +833,27 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
+{
+	struct spi_controller *host = dev_id;
+	struct mtk_spi *mdata = spi_controller_get_devdata(host);
+	u32 reg_val;
+
+	reg_val = readl(mdata->base + SPI_STATUS0_REG);
+	if (reg_val & MTK_SPI_PAUSE_INT_STATUS)
+		mdata->state = MTK_SPI_PAUSED;
+	else
+		mdata->state = MTK_SPI_IDLE;
+
+	/* SPI-MEM ops */
+	if (mdata->use_spimem) {
+		complete(&mdata->spimem_done);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_WAKE_THREAD;
+}
+
 static int mtk_spi_mem_adjust_op_size(struct spi_mem *mem,
 				      struct spi_mem_op *op)
 {
@@ -1255,8 +1264,9 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		dev_notice(dev, "SPI dma_set_mask(%d) failed, ret:%d\n",
 			   addr_bits, ret);
 
-	ret = devm_request_irq(dev, irq, mtk_spi_interrupt,
-			       IRQF_TRIGGER_NONE, dev_name(dev), host);
+	ret = devm_request_threaded_irq(dev, irq, mtk_spi_interrupt,
+					mtk_spi_interrupt_thread,
+					IRQF_TRIGGER_NONE, dev_name(dev), host);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register irq\n");
 
-- 
2.45.2


