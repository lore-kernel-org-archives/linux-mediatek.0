Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203D4ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psJg9EEXTiMjFG4SP7dNG5Vmm9Q2pzXnQ8IpeVBvu/U=; b=teHadUVNUzNQGfFfhxVtbLja8d
	3zzKyvNbNIrRYQRUPYN0lJtTE+CvM+KTIzdFHVc+TN3xezxzUct1LVr+Jbrl+V5dMZ9TImIKq0sXX
	lCRX8MP9yW6HHcg0pOL0VSzKvonrXpmzsGLrdzahTGN/YSSq3sTry32PNSUAG7UdhNGmZh7plBVEw
	pvKceXXYzqZXy7qpgAXbu8CBkGAiZt0GMekS+VuPdTaW4w01kp97Wez2th/LoWokWVKEG6CWULKyz
	E+R1S9AkKOkLoNqZfCuRBD/Yfsgqj2sC3L0RLAYE/Wo0+HV9NzHB+M1/3vuS48apHYRafNI+Qc2G2
	hxtJQwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYnkZ-008GT9-Vu; Thu, 15 Sep 2022 12:13:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYngQ-008Cej-Qk; Thu, 15 Sep 2022 12:09:33 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2EF626601FC1;
	Thu, 15 Sep 2022 13:09:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663243768;
	bh=b73S+v63Xy5BcQgYOj0NF2u+G+p7Y8haQ0o9DBpBNoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6nmdEHXzI73VmsbQxijOWkBdeBWwRT6BWYcbtc7uZfmH+Dg2SyWaHUWIwt33jVb5
	 LrG06HM4uz7HdNcYMKBowQwLwOXMF+QqKmHNGECNSvJr2kWulQkDIwf4KTadEE5KP6
	 qEJxdrNCWvEoClcYWrE5NOeFqT6h697HfAbH8VkJLg/rTRLxJ8NpL9KYSr/gR/J2Yl
	 Jfq65yKhp47fxkZdDScoSFCJl+GLFa7b+Hu2b1ScctDBurR+9VxXRsNgYs/OX9ht/p
	 09HVSGChBj5WmjlDzhS/dyOfykyRYsNQtOqD4hROUAcXx1pFRCulox0qkZzz81wqIl
	 Zuwgh6TO18V4g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] mmc: mtk-sd: Reorder of_device_id and platform data by name
