Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC3EEE49B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4UXw68M9ROgm/k/6jSr+EUMT8Gl90r+eO712IarJTQ=; b=ln5CyAzkt7WtjlK4PKoJQYf6tt
	E3mMdaFFsf5CPuMHEI9IJp5Nj0TUUI+mo04T/hhH2ZK2afiMGFVXo2/+68qluaucqhKC0MXqSWqOd
	Zy1e/N0WIqIGiG6f75WkHAAawtHW8/2tM/36Wkh3Cr7Y0DB3XHCWom9iOwFqceVnWOewcoPPNz6ge
	9FXWHRcVa853veoois3ZN6iv3Tc3xWc9+5QK7q7ajQkY8z3z2afM+0lwa8quEGl9NWMn4BvW//jcK
	8Uy2KqJZE4MqZZbIqMSyyuuwsb1+QvCjolx9Ooa+RPw+xczF+KPdIOxLhgn3Yl4qu8MVnpQT4BoY9
	tj7+eJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo77-000ixz-0e;
	Wed, 23 Aug 2023 13:41:37 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5g-000hQC-2z;
	Wed, 23 Aug 2023 13:40:13 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RW6j72BqtzTmKC;
	Wed, 23 Aug 2023 21:37:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:02 +0800
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
Subject: [PATCH -next v2 11/25] spi: dw-bt1: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:24 +0800
Message-ID: <20230823133938.1359106-12-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230823_064010_119792_925C3EA9 
X-CRM114-Status: GOOD (  10.37  )
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
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: None

 drivers/spi/spi-dw-bt1.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-dw-bt1.c b/drivers/spi/spi-dw-bt1.c
index 5e1c01822967..5391bcac305c 100644
--- a/drivers/spi/spi-dw-bt1.c
+++ b/drivers/spi/spi-dw-bt1.c
@@ -269,43 +269,32 @@ static int dw_spi_bt1_probe(struct platform_device *pdev)
 
 	dws->paddr = mem->start;
 
-	dwsbt1->clk = devm_clk_get(&pdev->dev, NULL);
+	dwsbt1->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(dwsbt1->clk))
 		return PTR_ERR(dwsbt1->clk);
 
-	ret = clk_prepare_enable(dwsbt1->clk);
-	if (ret)
-		return ret;
-
 	dws->bus_num = pdev->id;
 	dws->reg_io_width = 4;
 	dws->max_freq = clk_get_rate(dwsbt1->clk);
-	if (!dws->max_freq) {
-		ret = -EINVAL;
-		goto err_disable_clk;
-	}
+	if (!dws->max_freq)
+		return -EINVAL;
 
 	init_func = device_get_match_data(&pdev->dev);
 	ret = init_func(pdev, dwsbt1);
 	if (ret)
-		goto err_disable_clk;
+		return ret;
 
 	pm_runtime_enable(&pdev->dev);
 
 	ret = dw_spi_add_host(&pdev->dev, dws);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
-		goto err_disable_clk;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, dwsbt1);
 
 	return 0;
-
-err_disable_clk:
-	clk_disable_unprepare(dwsbt1->clk);
-
-	return ret;
 }
 
 static void dw_spi_bt1_remove(struct platform_device *pdev)
@@ -315,8 +304,6 @@ static void dw_spi_bt1_remove(struct platform_device *pdev)
 	dw_spi_remove_host(&dwsbt1->dws);
 
 	pm_runtime_disable(&pdev->dev);
-
-	clk_disable_unprepare(dwsbt1->clk);
 }
 
 static const struct of_device_id dw_spi_bt1_of_match[] = {
-- 
2.34.1


