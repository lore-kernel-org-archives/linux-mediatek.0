Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2969BC71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDVdgaMg0aCJGQuv7Dp4lfXImWw9gvTIm5kZzkgJ6jI=; b=rlGb7DXeRf89imosv/J6Wu+O0J
	Pf63IbEBv9u9GJ2FvytAcaNge+MmHEz0hYIWHdHw7IWEAXZzyyg5MnyML7n9frDffp2YrCisa7aM8
	2ImbKJiMGSKtlLgo35hL6uADS8ycxa+vvk/DVTSi17s0EXdPZgX6t4GNdbNv4ThD2sEDA6TZTBNGz
	QYH2QY2rj65vaQkSPgKT3okTnrgxz8mHhOc/YA4NbVga/tIfXEzqwTo8WUp/pQppuupVE0S++/THA
	0n89qZJm81Xnb3/60FqkhAQFhLlXsvROjrX0B5HfpnoVmWoD8nUYfXF/K6g472R3ZbkaYBTZlZ8Gb
	/A7ff3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUWT-004x5E-0N;
	Fri, 25 Aug 2023 10:58:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUW6-004wmF-1U;
	Fri, 25 Aug 2023 10:58:17 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RXGzh0wdCztSJ2;
	Fri, 25 Aug 2023 18:54:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 18:58:09 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<Michael.Hennerich@analog.com>, <heiko@sntech.de>,
	<yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 3/4] iio: adc: spear_adc: Use devm_clk_get_enabled() helper function
Date: Fri, 25 Aug 2023 18:57:45 +0800
Message-ID: <20230825105746.2999548-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825105746.2999548-1-ruanjinjie@huawei.com>
References: <20230825105746.2999548-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_035814_721356_631EBFA7 
X-CRM114-Status: GOOD (  11.59  )
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

The devm_clk_get_enabled() helper:
    - calls devm_clk_get()
    - calls clk_prepare_enable() and registers what is needed in order to
      call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/iio/adc/spear_adc.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/spear_adc.c b/drivers/iio/adc/spear_adc.c
index ad54ef798109..cd7708aa95af 100644
--- a/drivers/iio/adc/spear_adc.c
+++ b/drivers/iio/adc/spear_adc.c
@@ -297,36 +297,27 @@ static int spear_adc_probe(struct platform_device *pdev)
 	st->adc_base_spear3xx =
 		(struct adc_regs_spear3xx __iomem *)st->adc_base_spear6xx;
 
-	st->clk = devm_clk_get(dev, NULL);
+	st->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(st->clk)) {
-		dev_err(dev, "failed getting clock\n");
-		return PTR_ERR(st->clk);
-	}
-
-	ret = clk_prepare_enable(st->clk);
-	if (ret) {
 		dev_err(dev, "failed enabling clock\n");
-		return ret;
+		return PTR_ERR(st->clk);
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto errout2;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_irq(dev, irq, spear_adc_isr, 0, SPEAR_ADC_MOD_NAME,
 			       st);
 	if (ret < 0) {
 		dev_err(dev, "failed requesting interrupt\n");
-		goto errout2;
+		return ret;
 	}
 
 	if (of_property_read_u32(np, "sampling-frequency",
 				 &st->sampling_freq)) {
 		dev_err(dev, "sampling-frequency missing in DT\n");
-		ret = -EINVAL;
-		goto errout2;
+		return -EINVAL;
 	}
 
 	/*
@@ -355,24 +346,17 @@ static int spear_adc_probe(struct platform_device *pdev)
 
 	ret = iio_device_register(indio_dev);
 	if (ret)
-		goto errout2;
+		return ret;
 
 	dev_info(dev, "SPEAR ADC driver loaded, IRQ %d\n", irq);
 
 	return 0;
-
-errout2:
-	clk_disable_unprepare(st->clk);
-	return ret;
 }
 
 static int spear_adc_remove(struct platform_device *pdev)
 {
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct spear_adc_state *st = iio_priv(indio_dev);
-
 	iio_device_unregister(indio_dev);
-	clk_disable_unprepare(st->clk);
 
 	return 0;
 }
-- 
2.34.1


