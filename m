Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B202BEE49B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYhXudnk7r9BO2Dg1bPi5e0rEm7fswzbM7fVcbfclhA=; b=V21WicoN1f5FwLidPbOMbNkazg
	jeQ9wRUjWh+woszYTtxZ90WH7tyZeBSfzLA6MygCAiQi3pdBfng3Z0ZVIvMExlneyJFjY0L3q/QSj
	wiSSh0HtvSg/FCUPqS6ARGEl6Z2vMWrcaPzzFGlgE6yeFBPbSIss3cjtrPzaOzdHp16k68g7k9yig
	qAvL3IIwTw3I6NN9JYRU7wmv7s7+W25y3my/wdr0aR2L8U0OTwMnCyGHKcs2gaanmG6mDl10ESmyx
	k2wVTvNXA9RT7EvojkQNMvMdQHHoYUST84xSDOVxhFTY+a3Jz4yJAaEzCZhYbmQZ+QoxKDjPsBU9O
	o9QQ/TsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo6E-000i1D-0s;
	Wed, 23 Aug 2023 13:40:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5f-000hPi-2L;
	Wed, 23 Aug 2023 13:40:11 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RW6gd72g1zNn6Q;
	Wed, 23 Aug 2023 21:36:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:03 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <andrew@aj.id.au>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<benjaminfair@google.com>, <broonie@kernel.org>,
	<chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <conor.dooley@microchip.com>,
	<daire.mcnamara@microchip.com>, <fancer.lancer@gmail.com>,
	<florian.fainelli@broadcom.com>, <heiko@sntech.de>, <jbrunet@baylibre.com>,
	<joel@jms.id.au>, <khilman@baylibre.com>, <linus.walleij@linaro.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<neil.armstrong@linaro.org>, <olteanv@gmail.com>, <openbmc@lists.ozlabs.org>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <tali.perry1@gmail.com>,
	<tmaimon77@gmail.com>, <venture@google.com>, <yuenn@google.com>
Subject: [PATCH -next v2 12/25] spi: dw-mmio: Use helper function devm_clk_get_*()
Date: Wed, 23 Aug 2023 21:39:25 +0800
Message-ID: <20230823133938.1359106-13-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823133938.1359106-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_064008_286332_578732FE 
X-CRM114-Status: GOOD (  11.88  )
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
v1 -> v2: Return directly instead of calling reset_control_deassert()
before the reset control handler has been requested. And use the
"out_reset" label instead of "out" before calling pm_runtime_enable().

 drivers/spi/spi-dw-mmio.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 805264c9c65c..46801189a651 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -340,29 +340,20 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
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
-	if (IS_ERR(dwsmmio->pclk)) {
-		ret = PTR_ERR(dwsmmio->pclk);
-		goto out_clk;
-	}
-	ret = clk_prepare_enable(dwsmmio->pclk);
-	if (ret)
-		goto out_clk;
+	dwsmmio->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(dwsmmio->pclk))
+		return PTR_ERR(dwsmmio->pclk);
 
 	/* find an optional reset controller */
 	dwsmmio->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, "spi");
-	if (IS_ERR(dwsmmio->rstc)) {
-		ret = PTR_ERR(dwsmmio->rstc);
-		goto out_clk;
-	}
+	if (IS_ERR(dwsmmio->rstc))
+		return PTR_ERR(dwsmmio->rstc);
+
 	reset_control_deassert(dwsmmio->rstc);
 
 	dws->bus_num = pdev->id;
@@ -383,7 +374,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 	if (init_func) {
 		ret = init_func(pdev, dwsmmio);
 		if (ret)
-			goto out;
+			goto out_reset;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -397,9 +388,7 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 
 out:
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(dwsmmio->pclk);
-out_clk:
-	clk_disable_unprepare(dwsmmio->clk);
+out_reset:
 	reset_control_assert(dwsmmio->rstc);
 
 	return ret;
@@ -411,8 +400,6 @@ static void dw_spi_mmio_remove(struct platform_device *pdev)
 
 	dw_spi_remove_host(&dwsmmio->dws);
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(dwsmmio->pclk);
-	clk_disable_unprepare(dwsmmio->clk);
 	reset_control_assert(dwsmmio->rstc);
 }
 
-- 
2.34.1


