Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622B8EE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzMxFXV1mlVb+K3mRB/hgKCannRtJ4kXloPexBIA58Y=; b=DCiz7UiWnSbnZkfuQLkiVwAJyt
	2A1ifXomq5TSuY6esERldaF845DtORkBKv+fN7Y8ijJ5N/tV84WekiMdCiRe0cBkOAox3xDtOKSk3
	H5H+mkE4iPG9ZewO1hdOwqq9gHbYVFIaG+cvoDSzM1VD9IgGhP8bA2y6YjRr7y9EyKRx/XEmiGH3O
	OhjqCYXX44cyhqF9PzXxROPNwOoedpQi/sFst6fbBdtkgYE+1pkOlOXVPSbM+EjhKRBSxHhkrrBeq
	EMRdI7a8FoPgM/JubQDH0w1drj1713aPBm5moeumzXmW1a2iW0S+IIEeD6IkVhh4hrrWo+7hsWEN7
	A56simmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRCw-00Fygg-1f;
	Tue, 22 Aug 2023 13:14:06 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRBw-00FxY0-2r;
	Tue, 22 Aug 2023 13:13:06 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVV8R3ZmjzTmN3;
	Tue, 22 Aug 2023 21:10:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:01 +0800
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
Subject: [PATCH -next 12/25] spi: dw-mmio: Use helper function devm_clk_get_*()
Date: Tue, 22 Aug 2023 21:12:24 +0800
Message-ID: <20230822131237.1022815-13-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_061305_450130_7C6632FF 
X-CRM114-Status: GOOD (  10.54  )
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
no longer necessary to unprepare and disable the clocks explicitly. Also,
devm_clk_get_optional() and clk_prepare_enable() can now be replaced by
devm_clk_get_optional_enabled(). Moreover, the lable "out_clk" no longer
makes sense, rename it to "out_reset".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-dw-mmio.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 805264c9c65c..6d9f64ecbfd6 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -340,28 +340,22 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 	if (dws->irq < 0)
 		return dws->irq; /* -ENXIO */
 
-	dwsmmio->clk = devm_clk_get(&pdev->dev, NULL);
+	dwsmmio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(dwsmmio->clk))
 		return PTR_ERR(dwsmmio->clk);
-	ret = clk_prepare_enable(dwsmmio->clk);
-	if (ret)
-		return ret;
 
 	/* Optional clock needed to access the registers */
-	dwsmmio->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
+	dwsmmio->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dwsmmio->pclk)) {
 		ret = PTR_ERR(dwsmmio->pclk);
-		goto out_clk;
+		goto out_reset;
 	}
-	ret = clk_prepare_enable(dwsmmio->pclk);
-	if (ret)
-		goto out_clk;
 
 	/* find an optional reset controller */
 	dwsmmio->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, "spi");
 	if (IS_ERR(dwsmmio->rstc)) {
 		ret = PTR_ERR(dwsmmio->rstc);
-		goto out_clk;
+		goto out_reset;
 	}
 	reset_control_deassert(dwsmmio->rstc);
 
@@ -397,9 +391,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 
 out:
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(dwsmmio->pclk);
-out_clk:
-	clk_disable_unprepare(dwsmmio->clk);
+out_reset:
 	reset_control_assert(dwsmmio->rstc);
 
 	return ret;
@@ -411,8 +403,6 @@ static void dw_spi_mmio_remove(struct platform_device *pdev)
 
 	dw_spi_remove_host(&dwsmmio->dws);
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(dwsmmio->pclk);
-	clk_disable_unprepare(dwsmmio->clk);
 	reset_control_assert(dwsmmio->rstc);
 }
 
-- 
2.34.1


