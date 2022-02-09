Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHaOm0vQIduOI6cvsB7fjWvn9xteSuHEaQGCqrbrIy4=; b=GoGeopcdJZoQ4c
	fzqsIcjLkqkP+DwvmahiIgkRUkkEMXJ2qye2ljq49abCspYnxNYyILL6UnLsyVLI1FdwBXJLcxLs3
	yUHshBoxR2DNuGE/6aKSoACAEtj5V4aAyggBk9/QJoGAUbUAgM34uTssnZHcsBlOw/evxGGUPpaLo
	nLYVrcvFACGazcND1ixvG2MvX3h3oyO8k82AdRxERSwofytMgtsKZHMXTh37c26qoc2XCxo1HL0i3
	aUAUtYDBZOln+OaMN7u4VAROmQQ3re4osoKxP5Yk1K/asq7sdUt+4x6CGh+d/MpZurpKe2O5qdk6u
	xJMf0yDAfXRfeq+BKfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHlBZ-00HT29-16; Wed, 09 Feb 2022 11:30:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHlAX-00HSYa-Pq; Wed, 09 Feb 2022 11:29:56 +0000
X-UUID: 3e2ef19c16b848ddb6254a9ca175972b-20220209
X-UUID: 3e2ef19c16b848ddb6254a9ca175972b-20220209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 622365502; Wed, 09 Feb 2022 04:29:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 03:19:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 9 Feb 2022 19:19:44 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Feb 2022 19:19:43 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
 <leilk.liu@mediatek.com>
Subject: [PATCH 6/6] spi: mediatek: add need_ahb_clk support
Date: Wed, 9 Feb 2022 19:19:38 +0800
Message-ID: <20220209111938.16137-7-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209111938.16137-1-leilk.liu@mediatek.com>
References: <20220209111938.16137-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_032953_914487_64458867 
X-CRM114-Status: GOOD (  19.90  )
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

