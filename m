Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443E1EE49A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJkcdwf+SUin/OWH/JItjONWP4FM1ASTjCJx3b2+s6I=; b=Nqz2ylDvMFSHMQm+BBpEMcn3Xf
	ICzX057UccV+2jdgsUVuGVDBFXJ6g9bc6WtBMgJ74FZ/EaNGLdG/Q0k5vyOncuRUz7YIARqS4dElC
	rCFoKi61BLM7zew06s+uLPDId7JFLfWBwsfQwjR+Ka59a4BxnWoG0ktrIewMmUuKi6DaxH55/JyYC
	UdxPRwNSOGbebQE+4siNKzn9WKzWA/DbUTIcmBceb8xozZWGWmY1dvpO/ASCYho0J3XrYD6DCjY8w
	yUN0XMoamcLgLY7odT07vuVe1eOvYUgxjvcJKtZjnFU58WKrawF1VoV9jzF9Z2803+FWnwo1F5a0c
	L7kb4SiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYREk-00G0l9-3C;
	Tue, 22 Aug 2023 13:15:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC8-00Fxj0-1v;
	Tue, 22 Aug 2023 13:13:18 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVV8g2Vb5zTmTk;
	Tue, 22 Aug 2023 21:10:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:12 +0800
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
Subject: [PATCH -next 23/25] spi: pic32: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:35 +0800
Message-ID: <20230822131237.1022815-24-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_061316_871973_994B51B0 
X-CRM114-Status: UNSURE (   8.95  )
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
 drivers/spi/spi-pic32.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index e9b4c9cb97fb..2b0680974cba 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -730,17 +730,13 @@ static int pic32_spi_hw_probe(struct platform_device *pdev,
 		return pic32s->tx_irq;
 
 	/* get clock */
-	pic32s->clk = devm_clk_get(&pdev->dev, "mck0");
+	pic32s->clk = devm_clk_get_enabled(&pdev->dev, "mck0");
 	if (IS_ERR(pic32s->clk)) {
 		dev_err(&pdev->dev, "clk not found\n");
 		ret = PTR_ERR(pic32s->clk);
 		goto err_unmap_mem;
 	}
 
-	ret = clk_prepare_enable(pic32s->clk);
-	if (ret)
-		goto err_unmap_mem;
-
 	pic32_spi_hw_init(pic32s);
 
 	return 0;
@@ -837,7 +833,6 @@ static int pic32_spi_probe(struct platform_device *pdev)
 
 err_bailout:
 	pic32_spi_dma_unprep(pic32s);
-	clk_disable_unprepare(pic32s->clk);
 err_master:
 	spi_master_put(master);
 	return ret;
@@ -849,7 +844,6 @@ static void pic32_spi_remove(struct platform_device *pdev)
 
 	pic32s = platform_get_drvdata(pdev);
 	pic32_spi_disable(pic32s);
-	clk_disable_unprepare(pic32s->clk);
 	pic32_spi_dma_unprep(pic32s);
 }
 
-- 
2.34.1


