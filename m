Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E214FEE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5I8iRDEIk3kq9ow/thEp/dEyDrPlyNePVz6ndXDvsk=; b=RmAjOIZFL+vT5tixvGz2ggn9z+
	Hzd+Uha+hTHvgzncgKtTUWHjt/klkWg5sLU/kV5jbf5LVUMkIHPPl5oqYnqFf73lPVRap8LzVKvlQ
	oQX2+cd0U79nuqaWO78pa8oHym4TGhHXpoaL1pHlW8CaFySNlK8GQG8cyuQF8i/MOpHCfJK23eVLt
	6/kMUta22QnE5dayr9ntWEfq0hpRLoB+eKRZl0ElioLOQK3x2cMvfX4FAvKH5eWeTQQ0KmP/bMpcU
	GwhxW3b5BkKltAbw1ktY+7jFDIUvrUDX6yy6TTSe+RpCWEl9SkCv+rstHrtXKzpfW+txk0Tevb2Mk
	9nRgfXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRCN-00Fy0j-1i;
	Tue, 22 Aug 2023 13:13:31 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRBt-00FxVV-1t;
	Tue, 22 Aug 2023 13:13:03 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RVV9821pFz1L9G9;
	Tue, 22 Aug 2023 21:11:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:12:51 +0800
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
Subject: [PATCH -next 03/25] spi: aspeed: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:15 +0800
Message-ID: <20230822131237.1022815-4-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_061302_106648_760B7913 
X-CRM114-Status: GOOD (  10.74  )
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

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-aspeed-smc.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 21b0fa646c7d..bbd417c55e7f 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -748,7 +748,7 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	aspi->ahb_window_size = resource_size(res);
 	aspi->ahb_base_phy = res->start;
 
-	aspi->clk = devm_clk_get(&pdev->dev, NULL);
+	aspi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(aspi->clk)) {
 		dev_err(dev, "missing clock\n");
 		return PTR_ERR(aspi->clk);
@@ -760,12 +760,6 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = clk_prepare_enable(aspi->clk);
-	if (ret) {
-		dev_err(dev, "can not enable the clock\n");
-		return ret;
-	}
-
 	/* IRQ is for DMA, which the driver doesn't support yet */
 
 	ctlr->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL | data->mode_bits;
@@ -777,14 +771,9 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	ctlr->dev.of_node = dev->of_node;
 
 	ret = devm_spi_register_controller(dev, ctlr);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "spi_register_controller failed\n");
-		goto disable_clk;
-	}
-	return 0;
 
-disable_clk:
-	clk_disable_unprepare(aspi->clk);
 	return ret;
 }
 
@@ -793,7 +782,6 @@ static void aspeed_spi_remove(struct platform_device *pdev)
 	struct aspeed_spi *aspi = platform_get_drvdata(pdev);
 
 	aspeed_spi_enable(aspi, false);
-	clk_disable_unprepare(aspi->clk);
 }
 
 /*
-- 
2.34.1


