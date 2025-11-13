Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A19CD6E42
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI6QQAOPX7hf8H+YMkIqF24Pmi3vYW+otOr+4+OeTDU=; b=slxKDdiduxKz7Ye3/PYo89ikz8
	b1BZXUGj1kb6aKEYnhLBx+SW6SzdA2AJJG/rqr7yeI28kIo24UJuqxaoMYgJbCZajgYRXYLSZqjjD
	ZnZ/SL9XyZwB87fyQk7pvlVWlLuHz6GnjFQahWmW8DisEK8p18DGonJZZk/nC6myoKTxzIfaQBvma
	EXQ+wdXELvrg/ul/ot1yKFyMJ26eKc9OYFdV608eKjtjqvdSO6tzphH4eOGM2N/IPdDHhc2nvrGko
	NH9JJsGmPOpUEzlg3z+1+BvV2fUm711LXD/fxSH/RxydStBP+Qg0EWlaG/iisGd9qLGSlS3EcpdRV
	VsBBD9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLp-0000000ARn5-2v32;
	Thu, 13 Nov 2025 12:22:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLe-0000000ARbR-36Xc;
	Thu, 13 Nov 2025 12:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036562;
	bh=DGRoafYf75LyiDgJC7aeQ1lFqtCY6dpeDmoD5LwAHNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z5N3z00gKxPzdfpINYTnKSo4FKp3DoJEr8ZFxLiwVrTrRwB8YOV1wClPNwTJnXJzR
	 HVTQIOPAokq+lgFhKwJxOqtYQemv6A9r2V15H1fHY2DWRLeb+SjxRdXNNO7E6iGSfk
	 j3fRVMdZ3cTk5VF06aJEfCnlsVkCrTTTQphCHbnICa+IiEe/bFI1MsWAzjaq24deX2
	 ZozRybKH97Culkmvt/baAsENSENu9PMOOyFuHRd7MZH3GvnrsseLachfdsNjp+ePSD
	 zY23S/dWBLqd8A7Sx7QvR8SW42JFkAWcZSeBF9ChYSl+LlXiDvke5TPQVoexpA2OxW
	 2hf8+ftYP+zJw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F153D17E1401;
	Thu, 13 Nov 2025 13:22:41 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmaengine@vger.kernel.org
Cc: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 6/8] dmaengine: mediatek: mtk-uart-apdma: Rename support_33bits to support_ext_addr
Date: Thu, 13 Nov 2025 13:22:27 +0100
Message-ID: <20251113122229.23998-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042248_001161_69C98F09 
X-CRM114-Status: GOOD (  13.07  )
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

In preparation for adding support for SoCs with APDMA IP versions
supporting more than 33 bits addressing, rename the support_33bits
variable to support_ext_addr to signal support for extended, above
4GB, addressing.

This change is cosmetic only, and brings no functional differences.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 2398b440b12a..802a4d6c11fa 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -77,7 +77,7 @@
 struct mtk_uart_apdmadev {
 	struct dma_device ddev;
 	struct clk *clk;
-	bool support_33bits;
+	bool support_ext_addr;
 	unsigned int dma_requests;
 };
 
@@ -148,7 +148,7 @@ static void mtk_uart_apdma_start_tx(struct mtk_chan *c)
 		mtk_uart_apdma_write(c, VFF_WPT, 0);
 		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
 
-		if (mtkd->support_33bits)
+		if (mtkd->support_ext_addr)
 			mtk_uart_apdma_write(c, VFF_ADDR2, upper_32_bits(d->addr));
 	}
 
@@ -191,7 +191,7 @@ static void mtk_uart_apdma_start_rx(struct mtk_chan *c)
 		mtk_uart_apdma_write(c, VFF_RPT, 0);
 		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_RX_INT_CLR_B);
 
-		if (mtkd->support_33bits)
+		if (mtkd->support_ext_addr)
 			mtk_uart_apdma_write(c, VFF_ADDR2, upper_32_bits(d->addr));
 	}
 
@@ -297,7 +297,7 @@ static int mtk_uart_apdma_alloc_chan_resources(struct dma_chan *chan)
 		goto err_pm;
 	}
 
-	if (mtkd->support_33bits)
+	if (mtkd->support_ext_addr)
 		mtk_uart_apdma_write(c, VFF_ADDR2, VFF_ADDR2_CLR_B);
 
 err_pm:
@@ -495,7 +495,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 
 	bit_mask = (unsigned int)(uintptr_t)of_device_get_match_data(&pdev->dev);
 	if (bit_mask > 32)
-		mtkd->support_33bits = true;
+		mtkd->support_ext_addr = true;
 
 	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(bit_mask));
 	if (rc)
-- 
2.51.1


