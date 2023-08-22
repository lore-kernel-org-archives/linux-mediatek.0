Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4DAEE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATNWyflvOE9K73K3XYFGD2NMKqsZt+QmgiCjem3Lg7Y=; b=DqAhbp0Sxxa3XYVc5g5nGOVnA1
	B9Y01o0wIBXHjtz0PnRxRaOTtuAiSdiUL1LhRmruWHJS6+E05hoG3PJsIanncarTAhsFCsO8lO0by
	kKc1crB7HT9TPUZ9MMkYkxcRPIe608+9h/r1D3qVpwXx6LXJkAdny5WQXX7r1ONs7ZrhX8EwPgkxc
	Yc/XocnwXU6A1+wbGliLCLHpz3SVMCMYRRJIezKAJwLHZO7EcYGBR/GnsVea84bzBD7yCZ4R0KJXo
	ok12gOFCNLsHCzqF+mH1ln1G8Tp+/0NZQc3K05Duk48ecZdNptcokq05eFpvGMgqRYZyYz+THFVwe
	d/9E6Hjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYREx-00G0zS-31;
	Tue, 22 Aug 2023 13:16:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRCD-00Fxom-12;
	Tue, 22 Aug 2023 13:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ATNWyflvOE9K73K3XYFGD2NMKqsZt+QmgiCjem3Lg7Y=; b=GmnwRFeYhAX0zYugajP+VG3qbe
	BMc5kBpoABNSpF9/o37y0PnIMRgOwwhfC3MB7Cu+KfiFByuoCZFF/9DINfUMMd5N92kGA66gMLU7e
	W8klSrNjlTjr8L7msTBS1eJg7z/FMZxMduvfqaqAgA49bTYJqyfHuQDlx+Kfx6s16uNaZYVo/QLW8
	QfnSZHDF05fx+NZIsyQqz4nzopcqjbtBBOpliJQY1KDRCZyviJQACPhFEPr3lh874PmwMAJT3Jl2e
	wyQyYyaGoLTyHIE1fEudMVtfJPo0unq3xSyohTR7Nv/sS8v1V3LehINcV+7pAgQjnt5iAZNugB9ks
	ZWOXxh/w==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC8-002lCW-1F;
	Tue, 22 Aug 2023 13:13:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RVV9J6DNpz1L9Qn;
	Tue, 22 Aug 2023 21:11:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:12:59 +0800
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
Subject: [PATCH -next 11/25] spi: dw-bt1: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:23 +0800
Message-ID: <20230822131237.1022815-12-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230822_141317_328521_509BFF7B 
X-CRM114-Status: UNSURE (   9.99  )
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


