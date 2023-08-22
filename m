Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D41EE49AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzAQ8Z6LraULVarWXIrEbAnmi/B7BhxAtSskrdz8eEA=; b=q6s4XOaPj00j8t25UA2kOM84TD
	/YBWKPmgyxcwwrYqVHOayTbV2dbje98v2jiFE3wz7MMX1KqE6REu6sDrVAow55qW+94khoomC69GX
	QvKDI0CA7SdSl1jPkdiqw6DRArGZTTopqOrEbrotiSw/jNh3isBhfO1OULnt8RrrW+apWUyyfVrlS
	IvoJJSQskhvPD7D04Lp6QZc7856QhaE9koSdeyahn+a5WNlcgFEIpqWuFUAT/dDjgxFoABVbMTwaW
	2eo7m+DwoicZTPVNdus4KA5RrKfNzsCZ2PX6iW3eANzoglh2F7ww/meI2cLgvuBh0V7oorCToWRrS
	afwoMpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRDO-00FzCK-2u;
	Tue, 22 Aug 2023 13:14:34 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC0-00Fxak-08;
	Tue, 22 Aug 2023 13:13:09 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVV8T4byTzTmMj;
	Tue, 22 Aug 2023 21:10:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:03 +0800
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
Subject: [PATCH -next 14/25] spi: lantiq-ssc: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:26 +0800
Message-ID: <20230822131237.1022815-15-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_061308_352015_281D934B 
X-CRM114-Status: GOOD (  10.28  )
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
 drivers/spi/spi-lantiq-ssc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-lantiq-ssc.c b/drivers/spi/spi-lantiq-ssc.c
index 938e9e577e4f..18a46569ba46 100644
--- a/drivers/spi/spi-lantiq-ssc.c
+++ b/drivers/spi/spi-lantiq-ssc.c
@@ -932,14 +932,11 @@ static int lantiq_ssc_probe(struct platform_device *pdev)
 	if (err)
 		goto err_host_put;
 
-	spi->spi_clk = devm_clk_get(dev, "gate");
+	spi->spi_clk = devm_clk_get_enabled(dev, "gate");
 	if (IS_ERR(spi->spi_clk)) {
 		err = PTR_ERR(spi->spi_clk);
 		goto err_host_put;
 	}
-	err = clk_prepare_enable(spi->spi_clk);
-	if (err)
-		goto err_host_put;
 
 	/*
 	 * Use the old clk_get_fpi() function on Lantiq platform, till it
@@ -952,7 +949,7 @@ static int lantiq_ssc_probe(struct platform_device *pdev)
 #endif
 	if (IS_ERR(spi->fpi_clk)) {
 		err = PTR_ERR(spi->fpi_clk);
-		goto err_clk_disable;
+		goto err_host_put;
 	}
 
 	num_cs = 8;
@@ -1010,8 +1007,6 @@ static int lantiq_ssc_probe(struct platform_device *pdev)
 	destroy_workqueue(spi->wq);
 err_clk_put:
 	clk_put(spi->fpi_clk);
-err_clk_disable:
-	clk_disable_unprepare(spi->spi_clk);
 err_host_put:
 	spi_controller_put(host);
 
@@ -1029,7 +1024,6 @@ static void lantiq_ssc_remove(struct platform_device *pdev)
 	hw_enter_config_mode(spi);
 
 	destroy_workqueue(spi->wq);
-	clk_disable_unprepare(spi->spi_clk);
 	clk_put(spi->fpi_clk);
 }
 
-- 
2.34.1


