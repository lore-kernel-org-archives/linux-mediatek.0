Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1074EE49A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+GYghfDrI4wm+Ydgi9ahHZR0DrzZ3M0PXJa2pBrc/c=; b=K0AP6lmTF2aaUk394ht/Arao13
	Jt11rKXSiV62bckgokS7Lx1Jjdl8BkeT2QICXFEq0juP1OFttkh4znNojA2DUsvct2yasA4mk0Bri
	VHpmlEchtCm0Fh+FjJZSNdG8pIfHaGmCv3JuB7sVOKbIQSR7G+v/XvB4wjB/t4Coe8+fW2kBVIQcd
	TgWALdcBRYjDEg1IMYY+mLmD1lw1IudTFIweBbP7rr4PtZOK5h6TkVmh0K5X6f/oFvoEVdqsulaZ5
	Opkkx1scCDsHAXD4WiKis1rhzR76+dz16ngTDNcbzQnIJP2RoR04iV3DdYZorlEVUvovasrMguY6n
	dKc50XzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo6A-000hwj-2G;
	Wed, 23 Aug 2023 13:40:38 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5f-000hOl-2h;
	Wed, 23 Aug 2023 13:40:11 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RW6jq3yGBzrSbq;
	Wed, 23 Aug 2023 21:38:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:39:52 +0800
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
Subject: [PATCH -next v2 02/25] spi: armada-3700: Use helper function devm_clk_get_prepared()
Date: Wed, 23 Aug 2023 21:39:15 +0800
Message-ID: <20230823133938.1359106-3-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230823_064008_405257_FAA065BA 
X-CRM114-Status: GOOD (  12.06  )
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
and enabled clocks"), devm_clk_get() and clk_prepare() can now be replaced
by devm_clk_get_prepared() when driver prepares the clocks for the whole
lifetime of the device. Moreover, it is no longer necessary to unprepare
the clocks explicitly.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Drop the empty remove function a3700_spi_remove().

 drivers/spi/spi-armada-3700.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index 0103ac0158c0..3c9ed412932f 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -865,18 +865,12 @@ static int a3700_spi_probe(struct platform_device *pdev)
 
 	init_completion(&spi->done);
 
-	spi->clk = devm_clk_get(dev, NULL);
+	spi->clk = devm_clk_get_prepared(dev, NULL);
 	if (IS_ERR(spi->clk)) {
 		dev_err(dev, "could not find clk: %ld\n", PTR_ERR(spi->clk));
 		goto error;
 	}
 
-	ret = clk_prepare(spi->clk);
-	if (ret) {
-		dev_err(dev, "could not prepare clk: %d\n", ret);
-		goto error;
-	}
-
 	host->max_speed_hz = min_t(unsigned long, A3700_SPI_MAX_SPEED_HZ,
 					clk_get_rate(spi->clk));
 	host->min_speed_hz = DIV_ROUND_UP(clk_get_rate(spi->clk),
@@ -888,40 +882,29 @@ static int a3700_spi_probe(struct platform_device *pdev)
 			       dev_name(dev), host);
 	if (ret) {
 		dev_err(dev, "could not request IRQ: %d\n", ret);
-		goto error_clk;
+		goto error;
 	}
 
 	ret = devm_spi_register_controller(dev, host);
 	if (ret) {
 		dev_err(dev, "Failed to register host\n");
-		goto error_clk;
+		goto error;
 	}
 
 	return 0;
 
-error_clk:
-	clk_unprepare(spi->clk);
 error:
 	spi_controller_put(host);
 out:
 	return ret;
 }
 
-static void a3700_spi_remove(struct platform_device *pdev)
-{
-	struct spi_controller *host = platform_get_drvdata(pdev);
-	struct a3700_spi *spi = spi_controller_get_devdata(host);
-
-	clk_unprepare(spi->clk);
-}
-
 static struct platform_driver a3700_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.of_match_table = of_match_ptr(a3700_spi_dt_ids),
 	},
 	.probe		= a3700_spi_probe,
-	.remove_new	= a3700_spi_remove,
 };
 
 module_platform_driver(a3700_spi_driver);
-- 
2.34.1


