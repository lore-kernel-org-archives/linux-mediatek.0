Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC92EE49B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcsKhiv1gBAu2ktb3U+4acDSSfP+vBvIW9WHxqDxkZI=; b=w36ZF4xyRYd0S7zLq5SHIfnbRn
	EecEdsXEtV7QQoy/uqlJA3R+QZwMfAmBzdJq2u2jc7hp9iXwN+EGWQse4aLwoMjXTITUMkEVJLova
	l3zDCUlldXaD0+DkG0gpCcDHPyG5je5ohvmPe2Z2S6hrR9i4VNx6hJ6zROc87x/S01HbubHTSoYer
	ltvK0Fin4j0d7kQqjvQeFqxvS5Tnj3p6T3sZmUcbzwhf6wKvgqXm/UBb1EZ6BHnzfQeKv0SOykrK8
	cy7N/sRwCHTnbY+BbcxmaaWyTrm029k8qXoNJBe6ElvHxwa2LdI8uG08iAu3LWONzuvOLsJl5kYyq
	hj4YTRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo76-000ixL-2B;
	Wed, 23 Aug 2023 13:41:36 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5h-000hOx-26;
	Wed, 23 Aug 2023 13:40:13 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RW6jq1m9tz16NyL;
	Wed, 23 Aug 2023 21:38:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:39:51 +0800
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
	<tmaimon77@gmail.com>, <venture@google.com>, <yuenn@google.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH -next v2 01/25] spi: ar934x: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:14 +0800
Message-ID: <20230823133938.1359106-2-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230823_064010_212639_015357C9 
X-CRM114-Status: GOOD (  12.04  )
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

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: None

 drivers/spi/spi-ar934x.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-ar934x.c b/drivers/spi/spi-ar934x.c
index 58b98cea31d9..5ba988720851 100644
--- a/drivers/spi/spi-ar934x.c
+++ b/drivers/spi/spi-ar934x.c
@@ -168,27 +168,21 @@ static int ar934x_spi_probe(struct platform_device *pdev)
 	struct ar934x_spi *sp;
 	void __iomem *base;
 	struct clk *clk;
-	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
 		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*sp));
 	if (!ctlr) {
 		dev_info(&pdev->dev, "failed to allocate spi controller\n");
-		ret = -ENOMEM;
-		goto err_clk_disable;
+		return -ENOMEM;
 	}
 
 	/* disable flash mapping and expose spi controller registers */
@@ -212,25 +206,15 @@ static int ar934x_spi_probe(struct platform_device *pdev)
 	sp->clk_freq = clk_get_rate(clk);
 	sp->ctlr = ctlr;
 
-	ret = spi_register_controller(ctlr);
-	if (!ret)
-		return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(clk);
-	return ret;
+	return spi_register_controller(ctlr);
 }
 
 static void ar934x_spi_remove(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
-	struct ar934x_spi *sp;
 
 	ctlr = dev_get_drvdata(&pdev->dev);
-	sp = spi_controller_get_devdata(ctlr);
-
 	spi_unregister_controller(ctlr);
-	clk_disable_unprepare(sp->clk);
 }
 
 static struct platform_driver ar934x_spi_driver = {
-- 
2.34.1


