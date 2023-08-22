Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48489EE49A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsTmf8uikFevjYWEk1w4+8cGdm/sUnSni9gtqiqPvEk=; b=EPqv6snQ8VOHtzrgEZzXBv/Whe
	lRXGjjqXv0Bz8qz7ZuiOXF50Po/96dhSCV87qBo0jMrFGJmwzIRHiabqEZ96kue5wfHtTsnAGl0yZ
	+7gS6QNY23tSxMWnQ4Itm6EZefPF7VrTtnyetGGKuwjrkZjhlirqqDI24Ga1zyPn+d6zNf1XcftpQ
	oBytbqOScsUIvdyPS89O2i74O6Q8xgsHZQbZ0wstOK0tLnxkRSikENEXOPb0dscLcdU+yzKexBvrZ
	ZUyuoyqi3ER28dZEXstSO0sG9t8a9JU2wsz2ZeX5PzuyLJvsbN3wB4GsjgDeUQDdsYBo7ybHhnRw2
	tTsxFdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRE5-00Fzxv-2X;
	Tue, 22 Aug 2023 13:15:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC4-00FxfF-12;
	Tue, 22 Aug 2023 13:13:14 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVV9S5WmHzrSmC;
	Tue, 22 Aug 2023 21:11:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:08 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <broonie@kernel.org>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<joel@jms.id.au>, <andrew@aj.id.au>, <florian.fainelli@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<olteanv@gmail.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>, <heiko@sntech.de>
CC: <lizetao1@huawei.com>, <linux-spi@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>
Subject: [PATCH -next 19/25] spi: mtk-snfi: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:31 +0800
Message-ID: <20230822131237.1022815-20-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_061312_929369_F5DDF5C8 
X-CRM114-Status: GOOD (  11.69  )
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly.
Also, devm_clk_get_optional() and clk_prepare_enable() can now be
replaced by devm_clk_get_optional_enabled().Moreover, the two functions
mtk_snand_enable_clk() and mtk_snand_disable_clk() no longer are used,
drop them for clean code.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-mtk-snfi.c | 61 ++++++--------------------------------
 1 file changed, 9 insertions(+), 52 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 4433a8a9299f..8ad5a4764855 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1332,42 +1332,6 @@ static const struct of_device_id mtk_snand_ids[] = {
 
 MODULE_DEVICE_TABLE(of, mtk_snand_ids);
 
-static int mtk_snand_enable_clk(struct mtk_snand *ms)
-{
-	int ret;
-
-	ret = clk_prepare_enable(ms->nfi_clk);
-	if (ret) {
-		dev_err(ms->dev, "unable to enable nfi clk\n");
-		return ret;
-	}
-	ret = clk_prepare_enable(ms->pad_clk);
-	if (ret) {
-		dev_err(ms->dev, "unable to enable pad clk\n");
-		goto err1;
-	}
-	ret = clk_prepare_enable(ms->nfi_hclk);
-	if (ret) {
-		dev_err(ms->dev, "unable to enable nfi hclk\n");
-		goto err2;
-	}
-
-	return 0;
-
-err2:
-	clk_disable_unprepare(ms->pad_clk);
-err1:
-	clk_disable_unprepare(ms->nfi_clk);
-	return ret;
-}
-
-static void mtk_snand_disable_clk(struct mtk_snand *ms)
-{
-	clk_disable_unprepare(ms->nfi_hclk);
-	clk_disable_unprepare(ms->pad_clk);
-	clk_disable_unprepare(ms->nfi_clk);
-}
-
 static int mtk_snand_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1406,49 +1370,45 @@ static int mtk_snand_probe(struct platform_device *pdev)
 
 	ms->dev = &pdev->dev;
 
-	ms->nfi_clk = devm_clk_get(&pdev->dev, "nfi_clk");
+	ms->nfi_clk = devm_clk_get_enabled(&pdev->dev, "nfi_clk");
 	if (IS_ERR(ms->nfi_clk)) {
 		ret = PTR_ERR(ms->nfi_clk);
 		dev_err(&pdev->dev, "unable to get nfi_clk, err = %d\n", ret);
 		goto release_ecc;
 	}
 
-	ms->pad_clk = devm_clk_get(&pdev->dev, "pad_clk");
+	ms->pad_clk = devm_clk_get_enabled(&pdev->dev, "pad_clk");
 	if (IS_ERR(ms->pad_clk)) {
 		ret = PTR_ERR(ms->pad_clk);
 		dev_err(&pdev->dev, "unable to get pad_clk, err = %d\n", ret);
 		goto release_ecc;
 	}
 
-	ms->nfi_hclk = devm_clk_get_optional(&pdev->dev, "nfi_hclk");
+	ms->nfi_hclk = devm_clk_get_optional_enabled(&pdev->dev, "nfi_hclk");
 	if (IS_ERR(ms->nfi_hclk)) {
 		ret = PTR_ERR(ms->nfi_hclk);
 		dev_err(&pdev->dev, "unable to get nfi_hclk, err = %d\n", ret);
 		goto release_ecc;
 	}
 
-	ret = mtk_snand_enable_clk(ms);
-	if (ret)
-		goto release_ecc;
-
 	init_completion(&ms->op_done);
 
 	ms->irq = platform_get_irq(pdev, 0);
 	if (ms->irq < 0) {
 		ret = ms->irq;
-		goto disable_clk;
+		goto release_ecc;
 	}
 	ret = devm_request_irq(ms->dev, ms->irq, mtk_snand_irq, 0x0,
 			       "mtk-snand", ms);
 	if (ret) {
 		dev_err(ms->dev, "failed to request snfi irq\n");
-		goto disable_clk;
+		goto release_ecc;
 	}
 
 	ret = dma_set_mask(ms->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(ms->dev, "failed to set dma mask\n");
-		goto disable_clk;
+		goto release_ecc;
 	}
 
 	// switch to SNFI mode
@@ -1472,7 +1432,7 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	ret = mtk_snand_setup_pagefmt(ms, SZ_2K, SZ_64);
 	if (ret) {
 		dev_err(ms->dev, "failed to set initial page format\n");
-		goto disable_clk;
+		goto release_ecc;
 	}
 
 	// setup ECC engine
@@ -1484,7 +1444,7 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	ret = nand_ecc_register_on_host_hw_engine(&ms->ecc_eng);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ecc engine.\n");
-		goto disable_clk;
+		goto release_ecc;
 	}
 
 	ctlr->num_chipselect = 1;
@@ -1496,12 +1456,10 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	ret = spi_register_controller(ctlr);
 	if (ret) {
 		dev_err(&pdev->dev, "spi_register_controller failed.\n");
-		goto disable_clk;
+		goto release_ecc;
 	}
 
 	return 0;
-disable_clk:
-	mtk_snand_disable_clk(ms);
 release_ecc:
 	mtk_ecc_release(ms->ecc);
 	return ret;
@@ -1513,7 +1471,6 @@ static void mtk_snand_remove(struct platform_device *pdev)
 	struct mtk_snand *ms = spi_controller_get_devdata(ctlr);
 
 	spi_unregister_controller(ctlr);
-	mtk_snand_disable_clk(ms);
 	mtk_ecc_release(ms->ecc);
 	kfree(ms->buf);
 }
-- 
2.34.1


