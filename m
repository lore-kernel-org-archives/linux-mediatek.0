Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE722EE49A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRzGwZ+jOTmcsuDwCdzoR58nkgczcFwBmnCDnDyTjvs=; b=iVBAZn6bgQPsELHsXRYssT/oXt
	83u7vl1MdvRZZyjluhGBFHs5uMXLxZ8OYxoBYm3dx2pzDB1ZxM9bWTAuf2NOfqcH4wzBYsQx9mwnz
	58ZJ+Vo+JJ/70BagiIIdZUT+P57LfLCgK8hKhNc4NUQFxrcr0kqI7dv+vSlNqbKXn1lYySh3gq475
	KfQW8nPXsWp3cMfk3L+iSDl6Nm+VzWaWwvE/Dw0mBznAv27JjFQ5FoF/rSzywK+Dk54MJqE8uqJZ7
	ocih5kqFNFQdVjorGwxgJS6cu+Ph3orRw3Fi2M/5+oN5attCyqlSKG1WQV8Eba0u4SfwJPtJ4P1AB
	gDASdT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYREZ-00G0aV-1Y;
	Tue, 22 Aug 2023 13:15:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC7-00Fxi9-24;
	Tue, 22 Aug 2023 13:13:17 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVV765Z8SzNnNM;
	Tue, 22 Aug 2023 21:09:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:11 +0800
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
Subject: [PATCH -next 22/25] spi: pic32-sqi: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:34 +0800
Message-ID: <20230822131237.1022815-23-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_061316_132261_76371C5C 
X-CRM114-Status: UNSURE (   9.82  )
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
 drivers/spi/spi-pic32-sqi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-pic32-sqi.c b/drivers/spi/spi-pic32-sqi.c
index 5cbebcf26a2a..d894b99e4104 100644
--- a/drivers/spi/spi-pic32-sqi.c
+++ b/drivers/spi/spi-pic32-sqi.c
@@ -593,33 +593,20 @@ static int pic32_sqi_probe(struct platform_device *pdev)
 	}
 
 	/* clocks */
-	sqi->sys_clk = devm_clk_get(&pdev->dev, "reg_ck");
+	sqi->sys_clk = devm_clk_get_enabled(&pdev->dev, "reg_ck");
 	if (IS_ERR(sqi->sys_clk)) {
 		ret = PTR_ERR(sqi->sys_clk);
 		dev_err(&pdev->dev, "no sys_clk ?\n");
 		goto err_free_master;
 	}
 
-	sqi->base_clk = devm_clk_get(&pdev->dev, "spi_ck");
+	sqi->base_clk = devm_clk_get_enabled(&pdev->dev, "spi_ck");
 	if (IS_ERR(sqi->base_clk)) {
 		ret = PTR_ERR(sqi->base_clk);
 		dev_err(&pdev->dev, "no base clk ?\n");
 		goto err_free_master;
 	}
 
-	ret = clk_prepare_enable(sqi->sys_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "sys clk enable failed\n");
-		goto err_free_master;
-	}
-
-	ret = clk_prepare_enable(sqi->base_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "base clk enable failed\n");
-		clk_disable_unprepare(sqi->sys_clk);
-		goto err_free_master;
-	}
-
 	init_completion(&sqi->xfer_done);
 
 	/* initialize hardware */
@@ -629,7 +616,7 @@ static int pic32_sqi_probe(struct platform_device *pdev)
 	ret = ring_desc_ring_alloc(sqi);
 	if (ret) {
 		dev_err(&pdev->dev, "ring alloc failed\n");
-		goto err_disable_clk;
+		goto err_free_master;
 	}
 
 	/* install irq handlers */
@@ -669,10 +656,6 @@ static int pic32_sqi_probe(struct platform_device *pdev)
 err_free_ring:
 	ring_desc_ring_free(sqi);
 
-err_disable_clk:
-	clk_disable_unprepare(sqi->base_clk);
-	clk_disable_unprepare(sqi->sys_clk);
-
 err_free_master:
 	spi_master_put(master);
 	return ret;
@@ -685,10 +668,6 @@ static void pic32_sqi_remove(struct platform_device *pdev)
 	/* release resources */
 	free_irq(sqi->irq, sqi);
 	ring_desc_ring_free(sqi);
-
-	/* disable clk */
-	clk_disable_unprepare(sqi->base_clk);
-	clk_disable_unprepare(sqi->sys_clk);
 }
 
 static const struct of_device_id pic32_sqi_of_ids[] = {
-- 
2.34.1


