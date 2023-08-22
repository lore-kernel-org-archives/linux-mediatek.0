Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0948EE49A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIK8szymSR0oYYNRT2N0087abHsrVUQYu3lt9QjTavU=; b=NeJcQ9eFfXKSW19PxS2mUqgkcL
	xigVTgW6+XgxEOXbFcQZKKo3XCGas7OKF5beoSIOznOxSLbN8bPaW2oItuIX5GdXD9LE3HURt7LBE
	14QWSrBOpKsjERZhfpQdPVZ+nGstVtgH6G59Zb+oeiwmBBrXry5VpfRNHS/rkBjmWxv5dnesz57Rh
	UW8s63f6iEs9LgYU3dfvaOa0BGrv9K9+7Bl8cM3ZCf600R0SbmowDviQq3oSyIgLseqouA6m7yPVv
	Ae4h7h/+Jig4CEdYuuO9sivEFJsbxy70H69/TiYhByKvFg7ZuHLbOUL63HYnhu43YJqsOvknY9on4
	OyVqPm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRDq-00Fzg5-1c;
	Tue, 22 Aug 2023 13:15:02 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC2-00Fxc0-2M;
	Tue, 22 Aug 2023 13:13:12 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RVV9Q1xf4z1L9Lx;
	Tue, 22 Aug 2023 21:11:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:05 +0800
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
Subject: [PATCH -next 16/25] spi: spi-meson-spifc: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:28 +0800
Message-ID: <20230822131237.1022815-17-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_061311_260020_BD4BF812 
X-CRM114-Status: GOOD (  10.17  )
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
Moreover, the lable "out_clk" no longer makes sense, rename it to "out_pm".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-meson-spifc.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index 06626f406f68..d70a18885b49 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -312,19 +312,13 @@ static int meson_spifc_probe(struct platform_device *pdev)
 		goto out_err;
 	}
 
-	spifc->clk = devm_clk_get(spifc->dev, NULL);
+	spifc->clk = devm_clk_get_enabled(spifc->dev, NULL);
 	if (IS_ERR(spifc->clk)) {
 		dev_err(spifc->dev, "missing clock\n");
 		ret = PTR_ERR(spifc->clk);
 		goto out_err;
 	}
 
-	ret = clk_prepare_enable(spifc->clk);
-	if (ret) {
-		dev_err(spifc->dev, "can't prepare clock\n");
-		goto out_err;
-	}
-
 	rate = clk_get_rate(spifc->clk);
 
 	master->num_chipselect = 1;
@@ -343,12 +337,11 @@ static int meson_spifc_probe(struct platform_device *pdev)
 	ret = devm_spi_register_master(spifc->dev, master);
 	if (ret) {
 		dev_err(spifc->dev, "failed to register spi master\n");
-		goto out_clk;
+		goto out_pm;
 	}
 
 	return 0;
-out_clk:
-	clk_disable_unprepare(spifc->clk);
+out_pm:
 	pm_runtime_disable(spifc->dev);
 out_err:
 	spi_master_put(master);
@@ -357,11 +350,7 @@ static int meson_spifc_probe(struct platform_device *pdev)
 
 static void meson_spifc_remove(struct platform_device *pdev)
 {
-	struct spi_master *master = platform_get_drvdata(pdev);
-	struct meson_spifc *spifc = spi_master_get_devdata(master);
-
 	pm_runtime_get_sync(&pdev->dev);
-	clk_disable_unprepare(spifc->clk);
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.34.1