this patch adds need_ahb_clk support.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 113 ++++++++++++++++++++++++++++++---------
 1 file changed, 87 insertions(+), 26 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 9a40c6cd13ab..62bfbd7bf718 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -122,6 +122,8 @@ struct mtk_spi_compatible {
 	bool ipm_design;
 	/* IPM design that support quad mode */
 	bool support_quad;
+	/* some IC ahb & apb clk is different and also need to be enabled */
+	bool need_ahb_clk;
 };
 
 struct mtk_spi {
@@ -129,13 +131,13 @@ struct mtk_spi {
 	u32 state;
 	int pad_num;
 	u32 *pad_sel;
-	struct clk *parent_clk, *sel_clk, *spi_clk;
+	struct clk *parent_clk, *sel_clk, *spi_clk, *spi_hclk;
 	struct spi_transfer *cur_transfer;
 	u32 xfer_len;
 	u32 num_xfered;
 	struct scatterlist *tx_sgl, *rx_sgl;
 	u32 tx_sgl_len, rx_sgl_len;
-	const struct mtk_spi_compatible *dev_comp;
+	struct mtk_spi_compatible *dev_comp;
 	u32 spi_clk_hz;
 	struct completion spimem_done;
 	bool use_spimem;
@@ -144,49 +146,49 @@ struct mtk_spi {
 	dma_addr_t rx_dma;
 };
 
-static const struct mtk_spi_compatible mtk_common_compat;
+static struct mtk_spi_compatible mtk_common_compat;
 
-static const struct mtk_spi_compatible mt2712_compat = {
+static struct mtk_spi_compatible mt2712_compat = {
 	.must_tx = true,
 };
 
-static const struct mtk_spi_compatible ipm_compat_single = {
+static struct mtk_spi_compatible ipm_compat_single = {
 	.enhance_timing = true,
 	.dma_ext = true,
 	.ipm_design = true,
 };
 
-static const struct mtk_spi_compatible ipm_compat_quad = {
+static struct mtk_spi_compatible ipm_compat_quad = {
 	.enhance_timing = true,
 	.dma_ext = true,
 	.ipm_design = true,
 	.support_quad = true,
 };
 
-static const struct mtk_spi_compatible mt6765_compat = {
+static struct mtk_spi_compatible mt6765_compat = {
 	.need_pad_sel = true,
 	.must_tx = true,
 	.enhance_timing = true,
 	.dma_ext = true,
 };
 
-static const struct mtk_spi_compatible mt7622_compat = {
+static struct mtk_spi_compatible mt7622_compat = {
 	.must_tx = true,
 	.enhance_timing = true,
 };
 
-static const struct mtk_spi_compatible mt8173_compat = {
+static struct mtk_spi_compatible mt8173_compat = {
 	.need_pad_sel = true,
 	.must_tx = true,
 };
 
-static const struct mtk_spi_compatible mt8183_compat = {
+static struct mtk_spi_compatible mt8183_compat = {
 	.need_pad_sel = true,
 	.must_tx = true,
 	.enhance_timing = true,
 };
 
-static const struct mtk_spi_compatible mt6893_compat = {
+static struct mtk_spi_compatible mt6893_compat = {
 	.need_pad_sel = true,
 	.must_tx = true,
 	.enhance_timing = true,
@@ -1201,25 +1203,46 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		goto err_put_master;
 	}
 
+	mdata->dev_comp->need_ahb_clk = of_property_read_bool(pdev->dev.of_node,
+							      "mediatek,need_ahb_clk");
+	if (mdata->dev_comp->need_ahb_clk) {
+		mdata->spi_hclk = devm_clk_get(&pdev->dev, "spi-hclk");
+		if (IS_ERR(mdata->spi_hclk)) {
+			ret = PTR_ERR(mdata->spi_hclk);
+			dev_err(&pdev->dev, "failed to get spi-hclk: %d\n", ret);
+			goto err_put_master;
+		}
+
+		ret = clk_prepare_enable(mdata->spi_hclk);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to enable spi_hclk (%d)\n", ret);
+			goto err_put_master;
+		}
+	}
+
 	ret = clk_prepare_enable(mdata->spi_clk);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to enable spi_clk (%d)\n", ret);
-		goto err_put_master;
+		goto err_disable_spi_hclk;
 	}
 
 	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to clk_set_parent (%d)\n", ret);
-		clk_disable_unprepare(mdata->spi_clk);
-		goto err_put_master;
+		goto err_disable_spi_clk;
 	}
 
 	mdata->spi_clk_hz = clk_get_rate(mdata->spi_clk);
 
-	if (mdata->dev_comp->no_need_unprepare)
+	if (mdata->dev_comp->no_need_unprepare) {
 		clk_disable(mdata->spi_clk);
-	else
+		if (mdata->dev_comp->need_ahb_clk)
+			clk_disable(mdata->spi_hclk);
+	} else {
 		clk_disable_unprepare(mdata->spi_clk);
+		if (mdata->dev_comp->need_ahb_clk)
+			clk_disable_unprepare(mdata->spi_hclk);
+	}
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -1272,6 +1295,11 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 err_disable_runtime_pm:
 	pm_runtime_disable(&pdev->dev);
+err_disable_spi_clk:
+	clk_disable_unprepare(mdata->spi_clk);
+err_disable_spi_hclk:
+	if (mdata->dev_comp->need_ahb_clk)
+		clk_disable_unprepare(mdata->spi_hclk);
 err_put_master:
 	spi_master_put(master);
 
@@ -1287,8 +1315,11 @@ static int mtk_spi_remove(struct platform_device *pdev)
 
 	mtk_spi_reset(mdata);
 
-	if (mdata->dev_comp->no_need_unprepare)
+	if (mdata->dev_comp->no_need_unprepare) {
 		clk_unprepare(mdata->spi_clk);
+		if (mdata->dev_comp->need_ahb_clk)
+			clk_unprepare(mdata->spi_hclk);
+	}
 
 	return 0;
 }
@@ -1304,8 +1335,11 @@ static int mtk_spi_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (!pm_runtime_suspended(dev))
+	if (!pm_runtime_suspended(dev)) {
 		clk_disable_unprepare(mdata->spi_clk);
+		if (mdata->dev_comp->need_ahb_clk)
+			clk_disable_unprepare(mdata->spi_hclk);
+	}
 
 	return ret;
 }
@@ -1322,11 +1356,23 @@ static int mtk_spi_resume(struct device *dev)
 			dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
 			return ret;
 		}
+
+		if (mdata->dev_comp->need_ahb_clk) {
+			clk_prepare_enable(mdata->spi_hclk);
+			if (ret < 0) {
+				dev_err(dev, "failed to enable spi_hclk (%d)\n", ret);
+				clk_disable_unprepare(mdata->spi_clk);
+				return ret;
+			}
+		}
 	}
 
 	ret = spi_master_resume(master);
-	if (ret < 0)
+	if (ret < 0) {
 		clk_disable_unprepare(mdata->spi_clk);
+		if (mdata->dev_comp->need_ahb_clk)
+			clk_disable_unprepare(mdata->spi_hclk);
+	}
 
 	return ret;
 }
@@ -1338,10 +1384,15 @@ static int mtk_spi_runtime_suspend(struct device *dev)
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 
-	if (mdata->dev_comp->no_need_unprepare)
+	if (mdata->dev_comp->no_need_unprepare) {
 		clk_disable(mdata->spi_clk);
-	else
+		if (mdata->dev_comp->need_ahb_clk)
+			clk_disable(mdata->spi_hclk);
+	} else {
 		clk_disable_unprepare(mdata->spi_clk);
+		if (mdata->dev_comp->need_ahb_clk)
+			clk_disable_unprepare(mdata->spi_hclk);
+	}
 
 	return 0;
 }
@@ -1352,13 +1403,23 @@ static int mtk_spi_runtime_resume(struct device *dev)
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 	int ret;
 
-	if (mdata->dev_comp->no_need_unprepare)
+	if (mdata->dev_comp->no_need_unprepare) {
 		ret = clk_enable(mdata->spi_clk);
-	else
+		if (mdata->dev_comp->need_ahb_clk)
+			clk_enable(mdata->spi_hclk);
+	} else {
 		ret = clk_prepare_enable(mdata->spi_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
-		return ret;
+		if (ret < 0) {
+			dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(mdata->spi_hclk);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable spi_hclk (%d)\n", ret);
+			clk_disable_unprepare(mdata->spi_clk);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