Date: Thu, 15 Sep 2022 14:09:22 +0200
Message-Id: <20220915120923.86038-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915120923.86038-1-angelogioacchino.delregno@collabora.com>
References: <20220915120923.86038-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_050931_254286_9C5E26F6 
X-CRM114-Status: UNSURE (   9.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Both of_device_id compatible strings and platform data were partially
ordered by name. Fix the ordering.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 99 ++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 49 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 69d78604d1fc..572eb5d48813 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -474,33 +474,20 @@ struct msdc_host {
 	struct cqhci_host *cq_host;
 };
 
-static const struct mtk_mmc_compatible mt8135_compat = {
-	.clk_div_bits = 8,
+static const struct mtk_mmc_compatible mt2701_compat = {
+	.clk_div_bits = 12,
 	.recheck_sdio_irq = true,
 	.hs400_tune = false,
-	.pad_tune_reg = MSDC_PAD_TUNE,
-	.async_fifo = false,
-	.data_tune = false,
-	.busy_check = false,
-	.stop_clk_fix = false,
-	.enhance_rx = false,
-	.support_64g = false,
-};
-
-static const struct mtk_mmc_compatible mt8173_compat = {
-	.clk_div_bits = 8,
-	.recheck_sdio_irq = true,
-	.hs400_tune = true,
-	.pad_tune_reg = MSDC_PAD_TUNE,
-	.async_fifo = false,
-	.data_tune = false,
+	.pad_tune_reg = MSDC_PAD_TUNE0,
+	.async_fifo = true,
+	.data_tune = true,
 	.busy_check = false,
 	.stop_clk_fix = false,
 	.enhance_rx = false,
 	.support_64g = false,
 };
 
-static const struct mtk_mmc_compatible mt8183_compat = {
+static const struct mtk_mmc_compatible mt2712_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
@@ -513,20 +500,7 @@ static const struct mtk_mmc_compatible mt8183_compat = {
 	.support_64g = true,
 };
 
-static const struct mtk_mmc_compatible mt2701_compat = {
-	.clk_div_bits = 12,
-	.recheck_sdio_irq = true,
-	.hs400_tune = false,
-	.pad_tune_reg = MSDC_PAD_TUNE0,
-	.async_fifo = true,
-	.data_tune = true,
-	.busy_check = false,
-	.stop_clk_fix = false,
-	.enhance_rx = false,
-	.support_64g = false,
-};
-
-static const struct mtk_mmc_compatible mt2712_compat = {
+static const struct mtk_mmc_compatible mt6779_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
@@ -539,6 +513,19 @@ static const struct mtk_mmc_compatible mt2712_compat = {
 	.support_64g = true,
 };
 
+static const struct mtk_mmc_compatible mt7620_compat = {
+	.clk_div_bits = 8,
+	.recheck_sdio_irq = true,
+	.hs400_tune = false,
+	.pad_tune_reg = MSDC_PAD_TUNE,
+	.async_fifo = false,
+	.data_tune = false,
+	.busy_check = false,
+	.stop_clk_fix = false,
+	.enhance_rx = false,
+	.use_internal_cd = true,
+};
+
 static const struct mtk_mmc_compatible mt7622_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = true,
@@ -552,31 +539,33 @@ static const struct mtk_mmc_compatible mt7622_compat = {
 	.support_64g = false,
 };
 
-static const struct mtk_mmc_compatible mt8516_compat = {
-	.clk_div_bits = 12,
+static const struct mtk_mmc_compatible mt8135_compat = {
+	.clk_div_bits = 8,
 	.recheck_sdio_irq = true,
 	.hs400_tune = false,
-	.pad_tune_reg = MSDC_PAD_TUNE0,
-	.async_fifo = true,
-	.data_tune = true,
-	.busy_check = true,
-	.stop_clk_fix = true,
+	.pad_tune_reg = MSDC_PAD_TUNE,
+	.async_fifo = false,
+	.data_tune = false,
+	.busy_check = false,
+	.stop_clk_fix = false,
+	.enhance_rx = false,
+	.support_64g = false,
 };
 
-static const struct mtk_mmc_compatible mt7620_compat = {
+static const struct mtk_mmc_compatible mt8173_compat = {
 	.clk_div_bits = 8,
 	.recheck_sdio_irq = true,
-	.hs400_tune = false,
+	.hs400_tune = true,
 	.pad_tune_reg = MSDC_PAD_TUNE,
 	.async_fifo = false,
 	.data_tune = false,
 	.busy_check = false,
 	.stop_clk_fix = false,
 	.enhance_rx = false,
-	.use_internal_cd = true,
+	.support_64g = false,
 };
 
-static const struct mtk_mmc_compatible mt6779_compat = {
+static const struct mtk_mmc_compatible mt8183_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
@@ -589,16 +578,28 @@ static const struct mtk_mmc_compatible mt6779_compat = {
 	.support_64g = true,
 };
 
+static const struct mtk_mmc_compatible mt8516_compat = {
+	.clk_div_bits = 12,
+	.recheck_sdio_irq = true,
+	.hs400_tune = false,
+	.pad_tune_reg = MSDC_PAD_TUNE0,
+	.async_fifo = true,
+	.data_tune = true,
+	.busy_check = true,
+	.stop_clk_fix = true,
+};
+
 static const struct of_device_id msdc_of_ids[] = {
-	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
-	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
-	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
+	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
+	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
 	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
+	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
+	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
+	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
 	{ .compatible = "mediatek,mt8516-mmc", .data = &mt8516_compat},
-	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
-	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
+
 	{}
 };
 MODULE_DEVICE_TABLE(of, msdc_of_ids);
-- 
2.37.2


