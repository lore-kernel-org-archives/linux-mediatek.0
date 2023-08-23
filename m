Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16D1EE49B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyahZyJqiCtBdq9Itz72WLozXKm24l33u1SLPwXse0c=; b=fFxjk0cFxjx9EfeGc1ruUlTlAj
	q3dkuV82P+mArsYU19gFDS4912i1sSYZ5ZnWyFZAw34MZN1ZlixuNE0XQAYE9/b+v3NvkGZ6fR94p
	tmm++72g8/3JuwgPkHxSsdKc3a7lEWSlvNbZR/Ff4FmFqcaKyF6JDl2Qroi/Gi09p3UPHA7TFTaOJ
	GfMLyMa3UlQhnhSVEAqzJqWMOWJuvNmLaS1ytGu1YyFoZyDNTTeOkxG1WWxnJ31guV9PwzS/QCeNa
	IJw8iFIdFYBXI0mYaTzKlk8in8oM2HgzRYMAHGh+jE2AQhsipS6Sey6xiQ9o6duYV07gaZtoMaGvR
	uFtIgi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo6t-000ijL-32;
	Wed, 23 Aug 2023 13:41:23 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5h-000hQJ-1S;
	Wed, 23 Aug 2023 13:40:13 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RW6k51HDRz16NsJ;
	Wed, 23 Aug 2023 21:38:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:05 +0800
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
Subject: [PATCH -next v2 14/25] spi: lantiq-ssc: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:27 +0800
Message-ID: <20230823133938.1359106-15-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230823_064010_037689_29D2565D 
X-CRM114-Status: GOOD (  10.53  )
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


