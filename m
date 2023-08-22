Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1AAEE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbpmQGSbg9GwepGzPYZFsjBMlo/NnZm/4woU+HdpGyE=; b=HyRSxnID5lB1tQCSbzRgRxse+m
	VcV0F+gHEhkKrEUYAKk7eRvSg5J/gmImZep4UBg3nqVjXy99NfbGDNAN3c3HEbmIWU0Lh9g+2ymsM
	xPmYox7fmtGeh8XpCoM0iwp4vMw8FrJZnm+L26+r4vmHXSWLWZKtYYKVybudpnuEMxzglIZClyZPe
	o6xKeAlrqntqWypXuf8RTMlAb+v2pghgqMQel9VaVkqXQh/SAxkCMxrTbZR3jd54c8FwQcvYJkkZX
	QjQ9fy0FcVBczR/3H4K4cqGKqRhBHQlxj8/aprtvLlef5XY7LnwxeLoNa+t1fvjtHy/rfWiF05Clu
	tIR8xEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRFA-00G1CL-2T;
	Tue, 22 Aug 2023 13:16:24 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRCA-00FxlB-2p;
	Tue, 22 Aug 2023 13:13:21 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVV706V9xztSDs;
	Tue, 22 Aug 2023 21:09:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:15 +0800
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
Subject: [PATCH -next 25/25] spi: rockchip: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:37 +0800
Message-ID: <20230822131237.1022815-26-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_061319_430132_43099D50 
X-CRM114-Status: GOOD (  10.66  )
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
 drivers/spi/spi-rockchip.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index a37943847e81..cdbb86049d59 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -782,42 +782,30 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 		goto err_put_ctlr;
 	}
 
-	rs->apb_pclk = devm_clk_get(&pdev->dev, "apb_pclk");
+	rs->apb_pclk = devm_clk_get_enabled(&pdev->dev, "apb_pclk");
 	if (IS_ERR(rs->apb_pclk)) {
 		dev_err(&pdev->dev, "Failed to get apb_pclk\n");
 		ret = PTR_ERR(rs->apb_pclk);
 		goto err_put_ctlr;
 	}
 
-	rs->spiclk = devm_clk_get(&pdev->dev, "spiclk");
+	rs->spiclk = devm_clk_get_enabled(&pdev->dev, "spiclk");
 	if (IS_ERR(rs->spiclk)) {
 		dev_err(&pdev->dev, "Failed to get spi_pclk\n");
 		ret = PTR_ERR(rs->spiclk);
 		goto err_put_ctlr;
 	}
 
-	ret = clk_prepare_enable(rs->apb_pclk);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to enable apb_pclk\n");
-		goto err_put_ctlr;
-	}
-
-	ret = clk_prepare_enable(rs->spiclk);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to enable spi_clk\n");
-		goto err_disable_apbclk;
-	}
-
 	spi_enable_chip(rs, false);
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_disable_spiclk;
+		goto err_put_ctlr;
 
 	ret = devm_request_threaded_irq(&pdev->dev, ret, rockchip_spi_isr, NULL,
 			IRQF_ONESHOT, dev_name(&pdev->dev), ctlr);
 	if (ret)
-		goto err_disable_spiclk;
+		goto err_put_ctlr;
 
 	rs->dev = &pdev->dev;
 	rs->freq = clk_get_rate(rs->spiclk);
@@ -843,7 +831,7 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 	if (!rs->fifo_len) {
 		dev_err(&pdev->dev, "Failed to get fifo length\n");
 		ret = -EINVAL;
-		goto err_disable_spiclk;
+		goto err_put_ctlr;
 	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ROCKCHIP_AUTOSUSPEND_TIMEOUT);
@@ -937,10 +925,6 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 		dma_release_channel(ctlr->dma_tx);
 err_disable_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
-err_disable_spiclk:
-	clk_disable_unprepare(rs->spiclk);
-err_disable_apbclk:
-	clk_disable_unprepare(rs->apb_pclk);
 err_put_ctlr:
 	spi_controller_put(ctlr);
 
@@ -950,13 +934,9 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 static void rockchip_spi_remove(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr = spi_controller_get(platform_get_drvdata(pdev));
-	struct rockchip_spi *rs = spi_controller_get_devdata(ctlr);
 
 	pm_runtime_get_sync(&pdev->dev);
 
-	clk_disable_unprepare(rs->spiclk);
-	clk_disable_unprepare(rs->apb_pclk);
-
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-- 
2.34.1


