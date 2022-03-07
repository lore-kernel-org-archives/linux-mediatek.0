Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E4CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAqVcBVgyGVU4WDeZJeDfXV2afXU0w0SjLdDIjZWyh0=; b=eorXpVgfofkS4U
	uy/saIVmYirN7EFTVVmC7tZncG4WFjmrxM7gyU6xeK3CwlAPJTKq+eTVhBYvzss7+q15fblK1uHs9
	eXmfxhsV/kObiJ0vktRAGgUDpIF+4LalmAp8PRv1pNDbED8RNgKZdiEMBAbm2SUuE++tQhKSkJZfq
	crul7/YZKZUwYcdL3DTEmecnphZ92o2tHOLYSYbpPl20z6tX9iwURnrpUj5HQVra4ZwG1BzVu9qCZ
	LQ3tp745p+qRxvAKPM7WTXezZUA2N1WYWW45BU88eW6RgPKTBrQV16Nj8m2tKl3Thqi6vbJoDBxEf
	cE+leGQPx4HjDsvctWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR7OY-00GD2b-6x; Mon, 07 Mar 2022 07:03:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR7OI-00GCuv-Kj; Mon, 07 Mar 2022 07:02:48 +0000
X-UUID: 144db4835cc749d4bee9e6e8faf04a66-20220307
X-UUID: 144db4835cc749d4bee9e6e8faf04a66-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 643733815; Mon, 07 Mar 2022 00:02:41 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 22:52:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 14:52:39 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Mar 2022 14:52:38 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
 <leilk.liu@mediatek.com>
Subject: [PATCH V3 7/7] spi: mediatek: support spi-hclk
Date: Mon, 7 Mar 2022 14:52:30 +0800
Message-ID: <20220307065230.12655-8-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307065230.12655-1-leilk.liu@mediatek.com>
References: <20220307065230.12655-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_230246_707786_22B93560 
X-CRM114-Status: GOOD (  16.34  )
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

this patch adds spi-hclk support.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 85 ++++++++++++++++++++++++++++++++--------
 1 file changed, 69 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 2f09b9d7a998..902013ec1223 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -132,7 +132,7 @@ struct mtk_spi {
 	u32 state;
 	int pad_num;
 	u32 *pad_sel;
-	struct clk *parent_clk, *sel_clk, *spi_clk;
+	struct clk *parent_clk, *sel_clk, *spi_clk, *spi_hclk;
 	struct spi_transfer *cur_transfer;
 	u32 xfer_len;
 	u32 num_xfered;
@@ -1221,25 +1221,38 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		goto err_put_master;
 	}
 
+	mdata->spi_hclk = devm_clk_get(&pdev->dev, "spi-hclk");
+	if (!IS_ERR(mdata->spi_hclk)) {
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
+		if (!IS_ERR(mdata->spi_hclk))
+			clk_disable(mdata->spi_hclk);
+	} else {
 		clk_disable_unprepare(mdata->spi_clk);
+		if (!IS_ERR(mdata->spi_hclk))
+			clk_disable_unprepare(mdata->spi_hclk);
+	}
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -1279,6 +1292,11 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 err_disable_runtime_pm:
 	pm_runtime_disable(&pdev->dev);
+err_disable_spi_clk:
+	clk_disable_unprepare(mdata->spi_clk);
+err_disable_spi_hclk:
+	if (!IS_ERR(mdata->spi_hclk))
+		clk_disable_unprepare(mdata->spi_hclk);
 err_put_master:
 	spi_master_put(master);
 
@@ -1294,8 +1312,11 @@ static int mtk_spi_remove(struct platform_device *pdev)
 
 	mtk_spi_reset(mdata);
 
-	if (mdata->dev_comp->no_need_unprepare)
+	if (mdata->dev_comp->no_need_unprepare) {
 		clk_unprepare(mdata->spi_clk);
+		if (!IS_ERR(mdata->spi_hclk))
+			clk_unprepare(mdata->spi_hclk);
+	}
 
 	return 0;
 }
@@ -1311,8 +1332,11 @@ static int mtk_spi_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (!pm_runtime_suspended(dev))
+	if (!pm_runtime_suspended(dev)) {
 		clk_disable_unprepare(mdata->spi_clk);
+		if (!IS_ERR(mdata->spi_hclk))
+			clk_disable_unprepare(mdata->spi_hclk);
+	}
 
 	return ret;
 }
@@ -1329,11 +1353,23 @@ static int mtk_spi_resume(struct device *dev)
 			dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
 			return ret;
 		}
+
+		if (!IS_ERR(mdata->spi_hclk)) {
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
+		if (!IS_ERR(mdata->spi_hclk))
+			clk_disable_unprepare(mdata->spi_hclk);
+	}
 
 	return ret;
 }
@@ -1345,10 +1381,15 @@ static int mtk_spi_runtime_suspend(struct device *dev)
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 
-	if (mdata->dev_comp->no_need_unprepare)
+	if (mdata->dev_comp->no_need_unprepare) {
 		clk_disable(mdata->spi_clk);
-	else
+		if (!IS_ERR(mdata->spi_hclk))
+			clk_disable(mdata->spi_hclk);
+	} else {
 		clk_disable_unprepare(mdata->spi_clk);
+		if (!IS_ERR(mdata->spi_hclk))
+			clk_disable_unprepare(mdata->spi_hclk);
+	}
 
 	return 0;
 }
@@ -1359,13 +1400,25 @@ static int mtk_spi_runtime_resume(struct device *dev)
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 	int ret;
 
-	if (mdata->dev_comp->no_need_unprepare)
+	if (mdata->dev_comp->no_need_unprepare) {
 		ret = clk_enable(mdata->spi_clk);
-	else
+		if (!IS_ERR(mdata->spi_hclk))
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
+		if (!IS_ERR(mdata->spi_hclk)) {
+			ret = clk_prepare_enable(mdata->spi_hclk);
+			if (ret < 0) {
+				dev_err(dev, "failed to enable spi_hclk (%d)\n", ret);
+				clk_disable_unprepare(mdata->spi_clk);
+				return ret;
+			}
+		}
 	}
 
 	return 0;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
