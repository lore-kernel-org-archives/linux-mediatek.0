Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35991EE49A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uGX7Ce0tIEJm6HDkeZSEHkHK9FkajXvh57up7iXX2U=; b=Df5DRchaapT/QkmxZ+86Ma64rb
	A04o9h9mqDh3lxqZ7jCTNSXKDKO6h2cTBzsU7+TRIo03/XCk8AwDEbCOWkESzBK50VZSFLh5bQfr6
	CahSs1tl8IUm3+XTmPjyiX5LBtSkuKqN8m4poTDjo9G2Q6H0jN8BuLcPMo7njLRfN6CpkaWN3Rc7W
	PwvfatpDU8Fw/W80ki6gWPP/JetNdgFOv3qRZRW3dRw+FHzmqxsS5Uqlb3KRCJSwdFy2flDeyskEY
	6obPARMm9QOJ+lL5eNygrwFRPTJ8ibJuLj3YlIqOvpYI/7T82WLN6RPjiIQqW9JugiHxkhTI1rQdc
	blEYVtig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRDP-00FzDD-2S;
	Tue, 22 Aug 2023 13:14:35 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC0-00Fxar-0b;
	Tue, 22 Aug 2023 13:13:10 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RVV7Y2RhDzLpDk;
	Tue, 22 Aug 2023 21:10:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:04 +0800
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
Subject: [PATCH -next 15/25] spi: meson-spicc: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:27 +0800
Message-ID: <20230822131237.1022815-16-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_061308_772699_44046106 
X-CRM114-Status: UNSURE (   9.60  )
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-meson-spicc.c | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 43d134f4b42b..1f2d26254e03 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -820,7 +820,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 		goto out_master;
 	}
 
-	spicc->core = devm_clk_get(&pdev->dev, "core");
+	spicc->core = devm_clk_get_enabled(&pdev->dev, "core");
 	if (IS_ERR(spicc->core)) {
 		dev_err(&pdev->dev, "core clock request failed\n");
 		ret = PTR_ERR(spicc->core);
@@ -828,7 +828,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	}
 
 	if (spicc->data->has_pclk) {
-		spicc->pclk = devm_clk_get(&pdev->dev, "pclk");
+		spicc->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 		if (IS_ERR(spicc->pclk)) {
 			dev_err(&pdev->dev, "pclk clock request failed\n");
 			ret = PTR_ERR(spicc->pclk);
@@ -836,22 +836,10 @@ static int meson_spicc_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = clk_prepare_enable(spicc->core);
-	if (ret) {
-		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_master;
-	}
-
-	ret = clk_prepare_enable(spicc->pclk);
-	if (ret) {
-		dev_err(&pdev->dev, "pclk clock enable failed\n");
-		goto out_core_clk;
-	}
-
 	spicc->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(spicc->pinctrl)) {
 		ret = PTR_ERR(spicc->pinctrl);
-		goto out_clk;
+		goto out_master;
 	}
 
 	device_reset_optional(&pdev->dev);
@@ -878,31 +866,25 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	ret = meson_spicc_pow2_clk_init(spicc);
 	if (ret) {
 		dev_err(&pdev->dev, "pow2 clock registration failed\n");
-		goto out_clk;
+		goto out_master;
 	}
 
 	if (spicc->data->has_enhance_clk_div) {
 		ret = meson_spicc_enh_clk_init(spicc);
 		if (ret) {
 			dev_err(&pdev->dev, "clock registration failed\n");
-			goto out_clk;
+			goto out_master;
 		}
 	}
 
 	ret = devm_spi_register_master(&pdev->dev, master);
 	if (ret) {
 		dev_err(&pdev->dev, "spi master registration failed\n");
-		goto out_clk;
+		goto out_master;
 	}
 
 	return 0;
 
-out_clk:
-	clk_disable_unprepare(spicc->pclk);
-
-out_core_clk:
-	clk_disable_unprepare(spicc->core);
-
 out_master:
 	spi_master_put(master);
 
@@ -916,9 +898,6 @@ static void meson_spicc_remove(struct platform_device *pdev)
 	/* Disable SPI */
 	writel(0, spicc->base + SPICC_CONREG);
 
-	clk_disable_unprepare(spicc->core);
-	clk_disable_unprepare(spicc->pclk);
-
 	spi_master_put(spicc->master);
 }
 
-- 
2.34.1


