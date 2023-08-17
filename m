Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D723DC2FC14
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 02:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eHzROKCr8FRqcH743tCTtTrKPWTC6WmLxr6gmtv8gc=; b=S2HWLsKwBdfnvc8bXzsbUIoTw+
	UnPq7bveD1pMebBQRlb7w/BXYR5AnYdWHDNr3HpFQVq5tK8VMmE+H89aNHYPW3zuFdx1DyIXLpvoN
	4pENYw6TfLHYqdFlMKtLH6wgKazNlhkORB3E011B5RZ/nHDAqd9/ZT6+vB+Yr0Shl+UbLIobYFWaX
	BfvDq6Rja8xQxDXtrUjUgHpxE++PE5gYcC8bfpCMRY2PLRvhSYa2miX/mBvcjfmwKcV/2Tsanfjwo
	O3zXyFbuNdZZM3k4FQT0uxY/lPaP/dyg/sSoYSCCgkWQdUwE+b4vVBu/VVTVHPolP/JzUCGkKLyMC
	LkFDJdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWT1J-005NB7-2b;
	Thu, 17 Aug 2023 02:45:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWT10-005Mxm-0I;
	Thu, 17 Aug 2023 02:45:40 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RR8Td4ChWzrSX8;
	Thu, 17 Aug 2023 10:44:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:26 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<michal.simek@amd.com>, <vz@mleia.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <michael@walle.cc>, <frank.li@vivo.com>
CC: <robh@kernel.org>, <martin.blumenstingl@googlemail.com>,
	<philmd@linaro.org>, <geert+renesas@glider.be>,
	<u.kleine-koenig@pengutronix.de>, <rogerq@kernel.org>,
	<paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
	<yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
	<christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
	<jinpu.wang@ionos.com>, <lizetao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: [PATCH -next 01/11] mtd: spear_smi: Use helper function devm_clk_get_enabled()
Date: Thu, 17 Aug 2023 10:44:59 +0800
Message-ID: <20230817024509.3951629-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_194538_369329_E3CDEBD5 
X-CRM114-Status: GOOD (  10.84  )
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

After the commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for
prepared and enabled clocks"), it can replace the pair of functions,
devm_clk_get() and clk_prepare_enable() with a single helper function
devm_clk_get_enabled(). Moreover, the driver will keeps a clock prepared
(or enabled) during the whole lifetime of the driver, it is unnecessary to
unprepare and disable clock explicitly when remove driver or in the error
handling path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/devices/spear_smi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 93bca5225116..0a35e5236ae5 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -993,21 +993,17 @@ static int spear_smi_probe(struct platform_device *pdev)
 		dev->num_flashes = MAX_NUM_FLASH_CHIP;
 	}
 
-	dev->clk = devm_clk_get(&pdev->dev, NULL);
+	dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(dev->clk)) {
 		ret = PTR_ERR(dev->clk);
 		goto err;
 	}
 
-	ret = clk_prepare_enable(dev->clk);
-	if (ret)
-		goto err;
-
 	ret = devm_request_irq(&pdev->dev, irq, spear_smi_int_handler, 0,
 			       pdev->name, dev);
 	if (ret) {
 		dev_err(&dev->pdev->dev, "SMI IRQ allocation failed\n");
-		goto err_irq;
+		goto err;
 	}
 
 	mutex_init(&dev->lock);
@@ -1020,14 +1016,11 @@ static int spear_smi_probe(struct platform_device *pdev)
 		ret = spear_smi_setup_banks(pdev, i, pdata->np[i]);
 		if (ret) {
 			dev_err(&dev->pdev->dev, "bank setup failed\n");
-			goto err_irq;
+			goto err;
 		}
 	}
 
 	return 0;
-
-err_irq:
-	clk_disable_unprepare(dev->clk);
 err:
 	return ret;
 }
@@ -1056,8 +1049,6 @@ static int spear_smi_remove(struct platform_device *pdev)
 		WARN_ON(mtd_device_unregister(&flash->mtd));
 	}
 
-	clk_disable_unprepare(dev->clk);
-
 	return 0;
 }
 
-- 
2.34.1


