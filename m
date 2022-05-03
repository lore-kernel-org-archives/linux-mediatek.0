Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B63DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SM1XNgPSB8oK/oJ5V366PMMTV0yJbNsU8Chcz296cS0=; b=s046i9pzPIuoAh
	mV3YhiT9efZvCJAuSl9PN9ugOrJNbR/ijwYpR80So8ecEcIp7BgBbDPQWKvVRcb7+w6ybOp1nMaND
	0QoIHFu0D9ZtFtZcnfD+iiyJPzT0KqbVn3Mr8BCqmvBjI+OgTpw7Ya+dycDT0PZ1+icMijfPpELMg
	L4O/i2MMUi+QLDkuNbsS3MvngIihPAtO+F6HRY9eoJQPb0OVd81u+65J5rC0rvfTI4/Ik2dTXnRN1
	ja3+Ql49HRLXc/z6lyG9Z/W5EuoXO43YrwWaQUM/MYTM5F920xhFIJE2D8oQ7yfifkj1LZcA4fy4j
	MFHs++1NkgBKaK1TI+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqCt-005QBh-5W; Tue, 03 May 2022 10:56:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlq9w-005OVd-25; Tue, 03 May 2022 10:53:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5428E1F43E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651575214;
 bh=/Jtsc9+lw7Coi+SAJWUPtQ7xwVJi5H5h91tGI9sgeIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P+sKuHiX7lZEmpgw6/TvHRQfOES1pBdv/6MyMYsKaLuUHrtWbGUBb6QstfsUyUDlO
 EGBgNIRr5UnP8ORrVLc6K1A4busUTbJ02NTFmNokJAL49nmaaoxkVNrP0iu/YPCBW7
 nPat1SfmbRohEeffegyFczus+tGAVbnQG5bMJtD2brNRNpQ1p3V4RFxtsIoSDx+R5p
 Xvm4zufj9gCUinkGfGiBmXVrscHMNZtQQni9nX7Qz9zApyC7tGIeGEe2/cb8xSV1Vf
 ZaAauB59XaulaKMVwfOAEBS3jPSqX0NneQ5CkgxDgv6GdxlrpRXXSnrNcqOHy7axW1
 6OVjPekA8RJew==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org, matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] dmaengine: mediatek-cqdma: Add SoC-specific match data
Date: Tue,  3 May 2022 12:53:27 +0200
Message-Id: <20220503105328.54755-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503105328.54755-1-angelogioacchino.delregno@collabora.com>
References: <20220503105328.54755-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_035336_300613_2620C643 
X-CRM114-Status: GOOD (  17.94  )
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

On some SoCs the DST2 and SRC2 registers may be at a different offset:
add a match data structure and assign it to mt6765 as a preparation
for adding support for more SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 34 +++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index f8847c48ba03..7d8c54da3d58 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -48,8 +48,6 @@
 #define MTK_CQDMA_DST			0x20
 #define MTK_CQDMA_LEN1			0x24
 #define MTK_CQDMA_LEN2			0x28
-#define MTK_CQDMA_SRC2			0x60
-#define MTK_CQDMA_DST2			0x64
 
 /* Registers setting */
 #define MTK_CQDMA_EN_BIT		BIT(0)
@@ -126,9 +124,20 @@ struct mtk_cqdma_vchan {
 	bool issue_synchronize;
 };
 
+/**
+ * struct mtk_cqdma_plat_data - SoC specific parameters
+ * @reg_dst2:               dst2 register offset
+ * @reg_src2:               src2 register offset
+ */
+struct mtk_cqdma_plat_data {
+	u8 reg_src2;
+	u8 reg_dst2;
+};
+
 /**
  * struct mtk_cqdma_device - The struct holding info describing CQDMA
  *                          device
+ * @plat:                   SoC-specific platform data
  * @ddev:                   An instance for struct dma_device
  * @clk:                    The clock that device internal is using
  * @dma_requests:           The number of VCs the device supports to
@@ -231,6 +240,8 @@ static int mtk_cqdma_hard_reset(struct mtk_cqdma_pchan *pc)
 static void mtk_cqdma_start(struct mtk_cqdma_pchan *pc,
 			    struct mtk_cqdma_vdesc *cvd)
 {
+	struct mtk_cqdma_device *cqdma = to_cqma_dev(cvd->ch);
+
 	/* wait for the previous transaction done */
 	if (mtk_cqdma_poll_engine_done(pc, true) < 0)
 		dev_err(cqdma2dev(to_cqdma_dev(cvd->ch)), "cqdma wait transaction timeout\n");
@@ -243,17 +254,17 @@ static void mtk_cqdma_start(struct mtk_cqdma_pchan *pc,
 	/* setup the source */
 	mtk_dma_set(pc, MTK_CQDMA_SRC, cvd->src & MTK_CQDMA_ADDR_LIMIT);
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	mtk_dma_set(pc, MTK_CQDMA_SRC2, cvd->src >> MTK_CQDMA_ADDR2_SHFIT);
+	mtk_dma_set(pc, cqdma->plat->reg_src2, cvd->src >> MTK_CQDMA_ADDR2_SHFIT);
 #else
-	mtk_dma_set(pc, MTK_CQDMA_SRC2, 0);
+	mtk_dma_set(pc, cqdma->plat->reg_src2, 0);
 #endif
 
 	/* setup the destination */
 	mtk_dma_set(pc, MTK_CQDMA_DST, cvd->dest & MTK_CQDMA_ADDR_LIMIT);
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	mtk_dma_set(pc, MTK_CQDMA_DST2, cvd->dest >> MTK_CQDMA_ADDR2_SHFIT);
+	mtk_dma_set(pc, cqdma->plat->reg_dst2, cvd->dest >> MTK_CQDMA_ADDR2_SHFIT);
 #else
-	mtk_dma_set(pc, MTK_CQDMA_DST2, 0);
+	mtk_dma_set(pc, cqdma->plat->reg_dst2, 0);
 #endif
 
 	/* setup the length */
@@ -740,8 +751,13 @@ static void mtk_cqdma_hw_deinit(struct mtk_cqdma_device *cqdma)
 	pm_runtime_disable(cqdma2dev(cqdma));
 }
 
+static const struct mtk_cqdma_plat_data cqdma_mt6765 {
+	.reg_dst2 = 0x64,
+	.reg_src2 = 0x60,
+};
+
 static const struct of_device_id mtk_cqdma_match[] = {
-	{ .compatible = "mediatek,mt6765-cqdma" },
+	{ .compatible = "mediatek,mt6765-cqdma", .data = &cqdma_mt6765 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_cqdma_match);
@@ -758,6 +774,10 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 	if (!cqdma)
 		return -ENOMEM;
 
+	cqdma->plat = device_get_match_data(&pdev->dev);
+	if (cqdma->plat)
+		return -EINVAL;
+
 	dd = &cqdma->ddev;
 
 	cqdma->clk = devm_clk_get(&pdev->dev, "cqdma");
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
